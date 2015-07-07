<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
			<table cellspacing="0" cellpadding="0" border="0"  class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;" width="608"><strong>审核意见</strong></td>
						<td style="background-color: #e8e8e8;" width="120"><strong>审核人</strong></td>
						<td style="background-color: #e8e8e8;" width="50"><strong>时间</strong></td>
					</tr>
							
					<c:forEach items="${memoList}" var="item" varStatus="status" >														
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="width: 50px;"><strong>${status.count}</strong></td>
							<td width="59" align="center">${item.MEMO}</td>
							<td width="121" align="center">${item.NAME}</td>
							<td width="50" align="center"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
						</tr>	
					</c:forEach>				
			</table>
		</div>