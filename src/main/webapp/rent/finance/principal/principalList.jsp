<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		$(function() {
			$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
			$("#toDate").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function principalExcel() {
			window.parent.callBirt("rent/exportFile/principalExcel.rptdesign","xls",{"isPrint":$("#isPrint").val(),"fromDate":$("#fromDate").val(),"toDate":$("#toDate").val(),"fromMoney":$("#fromMoney").val(),"toMoney":$("#toMoney").val(),"companyCode":$("#companyCode").val()});
		}
		
		function print(param) {
			if(!confirm("确认打印么?")) {
				return;
			}
			$("#ids"+param).attr('checked',true);
			$("#td"+param).html("已打印");
			$("#__action").val("rentReceiptToPdf.receiptToPdfNew");
			$("#form1").submit();
			$("#ids"+param).attr('checked',false);
			$("#ids"+param).attr('disabled',true);
			$("#__action").val("rentFinanceCommand.queryPrincipalList");
		}
		
		function batchPrint() {
			if(!confirm("确认批量打印么?")) {
				return;
			}
			var chk_value=[];
		    $('input[name="ids"]:checked').each(function() {   
		          chk_value.push($(this).val());
			});
		    if(chk_value.length==0) {
				  alert("请选择一条记录!");
				  return;
			}
		    $("#btn").attr('disabled',true);
			$("#__action").val("rentReceiptToPdf.receiptToPdfNew");
			$("#form1").submit();
			$('input[name="ids"]:checked').each(function() {   
		          chk_value.push($(this).val());
		   		  var id=$(this).val();
		   		  $("#ids"+id).attr('checked',false);
			      $("#ids"+id).attr('disabled',true);
			      $("#td"+id).html("已打印");
			});
			$("#__action").val("rentFinanceCommand.queryPrincipalList");
		}
		
		function generatePrincipal() {
			if(!confirm("确认生成?")) {
				return;
			}
			$("#progressbar").dialog({
		    	closeOnEscape:false, modal:true, autoOpen:false,
		    	open:function(event,ui) {$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();},
			});
		    $("#progressbar").dialog("open");
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=rentFinanceCommand.generatePrincipal',
				dataType:'json',
				success:function(data) {
					$("#progressbar").dialog("close");
					alert(data.msg);
					$("#form1").submit();
				}
			});
		}
		
		function selectAll() {
			if($("#chk").attr("checked")) {
				$("input[name=ids]").each(function() {
					if(!$(this).attr("disabled")) {
						$(this).attr("checked","checked");
					}
			   	});
			} else {
				$("input[name=ids]").each(function() {
					$(this).attr("checked",false);
			   	});
			}
		}
		
		//查看日志
		 function viewLog() {
			 location.href="../servlet/defaultDispatcher?__action=rentReceipt.viewLog";
		 }
		</script>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryPrincipalList"/>
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;本金收据列印</span>
			   	</div>
			   	<br>
			   	<table width="1000px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8" >&nbsp;</td>
						<td width="60" class="ss_o" >&nbsp;</td>
						<td class="ss_t" >
					         <table>
					         	<tr>
					         		<td style="text-align: right">打印状态:</td>
					         		<td>
					         			<select name="isPrint" id="isPrint">
					         				<option value="-1" <c:if test="${isPrint eq -1 }">selected="selected"</c:if>>
					         					全部
					         				</option>
					         				<option value="-2" <c:if test="${isPrint eq -2 }">selected="selected"</c:if>>
					         					无发票号码
					         				</option>
					         				<option value="0" <c:if test="${isPrint eq 0 }">selected="selected"</c:if>>
					         					未打印
					         				</option>
					         				<option value="1" <c:if test="${isPrint eq 1 }">selected="selected"</c:if>>
					         					已打印
					         				</option>
					         			</select>
					         		</td>
					         		<td>本金收据生成时间:</td>
					         		<td>
					         			<input id="fromDate" name="fromDate" value="${fromDate }" readonly="readonly" style="width: 80px;">-
					         			<input id="toDate" name="toDate" value="${toDate }" readonly="readonly" style="width: 80px;">
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
					         		<td style="text-align: right">收据金额:</td>
					         		<td><input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 80px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 80px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
					         		<td style="text-align: right">查询内容:</td>
					         		<td colspan="2"><input id="content" name="content" value="${content }" style="width: 167px;"></td>
					         	</tr>
			       			 </table>
	   					</td>
	   					<td width="55" class="ss_th" valign="top" >&nbsp;</td>
			            <td width="20%">
			       		 	<a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
				      </tr>
			    </table>
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
							<br>
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td style="border-right: 0">
										<input type="button" value="生成本金收据号" class="ui-state-default ui-corner-all" onclick="generatePrincipal()">&nbsp;&nbsp;
										<input type="button" id="btn" class="ui-state-default ui-corner-all" value="批量打印(PDF)" onclick="batchPrint();">&nbsp;&nbsp;
										<input type="button" value="导出Excel" class="ui-state-default ui-corner-all" onclick="principalExcel()">&nbsp;&nbsp;
										<input type="button" value="查看打印日志" class="ui-state-default ui-corner-all" onclick="viewLog()">
									</td>
									<td style="border-left: 0"><page:pagingToolbarTop pagingInfo="${dw }"/></td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-jqgrid-labels">
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											序号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<input type="checkbox" id="chk" style="cursor: pointer;" onclick="selectAll()">
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											客户名称
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											合同号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											还款期数
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="PRINCIPAL">本金收据金额</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											本金收据编号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="INVOICE_CODE">发票号码</page:pagingSort>
										</th>
										<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
											原本金收据编号
										</th> -->
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="PRINCIPAL_CREATE_TIME">本金收据编号生成时间</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											操作
										</th>
									</tr>
									<c:forEach items="${dw.resultList }" var="item" varStatus="status">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td style="text-align: center">
													${status.count }
												</td>
												<td style="text-align: center">
													<input type="checkbox" name="ids" id="ids${item.PRINCIPAL_CODE }" value="${item.PRINCIPAL_CODE }" style="cursor: pointer;" <c:if test="${item.IS_PRINT eq 1 or empty item.PRINCIPAL_CODE or empty item.INVOICE_CODE}">disabled="disabled"</c:if>>
												</td>
												<td style="text-align: center">
													${item.CUST_NAME }
												</td>
												<td style="text-align: center">
													<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID}'" href="javascript:void(0);">
														${item.LEASE_CODE }
													</a>
												</td>
												<td style="text-align: center">
													${item.PERIOD_NUM }
												</td>
												<td style="text-align: right">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.PRINCIPAL }"/>&nbsp;
												</td>
												<td style="text-align: center">
													<c:if test="${empty item.PRINCIPAL_CODE }">未生成本金收据号</c:if>
													<c:if test="${not empty item.PRINCIPAL_CODE }">${item.PRINCIPAL_CODE }</c:if>
												</td>
												<td style="text-align: center">
													${item.INVOICE_CODE }&nbsp;
												</td>
												<%-- <td style="text-align: center">
													${item.LAST_PRINCIPAL_CODE }&nbsp;
												</td> --%>
												<td style="text-align: center">
													${item.PRINCIPAL_CREATE_TIME }&nbsp;
												</td>
												<td style="text-align: center;font-size: 11px;" id="td${item.PRINCIPAL_CODE }">
													<c:if test="${empty item.INVOICE_CODE }">
														无发票号码
													</c:if>
													<c:if test="${not empty item.INVOICE_CODE }">
														<c:if test="${item.IS_PRINT eq 0 }">
															<c:if test="${empty item.PRINCIPAL_CODE }">
																无本金收据号
															</c:if>
															<c:if test="${not empty item.PRINCIPAL_CODE }">
																<input type="button" value="打印" class="ui-state-default ui-corner-all" onclick="print('${item.PRINCIPAL_CODE }')">
															</c:if>
														</c:if>
														<c:if test="${item.IS_PRINT eq 1 }">
															已打印
														</c:if>
													</c:if>
												</td>
											</tr>
									</c:forEach>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td><page:pagingToolbar pagingInfo="${dw }"/></td>
								</tr>
							</table>
						</div>
					</div>
			</form>
		</div>
		<div id="progressbar" style="display: none;background-color: white;text-align: center;" title="数据加载中... ...">
			<br><br>
			<img src="${ctx }/images/029.gif" style="vertical-align: middle;">
		</div>
	</body>
</html>