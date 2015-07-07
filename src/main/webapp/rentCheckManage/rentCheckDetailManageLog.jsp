<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table width="700" cellpadding="0" cellspacing="0" border="0"
	align="center">
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0"
				class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
				<tr>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head" >客户名称</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head" >合同号</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head" >对应合同起始期数</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head" >对应合同结束期数</td>				
				</tr>
				<c:forEach items="${checkPayLeaseCode }" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center; height: 20px;" >${item.CUST_NAME }&nbsp;</td>
					<td style="text-align: center; height: 20px;" >${item.LEASE_CODE }&nbsp;</td>
					<td style="text-align: center;" >${item.CHECK_START }&nbsp;</td>
					<td style="text-align: center; height: 20px;" >${item.CHECK_END }&nbsp;</td>						
					</tr>
				</c:forEach>
				</table>
				<table cellspacing="0" cellpadding="0" border="0"
				class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
				<tr>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">出票人</td>				
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">出票日期</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">支票号</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">支票金额</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">业务备注</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作类型</td>							
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作说明</td>						
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作人</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作日期</td>					
				</tr>
				<c:forEach items="${checkPayManageLog }" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center; height: 20px;">${item.DRAWER }&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.CHECK_OUT_DATE }&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.CHECK_NUM }&nbsp;</td>
					<td style="text-align: center; height: 20px;"><fmt:formatNumber value="${item.CHECK_MONEY }" type="currency" />&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.MEMO }&nbsp;</td>
					<td style="text-align: center;">${item.ACTION_TYPE }&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.REMARK }&nbsp;</td>						
					<td style="text-align: center; height: 20px;">${item.NAME }&nbsp;</td>
					<td style="text-align: center; height: 20px;"><fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>	
					</tr>
				</c:forEach>
				<c:if test="${ not empty checkFileUpList}">
					<tr>
						<td style="text-align: center;"
							class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">上传附件如下：</td>
					</tr>
				</c:if>
				<c:forEach items="${checkFileUpList }" var="item" varStatus="status">
					<tr>
						<td style="text-align: center;"
							class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">${item.FILE_NAME }</td>
						<td style="text-align: center;"
							class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">上传人：${item.NAME }</td>
						<td style="text-align: center;"
							class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">上传时间：<fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm"/></td>							
						<td style="text-align: center; height: 20px;"
							class="ui-state-default ui-th-ltr zc_grid_head" colspan="2"><a href="javaScript:void(0)" onclick="javaScript:location.href='../servlet/defaultDispatcher?__action=rentContract.download&name=${item.FILE_NAME }&path=${item.PATH }'">查看附件(${item.FILE_NAME})</a></td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>
