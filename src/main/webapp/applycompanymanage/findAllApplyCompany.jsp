<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>归户管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
			var supplier_map;
			$(function(){
				$.ajax({
					url : "${ctx}/servlet/defaultDispatcher",
					data : {"__action" : "applyCompanyManage.getAllSupplier"},
					dataType : "json",
					success : function (data){
						supplier_map = $.map(data, function (item){
							return{
								label : item.display_name,
								value : item.option_value
							};
						});
						$("#supplier").dropDownList(supplier_map);			
					}
				});				
			});
		
			function findContractInfos(id){
        		$("#contractinfo" + id).toggle(function(){
           			$(this).load("../servlet/defaultDispatcher?__action=applyCompanyManage.findContractInfoBySupplierId&supplierid="+id);
       			});
				//window.location.href="${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findContractInfoBySupplierId&supplierid="+id;
			}	

		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="applyCompanyManage.findAllApplyCompany" />
			<input type="hidden" name="guihutype" id="guihutype" value="${guihutype }" />
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          	<div style="margin: 6 0 6 0px;">
		          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="40" class="ss_o"></td>
					        <td width="60%" class="ss_t" valign="center">
					          <table style="margin-left: 10px;">
						          <tr>
							          <td>供应商名称：</td>
							          <td colspan="5">
							          	<input type="text" name="id" style=" width:395px;height:18px; font-size: 12px;" id="supplier">
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
						<table class="grid_table" >
							<thead>
								<tr>
									<th>
										供应商名称		
									</th>
									<th>
										合同数	
									</th>
									<th>
										合同租金总额										
									</th>
									<th>
										合同租金余额
									</th>
									<th>
										实际剩余本金
									</th>
									<th>
										总额度
									</th>
									<th>
										总剩余额度
									</th>
									<th>
										已用连保额度
									</th>
									<th>
										已核准未拨款连保额度
									</th>
									<th>
										已用回购额度
									</th>
									<th>
										已核准未拨款回购额度
									</th>
								</tr>
							</thead>
							<tbody>												
									<tr>
										<td style="text-align: center;"><a href="#" onclick="findContractInfos('${result.ID }')">${result.NAME }&nbsp;</td>
										<td style="text-align: center;"><c:if test="${result.COUNTS eq null }">0</c:if>${result.COUNTS }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.SUMMONTH_PRICE }" type="currency" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.SHENGYUZUJIN }" type="currency" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.remainingPrincipal }" type="currency" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.GRANT_PRICE}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.LAST_PRICE}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.LIANBAO}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.lian_bao_outstanding}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.HUIGOU}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${result.hui_gou_outstanding}" type="currency"/>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="11" align="center">
											<div id="contractinfo${result.ID }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
	</body>
</html>