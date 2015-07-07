<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/overlayer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>法人详细档案</title>
		<script src="${ctx }/common/js/idCard.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/goodDrag.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/createCustCorp.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/custArea.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/custLinkMan.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				$("#corp_setup_date").datepicker($.datepicker.regional['zh-CN']);
			})
			function checkCorpOragnizationCode(){
				var corp_oragnization_code = $.trim($("#corp_oragnization_code").val());
				$.ajax({
					type:"POST",
					data:{"cust_id":$("#cust_id").val(),"cust_type":'1',"cust_name":$("#cust_name").val(),"corp_oragnization_code":corp_oragnization_code,"__action":"customer.checkCustomer"},
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if (callback.rs.COUNT == 'undefined'){
							alert("系统错误，请联系系统管理员！");
							$("#corp_oragnization_code").val('') ;
							return ;
						} else if (callback.rs.COUNT > 0) {
							alert("该组织机构代码证已存在，不可添加，请核实！");
							$("#corp_oragnization_code").val('') ;
							return ;
						} 
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
			}
			
			function getSecondTradeType(e, trade_level){
				var trad_type_e = $("#trade_type_" + trade_level);
				var trad_type_e_n = $("#trade_type_" + (trade_level + 1));
				trad_type_e.html("");
				trad_type_e.css("display", "none");
				if(trad_type_e_n != 'undefind'){
					trad_type_e_n.html("");
					trad_type_e_n.css("display", "none");
				}
				$("#trade_type").val("");
				if ($(e).val() != "") {
					$.getJSON(
						"${ctx }/servlet/defaultDispatcher"
						,{"__action" : "customer.getTradeType", "trade_level" : trade_level, "trade_code" : $(e).val()}
						,function (data){
							//alert(data.length);
							if(data.length > 0){
								var trad_type_option = "<option value=\"\">----------请选择----------</option>";
								$.each(data, function(i){
									trad_type_option += "<option value=\"" + data[i].TRADE_CODE + "\">" + data[i].TRADE_NAME + "</option>";
								});
								trad_type_e.html(trad_type_option);
								trad_type_e.css("display", "block");
							} else {
								$("#trade_type").val($(e).val());
							}
						}
					);
				}
			}
			
			function getTheNextTradeTypeCallBack(data, trade_code_array){
				if(data.length > 0){
					var trade_level = data[0].TRADE_LEVEL;
					var trad_type_e = $("#trade_type_" + trade_level);
					var trad_type_option = "<option value=\"\">----------请选择----------</option>";
					$.each(data, function(i){
						trad_type_option += "<option value=\"" + data[i].TRADE_CODE + "\" ";
						if(data[i].TRADE_CODE == trade_code_array[trade_level - 1]){
							trad_type_option += "selected=\"selected\"";
						}
						trad_type_option += " >" + data[i].TRADE_NAME + "</option>";
					});
					trad_type_e.html(trad_type_option);
					trad_type_e.css("display", "block");
					if(trade_level <= 2){
						getTheNextTradeType(trade_level + 1, trade_code_array);
					}
				}
			}
			function getTheNextTradeType(trade_level, trade_code_array){
				if(trade_code_array[trade_level - 2] != ""){
					$.getJSON(
							"${ctx }/servlet/defaultDispatcher"
							,{"__action" : "customer.getTradeType", "trade_level" : trade_level, "trade_code" : trade_code_array[trade_level - 2]}
							,function (data){
								getTheNextTradeTypeCallBack(data, trade_code_array);
							}
						);
				}
			}
			
			function checkValue(e){
				var code = $("#corp_oragnization_code_before").val() + $("#corp_oragnization_code_end").val();
				if($(e).val().indexOf(code) == -1){
					alert("税务登记号与组织机构代码证没有对应，请核对。");
				}
			}
			
		</script>
		<style type="text/css">
			.trade_table tr {border: 0px white;}
		</style>
	</head>
	<body>
		<form id="createCustCorp" name="createCustCorp" action="#" method="get">
			<input type="hidden" name="cust_id" id="cust_id" value="${cust.CUST_ID }"></input>
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;法人详细档案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	        <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tbody>
					<tr>
						<td rowspan="22" width="5%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							人<br /> 员<br /> 基<br /> 本<br /> 情<br /> 况
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							承租人编号
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							${cust.CUST_CODE }
						</td>
						<td rowspan="10" colspan="2">
							<table width="190" border="0" align="center" cellpadding="0"
								cellspacing="0" style="margin-top: 3px;">
								<tr>
									<td align="center">
										<a href="#" onClick="op('zz', 'hui');"><img
												src="${ctx}${card.path }" width="150" height="170"
												class="pic" />
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人分类</td>
						<td><select name="cust_level" id="cust_level"><c:forEach items="${custLevel}" var="item"><option value="${item.CODE }" <c:if test="${cust.CUST_LEVEL eq item.CODE}">selected="selected"</c:if> >${item.FLAG }</option></c:forEach></select></td>
					</tr>
					<%-- 2012/03/27 Yang Yun 新增行业别 --%>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>行业别<input type="hidden" name="trade_type" id="trade_type" value="${cust.TRADE_TYPE }"/></td>
						<td class="trade_table"><table border="0" cellpadding="0" cellspacing="0"><tr><td><select name="trade_type_first" id="trade_type_1" onchange="getSecondTradeType(this, 2)">
								<option value="">----------请选择----------</option>
								<c:forEach items="${trade_type_first_list }" var="f">
									<option value="${f.TRADE_CODE }">${f.TRADE_NAME }</option>
								</c:forEach>
							</select></td><td><select name="trade_type_second" id="trade_type_2" onchange="getSecondTradeType(this, 3)" style="display: none;">
								<option value="">----------请选择----------</option>
							</select></td><td><select name="trade_type_third" id="trade_type_3" style="display: none;" onchange="$('#trade_type').val($(this).val())">
								<option value="">----------请选择----------</option>
						</select></td></tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户经理</td>
						<td>${createName.NAME}&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>企业名称 	</td>
						<td><input type="text" name="cust_name" id="cust_name" value="${cust.CUST_NAME }" disabled></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>组织机构代码号 </td>
						<td><!-- Modify by Michael 2012 4-23 限制组织机构代码证输入格式 --><input name="corp_oragnization_code_before" type="text" id="corp_oragnization_code_before" size="9" value="${cust.CORP_ORAGNIZATION_CODE_BEFORE }"/>-<input name="corp_oragnization_code_end" type="text"
							id="corp_oragnization_code_end" size="1" value="${cust.CORP_ORAGNIZATION_CODE_END }"/><input name="corp_oragnization_code" type="hidden"
							id="corp_oragnization_code" size="9" value="${cust.CORP_ORAGNIZATION_CODE }"/><font color="red">请分开输入，‘-’不要输入，前面输入8位后面输入1位</font><!-- Modify by Michael 2012 4-23 限制组织机构代码证输入格式  -->	
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在省市</td>
						<td><select id="province_id" name="province_id" onchange="getCitys();">
						 	<option value="-1" <c:if test="${cust.PROVINCE_ID eq -1}"> selected="selected"</c:if>>-请选择省份-</option>
						 	<c:forEach items="${provinces}" var="item">
						 		<option value="${item.ID }" <c:if test="${cust.PROVINCE_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach></select><select id="city_id" name="city_id" onchange="getArea();">
						 	<option value="-1">-请选择市区-</option>
						 	<c:forEach items="${citys}" var="item">
						 		<option value="${item.ID }" <c:if test="${cust.CITY_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach> 
						 </select><select id="area_id" name="area_id">
						 	<option value="-1">-请选择市区-</option>
						 	<c:forEach items="${areas}" var="item">
						 		<option value="${item.ID }" <c:if test="${cust.AREA_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach> 
						 </select></td>
						</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在经纬度</td>
						<td>X:<input type="text" name="x_point" id="x_point" value="${cust.X_POINT }" style="width: 60px;"/>-Y:<input type="text" id="y_point" name="y_point" value="${cust.Y_POINT }" style="width: 60px;"/></td>
					</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人状态</td>
						<td><c:if test="${custType.STATETYPE==0 }">潜在客户</c:if><c:if test="${custType.STATETYPE==1 }">新客户</c:if><c:if test="${custType.STATETYPE==2 }">已提交客户</c:if><c:if test="${custType.STATETYPE==3 }">既有客户</c:if><c:if test="${custType.STATETYPE==4 }">其他</c:if>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>虚拟帐号 </td>
						<td><input type="text"    name="VIRTUAL_CODE" id="VIRTUAL_CODE" value="${cust.VIRTUAL_CODE }" readonly="readonly"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>企业类型  </td>
						<td><select name="corp_enterprises_property" id="corp_enterprises_property" class="txtk">
										<c:choose><c:when test="${empty cust.CORP_ENTERPRISES_PROPERTY}">
											    <option value="">--请选择--</option>
												<c:forEach items="${corpTypeList}" var="item">
													<option value="${item.CODE }">${item.FLAG }</option>
												</c:forEach>
											</c:when>
											<c:otherwise><c:forEach items="${corpTypeList}" var="item">
											<c:if test="${item.CODE eq cust.CORP_ENTERPRISES_PROPERTY}">
												<option value="${item.CODE }" selected="selected">${item.FLAG }</option>
											</c:if>
											<c:if test="${item.CODE ne cust.CORP_ENTERPRISES_PROPERTY}">
												<option value="${item.CODE }">${item.FLAG }</option></c:if>
								      </c:forEach><option value="">--请选择--</option></c:otherwise></c:choose>
							</select></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>成立日期</td>
						<td><input type="text" value="${cust.CORP_SETUP_DATE }" size="10" id="corp_setup_date" name="corp_setup_date" readonly="readonly"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>注册资本</td>
						<td><input type="text" name="corp_registe_capital" id="corp_registe_capital" value="${cust.CORP_REGISTE_CAPITAL }">千元
						,货币：<select  name="registe_capital_currency" id="registe_capital_currency">
								<c:forEach var="currency" items="${currencys }">
									<option value="${currency.CODE }" <c:if test="${cust.CORP_REGISTE_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
								</c:forEach>
							</select>					
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>实收资本 </td>
						<td><input type="text" name="corp_paiclup_capital" id="corp_paiclup_capital" value="${cust.CORP_PAICLUP_CAPITAL }">千元
						,货币：<select name="paiclup_capital_currency" id="paiclup_capital_currency">
								<c:forEach var="currency" items="${currencys }">
									<option value="${currency.CODE }" <c:if test="${cust.CORP_PAICLUP_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
								</c:forEach>
							</select>						</td>
					</tr>					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>营业执照注册号 </td>
						<td><input type="text" name="corp_business_license" id="corp_business_license" value="${cust.CORP_BUSINESS_LICENSE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>税务编号</td>
						<td><input type="text" name="tax_code" id="tax_code" value="${cust.TAX_CODE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>税务登记号<font color="red">*</font></td>
						<td><input type="text" name="corp_tax_code" id="corp_tax_code" value="${cust.CORP_TAX_CODE }" onchange="checkValue(this);"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>有效期 </td>
						<td><input type="text" name="corp_period_validity" id="corp_period_validity" value="${cust.CORP_PERIOD_VALIDITY }"></td>
						<td>公司邮编</td>
						<td><input type="text" name="corp_company_zip" id="corp_company_zip" value="${cust.CORP_COMPANY_ZIP }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>注册地址 </td>
						<td colspan="3"><input type="text" size="50" name="corp_registe_address" id="corp_registe_address" value="${cust.CORP_REGISTE_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司办公地址</td>
						<td colspan="3"><input type="text" size="50" name="corp_work_address" id="corp_work_address" value="${cust.CORP_WORK_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>经营范围 </td>
						<td colspan="3"><input type="text" size="50" name="corp_business_range" id="corp_business_range" value="${cust.CORP_BUSINESS_RANGE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司网址</td>
						<td><input type="text" size="50" name="corp_company_website" id="corp_company_website" value="${cust.CORP_COMPANY_WEBSITE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司邮箱</td>
						<td colspan="3"><input type="text" size="50" name="corp_company_email" id="corp_company_email" value="${cust.CORP_COMPANY_EMAIL }">&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>其他信息</td>
						<td colspan="3"><input type="text" size="50" name="corp_other_massage" id="corp_other_massage" value="${cust.CORP_OTHER_MASSAGE }"></td>
					</tr>
					<tr >
						<td rowspan="3" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							法<br />人<br />信<br />息
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							法定代表人 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="corp_head_signature" id="corp_head_signature" value="${cust.CORP_HEAD_SIGNATURE }">
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							法人身份证号码 
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="corp_hs_idcard" id="corp_hs_idcard" value="${cust.CORP_HS_IDCARD }">
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>法人联系方式 </td>
						<td colspan="3"><input type="text" name="corp_hs_link_mode" id="corp_hs_link_mode" value="${cust.CORP_HS_LINK_MODE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>法人代表住址</td>
						<td colspan="3"><input type="text" size="50" name="corp_hs_home_address" id="corp_hs_home_address" value="${cust.CORP_HS_HOME_ADDRESS }"></td>
					</tr>
					<%-- <tr >
						<td rowspan="4" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							增值税<br /> 开票资料
						</td >
						<td class="ui-widget-content jqgrow ui-row-ltr">开户行名称<font color="red">*</font></td>
						<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" size="50" name="open_bank_name" id="open_bank_name" value="${cust.OPEN_BANK_NAME }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>开户账号<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="open_bank_account" id="open_bank_account" value="${cust.OPEN_BANK_ACCOUNT }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系地址<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="link_address" id="link_address" value="${cust.LINK_ADDRESS }"></td>	
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系电话<font color="red">*</font></td>
						<td colspan="3"><input type="text" size="50" name="link_phone" id="link_phone" value="${cust.LINK_PHONE }"></td>	
					</tr>	 --%>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">备 注</td>
						<td colspan="4"><textarea id="remark" name="remark"
								style="border: #c0c0c0 solid 1px; width: 855px; height: 50px; font-size: 12px">${cust.REMARK }</textarea></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr" style="height: 20px;">
						<td colspan="5" align="center">
							<input type="button" style="cursor:pointer;" class="ui-state-default ui-corner-all" onclick="addCorpAsLinkMan();" value="添加承租人本人为联系人"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" style="cursor:pointer;" class="ui-state-default ui-corner-all" onclick="createCustCorporation();" value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" style="cursor:pointer;" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1);"/>
						</td>
					</tr>
				</tbody>
			</table>
						<div id="tabs">
						<ul>
							<li style="width: 100px;text-align: center;"><a href="#tabs-1" >联系人</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-2" >联系记录</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-3" >案件状况</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-4" >操作日志</a></li>
						</ul>
							<div id="tabs-1">
						       <%@ include file="custLinkMan.jsp"%>
							</div>
							<div id="tabs-2">
								 <%@ include file="custLinkRecord.jsp"%>
							</div>					
							<div id="tabs-3">
								 <%@ include file="readCustLinkCredit.jsp"%>
							</div>				
							<div id="tabs-4">
								 <%@ include file="queryCustOperLogs.jsp"%>
							</div>	
						</div>
					
		
		<%-- <c:forEach items="${trade_type_list }" var="trade_type">
			<c:if test="${trade_type.TRADE_LEVEL == 1 }">
				<script type="text/javascript">
					$("#trade_type_1").val("${trade_type.TRADE_CODE}");
					getSecondTradeType($("#trade_type_1"), 2);
				</script>
			</c:if>
			<c:if test="${trade_type.TRADE_LEVEL == 2 }">
				<script type="text/javascript">
					setTimeout("$('#trade_type_2').val('${trade_type.TRADE_CODE}');getSecondTradeType($('#trade_type_2'), 3);", 200);
				</script>
			</c:if>
			<c:if test="${trade_type.TRADE_LEVEL == 3 }">
				<script type="text/javascript">
					setTimeout("$('#trade_type_3').val('${trade_type.TRADE_CODE}');", 300);
				</script>
			</c:if>
		</c:forEach> --%>
		
		<script type="text/javascript">
			$("#trade_type_1").val("${trade_type_list[0].TRADE_CODE}");
			getTheNextTradeType(2, ["${trade_type_list[0].TRADE_CODE}","${trade_type_list[1].TRADE_CODE}","${trade_type_list[2].TRADE_CODE}"]);
		</script>	
	</body>
</html>
<script type="text/javascript"> 
$(function() {
	//添加选项卡
	$("#tabs").tabs();
});
</script> 