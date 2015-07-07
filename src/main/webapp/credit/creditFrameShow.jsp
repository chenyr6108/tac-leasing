<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>

		<title>现场调查报告查看</title> 
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css"> 
		<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs").tabs();
			$("#tabs").tabs('select',${showFlag});
			saveDataSession('creditSubmitForUU', '${creditMap.ID }', true);
		});
		
			acceptProject = function (){
			 var form = document.projectForm;
	    	 if (blank(form.memo, '审核意见')) {
	   	        return false;
	   	     }
			$("input[name='__action']").val("creditReport.examineCredit");
			$("#approveButton").attr("disabled",true);
			$("#disapproveButton").attr("disabled",true);
			$("#projectForm").submit();
			}
			receptProject = function () {
			 var form = document.projectForm;
	    	 if (blank(form.memo, '审核意见')) {
	   	        return false;
	   	     }
			$("input[name='__action']").val("creditReport.examineCredit2");	
			$("#approveButton").attr("disabled",true);
			$("#disapproveButton").attr("disabled",true);
			$("#projectForm").submit();
			}
			
	function ex(id){
            $("#memos").toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=creditReport.memos&credit_id=" + id );
        });
}
	function showRiskLevel(credit_id){
		var url = "${ctx }/servlet/defaultDispatcher";
		var param = {__action : "riskAudit.getRiskLevel", "credit_id" : credit_id};
		$.getJSON(url, param, function (data){
			if(data != null){
				alert("权限别：“" + data.riskLevel + "”。\n" + "说明：" + data.riskLevelMsg);
			}
		});
	}
	
	
    </script>

	</head>
	<body>
	<table width="1100px;" align="center">
				<tr>
					<td>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告查看
	   			<c:if test="${creditMap.VIP_FLAG == 1 }">
					（绿色通道）
				</c:if>
	   		</span>
	   	</div>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人姓名：${creditMap.CUST_NAME }</td>
					<td>客户编号：${creditMap.CUST_CODE }</td>
					<td>办事处主管：${creditMap.CLERK_NAME }</td>
					<td>客户经理：${creditMap.SENSOR_NAME }</td>
					<td>公司代号：${creditMap.COMPANY }</td>
					<td>客户来源：${creditMap.CUSTOMER_COME }</td>
					<c:if test="${!empty creditMap.LINK_NAME }">
						<td>供应商联系人：${creditMap.LINK_NAME}(${creditMap.LINK_MOBILE})</td>
					</c:if>
					<c:if test="${empty creditMap.LINK_NAME }">
						<td>供应商联系人：无</td>
					</c:if>
				</tr>
			</table>
		<div id="tabs">
			<ul>
				<li>
					<a href="#tabs-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${creditMap.ID }&showFlag=0&examineFlag=${examineFlag}'">租赁方案</a>
				</li>
				<li>
					<a href="#tabs-2" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditCustomerCorp.selectCreditCustomerCorpForShow&credit_id=${creditMap.ID }&showFlag=1&examineFlag=${examineFlag}'">公司沿革</a>
				</li>
				<li>
					<a href="#tabs-3" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&showFlag=2&examineFlag=${examineFlag}'">过往记录</a>
				</li>
				<li>
				<a href="#tabs-4" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getCreditVouchersShow&credit_id=${creditMap.ID }&showFlag=3&examineFlag=${examineFlag}'">担保人信息</a> 
				</li>
				<li>
					<a href="#tabs-5" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.showCreditPaylist&credit_id=${creditMap.ID }&showFlag=4&examineFlag=${examineFlag}&word=show'">租金测算</a>
				</li>
				<li>
						<c:if test="${creditMap.CUST_TYPE eq 1 }">
							<a href="#tabs-6" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCorpReportsForShow&credit_id=${creditMap.ID }&showFlag=5&showStatus=1&examineFlag=${examineFlag}'">财务报表(乙式)</a>
						</c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }">
							<a href="#" >财务报表(乙式)</a>
						</c:if>
					</li>
				<li>
					<a href="#tabs-7" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPaylistService.getIndustrialAnalyse&credit_id=${creditMap.ID }&showFlag=6&examineFlag=${examineFlag}&word=show'" style="cursor: pointer;">产业分析(甲式)</a>
				</li>
			</ul>
			<div id="tabs-1">
					<%@ include file="creditSchemeShow.jsp"%> 
			</div>
			<div id="tabs-2"> 
				<%@ include file="creditCorpInfoShow.jsp"%> 
			</div> 
			<div id="tabs-6">
				<c:if test="${creditMap.CUST_TYPE eq 1 }">
					<%@ include file="corpReport.jsp"%>
					<br/> 
			    </c:if>	
			</div>
			<div id="tabs-3">
					<%@ include file="creditPriorRecordsShow.jsp"%> 
			</div>
			<div id="tabs-4">
			 	<%@ include file="creditVoucherShow.jsp"%> 
			</div>
			<div id="tabs-7">
					<%@ include file="industrialAnalyse.jsp"%>
					<br/>
			</div>
			<div id="tabs-5">
				<!-- Modify by Michael 2012 1/5 查看时不重新计算只查看,将文件creditPaylist.jsp改为creditPaylistShow.jsp  -->
				 <%@ include file="creditPaylistShow.jsp"%>  
				
			</div>
		</div>
		
          <c:if test="${examineFlag eq 1}">
          	<button type="button" onclick="showRiskLevel('${creditMap.ID }')" class="panel_button">测算审查权限级别</button>
          	<form id="projectForm" name="projectForm" action="../servlet/defaultDispatcher" method="post" >
          	<input type="hidden" name="__action" value="">
          	<input type="hidden" name="credit_id" id="credit_id" value="${creditMap.ID }">
          	<input type="hidden" name="CR_DATE" value="<fmt:formatDate value="${creditCustomerCorpMap.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>">
          	<input type="hidden" name="LE_RZE" value="${schemeMap.LEASE_RZE }">
		<TABLE cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title dataSession">
				<tr class="ui-widget-content jqgrow ui-row-ltr"><td colspan="2" style="text-align: center;"><strong>审核意见</strong></td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">				
					<td  style="width: 100px;text-align: center;"><TEXTAREA NAME="memo" ROWS="4" COLS="110" id="memo"></TEXTAREA>&nbsp;</td>
				</tr>
		</TABLE> 
				<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">						
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="100%" colspan="6">&nbsp;<font color="#3300CC">最新审核意见:</font>${memoMap.MEMO}</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">   
					<td width="100%" colspan="6">&nbsp;【<font style="font-weight:bolder">审核人:</font> ${memoMap.NAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight:bolder">时间：</font><fmt:formatDate value="${memoMap.CREATE_TIME}" pattern="yyyy-MM-dd"/>】</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="100%" colspan="6">&nbsp;<a href="javascript:void(0);" onclick="ex(${creditMap.ID});">查看更多意见</a></td>
				</tr>	
				<tr>
					<td align="center" colspan="9">
						<div id="memos" align="center"
							style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
							<img src="${ctx }/images/loading.gif">
						</div>
					</td>
				</tr>
			</table>              
             	 <center>
             	 	<button type="button" onclick="getDataSession('creditSubmitForUU', '${creditMap.ID }');" class="panel_button">恢复最后修改</button>
					<button type="button" onclick="saveDataSession('creditSubmitForUU', '${creditMap.ID }', false);" class="panel_button">暂存</button>
             	 	<button type="button" onclick="acceptProject()" class="panel_button" id="approveButton">通过</button>
					<button type="button" onclick="receptProject()" class="panel_button" id="disapproveButton">驳回</button>
				</center>			
            </form>
             </c:if>
	</td>
				</tr>
			</table>
			
	</body>
</html>
