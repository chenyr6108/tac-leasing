<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>逾期催收</title>
		<script type="text/javascript" src="${ctx }/dun/js/dunTaskManage.js"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		
		<link href="${ctx}/common/css/jquery.multiSelect.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx }/common/js/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="${ctx }/resources/jquery/jquery-ui-1.8.1.min.js"></script>
		<script src="${ctx}/common/js/jquery.bgiframe.min.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/jquery.multiSelect.js" type="text/javascript"></script>
	<script type="text/javascript">
		 $(function(){
			$("#datebegin").datepicker();
			$("#ORG_COMPANY").multiSelect({ selectAllText: '选择全部' });
			$("#COMPANY").multiSelect({ selectAllText: '选择全部' });
			var company = '${COMPANY}';
			if(company.length > 0){
				company = company.trim().substring(1,company.length-1);
			}
			var cs = company.split(",");
			for(var i = 0; i < cs.length; i++){
				$("input:checkbox[name='COMPANY[]'][value=" + cs[i] + "]").each(function(){
					this.click();
				});
			}
			var orgCompany = '${ORG_COMPANY}';
			if(orgCompany.length > 0){
				orgCompany = orgCompany.trim().substring(1,orgCompany.length-1);
			}
			var ocs = orgCompany.split(",");
			for(var i = 0; i < ocs.length; i++){
				$("input:checkbox[name='ORG_COMPANY[]'][value=" + ocs[i] + "]").each(function(){
					this.click();
				});
			}
		 });
			//导出逾期报表
		 function pdfFun(){
	  		$("#__action").val("expDunTaskDetails.expExcel");
	  		$("#form1").submit();
	  		$("#__action").val("dunTask.manageForNew");
	      }
	  
		function submitserach(){
		    var startrange =$("#startrange").val();
		    var endrange=$("#endrange").val();
		    if((!endrange=="")||(!endrange==null)){
				  if(!checkInteger(endrange)){
					alert("逾期天数查询请输入整数!");
					$("#endrange").focus();
					return false;
			     }
			  }
			  if((!startrange=="")||(!startrange==null)){
				  if(!checkInteger(startrange)){
					alert("逾期天数查询请输入整数!");
					$("#startrange").focus();
					return false;
			     }
			  }
			 /* 2012/02/06 Yang Yun 搜索前，把当前页设置成第一页. */
			 $("#__currentPage").val("1");
		     $("#form1").submit();
		}
		function checkInteger(checkStr)
		{
		    var regex = /^[\+\-]?[\d]+$/;
		
		    return regex.test(checkStr);
		}
		
		function showRiskInfo(credit_id){
			var url = "${ctx }";
			var path = null;
			var title = "风控会议纪要";
			$.getJSON("../servlet/defaultDispatcher",
					{"__action" : "dunTask.getPrcId",
					"credit_id" : credit_id},
					function (data){
						if(data != null && data.prc_id != null){
							path = "riskAuditSee.selectRiskAuditForSee_zulin&credit_id=" + credit_id + "&prc_id=" + data.prc_id;
							window.parent.openNewTab(url,path,title);
						}
					});
		}
		
			function everyDayOverDue(){ 
				var QSTART_DATE = "";
				QSTART_DATE= document.getElementById("datebegin").value;
				window.parent.callBirt("birtReport/exportEveryDayOverDue/everyDayOverDue.rptdesign","xls",{"START_DATE":QSTART_DATE});
			}
		
		//保存诉讼进度
		function litigationSave(){
			var lease_code=$("#lease_code").val();
			 if(lease_code==null || lease_code==''){
		            alert("合同号为空，请清理下缓存再试一试！");
		            return false;
		        }
			var lProcess=$("#lProcess").val();
			var litigationDate=$("#litigationDate").val();
			if(lProcess==null || lProcess==''){
	            alert("请选择诉讼进程。");
	            return false;
	        }
			if(litigationDate==null || litigationDate==''){
	            alert("请选择诉讼日期。");
	            return false;
	        }
			var memo=$("#memo").val();
			$.ajax({
				type:"POST",
				data: '__action=litigationCommand.addLitigation&litigationDate='+litigationDate+ "&lease_code=" +lease_code+ "&lProcess=" +lProcess+ "&memo=" +memo,
				url:"../servlet/defaultDispatcher",
				dataType:"json",
				success:function(databack){
					 alert("添加成功！");
					$("#litigationAdd").dialog('close');
				}
			});
		}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="dunTask.manageForNew" />  
			<input type="hidden" id="isSalesDesk" name="isSalesDesk" value="${isSalesDesk }" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;<c:if test="${isSalesDesk eq 'Y' }">延滞客户清单</c:if><c:if test="${isSalesDesk ne 'Y' }">逾期催收</c:if></span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_bigo"></td>
				        <td style="min-width:756px" class="ss_bigt" >
				          <table style="margin-left: 10px;">
				          <tr> 
				          <td>查询日期：</td>
				          <td><input type="text" name="dun_date" style="width:80px; height:18px;" readonly="readonly"
										id="datebegin" value="${dun_date }">

				          <td>逾期天数：</td>
				          <td><input type="text"  name="startrange" id="startrange" style="width:40px; height:18px;" value="${startrange }">~
				          <input type="text"  name="endrange" id="endrange" style="width:40px; height:18px;" value="${endrange}"></td>
				          <td>案件来源：</td> 	
				          <td>
				          	<select name="vip_flag">
				          		<option value="">全部</option>
				          		<option value="0" <c:if test="${vip_flag eq '0' }">selected="selected"</c:if>>一般</option>
				          		<option value="1" <c:if test="${vip_flag eq '1' }">selected="selected"</c:if>>绿色通道</option>
				          	</select>
				          </td>
				          <td>业务员：</td>
				          <td><input type="text"  name="NAME" id="NAME" style="width:80px; height:18px;" value="${NAME }"></td>
				          <td>
							公司别：
							<select name="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
							</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="content" value="${content }" style=" width:240px;height:18px; font-size: 12px;">
				          </td>
				          <td>办事处：</td> 	
				          <td>
				          <select id="COMPANY" name="COMPANY" multiple="multiple">
				          <c:forEach items="${companyList }" var="item" >
				          	<option value="${item.DECP_ID}">${item.DECP_NAME_CN }</option>
				          </c:forEach>
				          </select>
				          </td>
				          <td>原始办事处：</td> 	
				          <td><select id="ORG_COMPANY" name="ORG_COMPANY" multiple="multiple">
				          <c:forEach items="${companyList }" var="item" >
				          	<option value="${item.DECP_ID}">${item.DECP_NAME_CN }</option>
				          </c:forEach>
				          </select>
				          </td>
				          <td>评审人：<input type="text"  name="approvalUserName" id="approvalUserName" style="width:80px; height:18px;" value="${approvalUserName }"></td>
				          <td colspan="2"></td>
				          </tr>
				          <tr>
					          <td>原始业务员：</td>
					          <td><input type="text"  name="orgUserName" id="orgUserName" style="width:80px; height:18px;" value="${orgUserName }"></td>
					          <td>原始主管：</td>
					          <td><input type="text"  name="orgUpUserName" id="orgUpUserName" style="width:80px; height:18px;" value="${orgUpUserName }"></td>
					          <td>专案类型：</td>
					          <td>
								<select id="CREDIT_SPECIAL_CODE" name="CREDIT_SPECIAL_CODE" >
				         	 		<option value="">全部</option>
				         	 		<option value="-1" <c:if test="${CREDIT_SPECIAL_CODE == '-1'}">selected='selected'</c:if>>非专案</option>
				         			<c:forEach items="${creditSpecialList }" var="item" >
				          				<option value="${item.CREDIT_SPECIAL_CODE}" <c:if test="${item.CREDIT_SPECIAL_CODE == CREDIT_SPECIAL_CODE}">selected='selected'</c:if>>${item.CREDIT_SPECIAL_NAME }</option>
				          			</c:forEach>
				          		</select>
							  </td>
					          <td>金额：</td>
					          <td colspan="4">
					          	<input type="text"  name="moneyBegin" id="moneyBegin" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:80px; height:18px;" value="${moneyBegin }"> ~ 
					          	<input type="text"  name="moneyEnd" id="moneyEnd" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:80px; height:18px;" value="${moneyEnd }">
					          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="20%" class="ss_bigt"><a href="#" name="searchs" id="searchs" onclick="submitserach();"  class="blue_button">搜 索</a></td>
				      	<td width="55" class="ss_bigth" valign="top">&nbsp;</td>
				        </tr>
				    </table>
	          		</div>
	          		<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
				<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr>
					     <td  style="text-align:left;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv "><input type="button" name="pdfbutton" onclick="pdfFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出逾期报表"></td>
						 <c:if test="${everyDue}"><td  style="text-align:left;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv "><input type="button" name="pdfbutton" onclick="everyDayOverDue();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="每日催收报表"></td></c:if>
						 <td align="right" colspan="14" style="text-align:center;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
							<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
						 </td>
					</tr>
				</table>
					<table class="grid_table">
						<tr>
							<th>
								状态
							</th>
							<th>
								支付表号
							</th>
							<th>
								承租人
							</th>
							<th>
								办事处
							</th>
							<th>
								原始办事处
							</th>
							<th>
								业务员
							</th>
							<th>
								主管
							</th>
							<th>
								原始业务员
							</th>
							<th>
								原始主管
							</th>
							<th>
								核准人
							</th>
							<th>
								供应商名称
							</th>
							<th>
								供应商责任
							</th>
							<th>
								锁码方式
							</th>
							<th>
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="SHOULD_PAYDATE">应付日期</page:pagingSort>
							</th>
							<th>
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="DUN_TOTALPRICE">应付总金额</page:pagingSort>
							</th>
							<th>
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="DUN_DAY">逾期天数</page:pagingSort>
							</th>
							<th>
								<page:pagingSort pagingInfo="${pagingInfo }" orderBy="DUN_FINE">罚息</page:pagingSort>
							</th> 
							<!-- <th>
								还款明细  
							</th> --> 
						</tr>
						<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">
							<tr>
								<td style="text-align: center;cursor: pointer;" onclick="$dunTask.showDunList('${item.CUST_CODE }','${item.CUST_ID}','${dun_date}','${item.LEASE_CODE}')">
									<c:choose>
										<c:when test="${(item.FIRSTDUNPERIOD==item.PERIOD_NUM || empty item.FIRSTDUNPERIOD)   && item.PERIOD_NUM < 7 && item.DUN_DAY >7 && item.DUN_DAY < 11}">
											<img src="${ctx }/images/dun.gif">
										</c:when>
										<c:otherwise>
												<c:choose>
													<c:when test="${item.RECP_STATE eq 0 }"><img src="${ctx }/images/u614.gif"></c:when>
													<c:otherwise><img src="${ctx }/images/u617.gif"></c:otherwise>
												</c:choose>
										</c:otherwise>
								   </c:choose>	
								</td>
								<td style="text-align: center;">
									<a href="javascript:void(0)" onclick="window.parent.openNewTab('${ctx}','collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }','支付表');">
										${item.RECP_CODE }
									</a>&nbsp;
								</td>
								<td style="text-align: center;">
									<a href="javascript:void(0)" onclick="showRiskInfo('${item.CREDIT_ID}');">${item.CUST_NAME }</a>&nbsp;
								</td>
								<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
								<td style="text-align: center;">${item.ORG_DECP_NAME_CN }&nbsp;</td>
								<td style="text-align: center;">${item.NAME }&nbsp;</td>
								<td style="text-align: center;">${item.UPNAME }&nbsp;</td>
								<td style="text-align: center;">${item.ORGNAME }&nbsp;</td>
								<td style="text-align: center;">${item.ORGUPUSERNAME }&nbsp;</td>
								<td style="text-align: center;">${item.HNAME }&nbsp;</td>
								<td style="text-align: center;">
									<a href="javascript:void(0)" onclick="window.parent.openNewTab('${ctx}','supplerContributeCommand.query&SUPL_NAME=${item.BRAND }','供应商贡献度');">${item.BRAND }</a>&nbsp;
								</td>
								<td style="text-align: center;">${item.SUPL_TRUE }&nbsp;</td>
								<td style="text-align: center;">${item.LOCK_CODE }&nbsp;</td>
								<td style="text-align: center;">${item.SHOULD_PAYDATE }&nbsp;</td>
								<td style="text-align: right;">
									<fmt:formatNumber type="currency" value="${item.DUN_TOTALPRICE }" />
								</td>
								<!--  Modify By Michael 2011 12/29 变更罚息明细抓取逻辑-->								
								<td style="text-align: center;">
									<a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.showNewDunDetailByDecpId&RECP_CODE=${item.RECP_CODE }&RECP_ID=${item.RECP_ID }&CUST_NAME=${item.CUST_NAME }'">${item.DUN_DAY }</a>
									&nbsp;
								</td>
								<td style="text-align: right;">
									<fmt:formatNumber type="currency" value="${item.DUN_FINE }" />
									&nbsp;
								</td>
								<%-- <td style="text-align: center">
									<a href="../servlet/defaultDispatcher?__action=statement.queryCustomerBillForSalesForNew&CUST_ID=${item.CUST_ID}&recp_id=${item.RECP_ID }&cust_name=${item.CUST_NAME }">还款明细</a>
									&nbsp;
								</td> --%>
							</tr>
							<tr>
								<th class="pact" colspan="15">
									<div id="showDunListTable${item.CUST_CODE }" align="center" style="display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</th>
							</tr>
						</c:forEach>
						<tr>
							<th style="text-align: right; background-color: white;" colspan="17">
								<img src="${ctx }/images/dun.gif">前6期首次逾期&nbsp;&nbsp;&nbsp; 
								<img src="${ctx }/images/u614.gif">逾期&nbsp;&nbsp;&nbsp;&nbsp;
							</th>
						</tr>
					</table>
					<page:pagingToolbar pagingInfo="${pagingInfo }"/>
					<font color="red">
						*<fmt:formatDate value="${(pagingInfo.resultList)[0].CREATE_DATE }" pattern="yyyy-MM-dd HH:mm"/>之数据
					</font><br/>
					<font color="red">
						*评审人:包含项目评审中的各级评审人员。
					</font>
				</div>
			</div> 
		</form>
		
		 
		<div id="derateFineDialog" style="display: none;" title="罚息减免">
		<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
			<div class="zc_grid_body ">
		<form action="../servlet/defaultDispatcher" name="derateForm" id="derateForm"
			method="post">
			<input type="hidden" id="__action" name="__action"
				value="dunTask.saveDerate" />  
			<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">减免日期</td>
					<td style="width: 35%;height: 26px;" colspan="3"><input name="reduce_date" id="reduce_date"  style="border: #03515d solid 1px;" readonly="readonly" onchange="$dunTask.derateFine2();"/>&nbsp;</td>
				</tr>		
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">租赁合同号</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineLeaseCode"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">支付表号<input type="hidden" id="reduce_paylistId" name="reduce_paylistId" value="" /></td>
					<td style="width: 35%;height: 26px;"><span id="derateFinePaylistCode"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">应付款日期</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineShouldPayDate"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">应付款金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineShouldPayPirce"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">逾期天数</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunDay"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">逾期金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunPrice"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">罚息金额</td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunFine"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">免除罚息</td>
					<td style="width: 35%;height: 26px;"><input type="text" name="dunFine_rate" size="4" value="比例" onfocus="javascript:this.value=''" onblur="$dunTask.updateDunFine_rate(this.value);"/>%<input type="text" name="dunFine" size="8" value="金额" onfocus="javascript:this.value=''" onblur="$dunTask.updateDunFine(this.value);"/></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
					<td style="width: 15%;height: 26px;">罚息金额 </td>
					<td style="width: 35%;height: 26px;"><span id="derateFineDunFineRate"></span>&nbsp;</td>
					<td style="width: 15%;height: 26px;">免除罚息</td>
					<td style="width: 35%;height: 26px;"><input type="text" name="dunFineRate_rate" size="4" value="0" onfocus="javascript:this.value=''" onblur="$dunTask.updateDunFineRate_rate(this.value);"/>%<input type="text" name="dunFineRate"  size="8" value="0" onfocus="javascript:this.value=''" onblur="$dunTask.updateDunFineRate(this.value);"/></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">申请人</td>
					<td style="width: 35%;height: 26px;">${s_employeeName }</td>
					<td style="width: 15%;height: 26px;">申请时间</td>
					<td style="width: 35%;height: 26px;"><SPAN id="apply_date"><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></SPAN></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">备注</td>
					<td style="width: 85%;height: 26px;" colspan="3"><textarea name="reduce_mome" style="width: 480px;height: 50px;font-size: 12px;"></textarea></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">审批人</td>
					<td style="width: 35%;height: 26px;">&nbsp;</td>
					<td style="width: 15%;height: 26px;">审批时间</td>
					<td style="width: 35%;height: 26px;">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">审批结果</td>
					<td style="width: 85%;height: 26px;" colspan="3">&nbsp;</td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 15%;height: 26px;">备注</td>
					<td style="width: 85%;height: 26px;" colspan="3">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr"> 
					<td style="height: 26px;text-align: center" colspan="4"><input type="button" class="ui-state-default ui-corner-all" value="提 交" onclick="$dunTask.saveDerate();"/>  <input type="reset" class="ui-state-default ui-corner-all" value="重 置"/></td>
				</tr>
			</table>	
			</form>	
			</div>		
		</div>
		</div>
		
		<!-- Add by Michael 2011 12/27 增加弹出罚息明细 -->
		<!------------弹出层:弹出租金罚息明细------------>
		<div style="display: none;" id="dunDetailDiv" title="您当前的位置:租金罚息明细">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="maindun">
	           <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
			<table id="dunDetailTableID" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>支付表号</td>
					<td>期数</td>
					<td>支付日</td>
					<td>来款日</td>
					<td>应付金额</td>
					<td>实付金额</td>
					<td>逾期金额</td>
					<td>逾期天数</td>
					<td>罚息</td>
				</tr>
			</table>
			</div>
		</div>
		</div>
	</div>
	
	<div style="display: none;" id="litigationAdd" title="您当前的位置:诉讼案件管控">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="litigationMain">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="litigationFormAdd" id="litigationFormAdd" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="litigationCommand.addLitigation"/>
				<input type="hidden" id="lease_code" name="lease_code"/>
				
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showlitigationId">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">承租人名称:</td>
						<td style="text-align: left;"colspan="3" id="custName">&nbsp;</td>
					</tr>
					
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="">
						<td style="text-align: left;" width="20%">法人:</td>
						<td style="text-align: left;" id="heard">&nbsp;</td>
						<td style="text-align: left;">法人联系方式:</td>
						<td style="text-align: left;"id="phone">&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">合同号:</td>
						<td style="text-align: left;"colspan="3" id="lcnum">&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">诉讼进度:<font color="red">*</font></td>
						<td style="text-align: left;" colspan="3">
						<select name="lProcess" id="lProcess"><option value="">-请选择-</option>
							<c:forEach items="${litigationList}" var="item" varStatus="status">
								<option value="${item.CODE }">${item.FLAG }</option>
							</c:forEach>
						</select></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">诉讼日期:<font color="red">*</font></td>
						<td style="text-align: left;"colspan="3"><input type="text" name="litigationDate" id="litigationDate" style=" width: 80px; height: 18px;" readonly="readonly" value="${litigationDate }"></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">备注说明:</td>
						<td style="text-align: left;" colspan="3"><textarea id="memo" rows="15" cols="5" name="memo" style="width:100%;"></textarea></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="4"><input type="button" id="subUpload" value="确&nbsp;定" onclick="litigationSave();" class="ui-state-default ui-corner-all" ></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>	
<div style="display: none;" id="lawFeeAdd" title="您当前的位置:添加法务费用信息">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="lawFeeAdd" id="lawFeeAdd" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action"/>
				<input type="hidden" id="recp_id" name="recp_id"/>
				<input type="hidden" id="cust_code" name="cust_code"/>
				
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showlawFeeAddTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">费用类别:<font color="red">*</font></td>
						<td style="text-align: left;"><select name="fee_name" id="fee_name">
						<option value="">-请选择-</option>
						<c:forEach items="${lawyFeeList}" var="item" varStatus="status">
							<option value="${item.CODE }">${item.FLAG }</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">费用金额:<font color="red">*</font></td>
						<td style="text-align: left;"><input name="fee_value" size="20"/></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">备注说明:</td>
						<td style="text-align: left;"><textarea rows="15" cols="5" name="memo" style="width:100%;"></textarea></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="2"><input type="button" id="subUpload" value="确&nbsp;定" onclick="createLawyFeeList();" class="ui-state-default ui-corner-all" ></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>	
	</body>
</html>