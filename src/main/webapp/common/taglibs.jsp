<%
    pageContext.setAttribute("ctx", request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib prefix="page" uri="/pagingtarglib" %>
<%@ taglib prefix="cs" uri="/creditstatuslib" %>
<%@ taglib prefix="chart" uri="/charttarglib" %>
<%@ taglib prefix="tac" uri="/tacTaglib" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx }/common/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="${ctx }/common/js/date.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/jquery-ui-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/plugins/bean.jquery.superdialog.js"></script>
<script type="text/javascript" src="${ctx }/common/js/pagingControl.js" ></script>
<script type="text/javascript" src="${ctx }/common/js/common.js" ></script>
<script type="text/javascript" src="${ctx }/common/js/toolTip.js"></script>
<script type="text/javascript" src="${ctx }/common/js/gridTable.js"></script>
<script type="text/javascript" src="${ctx }/common/js/ichart.1.1.min.js"></script>		
<link rel="stylesheet" href="${ctx }/common/css/gridTable.css"/>

<link rel="stylesheet" href="${ctx }/common/css/toolTipCss.css"/>

<link rel="stylesheet" href="${ctx }/script/search.css" rel="stylesheet"/>
<link type="text/css" href="${ctx }/resources/jquery/plugins/jq-grid/ui.jqgrid.css" rel="stylesheet"></link>
<link type="text/css" href="${ctx }/resources/jquery/themes/redmond/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<style type="text/css">
	* {
		font-size: 12px;
		font-family: Microsoft YaHei;
	}
	
	select {
		height: 19px;
	}
	
	#main {
		text-align: left;
	}
	
	input[type="button"] {
		cursor: pointer;
		font-family: Microsoft YaHei;
		min-height: 22px;
	}
	input[type="reset"] {
		cursor: pointer;
		font-family: Microsoft YaHei;
		min-height: 22px;
	}
	input[type="submit"] {
		cursor: pointer;
		font-family: Microsoft YaHei;
		min-height: 22px;
	}
	
	div.zc_grid {
		font-size: 12px;
	}
	
	table.zc_grid_title {
		width: 100%;
	}
	
	div.zc_grid_body {
		
	}
	
	th.zc_grid_head {
		text-align: center;
		border-bottom: 1px solid #C5DBEC;
	}
	
	.jqgrow table.zc_grid_table {
		width: 99%;
		margin: 5px 0.5%;
		border-left: 1px solid #C5DBEC;
	}
	
	.huise {
		background-color: #cccccc;
	}
	.kk { border: 1px solid #c5dbec; background: #fbf3f3 repeat-x; font-weight: bold; color: #2e6e9e; }
	
	.ui-autocomplete{
		max-height: 200px;
		overflow-y: scroll;
	}
	.drop-down-list{
		border-top: 1px solid #ABADB3;
		border-left: 1px solid #E2E3EA;
		border-right: 1px solid #E2E3EA;
		border-bottom: 1px solid #E3E9EF;
	}
	.drop-down-list:hover{
		border-top: 1px solid #5794BF;
		border-left: 1px solid #C5DAED;
		border-right: 1px solid #C5DAED;
		border-bottom: 1px solid #C7E2F1;
	}
	.drop-down-list *{
		border: 0px !important;
		background-color: white;
	}
</style>

<script>
	function showHelp(){
		var helpdivs = $("body").find("div#helpDocument");

		if(helpdivs.length > 0){
			return;
		}

		$.ajax({
			type:'post',
			url:'${ctx}/servlet/defaultDispatcher?__action=helpCommand.getHelpDocument',
			data:null,
			dataType:'json',
			success:function(dataBack){ 
				if(dataBack.content!=null){
					var htmlContent = dataBack.content;
					var $div = $("<div></div>").attr("id","helpDocument");
					$div.html(htmlContent);
					$("body").append($div);				
					$("#helpDocument").dialog({
						title:"help",
						height: 550,
						width:600,
						modal: false,
						position: ["right", "bottom"],
						close:function(){
							 $("#helpDocument").remove();
							 $( this ).dialog( "close" );					
						}
					});
				}else{
					var $div = $("<div></div>").attr("id","helpDocument");
					$("body").append($div);				
					$("#helpDocument").dialog({
						title:"help",
						height: 550,
						width:600,
						modal: false,
						position: ["right", "bottom"],
						close:function(){
							 $("#helpDocument").remove();
							 $( this ).dialog( "close" );					
						}
					});
				}
				
			}
		});	
	}
	$(function(){
		$("div.ui-jqgrid-titlebar.ui-widget-header.ui-corner-top.ui-helper-clearfix").each(function(i,obj){
			
			var second_id = '${__second_id}';
			if(second_id && second_id!=''){
				var helpSpans = $(this).find("span#helpSpan");
				if(helpSpans && helpSpans.length==0){
					var helpBtn = "<span id=\"helpSpan\" onclick =\"showHelp()\" class=\"ui-jqgrid-title\" style=\"line-height:30px;float:right;cursor:help;\"><font color=\"white\" style=\"font-size:30px\">?<font/>&nbsp;&nbsp;</span>";
					$(this).append(helpBtn);
				}
				return false;
			}

		});
	});
	
	function modifyHelpDocument(second_id){
		window.parent.openNewTab('${ctx}','helpCommand.editDocument&second_id='+second_id,'\u5e2e\u52a9\u6587\u6863');
	}
	
</script>
