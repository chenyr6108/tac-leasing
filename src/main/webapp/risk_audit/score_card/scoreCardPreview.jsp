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
  	$(function (){
  	});
  	
  	function showScoreCard(){
  		var url = "${ctx }";
  		var scoreCard = $("#scoreCard").val();
		window.parent.openNewTab(url,"riskAudit.showScoreCardForCurrent&scoreCard=" + scoreCard + "&scoreCardCode=" + $("#scoreCardCode").val(), "评分表");
  	}
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="riskAudit.riskScoreCardSettingPage" />
<input type="hidden" id="rating_type" name="rating_type" value="${rating_type_search }" />
<input type="hidden" id="subject_id" name="subject_id" value="${subject_id }" />
<input type="hidden" id="status_update" name="status" />
<input type="hidden" id="id_update" name="id" />
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评分表</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
<div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv" style="width: 100%;">
		<c:if test="${mode eq 'use' }">
			<input type="button" value="查看结果" onclick="showScoreCard();" class="panel_button"/>
			<%@ include file="scoreCard.jsp" %>
		</c:if>
		<c:if test="${mode eq 'show' }">
			<%@ include file="scoreCardShow.jsp" %>
		</c:if>
		
	</div>
</div>
</div>
</form>
</body>
</html>		