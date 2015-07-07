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
		<script src="${ctx }/rentcontract/js/selectCard.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
				$("#logTime1").datepicker($.datepicker.regional['zh-CN']);
				$("#logTime2").datepicker($.datepicker.regional['zh-CN']);
				$("#logTime3").datepicker($.datepicker.regional['zh-CN']);				
			});	
			

		function subRentFile(){	
			document.getElementById("buttonAdd").disabled=true;
			$("#rentForm").submit();						
		}
 		function rentLog1(){   
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  }  		
			$("#rentLog1").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog1").dialog('open');           
		}
 		function rentLog2(){ 
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  }  		  
			$("#rentLog2").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog2").dialog('open');           
		}	
 		function rentLog3(){  
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  } 		 
			$("#rentLog3").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog3").dialog('open');           
		}				
		
		function InsertLog1(){	
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids1").val(fileValue);	
				document.formLog1.__action.value="rentFile.insertLog";	   
				$("#formLog1").submit();
			} 
		function InsertLog2(){	
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids2").val(fileValue);	
				document.formLog2.__action.value="rentFile.insertLog2";	   
				$("#formLog2").submit();
			}
		function InsertLog3(){
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids3").val(fileValue);	
				document.formLog3.__action.value="rentFile.insertLog3";	   
				$("#formLog3").submit();
			}
			
		function expand(id,REFI_ID,PRCD_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=rentFile.queryFileUpMore&REFI_ID=" + REFI_ID+"&PRCD_ID="+PRCD_ID+"&id="+id);
	            $("#tr_"+id).toggle();
	        });
		}	
		function expandVisitImage(id){
			$("#"+id).toggle() ;
		}	
		
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 800px">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0,'true')">客户资料</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1,'true')">担保人资料</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2,'true')">合同资料</a></li>
		</ul>
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
			<form action="../servlet/defaultDispatcher" name=rentForm" id="rentForm" method="post" enctype="multipart/form-data">	
		<div id="tabs-1">
			 <input type="hidden" name="CONTRACT_TYPE" id="CONTRACT_TYPE"  value="${CONTRACT_TYPEss}"/>
			<input type="hidden" id="__action" name="__action" value="rentFile.uploadAllForSales" /> 	
			<input type="hidden" name="prcd_id" id="prcd_id" value="${prcd_id}"/>
			<input type="hidden" name="name" id="name" value=""/>
			<input type="hidden" name="path" id="path" value=""/>	
			<input type="hidden" name="cardFlag" id="cardFlag" value="${cardFlag}"/>
			<input type="hidden" id="type" name="type" value="all" />		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">客户名称</TD>
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
								<tr class="ui-jqgrid-labels">
									<td  align="left" colspan="6">
									<input type="button" class="ui-state-default ui-corner-all" id="addLog1" value="提醒日志" name="addLog1" onclick="rentLog1();"/><!-- <input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>-->			
									   <input type="hidden" name="statusLengthA"  value="${fn:length(insorupd)}"/>
									</td>							
								</tr>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:8%;">提醒日志</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:7%;">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:10%;">应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:9%;">原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:13%;">复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:10%;">实征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">备注</th>
									<!-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">附件</th>-->
								</tr> 
								<c:forEach items="${insorupd}" var="item" varStatus="status">
								<input type="hidden" name="refd_idA${status.count }" id="refd_id" value="${item.REFD_ID}"/>
								<input type="hidden" name="refi_idA${status.count }" id="refi_id" value="${item.REFI_ID}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="8%"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.REFI_ID}" style="width:100%;"></td>
									<td width="7%" onclick="expand('pactAffix${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
									<td width="15%"><c:if test="${item.FILESTATE eq 1 }"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
									<td width="10%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
									<td width="9%"><input type="text" name="FILE_COUNTA${status.count }" value="${item.FILE_COUNT}" id="FILE_COUNT" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									<td width="13%"><input type="text" name="COPYFILE_COUNTA${status.count }" value="${item.COPYFILE_COUNT}" id="COPYFILE_COUNT" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									<td width="10%">${item.FILECOUNT}</td>
									<td width="20%"><input type="text" name="MEMOA${status.count }" value="${item.MEMO}" id="MEMO" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;"></td>	
									<!-- <td width="20%"><input class="ui-state-default ui-corner-all" size="13" type="file" name="${item.REFD_ID}@${item.REFI_ID}" id="${item.REFD_ID}@${item.REFI_ID}"/></td>-->
								</tr>
								<tr id="tr_pactAffix${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="7" align="center">
										<div id="pactAffix${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>											
								</tr>								
								</c:forEach>	
								<tr class="ui-jqgrid-labels">
									<td  align="left" colspan="6">
									<input type="button" class="ui-state-default ui-corner-all" id="addLog1" value="提醒日志" name="addLog1" onclick="rentLog1();"/><!--<input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>-->			
									</td>							
								</tr>								
						</table>	
		</div>
	<!-- endone -->
		<div id="tabs-2">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">客户名称</TD>
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
						        <tr class="ui-jqgrid-labels">
									<td align="left" colspan="6">
									<input type="hidden" name="statusLengthB"  value="${fn:length(insorupd)}"/>
									<input type="button" class="ui-state-default ui-corner-all" id="addLog2" value="提醒日志" name="addLog2" onclick="rentLog2();">
									<!--<input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>-->	
									</td>							
								</tr>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:8%;">提醒日志</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:7%;">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:10%;">应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:9%;">原件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:13%;">复印件份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:10%;">实征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">备注</th>
									<!--<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">附件</th>-->
								</tr>
								<c:forEach items="${insorupd}" var="item" varStatus="status">
									<input type="hidden" name="refd_idB${status.count }${status.count }" id="refd_id2" value="${item.REFD_ID}"/>
									<input type="hidden" name="refi_idB${status.count }${status.count }" id="refi_id2" value="${item.REFI_ID}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="8%"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.REFI_ID}" style="width:100%;"></td>
									<td width="7%" onclick="expand('pactAffix2${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
									<td width="15%"><c:if test="${item.FILESTATE eq 1 }"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
									<td width="10%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
									<td width="9%"><input type="text" name="FILE_COUNTB${status.count }${status.count }" value="${item.FILE_COUNT}" id="FILE_COUNT2" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									<td width="13%"><input type="text" name="COPYFILE_COUNTB${status.count }${status.count }" value="${item.COPYFILE_COUNT}" id="COPYFILE_COUNT2" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									<td width="10%">${item.FILECOUNT}</td>
									<td width="20%"><input type="text" name="MEMOB${status.count }${status.count }" value="${item.MEMO}" id="MEMO2" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;"></td>	
									<!--<td width="20%"><input class="ui-state-default ui-corner-all" size="13" type="file" name="${item.REFD_ID}@${item.REFI_ID}" id="${item.REFD_ID}@${item.REFI_ID}"/></td>-->
								</tr>
								<tr id="tr_pactAffix2${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="7" align="center">
										<div id="pactAffix2${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>
								</tr>								
								</c:forEach>	
								<tr class="ui-jqgrid-labels">
									<td align="left" colspan="6">
									<input type="hidden" name="statusLengthB"  value="${fn:length(insorupd)}"/>
									<input type="button" class="ui-state-default ui-corner-all" id="addLog2" value="提醒日志" name="addLog2" onclick="rentLog2();">
									<!--<input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>	-->	
									</td>							
								</tr>															
						</table>
						
		</div>
	<!-- endone -->
		<div id="tabs-3">	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
							<TR class="ui-widget-content jqgrow ui-row-ltr">
								<TD style="text-align: center;" width="25%">客户名称</TD>
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
						       <tr class="ui-jqgrid-labels">
										<td align="left" colspan="9">
										    <input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
										    <input type="button" class="ui-state-default ui-corner-all" id="addLog3" value="提醒日志" name="addLog3" onclick="rentLog3();">&nbsp;&nbsp;&nbsp;
										</td>							
									</tr>	
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">提醒日志</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">实征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:25%;">业务行政备注</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">业管审核</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">缺件问题类别</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">业管备注</th>
								</tr>
								<c:forEach items="${insorupd}" var="item" varStatus="status" >
									<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
									<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="5%"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.REFI_ID}" style="width:100%;"></td>
									<td width="5%" onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
									<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
									<td width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
<%-- 								<td width="9%"><input type="text" name="FILE_COUNTC${status.count }${status.count }${status.count }" value="${item.FILE_COUNT}" id="FILE_COUNT3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									<td width="13%"><input type="text" name="COPYFILE_COUNTC${status.count }${status.count }${status.count }" value="${item.COPYFILE_COUNT}" id="COPYFILE_COUNT3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"></td>
									 --%>
									 <td width="5%">${item.COPYSIGN_COUNT == null || item.COPYSIGN_COUNT == '' ? 0 : item.COPYSIGN_COUNT}</td>
									<td width="25%">${item.SALES_MEMO}&nbsp;</td>
									<td width="5%"><INPUT TYPE="checkbox" NAME="rent_ids" id="rent_ids" value="${item.REFI_ID}" style="width:100%;" <c:if test="${not empty item.IS_ALREADY and item.IS_ALREADY eq 1}">checked</c:if>></td>
									<td width="15%"><c:if test="${not empty item.IS_ALREADY and item.IS_ALREADY eq 0}">${item.ISSURE_REASON }</c:if>&nbsp;</td>
									<td width="20%">${item.FILE_MEMO }&nbsp;</td>	
								</tr>
								<tr id="tr_pactAffix3${item.REFI_ID}" style="display: none;">
									<td style="text-align: center;" colspan="8" align="center">
										<div id="pactAffix3${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</td>
								</tr>								
								</c:forEach>	
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="5%">&nbsp;</td>
									<td width="5%" onclick="expandVisitImage('visitImage');" style="cursor: pointer;">${fn:length(insorupd) +1}</td>
									<td width="15%">回访信息资料</td>
									<td width="5%">&nbsp;</td>
									<td width="5%">${fn:length(visitImage)}&nbsp;</td>
									<td width="25%"></td>
									<td width="5%"></td>
									<td width="15%"></td>
									<td width="20%"></td>
								</tr>
									<tr>
										<td style="text-align: center;" colspan="9" align="center">
											<div id="visitImage" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
													<c:forEach items="${visitImage}" var="item" varStatus="status">	
															<tr id="imageUp${status.count }" class="ui-widget-content jqgrow ui-row-ltr">	
																<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=backVisitImage'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a></td>
															</tr>		
													</c:forEach>		
												</table>	
											</div>
										</td>
									</tr>				
									<tr class="ui-jqgrid-labels">
										<td align="left" colspan="9">
										    <input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
										    <input type="button" class="ui-state-default ui-corner-all" id="addLog3" value="提醒日志" name="addLog3" onclick="rentLog3();">
										</td>							
									</tr>
									<tr class="ui-jqgrid-labels">
										<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;"colspan="9"> 备注说明：</th>
									</tr>
									
									<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="9"><c:forEach items="${rentFileSenderState}" var="item" varStatus="status">${item.HW_MEMO }<br></c:forEach></td>							
									</tr>															
						</table>				
					</div>
					</div>									
				</form>	
				</div>
			</div>	
</div>	

<div id="rentLog1" align="center" title="提醒日志" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="display: none; width: 100%">
<form action="../servlet/defaultDispatcher" name="formLog1" id="formLog1" method="post">
	<input type="hidden" name="logFlag" value="readOnly"/>		
	<input type="hidden" name="__action" id="__action" value=""/>
	<input type="hidden" name="prcd_idLog1" id="prcd_idLog1" value="${prcd_id}"/>
	<input type="hidden" name="ids1" id="ids1" value=""/>			
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">操作人：</TD>
							<TD style="text-align: center;" width="20%">${s_employeeName}</TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">时间</TD>
							<TD style="text-align: center;" width="20%"><input type="text" name="logTime1" style="width:170px; height:18px;" readonly="readonly" id="logTime1"/></TD>				
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%">备注</TD>
							<TD style="text-align: center;" width="25%"><TEXTAREA NAME="logMemo1" ROWS="6" COLS="25" id="logMemo1"></TEXTAREA></TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logInsert1" value="保  存" name="logInsert1" onclick="InsertLog1();"></TD>
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logDelete1" value="关  闭" name="logDelete1" onclick="closeDialog('#rentLog1');"></TD>									
						</TR>																
					</table>	
			</form>									
	</div>
		
			<div id="rentLog2" align="center" title="提醒日志" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="display: none; width: 100%">
<form action="../servlet/defaultDispatcher" name="formLog2" id="formLog2" method="post">	
	<input type="hidden" name="logFlag" value="readOnly"/>	
	<input type="hidden" name="__action" id="__action" value=""/>
	<input type="hidden" name="prcd_idLog2" id="prcd_idLog2" value="${prcd_id}"/>
	<input type="hidden" name="ids2" id="ids2" value=""/>			
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">操作人：</TD>
							<TD style="text-align: center;" width="20%">${s_employeeName}</TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">时间</TD>
							<TD style="text-align: center;" width="20%"><input type="text" name="logTime2" style="width:170px; height:18px;" readonly="readonly" id="logTime2" value=""></TD>				
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%">备注</TD>
							<TD style="text-align: center;" width="25%"><TEXTAREA NAME="logMemo2" ROWS="6" COLS="25" id="logMemo2"></TEXTAREA></TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logInsert2" value="保  存" name="logInsert2" onclick="InsertLog2();"></TD>
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logDelete2" value="关  闭" name="logDelete2" onclick="closeDialog('#rentLog2');"></TD>									
						</TR>																
					</table>	
		</form>						
			</div>
			<div id="rentLog3" align="center" title="提醒日志" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="display: none; width: 100%">
<form action="../servlet/defaultDispatcher" name="formLog3" id="formLog3" method="post">	
	<input type="hidden" name="logFlag" value="readOnly"/>	
	<input type="hidden" name="__action" id="__action" value=""/>
	<input type="hidden" name="prcd_idLog3" id="prcd_idLog3" value="${prcd_id}"/>
	<input type="hidden" name="ids3" id="ids3" value=""/>				
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">操作人：</TD>
							<TD style="text-align: center;" width="20%">${s_employeeName}</TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="20%">时间</TD>
							<TD style="text-align: center;" width="20%"><input type="text" name="logTime3" style="width:170px; height:18px;" readonly="readonly" id="logTime3" value=""></TD>				
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%">备注</TD>
							<TD style="text-align: center;" width="25%"><TEXTAREA NAME="logMemo3" ROWS="6" COLS="25" id="logMemo3"></TEXTAREA></TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logInsert3" value="保  存" name="logInsert3" onclick="InsertLog3();"></TD>
							<TD style="text-align: center;" width="25%"><input type="button" class="ui-state-default ui-corner-all" id="logDelete3" value="关  闭" name="logDelete3" onclick="closeDialog('#rentLog3');"></TD>									
						</TR>																
					</table>
					
					</form>				
			</div>
			<font style="color: red;">*</font>:点击编号可以查看文件		
	</body>
</html>