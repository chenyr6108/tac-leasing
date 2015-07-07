<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/date.js"></script>
<style type="text/css">
	#trackTable input{height: 23px;}
</style>
<script type="text/javascript">

function subNotice_detail(){
	
	var id=$("#INSF_ID").val();
	var name=$("#RECORD_NAME").val();
	var time=$("#RECORD_TIME").val();
	var remark=$("#RECORD_REMARK").val();
	var img_name = $("#file_name").val();
	var fileTd = "&nbsp;";
	if(name.length==0){
		alert("名字不能为空");
		return false;
	}
	if($("#uploadFile").val() != ''){
		if(img_name == ''){
			alert("请填写文件名！");
			return false;
		} else {
			fileTd = "请刷新";
		}
	}
	
	var html="<tr>" + 
		"<td style='text-align: center;' class='ui-widget-content jqgrow ui-row-ltr'>" +
		name +
		"</td>" + 
		"<td style='text-align: center;' class='ui-widget-content jqgrow ui-row-ltr'>" +
		time +
		"</td>" + 
		"<td style='text-align: center;' class='ui-widget-content jqgrow ui-row-ltr'>" +
		remark +
		"</td>" + 
		"<td style='text-align: center;' class='ui-widget-content jqgrow ui-row-ltr'>" +
		fileTd +
		"</td>" + 
		"</tr>";
//	$.post("../servlet/defaultDispatcher__action=satisfaction.addTrack",{INSF_ID:id,RECORD_NAME:name,RECORD_TIME:time,RECORD_REMARK:remark},,"json");
	/* $.ajax({
		type:  "POST",
		url: "../servlet/defaultDispatcher",
		data:"__action=satisfaction.addTrack&INSF_ID="+id+"&RECORD_NAME="+name+"&RECORD_DATE="+time+"&RECORD_REMARK="+remark,
		datetype:"json",
		success:function(){
			$("#justit").append($(html));
		}
	}); */
	$("#detailForm").submit();
	$("#RECORD_NAME").val('');
	$("#RECORD_TIME").val('');
	$("#RECORD_REMARK").val('');
	$("#uploadFile").val('');
	$("#file_name").val('');
	
	$("#justit").append($(html));
}

function downloadImg(img_path, img_name){
	$("#img_action").val("satisfaction.downloadImg");
	$("#img_path").val(img_path);
	$("#img_name").val(img_name);
	$("#imgForm").submit();
}
</script>
<div> 
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				<div class="zc_grid_body "> 
				<div id="loading"><img alt="" style="display:none;" src="img/loading.gif" /></div>
			<form id="detailForm" name="detailForm" action="../servlet/defaultDispatcher" method="post" target="hidden_frame" enctype="multipart/form-data">
			<input type="hidden" name="__action" value="satisfaction.addTrack">
			<input type="hidden" name="INSF_ID" value="${INSF_ID}" id="INSF_ID_DETAIL"/>
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 16px;">
		     &nbsp;&nbsp;添加跟踪信息
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv">
			<table cellspacing="0" cellpadding="0" border="0" class="" width='98%' id="trackTable">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="width: 10%" class="ui-state-default ui-th-ltr zc_grid_head">跟踪人姓名：</td>
				<td style="width: 15%"><input  type="text" name="RECORD_NAME" id="RECORD_NAME" value="${s_employeeName }" readonly="readonly">&nbsp;</td>
				<td style="width: 10%" class="ui-state-default ui-th-ltr zc_grid_head">跟踪的时间：</td>
				<td style="width: 65%"><input type="text" name="RECORD_DATE" id="RECORD_TIME" readonly="readonly" value="${now }" >&nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td class="ui-state-default ui-th-ltr zc_grid_head">上传文件：</td>
				<td><input type="file" name="upLoadFile" id="uploadFile" size="20" onblur="$('#file_name').val(this.value);" /></td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">重命名：</td>
				<td><input type="text" name="new_file_name" id="file_name"/></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td class="ui-state-default ui-th-ltr zc_grid_head">跟踪记录：</td>
				<td colspan='3'><textarea rows="3" cols="100"  name="RECORD_REMARK" id="RECORD_REMARK"></textarea>&nbsp;</td>
			</tr>
			<tr>
			<td colspan='4'>
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody id="justit">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 20%">跟踪人姓名</td>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 20%">跟踪时间&nbsp;</td>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 55%">跟踪记录&nbsp;</td>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 5%">附件&nbsp;</td>
						</tr>
						<c:forEach items="${trackList}" var="item">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.RECORD_NAME}&nbsp;</td>
								<td style="text-align: center;">${fn:substring(item.RECORD_DATE,0,10)}&nbsp;</td>
								<td style="text-align: center;">${item.RECORD_REMARK}&nbsp;</td>
								<td style="text-align: center;"><c:if test="${not empty item.IMG_PATH }"><a href="javascript:void(0);" onclick="downloadImg('${fn:replace(item.IMG_PATH,'\\','/')}', '${item.IMG_NAME}');"><img src="${ctx }/images/attach.jpg" style="cursor: pointer;" title="下载" />${item.IMG_NAME}</a></c:if>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</td>
			</tr>
			 <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
			</table>	
			<center>
				<c:if test="${satisfaction_edit }"><input type="button" value="提  交" class="ui-state-default ui-corner-all" onclick="javascript:subNotice_detail();" /></c:if>
			</center>
						
   </div>
 </div>
</div>	
</div>
</form>
<form name="imgForm" id="imgForm" method="post" action="${ctx }/servlet/defaultDispatcher">
	<input type="hidden" name="img_path" id="img_path"/>
	<input type="hidden" name="img_name" id="img_name"/>
	<input type="hidden" id="img_action" name="__action" />
</form>
<br>	