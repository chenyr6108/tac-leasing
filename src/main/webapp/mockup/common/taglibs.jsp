<%
    pageContext.setAttribute("ctx", request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx }/common/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="${ctx }/common/js/date.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/jquery-ui-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/ajax.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/pagenav.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/plugins/bean.jquery.superdialog.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/plugins/jquery.bgiframe.min.js"></script>

<link rel="stylesheet" href="${ctx }/script/search.css" rel="stylesheet"/>
<link type="text/css" href="${ctx }/resources/jquery/plugins/jq-grid/ui.jqgrid.css" rel="stylesheet"></link>
<link type="text/css" href="${ctx }/resources/jquery/themes/redmond/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<style type="text/css">
	* {
		font-size: 12px;
	}
	
	#main {
		text-align: left;
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
</style>	 