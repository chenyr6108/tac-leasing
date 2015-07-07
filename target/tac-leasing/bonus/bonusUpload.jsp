<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
	<head>
	<!-- 		 <script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript" ></script> 
		 <script src="${ctx }/common/js/openDiv.js" type="text/javascript" ></script> 
		 <script src="${ctx }/department/js/departmentManage.js" type="text/javascript" ></script> 
		 <link rel="stylesheet" type="text/css" href="${ctx }/common/css/openDiv.css" /> -->
		<title>奖金上传</title>
		<script type="text/javascript">
			function sub(){
				var ru = $("#recompose_upload").val().split(".");
				var typeName = ru[1];
				if ("xls"!=typeName){
	 				alert("只能上传excel文件");
	             return false;
				}
				$("#form1").submit();
			}		
		</script>
	</head>
	<!-- <body onload="loadCompany();"> -->
	<body>
		<input type="hidden" name="type" value="excel">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;奖金上传</span>
	  	</div>
	  	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
			<input type="hidden" id="__action" name="__action"
					value="composeUpload.composeBonusUpload" /> 
			<input type="hidden" id="type" name="type" value="excel" />
		
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td>Excel文件:</td>
					<td><input class="ui-state-default ui-corner-all" size="80" type="file" name="recompose_upload" id="recompose_upload"/></td>
				</tr>				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>说&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明:</td>
					<td><textarea rows="4" cols="100" name="remark"></textarea></td>
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<input class="ui-state-default ui-corner-all" type="button" value="批量上传" onclick="sub();"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="ui-state-default ui-corner-all" type="reset" value="重置"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="ui-state-default ui-corner-all" type="button" value="取消"/>
					</td>
					<div>
					</div>
				</tr>
			</table>
		</form>		
			<h1>Excel格式说明：</h1>
			<div>在提供的可下载的Excel模板中合同号，姓名是必须填写的。</div>
				
	</div>	
	</body>
</html>