<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/taglibsNew.jsp"%>
<title>签办单</title>
<link rel="stylesheet" href="${ctx}/dun/js/selectize/selectize.default.css">
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

<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<script src="${ctx}/dun/js/selectize/selectize.js"></script>
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
			if (row.email != null && row.email.length > 0) rs += "【" + row.email + "】";
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.email + " " + row.name;
		},
		formatResult : function(row) {
			return row.name;
		}
	};
	
	function myAlertSuccess(msg){
		$("#opResultMessage").html(msg);
		$("#opResult").dialog({
			modal: true,
			position : ['center',180],
			buttons: {
		        '关闭': function() {
		          	$(this).dialog("close");
		        }
			}	
		});
	}
	
	$(function (){
	 	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
		$("#PREDICT_DATE").datepicker({minDate: 0});
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
		//会签插件
		$( "#connectedSortable" ).sortable({cancel: ".ui-state-disabled"});
		$(".connectedSortable").sortable({
		      connectWith: ".connectedSortable",
		      opacity: 0.6,
	    	  items: "li:not(.ui-state-disabled)"
	    }).disableSelection();
		//转移插件
		$("#newOpUserName").autocomplete(projects, options).result(function(event, data, formatted) {
			$('#newOpUser').val(data.id);
		});
		$("#newOpUserName").blur(function (e) { $('.ac_over').click();} ); 
		
		var urlParam = '${urlParam}';
		urlParam = urlParam.replace(/!/g,'&');
		$('#backToSignOrderList').attr('href','../servlet/defaultDispatcher?__action=signOrderCommand.getAllSignOrders&' + urlParam);
		//提示信息
		var opResultMessage = '${opResultMessage}';
		if(opResultMessage != ''){
			if(opResultMessage == 'outOfTime'){
				opResultMessage = '操作超时！';
			} else if(opResultMessage == 'ok'){
				opResultMessage = '操作成功！';
			}
			var isMyDemand = '${isMySignOrder}';
			if(isMyDemand == "1"){
				opResultMessage += '<br>该资讯需求单下一步处理人仍然为您，如需留在此页继续审核，请点击“继续”按钮！';
				$('#opResultMessage').html(opResultMessage);
				$('#opResult').dialog({
					resizable: false,
				    modal: true,
					position : ['center',180],
				    buttons: {
				      "继续": function() {
				        $(this).dialog("close");
				      },
				      "返回列表":function(){
				     	 	window.location.href = '../servlet/defaultDispatcher?__action=signOrderCommand.getAllSignOrders&' + urlParam;
				      }
				    }
				});
			} else {
				$('#opResultMessage').html(opResultMessage);
				$('#opResult').dialog({
					resizable: false,
			      	modal: true,
					position : ['center',180],
					buttons: {
					  "返回列表":function(){
					 	 	window.location.href = '../servlet/defaultDispatcher?__action=signOrderCommand.getAllSignOrders&' + urlParam;
					  }
					}
				});
			}
		};
		//后会名单
		initSelectize();
		$('select.selectized,input.selectized').each(function() {
			var $input = $(this);
			var update = function(e) { 
				$('#chooseLastCodes').val($input.val());
			};
			$(this).on('change', update);
			update();
		});
	});
	
	function initSelectize(){
		var options = [];
		var u = '${lastUsers}';
		var uOptions = u.split(',');
		for(var i = 0; i < uOptions.length; i++){
			options.push({
		        title: uOptions[i]
		    });
		}
		$('#input-tags1').selectize({
		    delimiter: ',',
		    persist: false,
		    valueField: 'title',
		    labelField: 'title',
		    options: options
		});
		$('#input-tags2').selectize({
		    plugins: ['remove_button','drag_drop'],
		    delimiter: ',',
		    persist: false,
		    valueField: 'id',
		    labelField: 'name',
		    searchField: ['name', 'id', 'email'],
		    sortField: [{field: 'name', direction: 'asc'}],
		    render: {
		        option: function(data, escape) {
		            return '<div class="option">' +
		                    '<span class="name">' + escape(data.name) + '</span>' +
		                    '<span class="email">(' + escape(data.email) + ')</span>' +
		                '</div>';
		        }
		    },
		    options: projects,
		    //maxItems: 6,
		    create: false
		});
		$('#input-tags1')[0].selectize.lock();
		//调整下拉选项的显示
		$('.selectize-control').css('position','static');
	}
	
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
	function orderPass(signOrderId, opState){
		$("#content").val("");
		$("#save").removeAttr('disabled');
		$("#signOrderId").val(signOrderId);
	    $("#opState").val(opState);
	    $('#sug').html('意见：');
	    if(opState == -11){
		    $("#save").val('撤案');
	    } else if(opState == 3){
		    $("#save").val('通过');
	    }else if(opState == -3){
		    $("#save").val('驳回');
	    }else if(opState == 6){
		    $("#save").val('同意');
	    }else if(opState == -6){
		    $("#save").val('会签驳回');
	    }else if(opState == 16){
		    $("#save").val('保留意见');
	    }else if(opState == 17){
		    $("#save").val('其他意见');
	    }else if(opState == -18){
		    $("#save").val('不同意');
	    } else {
		    $("#save").val('确定');
	    }
	    $("#authForm_div").dialog({
			modal:true, 
			position : ['center',180],
			width:500,
		});
		$("#authForm_div").dialog('moveToTop');
	}
	
	//转移
	function transfer(demandId, user, opType){
		$("#signOrderIdTrans").val(demandId);
		$("#currOpUser").html(user);
		$('#newOpUser').val('');
		$('#newOpUserName').val('');
		openLogandsee('devTransDiv'); 
	}
	
	
	//会签名单确认
	function countersignList(signOrderId, opType){
		$('#opTypeDept').val(opType);
		$("#dept").removeAttr('disabled');
		$("#signOrderIdCountersign").val(signOrderId);
		openLogandsee('countersignDiv');
	}
	
	//会签提交按钮
	function devDeptDivBtn(){
		var codesOb = $("#selectDept > li");
		var codes = "";
		if(codesOb.length == 0){
			myAlertSuccess('请选择需要会签的部门！');
			return false;
		}
		codesOb.each(function(i){
			codes = codes + "," + $(this).attr('id');
		});
		//return false;
		codes = codes.substring(1, codes.length);
		$('#chooseCodes').val(codes);
		$('#dept').attr('disabled','disabled');
		$('#countersignDiv > form').submit();
	}
	
	//后会
	function addLastCountersign(signOrderId, opType){
		$("#lastCountersignDiv").dialog({
			modal : true,
			width : 700,
			position : ['center',180],
			open  : function(event, ui){
				$("div[aria-describedby='lastCountersignDiv']").css('overflow','visible');
			}
		});
	}

	function doQuery() {
		$("#form1").submit();
	}
	
	//修改
	function updateSignOrder(signOrderId, opType){
		location.href="../servlet/defaultDispatcher?__action=signOrderCommand.updateSignOrder&signOrderId=" + signOrderId;
	}

	//打开弹出层
	function openLogandsee(divName) {
		$("#" + divName).dialog({
			modal : true,
			position : ['center',180],
			width : 600
		});
	}
	
	//添加后会提交按钮
	function addLastButton(signOrderId){
		var chooseLastCodes = $('#chooseLastCodes').val()
		if(chooseLastCodes == ''){
			myAlertSuccess('未选择任何后会名单！');
			return false;
		}
		var lastUserIds = $('#lastUserIds').val();
		var oIds = lastUserIds.split(',');
		var nIds = chooseLastCodes.split(',');
		var small;
		var big;
		if(oIds.length >= nIds.length){
			small = nIds;
			big = ',' + lastUserIds + ',';
		} else {
			small = oIds;
			big = ',' + chooseLastCodes + ',';
		}
		for(var i = 0; i < small.length; i++){
			if(big.indexOf(',' + small[i] + ',') >= 0){
				myAlertSuccess('“新增后会名单”与“已有后会名单”有重复，请修改！');
				return false;
			}
		}
		$('#lastCountersignDivForm').submit();
	}
</script>
</head>
<body>
<div id="viewDiv">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;签办单详细信息</span>
	</div>
	<table width="100%" class="panel_table">
		<tr>
			<th width="8%" rowspan="12">基本信息</th>
			<th style="text-align:right;">签办单编号：</th>
			<td colspan="4">${signOrderTo.signCode }</td>
		</tr>
		<tr>
			<th width="14%" style="text-align:right;">签办单状态：</th>
			<td colspan="2" width="30%" style="color:red;font-weight:bold;">
				<c:if test="${signOrderTo.orderStatus <= -100 && signOrderTo.orderStatus > -200}">会签中 -- ${flowMap[signOrderTo.orderStatus].FLAG}</c:if>
				<c:if test="${signOrderTo.orderStatus == -200}">加签中 -- ${signOrderTo.currentCountersignCodeOrderName }</c:if>
				<c:if test="${signOrderTo.orderStatus > -100 || signOrderTo.orderStatus < -200}">${flowMap[signOrderTo.orderStatus].FLAG}</c:if>&nbsp;
			</td>
			<th width="13%" style="text-align:right;">当前处理人：</th>
			<td>${signOrderTo.currentOperatorName }&nbsp;<c:if test="${signOrderTo.agentUserName ne null}"><font color="red">(${signOrderTo.agentUserName } 代)</font></c:if></td>
		</tr>
		<tr>
			<th style="text-align:right;">签办单流程：</th>
			<td colspan="4">
				<span <c:if test="${signOrderTo.orderStatus == 1 }">style='color:red;font-weight:bold;'</c:if>>单位主管审核中</span>&nbsp;→
				<span <c:if test="${signOrderTo.orderStatus == 2 }">style='color:red;;font-weight:bold;'</c:if>>处级主管审核中</span>&nbsp;→
				<span <c:if test="${signOrderTo.orderStatus >= -200 && signOrderTo.orderStatus <= -100 }">style='color:red;;font-weight:bold;'</c:if>>会签中</span>&nbsp;→
				<span <c:if test="${signOrderTo.orderStatus == 3 }">style='color:red;;font-weight:bold;'</c:if>>高阶签核</span>&nbsp;→
				<span <c:if test="${signOrderTo.orderStatus == 4 }">style='color:red;;font-weight:bold;'</c:if>>后会</span>&nbsp;→
				<span <c:if test="${signOrderTo.orderStatus == 5 || signOrderTo.orderStatus == -2 || signOrderTo.orderStatus == -3}">style='color:red;;font-weight:bold;'</c:if>>结束</span>
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">申请人：</th>
			<td colspan="2">${signOrderTo.applyUserName }&nbsp;</td>
			<th style="text-align:right;">部门：</th>
			<td>${signOrderTo.deptName }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">申请日期：</th>
			<td colspan="2">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${signOrderTo.createTime}" />&nbsp;
			</td>
			<th style="text-align:right;">公司：</th>
			<td>${signOrderTo.companyCode==1?"裕融":signOrderTo.companyCode==2?"裕国":"" }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">事由：</th>
			<td colspan="4" style="font-weight:bold;">&nbsp;${signOrderTo.summary}</td>
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
			<th style="text-align:right;">签办单内容：</th>
			<td colspan="4" style="white-space:pre-wrap;">${signOrderTo.content }&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">单位主管(${headInfo.UP_ORG_NAME })：</th>
			<td colspan="2">
				<c:if test="${signOrderTo.orderStatus != 1 }">
					${headInfo.UP_NAME }<c:if test="${headInfo.UP_OP == -3 }"><span style="color:red;font-weight: bold;">（驳回）</span></c:if>
				</c:if>&nbsp;
			</td>
			<th style="text-align:right;">时间：</th>
			<td>
				<c:if test="${signOrderTo.orderStatus != 1 }">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${headInfo.UP_TIME }" />
				</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">单位主管意见：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${signOrderTo.orderStatus != 1 }">${headInfo.UP_SUGGEST }</c:if>&nbsp;</td>
		</tr>
		<tr>
			<th style="text-align:right;">处/部级主管(${headInfo.UP_UP_ORG_NAME })：</th>
			<td colspan="2">
				<c:if test="${signOrderTo.orderStatus != 1 }">
				${headInfo.UP_UP_NAME }<c:if test="${headInfo.UP_UP_OP == -3 }"><span style="color:red;font-weight: bold;">（驳回）</span></c:if>
				</c:if>&nbsp;
			</td>
			<th style="text-align:right;">时间：</th>
			<td>
				<c:if test="${signOrderTo.orderStatus != 1 }">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${headInfo.UP_UP_TIME }" />
				</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<th style="text-align:right;">处/部级主管意见：</th>
			<td colspan="4" style="white-space:pre-wrap;"><c:if test="${signOrderTo.orderStatus != 1 }">${headInfo.UP_UP_SUGGEST }</c:if>&nbsp;</td>
		</tr>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th>会签流程</th>
			<td colspan="5" style="white-space:normal;">
				<c:if test="${fn:length(selectedCountersignList) > 0}">
					<c:forEach items="${selectedCountersignList}" var="d" varStatus="index">${flowMap[d].FLAG }&nbsp;→&nbsp;</c:forEach>结束
				</c:if>
				<c:if test="${fn:length(selectedCountersignList) == 0}">无</c:if>
			</td>
		</tr>
		<tr>
			<th rowspan="${fn:length(countersignInfo) + 1}">会签信息</th>
			<th style="text-align:right;" rowspan="${fn:length(countersignInfo) + 1}">会签情形：</th>
			<th style="width:6%;">会签时间</th>
			<th style="width:6%;">会签状况</th>
			<th>部门--会签人<br/>/加签人</th>
			<th>会签意见</th>
		</tr>
		<c:forEach items="${countersignInfo}" var="c" varStatus="index">
			<tr>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${c.OPERATE_TIME_END }" />&nbsp;</td>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${logOpType[c.OPERATE_STATE] }&nbsp;</td>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${flowMap[c.SIGN_STATUS].FLAG}--${c.NAME }&nbsp;</td>
				<td style="white-space:pre-wrap;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${c.OPERATE_SUGGEST }&nbsp;</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th>高阶签核</th>
			<th style="text-align:right;">签核情形：</th>
			<td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${headInfo.SENIOR_TIME }" />&nbsp;</td>
			<td style="text-align:center;">${logOpType[headInfo.SENIOR_OP] }&nbsp;</td>
			<td style="text-align:center;">${headInfo.SENIOR_NAME }&nbsp;</td>
			<td>${headInfo.SENIOR_SUGGEST }&nbsp;</td>
		</tr>
		<tr><td colspan="6"></td></tr>
		<tr>
			<th>后会名单</th>
			<td colspan="5" style="white-space:normal;">
				<c:if test="${fn:length(lastCountersignList) > 0}">${lastUsers }</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<th rowspan="${fn:length(lastCountersignInfo) + 1}">后会信息</th>
			<th style="text-align:right;" rowspan="${fn:length(lastCountersignInfo) + 1}">后会情形：</th>
			<th style="width:6%;">后会时间</th>
			<th style="width:6%;">后会状况</th>
			<th>后会人</th>
			<th>后会意见</th>
		</tr>
		<c:forEach items="${lastCountersignInfo}" var="c" varStatus="index">
			<tr>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${c.OPERATE_TIME_END }" />&nbsp;</td>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${logOpType[c.OPERATE_STATE] }&nbsp;</td>
				<td style="text-align:center;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${c.ORG_NAME }<c:if test="${c.ORG_NAME != c.NAME }">（${c.NAME }&nbsp;代）</c:if>&nbsp;</td>
				<td style="white-space:pre-wrap;<c:if test="${c.OPERATE_STATE eq 16 || c.OPERATE_STATE eq 17 }">color:red;</c:if>">${c.OPERATE_SUGGEST }&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
	<table width="100%" class="panel_table">
		<tr><th align="center" colspan="7">日志信息</th></tr>
		<tr>
			<th>处理前状态</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>原始<br/>处理人</th>
			<th>实际<br/>处理人</th>
			<th>操作</th>
			<th>内容</th>
		</tr>
		<c:forEach items="${logs}" var="item" varStatus="status">
			<tr>
				<td style="text-align: center;">
					<c:if test="${item.signStatus > -200 && item.signStatus <= -100 }">会签中--${flowMap[item.signStatus].FLAG}</c:if>
					<c:if test="${item.signStatus == -200 }">加签中</c:if>
					<c:if test="${item.signStatus < -200 || item.signStatus > -100 || item.signStatus == null}">
						${flowMap[item.signStatus]==null?'无':flowMap[item.signStatus].FLAG}
					</c:if>
					&nbsp;
				</td>	
				<td style="text-align: center;">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item.operateTimeBegin}" />&nbsp;
				</td>
				<td style="text-align: center;">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item.operateTimeEnd}" />&nbsp;
				</td>
				<td style="text-align: center;">${item.orgOperatorName}&nbsp;</td>	
				<td style="text-align: center;">${item.operatorName}&nbsp;</td>	
				<td style="text-align: center;">${logOpType[item.operateState]}&nbsp;</td>	
				<td class="content" style="text-align:left; white-space:pre-wrap; padding:0 6px;">${item.operateSuggest}&nbsp;</td>
			</tr>
		</c:forEach>	
	</table>
	<div id="fixed">
		<div id="btns" style=" margin:auto; margin-top:16px;">
			<a id="backToSignOrderList" href="javascript:void(0);" class="ui-state-default ui-corner-all">返回签办单列表</a>
			<c:if test="${(signOrderTo.applyUserId==s_employeeId || signOrder_admin) && (signOrderTo.orderStatus == 1 || signOrderTo.orderStatus == -1)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="updateSignOrder('${signOrderTo.id}'),2">修改</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus == -1 && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_admin)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',12);">提交</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',-11);">撤案</a>
			</c:if>
			<c:if test="${signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_counterSign}">
				<c:if test="${(signOrderTo.orderStatus > -200 && signOrderTo.orderStatus <= -100) || (signOrderTo.orderStatus >= 1 && signOrderTo.orderStatus <= 2)}">
					<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="countersignList('${signOrderTo.id}',5);">会签名单修改</a>
				</c:if>
			</c:if>
			<c:if test="${signOrderTo.orderStatus >= 1 && signOrderTo.orderStatus <= 2 && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_passReject)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',3);">通过</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',-3);">驳回</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus > -200 && signOrderTo.orderStatus <= -100 && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_counterSign)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',6);">同意</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',16);">保留意见</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',17);">其他意见</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus == 3 && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_manager)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',6);">同意</a>
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',-18);">不同意</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus == 4 && fn:length(lastCountersignList) > fn:length(lastCountersignInfo) && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_last)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',20);">知悉</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus == 4 && fn:length(lastCountersignList) == fn:length(lastCountersignInfo) && signOrderTo.applyUserId==s_employeeId && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_admin)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="orderPass('${signOrderTo.id}',22);">结案</a>
			</c:if>
			<c:if test="${signOrderTo.orderStatus != -3 && signOrderTo.orderStatus != -2 && signOrderTo.orderStatus != 5 && (signOrderTo.currentOperatorId==s_employeeId || signOrderTo.agentUserId==s_employeeId || signOrder_last)}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" onclick="addLastCountersign('${signOrderTo.id}',21);">添加后会名单</a>
			</c:if>
			<c:if test="${signOrder_admin && signOrderTo.orderStatus !=5 && signOrderTo.orderStatus != 990}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" style="color:#FF0000; margin-left:80px;" onclick="transfer('${signOrderTo.id}','${signOrderTo.currentOperatorName}',13);">转移</a>
			</c:if>
			<c:if test="${signOrder_admin && signOrderTo.orderStatus !=5 && signOrderTo.orderStatus != 990}">
				<a href="javascript:void(0);" class="ui-state-default ui-corner-all" style="color:#FF0000;" onclick="updateSignOrder('${signOrderTo.id}'),2">管理员修改</a>
			</c:if>
		</div>
	</div>
	<div style="display: none;" id="authForm_div" title="请输入意见">
		<form action="../servlet/defaultDispatcher" id="remarkForm" name="remarkForm" method="post">
			<input type="hidden" name="__action" value="signOrderCommand.next"/> 
			<input type="hidden" name="signOrderId" value="${signOrderTo.id}" /> 
			<input type="hidden" id="opState" name="opState" value=""/> 
			<input type="hidden" name="currentState" value="${signOrderTo.orderStatus}"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<input type="hidden" name="updateTime" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss.SSS" type="both" value="${signOrderTo.updateTime }" />">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
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

	<div title="转移" style="display: none" id="devTransDiv">
		<form id="devTransDivForm" name="devTransDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=signOrderCommand.transfer">
			<input type="hidden" name="signOrderId" id="signOrderIdTrans"/> 
			<input type="hidden" name="opType" value="13"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
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
									<input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="devNewOpDivBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="会签名单" style="display: none" id="countersignDiv">
		<form id="countersignDivForm" name="countersignDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=signOrderCommand.updateCountersign">
			<input type="hidden" name="signOrderId" value="${signOrderTo.id }" /> 
			<input type="hidden" name="COUNTERSIGN_CODE_ORDER" id="chooseCodes" value=""/> 
			<input type="hidden" id="opTypeDept" name="opType" value="5"/>
			<input type="hidden" name="urlParam" value="${urlParam}">
			<input type="hidden" name="updateTime" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss.SSS" type="both" value="${signOrderTo.updateTime }" />">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">会签部门:</td>
								<td style="text-align: center; white-space: normal;" width="90%">
									<div style="float:left; margin:10px 0 0 50px;">
										<div class="ui-widget-header" style="padding:8px;">所有部门：</div>
										<ul id="all" class="connectedSortable">
											<c:forEach items="${countersignList}" var="d">
										  		<li id="${d }" class="ui-state-default">${flowMap[d].FLAG}</li>
										  	</c:forEach>
										</ul>
									</div>
									<div style="float:left; color:red; margin:100px 0 0 30px;">
										向右拖动添加&gt;&gt;<br/><br/><br/><br/><br/><br/><br/><br/>&lt;&lt;向左拖动删除
									</div>
									<div style="float:left; margin:10px 0 0 30px;">
										<div class="ui-widget-header" style="padding:8px;">已选择会签部门：</div>
										<ul id="selectDept" class="connectedSortable">
											<c:forEach items="${selectedCountersignList}" var="d">
										  		<li id="${d }" class="ui-state-default <c:if test="${signOrderTo.orderStatus != 1 && signOrderTo.orderStatus != 2}">ui-state-disabled</c:if>">${flowMap[d].FLAG}</li>
										  	</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: left; height: 30px;" width="100%">
									备注：会签先后顺序为“已选择会签部门”中自上而下的顺序
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input id="dept" type="button" class="ui-state-default ui-corner-all" value="保存" onclick="devDeptDivBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div title="后会名单" style="display: none; overflow: visible;" id="lastCountersignDiv">
		<form id="lastCountersignDivForm" name="lastCountersignDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=signOrderCommand.updateLastCountersign">
			<input type="hidden" name="signOrderId" value="${signOrderTo.id }" /> 
			<input type="hidden" name="LAST_COUNTERSIGN_CODE_ORDER" id="chooseLastCodes" value=""/> 
			<input type="hidden" id="opTypeDept" name="opType" value="21"/>
			<input type="hidden" name="urlParam" value="${urlParam}"/>
			<input type="hidden" id="lastUserIds" value="${lastUserIds }" />
			<input type="hidden" name="updateTime" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss.SSS" type="both" value="${signOrderTo.updateTime }" />">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv" style="overflow: visible;">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">已有后会名单:<br/><span style="color:red;">(不可修改)</span></td>
								<td style="white-space: normal;" width="90%">
									<input type="text" style="width:0;height:0;border:0;visibility: hidden;" />
									<input type="text" id="input-tags1" class="input-tags demo-default" value="${lastUsers }">
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">新增后会名单:<br/><span style="color:red;">(拖动可调整顺序)</span></td>
								<td style="white-space: normal;" width="90%">
									<input type="text" style="width:0;height:0;border:0;visibility: hidden;" />
									<input type="text" id="input-tags2" class="input-tags demo-default" value="">
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: left; height: 30px;" width="100%">
									备注：添加后会名单保存后不可修改
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input id="dept" type="button" class="ui-state-default ui-corner-all" value="保存" onclick="addLastButton();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div id="opResult" title="操作提示">
  		<p id="opResultMessage">${opResultMessage }</p>
	</div>
</div>
</body>
</html>