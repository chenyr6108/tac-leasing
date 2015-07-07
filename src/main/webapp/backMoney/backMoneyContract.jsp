<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>设备拨款信息管理</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		<%--2011/12/22 Yang Yun Add check has default link man. Start--%>
	  	<%--function showEditPayMoneyReviewRecord(code,id)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOne&lease_code='+code+'&CREDIT_ID='+id;
	 	} --%>
	 	function showEditPayMoneyReviewRecord(code,id,has_linkman)
	 	{
	 		//检查该案件是否是专案,如果是专案,检查专案有效期,在有效期范围外,灰掉提交按钮 add by ShenQi
	 		$.ajax({
	 			type: 'post',
	 			url: "${ctx }/servlet/defaultDispatcher",
	 			dataType: 'json',
	 			data: '__action=creditReport.checkDatePeriod&credit_id='+id,
	 			success: function(data) {
	 				if(data.flag) {
	 					alert(data.msg);
	 				} else {
	 					if(has_linkman == 1){
	 			 			location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOne&lease_code='+code+'&CREDIT_ID='+id;
	 			 		} else {
	 			 			alert("请先维护客户联系人！");
	 			 		}
	 				}
	 			}
	 		});
	 	}
	 	<%--2011/12/22 Yang Yun Add check has default link man. End--%>
	 	
	 	function showUpdateEstimatesPayDate(credit_id, type){
			var url = "${ctx }/servlet/defaultDispatcher";
			var param = {__action : "creditReport.getEstimatesPayDate", "credit_id" : credit_id};
			$.getJSON(url, param, function (data){
				$("#showUpdateEstimatesPayDateWin").dialog({modal:true, autoOpen:false, width:600});
				if(data != null){
					$("#estimates_credit_id").val(credit_id);
					$("#estimates_num").text(data.ESTIMATES_PAY_DATE_NUM);
					$("#estimates_num_last").text(5 - data.ESTIMATES_PAY_DATE_NUM);
					$("#estimates_pay_date").val(data.ESTIMATES_PAY_DATE);
					$("#estimates_pay_date_reason").val(data.ESTIMATES_PAY_DATE_REASON);
					$("#estimates_pay_date_log").html("");
					var logList = data.log;
					if(logList.length > 0){
						for(var i = 0 ; i < logList.length; i ++){
							var td1 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE_NUM);
							var td2 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE);
							var td3 = $("<td>").css("whiteSpace", "pre-wrap").text(logList[i].ESTIMATES_PAY_DATE_REASON);
							var td4 = $("<td>").text(logList[i].CREATE_TIME);
							var td5 = $("<td>").text(logList[i].CREATE_BY);
							$("<tr>").append(td1)
								.append(td2)
								.append(td3)
								.append(td4)
								.append(td5)
								.appendTo($("#estimates_pay_date_log"));
						}
					} else {
						var td = $("<td>");
						td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
						$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
					}
				} else {
					$("#estimates_credit_id").val("");
					$("#estimates_num").text(0);
					$("#estimates_num_last").text(5);
					$("#estimates_pay_date").val("");
					$("#estimates_pay_date_reason").val("");
					$("#estimates_pay_date_log").html("");
					var td = $("<td>");
					td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
					$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
				}
				if(type == "show"){
					$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", true);
					$("#showUpdateEstimatesPayDateWin").find("input[type='button']").hide();
				} else {
					$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", false);
					$("#showUpdateEstimatesPayDateWin").find("input[type='button']").show();
				}
				$("#showUpdateEstimatesPayDateWin").dialog("open");
			});
		}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.queryRentContractBackMoney" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;设备请款</span>
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
									<td><input type="text" name="QSTART_DATE"
										style="width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
									<td>结束日期：</td>
									<td><input type="text" name="QEND_DATE" id="dateend"
										style="width: 80px; height: 18px;" readonly="readonly"
										value="${QEND_DATE }"></td>
									<td>合同类型：</td>
									<td><select name="RENTSTAUTS" style="height: 18px;">
											<option value="-3"
												<c:if test="${RENTSTAUTS eq -3}">selected='selected'</c:if>>
												全部</option>
											<option value="0"
												<c:if test="${RENTSTAUTS eq 0}">selected='selected'</c:if>>
												正常</option>
											<option value="-1"
												<c:if test="${RENTSTAUTS eq -1}">selected='selected'</c:if>>
												作废</option>
									</select></td>
									<td>拨款状态：</td>
									<td>
										<select name="searchStatus">
											<option value="1" <c:if test="${searchStatus eq 1}">selected='selected'</c:if>>全部</option>
											<option value="2" <c:if test="${searchStatus eq 2}">selected='selected'</c:if>>未拨款（未全部申请）</option>
											<option value="3" <c:if test="${searchStatus eq 3}">selected='selected'</c:if>>已拨款（已全部申请）</option>
										</select>
									</td>
									<td>案件状态：</td>
									<td>
										<select name="pcStatus">
											<option value="0">全部</option>
											<option value="1" <c:if test="${pcStatus eq 1}">selected='selected'</c:if>>正常</option>
											<option value="2" <c:if test="${pcStatus eq 2}">selected='selected'</c:if>>过期</option>
											<option value="3" <c:if test="${pcStatus eq 3}">selected='selected'</c:if>>缓拨</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>查询内容：</td>
									<td colspan="9"><input type="text" name="QSEARCH_VALUE"
										value="${QSEARCH_VALUE }"
										style="width: 450px; height: 18px; font-size: 12px;">
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
						<tr >
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table class="grid_table">
							<tr>
								<th>
									状态
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同编号</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户名称</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="AREA">办事处</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="CLERK_NAME">单位主管</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="SENSOR_NAME">客户经理</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="BRAND">供应商</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="PAY_MONEY">已拨款金额</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="PAY_MONEYSHENHE">审核中的金额</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_TOPRIC - (PAY_MONEY + PAY_MONEYSHENHE)">剩余金额</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="LESSOR_TIME">签订时间</page:pagingSort>
								</th>
								<th>
									<page:pagingSort pagingInfo="${dw }" orderBy="ESTIMATES_PAY_DATE">预估拨款日</page:pagingSort>
								</th>
								<th>
									检核表资料
								</th>									
								<th>
									操作
								</th>
							</tr>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
								<c:set var="creatTime" value="0"></c:set>
								<c:set var="money" value="${item.LEASE_TOPRIC-(item.PAY_MONEY+item.PAY_MONEYSHENHE) }"></c:set>
									<tr>
									<c:choose><c:when test="${item.DELAY_PAY_STATUS == -1 }">
										<td style="text-align: center;"><img src="${ctx }/images/u614.gif" title="缓款"></td>
									</c:when>
									<c:otherwise>
										<td style="text-align: center;" onClick="exBankMoney('contractTr${item.CREDIT_ID }','${item.CREDIT_ID }','manage','0');">
											<c:if test="${item.PAY_MONEY < 1 and item.PAY_MONEYSHENHE < 1}">
												<img src="${ctx }/images/u608.gif" title="未拨款">
											</c:if>
											<c:if test="${item.PAY_MONEY > 0 and item.PAY_MONEY >= item.LEASE_TOPRIC}">
												<img src="${ctx }/images/u611.gif" title="完成付款">
											</c:if>
											<c:if test="${item.PAY_MONEYSHENHE > 0}">
												<img src="${ctx }/images/u622.gif" title="拨款中">
											</c:if>
										</td>
									</c:otherwise>
									</c:choose>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BRAND }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEY eq null ? 0 :item.PAY_MONEY }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEYSHENHE eq null ? 0 :item.PAY_MONEYSHENHE }" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${(item.LEASE_TOPRIC-(item.PAY_MONEY+item.PAY_MONEYSHENHE))<0.00000001 ? 0:(item.LEASE_TOPRIC-(item.PAY_MONEY+item.PAY_MONEYSHENHE)) }" />&nbsp;</td> 
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.LESSOR_TIME == '1900-01-01 00:00:00.0' ? '' : item.LESSOR_TIME }" pattern="yyyy-MM-dd"/> </td>
										<td style="text-align: center;">
											<a href="javaScript:void(0)" onclick="showUpdateEstimatesPayDate('${item.CREDIT_ID}', 'show');">${item.ESTIMATES_PAY_DATE }</a>&nbsp;</td>
										<td style="text-align: center;">
											<a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.queryPayMoneyRentFile&CONTRACT_TYPE=${item.CONTRACT_TYPE+1 }&prcd_id=${item.CREDIT_ID }&cardFlag=2'">检核表资料</a>
										</td>
										<c:choose>
											<c:when test="${item.DELAY_PAY_STATUS==-1 }">
												<td style="text-align: center;">
													<font color="#c0c0c0">申请拨款</font>|
													<a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.CREDIT_ID }'">报告查看</a>
												</td>
											</c:when>
											<c:otherwise>
												<td style="text-align: center;">
													<c:choose>
														<c:when test="${item.VALID_STATUS eq '0'}">
															<c:choose>
																<c:when test="${item.LEASE_TOPRIC - item.PAY_MONEY - item.PAY_MONEYSHENHE <= 0.1 }">
																	<font color="#c0c0c0">申请拨款</font>
																</c:when>
																<c:otherwise>
																	<a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.LEASE_CODE }','${item.CREDIT_ID }', '${item.HAS_LINKMAN }');supl('${payMoney.CREDIT_ID }');">申请拨款</a>
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>拨款期已过
															<c:if test="${item.LEASE_CODE eq '05022011110806' }"> | 
																<a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.LEASE_CODE }','${item.CREDIT_ID }', '${item.HAS_LINKMAN }');supl('${payMoney.CREDIT_ID }');">申请拨款</a>
															</c:if>
														</c:otherwise>
													</c:choose>|
													<a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.CREDIT_ID }'">报告查看</a>
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<th class="pact" colspan="14">
											<div id="contractTr${item.CREDIT_ID }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u614.gif">
										缓拨
										<img src="${ctx }/images/u608.gif">
										未拨款
										<img src="${ctx }/images/u622.gif">
										拨款中
										<img src="${ctx }/images/u611.gif">
										完成拨款&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
			
				<!--  日志弹出层开始   -->
			<!-- 弹出用函数 接收参数 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志" style="display: none" id="showBusinessLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=business.showBusinessLog">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号</td>
								<td style="text-align:center"  width="6%">编号</td>
								<td style="text-align:center"  width="6%">日志对象</td>
								<td style="text-align:center"  width="4%">日志操作</td>
								<td style="text-align:center"  width="6%">创建人</td>
								<td style="text-align:center"  width="6%">创建时间</td>
								<td style="text-align:center"  width="15%">备注</td>
							</tr>
					</table>
					<center>
					共<span id="barNum"></span>条,共<span id="total"></span>页
					当前第<span id="pageNum" ></span>页
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
					</center>
				</div>
				</div>
			</div>	
		</form>
		</div>

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
		<div style="display:none;" id="showUpdateEstimatesPayDateWin" title="预估拨款日">
			<form action="${ctx }/servlet/defaultDispatcher?__action=creditReport.updateEstimatesPayDate" id="showUpdateEstimatesPayDateForm" method="post">
			<input type="hidden" id="estimates_credit_id" name="credit_id">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table class="panel_table">
							<tr>
								<td style="width: 25%">预估次数：</td>
								<td style="width: 25%"><span id="estimates_num"></span></td>
								<td style="width: 25%">剩余次数：</td>
								<td style="width: 25%"><span id="estimates_num_last"></span></td>
							</tr>
							<tr>
								<td>预估拨款日：</td>
								<td colspan="3">
									<input type="text" id="estimates_pay_date" name="estimates_pay_date" class="panel_text" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>备注：</td>
								<td colspan="3">
									<textarea id="estimates_pay_date_reason" name="estimates_pay_date_reason" cols="58" rows="3"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<input type="button" value="保&nbsp;存" onclick="doEstimates();" class="panel_button">
									<input type="button" value="关&nbsp;闭" onclick="$('#showUpdateEstimatesPayDateWin').dialog('close');" class="panel_button">
								</td>
							</tr>
						</table>
						
						<table class="panel_table">
							<tr>
								<th>次数</th>
								<th>预估拨款日</th>
								<th>备注</th>
								<th>时间</th>
								<th>操作人</th>
							</tr>
							<tbody id="estimates_pay_date_log"></tbody>
						</table>
					</div>
				  </div>
		    </div>
		    </form>
		</div>
	</body>
</html>