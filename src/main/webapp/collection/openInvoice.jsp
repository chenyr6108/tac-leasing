<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>发票开具</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
			});	
		function doSearchPP(){
		 	 $("#__currentPage").val("1");
			 $("#form1").submit();
		}
		
			function sub(){
				var ru = $("#recompose_upload").val().split(".");
				var typeName = ru[1];
				if ("xls"!=typeName){
	 				alert("只能上传excel文件");
	             return false;
				}
				$("#form2").submit();
			}									
    	</script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="openInvoice.queryOpenInvoice"/>   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;发票开具</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起日从：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>起日到：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }"></td>
							<td>
							类型：
							</td>
							<td>
									<c:set var="type1" value=""></c:set>
									<c:set var="type2" value=""></c:set>
									<c:if test="${isopen eq 1}">
									<c:set var="type1" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${isopen eq 2}">
									<c:set var="type2" value="selected='selected'"></c:set>
									</c:if>
									<select name="isopen" style="border: #03515d solid 1px;">
										<option value="1" ${type1}>
										未开发票
										</option>
										<option value="2" ${type2}>
										已开发票
										</option>
									</select>
							</td>
							<td>公司别：
								<select name="companyCode">
									<option value="">全部</option>						
									<option value="1">裕融</option>
									<option value="2">裕国</option>
								</select>
							</td>								
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="6"><input type="text" name="content" value="${content}" style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>				          
				          </table>          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearchPP();"  class="blue_button">搜 索</a></td>
				      </tr>
			 </table>				
				</div>
			</div>
		</div>		
		</form>
		
		<input type="hidden" name="type" value="excel">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;上传开具发票</span>
	  	</div>
	  	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv ">
		<form action="../servlet/defaultDispatcher" name="form2" id="form2" method="post" enctype="multipart/form-data">
			<input type="hidden" id="__action" name="__action" value="openInvoice.invoiceUpload" /> 
			<input type="hidden" id="type" name="type" value="excel" />
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr  class="ui-widget-content jqgrow ui-row-ltr">
					<td>Excel文件:</td>
					<td><input class="ui-state-default ui-corner-all" size="80" type="file" name="recompose_upload" id="recompose_upload"/></td>
				</tr>							
				<tr>
					<td colspan="2" align="center">
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