<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>逾期日志</title>
<script type="text/javascript">
$(function (){
	$("#datecreate").datepicker($.datepicker.regional['zh-CN']);
});


function doSearch(){
	document.form1.submit();
}
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 }
</script>
  </head>
  
  <body>
  <div style="margin: 1%;">
  <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
  <input type="hidden" id="__action" name="__action" value="dunDaily.dunDailyManage" />  
  	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;逾期日志</span>
   	</div>
   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		 <div class="zc_grid_body jqgrowleft">
  		<div class="ui-state-default ui-jqgrid-hdiv ">	          	
          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>最小逾期天数：</td>
				          <td><input type="text" name="sdun_day" value="${sdun_day}"  style=" width:80px;height:18px; font-size: 12px;"></td>
						  <td>最大逾期天数：</td>
					      <td><input type="text" name="bdun_day" value="${bdun_day }"  style=" width:80px;height:18px; font-size: 12px;"></td>
				          <td>创建日期：</td>
				          <td>
				  <input type="text" name="create_date" style=" width: 80px; height: 18px;" id="datecreate" value="${create_date }">
						  </td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	  		<tr class="ui-jqgrid-labels">
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">状态</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">承租人姓名</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">支付表号</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">应付日期</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">逾期金额</th>	  			
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">逾期天数</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">罚息</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">应付总额</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">创建日期</th>
	  			<th class="ui-state-default ui-th-ltr zc_grid_head">催收记录</th>
	  		</tr>
  			<tr> 				
  			</tr>					
  			<c:forEach items="${dunDailyList}" var="dunDailyList" varStatus="status">
  				<tr class="ui-widget-content jqgrow ui-row-ltr">					
  					<td style="text-align: center;">${status.count }</td>
  					<td style="text-align: center;"><c:if test="${dunDailyList.RECP_STATE eq 0}"><img src="${ctx }/images/u620.gif" title="逾期"></c:if><c:if test="${dunDailyList.RECP_STATE  eq 2}"><img src="${ctx }/images/u611.gif" title="转法务"></c:if></td>
  					<td style="text-align: center;">${dunDailyList.CUST_NAME }</td>
  					<td style="text-align: center;">${dunDailyList.RECP_CODE }</td>
  					<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${dunDailyList.SHOULD_PAYDATE }" /></td>				
  					<td style="text-align: right;"><fmt:formatNumber value="${dunDailyList.DUN_MONTHPRICE }" type="currency" /></td>
  					<td style="text-align: center;">${dunDailyList.DUN_DAY }</td>
  					<td style="text-align: right;"><fmt:formatNumber value="${dunDailyList.DUN_FINE }" type="currency" /></td>
  					<td style="text-align: right;"><fmt:formatNumber value="${dunDailyList.TOTAL }" type="currency" /></td>
  					<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${dunDailyList.CREATE_DATE }" /></td>							
  					<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunDaily.queryDunRecord&CUST_CODE=${dunDailyList.CUST_CODE }'">详细</a></td>
  				</tr>  							
  			</c:forEach>
  		</table>
  		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tbody>
				<tr>
					<td align="right">
						<img src="${ctx }/images/u620.gif">
						逾期
						<img src="${ctx }/images/u611.gif">
						转法务&nbsp;
					</td>
				</tr>
			</tbody>
	    </table>
  		</div>
  		</div>
  		</div>
  		</form>
  		</div>
  </body>
</html>
