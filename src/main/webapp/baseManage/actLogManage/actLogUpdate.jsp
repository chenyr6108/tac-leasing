<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>活动日志管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>	
		<script type="text/javascript" src="tab_data/tab.js"></script>
        <script type="text/javascript" src="${ctx }/baseManage/actLogManage/js/actLogManage.js"></script>
		<script type="text/javascript">
			$(function (){
				var STATEA=$("#stateee").val();	
				$("input[name=state][value="+STATEA+"]").attr("checked",true);	
			});
		</script>        
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">	
			<input type="hidden" name="__action" value="activityLogging.updateActLog">
			<input type="hidden" name="actlog_id" id="actlog_id" value="${actlog.ACTLOG_ID}" >
			<input type="hidden" name="stateee" id="stateee" value="${actlog.STATE}" >	
			<br/>
			<table width="1040" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;活动日志管理</span>
						</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
						<div class="zc_grid_body jqgrowleft">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
				  <td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>日志基本信息</strong></td>
			    </tr>
			  <tr>
									    <td rowspan="5" align="center" class="ui-state-default ui-th-ltr zc_grid_head">修<br>改<br>日<br>志</td>
									    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" >日志名称：</td>
									    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="actlog_name"  id="actlog_name" style="width:150px;" value="${actlog.ACTLOG_NAME}"></td>
									  </tr>
									  <tr>
									    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">日志类型：</td>
									    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
											<select name="actlog_type"  id="actlog_type" style="width: 150px">
												<c:forEach items="${dataType}" var="type" varStatus="status">
													<c:choose><c:when test="${type.CODE eq actlog.ACTLOG_TYPE}"><option value="${type.CODE}"selected>${type.FLAG}</option></c:when><c:otherwise><option value="${type.CODE}">${type.FLAG}</option></c:otherwise></c:choose>			                                          
			                                    </c:forEach>
	                                        </select>									    
									    </td>					    
									  </tr>
									  <tr>							  
									    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">级别：</td>
									    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
											<select name="level_num"  id="level_num" style="width: 150px">
												<c:forEach var="x" begin="1" end="20" step="1">
													<c:choose><c:when test="${actlog.LEVEL_NUM eq x}"><option value="${x}"selected>${x}</option></c:when><c:otherwise><option value="${x}">${x}</option></c:otherwise></c:choose>								
												</c:forEach> 		                                                                                	                                          
	                                        </select>                                               								    
									    </td>
									  </tr>
									</table>
				<div class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center ;">
					<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onClick="updateActLogInfor();">
					<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置">
				</div> 
				</div>
				</div>
				</td>
				</tr>
				</table>			
	</form>			
	</body></html>