<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head> 
		<title>担保人信息</title>
		<script src="../credit/js/creditVoucher.js" type="text/javascript"></script>
		<script src="${ctx}/credit/js/idCard.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		  <script type="text/javascript" src="${ctx }/credit/js/creditVoucherAndDebt.js"></script>
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
		<form action="../servlet/defaultDispatcher?__action=creditVoucher.addCreditCorp" method="post" id="addForm">
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
		<form action="../servlet/defaultDispatcher?__action=creditVoucher.addCreditNatu" method="post" id="natuForm">
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
	
	</body>
</html>
