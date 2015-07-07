<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
<script src="${ctx }/common/js/md5.js" type="text/javascript"></script>
<script src="${ctx }/common/js/jsMD5.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${ctx}/employee/js/base.js"></script>
<script type="text/javascript" src="${ctx}/employee/js/ligerDrag.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"/>
<link rel="stylesheet" href="${ctx}/common/js/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${ctx}/common/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.excheck-3.5.js"></script>
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
	
	$(function() {
		$('#moveDiv').ligerDrag({ proxy: false });
		
		//获得职位List
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employeeCommand.getJobList',
			dataType:'json',
			success: function(data){		
				for(var i=0;i<data.length;i++){
					$("#JOB").get(0).options.add(new Option(data[i].FLAG,data[i].CODE));
				}
			}
		});
		//获得主管名称
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
		
		$.ajax({
			url:'../servlet/defaultDispatcher',
			data:'__action=companyCommand.getAllCompanys',
			dataType:'json',
			type:'get',
			success: function(data){		
				for(var i=0;i<data.length;i++){
					$("#select_company").get(0).options.add(new Option(data[i].name,data[i].id));
				}
			}
		});
	});
	
	function initCompleteUpperName(data) {
		dataList = data.employeeList;
		$("#upper_name").autocomplete(dataList, options);
		$("#upper_name").result(function (event, data, formatted) {
			if (data != null) {
				$("#upper_user").val(data.ID);
				after(by("upper_name"),'y');
			} else {
				after(by("upper_name"),'n');
			}
		});
	}
	
	function setPassword() {
		$("#password").val(CalcuMD5("password","form1",false));
	}
	
	function checkPassword() {
		$("#password2").val(CalcuMD5("password2","form1",false));
	}
	
	function checkCodeIsRepeat() {
		code = $("#code").val() ;
		var count = 0 ;
		if(code != null && code != ""){
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=employee.checkCodeIsRepeat&code='+code,
				dataType:'json',
				async: false,
				success: function(dataBack){		
					count = dataBack.count;
				},
				error:function(callback){
					alert("验证用户名错误!");
					return;
				}
			});
			if(count != 0){
				alert('用户名重复请重新输入!');
				$("#code").val("") ;
			}
		}
	}
	
	function goBack() {
		window.location.href="../servlet/defaultDispatcher?__action=employeeCommand.queryEmployee";
	}
	
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
	
	function addRow() {
		var tableName=document.getElementById("DEPT_TABLE");
		var row=0;

		row=tableName.insertRow(tableName.rows.length-2);
		
		var num=tableName.rows.length-2;
		
		cell=row.insertCell(0); 
		cell.align='right'; 
		cell.innerHTML='<select id="COMPANY_ID_'+num+'" name="COMPANY_ID" style="width: 100px;" onchange="changeCompany('+num+')"></select>';

		cell=row.insertCell(1); 
		cell.align='left'; 
		cell.innerHTML='<select id="DEPT_ID_'+num+'" name="DEPT_ID" style="width: 100px;"></select><img src="${ctx }/images/del.gif" style="cursor: pointer;" onclick="delRow.call(this)">';
		
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
	
	function delRow() {
        var tr=this.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        
 /*        var tableName=document.getElementById("DEPT_TABLE");
		var row=0;
		row=tableName.insertRow(tableName.rows.length-1); */
	}
	
	function saveEmployee() {
		var flag=true;
		
		if(trim(by("NAME").value)==""){
			after(by("NAME"),'n');
			flag=false;
		}
		if(trim(by("CELLPHONE").value)==""){
			after(by("CELLPHONE"),'n');
			flag=false;
		}
		if(trim(by("code").value)=="") {
			after(by("code"),'n');
			flag=false;
		}
		if(trim(by("password").value)=="") {
			after(by("password"),'n');
			flag=false;
		}
		if(trim(by("password2").value)=="") {
			after(by("password2"),'n');
			flag=false;
		}
		if(trim(by("EMAIL").value)=="") {
			after(by("EMAIL"),'n');
			flag=false;
		}
		if(trim(by("upper_name").value)=="") {
			after(by("upper_name"),'n');
			flag=false;
		}
		
		
		if(by("EMAIL")!=null && by("EMAIL").value!=null) {	 
			if(by("EMAIL").value.indexOf("@")!=-1&&by("EMAIL").value.indexOf("@")!=0) {
				after(by("EMAIL"),'y');
			} else {
				after(by("EMAIL"),'n');
				flag=false;
			}
		} else {
			after(by("EMAIL"),'n');
			flag=false;
		}
		
		var m1=/^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
		if(by("CELLPHONE").value==null||by("CELLPHONE").value=='') {
			flag=false;
		}
		if(by("CELLPHONE").value.match(m1)) {
			after(by("CELLPHONE"),'y');
		} else {
			after(by("CELLPHONE"),'n');
			flag=false;
		}
		
		if(by("password").value!=by("password2").value) {
			after(by("password2"),'n');
			flag=false;
		}
		
		/* if(isNaN(by("TELPHONE1").value)||by("TELPHONE1").value.length<4) {
			after(by("TELPHONE2"),'n');
			flag=false;
		} */
		if(isNaN(by("TELPHONE2").value)||trim(by("TELPHONE2").value)=='') {
			after(by("TELPHONE2"),'n');
			flag=false;
		}
		
		if(!flag) {
			alert("必须项填写有误,请更正!");
			return;
		}
		
		var newDeptName = $("#newDeptName").val();
		if(newDeptName == ''){
			alert("请选择部门（新）！");
			return;
		}
		$("#saveButton").attr("disabled","disabled");
		$("#form1").submit();
	}
	
	function checkIsSame() {
		if(by("password2").value!="") {
			if(by("password").value!=by("password2").value) {
				after(by("password2"),'n');
			} else {
				after(by("password2"),'y');
			}
		}
	}
	
	function checkTelPhone() {
		var flag=false;
		/* if(isNaN(by("TELPHONE1").value)||by("TELPHONE1").value.length<4) {
			flag=true;
		} else {
			
		} */
		if(isNaN(by("TELPHONE2").value)||trim(by("TELPHONE2").value)=='') {
			flag=true;
		} else {
			
		}
		
		if(flag) {
			after(by("TELPHONE2"),'n');
		} else {
			after(by("TELPHONE2"),'y');
		}
	}
	
	function getPassword() {
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employeeCommand.getPassword',
			dataType:'json',
			success:function(data) { 
				$("#randomPWD").val(data.pwd);
				$("#password").val(data.pwd);
				$("#password").focus();
				$("#password").blur();
				$("#password2").val(data.pwd);
				$("#password2").focus();
				$("#password2").blur();
			}
		});
	}
	
	function initPassword() {
		$("#randomPWD").val($("#password").val());
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

<title>添加员工</title>
</head>
<body style="margin-left: 200px;">
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" id="__action" value="employeeCommand.addEmployee">
	<div id="moveDiv">		
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 600px;">
		<span class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 593px;line-height: 30px; font-size: 15px;">&nbsp;&nbsp;员工添加</span><br>
	       <div class="zc_grid_body jqgrowleft">
	       <span style="padding-left: 250px;font-family: 微软雅黑;font-size: 15px;color: red;">注意:</span>员工添加完成后系统会自动发送邮件给用户
	       <br><br>
	       <span style="padding-left: 250px;font-family: 微软雅黑;font-size: 15px;color: red;">员工信息</span>
	       
	       		<table cellspacing="0" cellpadding="4" border="0" style="padding-left: 250px;">
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;"><b style="color: red;font-family: 微软雅黑;">*</b>姓名:</td>
	       				<td style="border-top-width: 1px;border-top-color: inherit;border-top-style: solid;"><input id="NAME" name="NAME" style="font-family: 微软雅黑;font-size: 13px;" onBlur="lnOut(this);valueIsNotNull(this);"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;">性别:</td>
	       				<td style="font-family: 微软雅黑;font-size: 13px;"><input type="radio" name="SEX" checked="checked" style="cursor: pointer;" value="男">男&nbsp;&nbsp;<input type="radio" name="SEX" style="cursor: pointer;" value="女">女</td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>手机号码:</td>
	       				<td><input id="CELLPHONE" name="CELLPHONE" style="font-family: 微软雅黑;font-size: 13px;" onBlur="mobileTels(this)"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>分机号码:</td>
	       				<td><!-- <input maxlength="4" id="TELPHONE1" name="TELPHONE1" style="font-family: 微软雅黑;font-size: 13px;width: 40px;" onBlur="checkTelPhone()">- --><input maxlength="8" id="TELPHONE2" name="TELPHONE2" style="font-family: 微软雅黑;font-size: 13px;width: 97px;" onBlur="checkTelPhone()"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>邮件地址:</td>
	       				<td><input id="EMAIL" name="EMAIL_ADDRESS" style="font-family: 微软雅黑;font-size: 13px;" onBlur="isEmail(this);"></td>
	       			</tr>
	       		</table>
	       	<br>	
	       	<span style="padding-left: 250px;font-family: 微软雅黑;font-size: 15px;color: red;">帐号信息</span>
	       
	       		<table cellspacing="0" cellpadding="4" border="0" style="padding-left: 250px;">
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;"><b style="color: red;font-family: 微软雅黑;">*</b>用户名:</td>
	       				<td style="border-top-width: 1px;border-top-color: inherit;border-top-style: solid;"><input id="code" name="code" style="font-family: 微软雅黑;font-size: 13px;" onBlur="lnOut(this);checkCodeIsRepeat();valueIsNotNull(this);this.className='txtk';"></td>
	       			</tr>
	       			<tr>
	       				<td align="right"><a style="width: 100px;font-family: 微软雅黑;font-size: 13px;text-decoration: none;color: #3C6E9E" href="javaScript:void(0);" onclick="getPassword()">生成随机密码</a></td>
	       				<td><input id="randomPWD" name="randomPWD" readonly="readonly" style="font-family: 微软雅黑;font-size: 13px;border: 0px;background-color: white"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>登录密码:</td>
	       				<td><input name="password" id="password" style="font-family: 微软雅黑;font-size: 13px;" onfocus="selectContent(this);" onblur="lnOut(this);valueIsNotNull(this);setPassword();checkIsSame()" onkeyup="initPassword()"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>确认密码:</td>
	       				<td><input name="password2" id="password2" style="font-family: 微软雅黑;font-size: 13px;" onfocus="selectContent(this);"  onblur="lnOut(this);valueIsNotNull(this);checkPassword();isAlike(by('password'),this);"></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>主管姓名:</td>
	       				<td><input type="text" id='upper_name' name='upper_name' onchange="$('#upper_user').val('');" style="width: 140px;"><input type="hidden" id='upper_user' name='upper_user'></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>职务:</td>
	       				<td><select id="JOB" name="USER_JOB" style="width: 100px;"></select></td>
	       			</tr>
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;"><b style="color: red;font-family: 微软雅黑;">*</b>查看权限:</td>
	       				<td><select id="NODE" name="NODE" style="width: 100px;">
								<option value="0">全部</option>
								<option value="2">区域</option>
								<option value="1" selected="selected">部分</option>
							</select>
						</td>
	       			</tr>
	       		</table>
	       	<br>	
	       	<span style="padding-left: 250px;font-family: 微软雅黑;font-size: 15px;color: red;">所在部门&nbsp;&nbsp;<img src="${ctx }/images/add.gif" alt="新增一个部门" style="cursor: pointer;" onclick="addRow()"></span>
	       		<table cellspacing="0" cellpadding="4" border="0" style="padding-left: 250px;" id="DEPT_TABLE">
	       			<tr>
	       				<td align="right" style="width: 100px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
	       					<select id="COMPANY_ID_0" name="COMPANY_ID" onchange="changeCompany('0')" style="width: 100px;"></select>
	       				</td>
	       				<td align="left" style="width: 140px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
	       					<select id="DEPT_ID_0" name="DEPT_ID" style="width: 100px;"></select><img src="${ctx }/images/blank.gif">
	       				</td>
	       			</tr>
	       			<tr>
	       				<td align="left" style="width: 100px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
	       					<font color="red">*</font>公司：
	       					<select id="select_company">
	       					
	       					</select>
	       				</td>
	       				<td align="left" style="width: 220px;font-family: 微软雅黑;font-size: 13px;border-top-width: 1px;border-top-color: inherit;border-top-style: solid;">
	       					部门：<input type="text" readonly="readonly" onfocus="selectNewDept()" id="newDeptName">
	       					<input type="hidden"  id="newDeptId" name="newDeptId">
	       				</td>
	       			</tr>
	       			<tr>
	       				<td align="center"><br><input value="保存" type="button" class="ui-state-default ui-corner-all" onclick="saveEmployee()" style="cursor: pointer;" id="saveButton">&nbsp;&nbsp;<input value="返回" type="button" class="ui-state-default ui-corner-all" onclick="goBack()" style="cursor: pointer;"></td>
	       			</tr>
	       		</table>
	       	<br>
	       </div>
	    </div>
	</div>
	</form>
	
	<div style="display:none" id="newDeptDiv">
		<ul id="depttree" class="ztree" style="width:80%;height:80%;"></ul>
	</div>
</body>
</html>