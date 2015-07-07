<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script src="${ctx }/common/js/md5.js" type="text/javascript"></script>
<script src="${ctx }/common/js/jsMD5.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/common/js/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${ctx}/common/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<html>
<head>
<title>员工管理</title>
<script type="text/javascript">
	$(function() {
		var content = {
		        tipInfo: "<font style='font-size:11px;'>输入模糊匹配员工姓名,主管姓名,员工登录帐号!<br></font>"
		    };
		$("#CONTENT").showTip(content);
		$("select").css("height","19px");
	});
	
	//作废一条员工记录
	function updateEmployeeStatus(id,num) {
		if(num==-2) {
			if(confirm('确认作废？')) {
				location.href='../servlet/defaultDispatcher?__action=employeeCommand.updateEmployeeStatus&employeeId='+id+"&employeeStatus="+num;
			} else {
				return false;
			}
		} else {
			if(confirm('确认启用？')) {
				location.href='../servlet/defaultDispatcher?__action=employeeCommand.updateEmployeeStatus&employeeId='+id+"&employeeStatus="+num;
			} else {
				return false;
			}
		}
		
	}

	//重置密码
	function resetPass(id) {
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=employeeCommand.getPassword',
				dataType:'json',
				success:function(data) { 
					$("#password").val(data.pwd);
					if(confirm('确认密码重置为'+$("#password").val()+'么?')) {
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=employeeCommand.resetPassword&id='+id+'&MD5password='+CalcuMD5("password","form1",false)+'&password='+$("#password").val(),
							dataType:'json',
							success:function(flag) { 
								if(flag) {
									alert("密码更新成功,已发送mail通知用户!");
								}
							}
						});
					}
				}
			});
	}
	
	function gotoAdd() {
		window.location.href="${ctx }/employee/addEmployee.jsp";
	}
	
	function queryEmployeeDetail(id) {
		window.location.href="../servlet/defaultDispatcher?__action=employeeCommand.queryEmployeeDetail&employeeId="+id;
	}
	
	function userDeptUpdate(id,name){
		$("#userNameTd").html(name);
		$("#userId").val(id);
		$("#newDeptId").val("");
		$("#newDeptName").val("");
		$("#userDeptUpdate").dialog({
			title:'用户部门维护',
			height: 200,
			width:480,
			modal: true,
			resizable:false
		});
	}
	
	function updateUserDept(){
		var param = $("#userDeptForm").serializeArray();
		$.ajax({
			url:"${ctx}/servlet/defaultDispatcher?__action=employeeCommand.updateUserDept",
			dataType:"json",
			data:param,
			type:"post",
			async:false,
			success:function(data){
				if(data){
					alert("操作成功");
					$("#userDeptUpdate").dialog("close");
					doSearch();
				}else{
					alert("操作失败，请联系系统管理员！");
				}
			},
			error:function(){
				alert("操作失败，请联系系统管理员！");
			}	
		});
	}
	var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId"
				},
				key: {
					name:"displayName"
				}
			},
			callback: {
				onClick: clickDept
			}
		};
		function clickDept(){
			var treeObj = $.fn.zTree.getZTreeObj("depttree");
			var nodes = treeObj.getSelectedNodes();
			var id  = nodes[0].id;
			var name =  nodes[0].displayName;
			$("#newDeptName").val(name);
			$("#newDeptId").val(id);
			$("#newDeptDiv").dialog("close");
		}
		function selectNewDept(){
			var companyId = $("#select_company").val();
			if(companyId == ""){
				alert("请先选择一个公司！");
				return;
			}
			var param = {"companyId":companyId};
			$.ajax({
				url:"${ctx}/servlet/defaultDispatcher?__action=deptCommand.getDeptByCompany",
				dataType:"json",
				data:param,
				type:"post",
				async:false,
				success:function(data){
					$.fn.zTree.init($("#depttree"), setting, data);
	 				$("#newDeptDiv").dialog({
						title:"选择部门",
						height: 400,
						width:500,
						modal: true,
						resizable:false
					}); 
				},
				error:function(){
					alert("操作失败，请联系系统管理员！");
				}	
			});
			
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" id="__action" value="employeeCommand.queryEmployee">
		<input type="hidden" id="password">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工管理</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	       <div class="zc_grid_body jqgrowleft">
	       <br>
	       		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td>&nbsp;</td>
				        <td class="ss_o">&nbsp;</td>
				        <td class="ss_t">
				        <table id="searchTable">
				          <tr>
				            <td align="right">
				          	  	内容：<input name="CONTENT" id="CONTENT" value="${CONTENT }">
				            </td>
				            <td align="right">
				            	&nbsp;&nbsp;&nbsp;&nbsp;帐号状态：<select name="STATUS" id="STATUS">
										            				<option value="">--所有--</option>
										            				<option value="0" <c:if test="${STATUS eq 0 }">selected="selected"</c:if>>正常</option>
										            				<option value="-2" <c:if test="${STATUS eq -2 }">selected="selected"</c:if>>作废</option>
										            			 </select>
				            </td>	
					 	  </tr>
					 	  <tr>
					 	  	<td align="right">
					 	  		办事处：<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
											<c:forEach var="item" items="${deptList}">
												<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
													${item.DEPT_NAME }
												</option>
											</c:forEach>
										</select>
					 	  	</td>
					 	  	<td align="right">
					 	  		&nbsp;&nbsp;&nbsp;&nbsp;职位：<select id="JOB_ID" name="JOB_ID">
																<option value="">--所有职位--</option>
																<c:forEach var="item" items="${jobs}">
																	<option value="${item.CODE }" <c:if test="${item.CODE eq JOB_ID }">selected="selected"</c:if>>
																		${item.FLAG }
																	</option>
																</c:forEach>
															</select>
					 	  	</td>
					 	  </tr>
						</table>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	       </div>
	       <br>
	       <div class="ui-state-default ui-jqgrid-hdiv">
	       		<table cellspacing="0" cellpadding="0" border="0" style="width: 100%"><tr><td><input type="button" value="添加员工" class="ui-state-default ui-corner-all" onclick="gotoAdd()" style="cursor: pointer;"></td><td style="text-align: right;"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td></tr></table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
					<tr>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							员工姓名(登录帐号)
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							职位
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="upName" pagingInfo="${pagingInfo }">主管姓名</page:pagingSort>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							所属办事处-部门
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							所属部门(部门领导)(新)
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							邮件地址,手机,分机
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="loginTimeDescr" pagingInfo="${pagingInfo }">最后登录时间</page:pagingSort>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="ip" pagingInfo="${pagingInfo }">最后登录IP</page:pagingSort>
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							帐号状态
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作 
						</th>
					</tr>
					<c:forEach items="${pagingInfo.resultList }" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor:pointer;">
						<td style="text-align:center;">${index.count }</td>
						<td style="text-align:center;">${item.name }(${item.code })</td>
						<td style="text-align:center;">${item.jobDescr }</td>
						<td style="text-align:center;">${item.upName }</td>
						<td style="text-align:center;">${item.deptName }</td>
						<td style="text-align:center;">${item.newDeptName }(${item.deptLeaderName })</td>
						<td style="text-align:center;">${item.email }<br>${item.mobile }<br>${item.telephone }</td>
						<td style="text-align:center;">${item.loginTimeDescr }</td>
						<td style="text-align:center;">${item.ip }</td>
						<td style="text-align:center;<c:if test='${item.status == -2 }'>color:red;</c:if>"><c:if test="${item.status == 0 }">正常</c:if><c:if test="${item.status == -2 }">作废</c:if></td>
						<td style="text-align:center;">
							<c:if test="${item.status == 0 }">
								<a href="javaScript:void(0);" onclick="queryEmployeeDetail(${item.id });">更新</a>&nbsp;
								<a href="javaScript:void(0);" onclick="resetPass(${item.id });">重置密码</a>&nbsp;
								<a href="javaScript:void(0);" onclick="updateEmployeeStatus(${item.id },-2);">作废</a>
								<a href="javaScript:void(0);" onclick="userDeptUpdate(${item.id },'${item.name }');">更新部门</a>&nbsp;
							</c:if>
							<c:if test="${item.status == -2 }">
								更新&nbsp;
								重置密码&nbsp;
								<a href="javaScript:void(0);" onclick="updateEmployeeStatus(${item.id },0);">启用</a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
				<page:pagingToolbar pagingInfo="${pagingInfo }"/>
	       </div>
	    </div>	
	</form>
	<div id="userDeptUpdate" style="display:none">
		<form id="userDeptForm">
		<input type="hidden" name="userId" id="userId">
		<table class="panel_table">
			<tr>
				<th>用户名：</th><td id="userNameTd"></td>
			</tr>
	       	<tr>
	       		<th>公司：</th>
  				<td >					
					<select id="select_company" >
						<c:forEach items="${companys }" var="cmpy">
							<option value="${cmpy.id }">
								${cmpy.name }
							</option>
						</c:forEach>
					</select>
 				</td>
 			</tr>
 			<tr>
 				<th>部门：</th>
  				<td>
  					部门：<input type="text" readonly="readonly" onfocus="selectNewDept()" id="newDeptName" value="">
  					<input type="hidden"  id="newDeptId" name="newDeptId" value="">
  				</td>
  			</tr>
   			<tr>
   				<td style="text-align: center" colspan="2"><input value="保存" type="button" class="ui-state-default ui-corner-all" onclick="updateUserDept()" style="cursor: pointer;" >&nbsp;&nbsp;<input value="关闭" type="button" class="ui-state-default ui-corner-all" onclick="javascript:$('#userDeptUpdate').dialog('close')" style="cursor: pointer;"></td>
   			</tr>
	    </table>
	    </form>
	    <div style="display:none" id="newDeptDiv">
		  <ul id="depttree" class="ztree" style="width:80%;height:80%;"></ul>
	 	</div>
	</div>

</body>
</html>