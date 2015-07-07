<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>开票协议书</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="${ctx }/rentcontract/js/invoiceCheck.js"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>	
		<script type="text/javascript" src="${ctx}/common/js/idCard.js" ></script>	
		<script type="text/javascript" src="tab_data/tab.js"></script>
        <link rel="stylesheet" type="text/css" href="${ctx }/common/css/tab.css">
        <link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<script type="text/javascript"> 
		$(function (){
			$("#INVOICE_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#PARTY_A_SIGNTIME").datepicker($.datepicker.regional['zh-CN']);
			$("#PARTY_B_SIGNTIME").datepicker($.datepicker.regional['zh-CN']);
			$("#PARTY_C_SIGNTIME").datepicker($.datepicker.regional['zh-CN']);				
		});	
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('W_PERSON_CARD'),	
					idCard: new IdCard('O_PERSON_CARD'),
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
			<input type="hidden" name="__action" value="" id="__action">
			<input type="hidden" name="REIP_CODE" value="${REIP_CODE}" id="REIP_CODE">
			<input type="hidden" name="chuan" value="${chuan}" id="chuan">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;开票协议书</span>
		   	</div>           
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
           <div class="ui-state-default ui-jqgrid-hdiv ">
					<table width="99%" border="0" cellspacing="1" cellpadding="0" class="STYLE2" bgcolor="#798d98">
					    <tr>
					        <td colspan="2" width="15%">签定时间</td>
					        <td colspan="2" width="15%"><INPUT TYPE="text" NAME="INVOICE_DATE" id="INVOICE_DATE" readonly="readonly"></td>
					        <td colspan="2" width="25%">融资租赁合同号</td>
					        <td colspan="4">${infor.LEASE_CODE}&nbsp;</td>									        
					    </tr>
					    <tr>
					        <td width="5%">编号</td>
					        <td width="15%">支付表编号</td>
					        <td width="15%">买卖合同编号</td>
					        <td width="15%">设备名称</td>
					        <td width="10%">设备型号</td>
					        <td width="15%">产品厂牌</td>
					        <td width="10%">生产商</td>
					        <td width="5%">单位</td>
					        <td width="5%">单价</td>
					        <td width="5%">数量</td>       									        										        	
					     </tr>
							<c:forEach items="${macInfor}" var="item" varStatus="status">									     
								    <tr name="money">
								        <td>${status.count }&nbsp;</td>
								        <td>${item.RECP_CODE }&nbsp;</td>
								        <td>${item.PUCT_CODE }&nbsp;</td>
								        <td>${item.THING_NAME }&nbsp;</td>
								        <td>${item.MODEL_SPEC }&nbsp;</td>
								        <td>${item.THING_KIND }&nbsp;</td>
								        <td>${item.BRAND }&nbsp;</td>
								        <td>${item.UNIT }&nbsp;</td>
								        <td>${item.UNIT_PRICE }&nbsp;</td>
								        <td>${item.AMOUNT }&nbsp;</td>									        									        										        	
								     </tr>
							</c:forEach>	     									     									    
					</table>

									<table width="99%" border="0" cellspacing="1" cellpadding="0" class="STYLE2" bgcolor="#798d98">
									    <tr>
									        <td colspan="5">合计(大写:${heD})(小写:<fmt:formatNumber value="${he}" type="currency" />)</td>
									    </tr>
									    <tr>
									        <td>整机发票开具给</td>
									        <td colspan="5"><INPUT TYPE="radio" NAME="WHOLE_STATUS" id="WHOLE_STATUS" value="1" onClick="createDisplay(this)" checked="checked">我司<INPUT TYPE="radio" NAME="WHOLE_STATUS" id="WHOLE_STATUS" value="2" onClick="createDisplay(this)">客户<INPUT TYPE="radio" NAME="WHOLE_STATUS" id="WHOLE_STATUS" value="3" onClick="createDisplay(this)">第三方</td>						        										        	
									    </tr>
									    <tr id="statusTr" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
									        <td><INPUT TYPE="radio" NAME="WHOLE_TYPE" id="WHOLE_TYPE" value="1" onClick="createDisplay2(this)" checked="checked">个人 <INPUT TYPE="radio" NAME="WHOLE_TYPE" id="WHOLE_TYPE" value="2" onClick="createDisplay2(this)">丙方公司</td>
									        <td id="TypeTr" class="ui-widget-content jqgrow ui-row-ltr" colspan="5"><INPUT TYPE="text" NAME="W_PERSON_NAME" id="W_PERSON_NAME" value="姓名" onclick="lostName(this)"><INPUT TYPE="hidden" NAME="W_PERSON_CARD" id="W_PERSON_CARD"><span id="W_PERSON_CARD1"></span></td>
									        <td colspan="4" id="TypeTr2" style='display:none' class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="text" NAME="W_COMPANY_NAME" id="W_COMPANY_NAME" value="丙方公司名称" onclick="lostCompanyName(this)"><INPUT TYPE="text" NAME="W_COMPANY_NUMBER" id="W_COMPANY_NUMBER" value="丙方营业执照注册号" onclick="lostSize(this)"><INPUT TYPE="text" NAME="W_COMPANY_CODE" id="W_COMPANY_CODE" value="组织机构代码号" onclick="lostTeam(this)"></td>						        										        	
									    </tr>
									    <tr>
									        <td>租金发票或利息发票开具给</td>
									        <td colspan="4"><INPUT TYPE="radio" NAME="OTHER_STATUS" id="OTHER_STATUS" value="1" onClick="createDisplay3(this)" checked="checked">客户<INPUT TYPE="radio" NAME="OTHER_STATUS" id="OTHER_STATUS" value="2" onClick="createDisplay3(this)">第三方</td>						        										        	
									    </tr>
									    <tr id="otherTr" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
									        <td><INPUT TYPE="radio" NAME="OTHER_TYPE" id="OTHER_TYPE" value="1" onClick="createDisplay4(this)" checked="checked">个人 <INPUT TYPE="radio" NAME="OTHER_TYPE" id="OTHER_TYPE" value="2" onClick="createDisplay4(this)">丙方公司</td>
									        <td id="otherTypeTr" class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="text" NAME="O_PERSON_NAME" id="O_PERSON_NAME" value="姓名" onclick="lostName(this)"><INPUT TYPE="hidden" NAME="O_PERSON_CARD" id="O_PERSON_CARD"><span id="O_PERSON_CARD1"></span></td>
									        <td colspan="3" id="otherTypeTr2" class="ui-widget-content jqgrow ui-row-ltr" style='display:none'><INPUT TYPE="text" NAME="O_COMPANY_NAME" id="O_COMPANY_NAME" value="丙方公司名称" onclick="lostCompanyName(this)"><INPUT TYPE="text" NAME="O_COMPANY_NUMBER" id="O_COMPANY_NUMBER" value="丙方营业执照注册号" onclick="lostSize(this)"><INPUT TYPE="text" NAME="O_COMPANY_CODE" id="O_COMPANY_CODE" value="组织机构代码号" onclick="lostTeam(this)"></td>						        										        	
									    </tr>
								    </table>
								    <table width="99%" border="0" cellspacing="1" cellpadding="0" class="STYLE2" bgcolor="#798d98">										    									    
									    <tr>
									    	<td rowspan="2" align="center" width="15%">甲<br>方</td>
									        <td width="15%">名称</td>
									        <td width="30%"><INPUT TYPE="text" NAME="PARTY_A_NAME" id="PARTY_A_NAME" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"  value="${comInfor.DECP_NAME_CN }" readonly="readonly"></td>
									        <td width="15%">地址</td>
									        <td><INPUT TYPE="text" NAME="PARTY_A_ADDR" id="PARTY_A_ADDR"  value="${comInfor.REGISTERED_OFFICE_ADDRESS }"></td>
									     </tr>
									     <tr>
									        <td>委托代理人</td>
									        <td><INPUT TYPE="text" NAME="PARTY_A_ATTORNEY" id="PARTY_A_ATTORNEY"  value="${comInfor.LEGAL_PERSON}"></td>
									        <td>日期</td>    
									        <td><INPUT TYPE="text" NAME="PARTY_A_SIGNTIME" id="PARTY_A_SIGNTIME" readonly="readonly" value="<fmt:formatDate value="${comInfor.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>"></td>									        										        	
									     </tr>
									    <tr>
									        <td rowspan="5" align="center">乙<br>方</td>
									        <td>名称</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_NAME" id="PARTY_B_NAME" style="border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none"  value="${infor.CUST_NAME }" readonly="readonly"></td>
									        <td>电话</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_PHONE" id="PARTY_B_PHONE"  value="${infor.CUST_PHONE }"></td>
									     </tr>
									    <tr>
									        <td>地址</td>
									        <td colspan="3"><INPUT TYPE="text" NAME="PARTY_B_ADDR" id="PARTY_B_ADDR"  value="${infor.CUST_ADDRESS }"></td>
									     </tr>
									    <tr>
									        <td>开户银行</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_BANK" id="PARTY_B_BANK"  value="${infor.OPEN_BANK }"></td>
									        <td>帐号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_ACCOUNT" id="PARTY_B_ACCOUNT"  value="${infor.BANK_ACCOUNTS }"></td>
									     </tr>
									    <tr>
									        <td>单位税号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_DUTY" id="PARTY_B_DUTY"  value="">&nbsp;</td>
									        <td>组织机构代码证号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_CODE" id="PARTY_B_CODE"  value="${infor.CORP_ORAGNIZATION_CODE}"></td>
									     </tr>									     									     									     
									     <tr>
									        <td>委托代理人</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_ATTORNEY" id="PARTY_B_ATTORNEY" value="${infor.CORP_HEAD_SIGNATURE }"></td>
									        <td>日期</td>
									        <td><INPUT TYPE="text" NAME="PARTY_B_SIGNTIME" id="PARTY_B_SIGNTIME" readonly="readonly"  value="<fmt:formatDate value="${infor.CORP_SETUP_DATE}" pattern="yyyy-MM-dd"/>"></td>									        										        	
									     </tr>
									    <tr>
									        <td rowspan="5" align="center">丙<br>方</td>
									        <td>名称</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_NAME" id="PARTY_C_NAME"  ></td>
									        <td>电话</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_PHONE" id="PARTY_C_PHONE" ></td>
									     </tr>
									    <tr>
									        <td>地址</td>
									        <td colspan="3"><INPUT TYPE="text" NAME="PARTY_C_ADDR" id="PARTY_C_ADDR"></td>
									     </tr>
									    <tr>
									        <td>开户银行</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_BANK" id="PARTY_C_BANK"></td>
									        <td>帐号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_ACCOUNT" id="PARTY_C_ACCOUNT"></td>
									     </tr>
									    <tr>
									        <td>单位税号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_DUTY" id="PARTY_C_DUTY" value=""></td>
									        <td>组织机构代码证号</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_CODE" id="PARTY_C_CODE"  value=""></td>
									     </tr>									     									     									     
									     <tr>
									        <td>委托代理人</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_ATTORNEY" id="PARTY_C_ATTORNEY"></td>
									        <td>日期</td>
									        <td><INPUT TYPE="text" NAME="PARTY_C_SIGNTIME" id="PARTY_C_SIGNTIME" readonly="readonly"></td>									        										        	
									     </tr>									     										     							    
							</table>
						</div>
				</div>
		</div>			
				<div align="center">
					<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="保  存" onClick="addInvoice();">
					<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置">
				</div>  
	</form>			
	</body></html>