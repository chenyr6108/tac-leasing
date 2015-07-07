<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now4" class="java.util.Date" />
<html>
	<head>
		<title>添加担保人 财务信息</title>


		<script type="text/javascript">  
					 
		$("#project_itemVc1").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_itemVc2").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_itemVc3").datepicker($.datepicker.regional['zh-CN']); 
	    $("#s_start_dateVc1").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_dateVc2").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_dateVc3").datepicker($.datepicker.regional['zh-CN']); 
		changeProjectItemVc();
	
		sumZiChanZongEVc();
		sumFuZaiZongEVc();
		sumJingZhiZongEVc()
		initAllDataVc();
		sumYingYeLiYiVc();
		sumShuiQianSunYiVc();
		sumShuiHouSunYiVc();	
		initTable2DataVc();
		$(".inputDataVc").blur(function(){
			valueChangeTableVc1(this);
		});
		$(".inputDataVc2").blur(function(){
			valueChangeTableVc2(this);
		});
		$(".inputDataVc").keypress(function(event){
			pressKeyFuncVc(this,event);
		});
		$(".inputDataVc2").keypress(function(event){
			pressKeyFuncVc2(this,event);
		}); 
		
</script>
	</head>
	<body>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="0" border="0"
			class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-jqgrid-labels">
				<th colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left;">
					<strong>财务报表</strong>
				</th>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
					上传文件：<input type="file" name="upLoadFile1" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile1_name"/>
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
					上传文件：<input type="file" name="upLoadFile2" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile2_name"/>
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
					上传文件：<input type="file" name="upLoadFile3" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile3_name"/>
				</td>
			</tr>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					<b>说明</b>
				</td>
				<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="19%" height="50"
					class="ui-widget-content jqgrow ui-row-ltr">
					意见：
				</td>
				<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="hidden" name="PROJECT_NAME3" style="width: 200px;">
					<textarea name="PROJECT_CONTENT3"
						style="width: 500px; height: 50px; font-size: 12px" class="txtk"></textarea>
				</td>
			</tr>
		</table>

	</body>
</html>