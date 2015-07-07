<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 业务外款 -->
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
				选项
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>状态</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款时间</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>对方户名</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>对方账号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款类型</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款金额</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>交易附言</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>待分解来源</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>分解单编号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>备注操作</strong>
			</th>
		</tr>
		<c:forEach items="${dw.rs}" var="income" varStatus="status">
			<tr	class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;"><input type="hidden" name="income_locked" id="income_locked${status }" value="${income.LOCKED}" /><input type="radio" name="decompose_status"
						id="decompose_status${status }"	value="${income.DECOMPOSE_STATUS }"></td>
				<td style="text-align: center;"><c:choose><c:when test="${income.DECOMPOSE_STATUS eq 1}"><img src="${ctx }/images/u617.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 2}"><img src="${ctx }/images/u620.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 3}"><img src="${ctx }/images/u614.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 4}"><img src="${ctx }/images/u608.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 5}"><img src="${ctx }/images/u611.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 6}"><img src="${ctx }/images/u622.gif"></c:when><c:when test="${income.DECOMPOSE_STATUS eq 7}"><img src="${ctx }/images/u604.gif"></c:when></c:choose><input type="hidden" name="income_id" id="income_id${status }" value="${income.FIIN_ID }" /><input type="hidden" name="opposing_type" id="opposing_type${status }" value="${income.OPPOSING_TYPE }" /></td>
				<td style="text-align: center;"><input type="hidden" name="opposing_date" id="opposing_date${status }" value="${income.OPPOSING_DATE }" />${income.OPPOSING_DATE }&nbsp;</td>
				<td style="text-align: center;">${income.OPPOSING_UNIT }<input type="hidden" name="opposing_name" id="opposing_name${status }" value="${income.OPPOSING_UNIT }" />&nbsp;</td>
				<td style="text-align: center;"><input type="hidden" name="bank_name" id="bank_name${status }" value="${income.BANK_NAME }" />${income.OPPOSING_BANKNO }&nbsp;</td>
				<td style="text-align: center;"><input type="hidden" name="opposing_type" id="opposing_type${status }" value="${income.OPPOSING_TYPE }" />${income.OPPOSING_TYPE }&nbsp;</td>
				<td style="text-align: right;"><input type="hidden" name="income_money" id="income_money${status }" value="${income.INCOME_MONEY }" /><fmt:formatNumber value="${income.INCOME_MONEY}" type="currency"></fmt:formatNumber>&nbsp;</td>
				<td style="text-align: center;"><input type="hidden" name="opposing_summary" id="opposing_summary${status }" value="${income.OPPOSING_POSTSCRIPT }" />${income.OPPOSING_POSTSCRIPT }&nbsp;</td>
				<td style="text-align: center;"><input type="hidden" name="left_id" id="left_id${status }" value="${income.LEFT_ID }" /><c:if test="${income.OPPOSING_TYPE eq '待分解来款'}"><a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${income.LEFT_ID }">${income.LEFT_ID }</a></c:if>&nbsp;</td>
				<td style="text-align: center;"><input type="hidden" name="fiin_id" id="fiin_id${status }" value="${income.FIIN_ID }" /><c:if test="${income.DECOMPOSE_STATUS eq 1||income.DECOMPOSE_STATUS eq 4||income.DECOMPOSE_STATUS eq 5}"><a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${income.FIIN_ID }">${income.FIIN_ID }</a></c:if>&nbsp;</td>
				<td style="text-align: center;"><c:choose><c:when test="${not empty income.OPERATE_ID}"><a href="javascript:showRemarkDiv('${income.FIIN_ID }','1','${income.OPERATE_REMARK }  --  ${income.OPERATE_NAME }  ${income.OPERATE_TIME }↓')">查看</a>&nbsp;<a href="javascript:showRemarkDiv('${income.FIIN_ID }','2','${income.OPERATE_REMARK }  --  ${income.OPERATE_NAME }  ${income.OPERATE_TIME }↓')">修改</a></c:when><c:otherwise><a href="javascript:showRemarkDiv('${income.FIIN_ID }','0','')">添加</a></c:otherwise></c:choose></td>
			</tr>
		</c:forEach>
	</table>