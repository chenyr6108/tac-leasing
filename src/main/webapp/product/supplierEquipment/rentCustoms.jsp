<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="80%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;" width="300"><strong>承租人名称</strong></td>
						<td style="background-color: #e8e8e8;" width="300"><strong>合同编号</strong></td>
					</tr>
					<c:forEach items="${rentCustomlist}" var="result" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;">${status.count }&nbsp;</td>
						<td  width="300">${ result.CUST_NAME}&nbsp;</td>
						<td  width="300">${ result.LEASECODE}&nbsp;</td>
					</tr>
					</c:forEach>
            </table>
		</div>
	</div>
</div>


