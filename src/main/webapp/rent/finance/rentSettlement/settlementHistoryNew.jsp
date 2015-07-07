<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
	#showDetail:hover { color:red;}
</style>
<script type="text/javascript">
	function expand1(id,recpId){
		window.location = '../servlet/defaultDispatcher?__action=rentFinanceCommand.viewSettlementDetail&recpId='+recpId+'&id='+id+'&showOnly=Y';
	}
</script>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 85%;">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: center;"><strong>审批流程状态<span style="color:red;font-weight:bold;">(红色代表正在审核)</span></strong></td>
						<td style="background-color: #e8e8e8;text-align: center;"><strong>操作</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left; padding-left:10px;">
						<c:if test="${result == null }">无</c:if>
						<c:if test="${result != null }">
							<c:forEach items="${dataType }" var="d">
								<c:if test="${d.CODE == 90 && (result.totalPrice - result.totalPayPrice) > 500}">
									<span <c:if test="${d.CODE eq result.stateCode }">style="color:red;font-weight:bold;"</c:if>>${d.FLAG }</span> -->
								</c:if>
								<c:if test="${d.CODE == 60 && (result.totalPrice - result.totalPayPrice) > 500}">
									<span <c:if test="${d.CODE eq result.stateCode }">style="color:red;font-weight:bold;"</c:if>>${d.FLAG }</span> -->
								</c:if>
								<c:if test="${d.CODE != 60 && d.CODE != 90 }">
									<span <c:if test="${d.CODE eq result.stateCode }">style="color:red;font-weight:bold;"</c:if>>${d.FLAG }</span> -->
								</c:if>
							</c:forEach>结束
						</c:if>
						&nbsp;</td>
						<td style="text-align: center;">
							<span id="showDetail" style="cursor: pointer;" onclick="expand1('${result.id}','${result.recpId}');">查看详细</span>
						</td>
					</tr>
			</table>
		</div>
	</div>
</div>
