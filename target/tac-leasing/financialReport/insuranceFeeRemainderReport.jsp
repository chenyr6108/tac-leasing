<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>保险费余额变动表</title>
<script type="text/javascript">
	$(function() {
		$("#payDate").datepicker($.datepicker.regional['zh-CN']);
		$("#payDate1").datepicker($.datepicker.regional['zh-CN']);
	});
	//导出Excel
	function exportDetail() {
		window.parent.callBirt("birtReport/financialReport/insuranceFeeRemainderReport.rptdesign","xls",{"date":$("#date").val(),"content":encodeURI($("#content").val())});
	}
	
	function expand(iddiv,recpCode,periodNum) {
        $("#"+iddiv).toggle(function() {
            $(this).load("../servlet/defaultDispatcher?__action=insuranceFeeRemainderReportCommand.getInsuranceFeeRemainderReportByRecpCode&recpCode="+recpCode+"&periodNum="+periodNum);
        });
	}
	
	function generateReportBaseData() {
		if($("#recpCode0").val()=="") {
			alert("支付表号不能为空!");
			$("#recpCode0").focus();
			return;
		}
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=insuranceFeeRemainderReportCommand.generateHistoryInsuranceFeeRemainderPay&recpCode="+$("#recpCode0").val(),
			dataType:"json",
			success:function(flag) {
				if(flag) {
					alert("生成成功!");
				} else {
					alert("生成失败!");
				}
			},
			error:function() {
				alert("生成失败!");
			}
     	});
	}
	
	function generateReport() {
		/* if($("#recpCode1").val()=="") {
			alert("支付表号不能为空!");
			$("#recpCode1").focus();
			return;
		} */
		if($("#payDate1").val()=="") {
			alert("保险支付日不能为空!");
			$("#payDate1").focus();
			return;
		}
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=insuranceFeeRemainderReportCommand.generateHistoryInsuranceFeeRemainderFinancial&recpCode="+$("#recpCode1").val()+"&reportDate="+$("#payDate1").val(),
			dataType:"json",
			success:function(flag) {
				if(flag) {
					alert("生成成功!");
					$("#form1").submit();
				} else {
					alert("生成失败!");
				}
			},
			error:function() {
				alert("生成失败!");
			}
     	});
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" value="insuranceFeeRemainderReportCommand.queryInsuranceFeeRemainderReport">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险费余额变动表</span>
	    </div>
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
            <div class="zc_grid_body jqgrowleft">
            	<div>
            		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="70%" class="ss_t">
				          <table style="margin-left:10px;">
					          <tr>
						          <td>日期：</td>
						          <td>
						          	  <select name="date" id="date">
					          	  		  <c:forEach items="${dateList }" var="item">
					          	  		  		<option value="${item }" <c:if test="${date eq item }">selected='selected'</c:if>>
					          	  		  			${item }
					          	  		  		</option>
					          			  </c:forEach>
					          		  </select>
					          	 </td>
					          	 <td>&nbsp;&nbsp;查询内容：</td>
					          	 <td>
					          	 	<input name="content" id="content" value="${content }">
					          	 </td>
					          	 <td>&nbsp;&nbsp;租金应付日期 ：</td>
					          	 <td>
					          	 	<input name="payDate" id="payDate" value="${payDate }" style="width: 80px;" readonly="readonly">
					          	 </td>
					          	 <td>&nbsp;&nbsp;案件状态：</td>
					          	 <td>
					          	 	<select name="recpStatus" id="recpStatus">
					          	 		<option value="">全部</option>
					          	 		<option <c:if test='${recpStatus eq "0"}'>selected="selected"</c:if> value="0">正常</option>
					          	 		<option <c:if test='${recpStatus eq "1"}'>selected="selected"</c:if> value="1">正常结清</option>
					          	 		<option <c:if test='${recpStatus eq "3"}'>selected="selected"</c:if> value="3">提前结清</option>
					          	 	</select>
					          	 </td>
					          </tr>
				          </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
            	</div>
            	<div class="ui-state-default ui-jqgrid-hdiv" style="background-color: white;">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td><input value="导出Excel" type="button" class="ui-state-default ui-corner-all" onclick="exportDetail()"></td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								序号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								案件状态
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								案件号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								客户名称
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								支付表号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期租金应付日期/保险支付日期
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo }">业务员</page:pagingSort>
							</th>
							<%-- <th class="ui-state-default ui-th-ltr zc_grid_head">
								<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${pagingInfo }">办事处</page:pagingSort>
							</th> --%>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="LEASE_TOPRIC" pagingInfo="${pagingInfo }">设备总价款</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="START_DATE" pagingInfo="${pagingInfo }">起租日</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期数/合同期数 
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="INSURE" pagingInfo="${pagingInfo }">总保费</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期初余额
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期新增
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期减少
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期末余额
							</th>
						</tr>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${item.RECP_STATUS == 3 }">style="background:gray"</c:if>>
							<td style="text-align: center;">${index.count }</td>
							<td style="text-align: center;"><c:if test="${item.RECP_STATUS == 0 }">正常</c:if><c:if test="${item.RECP_STATUS == 1 }">结清日期:${item.SETTLE_DATE }</c:if><c:if test="${item.RECP_STATUS == 3 }">提前结清日期:${item.SETTLE_DATE }</c:if></td>
							<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;"><a href="#" onClick="expand('pactAffix${item.RECP_CODE }','${item.RECP_CODE }',${item.PERIOD_NUM });">${item.RECP_CODE }</a></td>
							<td style="text-align: center;">${item.PAY_DATE }/${item.PAY_DATE_1 }</td>
							<td style="text-align: center;">${item.NAME }</td>
							<%-- <td style="text-align: center;">${item.DECP_NAME_CN }</td> --%>
							<td style="text-align: right;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">${item.START_DATE }</td>
							<td style="text-align: right;">${item.PERIOD_NUM }/${item.LEASE_PERIOD }</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.INSURE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.BEGIN_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.INCREASE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.REDUCE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><c:if test='${item.END_MONEY>=0}'><fmt:formatNumber value="${item.END_MONEY }" pattern="#,##0.00"/></c:if><c:if test='${item.END_MONEY<0}'><fmt:formatNumber value="${item.END_MONEY*-1 }" pattern="#,##0.00"/></c:if>&nbsp;</td>
						</tr>
						<tr>
							<td style="text-align:right;" colspan="14" align="right">
								<div id="pactAffix${item.RECP_CODE }" align="center" style="margin-left:1%;margin-right:1%;margin-top:10px;margin-bottom:20px;display:none;width:99%">
									<img src="${ctx }/images/loading.gif">
								</div>
							</td>
						</tr>
					</c:forEach>
					</table>
					<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
            </div>
        </div>
	</form>
	<br>
<c:if test="${job eq '9' }">
	<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险费余额变动表业务支撑(资讯专用)</span>
	    </div>
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
            <div class="zc_grid_body jqgrowleft">
            	<div class="ui-state-default ui-jqgrid-hdiv" style="background-color: white;">
            		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
            			<tr class="ui-widget-content jqgrow ui-row-ltr">
            				<th style="background-color: white;text-align: left" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					业务支撑1(如果此案件支付表有改过,需要重新生成<font color="red">保险费余额基础表</font>)
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					支付表号:(例:05062012101071-1,14位合同号加-加数字)
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					<input name="recpCode" id="recpCode0"><font color="red">*</font>
            				</th>
            				<th style="background-color: white" class="ui-widget-content jqgrow ui-row-ltr">
            					&nbsp;
            				</th>
            				<th style="background-color: white" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
            					&nbsp;
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					<input type="button" value="手动生成保险费基础表" class="ui-state-default ui-corner-all" style="height: 25px;" onclick="generateReportBaseData()">
            				</th>
            			</tr>
            			
            			<tr class="ui-widget-content jqgrow ui-row-ltr">
            				<th style="background-color: white;text-align: left" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					业务支撑2(手动生成保险费余额变动表)<font color="red">注意:基于保险费余额基础表生成的</font>
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					支付表号:(例:05062012101071-1,14位合同号加-加数字)
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					<input name="recpCode" id="recpCode1">
            				</th>
            				<th style="background-color: white" class="ui-widget-content jqgrow ui-row-ltr">
            					保险支付日<br>(按照起租日开始推):
            				</th>
            				<th style="background-color: white" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
            					<input name="payDate" id="payDate1" style="width: 80px;" readonly="readonly"><font color="red">*</font>
            				</th>
            				<th style="background-color: white" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
            					<input type="button" value="手动生成保险费余额变动表" class="ui-state-default ui-corner-all" style="height: 25px;" onclick="generateReport()">
            				</th>
            			</tr>
            			<tr style="background-color: white" class="ui-widget-content jqgrow ui-row-ltr">
            				<th style="background-color: white;text-align: left" colspan="15"><br><br>以下数据是通过业务支撑手动重新生成数据时废除的原始数据</th>
            			</tr>
						<tr>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								序号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								案件状态
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								案件号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								客户名称
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								支付表号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期租金应付日期
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								业务员
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								设备总价款
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								起租日
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期数/合同期数 
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								总保费
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期初余额
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期新增
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								本期减少
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								期末余额
							</th>
						</tr>
					<c:forEach items="${resultList}" var="item" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${item.RECP_STATUS == 3 }">style="background:gray"</c:if>>
							<td style="text-align: center;">${index.count }</td>
							<td style="text-align: center;"><c:if test="${item.RECP_STATUS == 0 }">正常</c:if><c:if test="${item.RECP_STATUS == 1 }">结清日期:${item.SETTLE_DATE }</c:if><c:if test="${item.RECP_STATUS == 3 }">提前结清日期:${item.SETTLE_DATE }</c:if></td>
							<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;">${item.RECP_CODE }</td>
							<td style="text-align: center;">${item.PAY_DATE }</td>
							<td style="text-align: center;">${item.NAME }</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">${item.START_DATE }</td>
							<td style="text-align: right;">${item.PERIOD_NUM }/${item.LEASE_PERIOD }</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.INSURE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.BEGIN_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.INCREASE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.REDUCE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: right;"><c:if test='${item.END_MONEY>=0}'><fmt:formatNumber value="${item.END_MONEY }" pattern="#,##0.00"/></c:if><c:if test='${item.END_MONEY<0}'><fmt:formatNumber value="${item.END_MONEY*-1 }" pattern="#,##0.00"/></c:if>&nbsp;</td>
						</tr>
					</c:forEach>
					</table>
            	</div>
            </div>
        </div>
	</form>
</c:if>
</body>
</html>