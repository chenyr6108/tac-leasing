<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/deptCmpy/js/base.js"></script>
<script type="text/javascript" src="${ctx}/employee/js/ligerDrag.js"></script>
<script type="text/javascript" src="${ctx}/deptCmpy/js/ligerTree.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/deptCmpy/css/ligerui-all.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"/>
<html>
<head>
<title>部门管理</title>
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
			return row.ID + " " + row.NAME;
		},
		formatResult : function(row) {
			return row.NAME;
		}
	};
	
	$(function() {
		/* $("#tree").ligerTree({ checkbox: false, parentIcon: null, childIcon: null }); */
		
		$('#main').ligerDrag({ proxy: false });
		$('#moveDiv').ligerDrag({ proxy: false });
		
		$.ajax({type:"post",url:"../servlet/defaultDispatcher",data:"__action=employee.getAllEmployee",dataType:"json",success:initCompleteUpperName});
		
		//获得办事处List
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employeeCommand.getCompanyList',
			dataType:'json',
			success: function(data){		
				for(var i=0;i<data.length;i++){
					$("#UPPER_COMPANY_ID_0").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
					$("#UPPER_COMPANY_ID_1").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
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
					$("#UPPER_DEPT_ID_0").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
					$("#UPPER_DEPT_ID_1").get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
				}
			}
		});
		
		/* var upperDept=$("select[name='UPPER_DEPT_ID']"); */
		
		/* getUpperDeptList(upperDept.length); */
		
	});
	
	function initCompleteUpperName(data) {
		dataList = data.employeeList;
		$("#DEPT_MGR_NAME").autocomplete(dataList, options);
		$("#ADD_DEPT_MGR_NAME").autocomplete(dataList, options);
		$("#DEPT_MGR_NAME").result(function (event, data, formatted) {
			if (data != null) {
				$("#DEPT_MGR_ID").val(data.ID);
			}
		});
		$("#ADD_DEPT_MGR_NAME").result(function (event, data, formatted) {
			if (data != null) {
				$("#ADD_DEPT_MGR_ID").val(data.ID);
			}
		});
	}
	
	function closeDialog(msg) {
		$("#"+msg).dialog('close');
	}
	/* function getUpperDeptList(j) {
		
		var upperCompanyId=document.getElementsByName("upperCompanyId")[j-1].value;
		var upperDeptId=document.getElementsByName("upperDeptId")[j-1].value;
		if(upperCompanyId==""||upperCompanyId==null) {
			upperCompanyId=1;
		}
		
		if(j>0) {
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=employeeCommand.getDeptList&COMPANY_ID='+upperCompanyId,
					dataType:'json',
					success: function(data) {		
						for(var i=0;i<data.length;i++) {
							document.getElementsByName("UPPER_DEPT_ID")[j-1].options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
							if(data[i].DEPT_ID==upperDeptId) {
								document.getElementsByName("UPPER_DEPT_ID")[i-1].options[i].selected=true;
							}
						}
					}
				});
				getUpperDeptList(j-1);
		}
	} */
	
	function doQuery() {
		$("#form").submit();
	}
	
	function changeCompany(i) {
		//获得部门List
		var num=i;
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employeeCommand.getDeptList&COMPANY_ID='+$("#UPPER_COMPANY_ID_"+i).val(),
			dataType:'json',
			success: function(data){
				$("#UPPER_DEPT_ID_"+num+" option").each(function() {
					$(this).remove();
				});
				
				for(var i=0;i<data.length;i++){
					$("#UPPER_DEPT_ID_"+num).get(0).options.add(new Option(data[i].DEPT_NAME,data[i].DEPT_ID));
				}
			}
		});
	} 
	
	function selectAll() {
		if($("#SELECT_ALL").attr("checked")) {
			$("input[name='ID']").each(function () {
				$(this).attr("checked",true);
			});
		} else {
			$("input[name='ID']").each(function () {
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
	
	function updateDept() {
		var flag=false;
		$("input[name='ID']").each(function () {
			if($(this).attr("checked")) {
				$("#__action").val("deptCmpyCommand.batchUpdate");
				$("#form").submit();
				flag=true;
			}
		});
		if(!flag) {
			alert("没有勾选索要更新的部门!");
		}
	}
	
	function modifyNewStatus(name) {
		if($("#"+name).attr("checked")) {
			$("#saveButton").css("color","#2E6E9E");
			$("#saveButton").attr("disabled",false);
			if(name=="NEW_UPPER_DEPT") {
				$("select[name='UPPER_COMPANY_ID']").each(function () {
					$(this).attr("disabled",false);
				});
				$("select[name='UPPER_DEPT_ID']").each(function () {
					$(this).attr("disabled",false);
				});
			} else if(name=="NEW_DEPT_MGR") {
				$("#DEPT_MGR_NAME").attr("disabled",false);
				$("#DEPT_MGR_ID").attr("disabled",false);
			} else if(name=="NEW_DEPT_CLASS") {
				$("#DEPT_CLASS_ID").attr("disabled",false);
			} else {
				document.getElementsByName(name)[0].disabled=false;
			}
		} else {
			if(name=="NEW_UPPER_DEPT") {
				$("select[name='UPPER_COMPANY_ID']").each(function () {
					$(this).attr("disabled",true);
				});
				$("select[name='UPPER_DEPT_ID']").each(function () {
					$(this).attr("disabled",true);
				});
			} else if(name=="NEW_DEPT_MGR") {
				$("#DEPT_MGR_NAME").attr("disabled",true);
				$("#DEPT_MGR_ID").attr("disabled",true);
			} else if(name=="NEW_DEPT_CLASS") {
				$("#DEPT_CLASS_ID").attr("disabled",true);
			} else {
				document.getElementsByName(name)[0].disabled=true;
			}
		}
		
		if(!$("#NEW_DEPT_CLASS").attr("checked")&&!$("#NEW_DEPT_MGR").attr("checked")&&!$("#NEW_UPPER_DEPT").attr("checked")) {
			$("#saveButton").css("color","gray");
			$("#saveButton").attr("disabled",true);
		}
	}
	
	function showAddDiv() {
		$('#deptDiv').dialog({
			modal:true,
			autoOpen: false,
			width: 400
		});
		$('#deptDiv').dialog('open');
	}
	
	function addDept() {
		$("#deptForm").submit();
	}
	
	function updateDeptMap() {
		if(!confirm("确认更新部门配置Map么?")) {
			return;
		}
		$("#__action").val("deptCmpyCommand.updateDeptMap");
		$("#updateMapButton").attr("disabled",true);
		$("#form").submit();
	}
	
	function showTree() {
		$("#__action").val('deptCmpyCommand.showTree');
		$("#treeDiv").show("slow");
		$("#form").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form" method="post">
		<input type="hidden" name="__action" id="__action" value="deptCmpyCommand.queryDeptCmpy">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 700px;float: left;display: inline;">
					<span class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
						style="height: 30px; width: 693px; line-height: 30px; font-size: 15px;">&nbsp;&nbsp;部门管理(新版)</span>
					<div class="zc_grid_body jqgrowleft">
						<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
							<tr>
								<td>&nbsp;</td>
								<td class="ss_o">&nbsp;</td>
								<td class="ss_t">
									<table>
										<tr>
											<td align="right">&nbsp;&nbsp;&nbsp;办事处：<select id="COMPANY_ID" name="COMPANY_ID" onchange="doQuery()" style="width: 90px;">
													<c:forEach var="item" items="${companyList}">
														<option value="${item.companyId }"
															<c:if test="${item.companyId eq COMPANY_ID }">selected="selected"</c:if>>
															${item.companyName }</option>
													</c:forEach>
											</select>
											</td>
											<td align="right"> &nbsp;&nbsp;部门：
											<select id="DEPT_ID" name="DEPT_ID" onchange="doQuery()" style="width: 90px;">
					 	  					<option value="">--所有部门--</option>
												<c:forEach var="item" items="${deptList}">
													<option value="${item.deptId }" <c:if test="${item.deptId eq DEPT_ID }">selected="selected"</c:if>>
														${item.deptName }
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
						<br>
					<input type="button" value="添加部门" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="showAddDiv()">
					<!-- <input type="button" value="显示部门树状图 " class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="showTree()"> -->
					<input type="button" value="更新部门映射Map" class="ui-state-default ui-corner-all" style="<c:if test="${isLock eq 'N' }">cursor: pointer;</c:if><c:if test="${isLock eq 'Y' }">color:gray</c:if>" onclick="updateDeptMap()" <c:if test="${isLock eq 'Y' }">disabled="disabled"</c:if> id="updateMapButton">
					</div>
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
		       						部门(所属办事处)
		       					</td>
		       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
		       						上级部门(所属办事处)
		       					</td>
		       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
		       						部门主管
		       					</td>
		       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
		       						上级部门主管
		       					</td>
		       					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">
		       						部门级别
		       					</td>
		       				</tr>
	       				<c:forEach items="${resultList }" var="item" varStatus="index">
	       					<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;" onclick="selectRow('TR_${item.deptId }')">
	       						<td style="text-align: center;">
       								<input type="checkbox" name="ID" value="${item.deptId }" id="TR_${item.deptId }" onclick="selectRow('TR_${item.deptId }')">
       							</td>
	       						<td style="text-align: center;">
	       							${index.count }
	       						</td>
	       						<td style="text-align: center;">
	       							${item.deptName }
	       						</td>
	       						<%-- <td style="text-align: center;">
	       							<select id="UPPER_COMPANY_ID${index.count-1 }" name="UPPER_COMPANY_ID" onchange="changeCompany('${index.count-1 }')" style="width: 100px;">
										<c:forEach var="item1" items="${companyList}">
											<option value="${item1.companyId }"
												<c:if test="${item1.companyId eq item.upperCompanyId }">selected="selected"</c:if>>
												${item1.companyName }
											</option>
										</c:forEach>
									</select>
									<select id="UPPER_DEPT_ID${index.count-1 }" name="UPPER_DEPT_ID" style="width: 90px;" onchange="updateUpperDept('${item.deptId }')">
										<option value=""></option>
									</select>
									<c:if test='${item.upperDeptId == null or empty item.upperDeptId }'>(<b style="color: gray">未分配</b>)</c:if>
									<c:if test='${not empty item.upperDeptId }'>(<b>已分配</b>)</c:if>
									<input name="upperCompanyId" type="hidden" value="${item.upperCompanyId }">
									<input name="upperDeptId" type="hidden" value="${item.upperDeptId }">
	       						</td> --%>
	       						<td style="text-align: center;">
	       							${item.upperDeptName }
	       						</td>
	       						<td style="text-align: center;">
	       							${item.deptMgrName }
	       						</td>
	       						<td style="text-align: center;">
	       							${item.upperDeptMgrName }
	       						</td>
	       						<td style="text-align: center;">
	       							${item.className }
	       						</td>
	       					</tr>
	       				</c:forEach>
       				</table>
					</div>
				</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
		  	<div id="moveDiv" style="position: absolute;float: right;display: inline;width: 450px;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		  		<span class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;line-height: 30px; font-size: 15px;">&nbsp;&nbsp;更新条件</span>
	       		<table cellspacing="0" cellpadding="4" border="0">
       				<tr>
       					<td align="right" style="width: 100px;height: 30px;"> 
       						<input type="checkbox" id="NEW_UPPER_DEPT" onclick="modifyNewStatus('NEW_UPPER_DEPT')" style="vertical-align: middle;">&nbsp;&nbsp;
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;">
       						上级部门:&nbsp;&nbsp;<select id="UPPER_COMPANY_ID_0" name="UPPER_COMPANY_ID" onchange="changeCompany('0')" style="width: 90px;" disabled="disabled"></select>&nbsp;&nbsp;
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<select id="UPPER_DEPT_ID_0" name="UPPER_DEPT_ID" style="width: 90px;" disabled="disabled"></select>&nbsp;&nbsp;
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 150px;height: 30px;">
       						<input type="checkbox" id="NEW_DEPT_MGR" onclick="modifyNewStatus('NEW_DEPT_MGR')" style="vertical-align: middle;">&nbsp;&nbsp;
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						部门主管:&nbsp;&nbsp;
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<input type="text" id='DEPT_MGR_NAME' name='DEPT_MGR_NAME' style="width: 90px;" onchange="$('#DEPT_MGR_ID').val('');" disabled="disabled">&nbsp;&nbsp;<input type="hidden" id='DEPT_MGR_ID' name='DEPT_MGR_ID' disabled="disabled">
       					</td>
       				</tr>
       				<tr>
       					<td align="right" style="width: 150px;height: 28px;"> 
       						<input type="checkbox" id="NEW_DEPT_CLASS" onclick="modifyNewStatus('NEW_DEPT_CLASS')" style="vertical-align: middle;">&nbsp;&nbsp;
       					</td>
       					<td align="right" style="font-family: 微软雅黑;font-size: 13px;vertical-align: middle;margin-left: 50px;">
       						部门级别:&nbsp;&nbsp;
       					</td>
       					<td style="font-family: 微软雅黑;font-size: 13px;">
       						<select name="DEPT_CLASS_ID" id="DEPT_CLASS_ID" disabled="disabled">
       							<c:forEach items="${classList }" var="item">
	       							<option value="${item.CODE }">
	       								${item.FLAG }
	       							</option>
	       						</c:forEach>
       						</select>
       					</td>
       				</tr>
       				<tr>
       					<td colspan="3" align="center" width="400px;">
       						<input type="button" class="ui-state-default ui-corner-all" value="批量更新" style="cursor: pointer;color: gray;" disabled="disabled" id="saveButton" onclick="updateDept()">
       					</td>
       				</tr>
       			</table>	
		  	</div>
		  	<br>
	</form>
	<!-- <div style="width:600px; height:400px; float:right; overflow:auto; margin-right: 600px; display: none;" id="treeDiv">
	    <ul id="tree">
	        <li>
	            <span>节点1</span>
	            <ul>
	                <li>
	                    <span>节点1.1</span>
	                     <ul>
	                        <li><span>节点1.1.2</span></li>
	                        <li><span>节点1.1.2</span></li>
	                     </ul>
	                 </li>
	                 <li><span>节点1.2</span></li>
	            </ul>
	        </li> 
	        <li><span>节点2</span></li>
	        <li>
	            <span>节点3</span>
	            <ul>
	                <li><span>节点3.1</span></li>
	                <li><span>节点3.2</span></li>
	            </ul>
	        </li>
	    </ul>
    </div> -->
	<div id="deptDiv" title="部门添加" style="display: none;">
		<form action="../servlet/defaultDispatcher" id="deptForm" name="deptForm" method="post">
			<input type="hidden" name="__action" value="deptCmpyCommand.addDept">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
           		<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">部门名称：</td>
								<td><input name="ADD_DEPT_NAME" style="width: 90px;"></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">部门所属办事处：</td>
								<td><select id="ADD_COMPANY_ID" name="ADD_COMPANY_ID"style="width: 90px;">
											<c:forEach var="item" items="${companyList}">
												<option value="${item.companyId }">
													${item.companyName }
												</option>
											</c:forEach>
									</select>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">部门主管：</td>
								<td><input type="text" id='ADD_DEPT_MGR_NAME' name='ADD_DEPT_MGR_NAME' style="width: 90px;" onchange="$('#ADD_DEPT_MGR_ID').val('');"><input type="hidden" id='ADD_DEPT_MGR_ID' name='ADD_DEPT_MGR_ID'></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">部门级别：</td>
								<td>
								<select name="ADD_CLASS_ID" id="ADD_CLASS_ID" style="width: 90px;">
	       							<c:forEach items="${classList }" var="item">
		       							<option value="${item.CODE }">
		       								${item.FLAG }
		       							</option>
		       						</c:forEach>
       							</select>
       							</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">上级部门：</td>
								<td>
									<select id="UPPER_COMPANY_ID_1" name="ADD_UPPER_COMPANY_ID" onchange="changeCompany('1')" style="width: 90px;"></select>
									<select id="UPPER_DEPT_ID_1" name="ADD_UPPER_DEPT_ID" style="width: 90px;"></select>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" class="ui-state-default ui-corner-all" value="添加" style="cursor: pointer;" onclick="addDept()">&nbsp;&nbsp;
									<input type="button" class="ui-state-default ui-corner-all" value="关 闭" style="cursor: pointer;" onclick="closeDialog('deptDiv');">
								</td>
							</tr>
						 </table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>