<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/idCard.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
		<script type="text/javascript" src="${ctx}/creditSpecial/js/creditSpecialAlter.js"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="${ctx }/credit/car/js/creditCustomerCreate.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
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
			
			function change(){			
				$("#custInfo1").show();
				$("#custInfo2").show();
				$("#custInfo3").show();
				$("#custInfo4").show();
			}
			
			function showCreditList() {
				$("#PERIOD_CREDIT option").remove();
				if($("#copy_cust_id").val()!=""&&$("#type").val()=="既有客户") {
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=creditCustomer.getPeriodCredit&custId='+$("#copy_cust_id").val(),
						dataType:'json',
						success:function(dataBack) {
							for(var i=0;i<dataBack.length;i++) {
								$("<option value='"+dataBack[i].ID+"'>"+dataBack[i].CREDIT_RUNCODE+"</option>").appendTo($("#PERIOD_CREDIT"));
							}
						}
					});
					$("#descr1").css("display","block");
					$("#descr2").css("display","block");
				}
				if($("#type").val()=="新客户") {
					$("#descr1").css("display","none");
					$("#descr2").css("display","none");
				}
			}
		</script>
		<style type="text/css">
			#main_table th {text-align: right;}
		</style>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="sum1"><input type="hidden" id="sum2"><input type="hidden" id="sum3">
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="__action" value="creditCustomer.add">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报告添加</span>
		   	</div>
			<table class="panel_table" id="main_table">
				<tr>
					<th width="12%">承租人类型：</th>
					<td width="40%">
						<input checked="checked" type="radio" name="cust_type" id="cust_type1" value="1" onchange="changeType(1);">&nbsp;法人&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="cust_type" id="cust_type0"  value="0" onchange="changeType(0);">&nbsp;自然人&nbsp;</td>
					<th width="10%">报告类型：</th>
					<td width="38%">
						<select name="type" id="type" onchange="showCreditList()" class="panel_select">
							<c:forEach items="${creditTypes}" var="item">
								<option value="${item.FLAG }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select><font color="red">*</font>报告类型是既有客户,则复制所选过往报告来源栏位之报告(公司沿革、过往记录、担保人信息、财务报表)
					</td>
				</tr>
				<tr>
					<th>承租人：</th>
					<td>
						<input type="text" name="cust_name" id="cust_name" style="width: 200px" onchange="change();" class="panel_text">
						<input id="copy_cust_id" type="hidden">
					</td>
					<th>客户经理：</th>
					<td>
						${s_employeeName }
					</td>
				</tr>
				<tr>
					<th id="custDiv0" style="display: none;">
						<select id="id_card_type" name="id_card_type" onchange="changeIdCardType();" class="panel_select">
                    		<option value="1">身份证号码</option>
                    		<option value="2">港澳台通行证</option>
                    		<option value="3">护照</option>
                    		<option value="4">其他</option>
                    	</select>
                    </th>
                    <td id="custDiv1" style="display: none;" ><input type="hidden" name="cust_idcard1" id="cust_idcard"><span id="cust_idcard1"></span></td>	
					<td id="custDiv5" style="display: none;"><input type="text" name="cust_idcard2" id="cust_idcard2"  style="width: 200px" class="panel_text"></td>
					<th id="custDiv2">组织机构代码证：</th>
					<td id="custDiv3"><input type="text" name="corp_oragnization_code" id="corp_oragnization_code" style="width: 200px" class="panel_text"></td>
					<th>办事处主管：</th>
					<td>
						${up_user_name }
						<input type="hidden" name="clerk_id" id="clerk_id" value="${up_user }">
					</td>
				</tr>
				<tr>
					<th>公司代号：</th>
					<td><select id="decp_id" name="decp_id" class="panel_select">
							<c:forEach items="${companyList}" var="item">					
								<option value="${item.DECP_ID}" <c:if test="${item.DECP_ID eq s_employeeDecpId}">selected="selected"</c:if>>${item.DECP_NAME_CN  }</option>								
							</c:forEach>
						</select></td>
					<th>案件类型：</th>
					<td>
						<c:choose>
							<c:when test="${vip_flag == 1 }">
								绿色通道
								<input type="hidden" name="vip_flag" value="${vip_flag }">
								<input type="hidden" name="processer_id" value="${s_employeeId }">
							</c:when>
							<c:otherwise>
								一般案件
								<input type="hidden" name="sensor_id" id="sensor_id" value="${s_employeeId }">
								<input type="hidden" name="sensor_name" id="sensor_name" value="${s_employeeName }">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>承租人地区：</th>
					<td><select id="province_id" name="province_id"	onchange="getCitys();" class="panel_select">
							<option value="-1" selected="selected">
								-请选择省份-
							</option>
							<c:forEach items="${provinces}" var="item">
								<option value="${item.ID }">
									${item.NAME }
								</option>
							</c:forEach>
						</select><select id="city_id" name="city_id" onchange="getArea();" class="panel_select">
							<option value="-1" selected="selected">
								-请选择市区-
							</option>
						</select><select id="area_id" name="area_id" class="panel_select">
							<option value="-1" selected="selected">
								-请选择区-
							</option>
						</select></td>
					<th>租赁方式：</th>
					<td><select id="contract_type" name="contract_type" class="panel_select"> 
							<c:forEach items="${contractType}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select><!-- &nbsp;&nbsp;&nbsp;&nbsp;产品类型：<select id="production_type" name="production_type"></select><font color="red">*</font> --></td>
				</tr>
				<tr>
					<th>客户来源：</th>
					<td><select id="customer_come" name="customer_come" class="panel_select"> 
							<c:forEach items="${customerCome}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
					<th align="left">预估拨款金额：</th>
					<td align="left"><input type="text" name="COMPUTE_PAY_MONEY" id="COMPUTE_PAY_MONEY" onkeyup="value=value.replace(/[^\d]/g,'')" class="panel_text"><font color="red">*</font></td>
				</tr>
				<tr style="display: none" id="custInfo2">
					<th>承租人级别：</th>
					<td><span id="custLevel"></span></td>
					<th><b>专案名称：</b></th>
					<td>
						<select name="creditSpecial" id="creditSpecial" onchange="showUpdateDiv()">
							<option value="">--无--</option>
							<c:forEach var="item" items="${creditSpecialList }">
								<option value="${item.creditCode }">${item.creditName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr  style="display: none" id="custInfo3">
					<th>授信额度：</th>
					<td style="text-align: right"><span id="grantprice" ></span></td>
					<th>授信余额：</th>
					<td style="text-align: right"><span id="grantlastprice"></span></td>
				</tr>
				<tr style="display: none" id="custInfo4">
				    <th>主档：</th>
					<td style="text-align: left"><select name="ACTILOG_ID" id="ACTILOG_ID">
					   <option value="">---请选择---&nbsp;</option></select><font color="red">*</font>
					</td>
					<th><span id="descr1">复制过往报告来源：</span></th>
					<td style="text-align: left;"><span id="descr2"><select name="PERIOD_CREDIT" id="PERIOD_CREDIT">
						</select><font color="red">*</font>
						</span>
					</td>
				</tr>
				<tr>
					<th colspan="4" style="text-align: center;">
						<button type="button" name="saveBut" id="saveBut" onclick="addCustomer();"	class="panel_button">保  存</button>
						<button type="reset" name="resetBut" id="resetBut" class="panel_button">重  置</button>
					</th>
				</tr>
			</table>
		</form>
		<div style="display: none;" id="updateDiv" title="<font style='font-family: 微软雅黑'>专案限制提醒</font>">
        	<div>
        		<div class="ui-state-default ui-jqgrid" style="background: white;width: 472px;margin-left: 1px;">
        		<table class="panel_table">
        			<tr>
        				<td id="startDate">
        				</td>
        				<td id="endDate">
        				</td>
        			</tr>
        		</table>
        		</div>
        		<table id="updateTable" class="panel_table">
        			
        		</table>
        		<table class="panel_table">
					<tr>
						<td align="center">
							<br>
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#updateDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>