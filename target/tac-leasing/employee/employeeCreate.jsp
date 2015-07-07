<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/md5.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/jsMD5.js" type="text/javascript"></script>
		<script src="${ctx }/employee/js/employee.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/employee/js/idCard.js"></script>
		<script type="text/javascript" src="tab_data/tab.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
 		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
 		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<title>员工添加</title>
		<script type="text/javascript">
		$(function (){
			$("#IN_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#OUT_DATE").datepicker($.datepicker.regional['zh-CN']);			
		});			
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = {
					mateIdCard: new IdCard('mate_id_card'),
					idCard: new IdCard('id_card')
				};
			});
			function validateIdCard(){ 
			       var couldSubmit = true;
			       for (var i = 0; i < arguments.length; i++) {
			              var id = arguments[i];
			              if( idCardMap[id].isValid ){
			                 IdCard.$(id+'1').innerHTML =  "<img src='../images/ytq.gif'/>";
							 return couldSubmit;
			              }else{
			                  IdCard.$(id+'1').innerHTML =  "<img src='../images/wtq.gif'/>";
							  couldSubmit = false;
			              }
			      }
			}
			
			
			function addBank(){
	tab=document.getElementById("bankTab");
	sed=tab.rows.length;
	if(sed==1){
		row=tab.insertRow(tab.rows.length);
		row.className = "ui-widget-content jqgrow ui-row-ltr";
		var cell = row.insertCell(0);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.rowSpan=2;
		cell.id="bankTd";
		cell.innerHTML="其他账户 ";
		row.appendChild(cell);
	}else{
		vtd=document.getElementById("bankTd"); 
		vtd.rowSpan=vtd.rowSpan+1;
	} 
	row=tab.insertRow(tab.rows.length);
	row.className = "ui-widget-content jqgrow ui-row-ltr";
	var cell = row.insertCell(0);  
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="<input type='checkbox' name='check_id' id='check_id"+sed+"' value='"+sed+"' /> 开户银行：";
	row.appendChild(cell);
	var cell = row.insertCell(1);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="<input type=\"text\" name=\"BANK_NAME\" id=\"BANK_NAME"+sed+"\" style=\"width: 150px;\">";
	row.appendChild(cell);
	var cell = row.insertCell(2);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML="账号：";
	row.appendChild(cell);
	var cell = row.insertCell(3);  
	cell.className="ui-widget-content jqgrow ui-row-ltr";
	cell.colSpan=3;
	cell.innerHTML="<input type=\"text\" name=\"BANK_ACCOUNT\" id=\"BANK_ACCOUNT"+sed+"\" style=\"width: 150px;\">";
	row.appendChild(cell);
	
	$("#bankTab td").each(function(){
		$(this).attr('class','ui-widget-content jqgrow ui-row-ltr');
	})
}


function deleteBank(){
	check=document.getElementsByName("check_id");
	tab=document.getElementById("bankTab"); 
	for(i=check.length-1;i>=0;i--){
		if(check[i].checked==true){  
			if(tab.rows.length!=3){
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr); 
			}else{
				var tr = check[i].parentNode.parentNode;
       		 	tr.parentNode.removeChild(tr);   
       		 	tab.rows[1].parentNode.removeChild(tab.rows[1]);  
			}
		}
	}
}

function checkCodeIsRepeat(){
	code = $("#code").val() ;
	var count = 0 ;
	if(code != null && code != ""){
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=employee.checkCodeIsRepeat&code=' + code,
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
function addDept(divCount){
	for(var i = 1; i <= divCount; i++){
		/* if($("select[id=decp_id_" + i + "]").val() == ""
				|| $("select[id=decp_id2_" + i + "]").val() == ""
				|| $("select[id=dept_id_" + i + "]").val() == ""){ */
		if($("#dept_" + i).css("display") == "none"){
			$("#dept_" + i).css("display", "block");
			break;
		}
	}
}
function delDept(divId){
	$("#dept_" + divId).css("display", "none");
	$("select[id=decp_id_" + divId + "]").val("");
	$("select[id=decp_id2_" + divId + "]").val("");
	$("select[id=dept_id_" + divId + "]").val("");
}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" value="employee.add">
			<input type="hidden" name="head" value="">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工添加</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
           <div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td rowspan="15" align="center" valign="middle" width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
						人<br>
						员<br>
						基<br>
						本<br>
						情<br>
						况<br>
					</td>
					<td width="16%" class="ui-widget-content jqgrow ui-row-ltr">姓名:</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" colspan="3"><input type="text" name="name" id="name"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"> <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td >身份证号码：</td>
					<td colspan="3"><input type="hidden" name="id_card" id="id_card"><span id="id_card1"></span></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>性别：</td>
					<td colspan="3"><input type="radio" name="sex" value="男" checked="checked">男<input type="radio" name="sex" value="女">女</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>年龄：</td>
					<td colspan="3"><input type="text" name="age" id="id_cardAge" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="isAge(this),this.className='txtk'"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>身份证地址：</td>
					<td colspan="3"><input type="text" size="50" name="id_card_address"	id="id_cardAddr" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>手机号码：</td>
					<td colspan="3"><input type="text" name="mobile" class="txtk"  id="mobile" onFocus="this.className='txtklan';selectContent(this);" onBlur="mobileTels(this),this.className='txtk'"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系电话(家庭座机)：</td>
					<td colspan="3"><input type="text" name="telephone" id="telephone" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="isPhone(this);this.className='txtk'"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>邮编：</td>
					<td><input type="text" name="zip" id="zip" class="txtk" onFocus="this.className='txtklan';selectContent(this);" onBlur="isPostCode(this);this.className='txtk'" /></td>
					<td>Email：</td>
					<td><input type="text" name="email" id="email"  class="txtk" onFocus="this.className='txtklan';selectContent(this);" onBlur="isEmail(this);this.className='txtk'" /></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>家庭常住地址：</td>
					<td colspan="3"><input type="text" size="50" name="address" id="address" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>配偶姓名：</td>
					<td><input type="text" name="mate_name" id="mate_name" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
					<td>配偶身份证号：</td>
					<td><input type="hidden" name="mate_id_card" id="mate_id_card"><span id="mate_id_card"></span></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>配偶身份证地址：</td>
					<td colspan="3"><input type="text" size="50" name="mate_id_card_addr" id="mate_id_cardAddr" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>配偶联系电话：</td>
					<td colspan="3"><input type="text" name="mate_telphone" id="mate_telphone" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>配偶工作单位：</td>
					<td colspan="3"><input type="text" size="50" name="mate_work_unit" id="mate_work_unit" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>配偶工作地址：</td>
					<td colspan="3"><input type="text" size="50" name="mate_work_unit_address" id="mate_work_unit_address" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);isNotNull(this);this.className='txtk';"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>备注：</td>
					<td colspan="3"><textarea rows="3" cols="70" name="memo" id="memo" onFocus="selectContent(this);" onBlur="lnOut(this);" style="border:#c0c0c0 solid 1px; width:585px; height:50px; font-size:12px"></textarea></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head"><strong>开户银行</strong></td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head">相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="javascript:void(0)" onClick="addBank();">添加</a></td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head"><img src="${ctx }/images/u103.gif">&nbsp;<a href="javascript:void(0)" onClick="deleteBank();">删除</a></td>
							</tr>
		<tr id="13" class="ui-widget-content jqgrow ui-row-ltr">
		<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr"><table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<c:if test="${empty suplBankAccount}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID" style="width: 150px;"></td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;"></td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;"></td>
								</tr>
							</c:if>
							<c:if test="${not empty suplBankAccount}">
								<c:forEach items="${suplBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID" style="width: 150px;" value="${item.PCCBA_ID }"></td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }"></td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
											<td   class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(suplBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td   rowspan="${fn:length(suplBankAccount)}" id="bankTd" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center">其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${suplBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="checkbox" name="check_id" id="check_id">开户银行：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_NAME" id="BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }"></td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
				</tr>
		<tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="4" bgcolor="#c0c0c0" align="center" height="35" class="ui-state-default ui-th-ltr zc_grid_head">
						登录信息
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>用户名:</td>
					<td colspan="3"><input type="text" name="code" id="code"  class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="lnOut(this);checkCodeIsRepeat();valueIsNotNull(this);this.className='txtk';"> <font color="#ff0080">*</font></td>
					<!-- <td>所在部门：</td>
					<td>
						<select id="decp_id" name="decp_id" onchange="loadCompanyInfo();"><option value="-1">--请选择公司类型--</option><option value="1">--总公司--</option><option value="2">--分公司--</option></select><font color="#ff0080">*</font><select id="decp_id2" name="decp_id2" onchange="loadDeptInfo();"><option value="-1">--请选择公司--</option></select> <font color="#ff0080">*</font><select id="dept_id" name="dept_id"><option value="-1">--请选择部门--</option></select> <font color="#ff0080">*</font></td>
				 --></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>职务:</td>
					<td colspan="3"><select name="job" id="job">
							<option value="-1">--请选择--</option>
						<c:forEach items="${jobs}" var="item">
							<option value="${item.CODE }">${item.FLAG }</option>
						</c:forEach>
						</select><span id=showUpper>主管姓名 : <input type="text" id='upper_name' name='upper_name' size="20" onchange="$('#upper_user').val('');"> <input type="hidden" id='upper_user' name='upper_user'></span><font color="#ff0080">*</font></td> 
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>登录密码:	</td>
					<td><input type="password" size="30" name="password" id="password" onfocus="selectContent(this);" onblur="lnOut(this);valueIsNotNull(this);setPassword();"><font color="#ff0080">*</font></td>
					<td>确认密码：</td>
					<td><input type="password" size="30" name="password2" id="password2"  onfocus="selectContent(this);"  onblur="lnOut(this);valueIsNotNull(this);checkPassword();isAlike(by('password'),this);"><font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>入职时间:</td>
					<td><input type="text" name="IN_DATE" id="IN_DATE"  ></td>
					<td>离职时间：</td>
					<td><input type="text" name="OUT_DATE" id="OUT_DATE"  ></td>
				</tr>
				<!-- <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>功能标识：</td>
					<td><select id="NODE" name="NODE"><option value="-1">--请选择功能标识--</option><option value="0">--全部--</option><option value="1">--部分--</option></select><font color="#ff0080">*</font></td>
				</tr> -->	
				
				<tr class="ui-widget-content ui-row-ltr">
					<td>功能标识：</td>
					<td><select id="NODE" name="NODE">
						<option value="-1">--请选择功能标识--</option>
						<option value="0">--全部--</option>
						<option value="2">--区域--</option>
						<option value="1">--部分--</option>
					</select><font color="#ff0080">*</font></td>
					<td>所在部门：<font color="#ff0080">*</font></td>
					<td>
						<!-- 如果有需要增加部门，请修改此属性. -->
						<c:set var="dept_div_count" value="10"/>
						<input type="hidden" name="dept_div_count" value="${dept_div_count }">
						<img src="${ctx }/images/u100.gif" alt="新增一个部门" style="cursor: pointer;"
							 onclick="addDept('${dept_div_count }');">
						<c:forEach begin="1" end="${dept_div_count }" varStatus="index">
							<div id="dept_${index.count }" <c:if test="${index.count != 1 }">style="display: none;"</c:if> >
							<select id="decp_id_${index.count }" name="decp_id" onchange="loadCompanyInfo('${index.count }');" style="width: 150px">
								<option value="">--请选择--</option>
								<option value="1">--总公司--</option>
								<option value="2">--分公司--</option>
							</select><font color="#ff0080">*</font>
							<select id="decp_id2_${index.count }" name="decp_id2" onchange="loadDeptInfo('${index.count }');" style="width: 150px">
								<option value="">--请选择--</option>
								<%-- <c:forEach items="${companys}" var="company" varStatus="status">
									<option value="${company.DECP_ID}">${company.DECP_NAME_CN}</option>
								</c:forEach> --%>
							</select><font color="#ff0080">*</font>
							<select id="dept_id_${index.count }" name="dept_id" style="width: 150px">
								<option value="">--请选择--</option>
								<%-- <c:forEach items="${depts}" var="dept" varStatus="status">
									<option value="${dept.ID}">${dept.DEPT_NAME}</option>
								</c:forEach> --%>
							</select><font color="#ff0080">*</font>
							<img src="${ctx }/images/u103.gif" alt="删除这个部门" 
								id="delDept_${index.count}" style="cursor: pointer;"
								onclick="delDept('${index.count}');">
							</div>
						</c:forEach>
						<%-- <c:forEach items="${dept_comps }" var="dept_comp" varStatus="index">
							<script type="text/javascript">
								var dept_id = "${dept_comp.DEPT_ID}";
								var decp_id = "${dept_comp.DECP_ID}";
								var index = "${index.count}";
								$("#dept_" + index).css("display", "block");
								$("select[id=decp_id_" + index + "]").val("2");
								$("select[id=decp_id2_" + index + "]").val(decp_id);
								loadDeptInfo(index);
								isLoaded(index, dept_id);
							</script>
						</c:forEach> --%>
					</td>
				</tr>							
				<tr>
					<td align="center" colspan="4">
						<input type="button" name="subbut" value="提  交" class="ui-state-default ui-corner-all" onclick="addEmployee(${dept_div_count});"><input type="reset" name="res" class="ui-state-default ui-corner-all" value="重  置"></td>
				</tr>
			</table>
		</form>
	</body>
</html>