var returnOption1 = $("<option>");
returnOption1.attr("value", "业务意见").text("业务意见");
var returnOption1_1 = $("<option>");
returnOption1_1.attr("value", "租赁方案修改").text("租赁方案修改");
var returnOption1_2 = $("<option>");
returnOption1_2.attr("value", "报告内容修改").text("报告内容修改");
var returnOption1_3 = $("<option>");
returnOption1_3.attr("value", "缺少必备文件").text("缺少必备文件");
var returnOption2 = $("<option>");
returnOption2.attr("value", "审查意见").text("审查意见");
var returnOption2_1 = $("<option>");
returnOption2_1.attr("value", "降贷款成数").text("降贷款成数");
var returnOption2_2 = $("<option>");
returnOption2_2.attr("value", "增加保证条件").text("增加保证条件");
var returnOption2_3 = $("<option>");
returnOption2_3.attr("value", "其他（叙述）").text("其他（叙述）");
var rejectOption1 = $("<option>");
rejectOption1.attr("value", "业务自行撤销").text("业务自行撤销");
var rejectOption2 = $("<option>");
rejectOption2.attr("value", "申户后续营运不明").text("申户后续营运不明");
var rejectOption3 = $("<option>");
rejectOption3.attr("value", "租赁物二手性不佳").text("租赁物二手性不佳");
var rejectOption4 = $("<option>");
rejectOption4.attr("value", "其他（叙述）").text("其他（叙述）");

var returnSelect = $("<select>");
returnSelect.append(returnOption1)
	.append(returnOption2)
	.attr("name", "returnClassLevelOne");

var returnSelect_1 = $("<select>");
returnSelect_1.append(returnOption1_1)
	.append(returnOption1_2)
	.append(returnOption1_3)
	.attr("name", "returnClassLevelTwo");

var returnSelect_2 = $("<select>");
returnSelect_2.append(returnOption2_1)
	.append(returnOption2_2)
	.append(returnOption2_3)
	.attr("name", "returnClassLevelTwo");

var rejectSelect = $("<select>");
rejectSelect.append(rejectOption1)
	.append(rejectOption2)
	.append(rejectOption3)
	.append(rejectOption4)
	.attr("name", "returnClassLevelOne");

$(function (){
	$("input[type='radio'][name='memo']").click(function (){
		if($(this).attr("checked")){
			loadItem($(this).val());
		}
	});
	
	$("#risk_return_type_panel").css("float", "left");
	$("#risk_return_type_panel_2").css("float", "left");
});

function loadItem(flag){
	//risk_return_type_panel
	var risk_return_type_panel = $("#risk_return_type_panel");
	var risk_return_type_panel_2 = $("#risk_return_type_panel_2");
	risk_return_type_panel.html("");
	risk_return_type_panel_2.html("");
	if (flag == 3) {
		returnSelect.change(function (){
			risk_return_type_panel_2.html("");
			if($(this).val() == returnOption1.val()){
				risk_return_type_panel_2.append(returnSelect_1);
			} else if($(this).val() == returnOption2.val()){
				risk_return_type_panel_2.append(returnSelect_2);
			}
		});
		risk_return_type_panel.append(returnSelect);
		risk_return_type_panel_2.append(returnSelect_1);
	} else if (flag == 4) {
		risk_return_type_panel.append(rejectSelect);
	}
	
}


































