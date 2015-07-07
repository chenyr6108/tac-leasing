<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>已起租设备管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ctx}/product/supplierEquipment/js/suplEquipment.js"></script>
<script type="text/javascript">
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 }
function showCustomsList(id){
$("#showCustomsListTable" + id).toggle(function () {
			$(this).load("../servlet/defaultDispatcher?__action=suplEquipment.findRentCustoms&SUEQ_ID=" + id);
		});
}

doSearch1=function(){
	var content= $("#content").val();
	    window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.findAlreadyUpRentEq";
}
</script>

</head>
<body> 

	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" name="searchForm" id="form1"  method="post" style="align:center">
		<input type="hidden" name="__action" value="suplEquipment.findAlreadyUpRentEq" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;已起租产品</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
				<table width="60%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="60" class="ss_o" style="margin-left: 0px;">&nbsp;</td>
				        <td width="439" class="ss_t"  valign="top">
				        	<table style="margin-left: 10px;">
				        		<tr>
				        			<td colspan="3">
				        			内容：<input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;">
				        			</td>
				        		</tr>
				        		<tr>
				        			<td>
				        				供应商名称：<input type="text" name="supplName" value="${supplName }"/>
				        			</td>
				        			<td>
				        				厂牌：<input type="text" name="pro_type" value="${pro_type }"/>
				        			</td>
				        			<td>
				        				查询方式：<select name="queryType">
				        						<option value="0" <c:if test="${queryType != 1}">selected="selected" </c:if>>模糊查询</option>
				        						<option value="1" <c:if test="${queryType == 1}">selected="selected" </c:if>>精确查询</option>
				        				</select>
				        			</td>
				        		</tr>
				        	</table>
				        </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				</div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<page:pagingToolbarTop pagingInfo="${dw }"/>
		<table class="grid_table">
			<thead>
			<tr>
				<th>序号</th>
				<th>案件号</th>
				<th>合同号</th>
				<th>供应商</th>
				<th>供应设备</th>
				<th>设备名称</th>
				<th>厂牌</th>
				<th>配件说明</th>
				<th>指导价</th>
				<th>合同价</th>
				<th>使用年限</th>

			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.resultList}" var="result" varStatus="status">
				<tr>
					<td style="text-align: center;">${status.count }</td>
					<td style="text-align: center;">${result.CREDIT_RUNCODE } &nbsp;</td>
					<td style="text-align: center;">${result.LEASE_CODE } &nbsp;</td>
					<td style="text-align: center;">${result.SUPPLIER_NAME } &nbsp;</td>
					<td style="text-align: center;">${result.PRODUCT_NAME } &nbsp;</td>
					<td style="text-align: center;">${result.KIND_NAME } &nbsp;</td>
					<td style="text-align: center;">${result.PRO_TYPE } &nbsp;</td>
					<td style="text-align: left;">${result.MOUNTINGS }&nbsp;</td>
					<td style="text-align: right;"><c:if test="${result.GUIDANCE_PRICE gt 0 }"> <fmt:formatNumber value="${result.GUIDANCE_PRICE }" type="currency" /> </c:if> &nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber value="${result.SHUI_PRICE }" type="currency" /> &nbsp;</td>
					<td style="text-align: right;"><c:if test="${result.USEEXPIRE gt 0 }"> ${result.USEEXPIRE} </c:if> &nbsp;</td>
				</tr>
				<tr>
					<th class="pact">
						<div id="showCustomsListTable${result.SUEQ_ID }" align="center"
							style="display: none; width: 97%">
							<img src="${ctx }/images/loading.gif">
						</div>
					</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
				</div>
		</div>
	</form>
	<table>
		<tr>
			<td>最低指导价:</td><td><fmt:formatNumber value="${price.MIN_GUIDANCE_PRICE }" type="currency" /></td>			
			<td>平均指导价:</td><td><fmt:formatNumber value="${price.AVG_GUIDANCE_PRICE }" type="currency" /></td>
			<td>最高指导价:</td><td><fmt:formatNumber value="${price.MAX_GUIDANCE_PRICE }" type="currency" /></td>
		</tr>
		<tr>
			<td>最低合同价:</td><td><fmt:formatNumber value="${price.MIN_SHUI_PRICE }" type="currency" /></td>
			<td>平均合同价:</td><td><fmt:formatNumber value="${price.AVG_SHUI_PRICE }" type="currency" /></td>
			<td>最高合同价:</td><td><fmt:formatNumber value="${price.MAX_SHUI_PRICE }" type="currency" /></td>
		</tr>
	</table>
</body>
</html>