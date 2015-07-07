<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>查看公司信息页面</title>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/department/js/companyManage.js"></script>	
		<script type="text/javascript" src="${ctx}/common/js/idCard.js" ></script>
		<script type="text/javascript" src="tab_data/tab.js"></script>
		<script type="text/javascript"> 		
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('LEGAL_ID_CARD1')
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
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;公司管理-查看公司信息</span>
		   	</div>           
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
           				<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
			        <td colspan="3" align="right">公司级别：</td>
			        <td colspan="4"><c:if test="${company.LEGELR eq 1 }">总公司</c:if><c:if test="${company.LEGELR eq 2}">分公司</c:if></td>										        
			    </tr>
				<c:if test="${company.LEGELR eq 2}">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="3" align="right">本公司的总公司为：</td>
					<td colspan="4">${company.ZONG_NAME}</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="3" align="right">排序：</td>
					<td colspan="4"><input id="ORDER" name="ORDER" value="${company.ORDER }"></td>
				</tr>
				</c:if>
			  <tr >
			    <td width="3%" rowspan="11" class="ui-state-default ui-th-ltr zc_grid_head">法<br>人<br>基<br>本<br>信<br>息</td>
			    <td width="7%" rowspan="3" class="ui-widget-content jqgrow ui-row-ltr">单位名称</td>
			    <td width="7%" class="ui-widget-content jqgrow ui-row-ltr">中文：</td>
			    <td colspan="4" class="ui-widget-content jqgrow ui-row-ltr">${company.DECP_NAME_CN }&nbsp;</td>
		      </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td>英文：</td>
		        <td colspan="4">${company.DECP_NAME_EN }&nbsp;</td>
	          </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td width="7%">简称：</td>
			    <td colspan="4">${company.ALIAS}&nbsp;</td>
		      </tr>
              <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">职工人数：</td>
			    <td width="6%">${company.EMPLOYEE_COUNT }&nbsp;</td>
			    <td width="9%">企业类型：</td>
			    <td colspan="2"><c:forEach items="${companyTypes}" var="item"><c:if test="${item.CODE eq company.CORP_TYPE}">${item.FLAG}</c:if></c:forEach></td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">营业执照注册号：</td>
			    <td>${company.BUSINESS_LICENCE_CODE }&nbsp;</td>
			    <td>营业期限：</td>
			    <td colspan="2">${company.BUSINESS_TIME_LIMIT}&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">税务登记号：</td>
			    <td>${company.TAX_REGISTRATION_NUMBER}&nbsp;</td>
			    <td>成立日期：</td>
			    <td colspan="2"><fmt:formatDate value="${company.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">注册资本(万元)：</td>
			    <td>${company.REGISTERED_CAPITAL }&nbsp;</td>
			    <td>经营范围：</td>
			    <td colspan="2">${company.MANAGING_SCOPE }&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司电话：</td>
			    <td>${company.TELEPHONE}&nbsp;</td>
			    <td>公司网址：</td>
			    <td colspan="2">${company.URL }&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司传真：</td>
			    <td>${company.FAX }&nbsp;</td>
			    <td>邮编：</td>
			    <td colspan="2">${company.POSTCODE }&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">公司注册地址：</td>
			    <td colspan="4">${company.REGISTERED_OFFICE_ADDRESS }&nbsp;</td>
			    </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td height="40">备注:</td>
			    <td colspan="5">${company.MEMO }&nbsp;</td>
			    </tr>
			  <tr >
			    <td rowspan="3" class="ui-state-default ui-th-ltr zc_grid_head">法<br>人<br>代<br>表</td>
			    <td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">法定代表人：</td>
			    <td class="ui-widget-content jqgrow ui-row-ltr">${company.LEGAL_PERSON}&nbsp;</td>
			    <td class="ui-widget-content jqgrow ui-row-ltr">法人身份证号：</td>
			    <td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">${company.LEGAL_ID_CARD }&nbsp;</td>					    
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">法人办公电话：</td>
			    <td>${company.LEGAL_TELEPHONE }&nbsp;</td>
			    <td>邮编：</td>
			    <td colspan="2">${company.LEGAL_POSTCODE}&nbsp;</td>
			  </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="2">法人常住地址：</td>
			    <td>${company.LEGAL_HOME_ADDRESS}&nbsp;</td>
			    <td>手机号码：</td>
			    <td colspan="2">${company.LEGAL_MOBILE_NUMBER }&nbsp;</td>
			  </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				  <td colspan="7" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>银行信息</strong></td>
			    </tr>
			  <tr class="ui-widget-content jqgrow ui-row-ltr">
			    <td colspan="3">开户银行：</td>
			    <td>${company.OPEN_ACCOUNT_BANK }&nbsp;</td>
			    <td>账号：</td>
			    <td colspan="2">${company.BANK_ACCOUNT }&nbsp;</td>
			  </tr> 
			</table>
			<div align="center">
				<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onClick="javascript:history.go(-1)">
			</div>

	</body>
</html>