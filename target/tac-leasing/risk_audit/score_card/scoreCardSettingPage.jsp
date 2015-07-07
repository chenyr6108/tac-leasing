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
  		$("#contractType_search").addClass("panel_select").change(function (){
  			var url = "${ctx }";
  	  		var contractType = $("#contractType_search").val();
  			window.location.href = url + "/servlet/defaultDispatcher?__action=riskAudit.showScoreCardSetting&contractType=" + contractType;
  		});
  		
  	});
  	
  	function showScoreCardSetting(){
  		var url = "${ctx }";
  		var contractType = $("#contractType_search").val();
  		var scoreCard = $("#scoreCard").val();
		window.parent.openNewTab(url,"riskAudit.showScoreCardSetting&contractType=" + contractType + "&scoreCard=" + scoreCard, "评分表配置");
  	}
  	
  	function showScoreCard(){
  		var url = "${ctx }";
  		var contractType = $("#contractType_search").val();
  		var scoreCard = $("#scoreCard").val();
		window.parent.openNewTab(url,"riskAudit.saveAndshowScoreCard&contractType=" + contractType + "&scoreCard=" + scoreCard, "评分表");
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
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评分表配置</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
<div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv" style="width: 100%;">
		<tac:dropdownListTag name="contractType" id="contractType_search" item="${contractTypeSelection }" displayValue="${contractType }"/>
		<input type="button" value="保存并预览" onclick="showScoreCard();" class="panel_button"/>
		<%@ include file="scoreCardSetting.jsp" %>
		
	</div>
</div>
</div>
</form>
</body>
</html>		