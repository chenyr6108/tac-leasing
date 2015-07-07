<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>

		<title>项目添加</title>
		<script type="text/javascript" src="${ctx}/project/js/tag.js"></script>
		<style type="text/css">
			.ui-dialog-titlebar-close {
	              display: none;
	        }
			.ui-dialog {
	              text-align: center;
	              vertical-align: middle;
	         }
		
		</style>
		<script type="text/javascript">
		
			
		
		</script>
	</head>
	<body>
		<div id="process" style="display:none">
			<img src="${ctx}/images/loading.gif">
		</div>
		<form action="${ctx}/servlet/defaultDispatcher" name="tagForm" id="tagForm" method="post">
			<input type="hidden" name="__action" value="tagManageCommand.createTag">
			<div style="margin:  1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新建标签</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签名称：</td>
					<td>
						<input type="text" name="tag_name" id="tag_name" style="width: 200px" onchange="checkTagName(this.value,'')"><font color="red">*</font>
						<span id="tagNameMSG"></span>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签Code：</td>
					<td >
						<input type="text" name="tag_code" id="tag_code" style="width: 200px"><font color="red">*</font>
						<span id="tagCodeMSG"></span>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签类型：</td>
					<td >
						<select name="tag_type" id="tag_type">
							<option value="1">案 件</option>
						</select>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签图标：</td>
					<td >
						<input type="radio" name="tag_color" id="red" checked="checked" value="red"><label for="red"><img src="${ctx}/images/tags/red.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="green" value="green"><label for="green"><img src="${ctx}/images/tags/green.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="blue" value="blue"><label for="blue"><img src="${ctx}/images/tags/blue.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="yellow" value="yellow"><label for="yellow"><img src="${ctx}/images/tags/yellow.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="black" value="black"><label for="black"><img src="${ctx}/images/tags/black.png"></label>
						<input type="radio" name="tag_color" id="arrow" value="arrow"><label for="arrow"><img src="${ctx}/images/tags/arrow.png"></label>
						<input type="radio" name="tag_color" id="warning" value="warning"><label for="warning"><img src="${ctx}/images/tags/warning.png"></label>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
					<td>
					<textarea rows="5" cols="40" name="comments" id="comments"></textarea>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels" align="center">
					<td colspan="2"><input type="button" name="saveBut" id="saveBut" value="保  存" onclick="editTag();"	class="ui-state-default ui-corner-all">	<input type="reset" name="resetBut" id="resetBut" value="重  置" class="ui-state-default ui-corner-all"></td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</div>
		</form>
		
	</body>
</html>