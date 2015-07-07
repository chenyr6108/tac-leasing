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
		<script src="${ctx }/risk_audit/js/selectCard.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
			
		function expand(id,REFI_ID,PRCD_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=rentFile.queryFileUpMore&REFI_ID=" + REFI_ID+"&PRCD_ID="+PRCD_ID);
	            $("#tr_"+id).toggle();
	        });
	        
		}			
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 800px">
		<form id="form2" name="form2" method="POST"  action="">
			<input type="hidden" name="prcd_id" id="prcd_id" value="${prcd_id}"/>	
			<input type="hidden" name="cardFlag" id="cardFlag" value="${cardFlag} "/>	
			 <input type="hidden" name="CONTRACT_TYPE" id="CONTRACT_TYPE"  value="${CONTRACT_TYPEss}"/>
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">承租人资料</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">担保人资料</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">合同资料</a></li>
		</ul>
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
		<div id="tabs-1">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">承租人名称</TD>
								<TD style="text-align: center;" width="25%">${infor.CUST_NAME}&nbsp;</TD>
								<TD style="text-align: center;" width="25%">联系方式</TD>
								<TD style="text-align: center;" width="25%">&nbsp;<c:if test="${infor.CUST_TYPE eq 0}">${infor.NATU_MOBILE}</c:if><c:if test="${infor.CUST_TYPE eq 1}">${infor.CORP_HS_LINK_MODE}</c:if></TD>
							</TR>
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">资料编号</TD>
								<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
								<TD style="text-align: center;" width="25%">合同编号</TD>
								<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
							</TR>								
						</table>	
						<br>
						<br>
						<br>		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">		
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">附件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${insorupd}" var="item" varStatus="status">
								<input type="hidden" name="refd_id" id="refd_id" value="${item.REFD_ID}"/>
								<input type="hidden" name="refi_id" id="refi_id" value="${item.REFI_ID}"/>
								<tr id="czd${item.REFI_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;" onclick="expand('pactAffix${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" >
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.FILE_NAME}&nbsp;</td>
									<td style="text-align: center;">${item.FILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYFILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.FILECOUNT}&nbsp;</td>
									<td style="text-align: center;">${item.MEMO}&nbsp;</td>	
								</tr>
								<tr id="tr_pactAffix${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="7" align="center">
										<div id="pactAffix${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>											
								</tr>								
								</c:forEach>				
							</tbody>					
						</table>		
		</div>
	<!-- endone -->
		<div id="tabs-2">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">承租人名称</TD>
								<TD style="text-align: center;" width="25%">&nbsp;</TD>
								<TD style="text-align: center;" width="25%">联系方式</TD>
								<TD style="text-align: center;" width="25%">&nbsp;</TD>
							</TR>
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">资料编号</TD>
								<TD style="text-align: center;" width="25%">&nbsp;</TD>
								<TD style="text-align: center;" width="25%">合同编号</TD>
								<TD style="text-align: center;" width="25%">&nbsp;</TD>
							</TR>								
						</table>	
						<br>
						<br>
						<br>		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">附件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${insorupd}" var="item" varStatus="status">
								<input type="hidden" name="refd_id2" id="refd_id2" value="${item.REFD_ID}"/>
								<input type="hidden" name="refi_id2" id="refi_id2" value="${item.REFI_ID}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;" onclick="expand('pactAffix2${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');">
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.FILE_NAME}&nbsp;</td>
									<td style="text-align: center;">${item.FILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYFILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.FILECOUNT}&nbsp;</td>
									<td style="text-align: center;">${item.MEMO}&nbsp;</td>	
								</tr>
								<tr id="tr_pactAffix2${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="7" align="center">
										<div id="pactAffix2${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>											
								</tr>								
								</c:forEach>				
							</tbody>												
						</table>
						
		</div>
	<!-- endone -->
		<div id="tabs-3">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">承租人名称</TD>
								<TD style="text-align: center;" width="25%">${infor.CUST_NAME}&nbsp;</TD>
								<TD style="text-align: center;" width="25%">联系方式</TD>
								<TD style="text-align: center;" width="25%">&nbsp;<c:if test="${infor.CUST_TYPE eq 0}">${infor.NATU_MOBILE}</c:if><c:if test="${infor.CUST_TYPE eq 1}">${infor.CORP_HS_LINK_MODE}</c:if></TD>
							</TR>
							<TR class="ui-widget-content jqgrow ui-row-ltr" >
								<TD style="text-align: center;" width="25%">资料编号</TD>
								<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
								<TD style="text-align: center;" width="25%">合同编号</TD>
								<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
							</TR>								
						</table>	
						<br>
						<br>
						<br>		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">附件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${insorupd}" var="item" varStatus="status">
								<input type="hidden" name="refd_id3" id="refd_id3" value="${item.REFD_ID}"/>
								<input type="hidden" name="refi_id3" id="refi_id3" value="${item.REFI_ID}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;" onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');">
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.FILE_NAME}&nbsp;</td>
									<td style="text-align: center;">${item.FILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.COPYFILE_COUNT}&nbsp;</td>
									<td style="text-align: center;">${item.FILECOUNT}&nbsp;</td>
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
							</tbody>												
						</table>				
		</div>
					</div>
				</div>
			</div>	
	</form>	
</div>		
<font style="color: red;">*</font>:点击编号可以查看文件
	</body>
</html>