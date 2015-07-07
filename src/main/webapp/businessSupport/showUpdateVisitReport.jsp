<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访厂管理</title>
<script type="text/javascript">
	$(function (){
		$("#visit_date").datepicker($.datepicker.regional['zh-CN']);
		$("#apply_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#apply_date_to").datepicker($.datepicker.regional['zh-CN']);
		$("#plan_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#plan_date_to").datepicker($.datepicker.regional['zh-CN']);
		$("#real_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#real_date_to").datepicker($.datepicker.regional['zh-CN']);
		
		var now = new Date();
		var oneDay = 24*60*60*1000;
		for(var i = 0; i < 7; i++){
			now.setTime(now.getTime() + oneDay);
			$("#day_" + (i + 1)).text(now.toLocaleDateString());
		}
		
		var errorMsg = "${errorMsg }";
		if (errorMsg != "") {
			alert(errorMsg);
		}
		errorMsg = "";
		document.getElementById("visitor").onkeyup = getTheSame;
	});
	
	function formatDate(date){
		alert(date.toLocaleDateString());
		alert(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
	}
	
	function getCredit(credit_id, vip_flag){
		var url = "${ctx }";
		window.parent.openCredit(url,"creditReport" + vip_flag + ".selectCreditForShow&credit_id=" + credit_id);
	}
	
	function assignVisit(visit_id, modify_date_str, credit_id){
		$("#assignVisit_div").dialog({modal:true, autoOpen:false, width:500});
		$("#cancelBut").hide();
		$("#visit_id").val(visit_id);
		$("#credit_id").val(credit_id);
		$("#modify_date_str").val(modify_date_str);
		$("#visitor_id").val("");
		$("#visitor").val("");
		$("#visit_date").val("");
		$("#visit_time").val("0");
		$("#reason_tr").hide();
		$("#memo_tr").hide();
		$("#assignVisit_div").dialog("open");
	}
	
	function noneVisit(visit_id, modify_date_str, credit_id){
		$("#noneVisit_div").dialog({modal:true, autoOpen:false, width:500});
		$("#visit_id_none").val(visit_id);
		$("#credit_id_none").val(credit_id);
		$("#modify_date_str_none").val(modify_date_str);
		$("#noneVisitMemoBut").show();
		$("#none_visit_memo").attr("disabled", false);
		$("#none_visit_reason").attr("disabled", false);
		$("#none_visit_memo").val("");
		$("#none_visit_reason").val("");
		$("#noneVisit_div").dialog("open");
	}
	
	function noneVisit_sub(e){
		$(e).hide();
		if($("#none_visit_reason").val() == ""){
			alert("请选择无需访厂原因。");
			$(e).show();
			return false;
		}
		$("#noneVisitForm").submit();
	}
	
	function changeAssign(visit_id){
		if (visit_id != '') {
			var url = "${ctx }/servlet/defaultDispatcher";
			var param = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
			$.getJSON(url, param, function (data){
				if(data.resultFlag == "true" && data.resultData.content != null){
					$("#visitor").val(data.resultData.content);
					getTheSame(0);
					$("#cancelBut").show();
					$("#reason_tr").show();
					$("#memo_tr").show();
					$("#visit_id").val(data.resultData.visit_id);
					$("#credit_id").val(data.resultData.credit_id);
					$("#modify_date_str").val(data.resultData.modify_date_str);
					$("#visit_date").val(data.resultData.assi_visit_date_str);
					$("#visit_time").val(data.resultData.assi_visit_date_time);
					$("#assignVisit_div").dialog({modal:true, autoOpen:false, width:500});
					$("#assignVisit_div").dialog("open");
				} else {
					alert("数据加载失败，请刷新页面。");
				}
			});
		} else {
			alert("页面过期，请刷新页面。");
		}
	}
	
	function assignVisit_sub(e){
		$(e).attr("disabled", true);
		var visit_by = $("#visitor_id").val();
		var visit_date = $("#visit_date").val();
		var visit_time = $("#visit_time").val();
		if(visit_by == ""){
			alert("请输入访厂人员。");
			$(e).attr("disabled", false);
			return false;
		}
		if(visit_date == ""){
			alert("请输入访厂时间。");
			$(e).attr("disabled", false);	
			return false;
		}
		if(visit_time == ""){
			alert("请输入访厂时间。");
			$(e).attr("disabled", false);
			return false;
		}
		$("#assignForm").submit();
	}
	
	function rejectVisit(visit_id, modify_date_str, credit_id){
		var url = "../servlet/defaultDispatcher";
		var data = {"__action" : "visitCommand.getCreditState",
					"credit_id" : credit_id};
		$.getJSON(url, data, function (rs){
			if(rs.state == 1){
				alert("案件已提交审查，无法驳回，如无需访厂，请走免访厂流程。");
			} else {
				$("#rejectForm_div").dialog({modal:true, autoOpen:false, width:500});
				$("#visit_id_rej").val(visit_id);
				$("#credit_id_rej").val(credit_id);
				$("#modify_date_str_rej").val(modify_date_str);
				$("#rejectForm_div").dialog("open");
			}
		});
	}
	
	function assignVisit_back(){
		if(confirm("确定要取消分配，并驳回吗？")){
			$("#visit_form_action").val("visitCommand.cancelAssign");
			$("#assignForm").submit();
		}
	}
	
	function getTheSame(e){
		if($.trim($("#visitor").val()) != ""){
			//alert("do post");
			$.ajax({
				type: 'post',
				url: "${ctx }/servlet/defaultDispatcher",
				dataType: 'json',
				data: {"__action":"riskAudit.getTheSame", "searchTo.content":$("#visitor").val()},
				success: function(data){
					$("#theSameName").html("");
					if(data != null && data.length > 0){
						if(data.length == 1 && e.keyCode != 8){
							$("#visitor").val(data[0].userName);
							$("#visitor_id").val(data[0].userId);
							$("#theSameName").css("display", "none");
						} else {
							var htmlContent = "";
							$.each(data,function(i){
								htmlContent += "<div class='nameTag" + ((i%2) + 1) + "' " + 
										"onclick=\"nameClean()\" " +
										"onmouseover=\"nameClick('" + data[i].userId + "','" + data[i].userName + "', this)\" " +
										"onmouseout=\"$(this).attr('className','nameTag" + ((i%2) + 1) + "')\" " + ">" + data[i].userName + 
										"<span id=\"span_" + i + "\" style=\"display: none;\">" + data[i].userId + "," + data[i].userName + "</span></div>";
							});
							$("#theSameName").html(htmlContent);
							$("#theSameName").css("display", "block");
						}
					} else {
						$("#theSameName").css("display", "none");
					}
				}
			});
		} else {
			$("#theSameName").html("");
			$("#theSameName").css("display", "none");
		}
	}
	function nameClean(){
		$("#theSameName").html("");
		$("#theSameName").css("display", "none");
	}
	function nameClick(userId, userName, e){
		$(e).attr('className','nameTagOver');
		$("#visitor").val(userName);
		$("#visitor_id").val(userId);
		//nameClean();
	}
	function nameOut(){
		/* var spanText = $("#span_0").text();
		if($.trim(spanText) != ''){
			var spanInfo = spanText.split(",");
			$("#visitor").val(spanInfo[1]);
			$("#visitor_id").val(spanInfo[0]);
		}
		setTimeout(nameClean, 30); */
		if($("#visitor_id").val() == ""){
			var spanText = $("#span_0").text();
			if($.trim(spanText) != ''){
				var spanInfo = spanText.split(",");
				$("#visitor").val(spanInfo[1]);
				$("#visitor_id").val(spanInfo[0]);
			}
		} 
		setTimeout(nameClean, 50);
	}
	
	function inputReport(visit_id){
		//$("#visit_form_action").val("visitCommand.inputReport");
		//$("#visit_id").val(visit_id);
		//$("#show_type").val("U");
		//$("#assignForm").submit();
		var url = "${ctx }";
		window.parent.openNewTab(url,"businessSupport.inputReport&visit_id=" + visit_id + "&show_type=U", "访厂报告");
		
	}
	
	function showReport(visit_id){
		//$("#visit_form_action").val("visitCommand.inputReport");
		//$("#visit_id").val(visit_id);
		//$("#show_type").val("F");
		//$("#assignForm").submit();
		var url = "${ctx }";
		window.parent.openNewTab(url,"businessSupport.inputReport&visit_id=" + visit_id + "&show_type=F", "访厂报告");
	}
	
	function outputReport(e){
		$(e).attr("disabled", true);
		var flag = false;
		var visit_id = null;
		$("input[name='ex_report_id']").each(function (){
			if($(this).attr("checked")){
				visit_id = $(this).val();
				flag = true;
			}
		});
		if(flag){
			var url = "${ctx }";
			//window.parent.openNewTab(url,"visitCommand.outputReport&visit_id=" + visit_id, "访厂报告");
			window.parent.callBirt("birtReport/visitation/visitationReport.rptdesign", "pdf", {"visit_id" : visit_id});
		} else {
			alert("请选择一条记录。");
		}
		$(e).attr("disabled", false);
	}
	
	function showRejectReason(visit_id){
		$("#pactAffix_" + visit_id).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=visitCommand.showRejectReason&visit_id=" + visit_id);
	        //$("#pactAffix_" + visit_id).parent().parent().toggle();
	    });
	}
	
	function showAuthMemo(visit_id){
		var url = "${ctx }/servlet/defaultDispatcher";
		var data = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
		$.post(url, data, function (result){
			if(result.resultFlag == "true"){
				$("#auth_memo").val(result.resultData.auth_memo);
				$("#authForm_div").dialog({modal:true, autoOpen:false, width:500});
				$("#authForm_div").dialog("open");
			}
		}, "json");
	}
	
	function showNoneVisitMemo(visit_id){
		var url = "${ctx }/servlet/defaultDispatcher";
		var data = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
		$.post(url, data, function (result){
			if(result.resultFlag == "true"){
				$("#none_visit_memo").val(result.resultData.none_visit_memo);
				if(result.resultData.none_visit_reason != null){
					$("#none_visit_reason").val(result.resultData.none_visit_reason);
				} else {
					$("#none_visit_reason").val("");
				}
				$("#noneVisitMemoBut").hide();
				$("#none_visit_memo").attr("disabled", true);
				$("#none_visit_reason").attr("disabled", true);
				$("#noneVisit_div").dialog({modal:true, autoOpen:false, width:500});
				$("#noneVisit_div").dialog("open");
			}
		}, "json");
	}
</script>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px;}
	.tb_return_t{border: 1px solid #A6C9E2; width: 80px; height: 22px;}
	.search_tb {border: 1px solid #A6C9E2; width: 100px; height: 20px;}
	.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	#viewAssign td {
		background-color: #ffffff;
	}
</style>
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="isSalesDesk" value="${isSalesDesk }"/>
<input type="hidden" name="__action" value="businessSupport.showUpdateVisitReport"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">访厂客户清单</c:if><c:if test="${isSalesDesk ne 'Y' }">修改访厂报告</c:if></span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
						<tr>
							<td>业务希望访厂时间：</td>
							<td><input type="text" id="apply_date_from" name="apply_date_from" value="${apply_date_from }" class="search_tb"/></td>
							<td align="center">~</td>
							<td><input type="text" id="apply_date_to" name="apply_date_to" value="${apply_date_to }" class="search_tb"/></td>
							<td>审查预计访厂时间：</td>
							<td><input type="text" id="plan_date_from" name="plan_date_from" value="${plan_date_from }" class="search_tb"/></td>
							<td align="center">~</td>
							<td><input type="text" id="plan_date_to" name="plan_date_to" value="${plan_date_to }" class="search_tb"/></td>
						</tr>
						<tr>
							<td>审查预计访厂人员：</td>
							<td><input type="text" name="plan_visitor" value="${plan_visitor }" class="search_tb"/></td>
							<td>经办人：</td>
							<td><input type="text" name="project_user" value="${project_user }" class="search_tb"/></td>
							<td>区域：</td>
							<td><input type="text" name="visit_area" value="${visit_area }" class="search_tb"/></td>
							<td>办事处：</td>
							<td><select name="search_decp" style="height: 20px; width: 100px;">
								<option value="0">全部</option>
								<option value="-1" <c:if test="${search_decp eq '-1'}">selected="selected"</c:if>>默认</option>
								<c:forEach items="${decpList }" var="decp">
									<option value="${decp.option_value }" <c:if test="${search_decp eq decp.option_value}">selected="selected"</c:if>>${decp.display_name }</option>
								</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>实际访厂时间：</td>
							<td><input type="text" id="real_date_from" name="real_date_from" value="${real_date_from }" class="search_tb"/></td>
							<td align="center">~</td>
							<td><input type="text" id="real_date_to" name="real_date_to" value="${real_date_to }" class="search_tb"/></td>
							<td>实际访厂人员：</td>
							<td><input type="text" id="real_visitor" name="real_visitor" value="${real_visitor }" class="search_tb"/></td>
							<td>状态：</td>
							<td><select name="search_status" style="height: 20px; width: 100px;">
								<option value="-1" <c:if test="${search_status eq '-1'}">selected="selected"</c:if>>全部</option>
								<option value="" <c:if test="${empty search_status}">selected="selected"</c:if>>未完成</option>
								<option value="1" <c:if test="${search_status eq '1'}">selected="selected"</c:if>>待分配</option>
								<option value="2" <c:if test="${search_status eq '2'}">selected="selected"</c:if>>待访厂</option>
								<option value="4" <c:if test="${search_status eq '4'}">selected="selected"</c:if>>无需访厂</option>
								<option value="3" <c:if test="${search_status eq '3'}">selected="selected"</c:if>>填写访厂报告中</option>
								<option value="5" <c:if test="${search_status eq '5'}">selected="selected"</c:if>>已完成</option>
								<option value="0" <c:if test="${search_status eq '0'}">selected="selected"</c:if>>驳回</option>
							</select></td>
						</tr>
						<tr>
							<td>查询内容：</td>
							<td colspan="3"><input type="text" name="search_content" value="${search_content }" style="border: 1px solid #A6C9E2; width: 257px; height: 20px;"/></td>
							<td>访厂报告结果：</td>
							<td colspan="2"><select name="visit_result" style="height: 20px; width: 100px;">
								<option value="">全部</option>
								<option value="0" <c:if test="${visit_result eq '0'}">selected="selected"</c:if>>可申请(免补)</option>
								<option value="1" <c:if test="${visit_result eq '1'}">selected="selected"</c:if>>可(补)</option>
								<option value="2" <c:if test="${visit_result eq '2'}">selected="selected"</c:if>>婉拒</option>
							</select></td>
						</tr>
					</table>
		 		</td>
				<td style="width:50px;" class="ss_bigt" valign="middle">
					<a href="javaScript:void(0)" id="search_but" onclick="$('#form1').submit();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
</div>
<br/>
<c:if test="${isSalesDesk eq 'Y' }">
	<br>
	<div style="text-align: center">
		&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
		&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
		&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
		&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
		&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
		&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
		&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
		&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
	</div>
	<br>
</c:if>
<div class="ui-state-default ui-jqgrid-hdiv ">
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr >
		<td><input type="button" value="导出访厂报告" style="width: 100px; height: 28px;" onclick="outputReport(this);"/></td>
		<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
	</tr>
</table>
<table class="grid_table">
	<tr>
		<th style="width:1%">
			<strong>&nbsp;</strong>
		</th>
		<th style="width:2%">
			<strong>序号</strong>
		</th>
		<th style="width:2%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="VISIT_STATUS"><strong>状态</strong></page:pagingSort>
		</th>
		<th style="width:5%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREDIT_RUNCODE"><strong>案件号</strong></page:pagingSort>
		</th>
		<th style="width:10%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CUST_NAME"><strong>客户名称 </strong></page:pagingSort>
		</th>
		<th style="width:5%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="DECP_NAME_CN"><strong>办事处</strong></page:pagingSort>
		</th>
		<th style="width:3%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="UP_NAME"><strong>区域<br/>主管 </strong></page:pagingSort>
		</th>
		<th style="width:3%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="NAME"><strong>客户<br/>经理 </strong></page:pagingSort>
		</th>
		<th style="width:5%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="LEASE_RZE"><strong>融资额 </strong></page:pagingSort>
		</th>
		<th style="width:6%">
			<strong>资信调<br/>查报告</strong>
		</th>
		<th>
			<strong>操作 </strong>
		</th>
		<th style="width:6%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="AUTH_DATE"><strong>业务提交时间</strong></page:pagingSort>
		</th>
		<th style="width:5%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="BUSI_HOPE_VISIT_DATE"><strong>业务希望<br/>访厂时间</strong></page:pagingSort>
		</th>
		<th style="width:3%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="VISIT_AREA"><strong>访厂<br/>区域 </strong></page:pagingSort>
		</th>
		<th style="width:6%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="EXAM_ASSI_VISIT_DATE"><strong>审查预<br/>计访厂<br/>时间 </strong></page:pagingSort>
		</th>
		<th style="width:6%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="AU_NAME"><strong>审查预<br/>计访厂<br/>人员 </strong></page:pagingSort>
		</th>
		<th style="width:5%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="REAL_VISIT_DATE"><strong>实际访厂<br/>时间 </strong></page:pagingSort>
		</th>
		<th style="width:3%">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="RU_NAME"><strong>实际<br/>访厂<br/>人员 </strong></page:pagingSort>
		</th>
	</tr>
	<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
		<tr>
			<%-- <td><input type="radio" value="${item.VISIT_ID}" <c:if test="${item.REPORT_STATUS != 1 }">disabled="disabled"</c:if> name="ex_report_id" /></td> --%>
			<td><input type="radio" value="${item.VISIT_ID}" name="ex_report_id" /></td>
			<td>${index.count }&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="showRejectReason('${item.VISIT_ID}');"><c:if test="${item.REPORT_STATUS != 1 }"><c:if test="${item.VISIT_STATUS == 0 }"><img src="${ctx }/images/u614.gif" ></c:if><c:if test="${item.VISIT_STATUS == 1 }"><img src="${ctx }/images/u608.gif"></c:if><c:if test="${item.VISIT_STATUS == 2 }"><img src="${ctx }/images/u622.gif"></c:if><c:if test="${item.VISIT_STATUS == 3 }"><img src="${ctx }/images/u620.gif"></c:if><c:if test="${item.VISIT_STATUS == 4 }"><img src="${ctx }/images/u604.gif"></c:if></c:if><c:if test="${item.REPORT_STATUS == 1 }"><img src="${ctx }/images/u611.gif" /></c:if></a>&nbsp;</td>
			<td>${item.CREDIT_RUNCODE }&nbsp;</td>
			<td>${item.CUST_NAME }&nbsp;</td>
			<td>${item.DECP_NAME_CN }&nbsp;</td>
			<td>${item.UP_NAME }</td>
			<td>${item.NAME }&nbsp;</td>
			<td><fmt:formatNumber type="currency" value="${item.LEASE_RZE }" />&nbsp;</td>
			<td>
				<a href="javascript:void(0);" onclick="getCredit('${item.ID}', '');">[查看]</a>&nbsp;&nbsp;
			</td>
			<td id="test_td">
				<%-- <c:if test="${assignRole }">
					<c:if test="${item.VISIT_STATUS == 1 }">
						<a id="noneVisit" href="javascript:void(0);" onclick="noneVisit('${item.VISIT_ID}', '<fmt:formatDate value="${item.MODIFY_DATE}" pattern="yyyy-MM-dd HH:mm:ss SSS"/>', '${item.ID}')">[无需访厂]</a>&nbsp;&nbsp;
						<a id="assignVisit" href="javascript:void(0);" onclick="assignVisit('${item.VISIT_ID}', '<fmt:formatDate value="${item.MODIFY_DATE}" pattern="yyyy-MM-dd HH:mm:ss SSS"/>', '${item.ID}')">[分配]</a>&nbsp;&nbsp;
						<a href="javascript:void(0);" onclick="rejectVisit('${item.VISIT_ID}', '<fmt:formatDate value="${item.MODIFY_DATE}" pattern="yyyy-MM-dd HH:mm:ss SSS"/>', '${item.ID}')">[驳回]</a>&nbsp;&nbsp;
					</c:if>
				</c:if>
				<c:if test="${item.VISIT_STATUS == 2 }">
					<c:if test="${assignRole }">
						<a id="assignVisit" href="javascript:void(0);" onclick="changeAssign('${item.VISIT_ID}')">[修改分配]</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${editReportRole }">
						<a href="javascript:void(0);" onclick="inputReport('${item.VISIT_ID}')">[填写访厂报告]</a>&nbsp;&nbsp;
					</c:if>
				</c:if> --%>
				<c:if test="${item.VISIT_STATUS == 3 }">
					<c:if test="${item.REPORT_STATUS == 1 || item.REPORT_STATUS == 0 }">
						<a href="javascript:void(0);" onclick="inputReport('${item.VISIT_ID}')">[修改访厂报告]</a>
					</c:if>
					<a href="javascript:void(0);" onclick="showReport('${item.VISIT_ID}')">[查看访厂报告]</a>
				</c:if>&nbsp;&nbsp;
				<c:if test="${item.VISIT_STATUS == 4 }">
					<a href="javascript:void(0);" onclick="showNoneVisitMemo('${item.VISIT_ID}')">[查看理由]</a>
				</c:if>
			</td>
			<td><a href="javascript:void(0);" onclick="showAuthMemo('${item.VISIT_ID}')"><fmt:formatDate value="${item.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</a></td>
			<td>${item.BUSI_HOPE_VISIT_DATE }&nbsp;<c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 1}">上午</c:if><c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 2}">下午</c:if><c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 0}">全天</c:if></td>
			<td>${item.VISIT_AREA }&nbsp;</td>
			<td>${item.EXAM_ASSI_VISIT_DATE }&nbsp;<c:if test="${item.EXAM_ASSI_VISIT_DATE_TIME == 1}">上午</c:if><c:if test="${item.EXAM_ASSI_VISIT_DATE_TIME == 2}">下午</c:if><c:if test="${item.EXAM_ASSI_VISIT_DATE_TIME == 0}">全天</c:if></td>
			<td>${item.AU_NAME }&nbsp;</td>
			<td>${item.NONE_VISIT_REASON }${item.REAL_VISIT_DATE }&nbsp;<c:if test="${item.REAL_VISIT_DATE_TIME == 1}">上午</c:if><c:if test="${item.REAL_VISIT_DATE_TIME == 2}">下午</c:if><c:if test="${item.REAL_VISIT_DATE_TIME == 0}">全天</c:if></td>
			<td>${item.RU_NAME }&nbsp;</td><!-- VISIT_STATUS -->
		</tr>
		<tr>
			<th colspan="18" class="pact">
				<div id="pactAffix_${item.VISIT_ID}" align="left"
					style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</th>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<font color="red"><b>*</b>&nbsp;&nbsp;</font>
				<font color="red" size="-6" style="font-weight: bold;">点击“业务提交时间”可以查看业务主管的审批意见。</font>
			</td>
			<td align="right">
				<img src="${ctx }/images/u604.gif">
				无需访厂&nbsp;
				<img src="${ctx }/images/u608.gif">
				待分配&nbsp;
				<img src="${ctx }/images/u622.gif">
				待访厂&nbsp;	
				<img src="${ctx }/images/u620.gif">
				填写访厂报告中&nbsp;
				<img src="${ctx }/images/u611.gif">
				已完成&nbsp;
				<img src="${ctx }/images/u614.gif" >
				审查驳回(点击查看原因)&nbsp;
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>
</form>

<div style="display:none;" id="assignVisit_div" title="请选择访厂人员和时间">
<form action="../servlet/defaultDispatcher" id="assignForm" method="post">
<input type="hidden" name="__action" id="visit_form_action" value="visitCommand.doAssign"/>
<input type="hidden" name="visit_id" id="visit_id" />
<input type="hidden" name="credit_id" id="credit_id" />
<input type="hidden" name="modify_date_str" id="modify_date_str" />
<input type="hidden" name="show_type" id="show_type" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>访厂人员：</strong><font color="red">*</font></td>
						<td><input type="text" name="visitor" id="visitor" class="tb_return" onfocus="$('#visitor_id').val('');" onblur="getTheSame(0);nameOut();"/>
						<input type="hidden" name="visitor_id" id="visitor_id" />
						<div id="theSameName" style="position: absolute; width: 148px; background-color: white;border: 1px solid #A6C9E2; display: none; z-index: 99;">
						</div></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>访厂日期：</strong><font color="red">*</font></td>
						<td><input type="text" id="visit_date" name="visit_date" class="tb_return"/>&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>访厂时间：</strong><font color="red">*</font></td>
						<td><select class="tb_return_t" id="visit_time" name="visit_time">
							<option value="0">全天</option>
							<option value="1">上午</option>
							<option value="2">下午</option>
						</select></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv" id="reason_tr">
						<td style="text-align: center;"><strong>驳回理由：<br/></strong><font color="red" size="-2">(非必填)</font></td>
						<td><textarea name="reject_reason" cols="55" rows="5"></textarea></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv" id="memo_tr">
						<td colspan="2"><strong><font color="red" size="-2">
							注意：“取消分配”操作会默认执行“驳回”操作，<br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							“驳回理由”只会影响“取消分配”操作。
						</font></strong></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut" value="确&nbsp;定" onclick="assignVisit_sub(this)" class="ui-state-default ui-corner-all" >
							<input type="button" value="取消分配" id="cancelBut" onclick="assignVisit_back();" class="ui-state-default ui-corner-all">
							<input type="button" value="关&nbsp;闭" onclick="$('#assignVisit_div').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
</div>

<div style="display:none;" id="rejectForm_div" title="请输入驳回理由">
<form action="../servlet/defaultDispatcher" id="rejectForm" method="post">
<input type="hidden" name="__action" id="visit_form_action_rej" value="visitCommand.rejectVisitByExam"/>
<input type="hidden" name="visit_id" id="visit_id_rej" />
<input type="hidden" name="credit_id" id="credit_id_rej" />
<input type="hidden" name="modify_date_str" id="modify_date_str_rej" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>驳回理由：<br/></strong><font color="red" size="-2">(非必填)</font></td>
						<td><textarea name="reject_reason" cols="55" rows="5"></textarea></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut_rej" value="确&nbsp;定" onclick="$('#rejectForm').submit();" class="ui-state-default ui-corner-all" >
							<input type="button" value="关&nbsp;闭" onclick="$('#rejectForm_div').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
</div>

<div style="display:none;" id="authForm_div" title="业务主管意见">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>意见：</strong></td>
						<td><textarea id="auth_memo" cols="55" rows="5" disabled="disabled"></textarea></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" value="关&nbsp;闭" onclick="$('#authForm_div').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<div style="display:none;" id="noneVisit_div" title="无需访厂">
<form action="../servlet/defaultDispatcher" id="noneVisitForm" method="post">
<input type="hidden" name="__action" id="visit_form_action_rej" value="visitCommand.noneVisitSub"/>
<input type="hidden" name="modify_date_str" id="modify_date_str_none" />
<input type="hidden" name="visit_id" id="visit_id_none" />
<input type="hidden" name="credit_id" id="credit_id_none" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>原因：</strong></td>
						<td><select id="none_visit_reason" name="none_visit_reason">
							<option value="">请选择</option>
							<option value="分批起租">分批起租</option>
							<option value="三个月内增案">三个月内增案</option>
							<option value="免访厂专案">免访厂专案</option>
							<option value="其它">其它</option>
						</select></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>备注：</strong></td>
						<td><textarea id="none_visit_memo" name="none_visit_memo" cols="55" rows="5"></textarea></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" value="提&nbsp;交" id="noneVisitMemoBut" onclick="noneVisit_sub(this);" class="ui-state-default ui-corner-all">
							<input type="button" value="关&nbsp;闭" onclick="$('#noneVisit_div').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
</div>

<div id="creditfile" align="center" title="资料管理" style="display: none;  text-align:center; width:840px">
	<img src="${ctx }/images/loading.gif">
</div>
</body>
</html>