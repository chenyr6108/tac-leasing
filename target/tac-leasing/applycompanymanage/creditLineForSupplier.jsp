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
        		$("#contractinfo_" + id).toggle(function(){
           			$(this).load("../servlet/defaultDispatcher?__action=applyCompanyManage.getDetailForSupplier&supplierid="+id);
       			});
				//window.location.href="${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findContractInfoBySupplierId&supplierid="+id;
			}	
			
			function thisSearch(){
				$("#progressbar").dialog({
					closeOnEscape : false,
					open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
					modal : true,
					resizable : false,
					draggable : false,
					title : "数据加载中... ..."
				});
				$("#form1").submit();
			}
			
		</script>		
	</head>
	<body>
		<div id="progressbar" style="display: none;">
			<img src="${ctx }/images/loading.gif">
		</div>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="applyCompanyManage.getCreditLineForSupplier" />
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
							          	<input type="text" name="id" value="${id eq '0' ? '' : id }" id="supplier" style="width: 350px; height: 22px;">
							          </td>
						          </tr>
					          </table>				          
					          </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" name="search" id="search" onclick="thisSearch();"  class="blue_button">搜 索</a></td>
					      </tr>
					</table>
	          	</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
						<table class="panel_table" >
							<thead>
								<tr>
									<th>
										供应商名称		
									</th>
									<th>
										合同数	
									</th>
									<th>
										授信
									</th>
								</tr>
							</thead>
							<tbody>												
								<tr>
									<td style="text-align: center;"><a href="#" onclick="findContractInfos('${supl.SUPLID }')">${supl.NAME }</a>&nbsp;</td>
									<td style="text-align: center;">${supl.projectCount }&nbsp;</td>
									<td style="text-align: center;">
										<table class="panel_table">
											<tr>
												<th style="text-align: center!important;">类型</th>
												<th style="text-align: center!important;">是否循环</th>
												<th style="text-align: center!important;">有效期</th>
												<th style="text-align: center!important;">额度</th>
												<th style="text-align: center!important;">已用额度</th>
												<th style="text-align: center!important;">剩余额度</th>
											</tr>
											<c:forEach items="${creditLine }" var="i">
												<tr>
													<td style="text-align: center;">${i.lineName }</td>
													<td style="text-align: center;">${i.repeatFlag == 1 ? '是' : '否' }</td>
													<td style="text-align: center;">${i.startDate } ~ ${i.endDate }</td>
													<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.line }"/></td>
													<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.realUsedLine }"/></td>
													<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.lastLine }"/></td>
												</tr>
											</c:forEach>
										</table>
									</td>
								</tr>
								<tr>
									<th class="pact" colspan="3">
										<div id="contractinfo_${supl.SUPLID }" align="center"
											style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</th>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
	</body>
</html>