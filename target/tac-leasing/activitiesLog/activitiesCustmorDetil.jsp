<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function insertActitLog(id,custid)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.createLogShow&actilog='+id+'&cust_id='+custid+'&actilog_id='+id;
}

function showActitFiles(id,custid)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.showActitFiles&actilog_id='+id+"&num=0"+'&cust_id='+custid;
}

function updateActitFiles(id,custid)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.showActitFiles&actilog_id='+id+"&num=1"+'&cust_id='+custid;
}

function deleteActitFiles(id,custid)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.deleteFiles&actilog_id='+id+"&num=1"+'&cust_id='+custid;
}
function changeHAB(id,before)
{		
		var before=$("#before"+id).val();
		var now=$("#CONTRACT_HAB"+id).val();
		$.ajax({
			type: "POST",
			url: "../servlet/defaultDispatcher",
			data: "__action=activitiesLog.changeHAB&ACTILOG_ID="+id+"&CONTRACT_HAB_BEFORE="+before+"&CONTRACT_HAB="+now,
			dataType: "json",
			async: false,
			success: function(data){
			var value;
			if(before==1)value='H'
			else if(before==2)value='A'
			else if(before==3)value='B'
			else value='未分级'
			$("#CONTRACT_HAB_BEFORE"+id).html(value);
			$("#before"+id).val(now);
		}});
}

</script>
	
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">

						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title" width="80%">
							<tr class="ui-jqgrid-labels">
								<td style="width:5%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									报告编号
								</td>
								<td style="width:12%" class="ui-state-default ui-th-ltr zc_grid_head">
									客户编号
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									租赁物概要
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									案件狀況
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									首次拜访日
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									本次HAB分级
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									上次HAB分级
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									业务活动状态
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									业务输入人员
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</td>
							</tr>
								<c:forEach items="${dw}" var="list" varStatus="status">
									<tr  class="ui-widget-content ui-row-ltr">
											<td style="text-align: center;" class="ui-widget-content ui-row-ltr"  onClick="exactivitiesLogDetil('contractTr${list.ACTILOG_ID }','${list.ACTILOG_ID }','manage');"><img src="${ctx }/images/u608.gif" title="">&nbsp;
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											${list.CREDIT_CODE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.CUST_CODE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.PRODUCTSABOUT }&nbsp;
										</td>
										<td style="text-align: center;"  class="ui-widget-content ui-row-ltr" >
											${list.CASESTATE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.FIRSTVISITDATE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr">
											 ${list.CONTRACT_HAB_LOG == 1 ? 'H' : list.CONTRACT_HAB_LOG == 2 ? 'A' : list.CONTRACT_HAB_LOG == 3 ? 'B' : '未分级' } 
											<!--  <input type="hidden" value="${list.CONTRACT_HAB_LOG}" id="before${list.ACTILOG_ID}">
											<select id="CONTRACT_HAB${list.ACTILOG_ID}" onchange="changeHAB('${list.ACTILOG_ID}')">
												<option value="0" <c:if test="${list.CONTRACT_HAB_LOG eq null or list.CONTRACT_HAB_LOG eq 0 }">selected="selected"</c:if>>未分级</option>
												<option value="1" <c:if test="${list.CONTRACT_HAB_LOG eq 1 }">selected="selected"</c:if>>H</option>
												<option value="2" <c:if test="${list.CONTRACT_HAB_LOG eq 2 }">selected="selected"</c:if>>A</option>
												<option value="3" <c:if test="${list.CONTRACT_HAB_LOG eq 3 }">selected="selected"</c:if>>B</option>
											</select>
											-->
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr">
											<!--  <span id="CONTRACT_HAB_BEFORE${list.ACTILOG_ID}">${list.CONTRACT_HAB_BEFORE_LOG == 1 ? 'H' : (list.CONTRACT_HAB_BEFORE_LOG == 2 ? 'A' : (list.CONTRACT_HAB_BEFORE_LOG == 3 ? 'B' : '未分级')) }</span> -->
											<span>${list.CONTRACT_HAB_BEFORE_LOG == 1 ? 'H' : (list.CONTRACT_HAB_BEFORE_LOG == 2 ? 'A' : (list.CONTRACT_HAB_BEFORE_LOG == 3 ? 'B' : '未分级')) }</span>
											<!--<select id="CONTRACT_HAB_BEFORE" name="CONTRACT_HAB_BEFORE">
												<option value="0" <c:if test="${list.CONTRACT_HAB_BEFORE eq null or list.CONTRACT_HAB_BEFORE eq 0 }">selected="selected"</c:if>>未分级</option>
												<option value="1" <c:if test="${list.CONTRACT_HAB_BEFORE eq 1 }">selected="selected"</c:if>>H</option>
												<option value="2" <c:if test="${list.CONTRACT_HAB_BEFORE eq 2 }">selected="selected"</c:if>>A</option>
												<option value="3" <c:if test="${list.CONTRACT_HAB_BEFORE eq 3 }">selected="selected"</c:if>>B</option>
											</select> -->
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											<c:if test="${list.STATE==0 }">未结束</c:if><c:if test="${list.STATE==1 }">结束</c:if>
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											${list.NAME }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
										<c:if test="${list.STATE != -1 }">
											<a href="javaScript:void(0);" onclick="insertActitLog('${list.ACTILOG_ID }','${list.CUST_ID }')">新建明细</a>
										</c:if>
											<a href="javaScript:void(0);" onclick="showActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">查看</a>
										<c:if test="${list.STATE != -1 }">
											<a href="javaScript:void(0);" onclick="updateActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">修改</a>
											<a href="javaScript:void(0);" onclick="deleteActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">删除</a>
										</c:if>
										</td>
									</tr>
									<tr>
								<td align="center" colspan="11">
									<div id="contractTr${list.ACTILOG_ID }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
							</tr>
								</c:forEach>
						</table>
					</div>

				</div>
			</div>
	
