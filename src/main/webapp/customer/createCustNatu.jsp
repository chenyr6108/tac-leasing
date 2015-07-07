<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/overlayer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>自然人详细档案</title>
		<script src=" ${ctx}/common/js/idCard.js" type="text/javascript"></script>
		<script src=" ${ctx}/common/js/goodDrag.js" type="text/javascript"></script>
		<script src=" ${ctx}/customer/js/createCustNatu.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/custArea.js" type="text/javascript"></script>
		<script src="${ctx }/customer/js/custLinkMan.js" type="text/javascript"></script>
		<script type="text/javascript">
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
		</script>
		<style type="text/css">
			.trade_table tr {border: 0px white;}
		</style>
	</head>
	<body>
		<form id="createCustNatu" name="createCustNatu" action="#" method="get">
			<input type="hidden" name="cust_id" id="cust_id" value="${cust.CUST_ID }"></input>
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;自然人详细档案</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	        <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tbody>
					<tr>
						<td rowspan="17" width="5%" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							人<br /> 员<br /> 基<br /> 本<br /> 情<br /> 况
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							承租人编号
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							${cust.CUST_CODE }
						</td>
						<td rowspan="9" colspan="2" >
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
						<td>行业别<input type="hidden" name="trade_type" id="trade_type" value="${cust.TRADE_TYPE }"/>
						<input type="hidden" name="first_load_trade_type" id="first_load_trade_type" value="${cust.TRADE_TYPE }"/></td>
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
						<td>${createName.NAME }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>姓名</td><!--Marked by Michael 2011 11/29锁定姓名不能修改 -->
						<td><input type="text" name="cust_name" id="cust_name" value="${cust.CUST_NAME }" disabled></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证号码</td>
						<td><input type="hidden" name="natu_idcard" id="natu_idcard" value="${cust.NATU_IDCARD}" /></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人所在省市</td>
						<td><select id="province_id" name="province_id" onchange="getCitys();">
						 	<option value="-1" <c:if test="${cust.PROVINCE_ID eq -1}"> selected="selected"</c:if>>-请选择省份-</option>
						 	<c:forEach items="${provinces}" var="item">
						 		<option value="${item.ID }" <c:if test="${cust.PROVINCE_ID eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach></select><select id="city_id" name="city_id" onchange="getArea();"><option value="-1" selected="selected">-请选择市区-</option>
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
						<td>X:<input type="text" id="x_point" name="x_point" value="${cust.X_POINT }" style="width: 60px;"/>-Y:<input type="text" id="y_point" name="y_point" value="${cust.Y_POINT }" style="width: 60px;"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>承租人状态</td>
						<td><c:if test="${custType.STATETYPE==0 }">潜在客户</c:if><c:if test="${custType.STATETYPE==1 }">新客户</c:if><c:if test="${custType.STATETYPE==2 }">已提交客户</c:if><c:if test="${custType.STATETYPE==3 }">既有客户</c:if><c:if test="${custType.STATETYPE==4 }">其他</c:if>&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>虚拟帐号</td>
						<td><input type="text"    name="VIRTUAL_CODE" id="VIRTUAL_CODE" value="${cust.VIRTUAL_CODE }" readonly="readonly"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>性别</td>
						<td><input type="radio" name="natu_gender" value="男" <c:if test="${cust.NATU_GENDER eq '男'}">checked="checked"</c:if> >男<input type="radio" name="natu_gender" value="女" <c:if test="${cust.NATU_GENDER eq '女'}">checked="checked"</c:if>>女</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>年龄</td>
						<td><input type="text" name="natu_age" id="natu_idcardAge1" value="${cust.NATU_AGE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机号码</td>
						<td><input type="text" name="natu_mobile" id="natu_mobile" value="${cust.NATU_MOBILE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>联系电话(家庭座机)</td>
						<td><input type="text" name="natu_phone" id="natu_phone" value="${cust.NATU_PHONE }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>邮编</td>
						<td><input type="text" name="natu_zip" id="natu_zip" value="${cust.NATU_ZIP }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>身份证地址</td>
						<td><input type="text" name="natu_idcard_address" id="natu_idcardAddr1" value="${cust.NATU_IDCARD_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>家庭常住地址</td>
						<td><input type="text" name="natu_home_address" id="natu_home_address" value="${cust.NATU_HOME_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td><input type="text" name="natu_work_units" id="natu_work_units" value="${cust.NATU_WORK_UNITS }"></td>
						<td>单位地址</td>
						<td><input type="text" name="natu_work_address" id="natu_work_address" value="${cust.NATU_WORK_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>公司邮箱</td>
						<td colspan="3"><input type="text" size="50" name="corp_company_email" id="corp_company_email" value="${cust.CORP_COMPANY_EMAIL }">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="4" align="center" class="ui-state-default ui-th-ltr zc_grid_head">
							配<br /> 偶 <br />信<br />息
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							配偶姓名
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="natu_mate_name" id="natu_mate_name" value="${cust.NATU_MATE_NAME }">
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							身份证号码
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="natu_mate_idcard" id="natu_mate_idcard" value="${cust.NATU_MATE_IDCARD }">
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>手机号码</td>
						<td><input type="text" name="natu_mate_mobile" id="natu_mate_mobile" value="${cust.NATU_MATE_MOBILE }"></td>
						<td>身份证地址</td>
						<td><input type="text" name="natu_mate_idcard_address" id="natu_mate_idcard_address" value="${cust.NATU_MATE_IDCARD_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>工作单位</td>
						<td><input type="text" name="natu_mate_work_units" id="natu_mate_work_units" value="${cust.NATU_MATE_WORK_UNITS }"></td>
						<td>单位地址</td>
						<td><input type="text" name="natu_mate_work_address" id="natu_mate_work_address" value="${cust.NATU_MATE_WORK_ADDRESS }"></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">备注</td>
						<td colspan="4"><textarea id="remark" name="remark"	style="border: #c0c0c0 solid 1px; width: 855px; height: 50px; font-size: 12px">${cust.REMARK }</textarea></td>
					</tr>
					<tr>
						<td colspan="5" align="center">						
							<input type="button" class="ui-state-default ui-corner-all" onclick="addNatuAsLinkMan();" value="添加承租人本人为联系人">
							<input type="button" class="ui-state-default ui-corner-all" onclick="createCustNatural();" value="保存">
							<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1);"></input>
						</td>
					</tr>
				</tbody>
			</table>
				<div id="tabs">
						<ul>
							<li style="width: 100px;text-align: center;"><a href="#tabs-1" >联系人</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-2" >联系记录</a></li>
<!-- 							<li style="width: 100px;text-align: center;"><a href="#tabs-3" >客户关怀</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-4" >费用</a></li> -->
							<li style="width: 100px;text-align: center;"><a href="#tabs-3" >案件状况</a></li>
							<li style="width: 100px;text-align: center;"><a href="#tabs-4" >操作日志</a></li>
						</ul>
							<div id="tabs-1">
						       <%@ include file="custLinkMan.jsp"%>
							</div>
							<div id="tabs-2">
								 <%@ include file="custLinkRecord.jsp"%>
							</div>
<%-- 							<div id="tabs-3">
								 <%@ include file="custLinkManCare.jsp"%>
							</div>					
							<div id="tabs-4">
								 <%@ include file="custLinkExpense.jsp"%>
							</div> --%>					
							<div id="tabs-3">
								 <%@ include file="readCustLinkCredit.jsp"%>
							</div>											
							<div id="tabs-4">
								 <%@ include file="queryCustOperLogs.jsp"%>
							</div>	
						</div>
		<c:forEach items="${trade_type_list }" var="trade_type">
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
					setTimeout("$('#trade_type_3').val('${trade_type.TRADE_CODE}');$('#trade_type').val($('#first_load_trade_type').val());", 300);
				</script>
			</c:if>
		</c:forEach>
		</div>
		</div>
		</div>
		</form>
	</body>
</html>
<script type="text/javascript"> 
$(function() {
	//添加选项卡
	$("#tabs").tabs();
});
</script> 