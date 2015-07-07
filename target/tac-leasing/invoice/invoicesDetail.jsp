<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table>
	<tr>
		<th colspan="11" style="text-align: left; border: 0px;">
		<c:if test="${IS_ALREADY eq 0}">
			<input type="button" value="批量修改" onclick="batchUpdate('${invoices[0].invoice_id}');" class="panel_button" />
		</c:if>
		</th>
	</tr>
</table>
<table class="panel_table">
	<tr>
		<th>
			<input type="checkbox" onclick="checkedAll(this);">
		</th>
		<th>
			序号
		</th>
		<th>
			状态
		</th>
		<th>
			发票号
		</th>
		<th>
			出票人
		</th>
		<th>
			金额
		</th>
		<th>
			发票类型
		</th>
		<th>
			备注
		</th>
		<th>
			录入时间
		</th>
		<th>
			更新时间
		</th>
		<th>
			操作人
		</th>
		<th>
			操作
		</th>
	</tr>
	<c:forEach items="${invoices}" var="item" varStatus="i">
	<tr>
		<td>
			<input type="checkbox" name="invoice_ids" value="${item.id}">
		</td>
		<td style='text-align: center;'>${i.count}&nbsp;</td>
		<td style='text-align: center;'>
			<c:if test="${item.status eq 0 }">正常</c:if>
			<c:if test="${item.status eq -1 }"><font style="color: red;">作废</font></c:if>
			<c:if test="${item.status eq 1 }">借出</c:if>
			<c:if test="${item.status eq 2 }">收件</c:if>
			<c:if test="${item.status eq 3 }"><font style="color: red;">退件</font></c:if>
			&nbsp;
		</td>
		<td style='text-align: center;'>${item.invoice_code}&nbsp;</td>
		<td style='text-align: center;'>${item.drawer}&nbsp;</td>
		<td style='text-align: center;'><fmt:formatNumber type="currency" value="${item.invoice_money }"/>&nbsp;</td>
		<td style='text-align: center;'>${item.invoice_type_desc}&nbsp;</td>
		<td style='text-align: center;'>${item.memo}&nbsp;</td>
		<td style='text-align: center;'><fmt:formatDate value="${item.create_date }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
		<td style='text-align: center;'><fmt:formatDate value="${item.modify_date }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
		<td style='text-align: center;'>${item.modify_by }&nbsp;</td>
		<td style='text-align: center;'>
			<c:if test="${IS_ALREADY eq 1}">
	   			<a href="#" onclick="alert('该合同发票已正常收件.如需处理,请先洽业管退件!!');" style="color: #bbbbbb;">[修改]</a>
	   		</c:if>
	   		<c:if test="${IS_ALREADY eq 0}">
				<a href="#" onclick="showUpdateInvoice('${item.id}','${item.invoice_code}','${item.drawer}','${item.invoice_money }','${item.invoice_type}', '${item.invoice_id}', '${item.memo}', '${item.status}');">[修改]</a>
			</c:if>
			&nbsp;
			<%-- <c:if test="${item.status eq 0 }"><a href="#" onclick="cancelInvoice('${item.id}', '${item.invoice_id}');">[作废]</a></c:if>
			<c:if test="${item.status eq -1 }"><a href="#" onclick="startInvoice('${item.id}', '${item.invoice_id}');">[启用]</a></c:if>
			&nbsp; --%>
			<a href="#" onclick="showLogForInvoice('${item.id}');">[日志]</a>
			&nbsp;
		</td>	
	</tr>
	</c:forEach>
</table>

