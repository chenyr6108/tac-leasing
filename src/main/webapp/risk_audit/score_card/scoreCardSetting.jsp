<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
	
<html>
<style type="text/css">
	#scoreCardTable th{text-align: left;}
	#scoreCardTable td{text-align: left;}
	#scoreCardTable span{color: red;}
</style>

<script type="text/javascript">
	$(function (){
		$("input[type='radio']").click(function (){
			updateSubtotal($(this).attr("name"));
			updateTotalScore();
		});
		$("input[type='checkbox']").click(function (){
			updateSubtotal($(this).attr("name"));
			updateTotalScore();
		});
		
		var scoreDefault = $("#scoreCard").val();
		var s = scoreDefault.split(",");
		for (var i = 0; i < s.length; i++) {
			$("input[type='checkbox'][value='" + s[i] + "']").each(function (){
				$(this).attr("checked", true);
			});
		}
		isCheckAll();
	});
	
	function checkAll(e){
		$("input[type='checkbox'][name='scoreCardCheckBox']").each(function (){
			$(this).attr("checked", $(e).attr("checked"));
		});
		isCheckAll();
		updateValue();
	}
	
	function isCheckAll(){
		var isCheckAll = true;
		var isCheckGroup = true;
		var option_id = null;
		var group_id = null;
		$("input[type='checkbox'][name='scoreCardCheckBox']").each(function (){
			if(!$(this).attr("checked")){
				isCheckAll = false;
			}
			isCheckGroup = true;
			option_id = $(this).attr("id");
			group_id = option_id.split("_")[0];
			$("input[type='checkbox'][name='scoreCardCheckBox'][id^='" + group_id + "_']").each(function (){
				if(!$(this).attr("checked")){
					isCheckGroup = false;
				}
			});
			$("#" + group_id).attr("checked", isCheckGroup);
			isCheckGroup = true;
			group_id = option_id.split("_")[0] + "_" + option_id.split("_")[1];
			$("input[type='checkbox'][name='scoreCardCheckBox'][id^='" + group_id + "_']").each(function (){
				if(!$(this).attr("checked")){
					isCheckGroup = false;
				}
			});
			$("#" + group_id).attr("checked", isCheckGroup);
		});
		$("#checkAllBox").attr("checked", isCheckAll);
		updateValue();
	}
	
	function checkGroup(thisId){
		$("input[type='checkbox'][id^='" + thisId + "_']").each(function (){
			$(this).attr("checked", $("#" + thisId).attr("checked"));
		});
		isCheckAll();
		updateValue();
	}
	
	function updateValue(){
		var scoreCard = "";
		$("input[type='checkbox'][name='scoreCardCheckBox']").each(function (){
			if($(this).attr("checked")){
				scoreCard += $(this).val() + ",";
			}
		});
		if (scoreCard.length > 0) {
			scoreCard = scoreCard.substring(0, scoreCard.length - 1);
		}
		$("#scoreCard").val(scoreCard);
	}
	
</script>

<c:set value="" var="temp"/>
<c:set value="" var="temp2"/>
<input type="hidden" name="scoreCard" id="scoreCard" value="${scoreCardValue }"/>
<table class="panel_table" id="scoreCardTable" style="width: 100%;">
	<tr>
		<th colspan="2" style="text-align: center;">評分項目</th>
		<th rowspan="2" style="width: 40%;text-align: center;">評分標準</th>
		<th rowspan="2" style="width: 10%;text-align: center;">
			是否启用<br/>
			<input type="checkbox" onclick="checkAll(this);" id="checkAllBox" />
		</th>
	</tr>
	<tr>
		<th style="width: 30%;text-align: center;">一级</th>
		<th style="width: 20%;text-align: center;">二级</th>
	</tr>
	<c:forEach items="${scoreCard.scoreCardList1 }" var="s1">
		<c:if test="${s1.option_count > 0 }">
			<tr <c:if test="${temp != s1.subject_id }">style="border-top: 2px solid #A6C9E2;"</c:if>>
				<c:if test="${temp != s1.subject_id }">
					<th rowspan="${s1.option_count + s1.nextLevelCount }" <c:if test="${s1.nextLevelCount == 0 }">colspan="2"</c:if> <c:if test="${not empty s1.subject_memo }">title="${s1.subject_memo }"</c:if>>
						${s1.subject }<input type="checkbox" onclick="checkGroup('${s1.subject_id }');" id="${s1.subject_id }" />
					</th>
				</c:if>
				<c:if test="${s1.nextLevelCount > 0 }">
					<th>
						&nbsp;
					</th>
				</c:if>
				<td <c:if test="${not empty s1.option_memo }">title="${s1.option_memo }"</c:if>>
					(<span>${s1.option_score }</span>分)&nbsp;
					<c:if test="${s1.option_type == 1 }">
						<input type="radio" disabled="disabled"/>
					</c:if>
					<c:if test="${s1.option_type == 2 }">
						<input type="checkbox" disabled="disabled" />
					</c:if>
					&nbsp;
					${s1.option_name }
				</td>
				<td style="text-align: center;">
					<input type="checkbox" name="scoreCardCheckBox" id="${s1.subject_id }_0_${s1.option_id }" onclick="isCheckAll();" value="${s1.option_id }" />
				</td>
			</tr>
			<c:set value="${s1.subject_id }" var="temp"/>
		</c:if>
		<c:if test="${s1.nextLevelCount > 0 }">
			<c:forEach items="${scoreCard.scoreCardList2 }" var="s2">
				<c:if test="${s2.up_id == s1.subject_id && s2.option_count > 0 }">
					<tr <c:if test="${temp2 != s2.subject_id }">style="border-top: 2px solid #A6C9E2;"</c:if>>
						<c:if test="${temp != s1.subject_id }">
							<th rowspan="${s1.option_count + s1.nextLevelCount }" <c:if test="${not empty s1.subject_memo }">title="${s1.subject_memo }"</c:if>>
								${s1.subject }<input type="checkbox" onclick="checkGroup('${s1.subject_id }');" id="${s1.subject_id }" />
							</th>
						</c:if>
						<c:if test="${temp2 != s2.subject_id }" >
							<th rowspan="${s2.option_count == 0 ? 1 : s2.option_count }" <c:if test="${not empty s2.subject_memo }">title="${s2.subject_memo }"</c:if>>
								${s2.subject }<input type="checkbox" onclick="checkGroup('${s1.subject_id }_${s2.subject_id }');" id="${s1.subject_id }_${s2.subject_id }" />
							</th>
						</c:if>
						<td <c:if test="${not empty s2.option_memo }">title="${s2.option_memo }"</c:if>>
							(<span>${s2.option_score }</span>分)&nbsp;
							<c:if test="${s2.option_type == 1 }">
								<input type="radio" disabled="disabled" />
							</c:if>
							<c:if test="${s2.option_type == 2 }">
								<input type="checkbox" disabled="disabled" />
							</c:if>
							&nbsp;
							${s2.option_name }
						</td>
						<td style="text-align: center;">
							<input type="checkbox" name="scoreCardCheckBox" id="${s1.subject_id }_${s2.subject_id }_${s1.option_id }" onclick="isCheckAll();" value="${s2.option_id }" />
						</td>
					</tr>
					<c:set value="${s1.subject_id }" var="temp"/>
					<c:set value="${s2.subject_id }" var="temp2"/>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
</table>
</html>
