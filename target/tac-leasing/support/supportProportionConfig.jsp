<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>利率配置</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	 
	<script src="${ctx }/support/js/prop.js" type="text/javascript"></script>
		 <script type="text/javascript">
		    $(function (){
				$("input[name='ADJUST_TIME']").datepicker($.datepicker.regional['zh-CN']);	
			});												
    	</script>		
 </head>
	<body>
		<form id="form1" name="form1" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" id="__action" value="supportCreditReportDelete.propManage"></input>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;利率配置</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	        <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
		<table id="gradeCon"  cellspacing="0" cellpadding="0" border="0" width="85%" class="ui-jqgrid-htable zc_grid_title" >
		<thead>
			 <tr height="26px" > 
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">时间</td>
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">半年</td> 
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">一年</td>
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">三年</td>
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">五年</td> 
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">五年以上</td>
				 <td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">备注</td>  
				 <td height="26px" style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head"><input class="ui-state-default ui-corner-all" height="26px"   type="button" value="新增一行" onclick="addNewG()"></td>    
			 </tr>	
		</thead>
		<tbody>
		<c:forEach items="${dw.rs}" var="item">	
			<tr>
				<input type="hidden" value="${item.ID}" name="ID">
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="<fmt:formatDate value="${item.ADJUST_TIME}" pattern="yyyy-MM-dd"/>" name="ADJUST_TIME" readonly="readonly"></td>
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="${item.SIX_MONTHS}"  name="SIX_MONTHS" style="width:60px;">%</td>
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="${item.ONE_YEAR}"    name="ONE_YEAR"   style="width:60px;" > %</td>
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="${item.ONE_THREE_YEARS}"  name="ONE_THREE_YEARS"  style="width:60px;">%</td>
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="${item.THREE_FIVE_YEARS}" name="THREE_FIVE_YEARS" style="width:60px;">%</td>
				<td style="text-align:center" height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" value="${item.OVER_FIVE_YEARS}"  name="OVER_FIVE_YEARS"  style="width:60px;">%</td>
				<td height="26px" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;&nbsp;<input type="text" style="width:250px;" value="${item.REMARK}"    name="REMARK"           style="width:100px;"></td>
				<td style="text-align:center" width="7%"  height="26px" class="ui-widget-content jqgrow ui-row-ltr"><input type="button"  style="text-align:right;"  class="ui-state-default ui-corner-all" name="delTrr"  value="删除此条"  onclick="delTr(this,'${item.ID}');"></td>
	         </tr>
			</c:forEach>
		</tbody>	 	
		</table>	
			<table cellspacing="0" cellpadding="0" border="0"  class="ui-jqgrid-htable zc_grid_title" >	
				<tr>
					<td colspan="4"height="26px" style="text-align:center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" height="26px" value="修改数据" class="ui-state-default ui-corner-all"  onclick="savegrade()"></td>
				</tr>
			</table>
			<%@ include file="/common/pageControl.jsp"%>
			</div>
			</div>
			</div>
			</form>					
	</body>
</html>
