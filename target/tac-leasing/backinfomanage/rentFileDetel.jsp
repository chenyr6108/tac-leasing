<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>

			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;<font color="red">*</font>合同资料：必须上传但还没有上传的资料</span>
						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title" width="80%">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >资料名称</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >合同类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >必填项</th>
							</tr>
							<c:forEach items="${contractDetil }" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="cursor: pointer;text-align: center;">${status.count }</td>
									<td style="text-align: center;">${item.FILE_NAME }&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.FILE_CONTRACT_TYPE eq 1}">一般合同&nbsp;</c:if><c:if test="${item.FILE_CONTRACT_TYPE eq 2}">委托合同&nbsp;</c:if>&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.STATE eq 0}">否&nbsp;</c:if><c:if test="${item.STATE eq 1}">是&nbsp;</c:if>&nbsp;</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					
					
					
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;已经上传的资料</span>
						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title" width="80%">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >资料名称</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >合同类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >必填项</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >级别</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >附件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">备注</th>
							</tr>
							<c:forEach items="${fileAll }" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="cursor: pointer;text-align: center;">${status.count }</td>
									<td style="text-align: center;">${item.FILE_NAME}&nbsp;</td>
									<td style="text-align: center;">${item.WANT_COUNT}&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.FILE_CONTRACT_TYPE eq 1}">一般合同&nbsp;</c:if><c:if test="${item.FILE_CONTRACT_TYPE eq 2}">委托合同&nbsp;</c:if>&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.STATE eq 0}">否&nbsp;</c:if><c:if test="${item.STATE eq 1}">是&nbsp;</c:if>&nbsp;</td>
									<td style="text-align: center;">${item.LEVEL_NUM }&nbsp;</td>	
									<td style="text-align: center;">${item.FILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYFILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.FILECOUNT}&nbsp;</td>
									<td style="text-align: center;">${item.MEMO}&nbsp;</td>
										
								</tr>
							</c:forEach>
						</table>
					</div>

				</div>
			</div>
			