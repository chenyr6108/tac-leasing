<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>	
<script src="${ctx }/product/supplier/js/supplLinkMan.js" type="text/javascript"></script>	
<script type="text/javascript">
<!--
var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		link_idcard: new IdCard('link_idcards'),
	};
});

//读取联系人List
function drawGridPanel(dataBack){
	var html = "";
	var status = null;
	var linkManType = null;
	var processBut = "";
	if(dataBack!=null && dataBack.supplLinkman!=null){
			for(var i=0;i<dataBack.supplLinkman.length;i++){
				processBut = "";
				if(dataBack.supplLinkman[i].STATUS == 0){}
				status = dataBack.supplLinkman[i].STATUS == 0 ? '启用' : '作废';
				if(dataBack.supplLinkman[i].LINK_TYPE == 0){
					linkManType = "主要联系人";
				} else {
					linkManType = "联系人";
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"setDefault('"+dataBack.supplLinkman[i].CULM_ID+"');\">设为主要</a> | ";
				}
				if(dataBack.supplLinkman[i].STATUS == 0){
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"disabledSupplLinkMan('"+dataBack.supplLinkman[i].CULM_ID+"');\">作废</a> | ";
				} else {
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"abledSupplLinkMan('"+dataBack.supplLinkman[i].CULM_ID+"');\">启用</a> | ";
				}
				html=html+"<tr id=\"SupplLinkman_"+dataBack.supplLinkman[i].CULM_ID+"\"><td  class='ui-widget-content jqgrow ui-row-ltr'><span id=\"supplLinkmanIndex\">"+(i+1)+"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>"
					 +(dataBack.supplLinkman[i].LINK_NAME == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_NAME)+"   </td>"
					 +"<td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.supplLinkman[i].LINK_GENDER == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_GENDER)+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>"+(dataBack.supplLinkman[i].LINK_RELATION2CUST == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_RELATION2CUST)
					 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.supplLinkman[i].LINK_MOBILE == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_MOBILE)
					 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.supplLinkman[i].LINK_PHONE == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_PHONE)
					 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.supplLinkman[i].LINK_EMAIL == null ? '&nbsp;' : dataBack.supplLinkman[i].LINK_EMAIL)
					 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>" + linkManType + "</td><td class='ui-widget-content jqgrow ui-row-ltr'>    <span id=\"supplLinkman_status_"+dataBack.supplLinkman[i].CULM_ID+"\">"+status
					 +"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>   <span  id=\"custLinkman_opteration_"+dataBack.supplLinkman[i].CULM_ID +"\">"+processBut+"</span>"
					 +"<a href=\"javascript:void(0)\" onclick=\"showDivShowSupplLinkMan('"+dataBack.supplLinkman[i].CULM_ID+"');\">查看</a> | <a href=\"javascript:void(0)\" onclick=\"showDivUpdateSupplLinkMan('"+dataBack.supplLinkman[i].CULM_ID+"');\">修改</a></td></tr>";
    	}
    }
	return html;
}

//显示修改联系人的弹出层
function showDivUpdateSupplLinkMan(culm_id) {
	$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=supplier.showSupplLinkManById&culm_id="+culm_id,
			dataType:"json",
			success:function(dataBack){
			$("#culm_id_u").val(dataBack.culm.CULM_ID);
			$("#link_name_u").val(dataBack.culm.LINK_NAME);
			$("input[name='link_gender_u']").val([dataBack.culm.LINK_GENDER]);
			$("#link_relation2cust_u").val(dataBack.culm.LINK_RELATION2CUST);
			$("#link_idcardAge_u").val(dataBack.culm.LINK_AGE);
			$("#link_mobile_u").val(dataBack.culm.LINK_MOBILE);
			$("#link_phone_u").val(dataBack.culm.LINK_PHONE);
			$("#link_idcard_u").val(dataBack.culm.LINK_IDCARD);
			$("#link_zip_u").val(dataBack.culm.LINK_ZIP);
			$("#link_email_u").val(dataBack.culm.LINK_EMAIL);
			$("#link_idcardAddr_u").val(dataBack.culm.LINK_IDCARD_ADDRESS);
			$("#link_home_address_u").val(dataBack.culm.LINK_HOME_ADDRESS);
			$("#link_work_units_u").val(dataBack.culm.LINK_WORK_UNITS);
			$("#link_work_address_u").val(dataBack.culm.LINK_WORK_ADDRESS);
			$("#link_duty_u").val(dataBack.culm.LINK_DUTY);
			$("#province_id_u").val(dataBack.culm.PROVINCE_ID);
			$("#city_id_u").val(dataBack.culm.CITY_ID);
			$("#area_id_u").val(dataBack.culm.AREA_ID);
			
			$('#divUpdateSupplLinkman').dialog({
				modal:true,
				autoOpen: false	,
				width:660,
			});
			$('#divUpdateSupplLinkman').dialog('open');
	    },
	});	
}
//新增联系人
function submitAddSupplLinkman(){
	var suppl_id = $.trim($("#suppl_id").val());
	var link_name = $.trim($("#link_name").val());
	var link_relation2cust = $.trim($("#link_relation2cust").val());
	var link_gender = $.trim($("input[name='link_gender']:checked").val());
	var link_age = $.trim($("#link_idcardAge").val());
	var link_mobile = $.trim($("#link_mobile").val());
	var link_phone = $.trim($("#link_phone").val());
	var link_idcard = $.trim($("#link_idcards").val());
	var link_zip = $.trim($("#link_zip").val());
	var link_idcard_address = $.trim($("#link_idcardAddr").val());
	var link_home_address = $.trim($("#link_home_address").val());
	var link_work_units = $.trim($("#link_work_units").val());
	var link_duty = $.trim($("#link_duty").val());
	var link_work_address = $.trim($("#link_work_address").val());
	var link_email=$.trim($("#link_email").val());
	var province_id=$.trim($("#province_id").val());
	var city_id=$.trim($("#city_id").val());
	var area_id=$.trim($("#area_id").val());
	
	if (link_name == ''){
		alert("请输入联系人的名字！");
		return ;
	}
	if (link_relation2cust == ''){
		alert("请输入联系人与承租人的关系！");
		return ;
	}
	if (link_mobile.length <11 ){
		alert("请输入正确的联系人的手机");
		return ;
	}
	if (link_mobile.length >11 ){
		alert("请输入正确的联系人的手机");
		return ;
	}
	if(link_work_address == ''){
		alert("请输入邮寄地址！");
		return;
	}
	$("#divAddSupplLinkman").css("z-index",0);
	$("#closeSupplLinkmanButs").click();
	var param = {"suppl_id":suppl_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"link_email":link_email,
		"province_id":province_id,
		"city_id":city_id,
		"area_id":area_id,
		"__action":"supplier.createSupplLinkMan"
	};
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			if(callback!=null && callback.supplLinkman!=null){
				$("#divSupplLinkman").html(drawGridPanel(callback));
				alert("操作已成功！");
				return;
			}else{
				alert("网络错误，请稍后重试或联系系统管理员！");
				return ;
			}		
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			showDivAddSupplLinkMan();
			return ;
		}
	});
}

//设置成主要联系人
function setDefault(culm_id){
	if (confirm("确定要将次联系人设为主要联系人吗？")){
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"suppl_id":$.trim($("#suppl_id").val()),"__action":"supplier.setDefaultLinkMan"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if(callback!=null && callback.supplLinkman!=null){
					$("#divSupplLinkman").html(drawGridPanel(callback));
					alert("操作已成功！");
					return;
				}else{
					alert("网络错误，请稍后重试或联系系统管理员！");
					return ;
				}				
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				return ;
			}
		});
	}
}

//作废联系人
function disabledSupplLinkMan(culm_id){
	var msg = "您确定要作废此供应商的联系人的联系方式吗？";
	if (confirm(msg)){
		//showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"1","suppl_id":$.trim($("#suppl_id").val()),"__action":"supplier.operteSuplLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					$("#divSupplLinkman").html(drawGridPanel(callback));
					alert("操作已成功！");
					//hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					//hideoverlayer();
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				$("#closeCustLinkmanBut").click();
				return ;
			}
		});
	}
}
//启用联系人
function abledSupplLinkMan(culm_id){
	var msg = "您确定要启用此供应商的联系人的联系方式吗？";
	if (confirm(msg)){
		//showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"0","suppl_id":$.trim($("#suppl_id").val()),"__action":"supplier.operteSuplLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					$("#divSupplLinkman").html(drawGridPanel(callback));
					alert("操作已成功！");
					//hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					//hideoverlayer();
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				$("#closeSupplLinkmanBut").click();
				return ;
			}
		});
	}
}

</script>	
<form id="supplLinkManForm" name="supplLinkManForm" method="POST"
	action="#">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels"> 
				<th colspan="10" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					供应商联系人的联系方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					相关操作：<a href="javascript:void(0)" onclick="showDivAddSupplLinkMan();"><img alt="添加" src="${ctx }/images/u100.gif">添加</a>
				</th>
			</tr>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人名称
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					姓别
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					与供应商关系
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人手机
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人固话
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人Email
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人类型
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					状态
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					创建人
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					修改时间
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</td>
			</tr>
</thead>
<tbody id="divSupplLinkman">
<c:forEach items="${supplLinkman}" var="item" varStatus="status">
<tr id="supplLinkman_${item.CULM_ID }" class="ui-widget-content jqgrow ui-row-ltr">
				<td><span id="custLinkmanIndex">${status.count }</span></td>
				<td>${item.LINK_NAME }    &nbsp;  </td>
				<td>${item.LINK_GENDER }    &nbsp;  </td>
				<td>${item.LINK_RELATION2CUST }   &nbsp;   </td>
				<td>${item.LINK_MOBILE }    &nbsp;   </td>
				<td>${item.LINK_PHONE }   &nbsp;   </td>
				<td>${item.LINK_EMAIL }    &nbsp;   </td>
				<td><c:if test="${item.LINK_TYPE eq 0 }">主要联系人</c:if><c:if test="${item.LINK_TYPE eq 1 }">联系人</c:if> &nbsp;   </td>
				<td><span id="custLinkman_status_${item.CULM_ID }"><c:if test="${item.STATUS eq 0 }">启用</c:if><c:if test="${item.STATUS eq 1 }">作废</c:if></span></td>
				<td>${item.NAME}    &nbsp;   </td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss " type="both" value="${item.MODIFY_TIME}"/>   &nbsp;   </td>
				<td><span id="custLinkman_opteration_${item.CULM_ID }"><c:if test="${item.LINK_TYPE eq 1}"><a href="javascript:void(0)" onclick="setDefault('${item.CULM_ID }');">设为主要</a> | </c:if><c:if test="${item.STATUS ne 1 }"><a href="javascript:void(0)" onclick="disabledSupplLinkMan('${item.CULM_ID }');">作废</a> | </c:if><c:if test="${item.STATUS ne 0 }"><a href="javascript:void(0)" onclick="abledSupplLinkMan('${item.CULM_ID }');">启用</a> | </c:if></span><a href="javascript:void(0)" onclick="showDivShowSupplLinkMan('${item.CULM_ID }');">查看</a> | <a href="javascript:void(0)" onclick="showDivUpdateSupplLinkMan('${item.CULM_ID }');">修改</a></td>
			</tr>
</c:forEach>
	
</tbody>
		<tfoot>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td  colspan="8" align="center">
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="divAddSupplLinkman" style="display: none" title="添加联系人">
	<form action="#" method="post" id="divAddSupplLinkmanForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>名称<font color="red">*</font></td>
						<td><input type="text" name="link_name" id="link_name"></td>
						<td>与供应商关系<font color="red">*</font></td>
						<td><input type="text" name="link_relation2cust" id="link_relation2cust"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>职位</td>
						<td colspan="3"><input type="text" name="link_duty" id="link_duty"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人所在省市</td>
					<td colspan="3"><select id="province_id" name="province_id" onchange="getCitys();">
					 	<option value="-1">-请选择省份-</option>
					 	<c:forEach items="${provinces}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach></select><select id="city_id" name="city_id" onchange="getArea();">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${citys}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select><select id="area_id" name="area_id">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${areas}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><input type="radio" name="link_gender" value="男" checked="checked">男<input type="radio" name="link_gender" value="女">女</td>
						<td>年龄</td>
						<td><input type="text" name="link_age" id="link_idcardAge"></td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机<font color="red">*</font></td>
						<td><input type="text" name="link_mobile" id="link_mobile"><font color="red">(手机为必填项)</font></td>
						<td>固话</td>
						<td><input type="text" name="link_phone" id="link_phone"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证</td>
						<td><input type="text" name="link_idcard" id="link_idcards"></td>
						<td>邮编</td>
						<td><input type="text" name="link_zip" id="link_zip"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>Email</td>
						<td colspan="3"><input type="text" name="link_email" id="link_email" size="50"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证地址</td>
						<td colspan="3"><input type="text" name="link_idcard_address" id="link_idcardAddr" size="50"></td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>家庭地址</td>
						<td colspan="3"><input type="text" name="link_home_address"  id="link_home_address" size="50"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td colspan="3"><input type="text" name="link_work_units" id="link_work_units" size="50"> </td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="link_work_address" id="link_work_address" size="50"></td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="button" value="保存" class="ui-state-default ui-corner-all"
											onclick="submitAddSupplLinkman()">
								<input type="reset" id="closeSupplLinkmanButs" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divAddSupplLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>

<div id="divUpdateSupplLinkman" style="display: none" title="修改联系人">
	<form action="#" method="post" id="divUpdateSupplLinkmanForm">
	<input type="hidden" name="culm_id_u" id="culm_id_u" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>名称<font color="red">*</font></td>
						<td><input type="text" name="link_name_u" id="link_name_u"></td>
						<td>与供应商关系<font color="red">*</font></td>
						<td><input type="text" name="link_relation2cust" id="link_relation2cust_u"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>职位</td>
						<td colspan="3"><input type="text" name="link_duty" id="link_duty_u"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人所在省市</td>
					<td colspan="3"><select id="province_id_u" name="province_id_u" onchange="getCitys_u();">
					 	<option value="-1">-请选择省份-</option>
					 	<c:forEach items="${provinces}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach></select><select id="city_id_u" name="city_id_u" onchange="getArea_u();">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${citys}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select><select id="area_id_u" name="area_id_u">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${areas}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><input type="radio" name="link_gender_u" value="男" checked="checked" id="link_gender_m">男<input type="radio" name="link_gender_u" value="女" id="link_gender_w">女</td>
						<td>年龄</td>
						<td><input type="text" name="link_age" id="link_idcardAge_u"></td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机<font color="red">*</font></td>
						<td><input type="text" name="link_mobile" id="link_mobile_u"><font color="red">(手机为必填项)</font></td>
						<td>固话 </td>
						<td><input type="text" name="link_phone" id="link_phone_u"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证</td>
						<td><input type="text" id="link_idcard_u" name="link_idcard_u"></td>
						<td>邮编</td>
						<td><input type="text" name="link_zip" id="link_zip_u"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>Email</td>
						<td colspan="3"><input type="text" name="link_email" id="link_email_u" size="50"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证地址</td>
						<td colspan="3"><input type="text" name="link_idcard_address" id="link_idcardAddr_u" size="50"></td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>家庭地址</td>
						<td colspan="3"><input type="text" name="link_home_address"  id="link_home_address_u" size="50"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td colspan="3"><input type="text" name="link_work_units" id="link_work_units_u" size="50"> </td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="link_work_address" id="link_work_address_u" size="50"></td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="button" value="保存" class="ui-state-default ui-corner-all"
											onclick="submitUpdateSupplLinkman()">
								<input type="reset" id="closeSupplLinkmanButu" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divUpdateSupplLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>
<!-- Add By Michael 2011 11/30 增加联系人查看信息 -->
<div id="divShowSupplLinkman" style="display: none" title="查看联系人">
	<form action="#" method="post" id="divShowSupplLinkmanForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="20%">名称</td>
						<td width="30%"><span id="link_name_s"></span>&nbsp;</td>
						<td width="20%">与供应商关系</td>
						<td width="30%"><span name="link_relation2cust_s" id="link_relation2cust_s"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>职位</td>
						<td colspan="3"><span name="link_duty_s" id="link_duty_s"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人所在省市</td>
					<td colspan="3"><select id="province_id_s" name="province_id_s" onchange="getCitys();">
					 	<option value="-1">-请选择省份-</option>
					 	<c:forEach items="${provinces}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach></select><select id="city_id_s" name="city_id_s" onchange="getAreas();">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${citys}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select><select id="area_id_s" name="area_id_s">
					 	<option value="-1">-请选择市区-</option>
					 	<c:forEach items="${areas}" var="item">
					 		<option value="${item.ID }">${item.NAME }</option>
					 	</c:forEach> 
					 </select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><span name="link_gender_s" id="link_gender_s"></span>&nbsp;</td>
						<td>年龄</td>
						<td><span name="link_age_s" id="link_age_s"></span>&nbsp;</td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机</td>
						<td><span name="link_mobile_s" id="link_mobile_s"></span>&nbsp;</td>
						<td>固话</td>
						<td><span name="link_phone_s" id="link_phone_s"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证</td>
						<td><span name="link_idcard_s" id="link_idcard_s" ></span></td>
						<td>邮编</td>
						<td><span name="link_zip_s" id="link_zip_s"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>Email</td>
						<td colspan="3"><span name="link_email_s" id="link_email_s" size="50"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证地址</td>
						<td colspan="3"><span name="link_idcard_address_s" id="link_idcardAddr_s" size="50"></span>&nbsp;</td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>家庭地址</td>
						<td colspan="3"><span name="link_home_address_s"  id="link_home_address_s" size="50"></span>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td colspan="3"><span name="link_work_units_s" id="link_work_units_s" size="50"></span>&nbsp;</td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址</td>
						<td colspan="3"><span name="link_work_address_s" id="link_work_address_s" size="50"></span>&nbsp;</td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="reset" id="closeSupplLinkmanBut" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divShowSupplLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>
