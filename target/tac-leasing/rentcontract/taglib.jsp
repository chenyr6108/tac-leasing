<%-- <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><c:if test="${empty item.RECT_ID}"><a href="javascript:void(0)" onclick="commitCredits('${item.PRCD_ID }','${s_employeeId }')">初审</a></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq 0}"><c:choose><c:when test="${item.RECT_STATUS eq 0 or item.RECT_STATUS eq 2}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.initUpdate&RECT_ID=${item.RECT_ID }'">修改</a></c:when><c:otherwise>初审</c:otherwise></c:choose></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq -1}"><c:choose><c:when test="${item.RECT_STATUS eq 0 or item.RECT_STATUS eq 2}">修改</c:when><c:otherwise>初审</c:otherwise></c:choose></c:if>&nbsp;|&nbsp;<c:if test="${empty item.RECT_ID}">复核</c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq 0}"><c:choose><c:when test="${item.RECT_STATUS eq 0 or item.RECT_STATUS eq 2}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.checkContract&rect_id=${item.RECT_ID }'">复核</a></c:when><c:otherwise>复核</c:otherwise></c:choose></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">复核</c:if>&nbsp;|&nbsp;<c:if test="${empty item.RECT_ID}">还款</c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq 0}"><c:choose><c:when test="${item.RECT_STATUS eq 1 and item.PAYLISTFLAG gt 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryEquipment&RECT_ID=${item.RECT_ID }'">还款</a></c:when><c:otherwise>还款</c:otherwise></c:choose></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">还款</c:if><br/><a href="javascript:void(0)" onclick="rentfile('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }');">资料</a>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="showBusinessLog('${item.PRCD_ID }','${item.RECT_ID}');">日志</a>&nbsp;|&nbsp;<c:if test="${empty item.RECT_ID}">差异</c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq 0}"><c:choose><c:when test="${item.RECT_STATUS eq 1 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.showDifference&rect_id=${item.RECT_ID }&recc_type=1'">差异</a></c:when><c:when test="${item.RECT_STATUS eq 2 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.showDifference&rect_id=${item.RECT_ID }&recc_type=2'">差异</a></c:when><c:otherwise>差异</c:otherwise></c:choose></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">差异</c:if>&nbsp;|&nbsp;<c:if test="${empty item.RECT_ID}">作废</c:if><c:if test="${not empty item.RECT_ID}"><c:choose><c:when test="${ item.STATUS eq 0}"><a href="javascript:void(0)" onclick="invalidRentContract(${item.RECT_ID});">作废</a></c:when><c:otherwise>作废</c:otherwise></c:choose></c:if> 
--%><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:if test="${empty item.RECT_ID}"><a href="javascript:void(0)" onclick="commitCredits('${item.PRCD_ID }','${s_employeeId }')">文审</a></c:if>
<c:if test="${not empty item.RECT_ID and item.STATUS eq 0}">
	<c:choose>
		<c:when test="${item.RECT_STATUS eq 2}"><%-- <a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.initUpdate&RECT_ID=${item.RECT_ID }'"> --%>修改<!-- </a> --></c:when>
		<c:otherwise>文审</c:otherwise>
	</c:choose>
</c:if>
<c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">
	<c:choose>
		<c:when test="${item.RECT_STATUS eq 0 or item.RECT_STATUS eq 2}">修改</c:when>
		<c:otherwise>文审</c:otherwise>
	</c:choose>
</c:if>&nbsp;|&nbsp;
<c:if test="${empty item.RECT_ID}">还款</c:if>
<c:if test="${not empty item.RECT_ID and item.STATUS eq 0}">
	<c:choose>
		<c:when test="${(item.RECT_STATUS eq 1 or item.RECT_STATUS eq 2) and item.PAYLISTFLAG gt 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryEquipment&RECT_ID=${item.RECT_ID }'">还款</a></c:when>
		<c:otherwise>还款</c:otherwise>
	</c:choose>
</c:if> 
<c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">还款</c:if>
&nbsp;|&nbsp;
<c:if test="${empty item.RECT_ID}">复核</c:if>
<c:if test="${not empty item.RECT_ID and item.STATUS eq 0}">
	<c:choose>
		<c:when test="${item.RECT_STATUS eq 0 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.checkContract&rect_id=${item.RECT_ID }'">复核</a></c:when>
		<c:otherwise>复核</c:otherwise>
	</c:choose>
</c:if>
<c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">复核</c:if>&nbsp;|&nbsp;
<c:if test="${editThingNum==true}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContractEquiMDF.initThingNumberRentUpdate&RECT_ID=${item.RECT_ID }&PRCD_ID=${item.PRCD_ID }'">修改机号</a></c:if>&nbsp;|&nbsp;
<br/><a href="javascript:void(0)" onclick="rentfile('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }','','${item.TRFS_STATE }','${item.RECT_STATUS}');">资料</a>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="showBusinessLog('${item.PRCD_ID }','${item.RECT_ID}');">日志</a>&nbsp;|&nbsp;<c:if test="${empty item.RECT_ID}">差异</c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq 0}"><c:choose><c:when test="${item.RECT_STATUS eq 1 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.showDifference&rect_id=${item.RECT_ID }&recc_type=1'">差异</a></c:when><c:when test="${item.RECT_STATUS eq 2 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.showDifference&rect_id=${item.RECT_ID }&recc_type=2'">差异</a></c:when><c:otherwise>差异</c:otherwise></c:choose></c:if><c:if test="${not empty item.RECT_ID and item.STATUS eq -1}">差异</c:if>&nbsp;&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="postManage('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }');">寄件管理</a>