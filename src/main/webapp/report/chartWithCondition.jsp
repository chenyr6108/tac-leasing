<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function () {
	$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
	$("#toDate").datepicker($.datepicker.regional['zh-CN']);
	//默认值是按天,取当前日的所在周
	/* var format="";
	if($("#flag").val()=="") {
		format="week";
	} else {
		format=$("#flag").val();
	}
	alert(format);
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=commonCommand.chartCondition&dateFormat='+format+"&fromDate="+$("#fromDate").val()+"&toDate="+$("#toDate").val(),
		dataType:'json',
		success: function(data) {
			$("input[name='dayList']").each(function() {
				$(this).remove();
			});
			for(var i=0;i<data.dayList.length;i++) {
				$("#dayList").append("<input name='dayList' value='"+data.dayList[i]+"'>");
			}
		}
	}); */
	
});	

function changeDateFormat() {
	
	//如果开始时间大于结束时间return false;
	var startTime=$("#fromDate").val();
	var start=new Date(startTime.replace("-", "/").replace("-", "/"));
	var endTime=$("#toDate").val();
	var end=new Date(endTime.replace("-", "/").replace("-", "/"));
	 	
	if(end<start) {
		alert("结束时间必须大于开始时间");
		$("#toDate").val($("#fromDate").val());
		return;
	}
	
/* 		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=commonCommand.chartCondition&dateFormat='+$("#dateFormat").val()+"&fromDate="+$("#fromDate").val()+"&toDate="+$("#toDate").val(),
			dataType:'json',
			success: function(data) {
				$("input[name='dayList']").each(function() {
					$(this).remove();
				});
				for(var i=0;i<data.dayList.length;i++) {
					$("#dayList").append("<input name='dayList' value='"+data.dayList[i]+"'>");
				}
				$("input[name='monthList']").each(function() {
					$(this).remove();
				});
				for(var i=0;i<data.monthList.length;i++) {
					$("#monthList").append("<input name='monthList' value='"+data.monthList[i]+"'>");
				}
				$("input[name='weekList']").each(function() {
					$(this).remove();
				});
				for(var i=0;i<data.weekList.length;i++) {
					$("#weekList").append("<input name='weekList' value='"+data.weekList[i]+"'>");
				}
				$("#fromDate").val(data.fromDate);
				$("#toDate").val(data.toDate);
			}
		}); */
}
</script>
<div style="font-family: 微软雅黑">
&nbsp;&nbsp;图表类型：
<select id="dateFormat" name="dateFormat" style="cursor: pointer;" onchange="changeDateFormat()">
	<option value="day" <c:if test="${dateFormat eq 'day' }">selected='selected'</c:if>>按天</option>
	<option value="week" <c:if test="${dateFormat eq 'week' }">selected='selected'</c:if>>按周</option>
	<option value="month" <c:if test="${dateFormat eq 'month' }">selected='selected'</c:if>>按月</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;开始时间：<input id="fromDate" name="fromDate" readonly="readonly" style="width: 75px;" onchange="changeDateFormat()" value="${fromDate }">
&nbsp;&nbsp;结束时间：<input id="toDate" name="toDate" readonly="readonly" style="width: 75px;" onchange="changeDateFormat()" value="${toDate }">
&nbsp;</div>
<div id="dayList" style="display: none;">
	<c:if test="${dayList !=null }">
		<c:forEach var="item" items="${dayList }">
			<input name="dayList" value="${item }">
		</c:forEach>
	</c:if>
</div>
<div id="weekList" style="display: none;">
	<c:if test="${weekList !=null }">
		<c:forEach var="item" items="${weekList }">
			<input name="weekList" value="${item }">
		</c:forEach>
	</c:if>
</div>
<div id="monthList" style="display: none;">
	<c:if test="${monthList !=null }">
		<c:forEach var="item" items="${monthList }">
			<input name="monthList" value="${item }">
		</c:forEach>
	</c:if>
</div>