<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function pdfFun(payMoneyId,id){
					 location.href='${ctx }/servlet/defaultDispatcher?__action=backMoneyToPdf.expPdfother&payMoneyId='+payMoneyId+'&CREDIT_ID='+id;
	  }

function updatePayMoney(code,id)
 	{
 		location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.prePayMoneyUpdate&payMoneyId='+code+'&CREDIT_ID='+id;
 	}

</script>
	
<table class="grid_table">
	<tr>
		<th>
			序号
		</th>
		<th>
			状态
		</th>
		<th>
			总金额
		</th>
		<th>
			实际支付日
		</th>
		<th>
			申请日期
		</th>
		<th>
			本次付款额
		</th>
		<th>
			支付方式
		</th>
		<th>
			剩余金额
		</th>
		<th>
			操作
		</th>
	</tr>
		<c:set value="0" var="payMoneyId"></c:set>
		<c:set value="0" var="CREDIT_ID"></c:set>
		<c:set value="0" var="leftPay"></c:set>
		<c:forEach items="${dw}" var="list" varStatus="status">
			<c:set value="${list.ID }" var="payMoneyId"></c:set>
			<c:set value="${list.CREDIT_ID }" var="CREDIT_ID"></c:set>
			<c:set value="${list.PAYCOUNT-list.PAYED-list.PAY_MONEY}" var="leftPay"></c:set>
			<tr>
				<td style="text-align: center;"   >
					${status.index+1}&nbsp;
				</td>
				<td style="text-align: center;"   >
					
					&nbsp;<c:choose><c:when test="${list.STATUS eq 1 }">驳回</c:when><c:when test="${list.STATE eq 3}">拨款成功</c:when><c:otherwise>审批中</c:otherwise></c:choose>
				</td>
				<td style="text-align: right;"    >
					<fmt:formatNumber value="${list.PAYCOUNT }" type="currency" />&nbsp;
				</td>
				<td style="text-align: center;"   >
					&nbsp;<c:if test="${list.PAY_DATE != '1900-01-01 00:00:00.0'}"><fmt:formatDate value="${list.PAY_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</c:if>
				</td>
				<td style="text-align: center;"   >
					<fmt:formatDate value="${list.APPLICATION_DATE }" pattern="yyyy-MM-dd"/>&nbsp;
				</td>
				<td style="text-align: right;"  >
					<fmt:formatNumber value="${list.PAY_MONEY }" type="currency" />&nbsp;
				</td>
				<td style="text-align: center;"   >
					${list.FLAG }&nbsp;
				</td>
				<td style="text-align: right;"    >
					<fmt:formatNumber value="${leftPay }" type="currency" />&nbsp;
				</td>
				<td style="text-align: center;"   >
					<%-- <a href="javaScript:void(0);" onclick="pdfFun(${list.ID },${list.CREDIT_ID });">导出付款记录</a> --%>
					<c:if test="${list.FINANCIALSTATUS == 1 or list.STATUS ==1}"><font color="#c0c0c0">导出付款记录</font></c:if><c:if test="${list.FINANCIALSTATUS != 1 and list.STATUS !=1 and list.DEPARTMENTSTATUS==1}"><a href="javaScript:void(0);" onclick="pdfFun(${list.ID },${list.CREDIT_ID });">导出付款记录</a>&nbsp;&nbsp;</c:if>
					<!-- Marked by Michael 2012 3-28将修改功能取消 --><!--<c:if test="${list.STATUS eq 0 and list.STATE != 3}"><a href="javaScript:void(0);" onclick="updatePayMoney('${list.ID }','${list.CREDIT_ID }')">修改</a></c:if> -->
				</td>
			</tr>
		</c:forEach>
</table>
