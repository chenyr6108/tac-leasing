<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/customer/js/custLinkMan.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>	
<script type="text/javascript">
<!--
var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		link_idcard: new IdCard('link_idcards'),
	};
});
<%--2011/12/21 Yang Yun Add draw grid panel for all link man. Start --%>
//读取联系人List
function drawGridPanel(dataBack){
	var html = "";
	var status = null;
	var linkManType = null;
	var processBut = "";
	if(dataBack!=null && dataBack.custLinkman!=null){
			for(var i=0;i<dataBack.custLinkman.length;i++){
				processBut = "";
				if(dataBack.custLinkman[i].STATUS == 0){}
				status = dataBack.custLinkman[i].STATUS == 0 ? '启用' : '作废';
				if(dataBack.custLinkman[i].LINK_TYPE == 0){
					linkManType = "主要联系人";
				} else {
					linkManType = "联系人";
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"setDefault('"+dataBack.custLinkman[i].CULM_ID+"');\">设为主要</a> | ";
				}
				if(dataBack.custLinkman[i].STATUS == 0){
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"disabledCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">作废</a> | ";
				} else {
					processBut = processBut + "<a href=\"javascript:void(0)\" onclick=\"abledCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">启用</a> | ";
				}
				html=html+"<tr id=\"CustLinkman_"+dataBack.custLinkman[i].CULM_ID+"\"><td  class='ui-widget-content jqgrow ui-row-ltr'><span id=\"custLinkmanIndex\">"+(i+1)+"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>"
					 +(dataBack.custLinkman[i].LINK_NAME == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_NAME)+"   </td>"
					 +"<td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_GENDER == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_GENDER)+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>"+(dataBack.custLinkman[i].LINK_RELATION2CUST == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_RELATION2CUST)
					 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_MOBILE == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_MOBILE)
					 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_PHONE == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_PHONE)
					 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_EMAIL == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_EMAIL)
					 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>" + linkManType + "</td><td class='ui-widget-content jqgrow ui-row-ltr'>    <span id=\"custLinkman_status_"+dataBack.custLinkman[i].CULM_ID+"\">"+status
					 +"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>   <span  id=\"custLinkman_opteration_"+dataBack.custLinkman[i].CULM_ID +"\">"+processBut+"</span>"
					 +"<a href=\"javascript:void(0)\" onclick=\"showDivShowCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">查看</a> | <a href=\"javascript:void(0)\" onclick=\"showDivUpdateCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">修改</a></td></tr>";
    	}
    }
	return html;
}
<%--2011/12/21 Yang Yun Add draw grid panel for all link man. End --%>
// Add By Michael 2011 11/30 增加联系人查看信息 
//显示修改联系人的弹出层
function showDivUpdateCustLinkMan(culm_id) {
	$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=customer.showCustLinkManById&culm_id="+culm_id,
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
			$("#link_duty_u").val(dataBack.culm.LINK_DUTY);
			$("#link_work_address_u").val(dataBack.culm.LINK_WORK_ADDRESS);
			
			$('#divUpdateCustLinkman').dialog({
				modal:true,
				autoOpen: false	,
				width:660,
			});
			$('#divUpdateCustLinkman').dialog('open');
	    },
	});	
}
<%--2011/12/21 Yang Yun Add 新增联系人，设置主要联系人，作废 和 启用联系人 from js file. Start--%>
//新增联系人
function submitAddCustLinkman(){
	var cust_id = $.trim($("#cust_id").val());
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
	if (link_name == ''){
		alert("请输入联系人的名字！");
		return ;
	}
	if (link_relation2cust == ''){
		alert("请输入联系人与承租人的关系！");
		return ;
	}
	if (link_mobile == '' && link_phone == ''){
		alert("请输入联系人的手机或固话！");
		return ;
	}
	if(link_work_address == ''){
		alert("请输入邮寄地址！");
		return;
	}
	
	if(link_email!=null && link_email.length>0){
/* 		if (!/^\w+@\w+.\w+$/.test(link_email)){
			 alert("Email输入格式不正确！");
			 return;
		} */
		if(!checkEmail(link_email)){
			alert("Email输入格式不正确！");
			return;
		}
	}
	
	$("#divAddCustLinkman").css("z-index",0);
	$("#closeCustLinkmanButs").click();
	var param = {"cust_id":cust_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"link_email":link_email,
		"__action":"customer.createCustLinkMan"
	};
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			if(callback!=null && callback.custLinkman!=null){
				$("#divCustLinkman").html(drawGridPanel(callback));
				alert("操作已成功！");
				return;
			}else{
				alert("网络错误，请稍后重试或联系系统管理员！");
				return ;
			}		
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			showDivAddCustLinkMan();
			return ;
		}
	});
}

//设置成主要联系人
function setDefault(culm_id){
	if (confirm("确定要将次联系人设为主要联系人吗？")){
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"cust_id":$.trim($("#cust_id").val()),"__action":"customer.setDefaultLinkMan"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if(callback!=null && callback.custLinkman!=null){
					$("#divCustLinkman").html(drawGridPanel(callback));
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
function disabledCustLinkMan(culm_id){
	var msg = "您确定要作废此承租人的联系方式吗？";
	if (confirm(msg)){
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"1","cust_id":$.trim($("#cust_id").val()),"__action":"customer.operteCustLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					$("#divCustLinkman").html(drawGridPanel(callback));
					alert("操作已成功！");
					hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					hideoverlayer();
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
function abledCustLinkMan(culm_id){
	var msg = "您确定要启用此承租人的联系方式吗？";
	if (confirm(msg)){
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"0","cust_id":$.trim($("#cust_id").val()),"__action":"customer.operteCustLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					$("#divCustLinkman").html(drawGridPanel(callback));
					alert("操作已成功！");
					hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					hideoverlayer();
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
<%--2011/12/21 Yang Yun Add 新增联系人，设置主要联系人，作废 和 启用联系人 from js file. End--%>
//-->
</script>	
<form id="custLinkManForm" name="custLinkManForm" method="POST"
	action="#">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels"> 
				<th colspan="10" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					承租人联系方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					相关操作：<a href="javascript:void(0)" onclick="showDivAddCustLinkMan();"><img alt="添加" src="${ctx }/images/u100.gif">添加</a>
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
					与承租人关系
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
					操作
				</td>
			</tr>
</thead>
<tbody id="divCustLinkman">
<c:forEach items="${custLinkmanList}" var="item" varStatus="status">
<tr id="custLinkman_${item.CULM_ID }" class="ui-widget-content jqgrow ui-row-ltr">
				<td><span id="custLinkmanIndex">${status.count }</span></td>
				<td>${item.LINK_NAME }    &nbsp;  </td>
				<td>${item.LINK_GENDER }    &nbsp;  </td>
				<td>${item.LINK_RELATION2CUST }   &nbsp;   </td>
				<td>${item.LINK_MOBILE }    &nbsp;   </td>
				<td>${item.LINK_PHONE }   &nbsp;   </td>
				<td>${item.LINK_EMAIL }    &nbsp;   </td>
				<td><c:if test="${item.LINK_TYPE eq 0 }">主要联系人</c:if><c:if test="${item.LINK_TYPE eq 1 }">联系人</c:if> &nbsp;   </td>
				<td><span id="custLinkman_status_${item.CULM_ID }"><c:if test="${item.STATUS eq 0 }">启用</c:if><c:if test="${item.STATUS eq 1 }">作废</c:if></span></td>
				<%-- 2011/12/21 Yang Yun Add set default linkman process.
				<td><span id="custLinkman_opteration_${item.CULM_ID }"><c:if test="${item.STATUS ne 1 }"><a href="javascript:void(0)" onclick="disabledCustLinkMan('${item.CULM_ID }');">作废</a></c:if><c:if test="${item.STATUS ne 0 }"><a href="javascript:void(0)" onclick="abledCustLinkMan('${item.CULM_ID }');">启用</a></c:if></span>| <a href="javascript:void(0)" onclick="showDivShowCustLinkMan('${item.CULM_ID }');">查看</a> | <a href="javascript:void(0)" onclick="showDivUpdateCustLinkMan('${item.CULM_ID }');">修改</a></td>
				--%>
				<td><span id="custLinkman_opteration_${item.CULM_ID }"><c:if test="${item.LINK_TYPE eq 1}"><a href="javascript:void(0)" onclick="setDefault('${item.CULM_ID }');">设为主要</a> | </c:if><c:if test="${item.STATUS ne 1 }"><a href="javascript:void(0)" onclick="disabledCustLinkMan('${item.CULM_ID }');">作废</a> | </c:if><c:if test="${item.STATUS ne 0 }"><a href="javascript:void(0)" onclick="abledCustLinkMan('${item.CULM_ID }');">启用</a> | </c:if></span><a href="javascript:void(0)" onclick="showDivShowCustLinkMan('${item.CULM_ID }');">查看</a> | <a href="javascript:void(0)" onclick="showDivUpdateCustLinkMan('${item.CULM_ID }');">修改</a></td>
			</tr>
</c:forEach>
	
</tbody>
		<tfoot>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td  colspan="8" align="center"><!-- 
					<input type="button" onclick="createCust();" value="保存">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="返回">
					 --></td>
			</tr>
		</tfoot>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="divAddCustLinkman" style="display: none" title="添加联系人">
	<form action="#" method="post" id="divAddCustLinkmanForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>名称<font color="red">*</font></td>
						<td><input type="text" name="link_name" id="link_name"></td>
						<td>与承租人关系<font color="red">*</font></td>
						<td><input type="text" name="link_relation2cust" id="link_relation2cust"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><input type="radio" name="link_gender" value="男" checked="checked">男<input type="radio" name="link_gender" value="女">女</td>
						<td>年龄</td>
						<td><input type="text" name="link_age" id="link_idcardAge"></td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机<font color="red">*</font></td>
						<td><input type="text" name="link_mobile" id="link_mobile"><font color="red">(手机和固话必须至少填写一个)</font></td>
						<td>固话<font color="red">*</font></td>
						<td><input type="text" name="link_phone" id="link_phone"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证</td>
						<td><input type="hidden" name="link_idcard" id="link_idcards"></td>
						<td>邮编</td>
						<td><input type="text" name="link_zip" id="link_zip"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>Email</td>
						<td colspan="3"><input type="text" name="link_email" id="link_email" size="50" onBlur="isEmail(this)"></td>
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
						<td>职位</td>
						<td colspan="3"><input type="text" name="link_duty" id="link_duty"></td>
				</tr>
				<!--Modify BY Michael 2011 12-2  单位地址改为 邮寄地址 -->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="link_work_address" id="link_work_address" size="50"></td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="button" value="保存" class="ui-state-default ui-corner-all"
											onclick="submitAddCustLinkman()">
								<input type="reset" id="closeCustLinkmanButs" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divAddCustLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>

<div id="divUpdateCustLinkman" style="display: none" title="修改联系人">
	<form action="#" method="post" id="divUpdateCustLinkmanForm">
	<input type="hidden" name="culm_id_u" id="culm_id_u" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>名称<font color="red">*</font></td>
						<td><input type="text" name="link_name_u" id="link_name_u"></td>
						<td>与承租人关系<font color="red">*</font></td>
						<td><input type="text" name="link_relation2cust" id="link_relation2cust_u"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><input type="radio" name="link_gender_u" value="男" checked="checked" id="link_gender_m">男<input type="radio" name="link_gender_u" value="女" id="link_gender_w">女</td>
						<td>年龄</td>
						<td><input type="text" name="link_age" id="link_idcardAge_u"></td>
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机<font color="red">*</font></td>
						<td><input type="text" name="link_mobile" id="link_mobile_u"><font color="red">(手机和固话必须至少填写一个)</font></td>
						<td>固话<font color="red">*</font></td>
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
						<td colspan="3"><input type="text" name="link_email" id="link_email_u" size="50" onBlur="isEmail(this)"></td>
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
						<td>职位</td>
						<td colspan="3"><input type="text" name="link_duty" id="link_duty_u"></td>
				</tr>
				<!--Modify BY Michael 2011 12-2  单位地址改为 邮寄地址 -->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" name="link_work_address" id="link_work_address_u" size="50"></td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="button" value="保存" class="ui-state-default ui-corner-all"
											onclick="submitUpdateCustLinkman()">
								<input type="reset" id="closeCustLinkmanButu" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divUpdateCustLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>
<!-- Add By Michael 2011 11/30 增加联系人查看信息 -->
<div id="divShowCustLinkman" style="display: none" title="查看联系人">
	<form action="#" method="post" id="divShowCustLinkmanForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="20%">名称</td>
						<td width="30%"><span id="link_name_s"></span>&nbsp;</td>
						<td width="20%">与承租人关系</td>
						<td width="30%"><span name="link_relation2cust_s" id="link_relation2cust_s"></span>&nbsp;</td>
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
						<td colspan="3"><span name="link_email_s" id="link_email_s" size="50" onBlur="isEmail(this)"></span>&nbsp;</td>
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
						<td>职位</td>
						<td colspan="3"><span name="link_duty_s" id="link_duty_s"></span>&nbsp;</td>
				</tr>
				<!--Modify BY Michael 2011 12-2  单位地址改为 邮寄地址 -->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮寄地址</td>
						<td colspan="3"><span name="link_work_address_s" id="link_work_address_s" size="50"></span>&nbsp;</td>
				</tr>
				<tr>
						<td colspan="4" align="center">
								<input type="reset" id="closeCustLinkmanBut" value="关闭" class="ui-state-default ui-corner-all"
											onclick="closeDialog(divShowCustLinkman)">
						</td>
				</tr>
							
							</table>
							</div>
							</div>
							</div>
	</form>
</div>
