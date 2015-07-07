<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>介绍人管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript"> 
    	//网页内按下回车触发 搜索按钮 
		document.onkeydown=showEntey;
        function showEntey(event){    
	        if(event.keyCode==13)
	        {
	        	doSearch();                              
	        }
		} 
		function showSponsorCrop(name) { 
				
			location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.getSponsorByName&SPONSORNAME='+name;
		}
    </script>	

</head>
<body> 
	<form action="${ctx}/servlet/defaultDispatcher" id="form1"  method="post">
		<input type="hidden" name="__action" value="creditReport.getAllSponsor" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;介绍人管理</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="75">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				         关键字： <input type="text" id="content" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
				<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">介绍人</th>
				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">介绍个数</th>
				<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count}</td>
					<td style="text-align: center;">${result.SPONSOR}</td>
					<td style="text-align: center;">${result.COUNT}</td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="showSponsorCrop('${result.SPONSOR}')">查看</a></td>
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