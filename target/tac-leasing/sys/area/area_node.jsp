<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%> 
<%@ include file="/common/retSessionValue.jsp"%> 
<head>
<title>区域管理</title>
<%@ include file="/common/import.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sys/area/css/tab.css"/>
<script type="text/javascript">
    
	function addRegion() {
		
		///window.location.href="${pageContext.request.contextPath}/sys/area/area_node_add.jsp?id=${result.ID}&areaName=${result.NAME}";
		window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=area.goAddRegion&id=${result.ID}&areaName=${result.NAME}";
	}
	function modifyRegion(id) {
		if (id != null && id!="") {
			window.location="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=area.queryAreaById&id=${result.ID}&select_update=Y";
		} else {
			alert("不允许修改!");
		}
		
	}
	function deleteRegion(id) {
		var msg = "您确定要删除区域吗？";
		if (id != null && id!="") {
			if (confirm(msg)) {
				window.location="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=area.deleteArea&id=${result.ID}";
			}
		} else {
			alert("不允许删除!");
		}
		
	}	
</script> 
</head>
<body >

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;您当前的位置：<c:out value="${result.NAME }" default="所有区域"/></span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
                  <tr class="ui-widget-content jqgrow ui-row-ltr">
                        <td width="13%">区域名称：</td>
                        <td width="37%"><input type="text" name="textfield5" id="textfield5" style="width:200px" readonly="readonly" value='<c:out value="${result.NAME }" default="所有区域"/>'/></td>
                        <td width="9%">区号：</td>
                        <td width="41%"><input type="text" name="textfield" id="textfield" style="width:200px" readonly="readonly" value='<c:out value="${result.LESSEEAREA }" default="000"/>'/></td>
                      </tr>
                      <tr class="ui-widget-content jqgrow ui-row-ltr">
                        <td>区域简称：</td>
                        <td><input type="text" name="textfield2" id="textfield2" style="width:200px" readonly="readonly" value='<c:out value="${result.DESC_NAME}" default=""/>'/></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                  </tr>
                   <tr>
	                  <td align="center" colspan="4">
	                  <input class="ui-state-default ui-corner-all" type="button" value="增加区域" onClick="addRegion()"/> 
	                  <input  type="button" value="修改区域"  class="ui-state-default ui-corner-all" onClick="modifyRegion('${result.ID}')" ${result.ID eq 1 ? "disabled" : ""}/> 
	                  <input  type="button" value="删除区域"  class="ui-state-default ui-corner-all" onClick="deleteRegion('${result.ID}')"  ${result.ID eq 1 ? "disabled" : ""}/></td>
          </tr>
        </table>
       </div>
				</div>
				</div>
</body>
 



