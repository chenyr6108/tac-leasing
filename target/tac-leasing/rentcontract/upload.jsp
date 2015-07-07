<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
	<head>
		<title>上传附件</title>
		<script type="text/javascript">
			function sub(){
				var ru = $("#uploadPic").val().split(".");
				var typeName = ru[1];
				if ("bmp"!=typeName&&"jpeg"!=typeName&&"gif"!=typeName&&"jpg"!=typeName&&"png"!=typeName){
	 				alert("不能上传这种格式的文件");
	             return false;
				}
				$("#form1").submit();
				alert("保存成功");
			}		
		</script>
	</head>

	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;上传附件</span>
	  	</div>
	  	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
			<input type="hidden" id="__action" name="__action"  value="uploadService.uploadPic" /> 
			<input type="hidden" name="RECT_ID" value="${RECT_ID }" />		
			<input type="hidden" id="type" name="type" value="pic" />
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td>附件:</td>
					<td><input class="ui-state-default ui-corner-all" size="80" type="file" name="uploadPic" id="uploadPic"/></td>
				</tr>				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>说&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明:</td>
					<td><textarea rows="4" cols="100" name="remark"></textarea></td>
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<input class="ui-state-default ui-corner-all" type="button" value="上传" onclick="sub();"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="ui-state-default ui-corner-all" type="reset" value="重置"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.queryRentContract'"/>
					</td>				
				</tr>
			</table>
		</form>	
			<div>上传附件说明：</div>
			<div>上传附件图片的格式可为：bmp、jpeg、gif、jpg、png。</div>
	</div>	
	</body>
</html>