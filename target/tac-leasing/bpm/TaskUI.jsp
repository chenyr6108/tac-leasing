<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${taskId != null && taskId ne ''}">
	<input type="hidden" id="BPM_TASK_HIDDEN_TASKID" value="${taskId }">
	<input type="hidden" id="BPM_TASK_HIDDEN_USERID" value="${userId }">
	<input type="hidden" id="BPM_TASK_HIDDEN_RESULT">
	<c:if test="${OPERATE_C eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_COMPLETE" value="完成" />
	</c:if>
	<c:if test="${OPERATE_A eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_ACCEPT" value="同意" />
	</c:if>
	<c:if test="${OPERATE_P eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_PASS" value="通过" />
	</c:if>
	<c:if test="${OPERATE_I eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_IGNORE" value="转发" />
	</c:if>
	<c:if test="${OPERATE_R eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_REJECT" value="驳回" />
	</c:if>
	<c:if test="${bpm_admin eq true}">
		<input type="button" class="ui-state-default" style="height: 30px;width: 90px" id="BPM_TASK_BUTTON_TRANSFER" value="代理设置" />
	<font color="red">(当前为流程管理员权限)</font></c:if>
	<div id="BPM_TASK_DIV_DIALOG" class="ui-widget" title="备注">
		<textarea id="BPM_TASK_TEXT_COMMENT" rows="5" cols="38" class="ui-widget-content"></textarea>
	</div>
	<div id="BPM_TASK_TRANSFER_DIV_DIALOG" class="ui-widget" title="代理设定">
		<input type="text" id="BPM_TASK_TEXT_DELEGATE_VALUE" style="width:0;height:0;border:0;visibility: hidden;" />
		<input type="text" id="BPM_TASK_TEXT_DELEGATE_LABEL" class="input-tags demo-default" style="z-index:1000;" value="">
	</div>
</c:if>