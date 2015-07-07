<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:if test="${empty item.RECT_ID}">未文审</c:if>
<c:if test="${not empty item.RECT_ID}">已文审</c:if>|
<c:if test="${empty item.RECT_ID or item.RECT_STATUS eq 0}">未复核</c:if>
<c:if test="${not empty item.RECT_ID and item.RECT_STATUS eq 1 and item.PAYLISTFLAG gt 0}">未复核</c:if>
<c:if test="${not empty item.RECT_ID and item.RECT_STATUS eq 1 and item.PAYLISTFLAG eq 0}">复核通过</c:if>
<c:if test="${not empty item.RECT_ID and item.RECT_STATUS eq 2}">复核驳回</c:if>
<br/><a href="javascript:void(0)" onclick="rentfile('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }','true');">资料</a>|<a href="javascript:void(0)" onclick="showBusinessLog('${item.PRCD_ID }','${item.RECT_ID}');">日志</a>|<c:if test="${empty item.RECT_ID or item.RECT_STATUS eq 0}">差异</c:if><c:if test="${not empty item.RECT_ID and item.RECT_STATUS ne 0}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkContract.showDifference&rect_id=${item.RECT_ID }&recc_type=${item.RECT_STATUS }'">差异</a></c:if>|<c:if test="${isSalesDesk eq 'Y'}"><br/><c:if test="${item.FLAG eq 'N' }">申请拨款|维护预计支付日</c:if><c:if test="${item.FLAG eq 'Y'}"><a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.LEASE_CODE }','${item.PRCD_ID }','${item.HAS_LINKMAN }');">申请拨款</a>|<a href="javaScript:void(0);" onclick="maintainExpectedDate('${item.PRCD_ID }')">维护预计支付日</a></c:if></c:if>
<c:if test ="${uploadRentFile}">
<c:if test="${item.PRODUCTION_TYPE eq 2 or item.PRODUCTION_TYPE eq 3}">
<br/><a href="javascript:void(0)" onclick="rentFileUpload('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }')">合同资料上传</a>
</c:if>
</c:if>