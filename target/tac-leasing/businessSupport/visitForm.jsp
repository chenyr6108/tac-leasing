<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访厂报告书</title>
<style type="text/css">
	td{height: 25px;}
</style>
<script type="text/javascript">
	var user_map = null;
	$(function(){
		$("#visitDate").datepicker($.datepicker.regional['zh-CN']);
		var errorMsg = "${errorMsg }";
		if (errorMsg != "") {
			alert(errorMsg);
		}
		errorMsg = "";
		
		var show_type = '${show_type}';
		
		if($("#create_by").val() == ""){
			alert("报告初始化失败，请重新打开。");
		}
		if($("#visit_id").val() == ""){
			alert("报告初始化失败，请重新打开。");
		}
		if($("#credit_id").val() == ""){
			alert("报告初始化失败，请重新打开。");
		}
		
		$("input[type='text']").each(function (){
			$(this).data("old", $.trim($(this).val()));
		});
		
		$("input[type='hidden']").each(function (){
			$(this).data("old", $.trim($(this).val()));
		});
		
		$("input[relative]").each(function (){
			checkShow($(this));
		});
		
		$("input[type='radio']").click(function (){
			var eName = $(this).attr("name");
			$("input[name='" + eName +  "'][relative]").each(function (){
				checkShow($(this));
			});
		});
		
		loadLegalInfo();
		
		if(show_type == 'U'){
			//正常更新。
		} else if (show_type == 'F') {
			//查看
			$("input").each(function (){
				$(this).attr("disabled", true);
			});
			$("input[type='button']").each(function (){
				$(this).css("display", "none");
			});
			$("textarea").each(function (){
				$(this).attr("disabled", true);
			});
			$("select").each(function (){
				$(this).attr("disabled", true);
			});
			$("font").each(function (){
				$(this).css("display", "none");
			});
			$("img").each(function (){
				$(this).css("display", "none");
			});
		} else {
			alert("报告初始化失败，请重新打开。");
		}
		
		$("#progressbar").dialog({
			closeOnEscape : false,
			modal : true,
			resizable : false,
			draggable : false,
			title : "数据加载中... ..."
		});
		if(user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "employeeCommand.getAllEmpInfo"},
				dataType : "json",
				success : function (data){
					user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$("#authLeader").dropDownList(user_map);
					$("#visitor").dropDownList(user_map);
					$("#progressbar").dialog("close");
				}
			});
		}
		$("input[type='hidden']").each(function (){
			$(this).val($(this).data("old"));
		});
	});
	
	function checkShow(e){
		var relative = $(e).attr("relative");
		var rArray = relative.split(',');
		for ( var i = 0; i < rArray.length; i++) {
			if($("#" + rArray[i]).attr("name") == undefined){
				if($(e).attr("checked")){
					$("input[name='" + rArray[i] + "']").val($("#" + rArray[i]).data("old"));
					$("input[name='" + rArray[i] + "']").attr("disabled", false);
				} else {
					if($("input[name='" + rArray[i] + "']").attr("type") == "radio"){
						$("input[name='" + rArray[i] + "']").attr("checked", false);
					} else {
						$("input[name='" + rArray[i] + "']").val("");
					}
					$("input[name='" + rArray[i] + "']").attr("disabled", true);
				}
			} else {
				if($(e).attr("checked")){
					$("#" + rArray[i]).val($("#" + rArray[i]).data("old"));
					$("#" + rArray[i]).attr("disabled", false);
				} else {
					if($("#" + rArray[i]).attr("type") == "radio"){
						$("#" + rArray[i]).attr("checked", false);
					} else {
						$("#" + rArray[i]).val("");
					}
					$("#" + rArray[i]).attr("disabled", true);
				}
			}
		}
		
	}
	
	function visitReportSub(e){
		$(e).attr("disabled", true);
		$("#update_mode").val("N");
		if($("#visitDate").val() == ""){
			alert("请填写实际访厂时间。");
			$(e).attr("disabled", false);
			return;
		}
		if($("#visitor_id").val() == ""){
			alert("请填写实际访厂人员。");
			$(e).attr("disabled", false);
			return;
		}
		if($("#create_by").val() == ""){
			alert("报告初始化失败，请重新打开。");
			$(e).attr("disabled", false);
			return;
		}
		if($("#visit_id").val() == ""){
			alert("报告初始化失败，请重新打开。");
			$(e).attr("disabled", false);
			return;
		}
		if($("#credit_id").val() == ""){
			alert("报告初始化失败，请重新打开。");
			$(e).attr("disabled", false);
			return;
		}
		var flag = false;
		$("input[name$='visit_result']").each(function (){
			if($(this).attr("checked")){
				flag = true;
			}
		});
		if(!flag){
			alert("请选择结果建议。");
			$(e).attr("disabled", false);
			return;
		}
		updateLegalInfo();
		$("#reportForm").submit();
	}
	
	function subReportFinal(e){
		if(confirm("提交之后就不能再做修改了，确定要提交吗？")){
			$(e).attr("disabled", true);
			$("#update_mode").val("F");
			if($("#visitDate").val() == ""){
				alert("请填写实际访厂时间。");
				$(e).attr("disabled", false);
				return;
			}
			if($("#visitor_id").val() == ""){
				alert("请填写实际访厂人员。");
				$(e).attr("disabled", false);
				return;
			}
			if($("#create_by").val() == ""){
				alert("报告初始化失败，请重新打开。");
				$(e).attr("disabled", false);
				return;
			}
			if($("#visit_id").val() == ""){
				alert("报告初始化失败，请重新打开。");
				$(e).attr("disabled", false);
				return;
			}
			if($("#credit_id").val() == ""){
				alert("报告初始化失败，请重新打开。");
				$(e).attr("disabled", false);
				return;
			}
			var flag = false;
			$("input[name$='visit_result']").each(function (){
				if($(this).attr("checked")){
					flag = true;
				}
			});
			if(!flag){
				alert("请选择结果建议。");
				$(e).attr("disabled", false);
				return;
			}
			updateLegalInfo();
			$("#reportForm").submit();
		}
	}
	
	/* 
	<tr>
		<td class="checkboxTD">
			<div>
				<span>姓名：</span><input type="text" name="reportTo.legal_name" value="${reportTo.legal_name }" class="visit_tb_s"/>
			</div>
			<div>
				<span>职位：</span><input type="radio" name="reportTo.legal_position" value="法人代表"><span>法人代表</span>
				<input type="radio" name="reportTo.legal_position" value="总经理"><span>总经理</span>
				<input type="radio" name="reportTo.legal_position" value="副总经理"><span>副总经理</span>
				<input type="radio" name="reportTo.legal_position" value="销售主管"><span>销售主管</span>
			</div>
			<div>
				<input type="radio" name="reportTo.legal_position" value="财务主管" style="margin-left: 46px;"><span>财务主管</span>
				<input type="radio" name="reportTo.legal_position" value="其他"><span>其他</span>
				<input type="text" name="reportTo.legal_position_other" class="visit_tb_s">
			</div>
			<div>
				<span>年龄：</span><input type="text" name="reportTo.legal_age" value="${reportTo.legal_age }" class="visit_tb_s"/>
			</div>
			<img src="${ctx }/images/u103.gif" style="float: right;">
		</td>
	</tr>
	*/
	function addPanel(legal_name_val, legal_position_val, legal_age_val){
		var index = 0;
		var table = $("#panel_table");
		var trs = table.find("tr");
		if(trs.length > 0){
			index = parseInt(trs.last().attr("id")) + 1;
		} else {
			index = 1;
		}
		var tr = $("<tr>");
		tr.attr("id", index);
		var td = $("<td>");
		td.addClass("checkboxTD");
		//td.css("backgroundColor", "#E1EFFB");
		
		var div1 = $("<div>");
		div1.append("<span>姓名：</span>");
		var legal_name = $("<input>");
		legal_name.attr("type", "text")
			.attr("name", "legal_name_" + index)
			.val(legal_name_val)
			.addClass("visit_tb_s")
			.appendTo(div1);
		div1.appendTo(td);
		
		var div2 = $("<div>");
		div2.append("<span>职位：</span>");
		var legal_position_legal = $("<input>");
		legal_position_legal.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "法人代表")
			.attr("checked", legal_position_val == "法人代表");
		
		var legal_position_gm = $("<input>");
		legal_position_gm.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "总经理")
			.attr("checked", legal_position_val == "总经理");
		
		var legal_position_dgm = $("<input>");
		legal_position_dgm.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "副总经理")
			.attr("checked", legal_position_val == "副总经理");
		
		var legal_position_sales = $("<input>");
		legal_position_sales.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "销售主管")
			.attr("checked", legal_position_val == "销售主管");
		
		var legal_position_finance = $("<input>");
		legal_position_finance.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "财务主管")
			.attr("checked", legal_position_val == "财务主管");
		
		var otherFlag = legal_position_val != "法人代表" && legal_position_val != "总经理"
			&& legal_position_val != "副总经理" && legal_position_val != "销售主管" && legal_position_val != "财务主管";
		var legal_position_other = $("<input>");
		legal_position_other.attr("type", "radio")
			.attr("name", "legal_position_" + index)
			.attr("value", "其他")
			.attr("relative", "legal_position_other_" + index)
			.attr("checked", otherFlag)
			.css("marginLeft", "46px");
		
		var legal_position_other_text = $("<input>");
		legal_position_other_text.attr("type", "text")
			.attr("name", "legal_position_other_" + index)
			.attr("id", "legal_position_other_" + index)
			.attr("disabled", !otherFlag)
			.val(otherFlag ? legal_position_val : "")
			.addClass("visit_tb_s");
		
		div2.append(legal_position_legal).append("<span>法人代表</span>")
			.append(legal_position_gm).append("<span>总经理</span>")
			.append(legal_position_dgm).append("<span>副总经理</span>")
			.append(legal_position_sales).append("<span>销售主管</span>")
			.append(legal_position_finance).append("<span>财务主管</span>")
			.appendTo(td);
		
		var div3 = $("<div>");
		div3.append(legal_position_other).append("<span>其他</span>")
			.append(legal_position_other_text)
			.appendTo(td);
		
		var div4 = $("<div>");
		div4.append("<span>年龄：</span>");
		var legal_age = $("<input>")
			.attr("name", "legal_age_other_" + index)
			.val(legal_age_val)
			.attr("type", "text")
			.addClass("visit_tb_xs");
		div4.append(legal_age)
			.append("<span>岁</span>")
			.appendTo(td);
		
		var img = $("<img>");
		img.attr("src","${ctx }/images/u103.gif")
			.css("float", "right")
			.css("cursor", "pointer")
			.click(function (){
				$(this).parent().parent().parent().remove();
			})
			.appendTo(div4);
		
		td.find("input[type='radio']").click(function (){
			var eName = $(this).attr("name");
			$("input[name='" + eName +  "'][relative]").each(function (){
				checkShow($(this));
			});
		});
		tr.append(td).appendTo(table);
	}
	
	function updateLegalInfo(){
		$("#legal_name").val("");
		$("#legal_position").val("");
		$("#legal_age").val("");
		$("#panel_table").find("input[name^='legal_name_']").each(function (){
			$("#legal_name").val($("#legal_name").val() + $(this).val() + ",");
		});
		$("#panel_table").find("input[type='radio'][name^='legal_position_']").each(function (){
			if ($(this).attr("checked")) {
				if ($(this).val() == "其他") {
					$("#legal_position").val($("#legal_position").val() + $(this).next().next().val() + ",");
				} else {
					$("#legal_position").val($("#legal_position").val() + $(this).val() + ",");
				}
			}
		});
		$("#panel_table").find("input[name^='legal_age_']").each(function (){
			$("#legal_age").val($("#legal_age").val() + $(this).val() + ",");
		});
		if($("#legal_name").val().length > 0){
			$("#legal_name").val($("#legal_name").val().substring(0, $("#legal_name").val().length - 1));
			$("#legal_position").val($("#legal_position").val().substring(0, $("#legal_position").val().length - 1));
			$("#legal_age").val($("#legal_age").val().substring(0, $("#legal_age").val().length - 1));
		}
	}
	
	function loadLegalInfo(){
		legal_names = $("#legal_name").val().split(",");
		legal_positions = $("#legal_position").val().split(",");
		legal_ages = $("#legal_age").val().split(",");
		for ( var i = 0; i < legal_names.length; i++) {
			addPanel(legal_names[i], legal_positions[i], legal_ages[i]);
		}
	}
	
	function changeHidden(e, id){
		$("#" + id).val($(e).attr("title"));
	}
	
</script>
<style type="text/css">
	.visit_tb{
		border: #C0C0C0 solid 1px;
		width: 400px;
		height: 22px;
	}
	.visit_tb_s{
		border: #C0C0C0 solid 1px;
		width: 200px;
		height: 22px;
	}
	.visit_tb_xs{
		border: #C0C0C0 solid 1px;
		width: 50px;
		height: 22px;
	}
	.visit_tb_title{
		border: #C0C0C0 solid 1px;
		width: 150px;
		height: 22px;
	}
	.visit_ta{
		border: #C0C0C0 solid 1px;
	}
	.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	
	.checkboxTD input{display: block; float: left;}
	.checkboxTD span{display: block; float: left; margin-top: 4px; margin-right: 5px;}
	
	.checkboxTD div input{display: block; float: left;}
	.checkboxTD div span{display: block; float: left; margin-top: 4px; margin-right: 5px;}
	.checkboxTD div{display: block; margin-bottom: 3px; margin-top: 2px; float: left; width: 100%;}
	.panel_td{border-right: 0px;}
</style>
</head>
<body>
<div id="progressbar" style="display: none;">
	<img src="${ctx }/images/loading.gif">
</div>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 800px;">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;访厂报告</span>
</div>
<font color="red">${errorMsg }</font>
<form action="../servlet/defaultDispatcher" id="reportForm" method="post">
<input type="hidden" name="__action" id="visit_form_action" value="businessSupport.doInputReport"/>
<input type="hidden" name="reportTo.visit_id" id="visit_id" value="${reportTo.visit_id }" />
<input type="hidden" name="reportTo.report_id" id="report_id" value="${reportTo.report_id }"/>
<input type="hidden" name="reportTo.credit_id" id="credit_id" value="${reportTo.credit_id }"/>
<input type="hidden" name="reportTo.modify_date_str" id="modify_date_str" value="${reportTo.modify_date_str }"/>
<input type="hidden" name="update_mode" id="update_mode"/>
<br/>
<table cellpadding="0" cellspacing="5" class="align_left" style="width: 800px;">
	<tr>
		<th style="width: 20%">实际访厂时间：</th>
		<td style="width: 30%"><input type="text" id="visitDate" name="reportTo.real_visit_date_str" value="${reportTo.real_visit_date_str }" class="visit_tb_title" readonly="readonly"/></td>
		<th style="width: 20%">实际访厂人员：</th>
		<td style="width: 30%">
			<input type="text" name="reportTo.real_visitor" id="visitor" value="${reportTo.real_visitor }" class="visit_tb_title" />
		</td>
	</tr>
	<tr>
		<th style="width: 150px;">报告填写人： </th>
		<c:choose><c:when test="${not empty reportTo.create_by }">
			<c:set var="create_id" value="${reportTo.create_by }"/>
			<c:set var="create_name" value="${reportTo.create_by_name }"/>
		</c:when>
		<c:otherwise>
			<c:set var="create_id" value="${s_employeeId }"/>
			<c:set var="create_name" value="${s_employeeName }"/>
		</c:otherwise>
		</c:choose>
		<td style="width: 150px;"><input type="text" name="reportTo.create_by_name" value="${create_name }" readonly="readonly" class="visit_tb_title"/>
			<input type="hidden" name="reportTo.create_by" value="${create_id }" id="create_by"/></td>
		<th style="width: 150px;">业务员： </th>
		<td style="width: 150px;"><input type="text" name="reportTo.sensor_name" value="${reportTo.sensor_name}" readonly="readonly" class="visit_tb_title"/></td>
		
	</tr>
	<tr>
		<th>审查处访厂主管：</th>
		<td>
			<input type="text" name="reportTo.authLeader" id="authLeader" value="${reportTo.authLeader}" class="visit_tb_title"/>
		</td>
	</tr>
	<tr>
		<th>案件类型：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.cust_type" value="新户" <c:if test="${reportTo.cust_type eq '新户'}">checked="checked"</c:if>><span>新户</span>
			<input type="radio" name="reportTo.cust_type" value="既有客户（含关联户）" <c:if test="${reportTo.cust_type eq '既有客户（含关联户）'}">checked="checked"</c:if>><span>既有客户（含关联户）</span>
		</td>
		<th style="width: 150px;">业务主管是否访厂：</th>
		<td><select name="reportTo.busi_manager" style="height: 22px; width: 80px;">
			<option value="否" <c:if test="${reportTo.busi_manager eq '否'}">selected="selected"</c:if>>否</option>
			<option value="是" <c:if test="${reportTo.busi_manager eq '是'}">selected="selected"</c:if>>是</option>
		</select></td>
	</tr>
</table>
<br/>
<table class="panel_table align_left" style="width: 800px;">
	<tr>
		<th valign="middle" rowspan="8" style="font-size: 15px; width: 40px; padding-left: 9px;">承<br/><br/>租<br/><br/>人</th>
		<th style="width: 280px;">公司名称：</th>
		<td style="width: 480px;"><input type="text" name="reportTo.cust_name" readonly="readonly" value="${reportTo.cust_name }" class="visit_tb"/></td>
	</tr>
	<tr>
		<th>预计申请额度：</th>
		<td>RMB：<input type="text" name="reportTo.cust_apply_amount" value="${reportTo.cust_apply_amount }" class="visit_tb_s"/>元</td>
	</tr>
	<tr>
		<th>预计申请租赁方式：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.contract_type" value="直接租赁" <c:if test="${reportTo.contract_type eq '直接租赁'}">checked="checked"</c:if>><span>直接租赁</span>
			<input type="radio" name="reportTo.contract_type" value="回租" <c:if test="${reportTo.contract_type eq '回租'}">checked="checked"</c:if>><span>回租</span>
			<input type="radio" name="reportTo.contract_type" value="其他" relative="contract_type_other" <c:if test="${reportTo.contract_type eq '其他'}">checked="checked"</c:if>><span>其他：</span>
			<input type="text" name="reportTo.contract_type_other" id="contract_type_other" class="visit_tb_s" value="${reportTo.contract_type_other }">
		</td>
	</tr>
	<tr>
		<th>保证内容(包含预测保证)：</th>
		<td><input type="text" name="reportTo.cust_guar" value="${reportTo.cust_guar }" class="visit_tb"/></td>
	</tr>
	<tr>
		<th>公司形态及组织：</th>
		<td class="checkboxTD">
			<div>
				<span>1.</span><input type="radio" name="reportTo.cust_comp_status" value="内资" <c:if test="${reportTo.cust_comp_status eq '内资'}">checked="checked"</c:if>><span>内资</span>
				<input type="radio" name="reportTo.cust_comp_status" value="外资" <c:if test="${reportTo.cust_comp_status eq '外资'}">checked="checked"</c:if>><span>外资</span>
				<input type="radio" name="reportTo.cust_comp_status" value="中外合资" <c:if test="${reportTo.cust_comp_status eq '中外合资'}">checked="checked"</c:if>><span>中外合资</span>
			</div>
			<div>
				<span>2.</span><input type="radio" name="reportTo.cust_comp_status2" value="有限公司" <c:if test="${reportTo.cust_comp_status2 eq '有限公司'}">checked="checked"</c:if>><span>有限公司</span>
				<input type="radio" name="reportTo.cust_comp_status2" value="独资" <c:if test="${reportTo.cust_comp_status2 eq '独资'}">checked="checked"</c:if>><span>独资</span>
				<input type="radio" name="reportTo.cust_comp_status2" value="个体工商户" <c:if test="${reportTo.cust_comp_status2 eq '个体工商户'}">checked="checked"</c:if>><span>个体工商户</span>
				<input type="radio" name="reportTo.cust_comp_status2" value="股份有限公司" <c:if test="${reportTo.cust_comp_status2 eq '股份有限公司'}">checked="checked"</c:if>><span>股份有限公司</span>
				<input type="radio" name="reportTo.cust_comp_status2" value="合伙企业" <c:if test="${reportTo.cust_comp_status2 eq '合伙企业'}">checked="checked"</c:if>><span>合伙企业</span>
			</div>
		</td>
	</tr>
	<tr>
		<th>股东背景及关系：（可复选）</th>
		<td class="checkboxTD">
			<input type="checkbox" name="reportTo.cust_relation" value="夫妻" <c:if test="${fn:contains(reportTo.cust_relation, '夫妻')}">checked="checked"</c:if>><span>夫妻</span>
			<input type="checkbox" name="reportTo.cust_relation" value="直系亲属" <c:if test="${fn:contains(reportTo.cust_relation, '直系亲属')}">checked="checked"</c:if>><span>直系亲属</span>
			<input type="checkbox" name="reportTo.cust_relation" value="亲戚" <c:if test="${fn:contains(reportTo.cust_relation, '亲戚')}">checked="checked"</c:if>><span>亲戚</span>
			<input type="checkbox" name="reportTo.cust_relation" value="朋友" <c:if test="${fn:contains(reportTo.cust_relation, '朋友')}">checked="checked"</c:if>><span>朋友</span>
		</td>
	</tr>
	<tr>
		<th>主要产品及用途：(可复选)</th>
		<td class="checkboxTD">
			<div>
			<input type="checkbox" name="reportTo.cust_product" value="纯代工" relative="cust_product_process" onclick="checkShow(this);" <c:if test="${fn:contains(reportTo.cust_product , '纯代工')}">checked="checked"</c:if>><span>纯代工</span>
			<span>加工产品：</span>
			<input type="text" name="reportTo.cust_product_process" id="cust_product_process" value="${reportTo.cust_product_process }" class="visit_tb_s"/>
			</div>
			<div>
			<input type="checkbox" name="reportTo.cust_product" value="代工代料" <c:if test="${fn:contains(reportTo.cust_product , '代工代料')}">checked="checked"</c:if>><span>代工代料</span>
			<input type="checkbox" name="reportTo.cust_product" value="比例" relative="cust_product_percent1,cust_product_percent2" onclick="checkShow(this);" <c:if test="${fn:contains(reportTo.cust_product , '比例')}">checked="checked"</c:if>><span>（代工比例</span>
			<input type="text" name="reportTo.cust_product_percent1" id="cust_product_percent1" class="visit_tb_xs" value="${reportTo.cust_product_percent1 }"/><span>%；代料比例</span>
			<input type="text" name="reportTo.cust_product_percent2" id="cust_product_percent2" class="visit_tb_xs" value="${reportTo.cust_product_percent2 }"/><span>%）</span>
			</div>
			<div>
			<input type="checkbox" name="reportTo.cust_product" value="自有产品" relative="cust_product_other" onclick="checkShow(this);" <c:if test="${fn:contains(reportTo.cust_product , '自有产品')}">checked="checked"</c:if>><span>自有产品（请说明）：</span>
			<input type="text" name="reportTo.cust_product_other" id="cust_product_other" value="${reportTo.cust_product_other }" class="visit_tb_s"/>
			</div>
		</td>
	</tr>
	<tr>
		<th>开票比例：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.cust_invoice" value="100%" <c:if test="${reportTo.cust_invoice eq '100%'}">checked="checked"</c:if>><span>100%</span>
			<input type="radio" name="reportTo.cust_invoice" value="99%~80%" <c:if test="${reportTo.cust_invoice eq '99%~80%'}">checked="checked"</c:if>><span>99%~80%</span>
			<input type="radio" name="reportTo.cust_invoice" value="79%~60%" <c:if test="${reportTo.cust_invoice eq '79%~60%'}">checked="checked"</c:if>><span>79%~60%</span>
			<input type="radio" name="reportTo.cust_invoice" value="59%~40%" <c:if test="${reportTo.cust_invoice eq '59%~40%'}">checked="checked"</c:if>><span>59%~40%</span>
			<input type="radio" name="reportTo.cust_invoice" value="39%~20%" <c:if test="${reportTo.cust_invoice eq '39%~20%'}">checked="checked"</c:if>><span>39%~20%</span>
			<input type="radio" name="reportTo.cust_invoice" value="20%以下" <c:if test="${reportTo.cust_invoice eq '20%以下'}">checked="checked"</c:if>><span>20%以下</span>
			<input type="radio" name="reportTo.cust_invoice" value="新公司尚未开票" <c:if test="${reportTo.cust_invoice eq '新公司尚未开票'}">checked="checked"</c:if>><span>新公司尚未开票</span>
		</td>
	</tr>
	
	<tr>
		<th valign="middle" align="center" rowspan="3" style="font-size: 15px; padding-left: 9px;">法<br/>人<br/>代<br/>表<br/>或<br/>负<br/>责<br/>人<br/>背<br/>景</th>
		<th>
			<span style="cursor: pointer;" onclick="addPanel('','','');">面谈者：
			<br/>
			(1)姓名、职位、出生年月(几岁)：<img src="${ctx }/images/u100.gif">
			</span>
			<input type="hidden" name="reportTo.legal_name" id="legal_name" value="${reportTo.legal_name}">
			<input type="hidden" name="reportTo.legal_position" id="legal_position" value="${reportTo.legal_position}">
			<input type="hidden" name="reportTo.legal_age" id="legal_age" value="${reportTo.legal_age}">
		</th>
		<td id="legal_td" style="padding: 0px; min-height: 100px;" >
			<table style="margin: 0px;" cellpadding="0" cellspacing="0" id="panel_table">
			</table>
		</td>
	</tr>
	<tr>
		<th>(2)国家地区：</th>
		<td class="checkboxTD">
			<input type="hidden" name="reportTo.legal_address2" id="legal_address2" value="${reportTo.legal_address2}">
			<div>
				<input type="radio" name="reportTo.legal_address" value="中国" relative="legal_address2_radio,legal_address2" <c:if test="${reportTo.legal_address eq '中国'}">checked="checked"</c:if>><span>中国</span>
				<span>（${reportTo.legal_address2}</span>
				<input type="radio" name="legal_address2_radio" title="本地人" <c:if test="${reportTo.legal_address2 eq '本地人'}">checked="checked"</c:if> onclick="changeHidden(this, 'legal_address2');"><span>本地人；</span>
				<input type="radio" name="legal_address2_radio" title="外地人" <c:if test="${reportTo.legal_address2 eq '外地人'}">checked="checked"</c:if> onclick="changeHidden(this, 'legal_address2');"><span>外地人</span>
				<span>）</span>
				<input type="radio" name="reportTo.legal_address" value="台湾" <c:if test="${reportTo.legal_address eq '台湾'}">checked="checked"</c:if>><span>台湾</span>
				<input type="radio" name="reportTo.legal_address" value="港澳地区" <c:if test="${reportTo.legal_address eq '港澳地区'}">checked="checked"</c:if>><span>港澳地区</span>
			</div>
			<div>
				<input type="radio" name="reportTo.legal_address" value="其他" relative="legal_address_other" <c:if test="${reportTo.legal_address eq '其他'}">checked="checked"</c:if>><span>其他</span>
				<input type="text" name="reportTo.legal_address_other" id="legal_address_other" class="visit_tb_s" value="${reportTo.legal_address_other }">
			</div>
		</td>
	</tr>
	<tr>
		<th valign="middle">(3)本业资历(创业历程)：</th>
		<td class="checkboxTD">
			<div>
				<span>1.&nbsp;&nbsp;从事本业相关资历</span>
				<input type="text" name="reportTo.legal_experience_year1" class="visit_tb_xs" value="${reportTo.legal_experience_year1}">
				<span>年；经营企业（含关联企业）</span>
				<input type="text" name="reportTo.legal_experience_year2" class="visit_tb_xs" value="${reportTo.legal_experience_year2}">
				<span>年</span>
			</div>
			<div>
				<span>2.&nbsp;&nbsp;有无关联企业：</span>
			</div>
			<div style="margin-left: 15px;">
				<input type="radio" name="reportTo.legal_experience_affiliated" value="无" <c:if test="${reportTo.legal_experience_affiliated eq '无'}">checked="checked"</c:if>><span>无；</span>
				<input type="radio" name="reportTo.legal_experience_affiliated" value="有" relative="legal_experience_affiliated_company" <c:if test="${reportTo.legal_experience_affiliated eq '有'}">checked="checked"</c:if>><span>有，公司名称：</span>
				<input type="text" name="reportTo.legal_experience_affiliated_company" id="legal_experience_affiliated_company" class="visit_tb_s" value="${reportTo.legal_experience_affiliated_company }">
			</div>
			<div>
				<span>3.</span>
				<input type="radio" name="reportTo.legal_experience_from" value="业务出身" <c:if test="${reportTo.legal_experience_from eq '业务出身'}">checked="checked"</c:if>><span>业务出身</span>
				<input type="radio" name="reportTo.legal_experience_from" value="技术出身" <c:if test="${reportTo.legal_experience_from eq '技术出身'}">checked="checked"</c:if>><span>技术出身</span>
				<input type="radio" name="reportTo.legal_experience_from" value="财务出身" <c:if test="${reportTo.legal_experience_from eq '财务出身'}">checked="checked"</c:if>><span>财务出身</span>
				<input type="radio" name="reportTo.legal_experience_from" value="采购或品保出身" <c:if test="${reportTo.legal_experience_from eq '采购或品保出身'}">checked="checked"</c:if>><span>采购或品保出身</span>
				<input type="radio" name="reportTo.legal_experience_from" value="合伙企业" <c:if test="${reportTo.legal_experience_from eq '合伙企业'}">checked="checked"</c:if>><span>合伙企业</span>
			</div>
			<div style="margin-left: 15px;">
				<input type="radio" name="reportTo.legal_experience_from" value="曾任职于" relative="legal_experience_from_other,legal_experience_from_year" <c:if test="${reportTo.legal_experience_from eq '曾任职于'}">checked="checked"</c:if>>
				<span>曾任职于</span>
				<input type="text" name="reportTo.legal_experience_from_other" id="legal_experience_from_other" class="visit_tb_s" value="${reportTo.legal_experience_from_other }">
				<span>，担任主管</span>
				<input type="text" name="reportTo.legal_experience_from_year" id="legal_experience_from_year" class="visit_tb_xs" value="${reportTo.legal_experience_from_year }">
				<span>年</span>
			</div>
			<div>
				<span>4.</span>
				<input type="checkbox" name="reportTo.legal_experience_inherit" value="Y" <c:if test="${reportTo.legal_experience_inherit eq 'Y'}">checked="checked"</c:if>>
				<span>继承及经营家族企业</span>
			</div>
			<div>
				<span>5.</span>
				<input type="checkbox" name="reportTo.legal_experience_flag" value="Y" relative="legal_experience" onclick="checkShow(this);" <c:if test="${reportTo.legal_experience_flag eq 'Y'}">checked="checked"</c:if>>
				<span>其他：（说明）</span>
				<input type="text" name="reportTo.legal_experience" id="legal_experience" class="visit_tb_s" value="${reportTo.legal_experience }">
			</div>
			<%-- <textarea name="reportTo.legal_experience" cols="75" rows="6"  class="visit_ta">${reportTo.legal_experience}</textarea> --%>
		</td>
	</tr>
	
	<tr>
		<th valign="middle" align="center" rowspan="9" style="font-size: 15px; padding-left: 9px;">厂<br/><br/>方<br/><br/>环<br/><br/>境</th>
		<th>(1)是否自己所有：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_is_self" value="自有" <c:if test="${reportTo.factory_is_self eq '自有'}">checked="checked"</c:if>/><span>自有</span>
			<input type="radio" name="reportTo.factory_is_self" value="租赁" <c:if test="${reportTo.factory_is_self eq '租赁'}">checked="checked"</c:if>/><span>租赁</span>
		</td>
	</tr>
	<tr>
		<th>(2)有无员工宿舍：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_has_dorm" value="有" <c:if test="${reportTo.factory_has_dorm eq '有'}">checked="checked"</c:if>/><span>有</span>
			<input type="radio" name="reportTo.factory_has_dorm" value="无" <c:if test="${reportTo.factory_has_dorm eq '无'}">checked="checked"</c:if>/><span>无</span>
		</td>
	</tr>
	<tr>
		<th>(3)有无员工食堂：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_has_mess" value="有" <c:if test="${reportTo.factory_has_mess eq '有'}">checked="checked"</c:if>/><span>有</span>
			<input type="radio" name="reportTo.factory_has_mess" value="无" <c:if test="${reportTo.factory_has_mess eq '无'}">checked="checked"</c:if>/><span>无</span>
		</td>
	</tr>
	<tr>
		<th>(4)生产车间清洁度：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_clean" value="整齐" <c:if test="${reportTo.factory_clean eq '整齐'}">checked="checked"</c:if>/><span>整齐</span>
			<input type="radio" name="reportTo.factory_clean" value="一般" <c:if test="${reportTo.factory_clean eq '一般'}">checked="checked"</c:if>/><span>一般</span>
			<input type="radio" name="reportTo.factory_clean" value="杂乱" <c:if test="${reportTo.factory_clean eq '杂乱'}">checked="checked"</c:if>/><span>杂乱</span>
		</td>
	</tr>
	<tr>
		<th>(5)工厂工人人数及轮班次数：</th>
		<td class="checkboxTD">
			<span>员工</span>
			<input type="text" name="reportTo.factory_worker" class="visit_tb_xs" value="${reportTo.factory_worker }">
			<span>人；分</span>
			<input type="text" name="reportTo.factory_worker_class" class="visit_tb_xs" value="${reportTo.factory_worker_class }">
			<span>班制生产</span>
		</td>
	</tr>
	<tr>
		<th>(6)稼动率：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_jia_dong" value="100%" <c:if test="${reportTo.factory_jia_dong eq '100%'}">checked="checked"</c:if>><span>100%</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="99%~80%" <c:if test="${reportTo.factory_jia_dong eq '99%~80%'}">checked="checked"</c:if>><span>99%~80%</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="79%~60%" <c:if test="${reportTo.factory_jia_dong eq '79%~60%'}">checked="checked"</c:if>><span>79%~60%</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="59%~40%" <c:if test="${reportTo.factory_jia_dong eq '59%~40%'}">checked="checked"</c:if>><span>59%~40%</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="39%~20%" <c:if test="${reportTo.factory_jia_dong eq '39%~20%'}">checked="checked"</c:if>><span>39%~20%</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="20%以下" <c:if test="${reportTo.factory_jia_dong eq '20%以下'}">checked="checked"</c:if>><span>20%以下</span>
			<input type="radio" name="reportTo.factory_jia_dong" value="新公司尚未生产" <c:if test="${reportTo.factory_jia_dong eq '新公司尚未生产'}">checked="checked"</c:if>><span>新公司尚未生产</span>
		</td>
	</tr>
	<tr>
		<th>(7)本次申请设备用途：（可复选）</th>
		<td class="checkboxTD">
			<div>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="新客户及新订单" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '新客户及新订单')}">checked="checked"</c:if>><span>新客户及新订单</span>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="生产新产品" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '生产新产品')}">checked="checked"</c:if>><span>生产新产品</span>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="设备汰旧换新" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '设备汰旧换新')}">checked="checked"</c:if>><span>设备汰旧换新</span>
			</div>
			<div>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="提高产能及效率，良率" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '提高产能及效率，良率')}">checked="checked"</c:if>><span>提高产能及效率，良率</span>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="委外代工，收回自行生产" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '委外代工，收回自行生产')}">checked="checked"</c:if>><span>委外代工，收回自行生产</span>
			</div>
			<div>
				<input type="checkbox" name="reportTo.factory_apply_use_to" value="回租案件资金用途" relative="factory_apply_use_to_other" onclick="checkShow(this);" <c:if test="${fn:contains(reportTo.factory_apply_use_to, '回租案件资金用途')}">checked="checked"</c:if>><span>回租案件资金用途：</span>
				<input type="text" name="reportTo.factory_apply_use_to_other" id="factory_apply_use_to_other" value="${reportTo.factory_apply_use_to_other }" class="visit_tb_s"/>
			</div>
		</td>
	</tr>
	<tr>
		<th>(8)工厂工人劳动态度：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_worker_attitude" value="勤劳" <c:if test="${reportTo.factory_worker_attitude eq '勤劳'}">checked="checked"</c:if>><span>勤劳</span>
			<input type="radio" name="reportTo.factory_worker_attitude" value="一般" <c:if test="${reportTo.factory_worker_attitude eq '一般'}">checked="checked"</c:if>><span>一般</span>
			<input type="radio" name="reportTo.factory_worker_attitude" value="懒散" <c:if test="${reportTo.factory_worker_attitude eq '懒散'}">checked="checked"</c:if>><span>懒散</span>
			<input type="radio" name="reportTo.factory_worker_attitude" value="新公司尚无工人" <c:if test="${reportTo.factory_worker_attitude eq '新公司尚无工人'}">checked="checked"</c:if>><span>新公司尚无工人</span>
		</td>
	</tr>
	<tr>
		<th>(9)有无穿工作服：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.factory_has_overalls" value="有" <c:if test="${reportTo.factory_has_overalls eq '有'}">checked="checked"</c:if>/><span>有</span>
			<input type="radio" name="reportTo.factory_has_overalls" value="无" <c:if test="${reportTo.factory_has_overalls eq '无'}">checked="checked"</c:if>/><span>无</span>
		</td>
	</tr>
	<tr>
		<th valign="middle" align="center" style="font-size: 15px; padding-left: 9px;">存<br/>货</th>
		<th>工厂存货状况，(1)放置状况(整齐与否)：</th>
		<td class="checkboxTD">
			<div>
				<input type="radio" name="reportTo.inventory_status" value="无" <c:if test="${reportTo.inventory_status eq '无'}">checked="checked"</c:if>/><span>无</span>
			</div>
			<div>
				<input type="radio" name="reportTo.inventory_status" value="有" relative="inventory_put_status,inventory_put_status_radio" <c:if test="${reportTo.inventory_status eq '有'}">checked="checked"</c:if>/><span>有</span>
				<span>（</span>
				<input type="hidden" name="reportTo.inventory_put_status" id="inventory_put_status" value="${reportTo.inventory_put_status}"/>
				<input type="radio" name="inventory_put_status_radio" title="整齐" <c:if test="${reportTo.inventory_put_status eq '整齐'}">checked="checked"</c:if> onclick="changeHidden(this, 'inventory_put_status');"/><span>整齐</span>
				<input type="radio" name="inventory_put_status_radio" title="一般" <c:if test="${reportTo.inventory_put_status eq '一般'}">checked="checked"</c:if> onclick="changeHidden(this, 'inventory_put_status');"/><span>一般</span>
				<input type="radio" name="inventory_put_status_radio" title="杂乱" <c:if test="${reportTo.inventory_put_status eq '杂乱'}">checked="checked"</c:if> onclick="changeHidden(this, 'inventory_put_status');"/><span>杂乱</span>
				<span>）</span>
			</div>
		</td>
	</tr>
	<%-- <tr>
		<th>(1)放置状况(整齐与否)：</th>
		<td class="checkboxTD"><input type="text" name="reportTo.inventory_put_status" value="${reportTo.inventory_put_status }" class="visit_tb"/></td>
	</tr> --%>
	<tr>
		<th valign="middle" align="center" rowspan="2" style="font-size: 15px; padding-left: 9px;">办<br/>公<br/>室</th>
		<th>(1)有无工作服：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.manage_has_overalls" value="有" <c:if test="${reportTo.manage_has_overalls eq '有'}">checked="checked"</c:if>/><span>有</span>
			<input type="radio" name="reportTo.manage_has_overalls" value="无" <c:if test="${reportTo.manage_has_overalls eq '无'}">checked="checked"</c:if>/><span>无</span>
		</td>
	</tr>
	<tr>
		<th>(2)劳动态度：</th>
		<td class="checkboxTD">
			<input type="radio" name="reportTo.manage_work_attitude" value="认真或热络" <c:if test="${reportTo.manage_work_attitude eq '认真或热络'}">checked="checked"</c:if>/><span>认真或热络</span>
			<input type="radio" name="reportTo.manage_work_attitude" value="一般" <c:if test="${reportTo.manage_work_attitude eq '一般'}">checked="checked"</c:if>/><span>一般</span>
			<input type="radio" name="reportTo.manage_work_attitude" value="冷清或少人办公" <c:if test="${reportTo.manage_work_attitude eq '冷清或少人办公'}">checked="checked"</c:if>/><span>冷清或少人办公</span>
		</td>
	</tr>
	<tr>
		<th style="padding-left: 9px;">增<br/>提<br/>资<br/>料</th>
		<td colspan="2"><textarea name="reportTo.added_info" cols="120" rows="5"  class="visit_ta">${reportTo.added_info }</textarea></td>
	</tr>
	<tr>
		<th style="padding-left: 9px;">建<br/>议</th>
		<td colspan="2" class="checkboxTD">
			<input type="radio" value="0" name="reportTo.visit_result" <c:if test="${reportTo.visit_result eq 0 }">checked="checked"</c:if>/><span>可申请(免补)</span>
			<input type="radio" value="1" name="reportTo.visit_result" <c:if test="${reportTo.visit_result eq 1 }">checked="checked"</c:if>/><span>可(补)</span>
			<input type="radio" value="2" name="reportTo.visit_result" <c:if test="${reportTo.visit_result eq 2 }">checked="checked"</c:if>/><span>婉拒</span>
		</td>
	</tr>
	<tr>
		<th style="padding-left: 9px;">理<br/>由</th>
		<td colspan="2">
			S（优势）：<br/>
			<textarea name="reportTo.reason_s" cols="120" rows="3"  class="visit_ta">${reportTo.reason_s}</textarea>
			<br/>W（弱势）：<br/>
			<textarea name="reportTo.reason_w" cols="120" rows="3"  class="visit_ta">${reportTo.reason_w}</textarea>
			<br/>O（机会）：<br/>
			<textarea name="reportTo.reason_o" cols="120" rows="3"  class="visit_ta">${reportTo.reason_o}</textarea>
			<br/>T（威胁）：<br/>
			<textarea name="reportTo.reason_t" cols="120" rows="3"  class="visit_ta">${reportTo.reason_t}</textarea>
			<br/>总结：<br/>
			<textarea name="reportTo.reason" cols="120" rows="5"  class="visit_ta">${reportTo.reason}</textarea>
		</td>
	</tr>
	<tr>
		<th colspan="3" style="text-align: center!important;">
			<input type="button" value="保存" onclick="visitReportSub(this);" class="panel_button"/>
			<!-- &nbsp;&nbsp; -->
			<!-- <input type="button" value="提交访厂报告" onclick="subReportFinal(this);" class="panel_button"/> -->
		</th>
	</tr>
</table>
</form>
<!-- <font color="red">
&nbsp;&nbsp;* “保存”只会保存当前报告，之后还可以做修改，不是最终报告。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;“提交访厂报告”会保存当前报告，并且以后不能再修改，为最终报告。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;只有“提交访厂报告”后，才能导出访厂报告。
</font> -->
</body>
</html>