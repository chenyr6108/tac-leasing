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
		<td>&nbsp;<c:forEach items="${custLevel}" var="item"><c:choose><c:when test="${item.CODE eq natuMap.CUST_LEVEL}">${item.FLAG }</c:when></c:choose></c:forEach></td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>承租人所在省市</td>
		<td>${projectMap.PROVINCENAME }${projectMap.CITYNAME }&nbsp</td>
		<td>邮编</td>
		<td>${natuMap.NATU_ZIP }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>性别</td>
		<td>${natuMap.NATU_GENDER }&nbsp;</td>
		<td>年龄</td>
		<td>${natuMap.NATU_AGE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>手机号码</td>
		<td>${natuMap.NATU_MOBILE }&nbsp</td>
		<td>联系电话(家庭座机)</td>
		<td>${natuMap.NATU_PHONE }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>身份证地址</td>
		<td>${natuMap.NATU_IDCARD_ADDRESS }&nbsp</td>
		<td>家庭常住地址</td>
		<td>${natuMap.NATU_HOME_ADDRESS }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>工作单位</td>
		<td>${natuMap.NATU_WORK_UNITS }&nbsp</td>
		<td>单位地址</td>
		<td>${natuMap.NATU_WORK_ADDRESS }&nbsp</td>
	</tr>
	<tr>
		<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
			配<br /> 偶 <br />信<br />息
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			配偶姓名
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			${natuMap.NATU_MATE_NAME}&nbsp
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
		<td>${natuMap.NATU_MATE_MOBILE }&nbsp</td>
		<td>身份证地址</td>
		<td>${natuMap.NATU_MATE_IDCARD_ADDRESS }&nbsp</td>
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td>工作单位</td>
		<td>${natuMap.NATU_MATE_WORK_UNITS }&nbsp</td>
		<td>单位地址</td>
		<td>${natuMap.NATU_MATE_WORK_ADDRESS }&nbsp</td>
	</tr>
</table>