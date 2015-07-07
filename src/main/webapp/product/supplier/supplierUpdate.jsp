<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改供应商</title>
		<%@ include file="/common/import.jsp"%>
	</head>
	<script type="text/javascript"> 
$(function() {
	//添加选项卡
	$("#tabs").tabs();
});
</script> 
	<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
	})
	function notPositive(field, name) {
        var value = $.trim(field.value);
        value = value.replace(/[￥,]/g, '');
        if(value.length != 0){
	        if (!/^\d+(\.\d+)?$/.test(value)) {
	            alert(name + '只能输入数字！');
	            field.focus();
	            return true;
	        } else {
	            value = '' + parseFloat(value);
	            field.value = value;
	            return false;
	        }
    	}
    }
    
	update = function(id){
	var form = document.updateForm;
    var tname = $.trim($(":input[name='name']").val());
    if (tname.length <2) {
        alert("请填写企业名称！")
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
   //Marked By Michael 2011 11/22 For 资讯需求单 营业执照注册号不为必填项
//    if (tbl.length == 0) {
   //     alert("请填写营业执照注册号！")
 //       return false;
//    }
     var orc = $.trim($(":input[name='Organization_certificate']").val());
    if (orc.length == 0) {
        alert("请填写组织机构代码证！")
        return false;
    }
  //   if (notPositive(form.buyback_price, '回购金额额度')) {
    //	        return false;
   //  }
    //$("#updateForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.updateSupplier");
    //$("#supplier_id").val(id);
    
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
    	$("#updateForm").submit();
	}
}
function codeEx(){
	var codnum = $.trim($("#code").val());
	if(!(codnum.length == 0)){
		
		$.ajax({  
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=supplier.codeExist&code="+$("#code").val() ,
					dataType:"json",
					success:function(json){
						
						if(json.codeMap.COUNT == 0){
							alert("编号未被使用");
							return true;
						}else{
							alert("编号已被使用");
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

function gotoGH(id){
	window.parent.openNewTab("${ctx }","applyCompanyManage.getCreditLineForSupplier&id=" + id, "供应商归户");
}
	</script>
	<style type="text/css">
		th{
			text-align: right!important;
		}
	</style>
	<body>
	<table width="982" align="center">
				<tr>
					<td>
		<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.updateSupplier"
			method="post" id="updateForm" name="updateForm" >
			<input type="hidden" name="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="supplier_id" id="supplier_id" value="${rs.ID}"/>
			<input type="hidden" name="id" value="${rs.ID}" />
			<input type="hidden" name="supl_id" value="${rs.ID}" />
			<input type="hidden" name="suppl_id" id="suppl_id" value="${rs.ID }"></input>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改供应商信息(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    		<div class="zc_grid_body jqgrowleft">
   			 <div class="ui-state-default ui-jqgrid-hdiv ">
			<table class="panel_table">
				<tr id="1">
					<th style="width: 10%">企业名称：<font color='red'>*</font></th>
					<td colspan="4"><input type="text" name="name" value="${rs.NAME}" size="50" <c:if test="${count > 0}">readonly='readonly'</c:if> /></td>
				</tr>
				<tr id="2">
					<th>办事处： </th>
					<td  colspan="4">
						${rs.DECP_NAME_CN}
					</td>
				</tr>
				<tr id="2">
					<th>企业性质 ：</th>
					<td  colspan="4">
						<select name="Type" style="width: 130px">
							<option value="1"<c:if test="${rs.TYPE eq 1}">selected="selected"</c:if>>厂商</option>
							<option value="2"<c:if test="${rs.TYPE eq 2}">selected="selected"</c:if>>代理商</option>
							<option value="3"<c:if test="${rs.TYPE eq 3}">selected="selected"</c:if>>其他供应商</option>
						</select>
					</td>
				</tr>
				<tr id="18">
					<th>供应商类型：</th>
					<td colspan="4">
						<select name="supp_type">
							<option value="1"<c:if test="${rs.SUPP_TYPE eq 1}">selected="selected"</c:if>>大型供应商</option>
							<option value="0"<c:if test="${rs.SUPP_TYPE eq 0}">selected="selected"</c:if>>非大型供应商</option>
						</select>
					</td>
				</tr>
				<tr id="18">
					<th>供应商类别：</th> 
					<td colspan="4">
						<select name="SUPP_MODEL">
							<option value="0"<c:if test="${rs.SUPP_MODEL == 0}">selected="selected"</c:if>>一般设备</option>
							<option value="1"<c:if test="${rs.SUPP_MODEL == 1}">selected="selected"</c:if>>重车</option>
							<option value="2"<c:if test="${rs.SUPP_MODEL == 2}">selected="selected"</c:if>>其他</option>
						</select>
					</td>
				</tr>
				<tr id="18">
					<th>供应商级别：</th> 
					<td colspan="4">
						<select name="SUPP_LEVEL">
							<option value=""></option>
							<option value="A"<c:if test="${rs.SUPP_LEVEL eq 'A'}">selected="selected"</c:if>>A</option>
							<option value="2A"<c:if test="${rs.SUPP_LEVEL eq '2A'}">selected="selected"</c:if>>2A</option>
							<option value="3A"<c:if test="${rs.SUPP_LEVEL eq '3A'}">selected="selected"</c:if>>3A</option>
							<option value="4A"<c:if test="${rs.SUPP_LEVEL eq '4A'}">selected="selected"</c:if>>4A</option>
							<option value="5A"<c:if test="${rs.SUPP_LEVEL eq '5A'}">selected="selected"</c:if>>5A</option>
						</select>
					</td>
				</tr>
				<tr>
				<th rowspan="2"><div align="center">专<br>案<br>条<br>件</div></th>
				<td colspan="4">全面回购:&nbsp;&nbsp;<input type="radio" name="BUY_BACK" <c:if test="${rs.BUY_BACK eq 'Y' }">checked="checked"</c:if> value="Y">是<input type="radio" name="BUY_BACK" <c:if test="${rs.BUY_BACK eq 'N' }">checked="checked"</c:if> value="N">否</td>
				</tr>
				<tr>
				<td colspan="4">网银汇款:&nbsp;&nbsp;<input type="radio" name="NET_PAY" <c:if test="${rs.NET_PAY eq 'Y' }">checked="checked"</c:if> value="Y">可<input type="radio" name="NET_PAY" <c:if test="${rs.NET_PAY eq 'N' }">checked="checked"</c:if> value="N">不可</td>
				</tr>
				<tr id="1">
					<th>成立日期：  </th>
					<td  colspan="4"><input readonly="readonly" type="text" value="<fmt:formatDate value="${rs.FOUNDED_DATE}"  pattern="yyyy-MM-dd"/>" size="10" id="Founded_date" name="Founded_date" ></td>
				</tr>
				<tr id="3">
					<th width="3%" rowspan="7"><div align="center">企<br>业<br>基<br>本<br>信<br>息</div></th>
					<th style="width: 15%">注册资本(万)： </th>
					<td style="width: 30%"><input id="Registered_capital" type="text" name="Registered_capital" value="${rs.REGISTERED_CAPITAL }" />&nbsp;&nbsp;&nbsp;<select name="moneyType1"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.REGISTERED_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
					<th style="width: 15%">实收资本(万)： </th>
					<td style="width: 30%"><input id="Income_capital" type="text" name="Income_capital" value="${rs.INCOME_CAPITAL }" />&nbsp;&nbsp;&nbsp;<select name="moneyType2"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.INCOME_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr id="6">
					<th>营业执照注册号：</th>  <!--   Marked By Michael 2011 11/22 For 资讯需求单 营业执照注册号不为必填项-->
					<td><input type="text" name="Business_licence"value="${rs.BUSINESS_LICENCE }" /></td>
					<th>组织机构代码号：<font color='red'>*</font></th>
					<td><input type="text" name="Organization_certificate" value="${rs.ORGANIZATION_CERTIFICATE }" /></td>
				</tr>
				<tr id="7">
					<th>税务登记号 ：</th>
					<td><input type="text" name="Tex_code" value="${rs.TEX_CODE }" /></td>
					<th>有效期(年)： </th>
					<td><input type="text" name="Validity_Period" value="${rs.VALIDITY_PERIOD }" /></td>
				</tr>
				<tr id="8">
					<th>注册地址：</th>
					<td><input type="text" name="Licence_address" value="${rs.LICENCE_ADDRESS }" size="40"/></td>
					<th>通讯地址：</th>
					<td><input type="text" name="Work_address" value="${rs.WORK_ADDRESS }"  size="40"/></td>
				</tr>
				<tr id="12">
					<th>公司网址：</th>
					<td colspan="4"><input type="text" name="Company_Web" value="${rs.COMPANY_WEB }" /></td>
				</tr>
				<tr id="2">
					<th>经营范围：</th>
					<td colspan="4"><textarea name="Business_scope" id="Business_scope" style="width:600px; height:35px;">${rs.BUSINESS_SCOPE }</textarea></td>
				</tr>
				<tr id="14">
					<th>备注：</th>
					<td colspan="4"><textarea name="memo" id="memo" style="width:600px; height:35px;">${rs.MEMO }</textarea></td>
				</tr>
				
				<tr>
					<th>
						<div align="center">授<br>信<br><br>
							<a href="javascript:void(0);" class="panel_a" onclick="gotoGH('${rs.ID}');" style="color: blue;">[归户]<a>
						</div>
					</th>
					<td colspan="4">
						<table class="panel_table">
							<tr>
								<th style="text-align: center!important;">类型</th>
								<th style="text-align: center!important;">是否循环</th>
								<th style="text-align: center!important;">有效期</th>
								<th style="text-align: center!important;">额度</th>
								<th style="text-align: center!important;">已用额度</th>
								<th style="text-align: center!important;">剩余额度</th>
							</tr>
							<c:forEach items="${creditLine }" var="i">
								<tr>
									<td style="text-align: center;">${i.lineName }</td>
									<td style="text-align: center;">${i.repeatFlag == 1 ? '是' : '否' }</td>
									<td style="text-align: center;">${i.startDate } ~ ${i.endDate }</td>
									<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.line }"/></td>
									<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.realUsedLine }"/></td>
									<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${i.lastLine }"/></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				
				<tr id="4">
					<th width="3%" rowspan="2"><div align="center">法<br>人</div></th>
					<th>法定代表人：<font color='red'>*</font></th>
					<td><%-- <input type="text" name="Company_Corporation" value="${rs.COMPANY_CORPORATION }" <c:if test="${count > 0}">readonly="readonly"</c:if>/> 现在不需要判断add by ShenQi--%><input type="text" name="Company_Corporation" value="${rs.COMPANY_CORPORATION }" /></td>
					<th>法人身份证号码 ：</th>
					<td><input type="text" name="Corporation_id_card" value="${rs.CORPORATION_ID_CARD }" /></td>
				</tr>
				<tr id="5">
					<th>法人联系方式：<font color='red'>*</font></th>
					<td><input type="text" name="Corporation_link" value="${rs.CORPORATION_LINK }" /></td>
					<th>法人代表住址：</th>
					<td><input type="text" name="Corporation_address" value="${rs.CORPORATION_ADDRESS }" size="40"/></td>
				</tr>
				<tr id="9">
					<th width="3%" rowspan="4"><div align="center">联<br>系<br>人</div></th>
					<th>联系人：<font color='red'>*</font></th>
					<td><input type="text" name="Linkman_name" value="${rs.LINKMAN_NAME }" /></td>
					<th>职务：</th>
					<td><input type="text" name="Linkman_job" value="${rs.LINKMAN_JOB }" /></td>
				</tr>
				<tr id="10">
					<th>办公电话：</th>
					<td><input type="text" name="Linkman_telphone" value="${rs.LINKMAN_TELPHONE }" /></td>
					<th>Email：</th>
					<td><input type="text" name="LINKMAN_EMAIL" value="${rs.LINKMAN_EMAIL }" /></td>
				</tr>
				<tr id="11">
					<th>邮编：</th>
					<td><input type="text" name="Linkman_zip" value="${rs.LINKMAN_ZIP }" /></td>
					<th>手机：</th>
					<td><input type="text" name="Linkman_mobile" value="${rs.LINKMAN_MOBILE }" /></td>
				</tr>
				<tr id="12">
					<th>传真：</th>
					<td><input type="text" name="LINKMAN_FAX" value="${rs.LINKMAN_FAX }" /></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>				
				
				<tr>
								<th colspan="3"><strong>开户银行</strong></th>
								<td width="18%">相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="javascript:void(0)" onClick="addBank();">添加</a></td>
								<td width="9%"><img src="${ctx }/images/u103.gif">&nbsp;<a href="javascript:void(0)" onClick="deleteBank();">删除</a></td>
							</tr>
							<tr id="13">
				<td colspan="5"><table id="bankTab" class="panel_table">
							<c:if test="${empty suplBankAccount}">
								<tr>
									<th width="13%" >基本账户<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID" style="width: 150px;"></th>
									<th width="10%" >开户银行：</th>
									<td width="27%" ><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;"></td>
									<th width="11%" >账号：</th>
									<td ><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;"></td>
								</tr>
							</c:if>
							<c:if test="${not empty suplBankAccount}">
								<c:forEach items="${suplBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr>
											<th width="13%" >基本账户<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID" style="width: 150px;" value="${item.PCCBA_ID }"></th>
											<th width="10%" >开户银行：</th>
											<td width="27%" ><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;" value="${item.BANK_NAME }"></td>
											<th width="11%" >账号：</th>
											<td ><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(suplBankAccount) >1}">
								<tr>
									<th   rowspan="${fn:length(suplBankAccount)}" id="bankTd" style="text-align: left">其他账户</th>
								</tr>
							</c:if>
							<c:forEach items="${suplBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<th ><input type="checkbox" name="check_id" id="check_id">开户银行：</th>
										<td ><input type="text" name="BANK_NAME" style="width: 150px;" value="${item.BANK_NAME }"></td>
										<th >账号：</th>
										<td  ><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
				</tr>
				<tr>
				<td colspan="5" style="text-align: center;"><input type="button" class="ui-state-default ui-corner-all" value="更新" onClick="update('${rs.ID}')"></input><input type="reset" class="ui-state-default ui-corner-all" value="返回" onClick="javascript:history.go(-1);"></input></td>
				</tr>
			</table>
			</div>
			</div>
			</div>
		</form>
		</td>
				</tr>
			</table>
<div id="tabs">
<ul>
	<li style="width: 100px;text-align: center;"><a href="#tabs-1" >联系人</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-2" >联系记录</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-3" >案件状况</a></li>
	<li style="width: 100px;text-align: center;"><a href="#tabs-4" >操作日志</a></li>
</ul>
	<div id="tabs-1">
       <%@ include file="supplLinkMan.jsp"%>
	</div>
	<div id="tabs-2">
		 <%@ include file="supplLinkRecord.jsp"%>
	</div>				
	<div id="tabs-3">
		 <%@ include file="readSupplLinkCredit.jsp"%>
	</div>							
	<div id="tabs-4">
		 <%@ include file="querySupplOperLogs.jsp"%>
	</div>		
</div>	
	</body>
</html>