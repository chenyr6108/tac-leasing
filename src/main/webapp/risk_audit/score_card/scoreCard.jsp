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
		if(scoreDefault != ""){
			var s = scoreDefault.split(",");
			for (var i = 0; i < s.length; i++) {
				$("input[type='radio'][value='" + s[i] + "']").each(function (){
					$(this).attr("checked", true);
					updateSubtotal($(this).attr("name"));
				});
				$("input[type='checkbox'][value='" + s[i] + "']").each(function (){
					$(this).attr("checked", true);
					updateSubtotal($(this).attr("name"));
				});
			}
			updateTotalScore();
		}
	});
	
	function updateSubtotal(name){
		var score = 0;
		$("input[name='" + name + "']").each(function() {
			if($(this).attr("checked")){
				score += parseInt($(this).attr("title"));
			}
		});
		$("#score_" + name).text(score);
	}
	
	function updateTotalScore(){
		var score = 0;
		$("span[id^='score_']").each(function (){
			score += parseInt($(this).text());
		});
		$("#total_score").text(score);
		var scoreCard = "";
		$("input[type='radio']").each(function (){
			if($(this).attr("checked")){
				scoreCard += $(this).val() + ",";
			}
		});
		$("input[type='checkbox']").each(function (){
			if($(this).attr("checked")){
				scoreCard += $(this).val() + ",";
			}
		});
		if(scoreCard.length > 1){
			$("#scoreCard").val(scoreCard.substring(0, scoreCard.length - 1));
			$("#score").val(score);
		}
	}
</script>

<c:set value="" var="temp"/>
<c:set value="" var="temp2"/>
<input type="hidden" name="score" id="score" />
<input type="hidden" name="scoreCardCode" id="scoreCardCode" value="${scoreCard.scoreCardCode }" />
<input type="hidden" name="scoreCard" id="scoreCard" value="${history_scoreCard }"/>
<table class="panel_table" id="scoreCardTable" style="width: 100%;">
	<tr>
		<th colspan="2" style="text-align: center;">評分項目</th>
		<th rowspan="2" style="width: 40%;text-align: center;">評分標準</th>
		<th rowspan="2" style="width: 10%;text-align: center;">評分</th>
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
						${s1.subject }
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
						<input type="radio" name="${s1.subject_id }" value="${s1.option_id }" title="${s1.option_score }" />
					</c:if>
					<c:if test="${s1.option_type == 2 }">
						<input type="checkbox" name="${s1.subject_id }" value="${s1.option_id }" title="${s1.option_score }" />
					</c:if>
					&nbsp;
					${s1.option_name }
				</td>
				<c:if test="${temp != s1.subject_id }">
					<td rowspan="${s1.option_count }">
						<span id="score_${s1.subject_id }">0</span>分
					</td>
				</c:if>
			</tr>
			<c:set value="${s1.subject_id }" var="temp"/>
		</c:if>
		<c:if test="${s1.option_count == 0 && s1.nextLevelCount == 0 }">
			<tr <c:if test="${temp != s1.subject_id }">style="border-top: 2px solid #A6C9E2;"</c:if>>
				<c:if test="${temp != s1.subject_id }">
					<th colspan="2">
						${s1.subject }
					</th>
				</c:if>
				<td>
					&nbsp;
				</td>
				<c:if test="${temp != s1.subject_id }">
					<td>
						&nbsp;
					</td>
				</c:if>
			</tr>
			<c:set value="${s1.subject_id }" var="temp"/>
		</c:if>
		<c:if test="${s1.nextLevelCount > 0 }">
			<c:forEach items="${scoreCard.scoreCardList2 }" var="s2">
				<c:if test="${s2.up_id == s1.subject_id && s2.option_count > 0 }">
					<tr <c:if test="${temp2 != s2.subject_id }">style="border-top: 2px solid #A6C9E2;"</c:if>>
						<c:if test="${temp != s1.subject_id }">
							<th rowspan="${s1.option_count + s1.nextLevelCount }" <c:if test="${not empty s1.subject_memo }">title="${s1.subject_memo }"</c:if>>
								${s1.subject }
							</th>
						</c:if>
						<c:if test="${temp2 != s2.subject_id }" >
							<th rowspan="${s2.option_count == 0 ? 1 : s2.option_count }" <c:if test="${not empty s2.subject_memo }">title="${s2.subject_memo }"</c:if>>
								${s2.subject }
							</th>
						</c:if>
						<td <c:if test="${not empty s2.option_memo }">title="${s2.option_memo }"</c:if>>
							(<span>${s2.option_score }</span>分)&nbsp;
							<c:if test="${s2.option_type == 1 }">
								<input type="radio" name="${s2.subject_id }" value="${s2.option_id }" title="${s2.option_score }" />
							</c:if>
							<c:if test="${s2.option_type == 2 }">
								<input type="checkbox" name="${s2.subject_id }" value="${s2.option_id }" title="${s2.option_score }" />
							</c:if>
							&nbsp;
							${s2.option_name }
						</td>
						<c:if test="${temp2 != s2.subject_id }">
							<td rowspan="${s2.option_count }">
								<span id="score_${s2.subject_id }">0</span>分
							</td>
						</c:if>
					</tr>
					<c:set value="${s1.subject_id }" var="temp"/>
					<c:set value="${s2.subject_id }" var="temp2"/>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
	<c:if test="${empty scoreCard.scoreCardList1 }">
		<tr style="border-top: 2px solid #A6C9E2;">
			<th colspan="4" style="text-align: center;">
				无评分表，请先进行配置！
			</th>
		</tr>
	</c:if>
	<tr style="border-top: 2px solid #A6C9E2;">
		<th colspan="3" style="text-align: right;">总分：</th>
		<td><span id="total_score">0</span>分</td>
	</tr>
</table>
</html>
