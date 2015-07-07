<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>上传发票号码</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
				if('${errorMsg}'!=''){
					alert('${errorMsg}');
				}
			});	
		function doSearchPP(){
		 	 $("#__currentPage").val("1");
			 $("#form1").submit();
		}
		
			function sub(){
				var ru = $("#recompose_upload").val().split(".");
				
				var typeName = ru[(ru.length-1)];
			//alert(typeName);
				if ("xls"!=typeName){
	 				alert("只能上传excel文件");
	             return false;
				}
				$("#form2").submit();
			}									
    	</script>		
	</head>
	<body>
		<input type="hidden" name="type" value="excel">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;上传发票号码</span>
	  	</div>
	  	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post" enctype="multipart/form-data">
			<input type="hidden" id="__action" name="__action" value="openInvoice.invoiceCodeUpload" /> 
			<input type="hidden" id="type" name="type" value="excel" />
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td>Excel文件:</td>
					<td><input class="ui-state-default ui-corner-all" size="80" type="file" name="recompose_upload" id="recompose_upload"/></td>
					<td>公司别：
						<select name="companyCode">
							<option value="1" <c:if test="${companyCode eq 1 }">selected</c:if>>裕融</option>
							<option value="2" <c:if test="${companyCode eq 2 }">selected</c:if>>裕国</option>
						</select>
					</td>
				</tr>							
				<tr>
					<td colspan="3" align="center">
						<input class="ui-state-default ui-corner-all" type="button" value="上传" onclick="sub();"/>
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
	</div>			
	</body>
</html>