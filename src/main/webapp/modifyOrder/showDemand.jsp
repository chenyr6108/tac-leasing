<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/taglibs.jsp"%>
<title>资讯需求单</title>
<script type="text/javascript" src="${ctx }/common/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="${ctx }/mockup/import/jquery-1.4.2.js"></script>
<script type="text/javascript" src="${ctx }/resources/jquery/jquery-ui-1.8.1.min.js"></script>

<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<style type="text/css">    
	.connectedSortable { list-style-type:none; margin:0 0 10px 0; padding:0; border:1px solid #4297D7; min-width:120px; min-height:320px;}
	.connectedSortable li, .connectedSortable li { margin:1px 0 1px 0; padding:6px;  cursor:move; }
	.demandHead { background-color:#2E6EAF;}
	a:link { text-decoration:none;} 
	#btns a{padding:5px 8px; margin-left:10px; border:1px solid #9ccd3a; color:#FFFFFF; background:#6eac2c;}
	#btns a:hover{padding:5px 8px; margin-left:10px; border:1px solid #9ccd3a; color:#6eac2c; background:#FFFFFF;}
	#fixed{bottom:0; position:fixed; z-index:99; background-color:#E1EFFB; color:#FFFFFF; width:100%; height:46px;border:1px solid #A6C9E2;}
	table{margin-bottom:50px;}
</style>
<script type="text/javascript">
	//var $j = jQuery.noConflict(true);
		//用户
	var projects = eval("(" + '${users}' + ")");
	var options = {
		minChars : 1,
		max : 20,
		mustMatch: true,
		matchContains: true,
		formatItem : function(row, i, max) {
			var rs = row.name;
			if (row.email != null && row.email.length > 0) {
				rs += "【" + row.email + "】";
			}
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.email + " " + row.name;
		},
		formatResult : function(row) {
			return row.name;
		}
	};
	
	$(function (){
	 	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
		$("#PREDICT_DATE").datepicker({minDate: 0});
		$("#RELEASE_TIME").datepicker({minDate: 0});
		$("#save").click(function() { 
			if($("#content").val().trim()==''){
				alert('请填写意见！');
				$("#content").focus();
				return false;
			} else {
				$("#save").attr('disabled',true);
				$("#remarkForm").submit();
			}
		});
		/* $( "#connectedSortable" ).sortable({
		     cancel: ".ui-state-disabled"
		});*/
		$(".connectedSortable").sortable({
		      connectWith: ".connectedSortable",
		      opacity: 0.6,
	    	  items: "li:not(.ui-state-disabled)"
	    }).disableSelection();

		$("#newOpUserName").autocomplete(projects, options).result(function(event, data, formatted) {
			$('#newOpUser').val(data.id);
		});
		$("#newOpUserName").blur(function (e) {
			$('.ac_over').click();
		} );
		var urlParam = '${urlParam}';
		urlParam = urlParam.replace(/!/g,'&');
		$('#backToDemandList').attr('href','../servlet/defaultDispatcher?__action=modifyOrderCommand.getDemandOrder&' + urlParam);
		var opResultMessage = '${opResultMessage}';
		if(opResultMessage != ''){
			var isMyDemand = '${isMyDemand}';
			if(isMyDemand == "1"){
				opResultMessage += '<br>该资讯需求单下一步处理人仍然为您，如需留在此页继续审核，请点击“继续”按钮！';
				$('#opResultMessage').html(opResultMessage);
				$('#opResult').dialog({
					resizable: false,
				      modal: true,
				      buttons: {
				        "继续": function() {
				          $(this).dialog("close");
				        },
				        "返回列表":function(){
			        	 	window.location.href = '../servlet/defaultDispatcher?__action=modifyOrderCommand.getDemandOrder&' + urlParam;
				        }
				      }
				});
			} else {
				$('#opResultMessage').html(opResultMessage);
				$('#opResult').dialog({
					resizable: false,
				      modal: true,
				      buttons: {
				        "返回列表":function(){
			        	 	window.location.href = '../servlet/defaultDispatcher?__action=modifyOrderCommand.getDemandOrder&' + urlParam;
				        }
				      }
				});
			}
		};
	});
	
	//转移
	function devNewOpDivBtn(){
		if($('#newOpUser').val()==''){
			alert('请输入有效的处理人！');
			return false;
		}
		$("#devTransDivForm").submit();
	}

	function hourkeyDown(event){
		e = event ? event :(window.event ? window.event : null); 
		if(e.keyCode == 13){
			return false;
		} else {
			return true;
		}
	}
	
	//通过、驳回(1,通过，0驳回， 资讯单ID，资讯编号，资讯单状态)
	function orderPass(demandId, demandCode, opType){
		$("#content").val("");
		$("#save").removeAttr('disabled');
		$("#demandId").val(demandId);
		$("#demandCode").html(demandCode);
	    $("#opStateRemark").val(opType);
	    $('#sug').html('意见：');
	    if(opType == -11){
		    $("#save").val('撤案');
	    } else if(opType == 3){
		    $("#save").val('通过');
	    }else if(opType == -3){
		    $("#save").val('驳回');
	    }else if(opType == 6){
		    $("#save").val('同意');
	    }else if(opType == -6){
		    $("#save").val('会签驳回');
	    }else if(opType == 16){
		    $("#save").val('保留意见');
	    }else if(opType == 17){
		    $("#save").val('其他意见');
	    }else if(opType == 10){
		    $("#save").val('验收通过');
		    $('#sug').html('验收情况：');
	    }else if(opType == -10){
		    $("#save").val('验收驳回');
		    $('#sug').html('验收情况：');
	    }else if(opType == 9){
		    $("#save").val('完成');
		    $('#sug').html('处理情形：');
	    }else if(opType == -9){
		    $("#save").val('反馈');
		    $('#sug').html('处理情形：');
	    }else if(opType == -18){
		    $("#save").val('不同意');
	    } else {
		    $("#save").val('确定');
	    }
	    $("#authForm_div").dialog({
			modal:true, 
			//autoOpen:false, 
			width:500,
		});
		$("#authForm_div").dialog('moveToTop');
	}
	
	//分配
	function moveOrderAlter(demandId, demandCode, opType){
		$("#demandCodeMove").html(demandCode); 
		$("#demandIdMove").val(demandId);
		openLogandsee('moveOrderAlterDiv');
	}
	
	//转移
	function transfer(demandId, demandCode, user, opType){
		$("#demandCodeTrans").html(demandCode); 
		$("#demandIdTrans").val(demandId);
		$("#currOpUser").html(user);
		$('#newOpUser').val('');
		$('#newOpUserName').val('');
		openLogandsee('devTransDiv'); 
	}
	
	//开发确认
	function hoursOrderAlter(demandId, demandCode, opType){
		$("#demandCodeHours").html(demandCode); 
		$("#demandIdHours").val(demandId);
		$("#devOptype").val(opType);
		if(opType == 14){
			$("#devReason").show();
		} else {
			$("#devReason").hide();
		}
		openLogandsee('devHoursDiv');
	}
	
	//开发完成
	function devCommit(demandId, demandCode, opType){
		$("#demandCodeCommit").html(demandCode); 
		$("#demandIdCommit").val(demandId);
		$("#devOptype").val(opType);
		openLogandsee('devCommitDiv');
	}
	
	function devCommitBtn(){
		if($('#ALTER_TYPE').val()==''){
			alert('请选择修改类型！');
			$('#ALTER_TYPE').focus();
			return false;
		} else if($("#SYS_LEVEL").val() == ''){
			alert('请选择系统等级！');
			$('#SYS_LEVEL').focus();
			return false;
		} else if($("#RELEASE_TIME").val() == ''){
			alert('请选择上线时间！');
			$('#RELEASE_TIME').focus();
			return false;
		} else if($("#commit_content").val() == ''){
			alert('请输入意见！');
			$('#commit_content').focus();
			return false;
		} 
		$('#devCommitDivForm').submit();
	}
	
	//开发确认提交按钮
	function devHoursDivBtn(){
		var re = /^(([1-9]+[0-9]*)|0)(\.[0-9]+)?$/;
		var hours = $('#hours').val();
		if(re.test(hours) && hours > 0){
			if($('#PREDICT_DATE').val()==''){
				alert('请选择预计完成日期！');
				$('#PREDICT_DATE').focus();
			} else if($("#devOptype").val() == 14 && $("#devAlterReason").val() == ''){
				alert('请填写修改理由！');
				$('#devAlterReason').focus();
			} else {
				$('#devHoursDivForm').submit();
			}
		} else {
			alert('请输入大于0的工时！');
			$('#hours').select();
		}
	}
	
	//会签名单确认
	function countersignList(demandId, demandCode, opType){
		$('#opTypeDept').val(opType);
		$("#dept").removeAttr('disabled');
		$("#demandCodeCountersign").html(demandCode); 
		$("#demandIdCountersign").val(demandId);
		openLogandsee('countersignDiv');
	}
	
	//会签提交按钮
	function devDeptDivBtn(demandId){
		var codesOb = $("#selectDept > li");
		var codes = "";
		if(codesOb.length == 0){
			alert('请选择需要会签的部门！');
			return false;
		}
		codesOb.each(function(i){
			codes = codes + "," + $(this).attr('id');
		});
		codes = codes.substring(1, codes.length);
		$('#chooseCodes').val(codes);
		$('#dept').attr('disabled','disabled');
		$('#countersignDiv > form').submit();
	}

	function doQuery() {
		$("#form1").submit();
	}
	
	//修改
	function updateDemand(demandId, opType){
		location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.updateDemand&demandId=" + demandId + "&opType=" + opType;
	}

	//打开弹出层
	function openLogandsee(divName) {
		$("#" + divName).dialog({
			modal : true,
			autoOpen : false,
			width : 600
		});
		$("#" + divName).dialog('open');
	}
</script>
</head>
<body>
<div id="viewDiv">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资讯需求单详细信息</span>
	</div>
	<table width="100%" class="panel_table">
		<tr>
			<th width="8%" rowspan="3">基本信息</th>
			<th style="text-align:right;">资讯单编号：</th>
			<td colspan="4">${demand.DEMAND_CODE }<c:if test="${demand.DEMAND_TYPE eq 0 }"><span style="color:red; font-weight:bold;">&nbsp;(内部申请)</span></c:if></td>
		</tr>
		<tr>
			<th width="14%" style="text-align:right;">资讯单状态：</th>
			<td colspan="2" width="30%" style="color:red;font-weight:bold;">
				<c:if test="${demand.ORDER_STATUS >= 300 && demand.ORDER_STATUS < 350}">会签中--</c:if>${stateMap[demand.ORDER_STATUS]}&nbsp;
			</td>
			<th width="13%" style="text-align:right;">当前处理人：</th>
			<td>${demand.CURRENT_USER_NAME }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">资讯单流程：</th>
			<td colspan="4">
				<c:forEach items="${process}" var="d" varStatus="state">
					<span <c:if test="${demand.ORDER_STATUS == d }">style="color:red;font-weight:bold;"</c:if>>${stateMap[d]}</span>&nbsp;
					<c:if test="${state.index > 0 && state.index % 8 == 0 }"><br/></c:if>→&nbsp;
				</c:forEach><span <c:if test="${demand.ORDER_STATUS == 990 }">style="color:red;font-weight:bold;"</c:if>>结束</span>
			</td>
		</tr>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th rowspan="9">需求部门</th>
			<th style="text-align:right;">申请人：</th>
			<td colspan="2">${demand.APPLY_USER_NAME }&nbsp;</td>
			<th style="text-align:right;">办事处：</th>
			<td>${demand.DECP_NAME_CN }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">申请日期：</th>
			<td colspan="2">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demand.CREATE_TIME}" />&nbsp;
			</td>
			<th style="text-align:right;">希望完成日期：</th>
			<td>${demand.HOPE_COMPLETE_DATE}&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">摘要：</th>
			<td colspan="4" style="font-weight:bold;">&nbsp;${demand.SUMMARY}</td>
		</tr>
		<tr>
			<th style="text-align:right;">附件列表：</th>
			<td colspan="4" style="white-space:normal;">
				<c:forEach items="${fileList}" var="f" varStatus="index">
					<a style="padding:0 4px; margin:2px 0; float:left; clear:both;" class="ui-state-default" 
					href="${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${f.ORG_FILE_NAME }&path=${f.PATH}&bootPath=${bootPath}">${f.ORG_FILE_NAME }</a>
				</c:forEach>
			&nbsp;
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">需求内容：</th>
			<td colspan="4" style="white-space:pre-wrap;">${demand.CONTENT }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">单位主管：</th>
			<td colspan="2">
				<c:if test="${demand.ORDER_STATUS != 100}">
					${demandLog.UP_PASS_NAME }
				</c:if>&nbsp;
			</td>
			<th style="text-align:right;">时间：</th>
			<td>
				<c:if test="${demand.ORDER_STATUS != 100}">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.UP_PASS_TIME }" />
				</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">单位主管意见：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${demand.ORDER_STATUS != 100}">${demandLog.UP_PASS_CONTENT }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">处/部级主管：</th>
			<td colspan="2">
				<c:if test="${demand.ORDER_STATUS != 100}">
					${demandLog.UP_UP_PASS_NAME }
				</c:if>&nbsp;
			</td>
			<th style="text-align:right;">时间：</th>
			<td>
				<c:if test="${demand.ORDER_STATUS != 100}">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.UP_UP_PASS_TIME }" />
				</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">处/部级主管意见：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${demand.ORDER_STATUS != 100}">${demandLog.UP_UP_PASS_CONTENT }</c:if>&nbsp;</td>
		</tr>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th>会签流程</th>
			<td colspan="5" style="white-space:normal;">
				<c:if test="${fn:length(deptNames) > 0}">
					<c:forEach items="${deptNames}" var="d" varStatus="index">${d }&nbsp;→&nbsp;</c:forEach>结束
				</c:if>
				<c:if test="${fn:length(deptNames) == 0}">无</c:if>
			</td>
		</tr>
		<c:if test="${demand.ORDER_STATUS != 100}">
			<tr>
				<th rowspan="${fn:length(countersignLog) + 1}">会签部门</th>
				<th style="text-align:right;" rowspan="${fn:length(countersignLog) + 1}">会签情形：</th>
				<th style="width:6%;">会签时间</th>
				<th style="width:6%;">会签状况</th>
				<th>会签部门--会签人</th>
				<th>会签意见</th>
			</tr>
			<c:forEach items="${countersignLog}" var="c" varStatus="index">
				<tr>
					<td style="text-align:center;<c:if test='${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }'>color:red;</c:if>"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${c.OPERATE_TIME_END }" />&nbsp;</td>
					<td style="text-align:center;<c:if test='${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }'>color:red;</c:if>">${logOpType[c.OPERATE_STATE] }&nbsp;</td>
					<td style="text-align:center;<c:if test='${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }'>color:red;</c:if>">${stateMap[c.ORDER_STATUS] }--${c.NAME }&nbsp;</td>
					<td style="white-space:pre-wrap;<c:if test='${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }'>color:red;</c:if>">${c.OPERATE_SUGGEST }&nbsp;</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${demand.ORDER_STATUS == 100}">
			<tr>
				<th>会签部门</th>
				<th style="text-align:right;">会签情形：</th>
				<th style="width:6%;">会签时间</th>
				<th style="width:6%;">会签状况</th>
				<th>会签部门--会签人</th>
				<th>会签意见</th>
			</tr>
		</c:if>
		<c:if test="${(demand.SENIOR_SIGN eq 1 || demand.SENIOR_SIGN eq 2) && demand.ORDER_STATUS != 100}">
			<tr>
				<th>高阶签核</th>
				<th style="text-align:right;">签核情形：</th>
				<td style="text-align:center; <c:if test='${seniorMsg.OPERATE_STATE == -18 }'>color:red;</c:if>">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${seniorMsg.OPERATE_TIME_END }" />
				&nbsp;</td>
				<td style="text-align:center; <c:if test='${seniorMsg.OPERATE_STATE == -18 }'>color:red;</c:if>">${logOpType[seniorMsg.OPERATE_STATE] }&nbsp;</td>
				<td style="text-align:center; <c:if test='${seniorMsg.OPERATE_STATE == -18 }'>color:red;</c:if>">${seniorMsg.NAME }&nbsp;</td>
				<td style="<c:if test='${seniorMsg.OPERATE_STATE == -18 }'>color:red;</c:if>">${seniorMsg.OPERATE_SUGGEST }&nbsp;</td>
			</tr>
		</c:if>
		<c:if test="${demand.SENIOR_SIGN eq 0 || empty demand.SENIOR_SIGN || demand.ORDER_STATUS == 100}">
			<tr>
				<th>高阶签核</th>
				<th style="text-align:right;">签核情形：</th>
				<td style="text-align:center;">-</td>
				<td style="text-align:center;">-</td>
				<td style="text-align:center;">-</td>
				<td>-</td>
			</tr>
		</c:if>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th rowspan="4">资讯部门</th>
			<th style="text-align:right;">处理情形：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${demand.ORDER_STATUS > 500}">${demandLog.IT_PASS_CONTENT }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">负责人员：</th>
			<td colspan="2"><c:if test="${demand.ORDER_STATUS > 400}">${demand.RESPONSIBLE_USER_NAME }</c:if>&nbsp;</td>
			<th style="text-align:right;">预计工时(小时)：</th>
			<td><c:if test="${demand.ORDER_STATUS > 450}">${demand.HOURS }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">预计完成日期：</th>
			<td colspan="2"><c:if test="${demand.ORDER_STATUS > 450}"><fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${demand.PREDICT_DATE }" /></c:if>&nbsp;</td>
			<th style="text-align:right;">完成时间：</th>
			<td><c:if test="${demand.ORDER_STATUS > 500}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.IT_PASS_TIME }" /></c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">主管：</th>
			<td colspan="2"><c:if test="${demand.ORDER_STATUS > 600}">${demandLog.IT_UP_PASS_NAME }</c:if>&nbsp;</td>
			<th style="text-align:right;">审核时间：</th>
			<td><c:if test="${demand.ORDER_STATUS > 600}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.IT_UP_PASS_TIME }" /></c:if>&nbsp;</td>
		</tr>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th rowspan="4">验收</th>
			<th style="text-align:right;">验收人建议：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${demand.ORDER_STATUS > 900}">${demandLog.CHECK_PASS_CONTENT }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">验收人：</th>
			<td colspan="2"><c:if test="${demand.ORDER_STATUS > 900}">${demandLog.CHECK_PASS_NAME }</c:if>&nbsp;</td>
			<th style="text-align:right;">验收日期：</th>
			<td><c:if test="${demand.ORDER_STATUS > 900}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.CHECK_PASS_TIME }" /></c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">主管建议：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${demand.ORDER_STATUS > 901}">${demandLog.CHECK_UP_PASS_CONTENT }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">主管：</th>
			<td colspan="2"><c:if test="${demand.ORDER_STATUS > 901}">${demandLog.CHECK_UP_PASS_NAME }</c:if>&nbsp;</td>
			<th style="text-align:right;">验收日期：</th>
			<td><c:if test="${demand.ORDER_STATUS > 901}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${demandLog.CHECK_UP_PASS_TIME }" /></c:if>&nbsp;</td>
		</tr>
	</table>
	<table width="100%" class="panel_table">
		<tr><th align="center" colspan="6">日志信息</th></tr>
		<tr>
			<th>处理前状态</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>处理人</th>
			<th>操作</th>
			<th>内容</th>
		</tr>
		<c:forEach items="${demandLogList}" var="item" varStatus="status">
			<tr>
				<td style="text-align: center;<c:if test="${item.operateState==19 }">color:red;</c:if>">
					<c:if test="${item.orderStatus >= 300 && item.orderStatus < 350}">会签中--</c:if>${stateMap[item.orderStatus]==null?'无':stateMap[item.orderStatus]}&nbsp;
				</td>	
				<td style="text-align: center;<c:if test="${item.operateState==19 }">color:red;</c:if>">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${item.operateTimeBegin}" />&nbsp;
				</td>
				<td style="text-align: center;<c:if test="${item.operateState==19 }">color:red;</c:if>">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${item.operateTimeEnd}" />&nbsp;
				</td>
				<td style="text-align: center;<c:if test="${item.operateState==19 }">color:red;</c:if>">${item.operatorName}&nbsp;</td>	
				<td style="text-align: center;<c:if test="${item.operateState==19 }">color:red;</c:if>">${logOpType[item.operateState]}&nbsp;</td>	
				<td class="content" style="text-align:left; white-space:pre-wrap; padding:0 6px;<c:if test="${item.operateState==19 }">color:red;</c:if>">${item.operateSuggest}&nbsp;</td>
			</tr>
		</c:forEach>	
	</table>
	<div id="fixed">
		<div id="btns" style=" margin:auto; margin-top:16px;">
			<a id="backToDemandList" href="javascript:void(0);" class="ui-state-default ui-corner-all">返回资讯需求单列表</a>
			<c:if test="${(demand.APPLY_USER_ID==s_employeeId || alter=='Y') && (demand.ORDER_STATUS == firstState || demand.ORDER_STATUS == 0)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="updateDemand('${demand.ID}'),2">修改</a>
			</c:if> 
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || alter=='Y'}">
				<c:if test="${demand.ORDER_STATUS == 0}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',12);">提交</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || countersignList=='Y'}">
				<c:if test="${demand.ORDER_STATUS == 300}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="countersignList('${demand.ID}','${demand.DEMAND_CODE}',4);">添加会签名单</a>
				</c:if>
				<c:if test="${demand.ORDER_STATUS >= 100 && demand.ORDER_STATUS < 350}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="countersignList('${demand.ID}','${demand.DEMAND_CODE}',5);">会签名单修改</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || passReject=='Y'}">
				<c:if test="${demand.ORDER_STATUS >= 100 && demand.ORDER_STATUS < 300 || demand.ORDER_STATUS == 600}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',3);">通过</a>
				</c:if>
				<c:if test="${demand.ORDER_STATUS >= 100 && demand.ORDER_STATUS < 300 || demand.ORDER_STATUS == 300 || demand.ORDER_STATUS == 600}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-3);">驳回</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || countersign=='Y'}">
				<c:if test="${demand.ORDER_STATUS >= 301 && demand.ORDER_STATUS < 350}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',6);">同意</a>
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',16);">保留意见</a>
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',17);">其他意见</a>
				</c:if>
				<%-- <c:if test="${demand.ORDER_STATUS >= 301 && demand.ORDER_STATUS < 400}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-6);">会签驳回</a>
				</c:if> --%>
			</c:if>
			<c:if test="${demand.ORDER_STATUS == 360 && (demand.CURRENT_OPERATOR_ID==s_employeeId || demandSenior=='Y')}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',6);">同意</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-18);">不同意</a>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || check=='Y'}">
				<c:if test="${demand.ORDER_STATUS >= 900 && demand.ORDER_STATUS < 990}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',10);">验收通过</a>
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-10);">验收驳回</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || move=='Y'}">
				<c:if test="${demand.ORDER_STATUS == 400}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="moveOrderAlter('${demand.ID}','${demand.DEMAND_CODE}',7);">分配</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || dev=='Y'}">
				<c:if test="${demand.ORDER_STATUS == 450}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="hoursOrderAlter('${demand.ID}','${demand.DEMAND_CODE}',8);">开发确认</a>
				</c:if>
				<c:if test="${demand.ORDER_STATUS == 500}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="hoursOrderAlter('${demand.ID}','${demand.DEMAND_CODE}',14);">开发预计重估</a>
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="devCommit('${demand.ID}','${demand.DEMAND_CODE}',9);">开发完成</a>
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-9);">开发反馈</a>
				</c:if>
			</c:if>
			<c:if test="${demand.CURRENT_OPERATOR_ID==s_employeeId || delete=='Y'}">
				<c:if test="${demand.ORDER_STATUS == 0}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${demand.ID}','${demand.DEMAND_CODE}',-11);">撤案</a>
				</c:if>
			</c:if>
			<c:if test="${demandTransfer=='Y' && demand.ORDER_STATUS != -1 && demand.ORDER_STATUS != -2 && demand.ORDER_STATUS != 990}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" style="color:#FF0000; margin-left:80px;" onclick="transfer('${demand.ID}','${demand.DEMAND_CODE}','${demand.CURRENT_USER_NAME}',13);">转移</a>
			</c:if>
			<c:if test="${alter=='Y' && demand.ORDER_STATUS != -1 && demand.ORDER_STATUS != -2 && demand.ORDER_STATUS != 990}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" style="color:#FF0000;" onclick="updateDemand('${demand.ID}'),2">管理员修改</a>
			</c:if> 
		</div>
	</div>
	<div style="display: none;" id="authForm_div" title="请输入意见">
		<form action="../servlet/defaultDispatcher" id="remarkForm" name="remarkForm" method="post">
			<input type="hidden" name="__action" value="modifyOrderCommand.addDemandLog"/> 
			<input type="hidden" name="demandId" id="demandId"/> 
			<input type="hidden" id="opStateRemark" name="opType" value=""/> 
			<input type="hidden" name="orderStatus" id="orderStatus"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2">资讯需求单编号：<span id="demandCode"></span></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;">
									<strong id="sug">意见：</strong><br />
									<font color="red" size="-2">(必填)</font>
								</td>
								<td><textarea id="content" name="content" cols="55" rows="5"></textarea></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2" style="text-align: center;">
									<input type="button" value="通过" id="save" class="ui-state-default ui-corner-all" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div title="分配" style="display: none" id="moveOrderAlterDiv">
		<form id="moveOrderAlterform" name="moveOrderAlterform" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdMove"/> 
			<input type="hidden" name="opType" value="7"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">资讯需求单编号：<span id="demandCodeMove"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">请选择处理人员:</td>
								<td style="text-align: center; height: 40px;" width="90%">
									<select id="ALTER_USER_ID" name="ALTER_USER_ID" style="width: 300px">
										<c:forEach items="${its}" var="it">
											<option value="${it.ID}">${it.NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="submit" class="ui-state-default ui-corner-all" value="提交" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="开发确认" style="display: none" id="devHoursDiv">
		<form id="devHoursDivForm" name="devHoursDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdHours"/> 
			<input type="hidden" id="devOptype" name="opType" value="8"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">资讯需求单编号：<span id="demandCodeHours"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">预计工时:</td>
								<td style="text-align: center; height: 40px;" width="90%">
									<input id="hours" onkeydown="return hourkeyDown(event);" name="hours" width="90%" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">预计完成日期:</td>
								<td style="text-align: center; height: 40px;" width="90%">
									<input id="PREDICT_DATE" readonly="readonly" name="PREDICT_DATE" width="90%" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr" id="devReason" style="display: none;">
								<td style="text-align: center" width="10%">修改理由:<br/><font color="red" style="font-weight:bold;" size="-2">(必填)</font></td>
								<td><textarea rows="5" cols="55" style="width:100%;" id="devAlterReason" name="devAlterReason"></textarea></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="devHoursDivBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="开发完成" style="display: none" id="devCommitDiv">
		<form id="devCommitDivForm" name="devCommitDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdCommit"/> 
			<input type="hidden" id="devOptype" name="opType" value="9"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">资讯需求单编号：<span id="demandCodeCommit"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">处理类型:<font color="red" style="font-weight:bold;" size="-2">(必填)</font></td>
								<td style="text-align: center; height: 40px;" width="90%">
									<select id="ALTER_TYPE" name="ALTER_TYPE"  width="90%">
										<c:forEach var="alterType" items="${alterTypeList }">
											<option value="${alterType.CODE }">${alterType.FLAG }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">系统等级:<font color="red" style="font-weight:bold;" size="-2">(必填)</font></td>
								<td style="text-align: center; height: 40px;" width="90%">
									<select id="SYS_LEVEL" name="SYS_LEVEL"  width="90%">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr" id="devReason">
								<td style="text-align: center" width="10%">上线时间:<font color="red" style="font-weight:bold;" size="-2">(必填)</font></td>
								<td style="text-align: center; height: 40px;" width="90%">
									<input id="RELEASE_TIME" name="RELEASE_TIME" readonly="readonly" width="90%">
								</td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;">
									<strong id="sug">意见：</strong><br />
									<font color="red" size="-2">(必填)</font>
								</td>
								<td><textarea id="commit_content" name="content" cols="55" rows="5"></textarea></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="完成" onclick="devCommitBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="转移" style="display: none" id="devTransDiv">
		<form id="devTransDivForm" name="devTransDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdTrans"/> 
			<input type="hidden" name="opType" value="13"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">资讯需求单编号：<span id="demandCodeHours"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="30%">当前处理人:</td>
								<td id="currOpUser" style="text-align: center; height: 40px;" width="0%"></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center">新处理人:</td>
								<td style="text-align: center; height: 40px;">
									<input type="text" id="newOpUserName" style="width:80%;" />
									<input type="hidden" id="newOpUser" name="newOpUser" />
									<input type="text" id="existForStopSubmit" style="width:0; border:0;" disabled="disabled" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="devNewOpDivBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="会签名单" style="display: none" id="countersignDiv">
		<form id="countersignDivForm" name="countersignDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdCountersign"/> 
			<input type="hidden" name="COUNTERSIGN_CODE_ORDER" id="chooseCodes" value=""/> 
			<input type="hidden" id="opTypeDept" name="opType" value="4"/>
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2">资讯需求单编号：<span id="demandCodeCountersign"></span></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">会签部门:</td>
								<td style="text-align: center;" width="90%">
									<div style="float:left; margin:10px 0 0 50px;">
										<span class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">所有部门：</span>
										<ul id="all" class="connectedSortable">
											<c:forEach items="${restCounList}" var="d">
										  		<li id="${d.CODE }" class="ui-state-default">${d.SHORTNAME}</li>
										  	</c:forEach>
										</ul>
									</div>
									<div style="float:left; color:red; margin:100px 0 0 20px; width:50px;">
										向右拖动添加&gt;&gt;<br/><br/><br/><br/><br/><br/><br/><br/>&lt;&lt;向左拖动删除
									</div>
									<div style="float:left; margin:10px 0 0 50px;">
										<span class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">已选择会签部门：</span>
										<ul id="selectDept" class="connectedSortable">
											<c:forEach items="${comCounList}" var="d">
										  		<li id="${d.CODE }" class="ui-state-default <c:if test="${d.CODE eq 302 || d.CODE eq 309}">ui-state-disabled</c:if>">${d.SHORTNAME}</li>
										  	</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center">高阶签核:</td>
								<td style="text-align: center; height:36px; color:#2E6E9E; font-weight:bold;"><input style="vertical-align: middle;" <c:if test="${demand.SENIOR_SIGN eq 2}">disabled=disabled;</c:if> name="seniorSign" <c:if test="${demand.SENIOR_SIGN eq 1 || demand.SENIOR_SIGN eq 2}">checked=checked</c:if> type="checkbox" value="Y" />&nbsp;添加总经理高阶签核</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input id="dept" type="button" class="ui-state-default ui-corner-all" value="提交" onclick="devDeptDivBtn('${order.ID }');" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
		
						<span style="color:red;">
							备注：满足以下条件之一系统将自动添加高阶签核
							<br/>&nbsp;&nbsp;1.会签名单中包含2个（含）以上处级部门；
							<br/>&nbsp;&nbsp;2.会签部门有至少一个会签结果为“保留意见”或“其他意见”；
						</span>
	</div>
	
	<div id="opResult" title="操作提示">
  		<p id="opResultMessage">${opResultMessage }</p>
	</div>
</div>
</body>
</html>