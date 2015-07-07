<%@ page language="java" pageEncoding="UTF-8"%>
			<script type="text/javascript">
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('NATU_IDCARD'),
					idCard: new IdCard('NATU_MATE_IDCARD'),
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
		<td colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
			<b>承租人基本信息</b>
		</td>
	</tr>
	<tr>
		<td rowspan="7" width="5%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			人<br /> 员<br /> 基<br /> 本<br /> 情<br /> 况
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>身份证号码</td>
		<td><input type="hidden" name="NATU_IDCARD" id="NATU_IDCARD" value="${projectMap.NATU_IDCARD }" /></td>
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
		<td>邮编</td>
		<td><input type="text" name="NATU_ZIP" id="NATU_ZIP" value=""></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>性别</td>
		<td><input type="radio" name="NATU_GENDER" value="男" <c:if test="${natuMap.NATU_GENDER eq '男'}">checked="checked"</c:if> >男<input type="radio" name="NATU_GENDER" value="女" <c:if test="${natuMap.NATU_GENDER eq '女'}">checked="checked"</c:if>>女</td>
		<td>年龄</td>
		<td><input type="text" name="NATU_AGE" id="NATU_AGE" value="${natuMap.NATU_AGE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>手机号码</td>
		<td><input type="text" name="NATU_MOBILE" id="NATU_MOBILE" value="${natuMap.NATU_MOBILE }"></td>
		<td>联系电话(家庭座机)</td>
		<td><input type="text" name="NATU_PHONE" id="NATU_PHONE" value="${natuMap.NATU_PHONE }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>身份证地址</td>
		<td><input type="text" name="NATU_IDCARD_ADDRESS" id="NATU_IDCARD_ADDRESS" value="${natuMap.NATU_IDCARD_ADDRESS }"></td>
		<td>家庭常住地址</td>
		<td><input type="text" name="NATU_HOME_ADDRESS" id="NATU_HOME_ADDRESS" value="${natuMap.NATU_HOME_ADDRESS }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>工作单位</td>
		<td><input type="text" name="NATU_WORK_UNITS" id="NATU_WORK_UNITS" value="${natuMap.NATU_WORK_UNITS }"></td>
		<td>单位地址</td>
		<td><input type="text" name="NATU_WORK_ADDRESS" id="NATU_WORK_ADDRESS" value="${natuMap.NATU_WORK_ADDRESS }"></td>
	</tr>
	<tr>
		<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			配<br /> 偶 <br />信<br />息
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			配偶姓名
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" name="NATU_MATE_NAME" id="NATU_MATE_NAME" value="${natuMap.NATU_MATE_NAME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			身份证号码
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="NATU_MATE_IDCARD" id="NATU_MATE_IDCARD" value="${natuMap.NATU_MATE_IDCARD }">
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>手机号码</td>
		<td><input type="text" name="NATU_MATE_MOBILE" id="NATU_MATE_MOBILE" value="${natuMap.NATU_MATE_MOBILE }"></td>
		<td>身份证地址</td>
		<td><input type="text" name="NATU_MATE_IDCARD_ADDRESS" id="NATU_MATE_IDCARD_ADDRESS" value="${natuMap.NATU_MATE_IDCARD_ADDRESS }"></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>工作单位</td>
		<td><input type="text" name="NATU_MATE_WORK_UNITS" id="NATU_MATE_WORK_UNITS" value="${natuMap.NATU_MATE_WORK_UNITS }"></td>
		<td>单位地址</td>
		<td><input type="text" name="NATU_MATE_WORK_ADDRESS" id="NATU_MATE_WORK_ADDRESS" value="${natuMap.NATU_MATE_WORK_ADDRESS }"></td>
	</tr>
</table>