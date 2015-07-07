<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/employee/js/base.js"></script>
<script type="text/javascript" src="${ctx}/employee/js/ligerDrag.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"/>

<html>
<head>
<title>员工批量管理</title>
<!-- <script type="text/javascript">
	var deptCmpyList=new Array();
	var j=0;
</script> -->
<!-- 从后台获得用户已经所在的所有部门号 -->
<%-- <c:forEach items="${resultList }" var="item">
	<c:forEach var="item1" items="${item.deptCmpyList}">
		<script type="text/javascript">
			deptCmpyList[j]=${item1.deptId };
			j++;
		</script>
	</c:forEach>
</c:forEach> --%>
<script>
$(window).scroll(function() {
	$('#moveDiv').css("margin-top",document.body.scrollTop);
});

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
			return row.ID + " " + row.NAME;
		},
		formatResult : function(row) {
			return row.NAME;
		}
	};

$(function() {
	
	$('#main').ligerDrag({ proxy: false });
	//$('#moveDiv').ligerDrag({ proxy: false });
	
	$.ajax({type:"post",url:"../servlet/defaultDispatcher",data:"__action=employee.getAllEmployee",dataType:"json",success:initCompleteUpperName});
	
	//获得办事处List
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getCompanyList',
		dataType:'json',
		success: function(data){		
			for(var i=0;i<data.length;i++){
				$("#COMPANY_ID_0").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
	//获得部门List,默认拿苏州办事处的
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getDeptList&COMPANY_ID=1',
		dataType:'json',
		success: function(data){		
			for(var i=0;i<data.length;i++){
				$("#DEPT_ID_0").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
	
});

function changeCompany(i) {
	//获得部门List
	var num=i;
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getDeptList&COMPANY_ID='+$("#COMPANY_ID_"+i).val(),
		dataType:'json',
		success: function(data){
			$("#DEPT_ID_"+num+" option").each(function() {
				$(this).remove();
			});
			
			for(var i=0;i<data.length;i++){
				$("#DEPT_ID_"+num).get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
}

function initCompleteUpperName(data) {
	dataList = data.employeeList;
	$("#NEW_UPPER_NAME").autocomplete(dataList, options);
	$("#NEW_UPPER_NAME").result(function (event, data, formatted) {
		if (data != null) {
			$("#NEW_UPPER_ID").val(data.ID);
		}
	});
}

function getDepts(i,data) {
	if(i>0) {
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employeeCommand.getDeptList&COMPANY_ID='+document.getElementsByName("COMPANY_LIST")[i-1].value,
			dataType:'json',
			success:function(data) {
				for(var j=0;j<data.length;j++) {
					document.getElementsByName("DEPT_LIST")[i-1].options.add(new Option(data[j].DEPT_NAME,data[j].DEPT_ID));
					if(data[j].DEPT_ID==deptCmpyList[i-1]) {
						document.getElementsByName("DEPT_LIST")[i-1].options[j].selected=true;
					}
				}
				getDepts(i-1,data);
			}
		});
	}
}

function changeCompany1(id) {
	//获得部门List
	var index=id;
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getDeptList&COMPANY_ID='+$("#COMPANY_LIST_"+index).val(),
		dataType:'json',
		success: function(data){
			$("#DEPT_LIST_"+index+" option").each(function() {
				$(this).remove();
			});
			
			for(var i=0;i<data.length;i++) {
				$("#DEPT_LIST_"+index).get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
}

function doQuery() {
	$("#__action").val("employeeCommand.batchEmployee");
	$("#form").submit();
}

function selectAll() {
	if($("#SELECT_ALL").attr("checked")) {
		$("input[name='EMPLOYEE_ID']").each(function () {
			$(this).attr("checked",true);
		});
	} else {
		$("input[name='EMPLOYEE_ID']").each(function () {
			$(this).attr("checked",false);
		});
	}
}

function selectRow(id) {
	if($("#"+id).attr("checked")) {
		$("#"+id).attr("checked",false);
	} else {
		$("#"+id).attr("checked",true);
	}
}

function modifyNewStatus(name) {
	if($("#"+name).attr("checked")) {
		$("#saveButton").css("color","#2E6E9E");
		$("#saveButton").attr("disabled",false);
		if(name=="NEW_COMPANY") {
			$("#addButton").css("width","10px");
			$("select[name='NEW_COMPANY_ID']").each(function () {
				$(this).attr("disabled",false);
			});
			$("select[name='NEW_DEPT_ID']").each(function () {
				$(this).attr("disabled",false);
			});
		} else if(name=="NEW_UPPER_USER") {
			document.getElementsByName(name)[0].disabled=false;
			document.getElementsByName("NEW_UPPER_ID")[0].disabled=false;
		} else {
			document.getElementsByName(name)[0].disabled=false;
		}
	} else {
		if(name=="NEW_COMPANY") {
			$("#addButton").css("width","0px");
			$("select[name='NEW_COMPANY_ID']").each(function () {
				$(this).attr("disabled",true);
			});
			$("select[name='NEW_DEPT_ID']").each(function () {
				$(this).attr("disabled",true);
			});
		} else if(name=="NEW_UPPER_USER") {
			document.getElementsByName(name)[0].disabled=true;
			document.getElementsByName("NEW_UPPER_ID")[0].disabled=true;
		} else {
			document.getElementsByName(name)[0].disabled=true;
		}
	}
	
	if(!$("#NEW_JOB").attr("checked")&&!$("#NEW_UPPER_USER").attr("checked")&&!$("#NEW_COMPANY").attr("checked")) {
		$("#saveButton").css("color","gray");
		$("#saveButton").attr("disabled",true);
	}
}

function delRow() {
    var tr=this.parentNode.parentNode;
    tr.parentNode.removeChild(tr);
    
    var tableName=document.getElementById("DEPT_TABLE");
	var row=0;
	row=tableName.insertRow(tableName.rows.length-1);
}

function addRow() {
	var tableName=document.getElementById("DEPT_TABLE");
	var row=0;

	row=tableName.insertRow(tableName.rows.length);
	
	var num=tableName.rows.length;
	
	cell=row.insertCell(0); 
	cell.align='right'; 
	cell.innerHTML='';
	
	cell=row.insertCell(1); 
	cell.align='right'; 
	cell.innerHTML='<select id="COMPANY_ID_'+num+'" name="NEW_COMPANY_ID" style="width: 90px;" onchange="changeCompany('+num+')"></select>';

	cell=row.insertCell(2); 
	cell.align='right'; 
	cell.innerHTML='<select id="DEPT_ID_'+num+'" name="NEW_DEPT_ID" style="width: 90px;"></select>&nbsp;<img src="${ctx }/images/del.gif" style="cursor: pointer;" onclick="delRow.call(this)">';
	
	row.appendChild(cell);
	
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getCompanyList',
		dataType:'json',
		success: function(data){		
			for(var i=0;i<data.length;i++){
				$("#COMPANY_ID_"+num).get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
	//获得部门List,默认拿苏州办事处的
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employeeCommand.getDeptList&COMPANY_ID=1',
		dataType:'json',
		success: function(data){		
			for(var i=0;i<data.length;i++){
				$("#DEPT_ID_"+num).get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
			}
		}
	});
}

function batchUpdate() {
	var flag=false;
	$("input[name='EMPLOYEE_ID']").each(function () {
		if($(this).attr("checked")) {
			$("#__action").val("employeeCommand.batchUpdate");
			$("#form").submit();
			flag=true;
		}
	});
	if(!flag) {
		alert("没有勾选人员!");
	}
}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form" method="post">
		<input type="hidden" name="__action" id="__action" value="">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 700px;float: left;display: inline;">
	       <div class="zc_grid_body jqgrowleft">
	       <span class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 692px;line-height: 30px; font-size: 15px;">&nbsp;&nbsp;员工批量管理</span>
	       <br>
	       		<table width="700px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td>&nbsp;</td>
				        <td class="ss_o">&nbsp;</td>
				        <td class="ss_t">
				        <table>
					 	  <tr>
					 	  	<td align="right">
					 	  		&nbsp;&nbsp;办事处：<select id="COMPANY_ID" name="COMPANY_ID" onchange="doQuery()" style="width: 90px;">
											<c:forEach var="item" items="${companyList}">
												<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq COMPANY_ID }">selected="selected"</c:if>>
													${item.DEPT_NAME }
												</option>
											</c:forEach>
										</select>
					 	  	</td>
					 	  	<td align="right">
					 	  		&nbsp;&nbsp;部门：<select id="DEPT_ID" name="DEPT_ID" onchange="doQuery()" style="width: 90px;">
					 	  					<option value="">--所有部门--</option>
											<c:forEach var="item" items="${deptList}">
												<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
													${item.DEPT_NAME }
												</option>
											</c:forEach>
										</select>
					 	  	</td>
					 	  	<td align="right">
					 	  		&nbsp;&nbsp;职位：<select id="JOB_ID" name="JOB_ID" onchange="doQuery()" style="width: 90px;">
																<option value="">--所有职位--</option>
																<c:forEach var="item" items="${jobList}">
																	<option value="${item.CODE }" <c:if test="${item.CODE eq JOB_ID }">selected="selected"</c:if>>
																		${item.FLAG }
																	</option>
																</c:forEach>
															</select>
					 	  	</td>
					 	  	<td align="right">
					 	  		&nbsp;&nbsp;主管：<select id="UPPER_ID" name="UPPER_ID" onchange="doQuery()" style="width: 90px;">
																<option value="">--所有员工--</option>
																<c:forEach var="item" items="${upperList}">
																	<option value="${item.id }" <c:if test="${item.id eq UPPER_ID }">selected="selected"</c:if>>
																		${item.name }
																	</option>
																</c:forEach>
												 </select>
								
					 	  	</td>
					 	  </tr>
						</table>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td></td>
				      </tr>
				    </table>
	       </div>
	       <br>
	       <div class="ui-state-default ui-jqgrid-hdiv">
       			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
       				<tr>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						<input type="checkbox" id="SELECT_ALL" onclick="selectAll()">
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						序号
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						员工姓名
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						办事处
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						部门
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						职位
       					</td>
       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
       						主管
       					</td>
       				</tr>
       				<c:forEach items="${resultList }" var="item" varStatus="index">
       					<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;" onclick="selectRow('TR_${item.id }')">
       						<td style="text-align: center;">
       							<input type="checkbox" name="EMPLOYEE_ID" value="${item.id }" id="TR_${item.id }" onclick="selectRow('TR_${item.id }')">
       						</td>
	   						<td style="text-align: center;">
	       						${index.count }
	       					</td>
	       					<td style="text-align: center;">
	       						${item.name }
	       					</td>
	       					<td style="text-align: center;">
	       						<%-- <c:forEach var="item1" items="${item.deptCmpyList}" varStatus="index2">
	       						<select id="COMPANY_LIST_${item.id }_${index2.count}" name="COMPANY_LIST" onchange="changeCompany('${item.id }_${index2.count}')">
		       						<c:forEach var="item2" items="${companyList}">
										<option value="${item2.DEPT_ID }" <c:if test="${item2.DEPT_ID eq item1.companyId }">selected="selected"</c:if>>
											${item2.DEPT_NAME }
										</option>
									</c:forEach>
								</select><br>
								</c:forEach> --%>
								<c:forEach var="item1" items="${item.deptCmpyList}">
									${item1.companyName }<br>
								</c:forEach>
	       					</td>
	       					<td style="text-align: center;">
	       						<%-- <c:forEach var="item1" items="${item.deptCmpyList}" varStatus="index2">
	       						<select id="DEPT_LIST_${item.id }_${index2.count}" name="DEPT_LIST">
								</select><br>
								</c:forEach> --%>
								<c:forEach var="item1" items="${item.deptCmpyList}">
									${item1.deptName }<br>
								</c:forEach>
	       					</td>
	       					<td style="text-align: center;">
	       						<%-- <select>
	       						<c:forEach var="item1" items="${jobList}">
									<option value="${item1.CODE }" <c:if test="${item1.CODE eq item.jobCode }">selected="selected"</c:if>>
										${item1.FLAG }
									</option>
								</c:forEach>
								</select> --%>
								${item.jobDescr }
	       					</td>
	       					<td style="text-align: center;">
	       						<%-- <select>
	       								<option value=""></option>
									<c:forEach var="item1" items="${upperList}">
										<option value="${item1.id }" <c:if test="${item1.id eq item.upperId }">selected="selected"</c:if>>
											${item1.name }
										</option>
									</c:forEach>
								</select> --%>
								${item.upName }
	       					</td>
       					</tr>
       				</c:forEach>
       			</table>
       			<br>
       			<%-- <span style="padding-left: 100px;font-family: 微软雅黑;font-size: 15px;color: red;font-weight: normal;">更新条件</span>
       			<table style="padding-left: 100px;" cellspacing="0" cellpadding="4" border="0" id="DEPT_TABLE">
       				<tr>
       					<td align="right" style="width: 180px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;"> 
       						<input type="checkbox" id="NEW_JOB" onclick="modifyNewStatus('NEW_JOB')" style="vertical-align: middle;margin-left: 50px;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
       						职位:
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
       						<select name="NEW_JOB" style="width: 90px;" disabled="disabled">
								<c:forEach var="item" items="${jobList}">
									<option value="${item.CODE }">
										${item.FLAG }
									</option>
								</c:forEach>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 180px;"> 
       						<input type="checkbox" id="NEW_UPPER_USER" onclick="modifyNewStatus('NEW_UPPER_USER')" style="vertical-align: middle;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						主管姓名:
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<input type="text" id='NEW_UPPER_NAME' name='NEW_UPPER_USER' style="width: 90px;" onchange="$('#NEW_UPPER_ID').val('');" disabled="disabled"><input type="hidden" id='NEW_UPPER_ID' name='NEW_UPPER_ID' disabled="disabled">
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 180px;"> 
       						<input type="checkbox" id="NEW_COMPANY" onclick="modifyNewStatus('NEW_COMPANY')" style="vertical-align: middle;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						<select id="COMPANY_ID_0" name="NEW_COMPANY_ID" onchange="changeCompany('0')" style="width: 90px;" disabled="disabled"></select>
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<select id="DEPT_ID_0" name="NEW_DEPT_ID" style="width: 90px;" disabled="disabled"></select>&nbsp;<img src="${ctx }/images/add.gif" id="addButton" onclick="addRow()" style="width: 0px;">
       					</td>
       				</tr>
       			</table>
       			<table style="padding-left: 100px;" cellspacing="0" cellpadding="4" border="0">
       				<tr>
       					<td colspan="3" align="center" width="400px;">
       						<input type="button" class="ui-state-default ui-corner-all" value="批量更新" style="cursor: pointer;color: gray;" disabled="disabled" id="saveButton" onclick="batchUpdate()">
       					</td>
       				</tr>
       			</table> --%>
	       </div>
	    </div>
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <div id="moveDiv" style="position: absolute;float: right;display: inline;width: 400px;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	  	<span class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;line-height: 30px; font-size: 15px;">&nbsp;&nbsp;更新条件</span>
       			<table cellspacing="0" cellpadding="4" border="0" id="DEPT_TABLE">
       				<tr>
       					<td align="right" style="width: 150px;"> 
       						<input type="checkbox" id="NEW_JOB" onclick="modifyNewStatus('NEW_JOB')" style="vertical-align: middle;margin-left: 50px;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;">
       						职位:
       					</td>
       					<td style="font-family: 微软雅黑;">
       						<select name="NEW_JOB" style="width: 90px;" disabled="disabled">
								<c:forEach var="item" items="${jobList}">
									<option value="${item.CODE }">
										${item.FLAG }
									</option>
								</c:forEach>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 150px;"> 
       						<input type="checkbox" id="NEW_UPPER_USER" onclick="modifyNewStatus('NEW_UPPER_USER')" style="vertical-align: middle;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						主管姓名:
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<input type="text" id='NEW_UPPER_NAME' name='NEW_UPPER_USER' style="width: 90px;" onchange="$('#NEW_UPPER_ID').val('');" disabled="disabled"><input type="hidden" id='NEW_UPPER_ID' name='NEW_UPPER_ID' disabled="disabled">
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 150px;"> 
       						<input type="checkbox" id="NEW_COMPANY" onclick="modifyNewStatus('NEW_COMPANY')" style="vertical-align: middle;">
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						<select id="COMPANY_ID_0" name="NEW_COMPANY_ID" onchange="changeCompany('0')" style="width: 90px;" disabled="disabled"></select>
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<select id="DEPT_ID_0" name="NEW_DEPT_ID" style="width: 90px;" disabled="disabled"></select>&nbsp;<img src="${ctx }/images/add.gif" id="addButton" onclick="addRow()" style="width: 0px;cursor: pointer;">
       					</td>
       				</tr>
       			</table>
       			<table style="padding-left: 100px;" cellspacing="0" cellpadding="4" border="0">
       				<tr>
       					<td colspan="3" align="center" width="400px;">
       						<input type="button" class="ui-state-default ui-corner-all" value="批量更新" style="cursor: pointer;color: gray;" disabled="disabled" id="saveButton" onclick="batchUpdate()">
       					</td>
       				</tr>
       			</table>
	  </div>
	</form>
</body>
</html>