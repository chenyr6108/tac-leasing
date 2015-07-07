<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
choiceRepayline = function (obj) {
	if(obj.value==0){
		
		$('#CHANGE_NUM').attr('disabled',true);
		
		var periodNum = $("input[name='PERIOD_NUM']");
		periodNum.attr('disabled',false);
		
		for (var i=0; i<periodNum.length; i++){
			if ($(periodNum[i]).attr("checked") == true){
				$("#item_monthPrice_"+periodNum[i].value).attr('disabled',false);
			}
		}
		obj.value=1;
	} else { 
		$('#CHANGE_NUM').attr('disabled',false);
		
		var periodNum = $("input[name='HIDDEN_PERIOD_NUM']");
		periodNum.attr('disabled',false);
		
		for (var i=0; i<periodNum.length; i++){
			$("#item_lock_"+periodNum[i].value).attr('disabled',true);
			$("#item_monthPrice_"+periodNum[i].value).attr('disabled',true);
		}
		obj.value=0;
	}
}

</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<b>融资租赁方案变更方式</b>
		</td>
	</tr>
	<tr>
		<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;是否重新配平</b>
		</td>
		<td width="85%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<input type="checkbox" value="${REPAYLINE eq 1 ? 1 : 0 }" <c:if test="${REPAYLINE eq 1 }">checked="checked"</c:if> name="REPAYLINE" onclick="choiceRepayline(this);">&nbsp;&nbsp;<font color="red">(选中为“是”,不选为“否”)</font>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
			<b>&nbsp;是否新增版本</b>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<input type="checkbox" value="${ADDVERSION eq 1 ? 1 : 0 }" <c:if test="${ADDVERSION eq 1 }">checked="checked"</c:if> name="ADDVERSION" onclick="if(this.value==0){this.value=1}else{this.value=0}">&nbsp;&nbsp;<font color="red">(选中为“是”,不选为“否”)</font>
		</td>
	</tr>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			<b>&nbsp;变更开始期次</b>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<select name="CHANGE_NUM" id="CHANGE_NUM" <c:if test="${REPAYLINE eq 1 }">disabled="disabled"</c:if>>
			<c:forEach items="${paylist.paylines }" var="item">
				<c:if test="${(item.REDUCE_OWN_PRICE+item.REDUCE_REN_PRICE+item.REDUCE_OTHER_PRICE+item.REDUCE_LOSS_PRICE) eq 0}">
					<option value="${item.PERIOD_NUM }" <c:if test="${CHANGE_NUM eq item.PERIOD_NUM }">selected="selected"</c:if> >第&nbsp;${item.PERIOD_NUM }&nbsp;期</option>
				</c:if>
			</c:forEach>
			</select>
		</td>
	</tr>
</table>