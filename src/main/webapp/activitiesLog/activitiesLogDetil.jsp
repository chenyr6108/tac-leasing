<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function showLog(id)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.LogByDet&detlog='+id+"&num=0";
}

function updateLog(id,actilog_id)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.LogByDet&detlog='+id+"&num=1"+'&actilog_id='+actilog_id;
}

function deleteLog(id)
{
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.deleteLog&detlog='+id+"&num=1";
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
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									���
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									Ԥ������
								</td>
								<td style="width:13%" class="ui-state-default ui-th-ltr zc_grid_head">
									ʵ��ʵ����
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									����״��ϸ��
								</td>
								<td style="width:18%" class="ui-state-default ui-th-ltr zc_grid_head">
									����̸������
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									����̸��ְ��
								</td>
								<td style="width:11%" class="ui-state-default ui-th-ltr zc_grid_head">
									����
								</td>
							</tr>
								<c:forEach items="${dw}" var="list" varStatus="status">
									<tr  class="ui-widget-content ui-row-ltr">
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${status.index+1}&nbsp;
										</td>
										<td style="text-align: center;"    class="ui-widget-content ui-row-ltr" >
											${list.EXPECTEDDATE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.ACTUALDATE }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.ACTLOG_NAME }&nbsp;
										</td>
										<td style="text-align: center;"  class="ui-widget-content ui-row-ltr" >
											${list.VISITNAME }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${list.VISITTITLES }&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											<a href="javaScript:void(0);" onclick="showLog('${list.DETLOG_ID }')">�鿴</a>
											<a href="javaScript:void(0);" onclick="updateLog('${list.DETLOG_ID }','${list.ACTILOG_ID }')">�޸�</a>
											<a href="javaScript:void(0);" onclick="deleteLog('${list.DETLOG_ID }')">ɾ��</a>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>

				</div>
			</div>
	
