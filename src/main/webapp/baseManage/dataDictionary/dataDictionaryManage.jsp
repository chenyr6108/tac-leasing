<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>数据字典</title>
</head>
<script type="text/javascript" src="${ctx}/baseManage/dataDictionary/js/dictionary.js"></script>
<script type="text/javascript"> 
	
	//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
		
        if(event.keyCode==13)
        {
               doSearch();  
                return false;                               
        }
 } 
</script>
<body>
	<form id="temp1" action="${ctx}/servlet/defaultDispatcher?__action=dataDictionary.getDataDetail" method="post">
		<input type="hidden" name="type" value="" id="temp1type"></input>
		
	</form>
	<form id="temp2" action="${ctx}/servlet/defaultDispatcher?__action=dataDictionary.deleteDictionary" method="post">
		<input type="hidden" name="type" value="" id="temp2t"></input>
	</form>
	<form id="form1" action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=dataDictionary.getAllDictionary" method="post" >
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;数据字典</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="75">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
		</div>
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr >
			<td><input type="button" onclick="addData();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加类型"></td>
			<td><%@ include file="/common/pageControlTop.jsp"%></td>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
				<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">类型</th>
				<th width="7%" class="ui-state-default ui-th-ltr zc_grid_head">分类总数</th>
				<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }&nbsp;</td>
					<td style="text-align: center;">${result.TYPE}</td>
					<td style="text-align: center;">${result.NUM }&nbsp;</td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="updateData('${result.TYPE}')">配置操作</a>       <a href="javascript:void(0)" onclick="deleteOne('${result.TYPE}')">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
	</form>
</body>
</html>