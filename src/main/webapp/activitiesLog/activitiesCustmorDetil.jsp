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
			else value='δ�ּ�'
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
									���
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									������
								</td>
								<td style="width:12%" class="ui-state-default ui-th-ltr zc_grid_head">
									�ͻ����
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									�������Ҫ
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									������r
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									�״ΰݷ���
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									����HAB�ּ�
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									�ϴ�HAB�ּ�
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									ҵ��״̬
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									ҵ��������Ա
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									����
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
											 ${list.CONTRACT_HAB_LOG == 1 ? 'H' : list.CONTRACT_HAB_LOG == 2 ? 'A' : list.CONTRACT_HAB_LOG == 3 ? 'B' : 'δ�ּ�' } 
											<!--  <input type="hidden" value="${list.CONTRACT_HAB_LOG}" id="before${list.ACTILOG_ID}">
											<select id="CONTRACT_HAB${list.ACTILOG_ID}" onchange="changeHAB('${list.ACTILOG_ID}')">
												<option value="0" <c:if test="${list.CONTRACT_HAB_LOG eq null or list.CONTRACT_HAB_LOG eq 0 }">selected="selected"</c:if>>δ�ּ�</option>
												<option value="1" <c:if test="${list.CONTRACT_HAB_LOG eq 1 }">selected="selected"</c:if>>H</option>
												<option value="2" <c:if test="${list.CONTRACT_HAB_LOG eq 2 }">selected="selected"</c:if>>A</option>
												<option value="3" <c:if test="${list.CONTRACT_HAB_LOG eq 3 }">selected="selected"</c:if>>B</option>
											</select>
											-->
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr">
											<!--  <span id="CONTRACT_HAB_BEFORE${list.ACTILOG_ID}">${list.CONTRACT_HAB_BEFORE_LOG == 1 ? 'H' : (list.CONTRACT_HAB_BEFORE_LOG == 2 ? 'A' : (list.CONTRACT_HAB_BEFORE_LOG == 3 ? 'B' : 'δ�ּ�')) }</span> -->
											<span>${list.CONTRACT_HAB_BEFORE_LOG == 1 ? 'H' : (list.CONTRACT_HAB_BEFORE_LOG == 2 ? 'A' : (list.CONTRACT_HAB_BEFORE_LOG == 3 ? 'B' : 'δ�ּ�')) }</span>
											<!--<select id="CONTRACT_HAB_BEFORE" name="CONTRACT_HAB_BEFORE">
												<option value="0" <c:if test="${list.CONTRACT_HAB_BEFORE eq null or list.CONTRACT_HAB_BEFORE eq 0 }">selected="selected"</c:if>>δ�ּ�</option>
												<option value="1" <c:if test="${list.CONTRACT_HAB_BEFORE eq 1 }">selected="selected"</c:if>>H</option>
												<option value="2" <c:if test="${list.CONTRACT_HAB_BEFORE eq 2 }">selected="selected"</c:if>>A</option>
												<option value="3" <c:if test="${list.CONTRACT_HAB_BEFORE eq 3 }">selected="selected"</c:if>>B</option>
											</select> -->
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											<c:if test="${list.STATE==0 }">δ����</c:if><c:if test="${list.STATE==1 }">����</c:if>
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											${list.NAME }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
										<c:if test="${list.STATE != -1 }">
											<a href="javaScript:void(0);" onclick="insertActitLog('${list.ACTILOG_ID }','${list.CUST_ID }')">�½���ϸ</a>
										</c:if>
											<a href="javaScript:void(0);" onclick="showActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">�鿴</a>
										<c:if test="${list.STATE != -1 }">
											<a href="javaScript:void(0);" onclick="updateActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">�޸�</a>
											<a href="javaScript:void(0);" onclick="deleteActitFiles('${list.ACTILOG_ID }','${list.CUST_ID }')">ɾ��</a>
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
	
