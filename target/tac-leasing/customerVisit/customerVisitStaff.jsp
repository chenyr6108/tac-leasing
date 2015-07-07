<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客户拜访计划</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
		function doQuery() {
			$("#form").submit();
		}
		
		function delCustVisit(id) {
			if(!confirm("确认删除此条么?")) {
				return;
			}
			location.href='${ctx }/servlet/defaultDispatcher?__action=customerVisitCommand.delete&id='+id+'&WEEK='+$("#WEEK").val();
		}
		
		function updateCustVisit(id) {
			$("#id").val(id);
			$("#__action").val("customerVisitCommand.update");
			$("#form").submit();
		}
		
		function back() {
			location.href='${ctx }/servlet/defaultDispatcher?__action=customerVisitCommand.query';
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="customerVisitCommand.query">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;客户拜访计划</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<c:if test="${NOT_DISPLAY_SEARCH_UPDATE_BUTTON !='Y' }">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">
									时间：
									<select id="WEEK" name="WEEK"><c:forEach var="item" items="${weekList}"><option value="${item.value }" <c:choose><c:when test="${WEEK == null }"><c:if test="${item.currentWeekFlag eq 'Y' }">selected="selected"</c:if></c:when><c:otherwise><c:if test="${item.value eq WEEK }">selected="selected"</c:if></c:otherwise></c:choose>>${item.value }</option></c:forEach></select>
								</td>
							</tr>
						</table></td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
					</td>
				</tr>
			</table>
		</c:if>
		<br><br><br>
		<c:if test="${NOT_DISPLAY_SEARCH_UPDATE_BUTTON =='Y' }">
			<input type="button" value="返回" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="back()"><br><br>
		</c:if>
		&nbsp;&nbsp;业务人员：${NAME }
		<br>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="1" cellpadding="0" border="0" style="width:100%;">
				  <c:forEach var="item" items="${weekList}">
				  	<c:choose>
					  	<c:when test="${WEEK == null }">
						  	<c:if test="${item.currentWeekFlag eq 'Y' }">
								<tr class="ui-state-default ui-jqgrid-hdiv">
									<td align="center" width="80px;">日期</td>
									<td align="center" width="150px;">${item.sunday }(周日)</td>
									<td align="center" width="150px;">${item.monday }(周一)</td>
									<td align="center" width="150px;">${item.tuesday }(周二)</td>		
									<td align="center" width="150px;">${item.wednesday }(周三)</td>
									<td align="center" width="150px;">${item.thursday }(周四)</td>
									<td align="center" width="150px;">${item.friday }(周五)</td>
									<td align="center" width="150px;">${item.saturday }(周六)</td>
								</tr>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${item.value eq WEEK }">
								<tr class="ui-state-default ui-jqgrid-hdiv">
									<td align="center" width="80px;">日期</td>
									<td align="center" width="150px;">${item.sunday }(周日)</td>
									<td align="center" width="150px;">${item.monday }(周一)</td>
									<td align="center" width="150px;">${item.tuesday }(周二)</td>		
									<td align="center" width="150px;">${item.wednesday }(周三)</td>
									<td align="center" width="150px;">${item.thursday }(周四)</td>
									<td align="center" width="150px;">${item.friday }(周五)</td>
									<td align="center" width="150px;">${item.saturday }(周六)</td>
								</tr>
							</c:if>
						</c:otherwise>
					</c:choose>
				  </c:forEach>
				  <c:if test="${resultList[0].date !=null }">
					  <tr>
					  	<td>
					  		<c:forEach var="item" items="${mondayList }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td align="center" width="80px;" height="60px;">对象</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td align="center" width="80px;" height="22px;">开拓方式</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td align="center" width="80px;" height="60px;">拜访地点</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td align="center" width="80px;" height="22px;">目的</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="40px;" align="center">预计拜访时段<br><br></td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="40px;" align="center">实际拜访时段<br><br></td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="22px;" align="center">主管陪同</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="22px;" align="center">重点记录</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="22px;" align="center">是否委托同仁</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="60px;" align="center">备注</td>
									</tr>
									<tr class="ui-state-default ui-jqgrid-hdiv">
										<td width="80px;" height="22px;" align="center">操作</td>
									</tr>
								</table>
								<br>
							</c:forEach>
					  	</td>
						<td><!-- 周日遍历 -->
						  	<c:forEach var="item" items="${sundayList }">
						  	<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
							</c:if>
							<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周一遍历 -->
						  	<c:forEach var="item" items="${mondayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周二遍历 -->
						  	<c:forEach var="item" items="${tuesdayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周三遍历 -->
						  	<c:forEach var="item" items="${wednesdayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周四遍历 -->
						  	<c:forEach var="item" items="${thursdayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周五遍历 -->
						  	<c:forEach var="item" items="${fridayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
										    <option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
						 <td><!-- 周六遍历 -->
						  	<c:forEach var="item" items="${saturdayList }">
						  		<c:if test="${item.holiday eq 'N' }">
						  		<c:if test="${item.id != null }">
						  		<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea id="OBJECT${item.id }" name="OBJECT${item.id }" rows="2" cols="19" readonly="readonly">${item.object }</textarea></td>
									</tr>
									<tr>  
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="EMPOLDER_WAY${item.id }" name="EMPOLDER_WAY${item.id }" disabled="disabled"><c:forEach var="empolderWayList" items="${empolderWayList }"><option <c:if test="${empolderWayList.CODE eq item.empolderWay }">selected="selected"</c:if> value="${empolderWayList.CODE }">${empolderWayList.FLAG }</option></c:forEach></select>&nbsp;</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">${item.provinceName }<br>${item.cityName }<br>${item.areaName }</td> 
									</tr>
									<tr>
										<td align="center" width="150px;" height="22px;" class="ui-widget-content jqgrow ui-row-ltr"><select id="INTENT${item.id }" name="INTENT${item.id }" disabled="disabled"><c:forEach var="intentList" items="${intentList }"><option <c:if test="${intentList.CODE eq item.intent }">selected="selected"</c:if> value="${intentList.CODE }">${intentList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" id="DATE${item.id }" name="DATE${item.id }" value="${item.date }">
										<select class="tb_return_t" id="EXPECT_FROM_HOUR${item.id }" name="EXPECT_FROM_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_FROM_MIN${item.id }" name="EXPECT_FROM_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="EXPECT_TO_HOUR${item.id }" name="EXPECT_TO_HOUR${item.id }" style="width:40px;" disabled="disabled">
											<option value="7" <c:if test="${item.expectToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.expectToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.expectToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.expectToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.expectToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.expectToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.expectToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.expectToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.expectToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.expectToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.expectToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.expectToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.expectToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.expectToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.expectToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.expectToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.expectToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="EXPECT_TO_MIN${item.id }" name="EXPECT_TO_MIN${item.id }" style="width:40px;" disabled="disabled">
											<option value="0" <c:if test="${item.expectToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.expectToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="40px;" class="ui-widget-content jqgrow ui-row-ltr">
										<select class="tb_return_t" id="ACTUAL_FROM_HOUR${item.id }" name="ACTUAL_FROM_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualFromHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualFromHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualFromHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualFromHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualFromHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualFromHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualFromHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualFromHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualFromHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualFromHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualFromHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualFromHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualFromHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualFromHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualFromHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualFromHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualFromHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_FROM_MIN${item.id }" name="ACTUAL_FROM_MIN${item.id}" style="width:40px;">
											<option value="0" <c:if test="${item.actualFromMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualFromMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>至<br>
									    <select class="tb_return_t" id="ACTUAL_TO_HOUR${item.id }" name="ACTUAL_TO_HOUR${item.id }" style="width:40px;">
											<option value="7" <c:if test="${item.actualToHour eq '07' }">selected="selected"</c:if>>07</option>
											<option value="8" <c:if test="${item.actualToHour eq '08' }">selected="selected"</c:if>>08</option>
											<option value="9" <c:if test="${item.actualToHour eq '09' }">selected="selected"</c:if>>09</option>
											<option value="10" <c:if test="${item.actualToHour eq '10' }">selected="selected"</c:if>>10</option>
											<option value="11" <c:if test="${item.actualToHour eq '11' }">selected="selected"</c:if>>11</option>
											<option value="12" <c:if test="${item.actualToHour eq '12' }">selected="selected"</c:if>>12</option>
											<option value="13" <c:if test="${item.actualToHour eq '13' }">selected="selected"</c:if>>13</option>
											<option value="14" <c:if test="${item.actualToHour eq '14' }">selected="selected"</c:if>>14</option>
											<option value="15" <c:if test="${item.actualToHour eq '15' }">selected="selected"</c:if>>15</option>
											<option value="16" <c:if test="${item.actualToHour eq '16' }">selected="selected"</c:if>>16</option>
											<option value="17" <c:if test="${item.actualToHour eq '17' }">selected="selected"</c:if>>17</option>
											<option value="18" <c:if test="${item.actualToHour eq '18' }">selected="selected"</c:if>>18</option>
											<option value="19" <c:if test="${item.actualToHour eq '19' }">selected="selected"</c:if>>19</option>
											<option value="20" <c:if test="${item.actualToHour eq '20' }">selected="selected"</c:if>>20</option>
											<option value="21" <c:if test="${item.actualToHour eq '21' }">selected="selected"</c:if>>21</option>
											<option value="22" <c:if test="${item.actualToHour eq '22' }">selected="selected"</c:if>>22</option>
											<option value="23" <c:if test="${item.actualToHour eq '23' }">selected="selected"</c:if>>23</option>
										</select>:
										<select class="tb_return_t" id="ACTUAL_TO_MIN${item.id }" name="ACTUAL_TO_MIN${item.id }" style="width:40px;">
											<option value="0" <c:if test="${item.actualToMin eq '00' }">selected="selected"</c:if>>00</option>
											<option value="30" <c:if test="${item.actualToMin eq '30' }">selected="selected"</c:if>>30</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="WITH_SUPERVISOR${item.id }" name="WITH_SUPERVISOR${item.id }" disabled="disabled"><option <c:if test="${item.withSupervisor eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.withSupervisor eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="IMPORTANT_RECORD${item.id }" name="IMPORTANT_RECORD${item.id }" disabled="disabled"><c:forEach var="importantRecordList" items="${importantRecordList }"><option <c:if test="${importantRecordList.CODE eq item.importantRecord }">selected="selected"</c:if> value="${importantRecordList.CODE }">${importantRecordList.FLAG }</option></c:forEach></select>&nbsp;</td>
									</tr>
									<tr>
										<td width="80px;" height="22px;" align="center" class="ui-widget-content jqgrow ui-row-ltr"><select id="NEED_COLLEAGUE${item.id }" name="NEED_COLLEAGUE${item.id }" disabled="disabled"><option <c:if test="${item.needColleague eq 'N'}">selected="selected"</c:if> value="N">否</option><option <c:if test="${item.needColleague eq 'Y'}">selected="selected"</c:if> value="Y">是</option></select>&nbsp;${item.employee }</td>
									</tr>
									<tr>
										<td align="center" width="150px;" height="60px;" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea id="REMARK${item.id }" name="REMARK${item.id }" rows="2" cols="19" readonly="readonly">${item.remark }</textarea>
										</td>
									</tr>
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="更新" name="update" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateCustVisit('${item.id}')">&nbsp;<!--input type="button" value="删除" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="delCustVisit('${item.id }')"--></td>
									</tr>
								</table>
								</c:if>
								<c:if test="${item.id == null }">
									<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;">&nbsp;</td>
									</tr>
								</table>
								</c:if>
								</c:if>
								<c:if test="${item.holiday eq 'Y' }">
								<table cellspacing="1" cellpadding="0" border="0" height="415px">
									<tr>
										<td align="center" width="150px;" class="ui-widget-content jqgrow ui-row-ltr" style="color:red;border-left-color: red;border-right-color: red;border-top-color: red;border-bottom-color: red;">请假&nbsp;<br>${item.holidayFromTime }至<br>${item.holidayToTime }&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
								</c:if>
								<br>
							</c:forEach>
						 </td>
					  </tr>
				  </c:if>
				</table>
			</div>
		</div>
	</form>
	<c:if test="${NOT_DISPLAY_SEARCH_UPDATE_BUTTON =='Y' }"><!-- 判断的作用是,如果从经理界面点了人名查询选中人的具体拜访记录这个变量=Y -->
	<script type="text/javascript">
		for(var i=0;i<$("input[name='update']").length;i++) {
			$("input[name='update']")[i].style.display="none";
		}
	</script>
	</c:if>
	<input value="${RESULT }" type="hidden" id="RESULT">
	<script type="text/javascript">
	if($("#RESULT").val()=='Y') {
		alert("更新成功!");
	} else if($("#RESULT").val()=='N') {
		alert("更新失败!");
	}
	</script>
</body>