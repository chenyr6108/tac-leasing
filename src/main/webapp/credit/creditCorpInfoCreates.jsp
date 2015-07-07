<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<title>尽职调查报告</title>
		<script type="text/javascript">
			var idCardMap;
			$(function (){
				idCardMap = {
					mateIdCard: new IdCard('LEGAL_ID_CARD_Crop'),
					idCard: new IdCard('LINK_ID_CARD_Crop')
				};
			});
		</script>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
			});
			function copyLEGALtoTC(){
				$('#LINK_MANs').val($('#LEGAL_PERSONs').val());
				$('#LINK_TELEPHONEs').val($('#LEGAL_TELEPHONEs').val());
				$('#LINK_POSTCODEs').val($('#LEGAL_POSTCODEs').val());
				$('#LINK_MAILING_ADDRESSs').val($('#LEGAL_HOME_ADDRESSs').val());
				$('#LINK_MOBILE_NUMBER1s').val($('#LEGAL_MOBILE_NUMBER1s').val());
				$('#LINK_MOBILE_NUMBER2s').val($('#LEGAL_MOBILE_NUMBER2s').val());
				$('#LINK_ID_CARD_Crop').val($('#LEGAL_ID_CARD_Crop').val());
				$('#linkPermit').val($('#otherPermit').val());
				changeType4($("#flagPermit").val(),'');
				for (var i=0;i<18;i++) {
					$("#LINK_ID_CARD_Crop_field_"+i).val($("#LEGAL_ID_CARD_Crop_field_"+i).val());
				}
			}
			function verifyNumber(field) {
			    var value = field.value;
			    value = value.trim();
			    value = value.replace(/[￥,]/g, '');

			    if (checkNumber(value)) {
			        if (value.substring(0,1) != '0') {
			            value = value.replace(/^0+/g, '');
			        }
			        field.value = value;
			        // setFormatCurrency(field);
			    } else {
			        field.value = 0;
			    }
			}
		</script>
	
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left;">
						<strong>担保人信息</strong>
					</th>
				</tr>
				<tr> 
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td width="3%" rowspan="11" class="ui-state-default ui-th-ltr zc_grid_head">
									法
									<br />
									人
									<br />
									基
									<br />
									本
									<br />
									信
									<br />
									息
								</td>
								<td width="20%" rowspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									单位名称
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
									中文：
								</td>
								<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CORP_NAME_CN" id="CORP_NAME_CNs" style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" onchange="checkTrueCorp();">
									<span class="red">*</span>
								</td>
								<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
									职工人数：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="EMPLOYEE_COUNT" id="EMPLOYEE_COUNTs" style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									英文：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CORP_NAME_EN" id="CORP_NAME_EN" style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									企业类型：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CORP_TYPE" id="CORP_TYPE" style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								<!-- 
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<select name="CORP_TYPE" id="CORP_TYPE" class="txtk"
										onblur="lnOut(this);valueIsNotNull(this);">
										<c:forEach items="${corpTypeList}" var="item">
											<option value="${item.CODE }">${item.FLAG }</option>
										</c:forEach>
									</select>
								</td>
								 -->
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									营业执照注册号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="BUSINESS_LICENCE_CODE"
										id="BUSINESS_LICENCE_CODE"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									营业期限：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="BUSINESS_TIME_LIMIT"
										id="BUSINESS_TIME_LIMIT"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									组织机构代码证号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ORGANIZATION_CODE_CERTIFICATE"
										id="ORGANIZATION_CODE_CERTIFICATEs"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);" onchange="checkTrueCorp();" >
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年检情况：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ROAD_WORTHINESS_INSPECTION"
										id="ROAD_WORTHINESS_INSPECTION"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									税务登记号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TAX_REGISTRATION_NUMBER"
										id="TAX_REGISTRATION_NUMBER"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									成立日期：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="INCORPORATING_DATE"
										id="datebegin"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									注册资本(千元)：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="REGISTERED_CAPITAL"
										id="REGISTERED_CAPITALs"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onblur="verifyNumber(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									实收资本(千元)：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL"
										id="CONTRIBUTED_CAPITALs"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onblur="verifyNumber(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									公司注册地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="REGISTERED_OFFICE_ADDRESS"
										id="REGISTERED_OFFICE_ADDRESSs"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									经营范围：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MANAGING_SCOPE" id="MANAGING_SCOPE"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									公司电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TELEPHONE" id="TELEPHONEs"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									传真：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="FAX" id="FAXs" style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									网址：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="URL" id="URL" style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="POSTCODE" id="POSTCODEs"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td height="80" class="ui-widget-content jqgrow ui-row-ltr">
									备注：
								</td>
								<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
									<textarea name="MEMO" id="MEMO"
										style="width: 700px; height: 60px; font-size: 12px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"></textarea>
								</td>
							</tr>
							<tr>
								<td rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									法
									<br />
									人
									<br />
									代
									<br />
									表
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									法定代表人：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_PERSON" id="LEGAL_PERSONs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<select id="flagPermit" name="flagPermit" onchange="changeType3(this.value,'');">
										<c:forEach items="${natuTypeList}" var="item">
											<option value="${item.CODE }">${item.FLAG }</option>
										</c:forEach>
									</select>
								</td>
								<td colspan="3" id="corpdiv0" style="" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="LEGAL_ID_CARD" id="LEGAL_ID_CARD_Crop">
								</td>
								<td colspan="3" id="corpdiv1" style="display: none;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="otherPermit" id="otherPermit">
								</td>
								
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_TELEPHONE" id="LEGAL_TELEPHONEs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_POSTCODE" id="LEGAL_POSTCODEs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									常住地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_HOME_ADDRESS"
										id="LEGAL_HOME_ADDRESSs"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_MOBILE_NUMBER1"
										id="LEGAL_MOBILE_NUMBER1s"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_MOBILE_NUMBER2"
										id="LEGAL_MOBILE_NUMBER2s"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									联
									<br />
									系
									<br />
									人
									<br />
									信
									<br />
									息
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系人姓名
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_MAN" id="LINK_MANs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"/>
										<input type="button" name="button" id="button" value="法人" class="ui-state-default ui-corner-all"
										onclick="copyLEGALtoTC();">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<select name="linkflagPermit" onchange="changeType4(this.value,'');">
										<c:forEach items="${natuTypeList}" var="item">
											<option value="${item.CODE }">${item.FLAG }</option>
										</c:forEach>
									</select>
								</td>
								<td colspan="3" id="custcorpdiv0" style="" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="LINK_ID_CARD" id="LINK_ID_CARD_Crop">
								</td>
								<td colspan="3" id="custcorpdiv1" style="display: none;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="linkPermit" id="linkPermit">
								</td>
								
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_TELEPHONE" id="LINK_TELEPHONEs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									职务：
								</td>
								<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_JOB" id="LINK_JOB"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td width="21%"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_POSTCODE" id="LINK_POSTCODEs"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮寄地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_MAILING_ADDRESS"
										id="LINK_MAILING_ADDRESSs"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_MOBILE_NUMBER1"
										id="LINK_MOBILE_NUMBER1s"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_MOBILE_NUMBER2"
										id="LINK_MOBILE_NUMBER2s"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									EMAIL：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_EMAIL" id="LINK_EMAIL"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									MSN：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LINK_MSN" id="LINK_MSN"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);">
								</td>
							</tr>
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									其
									<br />
									他
									<br />
									信
									<br />
									息
								</td>
								<td colspan="7"  class="ui-widget-content jqgrow ui-row-ltr">
									<textarea name="OTHER_INFO" id="OTHER_INFO"
										style="width: 700px; height: 60px; font-size: 12px"
										class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"></textarea>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" id="bankTab1${status.index }" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>开户银行</strong>
								</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="../images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addBank(this);">添加</a>
								</td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="../images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteBank(this);">删除</a>
								</td>
							</tr>
							<tr>
								<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
									基本账户
								</td>
								<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
									开户银行：
								</td>
								<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;">
								</td>
								<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">
									账号：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab1${status.index }">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司股东及份额</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="../images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addShareholders('shareholderTab1${status.index }');">添加</a>
								</td>
								<td width="19%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="../images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteShareholder();">删除</a>
								</td>
							</tr>
							<tr>
								<td colspan="2" width="23%"  class="ui-widget-content jqgrow ui-row-ltr">
									股东名称
								</td>
								<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
									出资情况（千元）
								</td>
								<td width="18%"class="ui-widget-content jqgrow ui-row-ltr">
									出资方式
								</td>
								<td width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									股权比例
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									备注
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr"> 
								<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"></td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_NAME" id="HOLDER_NAME"
										style="width: 180px;" ></td>
								<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_CAPITAL" id="HOLDER_CAPITALs"
										style="width: 120px" ></td>
								<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_WAY" id="HOLDER_WAY"
										style="width: 140px;" ></td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_RATE" id="HOLDER_RATEs"
										style="width: 40px;" >%</td>
								<td  style="text-align: center" colspan="2"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_MOME" id="HOLDER_MOME"
										style="width: 200px;"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="projectTab1${status.index }">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												相关操作：
												<img src="../images/u100.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick="addProjects();">添加</a>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="../images/u103.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick='deleteProjects();'>删除
													&nbsp; &nbsp;</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									项目名称：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROJECT_NAMES" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;&nbsp;&nbsp; 起止时间：
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROJECT_DATE" style="width: 150px;">
								</td>
							</tr>
							<tr>
								<td width="19%" height="50" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
									<input type="hidden" name="forDelete">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<textarea name="PROJECT_CONTENT" style="width: 500px; height: 50px; font-size: 12px" class="txtk"></textarea>
								</td>
							</tr>
						</table>
						<div id="dddd"></div>
						
					</td>
				</tr>
			</table>
			</div>
	</div>
	</div>
	