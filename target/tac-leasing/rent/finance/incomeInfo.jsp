<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	<script>
		$(function() {
				$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
				$("#toDate").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function updateIncomeInfo(incomeId,column) {
			alert($("#"+column+incomeId+"").val())
			if(!confirm("确认更新？")) {
				return;
			}
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=rentFinanceCommand.updateIncomeInfo&incomeId='+incomeId+'&column='+column+'&value='+$("#"+column+incomeId+"").val(),
				dataType:'json',
				success:function(flag) {		
					if(flag){
						alert("更新成功！");
						$("#form1").submit();
					}
				}
			});
		}
		
		function showCashFlow(incomeId,billId) {
			$.ajax({
		        type: 'post',
		        url: '../servlet/defaultDispatcher',
		        data: '__action=rentFinanceCommand.showCashFlow&incomeId='+incomeId,
		        dataType: 'json',
		        success: function(dataMap) {
		        	var html="";
		        	var cashFlow=dataMap.cashFlow;
					var loop=dataMap.cashFlow.length;
		
					html="<tr class=\"ui-jqgrid-labels\">"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">序号</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">合同号</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">客户名称</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">销帐类型</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">销帐金额</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">期数</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">分解类型</th>"+
					"</tr>";
					
					for(var i=0;i<loop;i++) {
						html+="<tr class='ui-widget-content jqgrow ui-row-ltr'>";
						html+="<td style='text-align:center'>"+(i+1)+"</td>";
						html+="<td style='text-align:center'>"+cashFlow[i].LEASE_CODE+"</td>";
						html+="<td style='text-align:center'>"+cashFlow[i].CUST_NAME+"</td>";
						html+="<td style='text-align:center'>"+cashFlow[i].FLAG+"</td>";
						html+="<td style='text-align:right'>￥"+cashFlow[i].DECOMPOSE_PRICE+"</td>";
						html+="<td style='text-align:right'>"+cashFlow[i].PERIOD_NUM+"</td>";
						html+="<td style='text-align:center'>"+cashFlow[i].DECOMPOSE_TYPE+"</td>";
						html+="</tr>";
					}
					html+="<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center' colspan='7'>";
					html+="<input type='button' value='关&nbsp;闭' onclick="+"$('#cashFlowDiv').dialog('close');"+" class='ui-state-default ui-corner-all'>";
					html+="</td></tr>";
					$("#cashFlowTable").html(html);
					
					var cashIncome=dataMap.cashIncome;
					html1="<tr class=\"ui-jqgrid-labels\">"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款时间</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款户名</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款金额</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款帐号</th>"+
					"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">收款帐号</th>"+
					"</tr>";
					
					html1+="<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
					"<td style='text-align:center'>"+cashIncome.INCOME_DATE+"</td>"+
					"<td style='text-align:center'>"+cashIncome.INCOME_NAME+"</td>"+
					"<td style='text-align:right'>￥"+cashIncome.INCOME_MONEY+"</td>"+
					"<td style='text-align:center'>"+cashIncome.INCOME_ACCOUNT+"</td>"+
					"<td style='text-align:center'>"+cashIncome.RECEIPT_ACCOUNT+"</td>"+
					"</tr>";
					
					$("#cashIncomeTable").html(html1);
		        },
		        error:function(callback) {
					alert("网络错误，请稍后重试！");
					return ;
				}
		    });
			
			$("#cashFlowDiv").dialog({
				modal:true,
				autoOpen:false,
				width:800,
				position:['center',150],
				show:'slide'
			});
			$("#cashFlowDiv").dialog('open');
		}
	</script>
	</head>
	<body>
		<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
			<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryIncomeInfo"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改来款户名</span>
		   	</div>
		   	<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body" style="background: white">
					<br>
					<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center" >
				         <table>
				         	<tr>
				         		<td>来款时间:</td>
				         		<td><input id="fromDate" name="fromDate" value="${fromDate }" readonly="readonly" style="width: 80px;">-
				         			<input id="toDate" name="toDate" value="${toDate }" readonly="readonly" style="width: 80px;">
				         		</td>
				         		<td style="text-align: right;">来款金额:</td>
				         		<td><input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
				         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
			         			</td>
				         	</tr>
				         	<tr>
				         		<td>查询内容:</td>
				         		<td colspan="2"><input id="content" name="content" value="${content }" style="width: 169px;"></td>
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
		       			 </table>
       					</td>
			            <td width="100" class="ss_bigt">
			       		 <a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
		         	    <td width="13" class="ss_bigth" valign="top">&nbsp;
		         	    </td>
				      </tr>
				    </table>
				    <br>
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-left: 0"><page:pagingToolbarTop pagingInfo="${dw }"/></td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
							<tr>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									来款时间
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									来款户名
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									来款帐号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									虚拟帐号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									剩余金额
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									备注
								</th>
							</tr>
							<c:forEach items="${dw.resultList }" var="item" varStatus="status">
								<tr>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										${status.count }&nbsp;
									</td>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										${item.INCOME_DATE }&nbsp;
									</td>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										<input value="${item.INCOME_NAME }" id="INCOME_NAME${item.INCOME_ID }" name="INCOME_NAME" style="width: 250px" onchange="updateIncomeInfo('${item.INCOME_ID }','INCOME_NAME')">
									</td>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										<input value="${item.INCOME_ACCOUNT }" id="INCOME_ACCOUNT${item.INCOME_ID }" name="INCOME_ACCOUNT" style="width: 250px" onchange="updateIncomeInfo('${item.INCOME_ID }','INCOME_ACCOUNT')">
									</td>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										<input value="${item.VIRTUAL_ACCOUNT }" id="VIRTUAL_ACCOUNT${item.INCOME_ID }" name="VIRTUAL_ACCOUNT" style="width: 250px" onchange="updateIncomeInfo('${item.INCOME_ID }','VIRTUAL_ACCOUNT')">
									</td>
									<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
										<a href="#" onclick="showCashFlow('${item.INCOME_ID }','${item.BILL_ID }')">￥<fmt:formatNumber pattern="#,##0.00" value="${item.INCOME_MONEY }"/></a>
									</td>
									<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										<input value="${item.REMARK }" name="REMARK" style="width: 250px" onchange="updateIncomeInfo('${item.INCOME_ID }','REMARK')">
									</td>
								</tr>
							</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-left: 0"><page:pagingToolbar pagingInfo="${dw }"/></td>
							</tr>
						</table>
					</div>
			</div>
		</form>
		<div style="display: none;" id="cashFlowDiv" title="金流信息">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="cashIncomeTable">
						</table>
						<br><br>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="cashFlowTable">
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>