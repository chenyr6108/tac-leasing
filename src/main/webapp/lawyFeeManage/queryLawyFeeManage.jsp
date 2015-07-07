<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
		<title>法务费用管理</title>
	<head>
	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQSTART_DATE").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQEND_DATE").datepicker($.datepicker.regional["zh-CN"]);
			});
			
			//弹出备注的层
			function openChangePassDiv(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 670
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$("#"+msg).dialog('close');
			}
			
			function showLawFeeAdd(recp_id,cust_code){
				document.lawFeeAdd.fee_name.value="";
				document.lawFeeAdd.fee_value.value="";
				document.lawFeeAdd.memo.value="";
				document.lawFeeAdd.recp_id.value="";
				document.lawFeeAdd.recp_id.value=recp_id;
				document.lawFeeAdd.cust_code.value="";
				document.lawFeeAdd.cust_code.value=cust_code;

				$("#lawFeeAdd").dialog({
					modal:true,
					autoOpen: false,
					width: 450
				});
				$("#lawFeeAdd").dialog('open');
			}	
			
			function showLawyFeeList(id){
        		$("#lawyFeeList" + id).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=collectionManage.queryLawyFeeList&RECP_ID="+id);
       			 });
			}
			
			function checkpositive(checkStr)
			{
			    var regex = /^[\+\-]?\d+(\.\d+)?$/;
			    return regex.test(checkStr);
			}
			
			function createLawyFeeList(){
				var fee_name= document.lawFeeAdd.fee_name.value;
				var fee_value= document.lawFeeAdd.fee_value.value;
				var memo= document.lawFeeAdd.memo.value;
				var recp_id=document.lawFeeAdd.recp_id.value;
				var cust_code=document.lawFeeAdd.cust_code.value;
				var fee_name_text=$.trim($("#fee_name").find("option:selected").text());
				if (fee_name==""){
					alert("请选择费用类别");
					return false;
				}
				if (fee_value==""){
					alert("请填入法务费用金额");
					return false;
				}
				
				if(checkpositive(fee_value)==false){
					alert("法务费用必须要输入整数！");
					document.lawFeeAdd.fee_value.focus();
					return false;
				}
				$.ajax({
					type:"POST",
					data: '__action=collectionManage.createLawFeeList&FEE_NAME_TEXT='+fee_name_text+'&CUST_CODE='+cust_code+'&MEMO='+memo+'&FEE_VALUE='+fee_value+'&FEE_NAME='+fee_name+'&RECP_ID='+recp_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						alert(databack.writeBackDetails.strReturn);
						location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryPaylistForAddLawyFee';
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
				$("#lawFeeAdd").dialog('close');
			}
			function exportLawyFeeList(e){
				$(e).attr("disabled", "disabled");
				var QSTART_DATE = "";
				QSTART_DATE= document.getElementById("datebegin").value;
				var QEND_DATE = "";
				QEND_DATE= document.getElementById("dateend").value;
				var QUERY_FEE_NAME="";
				QUERY_FEE_NAME= document.getElementById("query_fee_name").value;
				var QSEARCH_VALUE="";
				QSEARCH_VALUE= document.getElementById("qsearch_value").value;
				var COMPANY_CODE="";
				COMPANY_CODE= document.getElementById("companyCode").value;
					
				window.parent.callBirt("birtReport/lawyFeeList/lawyFeeList.rptdesign", "xls", {"start_date" : QSTART_DATE,"end_date" : QEND_DATE,"query_fee_name" : QUERY_FEE_NAME,"qsearch_value" : encodeURI(QSEARCH_VALUE),"company_code":COMPANY_CODE});

				$(e).attr("disabled", false);
			}
			
    	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="collectionManage.queryPaylistForAddLawyFee" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;法务费用管理</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					费用类别：
					</td>
					<td>
					<select name="QUERY_FEE_NAME" id="query_fee_name">
						<option value="">-请选择-</option>
						<c:forEach items="${lawyFeeList}" var="item" varStatus="status">
							<option value="${item.CODE }" <c:if test="${QUERY_FEE_NAME eq item.CODE}">selected</c:if>>${item.FLAG }</option>
						</c:forEach>
					</select>
					</td>
					<td>
					公司别：
					<select name="companyCode" id="companyCode">
						<option value="">全部</option>
						<c:forEach items="${companys}" var="item">
							<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
						</c:forEach>
					</select>			          
					</td>	
			          </tr>
			          <tr>
				          <td>查询内容：</td>
				          <td colspan="7"><input type="text" id="qsearch_value" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
			          </tr>
			          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
					</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
				<tr>
					<td align="center"><a href="#" name="search" id="search" onclick="exportLawyFeeList(this)"  class="blue_button">费用管控表</a></td>
					<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
				</tr>
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">						
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									状态
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="RECP_CODE" pagingInfo="${dw}">合同号</page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户经理
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									办事处主管
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
							</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;"><a href="#" onclick="showLawyFeeList('${item.RECP_ID }')"><c:if test="${item.RECP_STATUS eq 0}"><img src="${ctx }/images/u608.gif" title="正常"></c:if><c:if test="${item.RECP_STATUS eq 1}"><img src="${ctx }/images/u622.gif" title="正常结清"></c:if><!--<c:if test="${item.RECP_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="转法务"></c:if>--><c:if test="${item.RECP_STATUS eq 3}"><img src="${ctx }/images/u611.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS eq 4}"><img src="${ctx }/images/u614.gif" title="回购"></c:if><c:if test="${item.RECP_STATUS eq 5}"><img src="${ctx }/images/u620.gif" title="结清确认待分解"></c:if></a></td>
								<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">${item.LEASE_CODE}</a></td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.SENSORNAME }</td>
								<td style="text-align: center;">${item.CLERKNAME }</td>
								<td style="text-align: center"><a href="javascript:void(0);" onclick="showLawFeeAdd('${item.RECP_ID}','${item.CUST_CODE}');">添加法务费用</a>&nbsp;</td>
								</tr>
								<tr>
									<td style="text-align: center;" colspan="9" align="center">
										<div id="lawyFeeList${item.RECP_ID}" align="center"
											style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>
								</tr>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td align="right" colspan="10"><page:pagingToolbar pagingInfo="${dw }"/></td>
						</tr>
						<tr>
							<td align="right" colspan="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3 ? 12 : 11}" style="height:24px; text-align:right;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;<!--<img src="${ctx }/images/u617.gif">&nbsp;转法务&nbsp;&nbsp;--><img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;<img src="${ctx }/images/u614.gif">&nbsp;回购&nbsp;&nbsp;<img src="${ctx }/images/u620.gif">&nbsp;结清确认待分解&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>
				</div>
			</div>
		</div>		
		</form>
		
<!------------弹出层:添加法务费用信息------------>
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