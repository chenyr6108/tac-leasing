<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>公司管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/department/js/companyManage.js"></script>	
		<script type="text/javascript" src="${ctx}/common/js/idCard.js" ></script>
		<script type="text/javascript" src="tab_data/tab.js"></script>
        <link rel="stylesheet" type="text/css" href="${ctx }/common/css/tab.css">
        <link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<script type="text/javascript"> 
		$(function (){
			$("#INCORPORATING_DATE").datepicker($.datepicker.regional['zh-CN']);
		});	
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('LEGAL_ID_CARD')
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
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">	
			<input type="hidden" name="__action" value="companyManage.create">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;公司管理-公司基本信息</span>
			</div>   
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
           <div class="ui-state-default ui-jqgrid-hdiv ">       
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
			        <td colspan="3" align="right">公司级别：</td>
			        <td colspan="4"><input type="radio" name="type" value="1" checked="checked" onClick="createParentCompanyDisplay(this)">总公司	<input type="radio" name="type" value="2" onClick="createParentCompanyDisplay(this)">分公司</td>	
			    </tr>
			    <tr id="parentList" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
			    	<td colspan="3" align="right">请选择总公司：</td>						    
					<td colspan="4" align="left"><select id="PARENT_ID" name="PARENT_ID"><option value="0">------请选择总公司------</option><c:forEach items="${parentCompany}" var="parentCompany"><option value="${parentCompany.DECP_ID }">${parentCompany.DECP_NAME_CN }</option></c:forEach></select></td>									    
			    </tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="3" align="right">排序：</td>
					<td colspan="4"><input id="ORDER" name="ORDER"></td>
				</tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td width="3%" rowspan="11">公<br>司<br>基<br>本<br>信<br>息</td>
			    <td width="9%" rowspan="3">单位名称</td>
			    <td width="6%">中文：</td>
			    <td colspan="4"><input type="text" name="DECP_NAME_CN"  id="DECP_NAME_CN" style="width:400px;"></td>
		      </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td width="6%">英文：</td>
			    <td colspan="4"><input type="text" name="DECP_NAME_EN"  id="DECP_NAME_EN" style="width:400px;"></td>
		      </tr>
              <tr class="ui-widget-content jqgrow ui-row-ltr">
                <td width="6%">简称：</td>
			    <td colspan="4"><input type="text" name="ALIAS"  id="ALIAS" style="width:250px;"></td>
		      </tr>
              <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">职工人数：</td>
			    <td width="32%"><input type="text" name="EMPLOYEE_COUNT"  id="EMPLOYEE_COUNT" style="width:150px;"></td>
			    <td width="10%">企业类型：</td>
			    <td width="40%"><select name="CORP_TYPE"  id="CORP_TYPE"><c:forEach items="${companyTypes}" var="item"><option value="${item.CODE }">${item.FLAG }</option></c:forEach></select></td>
              </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr"s>
			    <td colspan="2">营业执照注册号：</td>
			    <td><input type="text" name="BUSINESS_LICENCE_CODE"  id="BUSINESS_LICENCE_CODE" style="width:200px;"></td>
			    <td>营业期限：</td>
			    <td><input type="text" name="BUSINESS_TIME_LIMIT"  id="BUSINESS_TIME_LIMIT" style="width:150px;"></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">税务登记号：</td>
			    <td><input type="text" name="TAX_REGISTRATION_NUMBER"  id="TAX_REGISTRATION_NUMBER" style="width:200px;"></td>
			    <td>成立日期：</td>
			    <td><input type="text" name="INCORPORATING_DATE" readonly="readonly" id="INCORPORATING_DATE" style="width:150px;"></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">注册资本(万元)：</td>
			    <td><input type="text" name="REGISTERED_CAPITAL"  id="REGISTERED_CAPITAL" style="width:200px;"></td>
			    <td>经营范围：</td>
			    <td><input type="text" name="MANAGING_SCOPE"  id="MANAGING_SCOPE" style="width:150px;"></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司电话：</td>
			    <td><input type="text" name="TELEPHONE"  id="TELEPHONE" style="width:200px;"></td>
			    <td>公司网址：</td>
			    <td><input type="text" name="URL"  id="URL" style="width:200px;"></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司传真：</td>
			    <td><input type="text" name="FAX"  id="FAX" style="width:200px;"></td>
			    <td>邮编：</td>
			    <td><input type="text" name="POSTCODE"  id="POSTCODE" style="width:150px;"></td>
			  </tr>
  			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司通讯地址：</td>
			    <td colspan="3"><input type="text" name="COMMUNICATION_ADDRESS"  id="COMMUNICATION_ADDRESS" style="width:600px;"></td>
		      </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司注册地址：</td>
			    <td colspan="3"><input type="text" name="REGISTERED_OFFICE_ADDRESS"  id="REGISTERED_OFFICE_ADDRESS" style="width:600px;"></td>
			    </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td height="40">备<br>注</td>
			    <td colspan="5"><textarea NAME="MEMO" id="MEMO" style="width:600px; height:35px;"></textarea></td>
			    </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td rowspan="3">法<br>人<br>代<br>表</td>
			    <td colspan="2">法定代表人：</td>
			    <td><input type="text" name="LEGAL_PERSON"  id="LEGAL_PERSON" style="width:150px;"></td>
			    <td>法人身份证号：</td>
			    <td><input type="hidden" name="LEGAL_ID_CARD" id="LEGAL_ID_CARD" style="width:150px;"><span id="LEGAL_ID_CARD1"></span></td>					    
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">法人办公电话：</td>
			    <td><input type="text" name="LEGAL_TELEPHONE"  id="LEGAL_TELEPHONE" style="width:150px;"></td>
			    <td>邮编：</td>
			    <td><input type="text" name="LEGAL_POSTCODE"  id="LEGAL_POSTCODE" style="width:150px;"></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">法人常住地址：</td>
			    <td><input type="text" name="LEGAL_HOME_ADDRESS"  id="LEGAL_HOME_ADDRESS" style="width:250px;"></td>
			    <td>手机号码：</td>
			    <td><input type="text" name="LEGAL_MOBILE_NUMBER"  id="LEGAL_MOBILE_NUMBER" style="width:150px;"></td>
			  </tr>
			 <tr class="ui-widget-content jqgrow ui-row-ltr">
			   <td colspan="7" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>银行信息</strong></td>
		     </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="3">开户银行：</td>
			    <td><input type="text" name="OPEN_ACCOUNT_BANK"  id="OPEN_ACCOUNT_BANK" style="width:250px;"></td>
			    <td>账号：</td>
			    <td><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width:250px;"></td>
			  </tr> 
			</table>
			  
			<div align="center">
				<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onClick="addCompany();">
				<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置">
			</div>  
	</form>			
	</body>
</html>