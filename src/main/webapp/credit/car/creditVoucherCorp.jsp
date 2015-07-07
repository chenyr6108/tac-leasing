<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var idCardMapsCorp;
	$(document).ready(function() {
		idCardMapsCorp = {
			mateIdCardCorp: new IdCard('corp_hs_idcard')
		};
	});
</script>
<!-- 法人 -->
 
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="13%">担保公司名称&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="cust_name" id="cust_name"></td>
			<td width="13%">企业性质</td>
			<td><input type="text" name="corp_enterprises_property"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>法定代表人&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_head_signature" id="corp_head_signature"></td>
			<td>法人身份证号码&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="hidden" name="corp_hs_idcard" id="corp_hs_idcard"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>法人联系方式&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_hs_link_mode" id="corp_hs_link_mode"></td>
			<td>法人代表住处</td>
			<td><input type="text" name="corp_hs_home_address"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>开户银行&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="open_bank" id="open_bank"></td>
			<td>开户账号&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="bank_accounts" id="bank_accounts"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>营业执照注册号&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_business_license" id="corp_business_license"></td>
			<td>组织机构代码号&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_oragnization_code" id="corp_oragnization_code"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>税务登记号&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_tax_code" id="corp_tax_code"></td>
			<td>有效期&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_period_validity" id="corp_period_validity"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>公司邮编</td>
			<td colspan="3"><input type="text" style="width: 300" name="corp_company_zip"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>注册地址&nbsp;&nbsp;<font color="red">*</font></td>
			<td colspan="3"><input type="text" style="width: 500" name="corp_registe_address" id="corp_registe_address"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>办公地址&nbsp;&nbsp;<font color="red">*</font></td>
			<td colspan="3"><input type="text" style="width: 500" name="corp_work_address" id="corp_work_address"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>经营范围</td>
			<td colspan="3"><input type="text" style="width: 500" name="corp_business_range"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>公司电话&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="corp_company_phone" id="corp_company_phone"></td>
			<td>公司传真</td>
			<td><input type="text" name="corp_company_fax"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>公司网址</td>
			<td colspan="3"><input type="text" style="width: 500" name="corp_company_website"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注</td>
			<td colspan="3"><input type="text" style="width: 500" name="remark"></td>
		</tr>
	</table>
</div>
			</div>
			</div>

