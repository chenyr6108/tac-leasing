<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>催收记录信息</title>
  </head>
  
  <body>
  <div style="margin: 1%;">
  <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
  <input type="hidden" id="__action" name="__action" value="dunDaily.dunDailyManage" />  
  	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;催收记录信息</span>
   	</div>
   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">	          	
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	  		<tr class="ui-jqgrid-labels">
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">承租人</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">通话时间</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">接电话人</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">练习电话</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">通话内容</th>	  			
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">反馈意见</th>
	  		</tr>
  			<tr> 				
  			</tr>					
  			<c:forEach items="${dunList}" var="dunList" varStatus="status">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">					
  					<td style="text-align: center;">${status.count }</td>
  					<td style="text-align: center;">${dunList.CUST_NAME }&nbsp;</td>
  					<td style="text-align: center;">${dunList.CALL_DATE }&nbsp;</td>
  					<td style="text-align: center;">${dunList.ANSWERPHONE_NAME }&nbsp;</td>
  					<td style="text-align: center;">${dunList.PHONE_NUMBER }&nbsp;</td>				
  					<td style="text-align: center;">${dunList.CALL_CONTENT }&nbsp;</td>
  					<td style="text-align: center;">${dunList.FEEDBACK_CONTENT }&nbsp;</td>
  					</tr>  							
  			</c:forEach>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<center>
	  	    <input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
		</center>	
		</table>
  		</div>
  		</div>
  		</div>
  		</form>
  		</div>
  </body>
</html>
