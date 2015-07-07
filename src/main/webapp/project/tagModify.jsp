<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>

		<title>标签修改</title>
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
			function backTagManage(){
				location.href = "${ctx}/servlet/defaultDispatcher?__action=tagManageCommand.getTags";
			}
			
			
		
		</script>
	</head>
	<body>
		<div id="process" style="display:none">
			<img src="${ctx}/images/loading.gif">
		</div>
		<form action="${ctx}/servlet/defaultDispatcher" name="tagForm" id="tagForm" method="post">
			<input type="hidden" name="__action" value="tagManageCommand.modifyTag">
			<input type="hidden" name="id" value="${tag.id}">
			<div style="margin:  1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;标签修改</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签名称：</td>
					<td>
						<input type="text" name="tag_name" id="tag_name" style="width: 200px" onchange="checkTagName(this.value,'${tag.tagName}')" value="${tag.tagName}"><font color="red">*</font>
						<span id="tagNameMSG"></span>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签Code：</td>
					<td >
						<input type="text" name="tag_code" id="tag_code" style="width: 200px" value="${tag.tagCode}"><font color="red">*</font>
						<span id="tagCodeMSG"></span>
					</td>
					
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签类型：</td>
					<td >
						<select name="tag_type" id="tag_type">
							<option value="1" selected="selected">案件</option>
						</select>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>标签颜色：</td>
					<td >
						<input type="radio" name="tag_color" id="red" value="red" <c:if test="${tag.tagColor eq 'red'}">checked="checked"</c:if>><label for="red"><img src="${ctx}/images/tags/red.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="green" value="green" <c:if test="${tag.tagColor eq 'green'}">checked="checked"</c:if>><label for="green"><img src="${ctx}/images/tags/green.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="blue" value="blue" <c:if test="${tag.tagColor eq 'blue'}">checked="checked"</c:if>><label for="blue"><img src="${ctx}/images/tags/blue.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="yellow" value="yellow" <c:if test="${tag.tagColor eq 'yellow'}">checked="checked"</c:if>><label for="yellow"><img src="${ctx}/images/tags/yellow.png"></label> &nbsp;
						<input type="radio" name="tag_color" id="black" value="black" <c:if test="${tag.tagColor eq 'black'}">checked="checked"</c:if>><label for="black"><img src="${ctx}/images/tags/black.png"></label>
						<input type="radio" name="tag_color" id="arrow" value="arrow" <c:if test="${tag.tagColor eq 'arrow'}">checked="checked"</c:if>><label for="arrow"><img src="${ctx}/images/tags/arrow.png"></label>
						<input type="radio" name="tag_color" id="warning" value="warning" <c:if test="${tag.tagColor eq 'warning'}">checked="checked"</c:if>><label for="warning"><img src="${ctx}/images/tags/warning.png"></label>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
					<td>
					<textarea rows="5" cols="40" name="comments" id="comments">${tag.comments}</textarea>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels" align="center">
					<td colspan="2">
						<input type="button" name="saveBut" id="saveBut" value="保  存" onclick="editTag();"	class="ui-state-default ui-corner-all">	
						<input type="button" name="backBut" id="backBut" value="返回" onclick="backTagManage();"	class="ui-state-default ui-corner-all">	
					</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</div>
		</form>
		
	</body>
</html>