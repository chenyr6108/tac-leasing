<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/modifyOrder/js/html5uploader.css">
<script type="text/javascript" src="${ctx }/modifyOrder/js/jquery.html5uploader.js"></script>
<script type="text/javascript">
	var j = jQuery.noConflict(true);
	j(function (){
		j("#file_upload").html5uploader({
			auto:false,
			multi:true,
			buttonText:'[文件上传（可多选）]',
   			fileSizeLimit:2097152,
			url:'${ctx}/servlet/defaultDispatcher?__action=riskAudit.uploadFiles'
		});
		j('.uploadfilebtn').addClass("panel_a");
	});	
</script>
<style type="text/css">
	.uploadfilebtn{
		border: none;
		color: #2E6E9E!important;
		font-size: 13px;
		font-weight: bold;
	}
	.filelist *{
		text-align: left!important;
	}
</style>
<form action="../servlet/defaultDispatcher" id="fileForm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="__action" name="__action" value="riskAudit.saveFileList">
	<input type="hidden" name="credit_id" value="${credit_id}">
	<input type="hidden" name="prc_id" value="${prc_id }"/>
	<input type="hidden" name="flag" value="1"/>
	<table class="panel_table">
		<tr>
			<td style="width: 50%">
				<c:if test="${empty fileList }">
					无附件
				</c:if>
				<c:forEach items="${fileList}" var="f" varStatus="index">
					<a style="padding: 2px; margin: 2px; float:left; clear:both;" class="panel_a" 
					href="${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${f.ORG_FILE_NAME }&path=${f.PATH}&bootPath=${bootPath}">${f.ORG_FILE_NAME }</a>
				</c:forEach>
			</td>
			<td style="width: 50%">
				<div id="file_upload" style="font-size: 12px; text-align: left;"></div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button class="panel_button">上  传</button>
			</th>
		</tr>
	</table>
</form>