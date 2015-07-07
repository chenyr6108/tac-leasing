<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>合同资料管理</title>
		<style type="text/css">
		.grid_table th {
			font-size: 12px !important; 
		}
		</style>
		<script src="${ctx }/credit/js/selectCard.js" type="text/javascript"></script>
		<script type="text/javascript">
			
		function expand(id,REFI_ID,PRCD_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=rentFile.queryFileUpMore&REFI_ID=" + REFI_ID+"&PRCD_ID="+PRCD_ID);
	            $("#tr_"+id).toggle();
	        });
		}							
		</script>
	</head>
	<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;合同资料</span>
	</div>
	<div id="tabs" style="width: 1100px " align="center">
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
			<form action="../servlet/defaultDispatcher" name=rentForm" id="rentForm" method="post" enctype="multipart/form-data">	

			<input type="hidden" id="__action" name="__action" value="creditReport.uploadAll" /> 	
			<input type="hidden" name="prcd_id" id="prcd_id" value="${prcd_id}"/>
			<input type="hidden" name="name" id="name" value=""/>
			<input type="hidden" name="path" id="path" value=""/>	
			<input type="hidden" name="cardFlag" id="cardFlag" value="${cardFlag}"/>
			<input type="hidden" id="type" name="type" value="all" />	
			<input type="hidden" id="rentFileFlag" name="rentFileFlag" value="${rentFileFlag}" />	
		<div id="tabs-3">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table grid_table">
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" >编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >资料名称</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >合同类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >必填项</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >级别</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" >附件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">备注</th>
						
								</tr>
								<c:forEach items="${insorupd}" var="item" varStatus="status">
									<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
									<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
								<c:set var="filetype0" value="0"></c:set>							
								<c:if test="${item.FILESTATE eq 1 and item.UPSTATE eq 1}">
								<c:set var="filetype0" value="1"></c:set>
								</c:if>																		
								<tr id="${filetype0}" class="ui-widget-content jqgrow ui-row-ltr" name="${filetype0}C">
									<td onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;text-align: center;">${status.count }</td>
									<td style="text-align: center;"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}&nbsp;</td>
									<td style="text-align: center;">${item.WANT_COUNT}&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.FILE_CONTRACT_TYPE eq 1}">一般合同&nbsp;</c:if><c:if test="${item.FILE_CONTRACT_TYPE eq 2}">委托合同&nbsp;</c:if>&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.STATE eq 0}">否&nbsp;</c:if><c:if test="${item.STATE eq 1}">是&nbsp;</c:if>&nbsp;</td>
									<td style="text-align: center;">${item.LEVEL_NUM }&nbsp;</td>	
									<td style="text-align: center;">${item.FILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYFILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYSIGN_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.MEMO}&nbsp;</td>
								</tr>
								<tr id="tr_pactAffix3${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="7" align="center">
										<div id="pactAffix3${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>
								</tr>								
								</c:forEach>	
								<input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>														
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
							<td style="text-align: center;"><input type="button" name="backBut" onclick="javascript:history.go(-1)" value=返&nbsp;&nbsp;回 class="ui-state-default ui-corner-all"></td>
							<td></td>
							</tr>
						</table>									
		</div>
					</div>
				</form>	
				</div>
			</div>	
</div>	
<font style="color: red;">*</font>:点击编号可以查看文件
<!-- endthree -->	
	</body>
</html>