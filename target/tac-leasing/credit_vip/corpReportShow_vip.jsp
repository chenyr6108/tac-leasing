<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="${ctx }/credit_vip/js/reportConfirm.js"></script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>财务报表</title> 
		<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs-coress").tabs(); 
		});
    </script>
    <script type="text/javascript">
    	function exportCWBB(){
		  $("#__action").val("creditPriorRecords.expCreditReport");
		  $("#corpReportForm").submit(); 
		  $("#__action").val("creditPriorRecords.saveCreditReport");	
    	}
    	function submitcheck(){  
		   for(i=1;i<=3;i++){
		       capital_sum=parseFloat($("#capital_sum"+i).val());
		       HE=parseFloat($("#debt_sum"+i).val())+parseFloat($("#real_sum"+i).val());
		       if(capital_sum!=HE){
		           alert("资产总额不等于负债总额、净值总额之和！");
		          return false;
		       }
		    } 
		    $("#corpReportForm").submit();
		   }
    	function deleteImg(img_id){
    		if(confirm("确定要删除吗？")){
	    		$("#img_action").val("creditPriorRecordsVip.deleteCorpImg");
	    		$("#img_id").val(img_id);
	    		$("#imgForm").submit();
    		}
    	}
    	
    	function downloadImg(img_path, img_name){
    		$("#img_action").val("creditPriorRecordsVip.downloadImg");
    		$("#img_path").val(img_path);
    		$("#img_name").val(img_name);
    		$("#imgForm").submit();
    	}
    </script>
	</head>
	<body>
	
	<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="__action" name="__action" value="creditPriorRecordsVip.uploadCorpReport" />
		<input type="hidden" name="credit_id" value="${creditMap.ID }" />
		
		<%-- 上传文件：<input type="file" name="upLoadFile" size="40" style="height: 25px;"/>
		重命名：<input type="text" name="new_file_name"/>
		<input type="submit" value="上传" class="ui-state-default ui-corner-all"/> --%>
	</form>
	<form name="imgForm" id="imgForm" method="post" action="${ctx }/servlet/defaultDispatcher">
		<input type="hidden" id="img_id" name="img_id" />
		<input type="hidden" id="credit_id" name="credit_id" value="${creditMap.ID }" />
		<input type="hidden" name="img_path" id="img_path"/>
		<input type="hidden" name="img_name" id="img_name"/>
		<input type="hidden" id="img_action" name="__action" value="creditPriorRecordsVip.deleteCorpImg" />
		<c:forEach items="${cropImgList }" var="cropImg">
			${cropImg.FILE_NAME_STR}&nbsp;&nbsp;
			<img src="${ctx }/images/attach.jpg" 
				style="cursor: pointer;" title="下载" 
				onclick="downloadImg('${fn:replace(cropImg.FILE_PATH,'\\','/')}', '${cropImg.FILE_NAME_STR}');"/>
			&nbsp;
			<%-- <img src="${ctx }/images/u103.gif" 
				style="cursor: pointer;" title="删除" 
				onclick="deleteImg('${cropImg.ID}');"/> --%>
			<c:if test="${cropImg.FILE_TYPE eq 'jpg' or cropImg.FILE_TYPE eq 'jpeg' or cropImg.FILE_TYPE eq 'gif' or cropImg.FILE_TYPE eq 'png' }">
				<div style="text-align: center;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<img src="${ctx }/showImg?file_name=${cropImg.FILE_PATH}" alt="财报" style="max-width: 900px;">
				</div>
			</c:if>
			<%-- <object id="obj" classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" width="100%" height="800px" border="0" name="pdf">   
		       <param name="toolbar" value="false">  
		       <param name="_Version" value="65539">  
		       <param name="_ExtentX" value="20108">  
		       <param name="_ExtentY" value="10866">  
		       <param name="_StockProps" value="0">  
		       <param id="pURL" name="SRC" value="${ctx }/images/201201121410354682523438.pdf">  
		   </object> --%>
			<br/>
		</c:forEach>
	</form>
			<%-- <form name="corpReportForm" id="corpReportForm" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" name="__action" id="__action" value="creditPriorRecords.saveCreditReport">
				<input type="hidden" name="credit_id" value="${creditMap.ID }"> --%>
				<%-- <div id="main">  
				<div id="tabs-coress">
					<ul> 
						<li><a href="#tabsss-1">BSPL-1</a></li>
						<li><a href="#tabsss-2" id="bs_2">BSPL-2</a></li>
						<li><a href="#tabsss-3" onclick="initReportConfirmData();">RATIO</a></li> 
						<div align="right"><c:if test="${not empty obj1}"><input type="button" value="导出财务报表" onclick="exportCWBB()" class="ui-state-default ui-corner-all"></c:if></div> 
					</ul>
					<div id="tabsss-1">
						<%@ include file="creditPropertyAndDebt.jsp"%>
						<br/>
					</div>
					<div id="tabsss-2">
						<%@ include file="creditPropertyAndDebt2.jsp"%>
						<br/>
					</div>
					<div id="tabsss-3"> 
						<%@ include file="reportConfirm.jsp"%>
						<br/>
					</div>
				</div> 
			</div> --%>
				<c:if test="${showStatus != 2}">
					<div style="text-align: center;">
					<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
					onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecordsVip.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}'"/>		
					</div>
				</c:if>
		<%-- </form> --%>
	</body>
</html>
	