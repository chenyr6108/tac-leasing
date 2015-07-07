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
		});							
    </script>
  	<script type="text/javascript" src="${ctx }/credit/js/creditVoucherAndDebt.js"></script>
  	<script type="text/javascript" src="${ctx }/credit/js/creditCustomerCorp.js"></script>
  	<script type="text/javascript" src="${ctx }/credit/js/creditPriorRecords.js"></script>
	<script src="${ctx }/credit/js/creditVoucher.js" type="text/javascript"></script>
	<script src="${ctx}/credit/js/idCard.js" type="text/javascript"></script>
	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
	<script type="text/javascript">
		// 弹出层(法人)
		function addVoucherCorp(){
			var credit_id = $("#credit_id").val();
			$('#addVoucherCorps').dialog({
				modal:true,
				autoOpen: false,
				width: 900				
			});
			$('#addVoucherCorps').dialog('open');
			$("#addVoucherCorp_sec").load("${ctx}/servlet/defaultDispatcher?__action=creditVoucher.gotoAddVoucherCorpForSupport&credit_id="+credit_id);
		}
		// 弹出层(自然人)
		function addVoucherNatu(){
			var credit_id = $("#credit_id").val();
			var showFlag = $("#showFlag").val();
			$('#addVoucherNatus').dialog({
				modal:true,
				autoOpen: false,
				width: 800				
			});
			$('#addVoucherNatus').dialog('open');
			$("#addVoucherNatu_sec").load("../servlet/defaultDispatcher?__action=creditVoucher.gotoAddVoucherNatu&credit_id="+credit_id+"&showFlag="+showFlag);
		} 
	</script>
	<c:forEach items="${corpList}" var="item" varStatus="status">
	<script type="text/javascript">
		var idCardMap;
		IdCard.onReady(function() { 
			idCardMap = {
				mateIdCard: new IdCard('LEGAL_ID_CARD_Crop'+${status.index }),
				idCard: new IdCard('LINK_ID_CARD_Crop'+${status.index })
			};
		});
	</script>
	<script type="text/javascript">
		$(function (){
			$("#INCORPORATING_DATE"+${status.index }).datepicker($.datepicker.regional['zh-CN']); 
		});
	</script>
	</c:forEach>
	<c:forEach items="${natuList}" var="item" varStatus="status">
	<script type="text/javascript">
		var idCardMap;
		IdCard.onReady(function() { 
			idCardMap = {
				mateIdCard: new IdCard('natu_idcard'+${status.index }),
				mateIdCard: new IdCard('natu_mate_idcard'+${status.index })
			};
		});
	</script>
	</c:forEach>
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
									<td>区域主管：${creditMap.CLERK_NAME }</td>
									<td>客户经理：${creditMap.SENSOR_NAME }</td>
									<td>客户来源：${creditMap.CUSTOMER_COME }</td>
								</tr>
							</table>
						</div> 
		
					<div id="tabs">
						<ul>
							<li>
								<a href="#tabs-4" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getCreditVouchersShowForSupport&credit_id=${creditMap.ID }&commit_flag=2'">担保人信息</a>
							</li>
						</ul> 
						<div id="tabs-4">
							<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
					         		<div class="zc_grid_body jqgrowleft">
					      		<div class="ui-state-default ui-jqgrid-hdiv ">
							<table width="100%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" align="left">
								        <strong>添加担保人(法人)</strong>
								   </td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
											相关操作：
										<img src="${ctx }/images/u100.gif">
										&nbsp;
										<a href="javaScript:void(0);" onclick="addVoucherCorp();">添加</a>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" align="left">
								        <strong>添加担保人(自然人)</strong>
								   </td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
											相关操作：
										<img src="${ctx }/images/u100.gif">
										&nbsp;
										<a href="javaScript:void(0);" onclick="addVoucherNatu();">添加</a>
									</td>
								</tr>
							</table>
							</div>
							</div>
							</div>
							<c:if test="${not empty corpList}">
								<%@ include file="creditVoucherCorpUp.jsp"%>
							</c:if>
							<br>
							<c:if test="${not empty natuList}">
								<%@ include file="creditVoucherNatuUp.jsp"%>
							</c:if>
							
							<!-- add -->
							<div id="addVoucherCorps" style="display: none;" title="担保人（法人）信息添加">
								<form action="../servlet/defaultDispatcher?__action=creditVoucher.addCreditCorpForSupport" method="post" id="addForm">
									<input type="hidden" name="credit_id" value="${prcd_id }">
									<input type="hidden" name="showFlag" value="${showFlag }">
									<input type="hidden" name="VOUCH_TYPE" value="1">
									<div id="addVoucherCorp_sec"></div>
									<center>
										<input type="button" class="ui-state-default ui-corner-all" value="增加" onclick="addCorp();"></input>
										<input type="button" class="ui-state-default ui-corner-all" onclick="closeDialog1();" value="关闭">
									</center>
								</form>
							</div>
							
							<div id="addVoucherNatus" style="display: none;" title="担保人（自然人）信息添加">
								<form action="../servlet/defaultDispatcher?__action=creditVoucher.addCreditNatuForSupport" method="post" id="natuForm">
									<input type="hidden" name="credit_id" value="${prcd_id }">
									<input type="hidden" name="showFlag" value="${showFlag }">
									<input type="hidden" name="VOUCH_TYPE" value="0">
									<div id="addVoucherNatu_sec"></div>
									<center>
										<input type="button" class="ui-state-default ui-corner-all" value="增加" onclick="addNatu();"></input>
										<input type="button" class="ui-state-default ui-corner-all" onclick="closeDialog2();" value="关闭">
									</center>
								</form>
							</div>
						</div>
					</div>
				</div>
				</div>
			</td>
		</tr>
	</table>
	</body>
</html>
