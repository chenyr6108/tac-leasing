<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"></link>

<html>
	<head>
		<title>供应商集团授信</title>
<script>

	function showAddDiv() {
		$("#save1").attr("disabled",false);
		$("#suplGroupName").val('');
		$("#remark").val('');
		$("#addDiv").dialog({modal:true, autoOpen:false, width:400});
		$("#addDiv").dialog("open");
	}
	
	function addSuplGroup() {
		if($("#suplGroupName").val()=='') {
			alert("供应商集团名称不能为空!");
			return;
		}
		$("#save1").attr("disabled","disabled");
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=supplierGroupCommand.addSuplGroup&suplGroupName='+$("#suplGroupName").val()+"&remark="+$("#remark").val(),
			dataType:'json',
			success:function(data){
				if(data) {
					alert("添加供应商集团成功!");
					$("#form1").submit();
				} else {
					alert("添加供应商集团失败!");
				}
			}
		});
	}
	
	function showSupp(id,suplGroupCode,suplGroupName) {
		
		$("#save2").attr("disabled","disabled");
		
		$("#suplGroupName2").val(suplGroupName);
		var trs=document.getElementsByName("suplName");
		
		for(var i=trs.length-1;i>=0;i--) {
			$("#suplTable").find("tr").eq(i+1).remove();
		}
		
		$("#suplGroupId").val(id);
		$("#suplGroupCode").val(suplGroupCode);
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=supplierGroupCommand.getSupl&suplGroupCode='+$("#suplGroupCode").val(),
			dataType:'json',
			success:function(data){
				var tableName=document.getElementById("suplTable");
				var row=0;
				var num=0;
				for(var i=0;i<data.length;i++) {
					row=tableName.insertRow(tableName.rows.length);
					num=tableName.rows.length-1;
					
					cell=row.insertCell(0); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=num;
					
					cell=row.insertCell(1); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].suplName+"<input type='hidden' name='suplId' value='"+data[i].suplId+"'><input type='hidden' name='suplName'>";
					
					cell=row.insertCell(2);
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML="<a href='#' onclick='delRow.call(this)'>删除</a>";
									
					row.appendChild(cell);
				}
				$("#suplDiv").dialog({modal:true, autoOpen:false, width:600});
				$("#suplDiv").dialog("open");
			}
		});
	}
	
	function addRow() {
		
			$("#save2").attr("disabled",false);
			
			var tableName=document.getElementById("suplTable");
			var row=tableName.insertRow(tableName.rows.length);
			
			var num=tableName.rows.length-1;
			
			cell=row.insertCell(0); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML=num;
			
			cell=row.insertCell(1); 
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML="<img src='${ctx }/images/loading.gif' id='loadingImage"+num+"'><div id='suplDiv"+num+"' style='display:none'><input name='suplName' id='suplName"+num+"' style='width:261px;'></div><input type='hidden' name='suplId' id='suplId"+num+"'>";
			
			cell=row.insertCell(2);
			cell.align='center'; 
			cell.className='ui-widget-content jqgrow ui-row-ltr';
			cell.innerHTML="<a href='#' onclick='delRow.call(this)'>删除</a>";
							
			row.appendChild(cell);
			
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=supplierGroupCommand.getSuplList',
				dataType:'json',
				success: function(dataList) {
				
					var options = {
									minChars : 1,
									max : 25,
									mustMatch: false,
									width:260,
									matchContains: true,
									formatItem : function(row, i, max) {
										return row.suplName;
									},
									formatMatch : function(row, i, max) {
										return row.suplId + " " + row.suplName;
									},
									formatResult : function(row) {
										return row.suplName;
									}
								   };
					
					$("#suplName"+num).autocomplete(dataList, options);
					$("#suplName"+num).result(function(event, data, formatted) {
						$("#suplId"+num).val(data.suplId);
					});
					$("#suplDiv"+num).css("display","block");
					$("#loadingImage"+num).css("display","none");
				}
			});
			
			var content = {
			        tipInfo: "<font style='font-size:11px;'>输入模糊匹配获得供应商数据!<br></font>"
			    };
			$("#suplName"+num).showTip(content);
		}
	
	function delRow() {
		
		$("#save2").attr("disabled",false);
        var tr=this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
	}
	
	function mapSuplToGroup() {
		
		$("#save2").attr("disabled","disabled");
		
		var suplIds="";
		for(var i=0;i<document.getElementsByName("suplId").length;i++) {
			if(document.getElementsByName("suplId")[i].value=='') {
				alert("第"+(i+1)+"行的供应商输入不符合要求!");
				$("#save2").attr("disabled",false);
				return;
			}
			if(i==document.getElementsByName("suplId").length-1) {
				suplIds=suplIds+document.getElementsByName("suplId")[i].value;
			} else {
				suplIds=suplIds+document.getElementsByName("suplId")[i].value+"-";
			}
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=supplierGroupCommand.mapSuplToGroup&suplGroupCode='+$("#suplGroupCode").val()+"&suplId="+suplIds+"&suplGroupName="+$("#suplGroupName2").val(),
			dataType:'json',
			success:function(flag){
				if(flag) {
					alert("供应商更新成功!");
					$("#form1").submit();
				} else {
					alert("供应商更新失败!");
				}
			}
		});
	}
	
	function goCreditPage(suplGroupName,suplGroupCode) {
		window.location.href="../servlet/defaultDispatcher?__action=supplierGroupCommand.getCreditDetail&suplGroupName="+suplGroupName+"&suplGroupCode="+suplGroupCode;
	}
	
	function getCreditLog(suplGroupCode) {
		
		var trs=document.getElementsByName("logId");
		
		for(var i=trs.length-1;i>=0;i--) {
			$("#logTable").find("tr").eq(i+1).remove();
		}
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=supplierGroupCommand.getCreditLog&suplGroupCode='+suplGroupCode,
			dataType:'json',
			success:function(data) {
				
				var tableName=document.getElementById("logTable");
				var row="";
				var num="";
				for(var i=0;i<data.length;i++) {
					row=tableName.insertRow(tableName.rows.length);
					num=tableName.rows.length-1;
					
					cell=row.insertCell(0); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=num;
					
					cell=row.insertCell(1); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].suplGroupName+"<input type='hidden' name='logId'>";
					
					cell=row.insertCell(2); 
					cell.align='right'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].union;
					
					cell=row.insertCell(3); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					if(data[i].unionLoopFlag=="Y") {
						cell.innerHTML="是";
					} else {
						cell.innerHTML="否";
					}
					
					cell=row.insertCell(4); 
					cell.align='right'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].buyBack;
					
					cell=row.insertCell(5); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					if(data[i].buyBackLoopFlag=="Y") {
						cell.innerHTML="是";
					} else {
						cell.innerHTML="否";
					}
					
					/* cell=row.insertCell(6); 
					cell.align='right'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].payBefore;
					
					cell=row.insertCell(7); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					if(data[i].payBeforeLoopFlag=="Y") {
						cell.innerHTML="是";
					} else {
						cell.innerHTML="否";
					} */
					
					cell=row.insertCell(6); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].fromDateDescr+"~"+data[i].toDateDescr;
					
					cell=row.insertCell(7); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].name+"在"+data[i].createOnDescr+"<br>添加了供应商集团授信";
					
					row.appendChild(cell);
				} 
				$("#logDiv").dialog({modal:true, autoOpen:false, width:1024});
				$("#logDiv").dialog("open");
			}
		});
	}
</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="supplierGroupCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;供应商集团授信</span>
		   	</div>
		   	
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
			           <div>
			          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					        <tr>
						      <td width="8">&nbsp;</td>
					          <td width="60" class="ss_o"></td>
					          <td width="80%" class="ss_t" valign="top">
					          	
					          <table style="margin-left: 10px; height: 100%;">
						          <tr valign="middle">
									<td>供应商：</td>
									<td>
										<input type="text" name="supl_name" value="${supl_name }" style=" width:200px; height: 22px;">
									</td>				        
							          <td>集团：</td>
							          <td>
							          	<input type="text" name="group_name" value="${group_name }" style=" width:200px; height: 22px;">
							          </td>
						          </tr>
						      </table>
						      </td>
						        <td width="55" class="ss_th" valign="top">
						        	&nbsp;
						        </td>
						        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
						      </tr>
					     </table>
		       		</div>
	           
				 <div class="ui-state-default ui-jqgrid-hdiv">
					<div style="background-color: white;">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td><input type="button" value="添加供应商集团" class="panel_button" onclick="showAddDiv()"></td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
						</tr>
					</table>
							<table class="grid_table">
								<tr>
									<th rowspan="2">
										序号
									</th>
									<th rowspan="2">
										<page:pagingSort orderBy="suplGroupName" pagingInfo="${pagingInfo }">供应商集团名称</page:pagingSort>
									</th>
									<th rowspan="2">
										<page:pagingSort orderBy="suplCount" pagingInfo="${pagingInfo }">包含供应商</page:pagingSort>
									</th>
									<th colspan="4"> 
										授信额度
									</th>
									<th rowspan="2">
										授信状态
									</th>
									<th rowspan="2">
										操作
									</th>
								</tr>
								<tr>
									<th>
										<page:pagingSort orderBy="[union]" pagingInfo="${pagingInfo }">连保额度</page:pagingSort>
									</th>
									<th>
										<page:pagingSort orderBy="buyBack" pagingInfo="${pagingInfo }">回购额度</page:pagingSort>
									</th>
									<th>
										<page:pagingSort orderBy="payBefore" pagingInfo="${pagingInfo }">交机前拨款</page:pagingSort>
									</th>
									<th>
										<page:pagingSort orderBy="invoice" pagingInfo="${pagingInfo }">发票待补</page:pagingSort>
									</th>
								</tr>
								<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
									<tr style="cursor: pointer;">
										<td style="text-align: center;">${index.count }&nbsp;</td>
										<td style="text-align: center;">${item.suplGroupName }&nbsp;</td>
										<td style="text-align: center;">${fn:replace(fn:substring(item.suplName, 0, (fn:length(item.suplName) - 1)), ',', '<br>') }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.union }"></fmt:formatNumber>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.buyBack }"></fmt:formatNumber>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.payBefore }"></fmt:formatNumber>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.invoice }"></fmt:formatNumber>&nbsp;</td>
										<td style="text-align: center;<c:if test='${item.flag eq "Y" }'>color:#FF0000</c:if>"><c:if test="${item.flag eq 'Y' }">已授信</c:if><c:if test="${item.flag eq 'N' }">未授信</c:if>&nbsp;</td>
										<td style="text-align: center;"><a href="javaScript:void(0)" onclick="showSupp('${item.id}','${item.suplGroupCode }','${item.suplGroupName }')">添加供应商</a>&nbsp;|&nbsp;<c:if test="${item.suplCount eq '0'}">添加授信</c:if><c:if test="${item.suplCount ne '0'}"><a href="javaScript:void(0)" onclick="goCreditPage('${item.suplGroupName}','${item.suplGroupCode }')">添加授信</a></c:if>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="getCreditLog('${item.suplGroupCode }')">日志</a></td>
									</tr>
								</c:forEach>
							</table>
						<page:pagingToolbar pagingInfo="${pagingInfo }"/>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none" id="addDiv" title="添加供应商集团">
	         	<div class="zc_grid_body jqgrowleft">	
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-th-ltr zc_grid_head">
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">集团名称：</td>
								<td style="text-align:left;"><font color="red">*</font><input id="suplGroupName" style="width: 253px" maxlength="50"></td>							
							</tr>
							<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">备注：</td>
								<td style="text-align:left;">&nbsp;&nbsp;<textarea rows="2" cols="40" id="remark"></textarea></td>								
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" class="ui-state-default ui-corner-all"  value="保&nbsp;存" style="cursor: pointer;" onclick="addSuplGroup()" id="save1">&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#addDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div style="display: none" id="suplDiv" title="添加供应商"><input id="suplGroupId" type="hidden"><input id="suplGroupCode" type="hidden"><input id="suplGroupName2" type="hidden">
	          		<div class="zc_grid_body jqgrowleft">
					<input value="添加供应商" type="button" class="ui-state-default ui-corner-all" onclick="addRow()" style="cursor: pointer;">
						<div class="ui-state-default ui-jqgrid-hdiv">
							<table id="suplTable" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr class="ui-state-default ui-th-ltr zc_grid_head">
									<td style="text-align:center">序号</td>
									<td style="text-align:center;">供应商名称</td>
									<td style="text-align:center;">操作</td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td colspan="3" style="text-align: center;">
										<input type="button" class="ui-state-default ui-corner-all"  value="保&nbsp;存" style="cursor: pointer;" onclick="mapSuplToGroup()" id="save2" disabled="disabled">&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#suplDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
									</td>
								</tr>
							</table>
						</div>
					</div>
			</div>
			<div style="display: none" id="logDiv" title="查看日志">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="logTable">
							<tr class="ui-state-default ui-th-ltr zc_grid_head grid_table">
									<th style="text-align:center">序号</th>
									<th style="text-align:center;">供应商集团名称</th>
									<th style="text-align:center;">连保额度</th>
									<th style="text-align:center;">连保额度<br>是否循环</th>
									<th style="text-align:center;">回购额度</th>
									<th style="text-align:center;">回购额度<br>是否循环</th>
									<!-- <th style="text-align:center;">交机前拨款</th>
									<th style="text-align:center;">交机前拨款<br>是否循环</th> -->
									<th style="text-align:center;">有效日期</th>
									<th style="text-align:center;">操作日志</th>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td style="text-align: center;">
									<input type="button" class="ui-state-default ui-corner-all" onclick="$('#logDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>