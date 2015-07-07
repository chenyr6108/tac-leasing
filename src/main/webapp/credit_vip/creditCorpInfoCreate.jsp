<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>尽职调查报告</title>
		<script type="text/javascript" src="${ctx}/common/js/idCard.js"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/credit_vip/js/creditCustomerCorp.js"></script>
		<script type="text/javascript">
			
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = {
					mateIdCard: new IdCard('LEGAL_ID_CARD1'),
					idCard: new IdCard('LINK_ID_CARD1'),
					tCard: new IdCard('CARD_ID1'),
				};						
			});
			IdCard.onReady(function() { 
				idCardMap = {

					ateIdCard: new IdCard('nat_idcard'),
					dCard: new IdCard('mate_idcard')
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
			function controllerTextArea1(value, obj) {
				var taNode = $("#"+obj+"> textarea");
				var height = taNode.height();
				if (value=='add') {
					taNode.height(height*2)
				}
				if (value=='del') {
					if (parseInt(height) > 46) {
						taNode.height(height/2)
					}
				}
			}
			$(function (){
				$("#INCORPORATING_DATE2").datepicker($.datepicker.regional['zh-CN']); 
				
				chanCard(1);
				chanCard(2);
			});
			function copyLEGALtoTC(){
				$('#TC_NAME').val($('#LEGAL_PERSON').val());
				$('#CARD_ID1').val($('#LEGAL_ID_CARD1').val());
				$('#CARD_ID2').val($('#LEGAL_ID_CARD2').val());
				//$('#LINK_ID_CARD').attr('name',$('#LEGAL_ID_CARD').attr('name'));
				$('#TC_TELEPHONE').val($('#LEGAL_TELEPHONE').val()); 
				$('#TC_POSTCODE').val($('#LEGAL_POSTCODE').val());
				$('#TC_PHONE1').val($('#LEGAL_MOBILE_NUMBER1').val());
				$('#TC_PHONE2').val($('#LEGAL_MOBILE_NUMBER2').val());
				//$("#LINK_IDCARD_FLAG").val($("#LEGAL_IDCARD_FLAG").val());
				chanCard(3) ;
				for(i=0;i<$('#LEGAL_ID_CARD1').val().length;i++){
					$('#CARD_ID1_field_'+i).val($('#LEGAL_ID_CARD1_field_'+i).val());
				} 
	
			}
			
			function saveNatural() {
				var dataObject={__action:"creditVoucherVip.saveNatural",
									 credit_id:$("#credit_id").val(),
							   LEGAL_PERSON:$("#LEGAL_PERSON").val(),
							   LEGAL_TELEPHONE:$("#LEGAL_TELEPHONE").val(),
							   LEGAL_IDCARD_FLAG:$("#LEGAL_IDCARD_FLAG").val(),
							   LEGAL_ID_CARD:$("#LEGAL_ID_CARD1").val(),
							   LEGAL_POSTCODE:$("#LEGAL_POSTCODE").val(),
							   LEGAL_MOBILE_NUMBER1:$("#LEGAL_MOBILE_NUMBER1").val(),
							   LEGAL_IDCARD_FLAG:$("#LEGAL_IDCARD_FLAG").val(),
							   LEGAL_HOME_ADDRESS:$("#LEGAL_HOME_ADDRESS").val()};
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:dataObject,
					dataType:'json',
					success: function(dataBack)	{
						if(dataBack) {
							alert("保存成功!");
						} else {
							alert("保存失败!");
						}
					}	
					});
			}
			
			function saveNatural2() {
				var dataObject={__action:"creditVoucherVip.saveNatural",
									 credit_id:$("#credit_id").val(),
							   LEGAL_PERSON:$("#natu_namen").val(),
							   LEGAL_TELEPHONE:$("#home_phone").val(),
							   LEGAL_IDCARD_FLAG:$("#ID_CARD_TYPE").val(),
							   LEGAL_ID_CARD:$("#nat_idcard").val(),
							   LEGAL_POSTCODE:$("#natu_zip").val(),
							   LEGAL_MOBILE_NUMBER1:$("#mobile_phone").val(),
							   LEGAL_HOME_ADDRESS:$("#nat_idcar").val(),
							   
							   SEX:$("#sex").val(),
							   AGE:$("#nat_idcardAges").val(),
							   FAX:$("#natu_fax").val(),
							   WORK_UNIT:$("#work_unit").val(),
							   MATE_NAME:$("#mate_name").val(),
							   MATE_AGES:$("#mate_idcardAges").val(),
							   MATE_ID_CARD:$("#mate_idcard").val(),
							   MATE_PHONE:$("#mate_phone").val(),
							   MATE_WORK_UNIT:$("#mate_work_unit").val(),
							   OPEN_BANK:$("#B_BANK_NAME").val(),
							   BANK_ACCOUNT:$("#B_BANK_ACCOUNT").val()};
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:dataObject,
					dataType:'json',
					success: function(dataBack)	{
						if(dataBack) {
							alert("保存成功!");
						} else {
							alert("保存失败!");
						}
					}	
					});
			}
		</script>
	</head>

	<body>
		<form action="../servlet/defaultDispatcher" name="corpForm" id="corpForm"
			method="post">
			<c:if test="${creditMap.CUST_TYPE eq 1}"><input type="hidden" name="__action"
				value="creditCustomerCorpVip.createOrUpdateCreditCustomerCorp"></c:if>
			<c:if test="${creditMap.CUST_TYPE eq 0 }"><input type="hidden" name="__action"
				value="creditCustomerCorpVip.createOrUpdateCreditCustomerNatu"></c:if>
			<%--2011/12/26 Yang Yun 删除客户联系人信息的验证，因为是联动的，只要验证联系人是否存在。--%>
			<input type="hidden" name="linkMan" id="linkMan" value="${linkMan.LINK_NAME }">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="creditCustomerNatu_id" value="${creditCustomerCorpMap.NATU_ID }">
			<input type="hidden" name="cust_code" value="${creditCustomerCorpMap.CUST_CODE }">
			<input type="hidden" name="creditCustomerCorp_id" value="${creditCustomerCorpMap.PJCCC_ID }">
			<input type="hidden" name="trueContact_id" value="${trueContact.ID }">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="100%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>基本承租人信息</strong>
					</td>
				</tr>
				<tr>
					<td width="100%">
					<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td width="3%" rowspan="12" class="ui-state-default ui-th-ltr zc_grid_head">
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
								<td width="13%" rowspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									单位名称
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
									中文：
								</td>
								<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CORP_NAME_CN" id="CORP_NAME_CN"
										value="${creditCustomerCorpMap.CORP_NAME_CN }"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" readonly>
									<span class="red">*</span>
								</td>
								<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
									职工人数：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="EMPLOYEE_COUNT" id="EMPLOYEE_COUNT"
										value="${creditCustomerCorpMap.EMPLOYEE_COUNT }"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isNumber(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									英文：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CORP_NAME_EN" id="CORP_NAME_EN"
										value="${creditCustomerCorpMap.CORP_NAME_EN }"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									企业类型：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
								<select name="CORP_TYPE" id="CORP_TYPE">
								<c:forEach items="${corpTypeList}" var="item">
														<option value="${item.CODE }" <c:if test="${item.CODE eq creditCustomerCorpMap.CORP_TYPE}">selected="selected"</c:if>>
															${item.FLAG }
														</option>
												</c:forEach>
												</select>
									<!-- <select name="CORP_TYPE" id="CORP_TYPE" class="txtk"
										onblur="lnOut(this);valueIsNotNull(this);">
										<c:choose>
											<c:when test="${empty creditCustomerCorpMap}">
												<c:forEach items="${corpTypeList}" var="item">
													<option value="${item.CODE }">
														${item.FLAG }
													</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${corpTypeList}" var="item">
													<c:if
														test="${item.CODE eq creditCustomerCorpMap.CORP_TYPE}">
														<option value="${item.CODE }" selected="selected">
															${item.FLAG }
														</option>
													</c:if>
													<c:if
														test="${item.CODE ne creditCustomerCorpMap.CORP_TYPE}">
														<option value="${item.CODE }">
															${item.FLAG }
														</option>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</select> -->
								</td>
							</tr>
							<!-- 2012/04/23 Yang Yun 增加是否上市，经营者在本业的经验（年）**********************  -->
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									本业从业经验：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<select style="width: 230px;" class="txtk" name="experience">
										<option value="0" <c:if test="${creditCustomerCorpMap.EXPERIENCE eq 0}">selected="selected"</c:if>>0~5年</option>
										<option value="5" <c:if test="${creditCustomerCorpMap.EXPERIENCE eq 5}">selected="selected"</c:if>>5(含)~10年</option>
										<option value="10" <c:if test="${creditCustomerCorpMap.EXPERIENCE eq 10}">selected="selected"</c:if>>10(含)~15年</option>
										<option value="15" <c:if test="${creditCustomerCorpMap.EXPERIENCE eq 15}">selected="selected"</c:if>>15(含)及以上</option>
									</select>
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									是否上市：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<select name="isListed" style="width: 100px" class="txtk">
										<option value="N" <c:if test="${creditCustomerCorpMap.ISLISTED eq 'N'}">selected="selected"</c:if>>否</option>
										<option value="Y" <c:if test="${creditCustomerCorpMap.ISLISTED eq 'Y'}">selected="selected"</c:if>>是</option>
									</select>
									<span class="red">*</span>
								</td>
							</tr>
							<!-- ***************************************************************************** -->
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									营业执照注册号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="BUSINESS_LICENCE_CODE"
										id="BUSINESS_LICENCE_CODE"
										value="${creditCustomerCorpMap.BUSINESS_LICENCE_CODE }"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									营业期限：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="BUSINESS_TIME_LIMIT"
										id="BUSINESS_TIME_LIMIT"
										value="${creditCustomerCorpMap.BUSINESS_TIME_LIMIT }"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									组织机构代码证号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ORGANIZATION_CODE_CERTIFICATE"
										id="ORGANIZATION_CODE_CERTIFICATE"
										value="${creditCustomerCorpMap.ORGANIZATION_CODE_CERTIFICATE }"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" readonly>
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年检情况：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ROAD_WORTHINESS_INSPECTION"
										id="ROAD_WORTHINESS_INSPECTION"
										value="${creditCustomerCorpMap.ROAD_WORTHINESS_INSPECTION }"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
										<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									税务编号：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TAX_CODE"
										id="TAX_CODE"
										value="${creditCustomerCorpMap.TAX_CODE }"
										style="width: 230px;" class="txtk" >
								</td> 
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									税务登记号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TAX_REGISTRATION_NUMBER"
										id="TAX_REGISTRATION_NUMBER"
										value="${creditCustomerCorpMap.TAX_REGISTRATION_NUMBER }"
										style="width: 230px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									成立日期：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="INCORPORATING_DATE"
										id="INCORPORATING_DATE2"
										value="<fmt:formatDate value="${creditCustomerCorpMap.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/> "
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									注册资本(千元)：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="REGISTERED_CAPITAL"
										id="REGISTERED_CAPITAL"
										value="${creditCustomerCorpMap.REGISTERED_CAPITAL }"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isDouble(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									实收资本(千元)：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL"
										id="CONTRIBUTED_CAPITAL"
										value="${creditCustomerCorpMap.CONTRIBUTED_CAPITAL }"
										style="width: 100px" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);isDouble(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									公司注册地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="REGISTERED_OFFICE_ADDRESS"
										id="REGISTERED_OFFICE_ADDRESS"
										value="${creditCustomerCorpMap.REGISTERED_OFFICE_ADDRESS }"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									公司常用地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="COMMON_OFFICE_ADDRESS"
										id="COMMON_OFFICE_ADDRESS"
										value="${creditCustomerCorpMap.COMMON_OFFICE_ADDRESS }"
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
										value="${creditCustomerCorpMap.MANAGING_SCOPE }"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									公司电话：<span class="red">*</span>
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TELEPHONE" id="TELEPHONE"
										value="${creditCustomerCorpMap.TELEPHONE }"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'">
								 例：(010)-82899093或01082899093</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									传真：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="FAX" id="FAX"
										value="${creditCustomerCorpMap.FAX }" style="width: 200px;"
										class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									网址：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="URL" id="URL"
										value="${creditCustomerCorpMap.URL }" style="width: 200px;"
										class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="POSTCODE" id="POSTCODE"
										value="${creditCustomerCorpMap.POSTCODE }"
										style="width: 200px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td height="80" class="ui-widget-content jqgrow ui-row-ltr">
									备注：
								</td>
								<td colspan="7" class="ui-widget-content jqgrow ui-row-ltr">
									<c:choose>
										<c:when test="${empty creditCustomerCorpMap}">
											<textarea name="MEMO" id="MEMO"
												style="width: 700px; height: 60px; font-size: 12px"
												class="txtk"
												onFocus="this.className='txtklan';selectContent(this);"
												onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"></textarea>
										</c:when>
										<c:otherwise> 
												<textarea name="MEMO" id="MEMO"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk"
													onFocus="this.className='txtklan';selectContent(this);"
													onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">${creditCustomerCorpMap.MEMO}</textarea>
										 </c:otherwise>
									</c:choose>   
								</td>
							</tr>
							<tr><td colspan="6"><input type="button" value="保存到担保人信息(自然人)" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="saveNatural()"></td></tr>
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
									<input type="text" name="LEGAL_PERSON" id="LEGAL_PERSON"
										value="${creditCustomerCorpMap.LEGAL_PERSON }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
									<span class="red">*</span>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 <select id="LEGAL_IDCARD_FLAG" name="LEGAL_IDCARD_FLAG" style="text-align :  left" onchange="chanCard('1');">
											<c:choose>
											<c:when test="${empty creditCustomerCorpMap.LEGAL_IDCARD_FLAG }">
												<c:forEach items="${IDCardTypeList}" var="item">
													<option value="${item.CODE }">
														${item.FLAG }
													</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${IDCardTypeList}" var="item">
													<c:if test="${item.CODE eq creditCustomerCorpMap.LEGAL_IDCARD_FLAG}">
														<option value="${item.CODE }" selected="selected">
															${item.FLAG }
														</option>
													</c:if>
													<c:if test="${item.CODE ne creditCustomerCorpMap.LEGAL_IDCARD_FLAG}">
														<option value="${item.CODE }">
															${item.FLAG }
														</option>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
								  </select> 
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr"   <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG ne 0}"> style="display:none"  </c:if>     >
									  <input type="hidden" style="width: 200px;" name="LEGAL_ID_CARD" id="LEGAL_ID_CARD1" value="${creditCustomerCorpMap.LEGAL_ID_CARD }" >  
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr"  <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 0}">style="display:none" </c:if>   >
									  <input type="text" style="width: 200px;" name="LEGAL_ID_CARD" id="LEGAL_ID_CARD2"  value="${creditCustomerCorpMap.LEGAL_ID_CARD }" >  
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_TELEPHONE" id="LEGAL_TELEPHONE"
										value="${creditCustomerCorpMap.LEGAL_TELEPHONE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_POSTCODE" id="LEGAL_POSTCODE"
										value="${creditCustomerCorpMap.LEGAL_POSTCODE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									常住地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_HOME_ADDRESS"
										id="LEGAL_HOME_ADDRESS"
										value="${creditCustomerCorpMap.LEGAL_HOME_ADDRESS }"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_MOBILE_NUMBER1"
										id="LEGAL_MOBILE_NUMBER1"
										value="${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER1 }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="LEGAL_MOBILE_NUMBER2"
										id="LEGAL_MOBILE_NUMBER2"
										value="${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER2 }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
								</td>
							</tr>
							<tr>
								<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									实
									<br />
									际
									<br />
									经
									<br />
									营
									<br />
									者
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									实际经营者：<input type="button" name="button" id="button" value="法人" class="ui-state-default ui-corner-all"
										onclick="copyLEGALtoTC();">
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_NAME" id="TC_NAME"
										value="${trueContact.NAME }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
									<span class="red">*</span>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 <select id="CARD_FLAG" name="CARD_FLAG" style="text-align :  left" onchange="chanCard('3');">
											<c:choose>
											<c:when test="${empty trueContact.CARD_FLAG }">
												<c:forEach items="${IDCardTypeList}" var="item">
													<option value="${item.CODE }">
														${item.FLAG }
													</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${IDCardTypeList}" var="item">
													<c:if test="${item.CODE eq trueContact.CARD_FLAG}">
														<option value="${item.CODE }" selected="selected">
															${item.FLAG }
														</option>
													</c:if>
													<c:if test="${item.CODE ne trueContact.CARD_FLAG}">
														<option value="${item.CODE }">
															${item.FLAG }
														</option>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
								  </select> 
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr"   <c:if test="${not empty trueContact.CARD_FLAG and trueContact.CARD_FLAG != 0}"> style="display:none"  </c:if>     >
									  <input type="hidden" style="width: 200px;" name="CARD_ID" id="CARD_ID1" value="${trueContact.CARD_ID }" />  
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr"  <c:if test="${empty trueContact.CARD_FLAG or trueContact.CARD_FLAG eq 0}">style="display:none" </c:if>   >
									  <input type="text" style="width: 200px;" name="CARD_ID" id="CARD_ID2"  value="${trueContact.CARD_ID }" />  
								</td>
								
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_TELEPHONE" id="TC_TELEPHONE"
										value="${trueContact.TELEPHONE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'" />
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_POSTCODE" id="TC_POSTCODE"
										value="${trueContact.POSTCODE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'" />
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									常住地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_ADDRESS"
										id="TC_ADDRESS"
										value="${trueContact.ADDRESS }"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_PHONE1"
										id="TC_PHONE1"
										value="${trueContact.PHONE1 }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'" />
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_PHONE2"
										id="TC_PHONE2"
										value="${trueContact.PHONE2 }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'" />
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									EMAIL：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_EMAIL" id="TC_EMAIL"
										value="${trueContact.EMAIL }"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									MSN：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TC_MSN" id="TC_MSN"
										value="${trueContact.MSN }"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
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
<%--2011/12/21 Yang Yun Update the linkman info to automatic and readonly. Start--%>
									<%-- <input type="button" name="button" id="button" value="法人" class="ui-state-default ui-corner-all"
										onclick="copyLEGAL();"> --%>
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_MAN">${linkMan.LINK_NAME }</span>
									<%-- <input type="text" name="LINK_MAN" id="LINK_MAN"
										value="${creditCustomerCorpMap.LINK_MAN }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
									<span class="red">*</span>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--%>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
								 <%-- <select id="LINK_IDCARD_FLAG" name="LINK_IDCARD_FLAG" style="text-align :  left" onchange="chanCard('2');">     
											 <c:choose>
											<c:when test="${empty creditCustomerCorpMap.LINK_IDCARD_FLAG }">
												<c:forEach items="${IDCardTypeList}" var="item">
													<option value="${item.CODE }">
														${item.FLAG }
													</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${IDCardTypeList}" var="item">
													<c:if
														test="${item.CODE eq creditCustomerCorpMap.LINK_IDCARD_FLAG}">
														<option value="${item.CODE }" selected="selected">
															${item.FLAG }
														</option>
													</c:if>
													<c:if
														test="${item.CODE ne creditCustomerCorpMap.LINK_IDCARD_FLAG}">
														<option value="${item.CODE }">
															${item.FLAG }
														</option>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
								 </select>--%>
								身份证号：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
								     <input type="hidden" style="width: 200px;" name="LINK_ID_CARD"   id="LINK_ID_CARD1"   value="${linkMan.LINK_IDCARD }" > 
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_ID_CARD2">${linkMan.LINK_IDCARD }</span>
								    <%-- <input type="text" style="width: 200px;" name="LINK_ID_CARD" id="LINK_ID_CARD2" value="${creditCustomerCorpMap.LINK_ID_CARD }" > --%>  
								</td>
							 
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_TELEPHONE">${linkMan.LINK_PHONE }</span>
									<%-- <input type="text" name="LINK_TELEPHONE" id="LINK_TELEPHONE"
										value="${creditCustomerCorpMap.LINK_TELEPHONE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'"> --%>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									职务：
								</td>
								<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_JOB">${linkMan.LINK_DUTY }</span>
									<%-- <input type="text" name="LINK_JOB" id="LINK_JOB"
										value="${creditCustomerCorpMap.LINK_JOB }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"> --%>
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td width="21%"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_POSTCODE">${linkMan.LINK_ZIP }</span>
									<%-- <input type="text" name="LINK_POSTCODE" id="LINK_POSTCODE"
										value="${creditCustomerCorpMap.LINK_POSTCODE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'"> --%>
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮寄地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_MAILING_ADDRESS">${linkMan.LINK_WORK_ADDRESS }</span>
									<%-- <input type="text" name="LINK_MAILING_ADDRESS"
										id="LINK_MAILING_ADDRESS"
										value="${creditCustomerCorpMap.LINK_MAILING_ADDRESS }"
										style="width: 650px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"> --%>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_MOBILE_NUMBER1">${linkMan.LINK_MOBILE }</span>
									<%-- <input type="text" name="LINK_MOBILE_NUMBER1"
										id="LINK_MOBILE_NUMBER1"
										value="${creditCustomerCorpMap.LINK_MOBILE }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'"> --%>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_MOBILE_NUMBER2">${creditCustomerCorpMap.LINK_MOBILE_NUMBER2 }</span>
									<%-- <input type="text" name="LINK_MOBILE_NUMBER2"
										id="LINK_MOBILE_NUMBER2"
										value="${creditCustomerCorpMap.LINK_MOBILE_NUMBER2 }"
										style="width: 100px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'"> --%>
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									EMAIL：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_EMAIL">${linkMan.LINK_EMAIL }</span>
									<%-- <input type="text" name="LINK_EMAIL" id="LINK_EMAIL"
										value="${creditCustomerCorpMap.LINK_EMAIL }"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"> --%>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									MSN：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									<span id="LINK_MSN">${creditCustomerCorpMap.LINK_MSN }</span>
									<%-- <input type="text" name="LINK_MSN" id="LINK_MSN"
										value="${creditCustomerCorpMap.LINK_MSN }"
										style="width: 150px;" class="txtk"
										onFocus="this.className='txtklan';selectContent(this);"
										onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"> --%>
								</td>
								<%--2011/12/21 Yang Yun Add a link for jump to edit link man page --%>
								<td>
									<input type="button" onclick="location.href = '${ctx }/servlet/defaultDispatcher?__action=customer.updateCust&cust_id=${linkMan.CUST_ID }&cust_type=${linkMan.CUST_TYPE }';" 
										class="ui-state-default ui-corner-all" value="编辑联系人"/>
								</td>
								<%--2011/12/21 Yang Yun Add a link for jump to edit link man page --%>
<%--2011/12/21 Yang Yun Update the linkman info to automatic and readonly. end--%>
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
									<c:choose>
										<c:when test="${empty creditCustomerCorpMap}">
											<textarea name="OTHER_INFO" id="OTHER_INFO"
												style="width: 700px; height: 60px; font-size: 12px"
												class="txtk"
												onFocus="this.className='txtklan';selectContent(this);"
												onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'"></textarea>
										</c:when>
										<c:otherwise>
											<textarea name="OTHER_INFO" id="OTHER_INFO" 
												style="width: 700px; height: 60px; font-size: 12px"
												class="txtk"
												onFocus="this.className='txtklan';selectContent(this);"
												onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">${creditCustomerCorpMap.OTHER_INFO}</textarea>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					 </c:if>
					 <c:if test="${creditMap.CUST_TYPE eq 0 }">
					 <table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">  
					 	<tr>
					 		<td colspan="4"><input type="button" value="保存到担保人信息(自然人)" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="saveNatural2()"></td>
					 	</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									承租人姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="natu_name" id="natu_namen"
										value="${creditCustomerCorpMap.NATU_NAME } ${creditCustomerCorpMap.CORP_NAME_CN }"
										style="width: 200px;" class="txtk"
										 />
									<span class="red">*</span>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 性别：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="sex" id="sex"
										value="${creditCustomerCorpMap.SEX }${creditCustomerCorpMap.NATU_GENDER }"
										style="width: 100px;" class="txtk" />
								</td>
								
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
								<select id="ID_CARD_TYPE" name="ID_CARD_TYPE" onchange="changeIdCardTypes(this.value);">
									<option value="1" <c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 1 }">selected='selected'</c:if>>身份证号码</option>
		                    		<option value="2" <c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 2 }">selected='selected'</c:if>>港澳台通行证</option>
		                    		<option value="3" <c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 3 }">selected='selected'</c:if>>护照</option>
		                    		<option value="4" <c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 4 }">selected='selected'</c:if>>其他</option>
								</select>		 
							</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" id="showIdTd1" style="display: none;">
								<input type="hidden" name="natu_idcard1" id="nat_idcard" 
								value="${creditCustomerCorpMap.NATU_IDCARD}" ></td>
								<td class="ui-widget-content jqgrow ui-row-ltr" id="showIdTd2" style="display: none;">
								<input type="text" name="natu_idcard2" id="nat_idcard2" 
								value="${creditCustomerCorpMap.NATU_IDCARD}" style="width: 200px;" ></td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
								<!--  	<input type="text" name="age" id="nat_idcardAge"
									style="width: 100px;" class="txtk" value="${creditCustomerCorpMap.NATU_AGE }${creditCustomerCorpMap.AGE } ">
								--><input type="text" name="age" id="nat_idcardAges"
									style="width: 100px;" class="txtk" value="${creditCustomerCorpMap.NATU_AGE }${creditCustomerCorpMap.AGE } ">
								
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									家庭电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="home_phone" id="home_phone"
										value="${creditCustomerCorpMap.NATU_PHONE }${creditCustomerCorpMap.HOME_PHONE } "
										style="width: 150px;" class="txtk"
										 />例：(010)-82899093或01082899093
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="mobile_phone" id="mobile_phone"
										value="${creditCustomerCorpMap.NATU_MOBILE }${creditCustomerCorpMap.MOBILE_PHONE }"
										style="width: 150px;" class="txtk"
										 />
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									传真：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="natu_fax" id="natu_fax"
										value="${creditCustomerCorpMap.FAX }${creditCustomerCorpMap.NATU_FAX } "
										style="width: 150px;" class="txtk"
										 />
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="natu_zip" id="natu_zip"
										value="${creditCustomerCorpMap.NATU_ZIP }"
										style="width: 150px;" class="txtk"
										 />
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									家庭住址：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="home_addr" id="nat_idcar"
										value="${creditCustomerCorpMap.NATU_HOME_ADDRESS }${creditCustomerCorpMap.HOME_ADDR }"
										style="width: 450px;" class="txtk"
										/>
									
								</td>
							</tr>
					 
					  
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="work_unit" id="work_unit"
										value="${creditCustomerCorpMap.NATU_WORK_UNITS }${creditCustomerCorpMap.WORK_UNIT }"
										style="width: 450px;" class="txtk"
										/>
								</td>
							</tr>
					 
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									配偶姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="mate_name" id="mate_name"
										value="${creditCustomerCorpMap.NATU_MATE_NAME }${creditCustomerCorpMap.MATE_NAME }"
										style="width: 100px;" class="txtk"
										/>
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
								<!--  	<input type="text" name="mate_age" id="mate_idcardAge" style="width: 100px;" class="txtk"
										value="${creditCustomerCorpMap.MATE_AGE }">-->
									<input type="text" name="mate_age" id="mate_idcardAges" style="width: 100px;" class="txtk"
									value="${creditCustomerCorpMap.MATE_AGE }">
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									身份证号码：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" >
									<input type="hidden" name="mate_idcard" id="mate_idcard"
										value="${creditCustomerCorpMap.NATU_MATE_IDCARD }${creditCustomerCorpMap.MATE_IDCARD }">
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="mate_phone" id="mate_phone"
										value="${creditCustomerCorpMap.NATU_MATE_MOBILE }${creditCustomerCorpMap.MATE_PHONE } "
										style="width: 150px;" class="txtk"
										 />
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="mate_work_unit" id="mate_work_unit"
										value="${creditCustomerCorpMap.NATU_MATE_WORK_UNITS }${creditCustomerCorpMap.MATE_WORK_UNIT}"
										style="width: 450px;" class="txtk"
										 />
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系人：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="natu_linkman" id="natu_linkman"
										value="${creditCustomerCorpMap.LINK_NAME }${creditCustomerCorpMap.NATU_LINKMAN}"
										style="width: 150px;" class="txtk"
										 />
								</td>
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系人电话：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="linkman_phone" id="linkman_phone"
										value="${creditCustomerCorpMap.LINK_MOBILE }${creditCustomerCorpMap.LINKMAN_PHONE}"
										style="width: 150px;" class="txtk"
										 />
								</td>
							</tr>
					 </table>
					 </c:if>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>开户银行</strong>
								</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addBank(this);">添加</a>
								</td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteBank(this);">删除</a>
								</td>
							</tr>
							<c:if test="${empty corpBankAccount}">
								<tr>
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
										基本账户
										<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
											style="width: 150px;">
									</td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
										开户银行：
									</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="B_BANK_NAME" id="B_BANK_NAME"
											style="width: 150px;">
									</td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">
										账号：
									</td>
									<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"
											style="width: 150px;">
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty corpBankAccount}">
								<c:forEach items="${corpBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr>
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
												基本账户
												<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
													style="width: 150px;" value="${item.PCCBA_ID }">
											</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
												开户银行：
											</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">
												<input type="text" name="B_BANK_NAME" id="B_BANK_NAME"
													style="width: 150px;" value="${item.BANK_NAME }">
											</td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">
												账号：
											</td>
											<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
												<input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"
													style="width: 150px;" value="${item.BANK_ACCOUNT }">
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(corpBankAccount) >1}">
								<tr>
									<td   rowspan="${fn:length(corpBankAccount)}" id="bankTd" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										其他账户
									</td>
								</tr>
							</c:if>
							<c:forEach items="${corpBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="checkbox" name="check_id" id="check_id">
											开户银行：
										</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="BANK_NAME" id="BANK_NAME"
												style="width: 150px;" value="${item.BANK_NAME }">
										</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											账号：
										</td>
										<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT"
												style="width: 150px;" value="${item.BANK_ACCOUNT }">
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司股东及份额</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addShareholder();">添加</a>
								</td>
								<td width="19%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteShareholder();">删除</a>
								</td>
							</tr>
							<tr>
								<td width="3%" class="ui-widget-content jqgrow ui-row-ltr">
									 &nbsp;
								</td>
								<td width="23%"  class="ui-widget-content jqgrow ui-row-ltr">
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
							<c:set value="0" var="total"></c:set>
							<c:forEach items="${corpSharholder}" var="item">
								<tr class="ui-widget-content jqgrow ui-row-ltr"> 
									<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="checkbox" name="scheck_id" id="scheck_id0"></td>
									<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_NAME" id="HOLDER_NAME"
											style="width: 180px;" value="${item.HOLDER_NAME }"></td>
									<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_CAPITAL" id="HOLDER_CAPITAL" onchange="getTotal()" 
											style="width: 120px" value="${item.HOLDER_CAPITAL }"></td>
									<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_WAY" id="HOLDER_WAY"
											style="width: 140px;" value="${item.HOLDER_WAY }"></td>
									<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_RATE" id="HOLDER_RATE"
											style="width: 40px;" value="${item.HOLDER_RATE }">%</td>
									<td  style="text-align: center" colspan="2"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_MOME" id="HOLDER_MOME"
											style="width: 200px;" value="${item.HOLDER_MOME }"></td>
								</tr>
								<c:set value="${item.HOLDER_CAPITAL+total }" var="total"></c:set>
							</c:forEach>
							<tr>
								<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
									合计：<span id="sharHolderTotal"><fmt:formatNumber value="${total}" type="currency" /></span>
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab2">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>家庭其他成员及亲戚情况说明：（包含个人工作学习单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addShareholder2();">添加</a>
								</td>
								<td width="8%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteShareholder3();">删除</a>
								</td>
							</tr>
							<tr>
								<td width="8%"  class="ui-widget-content jqgrow ui-row-ltr">
									亲属姓名
								</td>
								<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
									与承租人关系
								</td>
								<td width="15%"class="ui-widget-content jqgrow ui-row-ltr">
									联系方式
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									家庭住址
								</td>
								<td width="16%"  class="ui-widget-content jqgrow ui-row-ltr">
									备注
								</td>
								<td width="8%"  class="ui-widget-content jqgrow ui-row-ltr">
									操作
								</td>
							</tr>
							<c:forEach items="${natufam}" var="item">
								<tr class="ui-widget-content jqgrow ui-row-ltr"> 
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="fam_name"  size="10"
											  value="${item.FAM_NAME }"></td>
									<td    class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="fam_relation"  size="10"
											  value="${item.FAM_RELATION }"></td>
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="fam_link"   size="15"
											  value="${item.FAM_LINK }"></td>
									<td    class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="fam_addr"   size="60"
											  value="${item.FAM_ADDR }"></td>
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="remark"   size="17"
											  value="${item.REMARK }"></td>
									<td    class="ui-widget-content jqgrow ui-row-ltr"><img name="devill" onclick="deleteShareholder3();" src="../images/u103.gif"> </td>
								
								</tr>
							</c:forEach>
						</table></c:if>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="projectTab">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick='addProject();'>添加</a>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick='deleteProject();'>删除
													&nbsp; &nbsp;</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${corpProject}" var="item" varStatus="status">
								<tr>
									<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="pcheck_id" id="pcheck_id0"
											value="${status.count }">
										项目名称：
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="PROJECT_NAME" id="PROJECT_NAME"
											style="width: 200px;" value="${item.PROJECT_NAME }">
									</td>
								</tr>
								<tr>
									<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
										&nbsp;&nbsp;&nbsp; 起止时间：
										<input type="hidden" name="fforDelete"
											id="fforDelete${status.count }">
									</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="PROJECT_DATE" id="PROJECT_DATE"
											style="width: 150px;" value="${item.PROJECT_DATE }">
									</td>
								</tr>
								<tr>
									<td width="19%" height="50" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
										<input type="hidden" name="forDelete"
											id="forDelete${status.count }">
									</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr">
										<textarea name="PROJECT_CONTENT" id="PROJECT_CONTENT"
											style="width: 500px; height: 50px; font-size: 12px"
											class="txtk">${item.PROJECT_CONTENT }</textarea>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td align="center" colspan="2">
									<input type="button" name="sub" value="保  存"
										 class="ui-state-default ui-corner-all" onclick="submitCorpForm();">
									<input type="reset" name="res" value="重  置"  class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab3">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>社会关系情况说明：（包含个人身份、工作单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addShareholder3();">添加</a>
								</td>
								<td width="8%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="">删除</a>
								</td>
							</tr>
							<tr>
								<td width="9%"  class="ui-widget-content jqgrow ui-row-ltr">
									 姓名
								</td>
								<td width="30%"  class="ui-widget-content jqgrow ui-row-ltr">
									工作单位
								</td>
								<td width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									职务
								</td>
								<td width="18%"class="ui-widget-content jqgrow ui-row-ltr">
									联系方式
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									备注
								</td>
								<td  width="8%"  class="ui-widget-content jqgrow ui-row-ltr">
									操作
								</td>
							</tr>
							<c:forEach items="${natusoc}" var="item">
								<tr class="ui-widget-content jqgrow ui-row-ltr"> 
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="soci_name"  size="10"
											  value="${item.SOCI_NAME }"></td>
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="soci_work"  size="42"
											  value="${item.SOCI_WORK }"></td>
									<td     class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="soci_position"  size="12"
											  value="${item.SOCI_POSITION }"></td>
									<td   class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="soci_link" 
											  value="${item.SOCI_LINK }"></td>
									<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="soci_remark" 
											  value="${item.SOCI_REMARK }"></td>
									<td  class="ui-widget-content jqgrow ui-row-ltr">  <img name="devill" onclick="deleteShareholder3();" src="../images/u103.gif"> </td>
								</tr> 
							</c:forEach>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
							<tr> 
								<td align="center" style="text-align:center" colspan="2">
									<input type="button" name="sub" value="保  存"
										 class="ui-state-default ui-corner-all" onclick="submitCorpForm33();">
									<input type="reset" name="res" value="重  置"  class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table></c:if>
					</td>
				</tr>
			</table>
			</div>
</div>
</div>
		</form>
	</body>
<script type="text/javascript">
changeIdCardTypes(${creditCustomerCorpMap.ID_CARD_TYPE});
</script>	
</html>
