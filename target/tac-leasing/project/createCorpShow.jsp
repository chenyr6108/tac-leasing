<%@ page language="java" pageEncoding="UTF-8"%>
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
		<td>${projectMap.CORP_ORAGNIZATION_CODE }</td>
		<td>客户级别 </td>
		<td>&nbsp;<c:forEach items="${custLevel}" var="item"><c:choose><c:when test="${item.CODE eq corpMap.CUST_LEVEL}">${item.FLAG }</c:when></c:choose></c:forEach></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>承租人所在省市</td>
		<td>${projectMap.PROVINCENAME }${projectMap.CITYNAME }&nbsp</td>
		<td>企业性质 </td>
		<td>${corpMap.CORP_ENTERPRISES_PROPERTY }&nbsp</td>
		</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>成立日期</td>
		<td>${corpMap.CORP_SETUP_DATE }&nbsp</td>
		<td>有效期 </td>
		<td>${corpMap.CORP_PERIOD_VALIDITY }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>注册资本</td>
		<td>${corpMap.CORP_REGISTE_CAPITAL }&nbsp元</td>
		<td>实收资本 </td>
		<td>${corpMap.CORP_PAICLUP_CAPITAL }&nbsp元</td>
	</tr>				
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>营业执照注册号 </td>
		<td>${corpMap.CORP_BUSINESS_LICENSE }&nbsp</td>
		<td>税务登记号</td>
		<td>${corpMap.CORP_TAX_CODE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司邮编</td>
		<td colspan="3">${corpMap.CORP_COMPANY_ZIP }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>注册地址 </td>
		<td colspan="3">${corpMap.CORP_REGISTE_ADDRESS }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司办公地址</td>
		<td colspan="3">${corpMap.CORP_WORK_ADDRESS }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>经营范围 </td>
		<td colspan="3">${corpMap.CORP_BUSINESS_RANGE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>公司网址</td>
		<td colspan="3">${corpMap.CORP_COMPANY_WEBSITE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>其他信息</td>
		<td colspan="3">${corpMap.CORP_OTHER_MASSAGE }&nbsp</td>
	</tr>
	<tr>
		<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			法<br />人<br />信<br />息
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			法定代表人 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${corpMap.CORP_HEAD_SIGNATURE }&nbsp
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			法人身份证号码 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<input type="hidden" name="CORP_HS_IDCARD" id="CORP_HS_IDCARD" value="${corpMap.CORP_HS_IDCARD }" />
		</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>法人联系方式 </td>
		<td colspan="3">${corpMap.CORP_HS_LINK_MODE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>法人代表住址</td>
		<td colspan="3">${corpMap.CORP_HS_HOME_ADDRESS }&nbsp</td>
	</tr>
</table>