<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/overlayer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>添加承租人</title>
		<script src="${ctx }/common/js/idCard.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/createCust.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/custArea.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		//添加承租人,卡关,add by ShenQi,2014-7-25
		function addCustomer() {
			alert($("#natu_idcard").val());
			$.ajax({
				type:"POST",
				data:{"custType":$("input[name='cust_type']:checked").val(),
					  "custName":$.trim($("#cust_name").val()),
				      "idCard":$("#natu_idcard").val(),
				      "corpOragnizationCode":$.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val()),
				      "provinceId":$.trim($("#province_id").val()),
				      "__action":"customer.validateCustomer"},
				url:"../servlet/defaultDispatcher",
				dataType:"json",
				success:function(dataBack) {
					if(dataBack.flag) {
						alert(dataBack.msg);
					} else {
						$("#searchForm").submit();
					}
				}
			});
		}
		</script>
	</head>
	<body>
	<form id="searchForm" name="searchForm" method="POST" action="${ctx }/servlet/defaultDispatcher">
		<input type="hidden" name="__action" value="customer.createCust">
		<input type="hidden" name="isSalesDesk" value="${isSalesDesk }">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;添加承租人</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tbody>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>公司代号：</td>
					<td><select id="decp_id" name="decp_id">
							<c:forEach items="${companyList}" var="item">					
								<option value="${item.DECP_ID}" <c:if test="${item.DECP_ID eq s_employeeDecpId}">selected="selected"</c:if>>${item.DECP_NAME_CN  }</option>								
							</c:forEach>
						</select></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
			</tr>

			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="10%">承租人类型</td>
				<td><input type="radio" name="cust_type" value="1"  checked="checked" onClick="choiceCustType();" >法人<input type="radio" name="cust_type" value="0" onClick="choiceCustType();">自然人</td>
				<td width="10%">承租人分类</td>
				<td><select name="cust_level"><c:forEach items="${custLevel}" var="item"><option value="${item.CODE }">${item.FLAG }</option></c:forEach></select></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>承租人名称</td>
				<td><input type="text" value="" id="cust_name" name="cust_name"></td>
				<td>承租人所在省市</td>
				<td><select id="province_id" name="province_id" onchange="getCitys();"><option value="-1" selected="selected">-请选择省份-</option><c:forEach items="${provinces}" var="item"><option value="${item.ID }">${item.NAME }</option></c:forEach></select><select id="city_id" name="city_id"  onchange="getArea();"><option value="-1" selected="selected">-请选择市区-</option></select><select id="area_id" name="area_id">
							<option value="-1" selected="selected">
								-请选择区-
							</option>
						</select></td>
			</tr>
			<tr >
				<td class="ui-widget-content jqgrow ui-row-ltr"><span style="display: none;" id="n_natu_idcard">身份证号码</span><span style="display: block;" id="n_corp_oragnization_code">组织机构代码证号</span></td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<div id="div_natu_idcard" style="display: none;">
						<input id="natu_idcard" type="hidden" name="natu_idcard" />
					</div>
					<div id="div_corp_oragnization_code" style="display: block;">
					<!-- Modify by Michael 2012 4-23 限制组织机构代码证输入格式 -->
						<input name="corp_oragnization_code_before" type="text"
							id="corp_oragnization_code_before" size="8" maxlength="8"/>-							
						<input name="corp_oragnization_code_end" type="text"
							id="corp_oragnization_code_end" maxlength="1" size="1"/><font color="red">请分开输入，‘-’不要输入，前面输入8位后面输入1位</font>
							
					    <input name="corp_oragnization_code" type="hidden"
							id="corp_oragnization_code" size="9"/>	
					<!-- Modify by Michael 2012 4-23 限制组织机构代码证输入格式  -->		
					</div>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<span >经纬度：</span>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					X:<input type="text" name="x_point" style="width: 60px;"/>-
					Y:<input type="text" name="y_point" style="width: 60px;"/>
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<span style="display: none;" id="n_natu_work_units">工作单位：</span>
					<span style="display: block;" id="n_corp_hs_link_mode">法人联系方式：</span>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<div id="div_natu_work_units" style="display: none;">
						 <input id="natu_work_units" value=" " type="text" size="38"  name="natu_work_units" />
					</div>
					<div id="div_corp_hs_link_mode" style="display: block;">
						 <input name="corp_hs_link_mode" value=" " type="text" id="corp_hs_link_mode" />
					</div>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<span style="display: none;" id="n_natu_mobile">手机号码：</span>
					<span style="display: block;" id="n_corp_head_signature">法定代表人：</span>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<div id="div_natu_mobile" style="display: none;">
						<input id="natu_mobile" type="text" class="txtk" name="natu_mobile" />
					</div>
					<div id="div_corp_head_signature" style="display: block;">
						<input name="corp_head_signature" type="text" id="corp_head_signature"  />
					</div>
				</td>
			</tr>
		</tbody>
		<tr>
			<td colspan="4" align="center">
			<!-- <input type="button" onclick="checkCustomerExist();" value="检验承租人是否存在" class="ui-state-default ui-corner-all"> -->
			&nbsp;&nbsp;&nbsp;
			<input type="button" onclick="addCustomer();" value="保存" class="ui-state-default ui-corner-all">
			&nbsp;&nbsp;&nbsp;
			<input type="button" value="返回" onclick="javascript:history.go(-1);" class="ui-state-default ui-corner-all">
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>