<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
	<title>供应商授信管理</title>
	
	<script type="text/javascript" src="${ctx }/productcredit/js/productcreditManage.js"></script>
	<script type="text/javascript">
		function showProduct(id, modal){
			$("#PRODUCT_ID").val(id);
			$("#modal").val(modal);
			$("#showDetail").submit();
		}
	</script>
</head>
	
	
	<body>
		<form action="../servlet/defaultDispatcher" name="showDetail" id="showDetail" method="post">
			<input type="hidden" name="__action" value="productCredit.getProductCreditJsp">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID"/>
			<input type="hidden" name="modal" id="modal"/>
		</form>	
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="productCredit.queryAllProductCredit" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商授信管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>授信额度：</td>
				          <td>
				          	<input type="text" name="QSTARTMONEY" id="QSTARTMONEY" value="${QSTARTMONEY }" style=" width:66px;height:18px; font-size: 12px;">-
				          	<input type="text" name="QENDMONEY" id="QENDMONEY" value="${QENDMONEY }" style=" width:66px;height:18px; font-size: 12px;">
				          </td>				        
				          <td>
				          	授信状态：
				          	<select name="QCUGPDTATUS" id="QCUGPDTATUS" style=" height: 18px;">
				          	 	<option value="-1">请选择</option>
				          	 	<option value="2" <c:if test="${QCUGPDTATUS eq 2 }">selected</c:if>>未授信</option>
				          	 	<option value="0" <c:if test="${QCUGPDTATUS eq 0 }">selected</c:if> >已授信</option>
				          	 	<option value="1" <c:if test="${QCUGPDTATUS eq 1 }">selected</c:if>>取消授信</option>
				          	</select>
				          </td>
				          </tr>
				          <tr>
				          <td>企业名称：</td>
				          <td colspan="4"><input type="text" name="QSEARCHVALUE" value="${QSEARCHVALUE }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>				       
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table></div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th rowspan="2">
						序号
					</th>
					<th rowspan="2">
						供应商编号
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="NAME">企业名称</page:pagingSort>
					</th>
					<th rowspan="2">
						法定代表人
					</th>
					<th rowspan="2">
						联系人
					</th>
					<th rowspan="2">
						联系电话
					</th>
					<th colspan="4">
						授信额度
					</th>
					<th rowspan="2">
						授信状态
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="MODITY_DATE">最后维护时间</page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="MODIFY_NAME">最后维护人</page:pagingSort>
					</th>
					<th rowspan="2">
						操作
					</th>
					
				</tr>
				<tr>
					<th >
						<page:pagingSort pagingInfo="${dw }" orderBy="LIEN_GRANT_PRICE">连保额度</page:pagingSort>
					</th>
					<th >
						<page:pagingSort pagingInfo="${dw }" orderBy="REPURCH_GRANT_PRICE">回购额度</page:pagingSort>
					</th>
					<th >
						<page:pagingSort pagingInfo="${dw }" orderBy="ADVANCEMACHINE_GRANT_PRICE">交机前拨款</page:pagingSort>
					</th>
					<th >
						<page:pagingSort pagingInfo="${dw }" orderBy="VOICE_CREDIT">发票</page:pagingSort>
					</th>
				</tr>
			<tbody>
				<c:forEach items="${dw.resultList}" var="result" varStatus="status">
					<tr>
						<td style="text-align: center; text-decoration:none;">${status.count}&nbsp;</td>
						<td style="text-align: center;">${result.CODE}&nbsp;</td>
						<td style="text-align: center;">${result.NAME}&nbsp;</td>
						<td style="text-align: center;">${result.COMPANY_CORPORATION}&nbsp;</td>
						<td style="text-align: center;">${result.LINKMAN_NAME }&nbsp;</td>
						<td style="text-align: center;">${result.LINKMAN_MOBILE }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00"  value="${result.LIEN_GRANT_PRICE}"/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00"  value="${result.REPURCH_GRANT_PRICE}"/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber pattern="#,##0.00"  value="${result.ADVANCEMACHINE_GRANT_PRICE}"/>&nbsp;</td>
						<td style="text-align: right;">${result.VOICE_CREDIT}&nbsp;</td>
						<td><c:if test="${empty result.PDGP_ID}">未授信</c:if><c:if test="${result.CUGP_STATUS eq 0}">已授信</c:if><c:if test="${result.CUGP_STATUS eq 1}">取消授信</c:if></td>
						<td style="text-align: center;"><fmt:formatDate value="${result.MODITY_DATE }" pattern="yyyy-MM-dd HH:mm"/> &nbsp;</td>
						<td style="text-align: center;">${result.MODIFY_NAME}&nbsp;</td>
						<td><a href="#" onclick="showProduct('${result.ID }', 'show');">查看</a>&nbsp;<a href="#" onclick="showProduct('${result.ID }', 'update');">修改</a></td>
					</tr>		
				</c:forEach>
			</tbody>
		</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
				</div>
			</div>
		</form>
	</body>
</html>