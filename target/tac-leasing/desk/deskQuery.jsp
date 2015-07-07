<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"/>
<html>
<head>
<script type="text/javascript">
	var options = {
			minChars : 1,
			max : 30,
			mustMatch: true,
			matchContains : true,
			formatItem : function(row, i, max) {
				var rs = row.NAME;
				return rs;
			},
			formatMatch : function(row, i, max) {
				return row.id + " " + row.NAME;
			},
			formatResult : function(row) {
				return row.NAME;
			}
	};
	function showAddDiv() {
		$("#deskDiv").dialog({modal:true, autoOpen:false, width:300, hide:'slide', show:'slide'});
		$("#deskDiv").dialog("open");
	}
	
	function saveDesk() {
		
		if($("#GROUP_NAME").val()=="") {
			alert("组别名不能为空!");
			return;
		}
		if($("#GROUP_CODE").val()=="") {
			alert("组别代码不能为空!");
			return;
		}
		$("#saveForm").submit();
	}
	
	function delDesk(id) {
		if(!confirm("确认删除么?")) {
			return;
		}
		$("#__action").val("deskCommand.deleteDeskGroup");
		$("#id").val(id);
		$("#form").submit();
	}
	
	function showAuthDiv(id) {
		$("#id2").val(id);
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=deskCommand.getDeskAuthList&id2='+id,
			dataType:'json',
			success: function(dataList) {
				var htmlContent="<br>";
				for(var i=0;i<dataList.length;i++) {
					if((i+1)%6==0) {
						if(dataList[i].CHECKED=='Y') {
							htmlContent=htmlContent+"&nbsp;<input type='checkbox' value='"+dataList[i].CODE+"' style='vertical-align: middle;' checked='checked' name='permission'>"+dataList[i].FLAG+"&nbsp;&nbsp;<br>";
						} else {
							htmlContent=htmlContent+"&nbsp;<input type='checkbox' value='"+dataList[i].CODE+"' style='vertical-align: middle;' name='permission'>"+dataList[i].FLAG+"&nbsp;&nbsp;<br>";
						}
						
					} else {
						if(dataList[i].CHECKED=='Y') {
							htmlContent=htmlContent+"&nbsp;<input type='checkbox' value='"+dataList[i].CODE+"' style='vertical-align: middle;' checked='checked' name='permission'>"+dataList[i].FLAG+"&nbsp;&nbsp;";
						} else {
							htmlContent=htmlContent+"&nbsp;<input type='checkbox' value='"+dataList[i].CODE+"' style='vertical-align: middle;' name='permission'>"+dataList[i].FLAG+"&nbsp;&nbsp;";
						}
					}
				}
				$("#auth").html(htmlContent);
			}
		});
		
		$("#deskAuthDiv").dialog({modal:true, autoOpen:false, width:800, hide:'slide', show:'slide', position:['center',50]});
		$("#deskAuthDiv").dialog("open");
	}
	
	function showUserDiv(id) {
		$("#id3").val(id);
		
		var trs=document.getElementsByName("userId");
		
		for(var i=trs.length-1;i>=0;i--) {
			$("#userTable").find("tr").eq(i+1).remove();
		}
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=deskCommand.getPermissionUserList&id3='+id,
			dataType:'json',
			success:function(data) {
				
				for(var i=0;i<data.length;i++) {
					
					var tableName=document.getElementById("userTable");
					var row=tableName.insertRow(tableName.rows.length);
					
					var num=tableName.rows.length-1;
					
					cell=row.insertCell(0); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=num;
					
					cell=row.insertCell(1); 
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML=data[i].NAME+"<input type='hidden' name='userId' id='userId"+num+"' value='"+data[i].ID+"'>";
					
					cell=row.insertCell(2);
					cell.align='center'; 
					cell.className='ui-widget-content jqgrow ui-row-ltr';
					cell.innerHTML="<a href='#' onclick='delRow.call(this)'>删除</a>";
									
					row.appendChild(cell);
				}
			}
		});
		
		$("#deskUserDiv").dialog({modal:true, autoOpen:false, width:327 ,hide:'slide', show:'slide', position:['center',10]});
		$("#deskUserDiv").dialog("open");
	}
	
	function saveAuthDesk() {
		$("#saveAuthForm").submit();
	}
	
	function addRow() {
		
		$("#save2").attr("disabled",false);
		
		var tableName=document.getElementById("userTable");
		var row=tableName.insertRow(tableName.rows.length);
		
		var num=tableName.rows.length-1;
		
		cell=row.insertCell(0); 
		cell.align='center'; 
		cell.className='ui-widget-content jqgrow ui-row-ltr';
		cell.innerHTML=num;
		
		cell=row.insertCell(1); 
		cell.align='center'; 
		cell.className='ui-widget-content jqgrow ui-row-ltr';
		cell.innerHTML="<img src='${ctx }/images/loading.gif' id='loadingImage"+num+"'><div id='userDiv"+num+"' style='display:none'><input name='userName' id='userName"+num+"' style='width:100px;' onchange='$('#userId"+num+"').val('');'></div><input type='hidden' name='userId' id='userId"+num+"'>";
		
		cell=row.insertCell(2);
		cell.align='center'; 
		cell.className='ui-widget-content jqgrow ui-row-ltr';
		cell.innerHTML="<a href='#' onclick='delRow.call(this)'>删除</a>";
						
		row.appendChild(cell);
		
		$.ajax({type:"post",url:"../servlet/defaultDispatcher",data:"__action=employee.getAllEmployee",dataType:"json",
			success:function(data) {
				dataList=data.employeeList;
				$("#userName"+num).autocomplete(dataList,options);
				$("#userName"+num).result(function (event,data,formatted) {
					if (data!=null) {
						$("#userId"+num).val(data.ID);
					}
				});
				
				$("#userDiv"+num).css("display","block");
				$("#loadingImage"+num).css("display","none");
			}
		});
	}
	
	function delRow() {
		
		$("#save2").attr("disabled",false);
        var tr=this.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        
        var tableName=document.getElementById("userTable");
		var row=0;
		row=tableName.insertRow(tableName.rows.length-1);
	}
	
	function saveUserDesk() {
		$("#saveUserForm").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" id="form" method="post">
		<input type="hidden" name="__action" id="__action" value="deskCommand.query">
		<input type="hidden" name="id" id="id">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;桌面权限管理</span>
	</div>
			<div class="ui-state-default ui-jqgrid" style="background: white">
				<br><input type="button" value="添加组别" class="ui-state-default ui-corner-all" onclick="showAddDiv()" style="cursor: pointer;"><br>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
					<tr>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							组别名
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							组别代码
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							包含的人员
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							包含的桌面模块
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor:pointer;">
						<td style="text-align:center;">${index.count }</td>
						<td style="text-align:center;">${item.name }</td>
						<td style="text-align:center;">${item.code }</td>
						<td style="text-align:center;">${item.userName }</td>
						<td style="text-align:center;">${item.auth }</td>
						<td style="text-align:center;"><a href="#" onclick="showUserDiv('${item.code }')">更新人员</a>|<a href="#" onclick="showAuthDiv('${item.code }')">更新桌面模块</a>|<a href="#" onclick="delDesk('${item.id }')">删除组别</a></td>
					</tr>
					</c:forEach>
				</table>
	       </div>
</form>
			<div style="display: none" id="deskDiv" title="添加组别">
				<form action="../servlet/defaultDispatcher?__action=deskCommand.saveDeskGroup" method="post" id="saveForm">
	          		<div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td style="text-align:center;">组别名(description)</td>
									<td style="text-align:center;">组别代码(code)</td>
								</tr>
								<tr>
									<td style="text-align:center;"><input id="GROUP_NAME" name="GROUP_NAME"></td>
									<td style="text-align:center;"><input id="GROUP_CODE" name="GROUP_CODE"></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="saveDesk()">
										&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#deskDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div style="display: none" id="deskAuthDiv" title="桌面模块">
				<form action="../servlet/defaultDispatcher?__action=deskCommand.saveDeskAuth" method="post" id="saveAuthForm">
				<input name="id2" id="id2" type="hidden">
	          		<div>
						<div class="ui-state-default ui-jqgrid-hdiv" style="background: white;">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td id="auth" style="font-family: 微软雅黑;">
									</td>
								</tr>
								<tr>
									<td align="center">
										<br>
										<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="saveAuthDesk()">
										&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#deskAuthDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div style="display: none" id="deskUserDiv" title="人员设定">
				<form action="../servlet/defaultDispatcher?__action=deskCommand.saveDeskUser" method="post" id="saveUserForm">
				<input name="id3" id="id3" type="hidden">
	          		<div>
						<div class="ui-state-default ui-jqgrid-hdiv" style="background: white;">
						<input value="添加人员" type="button" class="ui-state-default ui-corner-all" onclick="addRow()" style="cursor: pointer;">
							<table id="userTable" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 300px;">
								<tr class="ui-state-default ui-th-ltr zc_grid_head">
									<td style="text-align:center">序号</td>
									<td style="text-align:center;">姓名</td>
									<td style="text-align:center;">操作</td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 300px;">
								<tr>
									<td align="center">
										<br>
										<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="saveUserDesk()" id="save2" disabled="disabled">
										&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#deskUserDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
</body>
<c:if test="${isExist eq 'Y' }">
<script>
	alert("组别代码重复!请重新添加!");
</script>
</c:if>
</html>