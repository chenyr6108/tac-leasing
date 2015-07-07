<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<script type="text/javascript" src="${ctx }/credit/js/reportConfirm.js"></script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>财务报表</title> 
		<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs-coress").tabs(); 
		});
    </script>
    <script type="text/javascript">
    	function exportCWBB(){
		  $("#__action").val("creditPriorRecords.expCreditReport");
		  $("#corpReportForm").submit(); 
		  $("#__action").val("creditPriorRecords.saveCreditReport");	
    	}
    	function submitcheck(){  
		   for(i=1;i<=3;i++){
		       capital_sum=parseFloat($("#capital_sum"+i).val());
		       HE=parseFloat($("#debt_sum"+i).val())+parseFloat($("#real_sum"+i).val());
		       if(capital_sum!=HE){
		           alert("资产总额不等于负债总额、净值总额之和！");
		          return false;
		       }
		    } 
		    $("#corpReportForm").submit();
		   }
    </script>
	</head>
	<body>
		<center>
			<form name="corpReportForm" id="corpReportForm" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
				<input type="hidden" name="__action" id="__action" value="creditPriorRecords.saveCreditReport">
				<input type="hidden" name="credit_id" value="${creditMap.ID }">
				<div id="main">  
				<div id="tabs-coress">
					<ul> 
						<li><a href="#tabsss-1">BSPL-1</a></li>
						<li><a href="#tabsss-2" id="bs_2">BSPL-2</a></li>
						<li><a href="#tabsss-3" onclick="initReportConfirmData();">RATIO</a></li> 
						<div align="right"><c:if test="${not empty obj1}"><input type="button" value="导出财务报表" onclick="exportCWBB()" class="ui-state-default ui-corner-all"></c:if></div> 
					</ul>
					<div id="tabsss-1">
							<c:if test="${not empty obj1}">
								<%@ include file="creditPropertyAndDebt.jsp"%>
							</c:if>
							<c:if test="${empty obj1}">
								<%@ include file="creditPropertyAndDebtInit.jsp"%>
							</c:if>
							<br/>
					</div>
					<div id="tabsss-2">
							<c:if test="${not empty obj1}">
								<%@ include file="creditPropertyAndDebt2.jsp"%>
							</c:if>
							<c:if test="${empty obj1}">
								<%@ include file="creditPropertyAndDebtInit2.jsp"%>
							</c:if>
							<br/>
					</div>
					<div id="tabsss-3"> 
							<%@ include file="reportConfirm.jsp"%>
							<br/>
					</div>
				</div> 
			</div>
				<c:if test="${showStatus != 2}">
					<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
					onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}&showFlag=6&isSalesDesk=${isSalesDesk }'"/>		
				</c:if>
		</form>
		</center>
	</body>
</html>
	