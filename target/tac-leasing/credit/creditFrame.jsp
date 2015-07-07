<%@ page language="java" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>现场调查报告</title> 
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
	<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs").tabs();
			$("#tabs").tabs('select',${showFlag});
		});
		function updateDecpId(){
			//alert($("#decp_id").val());
			var decp_id=$("#decp_id").val();
			var credit_id=$("#credit_id").val();
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditReport.updateCreditDecpId&credit_id='+credit_id+'&decp_id='+decp_id,
				dataType:'json',
				success:function(dataBack){ 
					alertinfo = dataBack.alertInfo;
					alert(alertinfo);
					//location.reload();
				}
			});		
		}								
    </script>
  <script type="text/javascript" src="${ctx }/credit/js/creditVoucherAndDebt.js"></script>
	</head>
	<body>
	<table align="center" style="width: 100% !important; overflow: auto; table-layout:fixed;">
				<tr>
					<td>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告
				<c:if test="${creditMap.VIP_FLAG == 1 }">
					（绿色通道）
				</c:if>
	   		</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人姓名：${creditMap.CUST_NAME }</td>
					<td>客户类型：<c:if test="${creditMap.CUST_TYPE eq 0}">自然人</c:if><c:if test="${creditMap.CUST_TYPE eq 1 }">法人</c:if></td>
					<td>办事处主管：${creditMap.CLERK_NAME }</td>
					<td>客户经理：${creditMap.SENSOR_NAME }</td>
					<td>客户来源：${creditMap.CUSTOMER_COME }</td>
				</tr>
			</table>
		</div> 
		
		<div id="tabs">
			<ul>
				<li>
					<a href="#tabs-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${creditMap.ID }&showFlag=0'">租赁方案</a>
				</li>
				<li>
					<a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditCustomerCorp.selectCreditCustomerCorpForUpdate&credit_id=${creditMap.ID }&showFlag=1'"><c:if test="${creditMap.CUST_TYPE eq 0 }">基本信息</c:if><c:if test="${creditMap.CUST_TYPE eq 1 }">公司沿革</c:if></a>
				</li> 
				<li>
					<a href="#tabs-3" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecords&credit_id=${creditMap.ID }&showFlag=2'">过往记录</a>
				</li>
				<li>
					<a href="#tabs-4" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getCreditVouchers&credit_id=${creditMap.ID }&showFlag=3'">担保人信息</a>
				</li>
				<li>
					<a href="#tabs-5" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.createCreditPaylist&credit_id=${creditMap.ID }&showFlag=4&word=up'">租金测算</a>
				</li>
				<li>
						<c:if test="${creditMap.CUST_TYPE eq 1 }">
							<a href="#tabs-6" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCorpReports&credit_id=${creditMap.ID }&showFlag=5&showStatus=2'">财务报表(乙式)</a>
						</c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }">
							<a href="#" >财务报表(乙式)</a>
						</c:if>
				</li> 
				<li>
					<a href="#tabs-7" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.getIndustrialAnalyse&credit_id=${creditMap.ID }&showFlag=6&word=up'" style="cursor: pointer;">产业分析(甲式)</a>
				</li> 
			</ul> 
			
			<div id="tabs-1">
					<%@ include file="creditSchemeCreate.jsp"%>
					<br/>
			</div>
			<div id="tabs-2">
					<%@ include file="creditCorpInfoCreate.jsp"%>
					<br/>
			</div> 
			<div id="tabs-6">
				<c:if test="${creditMap.CUST_TYPE eq 1 }">
					<%@ include file="corpReport.jsp"%>
					<br/> 
			    </c:if>	
			</div>
			<div id="tabs-3">
					<%@ include file="creditPriorRecordsCreate.jsp"%>
					<br/>
			</div>
			<div id="tabs-4">
					<%@ include file="creditVoucherCreate.jsp"%>
					<br/>
			</div>
			<div id="tabs-7">
					<%@ include file="industrialAnalyse.jsp"%>
					<br/>
			</div>
			<div id="tabs-5">
					<%@ include file="creditPaylist.jsp"%>
					<br/>
			</div>
				</div>
				</div>
				</div>
				</td>
				</tr>
			</table>
	</body>
</html>
