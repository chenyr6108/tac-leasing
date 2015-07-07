<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>添加区域节点</title>
<%@ include file="/common/import.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sys/area/css/tab.css"/>
<script type="text/javascript" src="../../common/js/jquery-1.3.2.js"></script>
<script type="text/javascript">
function modifyRegion() {
	
	
	if (document.regionForm.name.value == "") {
		alert("请输入区域名称!");
		return;
	}
	if (document.regionForm.lesseearea.value=="") {
		alert('区域号不能为空!');
		return;
	}
			
	document.regionForm.method = "post";
	document.regionForm.action = "${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=area.updateArea&id="
		+<%=request.getParameter("id")%>;
	document.regionForm.submit();
}

function goBack() {
	window.self.location = "";
}
</script>	
</head>	
<body >
<form name="regionForm" id="regionForm" method="post" action="">
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;您当前的位置：<c:out value="${result.NAME }" default="所有区域"/>添加区域区域节点</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
                  <tr class="ui-widget-content jqgrow ui-row-ltr">
                        <td width="13%">区域名称：</td>
                        <td width="37%"><input type="text" name="name" id="textfield5" style="width:200px" value="${result.NAME }"/></td>
                        <td width="9%">区号：</td>
                        <td width="41%"><input type="text" name="lesseearea" id="textfield6" style="width:200px" value="${result.LESSEEAREA}" /></td>
                      </tr>
                      <tr class="ui-widget-content jqgrow ui-row-ltr">
                        <td>区域简称：</td>
                        <td><input type="text" name="desc_name" id="textfield2" style="width:200px" value="${result.DESC_NAME }"/></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                   	<tr>
                        <td align="center" colspan="4"><input name="" type="button" value="修&nbsp;改" class="ui-state-default ui-corner-all" onClick="modifyRegion()" />&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" value="重&nbsp;置"  class="ui-state-default ui-corner-all" />&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="button" value="返&nbsp回"  class="ui-state-default ui-corner-all" onclick="javascript:history.back(-1);"/></td>
                      </tr>
                    </table>
                   </div>
                   </div>
                   </div>
 </form>
</body>
 



