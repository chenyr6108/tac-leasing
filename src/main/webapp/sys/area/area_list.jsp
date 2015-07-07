<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>区域管理</title>
<script type="text/javascript">
	function display(id) {
		var divR = document.getElementById("div"+id);
		var imgR = document.getElementById("img"+id);
		var imR = document.getElementById("im"+id);
		 
		 divR.style.display=divR.style.display!="none"?"none":"block";
		 imgR.src=divR.style.display!="none"?"images/minus.gif":"images/plus.gif";
		 imR.src=divR.style.display!="none"?"images/openfold.gif":"images/closedfold.gif";
		 imR.alt=divR.style.display!="none"?"关闭":"展开";
	}
</script>
</head>
<%@ include file="tree_utils.jsp"%>


