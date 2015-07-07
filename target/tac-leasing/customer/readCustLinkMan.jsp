<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/customer/js/custLinkMan.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		link_idcard: new IdCard('link_idcard'),
	};
});
//-->
//显示查看联系人的弹出层
 function showDivShowCustLinkMan(culm_id) {
	$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=customer.showCustLinkManById&culm_id="+culm_id,
			dataType:"json",
			success:function(dataBack){
			$("#link_name_s").html(dataBack.culm.LINK_NAME);
			$("#link_gender_s").html(dataBack.culm.LINK_GENDER);
			$("#link_relation2cust_s").html(dataBack.culm.LINK_RELATION2CUST);
			$("#link_age_s").html(dataBack.culm.LINK_AGE);
			$("#link_mobile_s").html(dataBack.culm.LINK_MOBILE);
			$("#link_phone_s").html(dataBack.culm.LINK_PHONE);
			$("#link_idcard_s").html(dataBack.culm.LINK_IDCARD);
			$("#link_zip_s").html(dataBack.culm.LINK_ZIP);
			$("#link_email_s").html(dataBack.culm.LINK_EMAIL);
			$("#link_idcardAddr_s").html(dataBack.culm.LINK_IDCARD_ADDRESS);
			$("#link_home_address_s").html(dataBack.culm.LINK_HOME_ADDRESS);
			$("#link_work_units_s").html(dataBack.culm.LINK_WORK_UNITS);
			$("#link_duty_s").html(dataBack.culm.LINK_DUTY);
			$("#link_work_address_s").html(dataBack.culm.LINK_WORK_ADDRESS);
			$('#divShowCustLinkman').dialog({
				modal:true,
				autoOpen: false	,
				width:660,
			});
			$('#divShowCustLinkman').dialog('open');
	    },
	});		
}
</script>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
<form id="custLinkManForm" name="custLinkManForm" method="POST"
	action="#">
	
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th colspan="9" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					承租人联系方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					联系人名称
				</td >
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
				<tr id="CustLinkman_${item.CULM_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td ><span id="custLinkmanIndex">${status.count }</span></td>
					<td >${item.LINK_NAME }&nbsp;</td>
					<td >${item.LINK_GENDER }&nbsp;</td>
					<td >${item.LINK_RELATION2CUST }&nbsp;</td>
					<td >${item.LINK_MOBILE }&nbsp;</td>
					<td >${item.LINK_PHONE }&nbsp;</td>
					<td>${item.LINK_EMAIL }    &nbsp;   </td>
					<td><c:if test="${item.LINK_TYPE eq 0 }">主要联系人</c:if><c:if test="${item.LINK_TYPE eq 1 }">联系人</c:if> &nbsp;   </td>
					<td ><c:if test="${item.STATUS eq 0 }">正常</c:if><c:if test="${item.STATUS eq 1 }">作废</c:if></td>
					<td><span id="custLinkman_opteration_${item.CULM_ID }"><a href="javascript:void(0)" onclick="showDivShowCustLinkMan('${item.CULM_ID }');">查看</a></span> </td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form>
</div>
</div>
</div>
<!-- Add By Michael 2011 12/1 -->
<!-- 增加查看联系人功能 -->
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