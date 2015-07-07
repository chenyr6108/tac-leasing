<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<c:choose>
<c:when test="${empty cropImg3 }">
<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
<input type="hidden" id="__action" name="__action" value="creditPriorRecordsVip.uploadCorpReport" />
<input type="hidden" id="file_type" name="file_type" value="3" />
上传图片：<input type="file" name="upLoadFile" size="60" style="height: 25px;"/>
<input type="submit" value="上传" class="ui-state-default ui-corner-all"/>
</form>
</c:when>
<c:otherwise>
<div style="text-align: center;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
<img src="${ctx }/images/u103.gif" 
	style="position: absolute; right: 2px; top: 2px;" title="删除" 
	onclick="location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecordsVip.deleteCorpImg&img_id=${cropImg3.ID}'"/>
<img src="${ctx }/showImg?file_name=${cropImg3.FILE_PATH}" alt="BSPL-1" style="max-width: 500px;">
</div>
</c:otherwise>
</c:choose>
</html>