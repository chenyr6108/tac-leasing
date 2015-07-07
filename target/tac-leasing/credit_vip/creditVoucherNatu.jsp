<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 自然人 -->
<script type="text/javascript">
	var idCardMap;
	$(function (){
		idCardMap = {
			mateIdCard: new IdCard('natu_idcard'),
			mateIdCard: new IdCard('natu_mate_idcard')
		};
	});
</script>

	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="15%">担保人姓名&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="cust_name" id="natu_name" onchange="checkTrueNatu();"></td>
			<td width="13%">性别</td>
			<td><input type="text" name="natu_gender" id="natu_gender"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>年龄</td>
			<td><input type="text" name="natu_age" id="natu_idcardAge"></td>
			<td>邮编</td>
			<td><input type="text" name="natu_zip" id="natu_zip"></td>
		</tr>
		<tr >
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<select name="flagPermit" onchange="changeType(this.value,'');">
					<c:forEach items="${natuTypeList}" var="item">
						<option value="${item.CODE }">${item.FLAG }</option>
					</c:forEach>
				</select>
				<font color="red">*</font>
			</td>
			<td id="natudiv0" style="" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="natu_idcard" id="natu_idcard" onchange="checkTrueNatu();">
			</td>
			<td id="natudiv1" style="display: none;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="otherPermit" id="otherPermit" onchange="checkTrueNatu();">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">家庭电话</td>
			<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="natu_phone" id="natu_phone"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>开户银行</td>
			<td><input type="text" name="open_bank" id="natu_open_bank"></td>
			<td>银行帐号</td>
			<td><input type="text" name="bank_accounts" id="natu_bank_accounts"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>手机号码&nbsp;&nbsp;<font color="red">*</font></td>
			<td><input type="text" name="natu_mobile" id="natu_mobile"></td>
			<td>传真</td>
			<td><input type="text" name="natu_fax" id="natu_fax"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>家庭地址</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_home_address" id="natu_home_address"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>身份证地址</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_idcard_address" id="natu_idcardAddr1"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>工作单位</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_work_units" id="natu_work_units"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>单位地址</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_work_address" id="natu_work_address"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td >配偶姓名</td>
			<td ><input type="text" name="natu_mate_name" onchange="checkTrueNatuMate();" id="natu_mate_name"></td>
			<td>配偶性别</td>
			<td><input type="text" name="natu_mate_gender" id="natu_mate_gender"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td >配偶年龄</td>
			<td ><input type="text" name="natu_mate_age" id="natu_mate_idcardAge"></td>
			<td>配偶邮编</td>
			<td><input type="text" name="natu_mate_zip" id="natu_mate_zip"></td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<select name="mate_flag_permit" onchange="changeMateType(this.value,'');">
					<c:forEach items="${natuTypeList}" var="item">
						<option value="${item.CODE }">${item.FLAG }</option>
					</c:forEach>
				</select>
			</td>
			<td id="natuMatediv0" style="" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="natu_mate_idcard" id="natu_mate_idcard" onchange="checkTrueNatuMate();">
			</td>
			<td id="natuMatediv1" style="display: none;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="mate_other_permit" id="mate_other_permit" onchange="checkTrueNatuMate();">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">配偶家庭电话</td>
			<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="natu_mate_phone" id="natu_mate_phone"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶开户银行</td>
			<td><input type="text" name="open_mate_bank" id="open_mate_bank"></td>
			<td>配偶银行帐号</td>
			<td><input type="text" name="bank_accounts_mate" id="bank_accounts_mate"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶手机号码</td>
			<td><input type="text" name="natu_mate_mobile" id="natu_mate_mobile"></td>
			<td>配偶传真</td>
			<td><input type="text" name="natu_mate_fax" id="natu_mate_fax"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶家庭地址</td>
			<td><input type="text" name="natu_mate_home_address" id="natu_mate_home_address"></td>
			<td>是否联合担保</td>
			<td><input type="radio" name="istogether" value="1">是<input type="radio" name="istogether" value="0" checked="checked">否</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶身份证地址</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_mate_idcard_address" id="natu_mate_idcardAddr1"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶工作单位</td>
			<td colspan="3"><input type="text" style="width: 500" name="natu_mate_work_units" id="natu_mate_work_units"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注 </td>
			<td colspan="3"><input type="text" style="width: 500" name="remark"></td>
		</tr>
		<tr>
			<td colspan="4">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td class="ui-state-default ui-th-ltr zc_grid_head"  width="70%">
							<b>名下资产</b>
						</td>
						<td  class="ui-state-default ui-th-ltr zc_grid_head" align="right">
							相关操作：
							<img src="../images/u100.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="addOtherProrerty('fffff');">添加</a>
						</td>
						<td  class="ui-state-default ui-th-ltr zc_grid_head" align="right">
							<img src="../images/u103.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="deleteOtherProrerty();">删除</a>
						</td>
					</tr>
				</table>
				<div id="fffff" class="ui-state-default ui-jqgrid-hdiv "></div>
			</td>
		</tr>
	</table>
	
	</div>
	</div>
	</div>
