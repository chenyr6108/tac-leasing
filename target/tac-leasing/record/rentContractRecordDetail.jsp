<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table cellspacing="0" cellpadding="0" border="0" width="100%" class="panel_table">
	<thead>
		<tr>
			<th style="background-color: #e8e8e8;">
				调阅人员
			</th>
			<th style="background-color: #e8e8e8;">
				调阅日期
			</th>
			<th style="background-color: #e8e8e8;">
				计划归还日期
			</th>
			<th style="background-color: #e8e8e8;">
				调阅位置
			</th>
			<th style="background-color: #e8e8e8;">
				调阅用途
			</th>						
			<th style="background-color: #e8e8e8;">
				归还日期
			</th>
			<th style="background-color: #e8e8e8;">
				存放位置
			</th>
			<th style="background-color: #e8e8e8;">
				出库人员
			</th>
			<th style="background-color: #e8e8e8;">
				入库人员
			</th>																											
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="item" >													
			<tr>
				<td style="text-align: center;">${item.BORROWER }&nbsp;</td>
				<td style="text-align: center;">${item.BORROW_DATE }&nbsp;</td>
				<td style="text-align: center;">${item.PLAN_RETURN_DATE }&nbsp;</td>
				<td style="text-align: center;">${item.FROM_POSITION }&nbsp;</td>
				<td style="text-align: center;">${item.REASON }&nbsp;</td>
				<td style="text-align: center;">${item.RETURN_DATE }&nbsp;</td>	
				<td style="text-align: center;">${item.TO_POSITION }&nbsp;</td>	
				<td style="text-align: center;">${item.CREATE_USER}&nbsp;</td>	
				<td style="text-align: center;">${item.MODIFY_USER}&nbsp;</td>							
			</tr>
		</c:forEach>
	</tbody>
</table>
