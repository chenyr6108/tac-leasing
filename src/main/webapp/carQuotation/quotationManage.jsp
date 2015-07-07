<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><c:if test='${contractType eq "4" }'>重车报价单管理</c:if><c:if test='${contractType eq "6" }'>乘用车报价单管理</c:if></title>
	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function exportApplyTable(id,type){
		if(type==3) {
			window.parent.callBirt("birtReport/carQuotation/quotationApplyForInternal.rptdesign", "pdf", {"ID" : id});
		} else {
			window.parent.callBirt("birtReport/carQuotation/quotationApply.rptdesign", "pdf", {"ID" : id});
		}

	}
	
	function exportApplyScheme(id,type){
		if(type==3) {
			window.parent.callBirt("birtReport/carQuotation/quotationSchemeForInternal.rptdesign", "pdf", {"ID" : id});
		} else {
			window.parent.callBirt("birtReport/carQuotation/quotationScheme.rptdesign", "pdf", {"ID" : id});
		}

	}
	
	function exportOwnRenPrice(cust_name,id,type){
		if(type==3) {
			window.parent.callBirt("birtReport/carQuotation/quotationOwnpriceForInternal.rptdesign", "pdf", {"ID" : id,"cust_name":cust_name});
		} else {
			window.parent.callBirt("birtReport/carQuotation/quotationOwnprice.rptdesign", "pdf", {"ID" : id,"cust_name":cust_name});
		}

	}

	function addExportLog(ID,strFlag) {
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=quotation.createQuotationExportLog&strFlag='+strFlag+'&ID='+ID,
			dataType:'json',
			success: function(dataBack)	{
				
			}	
			});
	}

	function deleteQuotation(ID) {
		
		if(confirm("是否将此报价单删除?")){
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=quotation.deleteQuotation&ID='+ID,
				dataType:'json',
				success: function(dataBack)	{
					alert("删除成功！");
					if($("#contractType").val()==4) {
						location.href="../servlet/defaultDispatcher?__action=quotation.queryCarQuotationManage";
					} else {
						location.href="../servlet/defaultDispatcher?__action=quotation.queryLittleCarQuotationManage";
					}
				}	
				});
		}else{
			return false;
		}
	}
	
	function showCustBasicReport(){
		window.open("quotation/custBaseReport.doc");
	}	
	</script>	
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="<c:if test='${contractType eq "4" }'>quotation.queryCarQuotationManage</c:if><c:if test='${contractType eq "6" }'>quotation.queryLittleCarQuotationManage</c:if>" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test='${contractType eq "4" }'>重车报价单管理</c:if><c:if test='${contractType eq "6" }'>乘用车报价单管理</c:if></span>
		   	</div>
			<input type="hidden" id="contractType" value="${contractType }">
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
				          <td colspan="5">查询内容：</td>
				          <td>
				          <input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;"></td>
				          <td>
				          </td>
				          <td>
				         <a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a>
					</td>
					<td>
					
					</td>
					<td>

					</td>
					<td>
					
					</td>
					<td>

					</td>
					<td>
					
					</td>
					<td>

					</td>
				          </tr>
				          <tr>
				          <td></td>
				          <td colspan="5">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"></td>
				      </tr>
				    </table>
	          		</div>
	          		
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
													<td>
							<input type="button" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=quotation.initCarQuotation&contractType=${contractType }'" style="padding: 2px 10px;cursor:pointer;" class="ui-state-default ui-corner-all" value="新增报价单"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										办事处主管
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										创建时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
										<td style="text-align: center;">&nbsp;${item.CREATE_DATE }</td>
										<td style="text-align: left;">&nbsp;<input type="button" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=quotation.queryQuotationShow&ID=${item.ID }'" style="padding: 2px 10px;cursor:pointer;" class="ui-state-default ui-corner-all" value="查看">&nbsp;|&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="exportApplyTable(${item.ID },${item.TAX_PLAN_CODE });addExportLog(${item.ID },'申请表');"  value="导出申请表" style="cursor:pointer;"/>&nbsp;|&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="exportApplyScheme(${item.ID },${item.TAX_PLAN_CODE });addExportLog(${item.ID },'方案');"  value="导出方案" style="cursor:pointer;"/>&nbsp;|&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="exportOwnRenPrice('${item.CUST_NAME }',${item.ID },${item.TAX_PLAN_CODE });addExportLog(${item.ID },'本息摊还表');"  value="导出本息摊还表" style=""/>&nbsp;|&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=quotation.copyQuotationScheme&ID=${item.ID }'"  value="复制方案" style="cursor:pointer;"/>&nbsp;|&nbsp;<input type="button" onclick="window.open('${ctx }/quotation/custBaseReport.doc');" style="padding: 2px 10px;cursor:pointer;" class="ui-state-default ui-corner-all" value="导出评估报告"><%-- &nbsp;|&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="deleteQuotation(${item.ID });"  value="删除" style="cursor:pointer;"/> --%></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>