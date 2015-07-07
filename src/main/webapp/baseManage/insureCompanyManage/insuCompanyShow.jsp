<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insuCompany.js"></script>
		<title>保险公司信息页面</title>
		<%@ include file="/common/import.jsp"%>
		<script type="text/javascript">
			$(function (){
				changeSelection("${company.INSU_WAY}", "${company.INSU_WAY_CODE}");
			});
			
			function changeSelection(data1, data2){
				var thisVal = data1;
				$("#insu_way").val(data1);
				var o = null;
				if("天" == thisVal){
					$("#insu_way_code").hide();
					$("#date_show").show();
				} else if("周" == thisVal){
					$("#date_show").show();
					$("#insu_way_code").html("");
					o = new Option("一", "一");
					if("一" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("二", "二");
					if("二" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("三", "三");
					if("三" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("四", "四");
					if("四" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("五", "五");
					if("五" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("六", "六");
					if("六" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					o = new Option("日", "日");
					if("日" == data2){
						o.selected = true;
					}
					$("#insu_way_code").get(0).add(o);
					$("#insu_way_code").show();
				} else if("月" == thisVal){
					$("#date_show").show();
					$("#insu_way_code").html("");
					for(var i = 1; i <= 31; i ++){
						o = new Option(i + "号", i);
						if(i == data2){
							o.selected = true;
						}
						$("#insu_way_code").get(0).add(o);
					}
					$("#insu_way_code").show();
				} else {
					$("#insu_way_code").hide();
					$("#date_show").hide();
				}
			}
		</script>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险公司信息查看页面</span>
	  	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">	
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>公司名称</td><td>${company.INCP_NAME } &nbsp;</td>
				<td>公司简称</td><td>${company.SHORT_NAME } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>费率(‰)</td><td>${company.RATE } &nbsp;</td>
				<td>系数</td><td>${company.FACTOR } &nbsp;</td></tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>联系人</td><td>${company.INCP_LINKMAN } &nbsp;</td>
				<td>联系电话</td><td>${company.INCP_LINKTEL }&nbsp;</td></tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>电子邮箱</td><td>${company.INCP_EMAIL } &nbsp;</td>
				<td>邮编</td><td>${company.INCP_ZIP }&nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>传真</td><td>${company.INCP_FAX } &nbsp;</td>
				<td>公司编号</td><td>${company.INCP_CODE } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>保单方式：</td>
				<td>
					每<select id="insu_way" name="insu_way" disabled="disabled">
						<c:forEach items="${insuWayList}" var="i">
							<option value="${i.code }">${i.flag }</option>
						</c:forEach>
					</select>
					<select id="insu_way_code" name="insu_way_code" disabled="disabled" style="display: none;"></select>
					<span id="date_show" style="display: none;">下午2点</span>
					出保单
				</td>
				<td>当前大保单编号：</td>
				<td>${company.INCP_INSU_CODE }</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>公司地址</td><td colspan="3">${company.INCP_ADDRESS }&nbsp;</td>
			</tr>
				<!--  
			<tr class="ui-widget-content jqgrow ui-row-ltr"><td rowspan="2">机动车险种名称</td>
				<td>必保险种</td>
				<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList1) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList1}" var="insureType1" varStatus="status" ><td width ="25%"><c:if test="${insureType1.FLAG eq 1}"><input type="checkbox" name="intp_id" value="${insureType1.INTP_ID }" checked="checked" >${insureType1.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${insureType1.FLAG eq 0}"><input type="checkbox" name="intp_id" value="${insureType1.INTP_ID }"  disabled ="disabled" >${insureType1.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>选保险种</td>
				<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList2) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList2}" var="insureType2" varStatus="status" ><td width ="25%"><c:if test="${insureType2.FLAG eq 1}"><input type="checkbox" name="intp_id" value="${insureType2.INTP_ID }" checked="checked" >${insureType2.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${insureType2.FLAG eq 0}"><input type="checkbox" name="intp_id" value="${insureType2.INTP_ID }"  disabled ="disabled" >${insureType2.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr"><td rowspan="2">非机动车险种名称</td>
				<td>必保险种</td>
				<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList3) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList3}" var="insureType3" varStatus="status" ><td width ="25%"><c:if test="${insureType3.FLAG eq 1}"><input type="checkbox" name="intp_id" value="${insureType3.INTP_ID }" checked="checked" >${insureType3.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${insureType3.FLAG eq 0}"><input type="checkbox" name="intp_id" value="${insureType3.INTP_ID }"  disabled ="disabled" >${insureType3.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>选保险种</td>
				<td colspan="2" ><table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title"><tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(insureTypeList4) + 1) / 3 }" var="insureTypeListRow"></c:set><c:set value="1" var="row"></c:set><c:forEach items="${insureTypeList4}" var="insureType4" varStatus="status" ><td width ="25%"><c:if test="${insureType4.FLAG eq 1}"><input type="checkbox" name="intp_id" value="${insureType4.INTP_ID }" checked="checked" >${insureType4.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${insureType4.FLAG eq 0}"><input type="checkbox" name="intp_id" value="${insureType4.INTP_ID }"  disabled ="disabled" >${insureType4.INTP_NAME}&nbsp;&nbsp;&nbsp;</td></c:if><c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if><c:set value="${row + 1}" var="row"></c:set></c:forEach></table></td>
			</tr>-->
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>备注</td>
				<td colspan="3">${company.REMARK }&nbsp;</td>
			</tr>
			
							
				
						<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head"><strong>开户银行</strong></td>
							</tr>
		<tr id="13" class="ui-widget-content jqgrow ui-row-ltr">
		<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr"><table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<c:if test="${not empty companyBankAccount}">
								<c:forEach items="${companyBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">${item.BANK_NAME }&nbsp;</td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
											<td   class="ui-widget-content jqgrow ui-row-ltr">${item.BANK_ACCOUNT }&nbsp;</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(companyBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td   rowspan="${fn:length(companyBankAccount)}" id="bankTd" class="ui-widget-content jqgrow ui-row-ltr" >其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${companyBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="checkbox" name="check_id" id="check_id">开户银行：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">${item.BANK_NAME }&nbsp;</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">${item.BANK_ACCOUNT }&nbsp;</td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
				</tr>
			
		</table>
		<center>
		<input type="button" class="ui-state-default ui-corner-all" value="返  回" onclick="javascript:history.go(-1)"  />
		</center>
		</div>
				</div>
			</div>
	</body>
</html>