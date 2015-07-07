<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>担保人信息</title>
		<script src="${ctx }/credit/js/creditVoucher.js" type="text/javascript"></script>
	</head>
	<body>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
     <div class="zc_grid_body jqgrowleft">
	<c:if test="${not empty corpList}">
	 	<%@ include file="creditVoucherCorpShow.jsp"%>
	</c:if>
	<br>
	<c:if test="${not empty natuList}">
		<%@ include file="creditVoucherNatuShow.jsp"%>
	</c:if>
	<div class="ui-state-default ui-jqgrid-hdiv " align="center">
	<!-- 
		因为租金测算正在修改 所以 隐藏了下一页按钮 并在此进行提交
		租金测试修改好后 恢复下一页按钮 并在点击下一页时 将 commit_flag 传入方法中 
						在方法中根据 commit_flag = 1 控制跳转到 creditFrameCommit.jsp 提交frame页面
						并将 提交 按钮移至 租金测算页面	2011-1-5  k
			<input type="button" class="ui-state-default ui-corner-all" name="sub" value="下一页" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.showCreditPaylist&credit_id=${creditMap.ID }&showFlag=5&examineFlag=${examineFlag}&word=show'"/>
	 -->
	 <%-- <input type="button" class="ui-state-default ui-corner-all" name="sub" value="下一页" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.getIndustrialAnalyse&credit_id=${creditMap.ID }&showFlag=5&examineFlag=${examineFlag}&commit_flag=${commit_flag}'"/> --%>
	 	<%-- <c:if test="${commit_flag eq 1}">
	 		<input type="button" class="ui-state-default ui-corner-all"  value="提交" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.commitCrditToWindControl&credit_id=${creditMap.ID }'"/>
	 	</c:if> --%>
	 	<c:if test="${creditMap.CUST_TYPE eq 1 }">
	 	<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
									onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCorpReportsForShow&credit_id=${creditMap.ID }&showFlag=5&showStatus=1&commit_flag=${commit_flag}&examineFlag=${examineFlag}&isSalesDesk=${isSalesDesk }'"/>
		</c:if>
		<c:if test="${creditMap.CUST_TYPE eq 0 }">
			<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
					onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}&showFlag=6&isSalesDesk=${isSalesDesk }'"/>
		</c:if>
	</div>
	</div> 
	</div>
	</body>
</html>
