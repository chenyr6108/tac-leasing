<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
	<head>
		<title>上传来款</title>
		<script type="text/javascript">
			function sub(){
				var ru=$("#recompose_upload").val().split(".");
				var typeName=ru[1];
				if ("xls"!=typeName){
	 				alert("只能上传excel文件");
	             return false;
				}
				$("#form1").submit();
			}
			$(function(){
				var msg = '${errorMsg}';
				if(msg && msg!=''){
					alert(msg);
				}
			});
		</script>
	</head>
	<body>
		<input type="hidden" name="type" value="excel">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="width: 600px;height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;上传来款</span>
	  	</div>
	  	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 600px;">
		  <div class="zc_grid_body jqgrowleft">
		  	<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
				<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
					<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.readIncomeMoney"/> 
					<input type="hidden" id="type" name="type" value="excel"/>
					<table class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: left;background: white">Excel文件:
								<input style="height: 25px;" type="file" name="recompose_upload" id="recompose_upload"/>
								&nbsp;&nbsp;&nbsp;<input class="ui-state-default ui-corner-all" type="button" value="上传" onclick="sub();"/>
								公司别：
								<select name="companyCode">
									<c:forEach items="${companys}" var="item">
										<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>				
					</table>
				</form>	
					<h1>Excel格式说明：</h1>
					<div style="font-weight: normal;">在提供的可下载的Excel模板中红色的部分,即收款账号、交易日期、收入金额、交易方式、对方户名、收款单位是必须填写的。</div>
					<div style="font-weight: normal;">交易日期格式需为日期，例如：2010-4-19。</div>
					<div style="font-weight: normal;">收入金额、支出金额、本次余额、手续费总额格式为 例如：301,784.15。</div>	
					<div style="font-weight: normal;">收款账号、对方账号单元格格式设为文本格式。</div>
					<a href="${pageContext.request.contextPath}/downloads/excelTemplate.xls">下载Excel模板</a>
				</div>
			</div>
		</div>	
	</body>
</html>