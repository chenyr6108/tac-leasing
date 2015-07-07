<%@ page language="java" pageEncoding="UTF-8"%>
    <script type="text/javascript">
		$(function (){
			$("#CORP_SETUP_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
	</script> 
			<script type="text/javascript">
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('CORP_HS_IDCARD')
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
			getCitys = function(){
				provinceId=$("#province_id").val();
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
					dataType:'json',
					success:function(dataBack){ 
						 $('#city_id option').each(function(){  
						     if( $(this).val() != '-1'){  
						         $(this).remove();  
						     }  
						 });
						for(i=0;i<dataBack.citys.length;i++){
							$("#city_id").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
						}
					}
				});
			}
		</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;" colspan="5"> 
			<b>承租人基本信息</b>
		</td>
	</tr>
	<tr>
		<td rowspan="12" width="5%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			企<br /> 业<br /> 基<br /> 本<br /> 情<br /> 况
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>组织机构代码号 </td>
		<td><input type="text" name="CORP_ENTERPRISES_PROPERTY" id="CORP_ENTERPRISES_PROPERTY" value="${projectMap.CORP_ORAGNIZATION_CODE }"></td>
		<td>客户级别 </td>
		<td><select id="CUST_LEVEL" name="CUST_LEVEL"> 
				<c:forEach items="${custLevel}" var="item">
					<option value="${item.CODE }">
						${item.FLAG }
					</option>
				</c:forEach>
			</select></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>承租人所在省市</td>
		<td><select id="province_id" name="PROVINCE_ID" onchange="getCitys();">
						 	<option value="-1" <c:if test="${projectMap.PROVINCE_ID eq -1}"> selected="selected"</c:if>>-请选择省份-</option>
						 	<c:forEach items="${provinces}" var="item">
						 		<option value="${item.ID }" <c:if test="${projectMap.PROVINCE_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach></select><select id="city_id" name="CITY_ID"><option value="-1" selected="selected">-请选择城市-</option>
						 	<c:forEach items="${citys}" var="item">
						 		<option value="${item.ID }" <c:if test="${projectMap.CITY_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach> 
						 </select></td>
		<td>企业性质  </td>
		<td><input type="text" name="CORP_ENTERPRISES_PROPERTY" id="CORP_ENTERPRISES_PROPERTY" value="${corpMap.CORP_ENTERPRISES_PROPERTY }"></td>
		</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>成立日期</td>
		<td><input type="text" name="CORP_SETUP_DATE" id="CORP_SETUP_DATE" value="${corpMap.CORP_SETUP_DATE }" readonly="readonly"></td>
		<td>有效期 </td>
		<td><input type="text" name="CORP_PERIOD_VALIDITY" id="CORP_PERIOD_VALIDITY" value="${corpMap.CORP_PERIOD_VALIDITY }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>注册资本</td>
		<td><input type="text" name="CORP_REGISTE_CAPITAL" id="CORP_REGISTE_CAPITAL" value="${corpMap.CORP_REGISTE_CAPITAL }">元</td>
		<td>实收资本 </td>
		<td><input type="text" name="CORP_PAICLUP_CAPITAL" id="CORP_PAICLUP_CAPITAL" value="${corpMap.CORP_PAICLUP_CAPITAL }">元</td>
	</tr>				
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>营业执照注册号 </td>
		<td><input type="text" name="CORP_BUSINESS_LICENSE" id="CORP_BUSINESS_LICENSE" value="${corpMap.CORP_BUSINESS_LICENSE }"></td>
		<td>税务登记号</td>
		<td><input type="text" name="CORP_TAX_CODE" id="CORP_TAX_CODE" value="${corpMap.CORP_TAX_CODE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司邮编</td>
		<td colspan="3"><input type="text" name="CORP_COMPANY_ZIP" id="CORP_COMPANY_ZIP" value="${corpMap.CORP_COMPANY_ZIP }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>注册地址 </td>
		<td colspan="3"><input type="text" size="50" name="CORP_REGISTE_ADDRESS" id="CORP_REGISTE_ADDRESS" value="${corpMap.CORP_REGISTE_ADDRESS }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司办公地址</td>
		<td colspan="3"><input type="text" size="50" name="CORP_WORK_ADDRESS" id="CORP_WORK_ADDRESS" value="${corpMap.CORP_WORK_ADDRESS }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>经营范围 </td>
		<td colspan="3"><input type="text" size="50" name="CORP_BUSINESS_RANGE" id="CORP_BUSINESS_RANGE" value="${corpMap.CORP_BUSINESS_RANGE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司网址</td>
		<td colspan="3"><input type="text" size="50" name="CORP_COMPANY_WEBSITE" id="CORP_COMPANY_WEBSITE" value="${corpMap.CORP_COMPANY_WEBSITE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>其他信息</td>
		<td colspan="3"><input type="text" size="50" name="CORP_OTHER_MASSAGE" id="CORP_OTHER_MASSAGE" value="${corpMap.CORP_OTHER_MASSAGE }"></td>
	</tr>
	<tr>
		<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			法<br />人<br />信<br />息
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			法定代表人 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="CORP_HEAD_SIGNATURE" id="CORP_HEAD_SIGNATURE" value="${corpMap.CORP_HEAD_SIGNATURE }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			法人身份证号码 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="CORP_HS_IDCARD" id="CORP_HS_IDCARD" value="${corpMap.CORP_HS_IDCARD }">
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>法人联系方式 </td>
		<td colspan="3"><input type="text" name="CORP_HS_LINK_MODE" id="CORP_HS_LINK_MODE" value="${corpMap.CORP_HS_LINK_MODE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>法人代表住址</td>
		<td colspan="3"><input type="text" size="50" name="CORP_HS_HOME_ADDRESS" id="CORP_HS_HOME_ADDRESS" value="${corpMap.CORP_HS_HOME_ADDRESS }"></td>
	</tr>
</table>