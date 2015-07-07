<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/idCard.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript"
			src="${ctx }/credit_vip/js/creditCustomerCreate.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/jquery.autocomplete.css" />
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css">
		<title>尽职调查报告添加</title>
		<script type="text/javascript">
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('cust_idcard')
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
			
			/* $(function () {
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=creditCustomer.getProductionType',
					dataType:'json',
					success: function(data) {
							$("#production_type").get(0).options.add(new Option("请选择",""));
						for(var i=0;i<data.length;i++) {
							$("#production_type").get(0).options.add(new Option(data[i].FLAG,data[i].CODE));
						}
					}
				});
			});	 */
			/* function change(){			
				$("#custInfo1").show();
				$("#custInfo2").show();
				$("#custInfo3").show();
				$("#custInfo4").show();
			} */
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" value="creditCustomerVip.add">
			<input type="hidden" name="vip_flag" value="1">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报告添加(绿色通道)</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%">承租人类型：</td>
								<td width="40%"><input checked="checked" type="radio" name="cust_type" id="cust_type1" value="1" onchange="changeType(1);">&nbsp;法人&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="cust_type" id="cust_type0"  value="0" onchange="changeType(0);">&nbsp;自然人&nbsp;</td>
								<td width="10%">报告类型：</td>
					<td width="38%"><select name="type" id="type">
							<c:forEach items="${creditTypes}" var="item">
								<option value="${item.FLAG }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人：</td>
					<td><input type="text" name="cust_name" id="cust_name" style="width: 200px" ></td>
					<td>客户经理：</td>
					<td>${s_employeeName }<input type="hidden" name="sensor_id" id="sensor_id" value="${s_employeeId }"><input type="hidden" name="sensor_name" id="sensor_name" value="${s_employeeName }"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td id="custDiv0" style="display: none;"><select id="id_card_type" name="id_card_type" onchange="changeIdCardType();">
                    		<option value="1">身份证号码</option>
                    		<option value="2">港澳台通行证</option>
                    		<option value="3">护照</option>
                    		<option value="4">其他</option>
                    	</select></td>
                    <td id="custDiv1" style="display: none;" ><input type="hidden" name="cust_idcard1" id="cust_idcard"><span id="cust_idcard1"></span></td>	
					<td id="custDiv5" style="display: none;"><input type="text" name="cust_idcard2" id="cust_idcard2"  style="width: 200px"></td>
					<td id="custDiv2">组织机构代码证：</td>
					<td id="custDiv3"><input type="text" name="corp_oragnization_code" id="corp_oragnization_code" style="width: 200px"></td>
					<!-- <td>区域主管：</td>
					<td><input type="text" name="clerk_name" id="clerk_name" style="width: 200px"><input type="hidden" name="clerk_id" id="clerk_id"></td> -->
					<td>租赁方式：</td>
					<td><select id="contract_type" name="contract_type"> 
							<c:forEach items="${contractType}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>公司代号：</td>
					<td><select id="decp_id" name="decp_id">
							<c:forEach items="${companyList}" var="item">					
								<option value="${item.DECP_ID}" <c:if test="${item.DECP_ID eq s_employeeDecpId}">selected="selected"</c:if>>${item.DECP_NAME_CN  }</option>								
							</c:forEach>
						</select></td>
					<!-- <td>区域主管电话：</td>
					<td><input type="text" name="clerk_mobile" id="clerk_mobile" style="width: 200px"></td> -->
					<td>客户来源：</td>
					<td><select id="customer_come" name="customer_come"> 
							<c:forEach items="${customerCome}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="3">承租人地区：</td>
					<td><select id="province_id" name="province_id"	onchange="getCitys();">
							<option value="-1" selected="selected">
								-请选择省份-
							</option>
							<c:forEach items="${provinces}" var="item">
								<option value="${item.ID }">
									${item.NAME }
								</option>
							</c:forEach>
						</select><select id="city_id" name="city_id" onchange="getArea();">
							<option value="-1" selected="selected">
								-请选择市区-
							</option>
						</select><select id="area_id" name="area_id">
							<option value="-1" selected="selected">
								-请选择区-
							</option>
						</select></td>
					<!-- <td>产品类型：</td>
					<td><select id="production_type" name="production_type"></select><font color="red">*</font></td> -->
				</tr>
				<tr class="ui-jqgrid-htable zc_grid_title">
					<th colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left; font-size: 14; padding-left: 5px;">主档</th>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>租赁物概要：</td>
					<td><input type="text" name="productsabout" id="productsabout" style="width: 200px"/></td>
					<td>引荐人：</td>
					<td><input type="text" name="referee" id="referee" style="width: 200px"/></td>				
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>供应商： </td>
					<td><input type="text" name="supplier" id="supplier" style="width: 200px" /></td>
					<td>申请额度：</td>
					<td><input type="text" name="limit" id="limit" style="width: 200px" /></td>
				</tr>
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none" id="custInfo1">
					<td>未提交报告数量：</td>
					<td><span id="sum1"></span></td>
					<td>提交报告数量：</td>
					<td><span id="sum2"></span></td>				
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="display: none" id="custInfo2">
					<td>承租人级别：</td>
					<td><span id="custLevel"></span></td>
					<td>合同数量：</td>
					<td><span id="sum3"></span></td>
				</tr>
				<tr  class="ui-widget-content jqgrow ui-row-ltr" style="display: none" id="custInfo3">
					<td>授信额度：</td>
					<td style="text-align: right"><span id="grantprice" ></span></td>
					<td>授信余额：</td>
					<td style="text-align: right"><span id="grantlastprice"></span></td>
				</tr>
				<tr  class="ui-widget-content jqgrow ui-row-ltr" style="display: none" id="custInfo4">
				    <td>主档：</td>
					<td style="text-align: left" colspan="3"><select name="ACTILOG_ID" id="ACTILOG_ID">
					   <option value="">---请选择---&nbsp;</option></select><font color="red">*</font></td>
				</tr> --%>
				<tr class="ui-jqgrid-labels" align="center">
					<td colspan="4"><input type="button" name="saveBut" id="saveBut" value="保  存" onclick="addCustomer();"	class="ui-state-default ui-corner-all">	<input type="reset" name="resetBut" id="resetBut" value="重  置" class="ui-state-default ui-corner-all"></td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</form>
		
	</body>
</html>