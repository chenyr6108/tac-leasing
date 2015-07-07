<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>评分表设置</title>
  </head>
  <script type="text/javascript">
  	function saveScoreCard(){
  		if($.trim($("#scoreCard").val()).length == 0){
  			alert("请评分！");
  		} else {
  			$("#form1").submit();
  		}
  		
  	}
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="riskAudit.saveScoreCard" />
<input type="hidden" id="prc_id" name="prc_id" value="${prc_id }" />
<table style="width: 100%; background-color: white;">
	<tr>
		<td style="width: 60%; text-align: center;">
			<font style="font-size: 22px; font-weight: bold; color: #2E6E9E;">承租人信用评分表</font>
		</td>
		<td align="right" style="width: 40%;">
			<table class="panel_table" style="width: 350px;">
				<tr>
					<th>承租人：</th>
					<td>${cust_name }&nbsp;</td>
				</tr>
				<tr>
					<th>评分日期：</th>
					<td>${riskScore.scoreDate }&nbsp;</td>
				</tr>
				<tr>
					<th>信用评分：</th>
					<td>${riskScore.score }&nbsp;</td>
				</tr>
				<tr>
					<th>信用评等：</th>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<c:if test="${not empty msg }">
	<div style="text-align: left; font-weight: bold; color: red;">
		${msg }
	</div>
</c:if>
<c:if test="${not empty prc_id }">
	<%@ include file="score_card/scoreCard.jsp" %>
	<div style="text-align: center;">
		<input type="button" value="提交" class="panel_button" onclick="saveScoreCard();"/>
	</div>
</c:if>
<c:if test="${empty prc_id }">
	<%@ include file="score_card/scoreCardShow.jsp" %>
</c:if>
</form>
</body>
</html>		