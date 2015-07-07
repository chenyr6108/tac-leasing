<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
<script type="text/javascript">

function expand(FIIN_ID){	
    $("#pactAffix"+FIIN_ID).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=decompose.queryFileUpMore&FIIN_ID=" + FIIN_ID);
    });
}
</script>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
				选项
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>水单附件</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>分解单状态</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款时间</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款户名</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款账号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>虚拟账号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>分解此来款之客户</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>凭证种类</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款金额</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>制单人</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>制单时间</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>分解单编号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>操作</strong>
			</th>
		</tr>
		<c:forEach items="${dw.rs}" var="checkDecompose" varStatus="status">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;"><input type="checkbox" name="item_num" value=""></td>
			<td style="text-align: center;" <c:if test="${checkDecompose.QTY >0 }">onclick="expand('${checkDecompose.FIIN_ID}');"</c:if>>&nbsp;<c:if test="${checkDecompose.QTY >0 }"><img src="${ctx }/images/attach.jpg" title="已有水单上传" style="cursor: pointer;">${checkDecompose.QTY }份</c:if></td>
			<td style="text-align: center;"><c:choose><c:when test="${checkDecompose.DECOMPOSE_STATUS eq 1}"><img src="${ctx }/images/u617.gif"></c:when><c:when test="${checkDecompose.DECOMPOSE_STATUS eq 4}"><img src="${ctx }/images/u608.gif"></c:when><c:when test="${checkDecompose.DECOMPOSE_STATUS eq 5}"><img src="${ctx }/images/u611.gif"></c:when></c:choose></td>
			<td style="text-align: center;">${checkDecompose.OPPOSING_DATE }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.OPPOSING_UNIT }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.OPPOSING_BANKNO }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.VIRTUAL_CODE }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.DEPOSE_CUSTOMER }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.OPPOSING_TYPE }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${checkDecompose.INCOME_MONEY }" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.DECOMPOSE_NAME}&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.DECOMPOSE_DATE }&nbsp;</td>
			<td style="text-align: center;">${checkDecompose.FIIN_ID }&nbsp;</td>
			<td style="text-align: center;"><a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=2&select_income_id=${checkDecompose.FIIN_ID }">查看</a></td>
		</tr>
				<!-- Add by XUWEI 2013 10-11 查看上传水单 -->
		<tr>
			<td style="text-align: center;" colspan="12"  align="center">
				<div id="pactAffix${checkDecompose.FIIN_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</td>											
		</tr>
		<!-- Add by XUWEI 2013 10-11 查看上传水单 -->
		<tr>
			<td style="text-align: center;" colspan="12" align="center">
				<div id="pactAffix_${checkDecompose.FIIN_ID}" align="center"
					style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</td>
		</tr>
		</c:forEach>
	</table>