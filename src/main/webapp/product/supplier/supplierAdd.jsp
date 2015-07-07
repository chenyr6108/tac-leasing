<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加供应商</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript">
	$.ajax({  
				type:"post",
				url:"../../servlet/defaultDispatcher",
				data:"__action=supplier.getMoneyType" ,
				dataType:"json",
				success:function(data) {
					var moneyType1=$("#moneyType1");
					var moneyType2=$("#moneyType2");
					if(data.length > 0) {
						var money_type_option="";
						$.each(data, function(i){
							money_type_option += "<option value=\"" + data[i].CODE + "\">" + data[i].FLAG + "</option>";
						});
						moneyType1.html(money_type_option);
						moneyType2.html(money_type_option);
					}
				}
				
		   });
	

	$.ajax({  
		type:"post",
		url:"../../servlet/defaultDispatcher",
		data:"__action=supplier.getEmployeeList" ,
		dataType:"json",
		success:function(data) {
			var employeeSelect1=$("#FIRST_MAINTAIN_USER_ID");
			var employeeSelect2=$("#SECOND_MAINTAIN_USER_ID");
			if(data.length > 0) {
				var id=$("#s_employeeId").val();
				var employee_option="";
				$.each(data, function(i){
					if(id==data[i].EMPLOYEEID) {
						employee_option+= "<option value=\"" + data[i].EMPLOYEEID + "\" selected='selected'>" + data[i].NAME + "</option>";
					} else {
						employee_option+= "<option value=\"" + data[i].EMPLOYEEID + "\">" + data[i].NAME + "</option>";
					}
				});
				employeeSelect1.html(employee_option);
				employeeSelect2.html(employee_option);
			}
		}
		
   });


	
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
		$.ajax({  
			type:"post",
			url:"../../servlet/defaultDispatcher",
			data:"__action=supplier.getDecp" ,
			dataType:"json",
			success:function(data) {
				if(data && data.length > 0) {
					$.each(data, function(i){
						$("#decp_id").append("<option value=\"" + data[i].DECP_ID + "\">" + data[i].DECP_NAME_CN + "</option>");
					});
				}
			}
			
	   });
} );

function notPositive(field, name) {
        var value = $.trim(field.value);
       if(value.length != 0){
        value = value.replace(/[￥,]/g, '');
        if (!/^\d+(\.\d+)?$/.test(value)) {
            alert(name + '只能输入数字！');
            field.focus();
            return true;
        } else {
            value = '' + parseFloat(value);
            field.value = value
            return false;
        }
       }
    }
    
    function addSupplierDetail(){  

    var form = document.addForm;
    var tname = $.trim($(":input[name='name']").val());
    if (tname.length <2) {
        alert("请填写企业名称！");
        return false;
    }
  	if($("#decp_id").val()==""){
        alert("请选择办事处！");
        return false;
  	}
    if (notPositive(form.Registered_capital, '注册资本')) {
    	        return false;
     }
    
		    
     if (notPositive(form.Income_capital, '实收资本')) {
    	        return false;
     }
     if (notPositive(form.Validity_Period, '有效期')) {
    	        return false;
     }
    var tcc = $.trim($(":input[name='Company_Corporation']").val());
    if (tcc.length <1) {
        alert("请填写法定代表人！")
        return false;
    }
    
      
    
    var tcl = $.trim($(":input[name='Corporation_link']").val());
    if (tcl.length == 0) {
        alert("请填写法人联系方式！")
        return false;
    }
    
    var tbl = $.trim($(":input[name='Business_licence']").val());
    //Marked By Michael 2011 11/22 For 资讯需求单营业执照注册号不为必填项
 // 	if (tbl.length == 0) { 
 //       alert("请填写营业执照注册号！")
 //       return false;
 //   }
 
    var orc = $.trim($(":input[name='Organization_certificate']").val());
    if (orc.length == 0) {
        alert("请填写组织机构代码证！")
        return false;
    }
    if (notPositive(form.buyback_price, '回购金额额度')) {
    	        return false;
     }
     //      tabLength = document.getElementById("visitTable").rows.length ;
//		if(tabLength == 3){
//	   		if($("#imagesVisit").val() == null || $("#imagesVisit").val().trim() == ""){
//	   			alert("图片不能为空!") ;
//	   			$("#imagesVisit").focus();
//	   			return false ;
//	   		}
//   			//判断是否是图片类型
//			if(!checkImageType($("#imagesVisit"))){
//				return false ;
//			}
//	   		if($("#imagesName").val() == null || $("#imagesName").val().trim() == ""){
//	   			alert("图片标题不能为空!");
//	   			$("#imagesName").focus();
//	   			return false ;
//	   		}
//		}else if(tabLength > 3){
//	   		for(var i=0;i<(tabLength-2);i++){
//		   		if($("input[id='imagesVisit']").eq(i) == null || $("input[id='imagesVisit']").eq(i).val().trim() == ""){
//		   			alert("图片不能为空!") ;
//		   			$("input[id='imagesVisit']").eq(i).focus();
//		   			return false ;
//	   			}
//	   			//判断是否是图片类型
//	   			if(!checkImageType($("input[id='imagesVisit']").eq(i))){
//					return false ;
//				}
//		   		if($("input[id='imagesName']").eq(i).val() == null || $("input[id='imagesName']").eq(i).val().trim() == ""){
//		   			alert("图片标题不能为空!");
//		   			$("input[id='imagesName']").eq(i).focus();
//		   			return false ;
//		   		}
//	  	 	}
//	  	 }

	var bank_name =[];
	$('input[name="BANK_NAME"]').each(function(){ 
		  bank_name.push($.trim($(this).val()));   
	});
	var subFlag=true;
	bank_name.push($.trim($("#B_BANK_NAME").val()));
	for (var i=0;i<bank_name.length;i++){
		$.ajax({  
			type:"post",
			url:"../../servlet/defaultDispatcher",
			data:{__action:'backMoney.checkBlackBank',
				BANK_NAME:bank_name[i]} ,
			dataType:"json",
			success: function(dataBack){
				if(dataBack.count>0){
					alert("该开户银行或分行不存在，请再确认！");
					subFlag=false;
				}
			}		
	});
		if(subFlag==false){
			break;
		}
	}
	if (subFlag){
	    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.createSupplier");
	    $("#addForm").submit();
	}
}
function checkImageType(image){
//	var imageName = image.val() ;
//	var imageType = imageName.substring(imageName.lastIndexOf('.')+1,imageName.lenth).toLowerCase(); 
	var imageName = image.val().split("."); 
	var imageType = imageName[1].toLowerCase() ;
	
	if(imageType == "jpg" || imageType == "bmp" || imageType == "gif" || imageType == "png" || imageType == "jpeg") {
		return true ;
	}else {
		alert(imageType + "不是图片类型请重新上传") ;
		image.val("") ;
		image.focus() ;
		return false ;
	}
}
function codeExist(){
	var codnum = $.trim($("#code").val());
	if(!(codnum.length == 0)){
		
		$.ajax({  
					type:"get",
					url:"../../servlet/defaultDispatcher",
					data:"__action=supplier.codeExist&code="+$("#code").val() ,
					dataType:"json",
					success:function(json){
						
						if(json.codeMap.COUNT == 0){
							alert("编号可以使用");
							return true;
						}else{
							alert("编号已被占用，请更换");
							//($("#code").val())="";
							return false;
						}
					}
					
		})
	}
	else{
		return false;
	}
}
function checkSupplierName()
{
	$("#buttonAdd").attr("disabled",true);
	$.ajax({  
		type:"get",
		url:"../../servlet/defaultDispatcher",
		data:"__action=supplier.checkSupplierName&name="+$("#name").val() ,
		dataType:"json",
		success:function(json){
			
			if(json.codeMap.COUNT != 0)
			{
				alert("企业名称已被占用，请更换");
			}
			else
			{
				alert("企业名称可以使用");
				$("#buttonAdd").attr("disabled",false);
			}
		},
		error:function(json){
			alert("企业名称未验证！");
		}
					
		});
		
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




   	var x = 0 ;
	function addCreditVisit(){
		var tab=document.getElementById("visitTable");
		var row=tab.insertRow(tab.rows.length );
		var cell=row.insertCell(0);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='center';
		cell.innerHTML='<input type=\"checkbox\" name=\"visitCheck\" id=\"visitCheck\">';
		cell=row.insertCell(1);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='center';
		cell.colSpan=2;
		cell.innerHTML='<input size=\"86\" type=\"text\" name=\"imagesName'+x+'\" id=\"imagesName\" >';
		cell=row.insertCell(2);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='left';	
		cell.colSpan=2;
		cell.innerHTML='<input class=\"ui-state-default ui-corner-all\" size=\"52\" type=\"file\" name=\"imagesVisit\" id=\"imagesVisit\"/>';
		x++
	}
	
	function deleteCreditVisit(){
		var check=document.getElementsByName("visitCheck");
		for(i=check.length-1;i>=0;i=i-1){
			if(check[i].checked==true){
				var tr=check[i].parentNode.parentNode;
				tr.parentNode.removeChild(tr);
			}
		}
	}
	
	function getAllCellVisit(){
		var checkalls=document.getElementById("visitChecks");
		var checks=document.getElementsByName("visitCheck");
		for(i=checks.length-1;i>=0;i=i-1){
			if(checkalls.checked==true){	
				checks[i].checked=true;	
			}else if(checkalls.checked==false){
				checks[i].checked=false;
			}
		}
	}
</script>
<body>
<table width="982" align="center">
				<tr>
					<td>
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.createSupplier" method="post" id="addForm" name="addForm" >
	<input type="hidden" value="<%=request.getParameter("isSalesDesk")%>" name="isSalesDesk">
	<input type="hidden" name="supl_id" id="supl_id" value="">
	<input type="hidden" name="id" value="${employee.ID }">
	<input type="hidden" id="s_employeeId" value="<%=request.getSession().getAttribute("s_employeeId")%>">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;增加供应商(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>企业名称<font color='red'>*</font></td>
			<td colspan="4"><input type="text" name="name" id="name" onBlur="checkSupplierName()" size="50"/></td>
		</tr>
		<tr  class="ui-widget-content jqgrow ui-row-ltr">
			<td>办事处 </td>
			<td colspan="4">
				<select id="decp_id" name="decp_id" style="width: 130px">
					<option value="">--请选择--</option>
				</select>
			</td>	
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>企业性质 </td>
			<td colspan="4"><select name="Type" style="width: 130px">
							<option value="3">其他供应商</option>
							<option value="1">厂商</option>
							<option value="2">代理商</option>
							</select></td>	
		</tr>
		
		<tr>
			<td colspan="5" style="width:130px;">供应商型别<select name="supp_type">
					<option value="0">非大型供应商</option>
					<option value="1">大型供应商</option>
					</select><br>
			供应商类别<select name="SUPP_MODEL">
					<option value="0">一般设备</option>
					<option value="1">重车</option>
					<option value="2">其他</option>
				</select><br>	
			供应商级别	
			<select name="SUPP_LEVEL">
					<option value=""></option>
					<option value="A">A</option>
					<option value="2">2A</option>
					<option value="3A">3A</option>
					<option value="4A">4A</option>
					<option value="5A">5A</option>
				</select>
			</td> 
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">专<br>案<br>条<br>件</div></td>
			<td colspan="4">全面回购:&nbsp;&nbsp;<input type="radio" name="BUY_BACK" value="Y" checked="checked">是<input type="radio" name="BUY_BACK" value="N">否</td>
			
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="4">网银汇款:&nbsp;&nbsp;<input type="radio" name="NET_PAY" value="Y">可<input type="radio" name="NET_PAY" value="N" checked="checked">不可</td>
		</tr>
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>成立日期</td>
			<td colspan="4"><input type="text" value="" size="10" id="Founded_date" name="Founded_date" readonly="readonly">    </td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="3%" rowspan="8" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">企<br>业<br>基<br>本<br>信<br>息</div></td>
			<td>注册资本(万) </td>
			<td><input type="text" name="Registered_capital" id="Registered_capital"  />&nbsp;&nbsp;&nbsp;<select id="moneyType1" name="moneyType1"></select>&nbsp;&nbsp;&nbsp;</td>
			<td>实收资本(万) </td>
			<td><input type="text" name="Income_capital" id="Income_capital" >&nbsp;&nbsp;&nbsp;<select id="moneyType2" name="moneyType2"></select>&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr id="6" class="ui-widget-content jqgrow ui-row-ltr">
			<td>营业执照注册号</td>
			<td><input type="text" name="Business_licence"/></td>
			<td>组织机构代码号 <font color='red'>*</font></td>
			<td><input type="text" name="Organization_certificate" /></td>
		</tr>
		<tr id="7" class="ui-widget-content jqgrow ui-row-ltr">
			<td>税务登记号 </td>
			<td><input type="text" name="Tex_code"/></td>
			<td>有效期(年) </td>
			<td><input type="text" name="Validity_Period"/></td>
		</tr>
	  <tr id="8" class="ui-widget-content jqgrow ui-row-ltr">
			<td>注册地址</td>
			<td><input type="text" name="Licence_address"/></td>
			<td>通讯地址</td>
			<td><input type="text" name="Work_address" size="40"/></td>
		</tr>
		<tr id="12" class="ui-widget-content jqgrow ui-row-ltr">
			<td>公司网址</td>
			<td><input type="text" name="Company_Web" size="40"/></td>
			<td>交机前拨款额度 </td>
			<td><input type="hidden" value="" name="Credit_type"/><!-- 			<select name="Credit_type">
					<option value="3">低</option>
					<option value="2">中</option>
					<option value="1">高</option>
				</select> -->&nbsp;</td>
		</tr>
		<tr id="18" class="ui-widget-content jqgrow ui-row-ltr">
			<td> <!-- 回购金额额度 --> </td>
			<td colspan="3"><input type="hidden" name="buyback_price" readonly='readonly'/></td> 
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>经营范围</td>
			<td colspan="3"><textarea name="Business_scope" rows="3" cols="100" style="width:600px; height:35px;"></textarea></td>
		</tr>
		<tr id="14" class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注</td>
			<td colspan="3"><textarea name="memo" rows="3" cols="100" style="width:600px; height:35px;"></textarea></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="3%" rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">法<br>人</div></td>
			<td>法定代表人<font color='red'>*</font></td>          
			<td><input type="text" name="Company_Corporation"/></td>
			<td>法人身份证号码 </td>
			<td><input type="text" name="Corporation_id_card"/></td>
		</tr>
		<tr id="5" class="ui-widget-content jqgrow ui-row-ltr">
			<td>法人联系方式<font color='red'>*</font></td>
			<td><input type="text" name="Corporation_link"/></td>
			<td>法人代表住址</td>
			<td><input type="text" name="Corporation_address" size="40"/></td>
		</tr>
		<tr id="9" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="3%" rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">联<br>系<br>人</div></td>
			<td>联系人</td>
			<td><input type="text" name="Linkman_name"/></td>
			<td>职务</td>
			<td><input type="text" name="Linkman_job"/></td>
		</tr>
	   <tr id="10" class="ui-widget-content jqgrow ui-row-ltr">
			<td>办公电话</td>
			<td><input type="text" name="Linkman_telphone"/></td>
			<td>Email</td>
			<td><input type="text" name="LINKMAN_EMAIL"/></td>
		</tr>
		<tr id="11" class="ui-widget-content jqgrow ui-row-ltr">
			<td>邮编</td>
			<td><input type="text" name="Linkman_zip"/></td>
			<td>手机</td>
			<td><input type="text" name="Linkman_mobile"/></td>
		</tr>
		<tr id="12" class="ui-widget-content jqgrow ui-row-ltr">
			<td>传真</td>
			<td><input type="text" name="LINKMAN_FAX"/></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
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
				<!-- 
				<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr"><table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="visitTable">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left" width="75.5%" colspan="3"><strong>上传图片</strong></td>
			<td class="ui-state-default ui-th-ltr zc_grid_head"  align="right" colspan="1">相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="javaScript:void(0);" onclick="addCreditVisit();">添加</a></td>
			<td class="ui-state-default ui-th-ltr zc_grid_head"><img src="${ctx }/images/u103.gif"><a href="javaScript:void(0);" onclick="deleteCreditVisit();">删除&nbsp;</a></td>
		</tr>
		<tr>
			<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head">
				<input type="checkbox" name="" id="visitChecks" onclick="getAllCellVisit() ;" >
			</th>
			<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
				图片名称
			</th>
			<th width="17%" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
				附件
			</th>
		</tr></table></td></tr>
		 -->
		<!-- <tr>
			<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;第一维护人:<select id="FIRST_MAINTAIN_USER_ID" name="FIRST_MAINTAIN_USER_ID"></select>&nbsp;&nbsp;第二维护人:<select id="SECOND_MAINTAIN_USER_ID" name="SECOND_MAINTAIN_USER_ID"></select></td>
		</tr>-->
		<tr>
			<td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head"><div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onClick="addSupplierDetail()" disabled="disabled"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onClick="javascript:history.go(-1);"></input></div></td>
		</tr> 
	</table>
	</div>
	</div>
	</div>
</form>
</td>
</tr>
</table>
</body>
</html>