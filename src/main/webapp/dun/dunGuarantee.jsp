<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="50%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
					<td  colspan="4" style="text-align: center;">保证人列表&nbsp;</td>
				</tr>
				<tr>
				<td style="background-color: #e8e8e8">
					<strong>序号</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>联系人名称</strong>
				</td >
				<td style="background-color: #e8e8e8">
					<strong>联系人手机</strong>
				</td>
				<td style="background-color: #e8e8e8">
					<strong>地址</strong>
				</td >
			</tr>
				<!-- 保证人列表 -->
				<c:forEach items="${natureList}" var="nature" varStatus="statusN">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td ><span id="custLinkmanIndex">${statusN.count}</span></td>
					<td >${nature.CUST_NAME}&nbsp;</td>
					<td >${nature.NATU_MOBILE}&nbsp;</td>
					<td >&nbsp;${nature.NATU_IDCARD_ADDRESS}</td>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(companyList) >1}">
						<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
							<td  colspan="10" style="text-align: center;">连保公司列表&nbsp;</td>
						</tr>
						<tr>
						<td style="background-color: #e8e8e8">
							<strong>序号</strong>
						</td>
						<td style="background-color: #e8e8e8">
							<strong>公司名称</strong>
						</td >
						<td style="background-color: #e8e8e8">
							<strong>公司注册地址</strong>
						</td>
						<td style="background-color: #e8e8e8">
							<strong>公司邮寄地址</strong>
						</td >
					</tr>
						<c:forEach items="${companyList}" var="cpy" varStatus="statusN">
						<tr  class="ui-widget-content jqgrow ui-row-ltr">
							<td ><span id="custLinkmanIndex">${statusN.count}</span></td>
							<td >${cpy.CORP_NAME_CN}&nbsp;</td>
							<td >${cpy.REGISTERED_OFFICE_ADDRESS}&nbsp;</td>
							<td >&nbsp;${cpy.LINK_MAILING_ADDRESS}</td>
						</tr>
					</c:forEach>
			</c:if>
			</table>
		</div>
	</div>
</div>




