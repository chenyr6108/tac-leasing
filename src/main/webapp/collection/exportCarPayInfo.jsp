<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>导出扣款资料</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		
		<script type="text/javascript">
			$(function(){
				$("#query_date").datepicker($.datepicker.regional['zh-CN']);
			});


			
			function getHitoryDailyDecomposeExcel(e){
				$(e).attr("disabled", true);
				var query_date = "";
				query_date= document.getElementById("query_date").value;
				if(query_date == ""){
					alert("请选择查询日期");
					return;
				}
				var user_id = "${sessionScope.s_employeeId }";
				window.parent.callBirt("birtReport/exportCarPayApplyInfo/exportCarApplyInfo.rptdesign", "xls", 
					{
						"query_date" : query_date
						, "contract_type" : $("#contract_type").val()
						, "user_id" : user_id
					}
				);

				$(e).attr("disabled", false);
			}
			
			function getHitoryDailyDecomposeExcelNew(e){
				$(e).attr("disabled", true);
				var query_date = "";
				query_date= document.getElementById("query_date").value;
				if(query_date == ""){
					alert("请选择查询日期");
					return;
				}
				var user_id = "${sessionScope.s_employeeId }";
				window.parent.callBirt("birtReport/exportCarPayApplyInfo/exportCarApplyInfoNew.rptdesign", "xls", 
					{
						"query_date" : query_date
						, "contract_type" : $("#contract_type").val()
						, "user_id" : user_id
					}
				);

				$(e).attr("disabled", false);
			}
		</script>		
	</head>
	<body>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出扣款资料</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr>
					<td style="width: 15%">查询日期 ：<input type="text" name="query_date" id="query_date" style=" width: 80px; height: 18px;" readonly="readonly"></td>
					<td style="width: 15%">业种别：<select id="contract_type">
						<option value="2">商用车</option>
						<option value="3">乘用车</option>
					</select></td>
					<td style="width: 15%"><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getHitoryDailyDecomposeExcel(this);"  value="导出扣款资料"/></td>
					<td style="width: 15%"><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getHitoryDailyDecomposeExcelNew(this);"  value="导出扣款资料(新)"/></td>
					<td style="width: 40%">&nbsp;</td>
				</tr>
			</table>
			</div>
			<br/>
			<br/>
			<div style="color:red;">
				<span>*导出扣款资料(新)：</span><br/>
				<span style="padding-left:36px;">1.满足条件①农行②金额>10000的数据拆分成多笔</span><br/>
				<span style="padding-left:36px;">2.所有数据每笔金额+1</span><br/>
				<span style="padding-left:36px;">3.金额为0的数据剔除</span><br/>
			</div>
	</body>
</html>