<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>支票管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
		$(function (){
			$("#QSTART_DATE").datepicker($.datepicker.regional["zh-CN"]);
			$("#QEND_DATE").datepicker($.datepicker.regional["zh-CN"]);
			$("#DELIVERY_DATE").datepicker($.datepicker.regional["zh-CN"]);
			$("#FORCAST_DELIVERY_DATE").datepicker($.datepicker.regional["zh-CN"]);
		});
			function manageCheck(ID,TYPE,CHECK_NUM,CHECK_MONEY,CHECK_OUT_DATE){
			    $("#checkDeliveryPay").toggle(function(){
					document.checkPayDetailForm.CHECK_MONEY.value=CHECK_MONEY;
					document.checkPayDetailForm.CHECK_NUM.value=CHECK_NUM;
					document.checkPayDetailForm.TYPE.value=TYPE;
					document.checkPayDetailForm.ID.value=ID;
					document.checkPayDetailForm.CHECK_OUT_DATE.value=CHECK_OUT_DATE;
					
					if(TYPE=="DELETE"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="作废";
					}else if(TYPE=="DELIVERY"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="投递";
						$("tr[id='DELIVERY_BANK']").css("display","block");
					}else if(TYPE=="RECORDED"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="入账";
					}else if(TYPE=="RETURN"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="退票";
						$("tr[id='RETURN_REASON_TR']").css("display","block");
					}else if(TYPE=="TRANSFER"){
						$("tr[id='TRANSFER_TO']").css("display","block");
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="转移";
					}else if(TYPE=="ACCEPT"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="接收";
					}else if(TYPE=="BACK"){
						$("tr[id='BACK_TO']").css("display","block");
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="退回";
					}else if(TYPE=="BACKCONFIRM"){
						document.checkPayDetailForm.CHECK_HANDLE_TYPE.value="确认退回";
					}
					$("#checkDeliveryPay").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 450
					    });
				    $("#checkDeliveryPay").dialog('open');  
						
			    });
			}
			
			function expandForShow(showid,id){
		        $("#" + showid).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=rentContract.queryCheckPayManageLog&ID=" + id );
		        });
			}
			function deliveryCheckPay(){
				if(document.checkPayDetailForm.DELIVERY_DATE.value==""){
					alert("请选择处理日期");
					return false;
				}
				
				if(document.checkPayDetailForm.CHECK_HANDLE_TYPE.value=="退票"){
					document.checkPayDetailForm.RETURN_REASON_TEXT.value=$.trim($("#RETURN_REASON").find("option:selected").text());//退票原因文字
				}else if(document.checkPayDetailForm.CHECK_HANDLE_TYPE.value=="转移"){
					if(document.checkPayDetailForm.TRANSFER_TO.value.trim()==""){
						alert("请输入转移到内容");
						return false;
					}
				}else if(document.checkPayDetailForm.CHECK_HANDLE_TYPE.value=="退回"){
					if(document.checkPayDetailForm.BACK_TO.value.trim()==""){
						alert("请输入退回内容");
						return false;
					}
				}else if(document.checkPayDetailForm.CHECK_HANDLE_TYPE.value=="投递"){
					if(document.checkPayDetailForm.DELIVERY_BANK.value.trim()==""){
						alert("请输入投递银行");
						return false;
					}
					document.checkPayDetailForm.DELIVERY_BANK_TEXT.value=$.trim($("#DELIVERY_BANK_SINGLE").find("option:selected").text());//投递银行文字
				}
				
				document.getElementById("subUpload").disabled=true;
				$("#checkPayDetailForm").submit();
			}
			
			//上传附件
			function upLoadRentCheckDoc(ID){
				document.uploadForm.ID.value=ID;
				
				$("#upLoad").dialog({
					modal:true,
					autoOpen: false,
					width: 400
				});
				$("#upLoad").dialog('open');
			}
			
			function funUploadFile(){
				alert("确定要上传！");
				$("#uploadForm").submit();
			}
			
			function checkAll(e, itemName)
			{
			  var aa = document.getElementsByName(itemName);
			  for (var i=0; i<aa.length; i++)
			   aa[i].checked = e.checked;
			}
			
			function checkItem(e, allName)
			{
			  if(!e.checked){ 
				  all.checked = false;
			  }else{
			    var aa = document.getElementsByName(e.name);
			    for (var i=0; i<aa.length; i++){
			     if(!aa[i].checked) return;
			    }
			  }
			}
			
			function batchDelivery(){
				if(confirm("是否要批量投递支票?")){
					 var chk_value =[]; 
					  var strIDS="";
					  $('input[name="ids"]:checked').each(function(){   
					   	chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择支票！");
					  	return false;
					  }
				      for (var i=0; i<chk_value.length; i++){
				    	  if(i==0){
				    		  strIDS=chk_value[i];
				    	  }else{
				    		  strIDS=strIDS+","+chk_value[i];
				    	  }
					  }
				      document.checkPayDetailFormBatch.ids.value=strIDS;
					  
					  $("#checkDeliveryPayBatch").toggle(function(){
							$("#checkDeliveryPayBatch").dialog({
						        modal: true,
						        autoOpen: false,
						        width: 450
						    });
					   $("#checkDeliveryPayBatch").dialog('open');  
					  });
				}
			}
			
			function batchCancel(){
				if(confirm("是否要批量作废支票?")){
					  var chk_value =[]; 
					  var strIDS="";
					  $('input[name="ids"]:checked').each(function(){   
					   	chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择支票！");
					  	return false;
					  }
				      for (var i=0; i<chk_value.length; i++){
				    	  if(i==0){
				    		  strIDS=chk_value[i];
				    	  }else{
				    		  strIDS=strIDS+","+chk_value[i];
				    	  }
					  }
				      
				      document.checkDeliveryBatchCancelForm.ids.value=strIDS;
					  
					  $("#checkDeliveryBatchCancel").toggle(function(){
							$("#checkDeliveryBatchCancel").dialog({
						        modal: true,
						        autoOpen: false,
						        width: 450
						    });
					   $("#checkDeliveryBatchCancel").dialog('open');  
					  });
				}
			}
			
			function deliveryCheckBatchCancel(){
				$("#checkDeliveryBatchCancelForm").submit();
			}
			
			function batchRecored(){
				if(confirm("是否要批量入账?")){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
		    	$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'rentContract.batchRecored',
						ids:strIDS},
					dataType:'json',
					success:function(dataBack){
						alert("批量入账成功！");
						location.href="../servlet/defaultDispatcher?__action=rentContract.queryAllRentCheckManageDetail";
			        }   
				});
				}
			}
			
			function batchReturnBack(){
				if(confirm("是否要批量退票?")){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
			      document.checkDeliveryBatchReturnForm.ids.value=strIDS;
				  $("#checkDeliveryBatchReturn").toggle(function(){
						$("#checkDeliveryBatchReturn").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 450
					    });
				   $("#checkDeliveryBatchReturn").dialog('open');  
				  });
			      
				}
			}

			function batchTransfer(){
				if(confirm("是否要批量转移?")){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
			      document.checkBatchbatchTransferForm.ids.value=strIDS;
				  $("#checkDeliveryBatchTransfer").toggle(function(){
						$("#checkDeliveryBatchTransfer").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 450
					    });
				   $("#checkDeliveryBatchTransfer").dialog('open');  
				  });
			      
				}
			}
			
			function deliveryCheckBatchTransfer(){
				$("#checkBatchbatchTransferForm").submit();
			}
			
			function batchAccept(){
				if(confirm("是否要批量接受?")){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
			      document.checkBatchbatchAcceptForm.ids.value=strIDS;
				  $("#checkDeliveryBatchAccept").toggle(function(){
						$("#checkDeliveryBatchAccept").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 450
					    });
				   $("#checkDeliveryBatchAccept").dialog('open');  
				  });
			      
				}
			}	
			
			function deliveryCheckBatchAccept(){
				$("#checkBatchbatchAcceptForm").submit();
			}
			function deliveryCheckBatchBackTo(){
				$("#checkBatchBackToForm").submit();
			}
			
			function deliveryCheckBatchReturn(){
				$("#checkDeliveryBatchReturnForm").submit();
			}
			
			function deliveryCheckPayBatch(){
				document.checkPayDetailFormBatch.DELIVERY_BANK_TEXT.value=$.trim($("#DELIVERY_BANK_BATCH").find("option:selected").text());//投递银行文字
				$("#checkPayDetailFormBatch").submit();
			}
			
			function createNewRentCheckDetail(){
				location.href="../servlet/defaultDispatcher?__action=rentContract.initKeyInRentCheckDetail";
			}
			
			function modifyDeliveryDate(ID,FORCAST_DELIVERY_DATE){
				document.modifyDeliveryDateForm.DELIVERY_DATE_OLD.value=FORCAST_DELIVERY_DATE;
				document.modifyDeliveryDateForm.ID.value=ID;
				$("#modifyDeliveryDate").toggle(function(){
					$("#modifyDeliveryDate").dialog({
					       modal: true,
					       autoOpen: false,
					       width: 450
					   });
					  $("#modifyDeliveryDate").dialog('open');  
				});
			}
			//修改投递银行
			function modifyBank(ID,CHECK_NUM){
				document.modifyBankForm.ID.value=ID;
				document.modifyBankForm.CHECK_NUM.value=CHECK_NUM;
				$("#modifyBank").toggle(function(){
					$("#modifyBank").dialog({
					       modal: true,
					       autoOpen: false,
					       width: 450
					   });
					  $("#modifyBank").dialog('open');  
				});
			}
			//保存（修改投递银行）
			function updateBank(){
				var form = document.modifyBankForm;
				var ID=form.ID.value;
				var DELIVERY_BANK=form.DELIVERY_BANK_SINGLE.value;
		    	$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'rentContract.updateBankById',
							ID:ID,
							DELIVERY_BANK:DELIVERY_BANK
					},
					dataType:'json',
					success:function(dataBack){
						alert("修改成功！");
						$("#modifyBank").dialog('close');  
			        }   
				});
			}
			function subModifyDeliveryDate(){
				var form = document.modifyDeliveryDateForm;
				var ID=form.ID.value;
				var FORCAST_DELIVERY_DATE=form.FORCAST_DELIVERY_DATE.value;
		    	$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'rentContract.modifyDeliveryDate',
						ID:ID,FORCAST_DELIVERY_DATE:FORCAST_DELIVERY_DATE},
					dataType:'json',
					success:function(dataBack){
						alert("修改成功！");
						$("#modifyDeliveryDate").dialog('close');  
			        }   
				});
			}
			
			function batchBackTo(){
				if(confirm("是否要批量退回，请核对是否同一承租人?")){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
			      document.checkBatchBackToForm.ids.value=strIDS;
				  $("#checkDeliveryBatchBackTo").toggle(function(){
						$("#checkDeliveryBatchBackTo").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 450
					    });
				   $("#checkDeliveryBatchBackTo").dialog('open');  
				  });
			      
				}
			}
			// 导出全部
			function exportCheckALL(){
				var QSTART_DATE = $("#QSTART_DATE").val();
				var QEND_DATE = $("#QEND_DATE").val();
				//var QSEARCH_VALUE = $("#QSEARCH_VALUE").val();$("select option:selected")
				var DELIVERY_STATUS = $("select[name='DELIVERY_STATUS']").val();
				var MEMO = $("select[name='MEMO']").val();
				if(QSTART_DATE=='' || QEND_DATE==''){
					alert("请选择日期");
					return false;
				}
				window.parent.callBirt("birtReport/exportCheckExcel/exportCheckExcelAll.rptdesign","xls",{"QSTART_DATE":encodeURI(QSTART_DATE),"QEND_DATE":encodeURI(QEND_DATE),"DELIVERY_STATUS":DELIVERY_STATUS,"MEMO":encodeURI(MEMO)});
			}
			
			function exportCheck(){
				var chk_value =[]; 
				var strIDS="";
				$('input[name="ids"]:checked').each(function(){   
				 	chk_value.push($(this).val());   
				});   
				if(chk_value.length==0){
					alert("你还没有选择支票！");
					return false;
				}
			   	for (var i=0; i<chk_value.length; i++){
					if(i==0){
					 	strIDS=chk_value[i];
					}else{
					 	strIDS=strIDS+","+chk_value[i];
					}
				}
				window.parent.callBirt("birtReport/exportCheckExcel/exportCheckExcel.rptdesign","xls",{"ids":strIDS});
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryAllRentCheckManageDetail" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支票管理</span>
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
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="QSTART_DATE" value="${QSTART_DATE }"></td>
				          <td>结束日期：</td>
									<!--  
													 * 0:正常  （待投递）
													 * 1：作废
													 * 2：投递（已投递）
													 * 3：入账（已入账）
													 * 4：退票
													 * 5：转移
													 * 6：接受
													 * 7：退回
									-->
				          <td><input type="text" name="QEND_DATE" id="QEND_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">&nbsp;&nbsp;&nbsp;&nbsp;支票状态：<select name="DELIVERY_STATUS">
								<option value="-1" <c:if test="${DELIVERY_STATUS==-1 }">selected</c:if>>全部</option>
								<option value="0" <c:if test="${DELIVERY_STATUS==0 }">selected</c:if>>待投递</option>
								<option value="1" <c:if test="${DELIVERY_STATUS==1 }">selected</c:if>>已作废</option>
								<option value="2" <c:if test="${DELIVERY_STATUS==2 }">selected</c:if>>已投递</option>
								<option value="3" <c:if test="${DELIVERY_STATUS==3 }">selected</c:if>>已入账</option>
								<option value="4" <c:if test="${DELIVERY_STATUS==4 }">selected</c:if>>已退票</option>
								<option value="5" <c:if test="${DELIVERY_STATUS==5 }">selected</c:if>>已转移</option>
								<option value="6" <c:if test="${DELIVERY_STATUS==6 }">selected</c:if>>已接收</option>
								<option value="7" <c:if test="${DELIVERY_STATUS==7 }">selected</c:if>>已退回</option>
								<option value="8" <c:if test="${DELIVERY_STATUS==8 }">selected</c:if>>已确认退回</option>
								</select>
								支票备注：<select name="MEMO">
									<c:forEach items="${memoList}" var="item1">
										<option value="${item1.FLAG }" <c:if test="${item1.FLAG eq MEMO}">selected="selected"</c:if>>
											${item1.FLAG }
										</option>
									</c:forEach>
								</select>
								支票类别：<select name="CHECK_TYPE">
										<c:forEach items="${typeList}" var="type">
										<option value="${type.CODE}" <c:if test="${type.CODE eq CHECK_TYPE}">selected="selected"</c:if>>
											${type.FLAG }
										</option>
									</c:forEach>
								       </select>
								</td>
								<td>
								公司别：
								<select name="companyCode">
									<option value="">全部</option>
									<c:forEach items="${companys}" var="item">
										<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
									</c:forEach>
								</select>			          
								</td>								
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="6"><input type="text" id="QSEARCH_VALUE" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:300px;height:18px; font-size: 12px;"></td>
				          <td>&nbsp;</td>
				          <td>&nbsp;</td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
						<td align="center"><a href="#" name="search" id="search" onclick="createNewRentCheckDetail();"  class="blue_button">添加支票</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${checkDetailManage }">
							<c:if test="${empty DELIVERY_STATUS || DELIVERY_STATUS eq 0}">
								<a href="#" name="search" id="search" onclick="batchDelivery(this)"  class="blue_button">批量投递</a> &nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${empty DELIVERY_STATUS || DELIVERY_STATUS eq 0}">
								<a href="#" name="batchCancel" id="batchCancel" onclick="batchCancel();"  class="blue_button">批量作废</a>
							</c:if>
							<c:if test="${DELIVERY_STATUS eq 2}">
								<a href="#" name="batchRecored" id="batchRecored" onclick="batchRecored();"  class="blue_button">批量入账</a>
							</c:if>
							<c:if test="${DELIVERY_STATUS eq 2}">
								<a href="#" name="batchReturnBack" id="batchReturnBack" onclick="batchReturnBack();"  class="blue_button">批量退票</a>
							</c:if>	
								<c:if test="${DELIVERY_STATUS eq 1 or DELIVERY_STATUS eq 4}">
									<a href="#" name="batchTransfer" id="batchTransfer" onclick="batchTransfer();"  class="blue_button">批量转移</a>
								</c:if>
						</c:if>&nbsp;
						<c:if test="${DELIVERY_STATUS eq 5 }">
							<a href="#" name="batchAccept" id="batchAccept" onclick="batchAccept();"  class="blue_button">批量接受</a>
						</c:if>
						<c:if test="${DELIVERY_STATUS eq 6 }">
							<a href="#" name="batchBackTo" id="batchBackTo" onclick="batchBackTo();"  class="blue_button">批量退回</a>
						</c:if>
						<a href="#" name="exportCheck" id="exportCheck" onclick="exportCheck();"  class="blue_button">部分导出</a>
						<c:if test="${checkDetailManage }">
							<a href="#" name="exportCheck" id="exportCheck" onclick="exportCheckALL();"  class="blue_button">全部导出</a>
						</c:if>
						</td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');">&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支票状态
									</th>	
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支票号码
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										出票日期
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支票金额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										备注
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										投递银行
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										备注
									</th>																	
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><c:if test="${DELIVERY_STATUS ne -1 and item.STATE eq DELIVERY_STATUS}"><INPUT TYPE="checkbox" NAME="ids" value="${item.ID}" onclick="checkItem(this,'all')"></c:if>&nbsp;</td>
										<td style="text-align: center;cursor: pointer;" onClick="expandForShow('pactAffix${item.ID}','${item.ID}')"><a><c:if test="${item.STATE eq 0 }">已收票</c:if>
										<c:if test="${item.STATE eq 1}">已作废</c:if>
										<c:if test="${item.STATE eq 2}">已投递</c:if>
										<c:if test="${item.STATE eq 3}">已入账</c:if>
										<c:if test="${item.STATE eq 4}">已退票</c:if>
										<c:if test="${item.STATE eq 5}">已转移</c:if>
										<c:if test="${item.STATE eq 6}">已接收</c:if>
										<c:if test="${item.STATE eq 7}">已退回</c:if>
										<c:if test="${item.STATE eq 8}">已确认退回</c:if>
										</a></td>	
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.CHECK_NUM }&nbsp;</td>
										<td style="text-align: center;"><c:choose><c:when test="${item.CHECK_OUT_DATE eq '1900-01-01'}"></c:when><c:otherwise>${item.CHECK_OUT_DATE}</c:otherwise></c:choose>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.CHECK_MONEY }" type="currency" />&nbsp;</td>
										<td style="text-align: center;">${item.MEMO}&nbsp;</td>
										<td style="text-align: center;">${item.BANK_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.FINANCE_MEMO }&nbsp;</td>										
										<td style="text-align: center;">
										<c:if test="${checkDetailManage }">
											<c:choose>
												<c:when test="${item.STATE eq 0}">
													<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','DELETE','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">作废</a>&nbsp;|&nbsp;
												</c:when>
											</c:choose>
											<c:choose>
											<c:when test="${empty item.DELIVERY_STATUS and item.STATE eq 0}"><a href="javascript:void(0)" onclick="manageCheck('${item.ID }','DELIVERY','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">投递&nbsp;|&nbsp;</a></c:when></c:choose>
												<c:choose>
													<c:when test="${item.DELIVERY_STATUS eq 1 and empty item.RECORDED_STATUS and item.STATE eq 2}">
														<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','RECORDED','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">入账&nbsp;|&nbsp;</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${item.DELIVERY_STATUS eq 1 and empty item.RECORDED_STATUS and item.STATE eq 2}">
													<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','RETURN','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">退票&nbsp;|&nbsp;</a>
													</c:when>
												</c:choose>
													<c:choose>
														<c:when test="${item.DELIVERY_STATUS eq 1 and empty item.RECORDED_STATUS and item.STATE eq 2}">
															<a href="javascript:void(0)" onclick="modifyBank('${item.ID }','${item.CHECK_NUM }');">修改投递银行&nbsp;|&nbsp;</a>
														</c:when>
													</c:choose>
											<c:if test="${empty item.DELIVERY_STATUS and item.STATE eq 0}">
												<a href="javascript:void(0)" onclick="modifyDeliveryDate('${item.ID }','${item.FORCAST_DELIVERY_DATE }');">修改投递日期&nbsp;|&nbsp;</a>
											</c:if>
										</c:if>
										<c:choose>
											<c:when test="${item.STATE eq 0 or item.STATE eq 1 or item.STATE eq 4}">
												<c:if test="${checkDetailManage }">
													<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','TRANSFER','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">转移</a>&nbsp;|&nbsp;
												</c:if>
											</c:when>
											<c:when test="${item.STATE eq 5}">
												<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','ACCEPT','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">接收</a>&nbsp;|&nbsp;
											</c:when>
											<c:when test="${item.STATE eq 6}">
												<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','BACK','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">退回</a>&nbsp;|&nbsp;
											</c:when>
											<c:when test="${item.STATE eq 7}">
												<a href="javascript:void(0)" onclick="manageCheck('${item.ID }','BACKCONFIRM','${item.CHECK_NUM }','${item.CHECK_MONEY }','${item.CHECK_OUT_DATE}');">确认退回</a>&nbsp;|&nbsp;
											</c:when>
										</c:choose>
										<a href="javascript:void(0);" onclick="upLoadRentCheckDoc('${item.ID}')">[上传附件]</a>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="6" align="left">
											<div id="pactAffix${item.ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 90%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
<!------------弹出层:支票批量转移------------>
<div style="display: none;" id="checkDeliveryBatchTransfer" title="您当前的位置:支票批量转移处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkBatchbatchTransferForm" id="checkBatchbatchTransferForm" action="../servlet/defaultDispatcher?__action=rentContract.batchTransfer" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkBatchbatchTransferTableID">
					<input type="hidden" name="ids"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">转移到:<font color="red">*</font><input type="text" name="TRANSFER_TO" size="30"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注说明:
							<input name="FINANCE_MEMO" size="50"/>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subBatchTransfer" value="确&nbsp;定" onclick="deliveryCheckBatchTransfer();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
<!-- 批量退回 -->
<div style="display: none;" id="checkDeliveryBatchBackTo" title="您当前的位置:支票批量退回处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkBatchBackToForm" id="checkBatchBackToForm" action="../servlet/defaultDispatcher?__action=rentContract.batchBackTo" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkBatchBackToTableID">
					<input type="hidden" name="ids"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注说明:
							<input name="FINANCE_MEMO" size="50"/>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subBatchBackTo" value="确&nbsp;定" onclick="deliveryCheckBatchBackTo();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
<!-- 批量接受 -->
<div style="display: none;" id="checkDeliveryBatchAccept" title="您当前的位置:支票批量接受处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkBatchbatchAcceptForm" id="checkBatchbatchAcceptForm" action="../servlet/defaultDispatcher?__action=rentContract.batchAccept" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkBatchbatchAcceptTableID">
					<input type="hidden" name="ids"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注说明:
							<input name="FINANCE_MEMO" size="50"/>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subBatchAccept" value="确&nbsp;定" onclick="deliveryCheckBatchAccept();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
<!------------弹出层:支票批量退票管理------------>
<div style="display: none;" id="checkDeliveryBatchReturn" title="您当前的位置:支票批量退票处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkDeliveryBatchReturnForm" id="checkDeliveryBatchReturnForm" action="../servlet/defaultDispatcher?__action=rentContract.batchReturnBack" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryReturnTableID">
					<input type="hidden" name="ids"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">退票原因:<font color="red">*</font>
							<select name="RETURN_REASON">
								<c:forEach items="${RETURN_REASON_LIST}" var="item" varStatus="status">
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注说明:
							<input name="FINANCE_MEMO" size="50"/>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subBatchReturn" value="确&nbsp;定" onclick="deliveryCheckBatchReturn();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>	
		
<!------------弹出层:支票批量作废管理------------>
<div style="display: none;" id="checkDeliveryBatchCancel" title="您当前的位置:支票批量处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkDeliveryBatchCancelForm" id="checkDeliveryBatchCancelForm" action="../servlet/defaultDispatcher?__action=rentContract.batchCancel" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryCancelTableID">
					<input type="hidden" name="ids"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注<font color="red">*</font>
							<select name="FINANCE_MEMO">
								<c:forEach items="${RETURN_REASON_LIST}" var="item" varStatus="status">
									<option value="${item.FLAG }">${item.FLAG }</option>
								</c:forEach>
							</select>						
						</td>
					</tr>
						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subBatchCancel" value="确&nbsp;定" onclick="deliveryCheckBatchCancel();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>		
		
<!------------弹出层:支票出票管理------------>
<div style="display: none;" id="checkDeliveryPay" title="您当前的位置:支票出票管理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkPayDetailForm" id="checkPayDetailForm" action="../servlet/defaultDispatcher?__action=rentContract.manageCheckPayDetail" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryPayTableID">
					<input type="hidden"  name="TYPE" size="30" />
					<input type="hidden"  name="ID" size="30" />
					<input type="hidden"  name="CHECK_OUT_DATE" size="30" />
					<input type="hidden"  name="DELIVERY_BANK_TEXT" size="30" />
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">支票号:<input type="text"  name="CHECK_NUM" size="30" readonly="readonly"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">支票金额：<input type="text"  name="CHECK_MONEY" size="30" readonly="readonly"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">当前处理方式：<input type="text"  name="CHECK_HANDLE_TYPE" size="30" readonly="readonly"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">处理日期:<font color="red">*</font><input type="text"  id="DELIVERY_DATE" name="DELIVERY_DATE" size="30" readonly="readonly"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" id="DELIVERY_BANK">
						<td style="text-align: left;height:20;">投递银行<font color="red">*</font>
							<select name="DELIVERY_BANK" id="DELIVERY_BANK_SINGLE">
								<c:forEach items="${DELIVERY_BANK}" var="item" varStatus="status">
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" id="RETURN_REASON_TR">
						<td style="text-align: left;height:20;">退票原因:<font color="red">*</font><select name="RETURN_REASON" id="RETURN_REASON"><c:forEach items="${RETURN_REASON_LIST}" var="item" varStatus="status"><option value="${item.CODE }">${item.FLAG }</option></c:forEach></select><input type="hidden"  id="RETURN_REASON_TEXT" name="RETURN_REASON_TEXT" size="30" /></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" id="TRANSFER_TO">
						<td style="text-align: left;height:20;">转移到:<font color="red">*</font><input type="text" name="TRANSFER_TO" size="30"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none;" id="BACK_TO">
						<td style="text-align: left;height:20;">退回:(快递单或人名)<font color="red">*</font><input type="text" name="BACK_TO" size="30"/></td>
					</tr>										
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">备注说明:<input type="text"  id="MEMO" name="MEMO" size="30" /></td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subUpload" value="确&nbsp;定" onclick="deliveryCheckPay();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>

<!------------弹出层:支票出票管理------------>
<div style="display: none;" id="checkDeliveryPayBatch" title="您当前的位置:支票批量处理">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="checkPayDetailFormBatch" id="checkPayDetailFormBatch" action="../servlet/defaultDispatcher?__action=rentContract.batchDelivery" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryTableID">
				<input type="hidden" name="ids"/>
				<input type="hidden" name="DELIVERY_BANK_TEXT"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">投递银行<font color="red">*</font>
							<select name="DELIVERY_BANK" id="DELIVERY_BANK_BATCH">
								<c:forEach items="${DELIVERY_BANK}" var="item" varStatus="status">
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="subUploadBatch" value="确&nbsp;定" onclick="deliveryCheckPayBatch();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>

<!------------弹出层:修改投递日期------------>
<div style="display: none;" id="modifyDeliveryDate" title="您当前的位置:修改投递日期">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="modifyDeliveryDateForm" id="modifyDeliveryDateForm" action="../servlet/defaultDispatcher?__action=rentContract.modifyDeliveryDate" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryDateTableID">
				<input type="hidden" name="ID"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">原投递日期
							<input type="text" name="DELIVERY_DATE_OLD" readonly="readonly"/>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">新投递日期<font color="red">*</font>
							<input type="text" name="FORCAST_DELIVERY_DATE" readonly="readonly" id="FORCAST_DELIVERY_DATE"/>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="modifyButton" value="确&nbsp;定" onclick="subModifyDeliveryDate();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
<!-- Add by Michael 2012 12-14 增加上传附件功能 -->
<!------------弹出层:增加上传附件功能------------>
<div style="display: none;" id="upLoad" title="您当前的位置:支票管理-上传附件">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">请选择要上传文件</TD>
					</TR>			
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">&nbsp;<input class="ui-state-default ui-corner-all" size="30" type="file" name="upLoadFile" id="upLoadFile"/></TD>
						<input name="ID" type="hidden"/>
						<input type="hidden" id="__action" name="__action" value="rentContract.uploadRentCheckDoc" />					
					</TR>
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%"><input type="button" id="uploadRentCheck" value="确&nbsp;定" onclick="funUploadFile()" class="ui-state-default ui-corner-all" ></TD>
					</TR>						
				</table>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- ----修改投递银行 -->
<div style="display: none;" id="modifyBank" title="您当前的位置:修改投递银行 ">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="modifyBankForm" id="modifyBankForm" action="" method="post">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="checkDeliveryDateTableID">
				<input type="hidden" name="ID"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;height:20;">支票号:<input type="text"  name="CHECK_NUM" size="30" readonly="readonly"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" id="DELIVERY_BANK">
						<td style="text-align: left;height:20;">投递银行<font color="red">*</font>
							<select name="DELIVERY_BANK" id="DELIVERY_BANK_SINGLE">
								<c:forEach items="${DELIVERY_BANK}" var="item" varStatus="status">
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
							</select>
						</td>
					</tr>						
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;height:20;" ><input type="button" id="modifyButton" value="确&nbsp;定" onclick="updateBank();" class="ui-state-default ui-corner-all" style="cursor: pointer;"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>
	</body>
</html>