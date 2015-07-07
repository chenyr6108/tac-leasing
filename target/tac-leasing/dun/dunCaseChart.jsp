<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>逾期案况图表</title>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" id="__action" value="dunCaseCommand.dunCaseChart">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;逾期状况统计图</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
           		<table border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			      <tr>
				      <td width="8">&nbsp;</td>
				      <td width="60" class="ss_o"></td>
				      <td width="60%" class="ss_t" style="font-family: 微软雅黑">
				          <%@ include file="../common/chartCondition.jsp"%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;办事处：
				          <select name="DEPT_NAME">
				          		<option value="ALL">全公司</option>
				          	<c:forEach var="item" items="${cmpyList }">
				          		<option value="${item.companyName }" <c:if test="${item.companyName eq deptName }">selected='selected'</c:if>>
				          			${item.companyName }
				          		</option>
				          	</c:forEach>
				          </select>
			          </td>
				      <td width="55" class="ss_th" valign="top">&nbsp;</td>
				      <td width="20%"><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
			      </tr>
			    </table>
           </div>
           <div class="ui-jqgrid-hdiv" style="background-color: white">
           <br>
           <font color="red">*</font>按周生成图表X轴取日期范围内每周周5的数据<br>
           <font color="red">*</font>按月生成图表X轴取日期范围内每月最后一天的数据<br>
           	<chart:chartTag chartResult="${chartResult1 }"/>
           	<chart:chartTag chartResult="${chartResult2 }"/>
           </div>
        </div>		
	</form>
	
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-14</p>
	<script>
	$(function () {
		var d=new Date();
	    var sec=d.getSeconds();
	    var min=d.getMinutes();
	    var hour=d.getHours();
	    if(sec<10) {
	    	sec="0"+sec;
	    }
	    if(min<10) {
	    	min="0"+min;
	    }
	    if(hour<10) {
	    	hour="0"+hour;
	    }
	    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate()-1)+"  "+"20:00之数据";
	});
	</script>
	
	
	
</body>
</html>