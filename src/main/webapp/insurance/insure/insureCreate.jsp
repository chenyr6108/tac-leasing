<%@ page language="java" import="com.brick.util.Constants" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>新建保单</title>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		//格式化小数
		$(function (){
			  jQuery.each($("input[name='zhi']"), function() {
			    var zhi=Number($(this).val()).toFixed(2);
					this.value=zhi;
			    });
		});
		//subNotice 提交
		function subNotice (){
			if(blank($("#INCU_CODE")[0],"保单号")){
				return false;
			}
			if(blank($("#datebegin")[0],"开始时间")){
				return false;
			}
			if(blank($("#datebegin2")[0],"结束时间")){
				return false;
			}
//			if(blank($("#datebegin3")[0],"投保确认时间")){
//				return false;
//			}
//			if(blank($("#datebegin4")[0],"缴费确认时间")){
//				return false;
//			}
//			if(blank($("#datebegin5")[0],"保单打印时间")){
//				return false;
//			}
			if(positive($("#zong")[0],"保险总金额")){
				return false;
			}
			if(positive($("#he")[0],"总保险费")){
				return false;
			}
			$("#sub").attr("disabled",true);
			$("#addform").submit();
		}
		//计算
		function jisuan(obj){
			//验证
			if(isNaN(obj.value)){
				alert('此处必须输入数字');
				obj.value='';
			}
			//赋值
			var feilv=$("#INSU_RATE").val();
			var xishu=$("#COEFFICIENT").val();
			$("input[name='feilv']").val(feilv);
			$("input[name='xishu']").val(xishu);
			//计算保费，并且汇总
			var he=0;
			var zong=0;
		    jQuery.each($("input[name='zhi']"), function() {
			    var zhi=Number($(this).val());
			     zong +=zhi;
			    var fei=$(this).parent().next().children().eq(0).val();
			    var ji=Math.round(zhi*Number(fei)/10)/100;
			    $(this).parent().next().next().next().children().eq(0).val(ji.toFixed(2));
			    //he +=ji;
		    });
		    jQuery.each($("input[name='baofei']"), function() {
			    var baofei=Number($(this).val());
			    he +=baofei;
		    });
		//	$("#he").val(he.toFixed(2));	    
			$("#he").val(he);	    
			$("#zong").val(zong.toFixed(2));	   
			changeBaoFei();
		}

		//获得公司信息
    	 	function getInsuranceType(producttype){
    	 	var incp_id=$("#INCP_ID").val();
    	 		$.ajax({
					type: "POST",
					url: "../servlet/defaultDispatcher",
					data: "__action=insure.getInsuPolicyType&incp_id="+incp_id,
					dataType: "json",
					success: function(data){
					var company=data.insuCompany;	
					var total_baofei=0;
					$("#incp_add").val(company.INCP_ADDRESS);
					$("#incp_phone").val(company.INCP_LINKTEL);
					$("#INSU_RATE").val(company.RATE);
    	 			$("#COEFFICIENT").val(company.FACTOR);
					$(".feilv").each(function(){$(this).val(company.RATE)});
    	 			$(".xishu").each(function(){$(this).val(company.FACTOR)});
    	 			/* $(".baofei").each(function(){
						var unit_baofei=0;	
						var id="unit_price"+this.id;
						unit_baofei=Math.round($("#"+id).val()*company.RATE*company.FACTOR/10)/100;
						total_baofei=total_baofei+unit_baofei;
						var len1=new String(unit_baofei).indexOf('.');
						if(len1!=-1){
							$(this).attr("value",new String(unit_baofei).substr(0,len1+3));
						}else{
							$(this).attr("value",unit_baofei);
						}
					});
					var len1=new String(total_baofei).indexOf('.');
					if(len1!=-1){
						$("#he").attr("value",new String(total_baofei).substr(0,len1+3));
					}else{
						$("#he").attr("value",total_baofei);
					} */
					//$("#he").val(getHe());
    	 			changeBaoFei();
				}});
    	 	}
		
			function setHe(){
				var companyRate = $("#INSU_RATE").val();
				var total_baofei = 0
				$(".baofei").each(function(){
					var unit_baofei=0;	
					var id="unit_price"+this.id;
					unit_baofei=Math.round($("#"+id).val() * companyRate * company.FACTOR/10)/100;
					total_baofei=total_baofei+unit_baofei;
					var len1=new String(unit_baofei).indexOf('.');
					if(len1!=-1){
						$(this).attr("value",new String(unit_baofei).substr(0,len1+3));
					}else{
						$(this).attr("value",unit_baofei);
					}
				});
				var len1=new String(total_baofei).indexOf('.');
				if(len1!=-1){
					return new String(total_baofei).substr(0,len1+3);
				}else{
					return total_baofei;
				}
			}
		
			function changeBaoFei(){
				var datebegin = $("#datebegin").val();
				var datebegin2 = $("#datebegin2").val();
				if(datebegin != "" && datebegin2 != ""){
					var companyRate = $("#INSU_RATE").val();
					var companyFactor = $(".xishu").first().val();
					if(companyRate == "" || companyFactor == ""){return;}
					var total_baofei = 0;
					var he = 0;
					var d1 = new Date(datebegin);
					var d2 = new Date(datebegin2);
					
					$(".baofei").each(function(){
						var unit_baofei=0;	
						var id="unit_price"+this.id;
						unit_baofei=Math.round($("#"+id).val() * companyRate * companyFactor/10)/100;
						total_baofei=total_baofei+unit_baofei;
						var len1=new String(unit_baofei).indexOf('.');
						if(len1!=-1){
							$(this).attr("value",new String(unit_baofei).substr(0,len1+3));
						}else{
							$(this).attr("value",unit_baofei);
						}
					});
					var len1=new String(total_baofei).indexOf('.');
					if(len1!=-1){
						he = new String(total_baofei).substr(0,len1+3);
					}else{
						he = total_baofei;
					}
					var dateDiff = ((d2 - d1) / 1000 / 60 / 60 / 24) + 1;
					if(he != "" && he != 0){
						var newHe = he / 365 * dateDiff;
						var len1 = new String(newHe).indexOf('.');
						if(len1 != -1){
							$("#he").val(new String(newHe).substr(0,len1+3));
						} else {
							$("#he").val(newHe);
						}
					}
				}
			}
		</script>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin2").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin3").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin4").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin5").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="insure.createInsuList">
				<input type="hidden" name="RECT_CODE" value="${contract.LEASE_CODE}">
			<input type="hidden" id="incu_id" name="incu_id_old" value="${incu_id }"/>
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新建保单</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险信息</td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险公司</th>
					<td><select name="INCP_ID" id="INCP_ID"
						style="height: 18px;width: 140px;" onchange="getInsuranceType('${product_type }')">
						<option value="">--请选择--</option>
			          	<c:forEach items="${insuCompany}" var="item">
			          		<option value="${item.INCP_ID}">${item.INCP_NAME}</option>
			          	</c:forEach>
					</select></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险公司电话</th>
					<td><input type="text" id="incp_phone"/></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险公司地址</th>
					<td><input type="text" name="RECEIVE_UNIT"  id="incp_add"  size="60" value="" ></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保单号</th>
					<td><input type="text" name="INCU_CODE" id="INCU_CODE" size="20" value=""  ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">投保人</th>
					<td><input type="text" name="TO_INSU_NAME" id="TO_INSU_NAME" size="20" value="<%=Constants.COMPANY_NAME %>"  ></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">投保人证件号码</th>
					<td><input type="text" name="TO_INSU_CERTIFICATE" id="TO_INSU_CERTIFICATE" size="20" value="555588235-0"  ></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">投保人地址</th>
					<td><input type="text" name="TO_INSU_ADDRESS" id="TO_INSU_ADDRESS"  size="60" value="215000江苏省苏州市工业园区通园路28号信息大厦9楼"/></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">收费凭证号</th>
					<td><input type="text" name="CHARGE_CODE"  id="CHARGE_CODE" size="20"  value="" /> </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">被保险人</th>
					<td><input type="text" name="INSU_NAME"  id="INSU_NAME" size="20"  value="<%=Constants.COMPANY_NAME %>" /></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">被保险人证件号码</th>
					<td><input type="text" name="INSU_CERTIFICATE"  id="INSU_CERTIFICATE" size="20"  value="555588235-0" /> </td>
				</tr>

				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">被保险人地址</th>
					<td><input type="text" name="INSU_ADDRESS" id="INSU_ADDRESS" size="60"  value="215000江苏省苏州市工业园区通园路28号信息大厦9楼"  /></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">抵押权人</th>
					<td><input type="text" name="MORTGAGE"  id="MORTGAGE" size="20"  value=""  /> </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">费率(‰)</th>
					<td><input type="text" name="INSU_RATE"  id="INSU_RATE" size="20"  value="" onKeyUp="jisuan(this)"/></td>
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">系数</th>
					<td><input type="text" name="COEFFICIENT"  id="COEFFICIENT" size="20"  value="" onKeyUp="jisuan(this)"/> </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
                                          	<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">投保险种：</th>										                                                                                                                                                                                                                                                                                                                                                                                             
							<td colspan="4" >
							<table cellspacing="0" cellpadding="0" border="0"class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr"><c:set value="${(fn:length(InsuType) + 1) / 5}" var="insureTypeListRow">
							</c:set><c:set value="1" var="row"></c:set>
							<c:forEach items="${InsuType}" var="insureType1" varStatus="status" >
							<td width ="25%"><input type="checkbox" name="intp_id" value="${insureType1.DATA_ID }" checked="checked"/>${insureType1.FLAG}&nbsp;&nbsp;&nbsp;</td>
							<c:if test="${status.count % 3 eq 0 and row eq insureTypeListRow}"><c:if test="${status.count % 3 eq 1 }"><td width ="25%">&nbsp;</td><td width ="25%">&nbsp;</td></c:if><c:if test="${status.count % 3 eq 2 }"><td width ="25%">&nbsp;</td></c:if></tr></c:if><c:if test="${status.count % 3 eq 0 }"></tr><tr class="ui-widget-content jqgrow ui-row-ltr"></c:if>
							<c:set value="${row + 1}" var="row"></c:set>
							</c:forEach>
							</table>
							</td>
																	</tr>
				
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">商业险投保期限</th>
					<td colspan="3">开始时间：<input type="text" name="INSU_START_DATE" id="datebegin"  value="${DELIVERY_DATE}" onchange="changeBaoFei()" /> 00：00时起，至 结束时间：<input type="text" name="INSU_END_DATE" id="datebegin2"  value="${DELIVERY_DATE}" onchange="changeBaoFei()" />24：00时止</td>

			    </tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">特别说明</th>
					<td colspan="7" valign="middle"><input type="checkbox" name="remark_type" value="Y" /><br/><textarea rows="2"  cols='140' name="REMARK" id="REMARK"  ></textarea></td>
			   	</tr>
			</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="13" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险项目及保险金额</td>
				</tr>
				<tr >
					<th style="text-align: center;height:26px;width:120px;width:30%" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="text-align: center;height:26px;width:120px;width:10%" class="ui-state-default ui-th-ltr zc_grid_head">保险金额</th>
					<th style="text-align: center;height:26px;width:120px;width:5%" class="ui-state-default ui-th-ltr zc_grid_head">费率（‰）</th>
					<th style="text-align: center;height:26px;width:120px;width:5%" class="ui-state-default ui-th-ltr zc_grid_head">系数</th>
					<th style="text-align: center;height:26px;width:120px;width:10%" class="ui-state-default ui-th-ltr zc_grid_head">保险费</th>
					<th style="text-align: center;height:26px;width:120px;width:40%" class="ui-state-default ui-th-ltr zc_grid_head">保险物所在地址</th>
				
				</tr>
					<c:forEach items="${eqmtType}" var="deepMap" varStatus="status">
				<tr>					
					<c:set scope="request" value="${deepMap.UNIT_PRICE+total_Price}" var="total_Price" ></c:set>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:25%">${deepMap.THING_NAME }&nbsp;<input  name="EQMT" type="hidden" value="${deepMap.EQMT_ID}"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:15%"><input type="text" name="zhi" value="${deepMap.UNIT_PRICE }" onKeyUp="jisuan(this)" id="unit_price${deepMap.EQMT_ID }" style="width:90%"/>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:5%"><input type="text" name="feilv" class="feilv" style="width:90%" readonly/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:5%"><input type="text" name="xishu" class="xishu" id="" style="width:90%" readonly/>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:15%"><input type="text" name="baofei" class="baofei" style="width:90%" id="${deepMap.EQMT_ID }" readonly/>&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;width:35%">${deepMap.EQUPMENT_ADDRESS}&nbsp;</td>			
				</tr>
					</c:forEach>
			</table>
						</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="13" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">金额总计</td>
				</tr>
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保险总金额</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><input name="INSU_PRICE_TOTAL" id="zong" value="<fmt:formatNumber pattern='#,##0.00' value="${total_Price }" />"/></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">总保险费</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><input name="INSU_PRICE" id="he"/></th>
				
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">投保确认时间：<input type="text" name="AFFIRM_INSU_DATE" id="datebegin3"  value="${DELIVERY_DATE}" /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">缴费确认时间：<input type="text" name="AFFIRM_SEIZE_DATE" id="datebegin4"  value="${DELIVERY_DATE}" /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保单打印时间：<input type="text" name="PRINT_INSU_DATE" id="datebegin5"  value="${DELIVERY_DATE}" /></th>
				
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="13" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">设备信息</td>
				</tr>
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">机号</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">设备厂商</th>
					<%--<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">车架号</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">合格证号</th>
					--%><th style="text-align: center;height:26px;width:90px;" class="ui-state-default ui-th-ltr zc_grid_head">设备单价</th>
				</tr>
					<c:forEach items="${eqmtType}" var="deepMap" varStatus="status">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.THING_NAME }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.MODEL_SPEC }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.THING_NUMBER }&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.BRAND}&nbsp;</td><%--
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.ENGINE_CODE}&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.FRAME_CODE}&nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.REGISTRATION_CODE}&nbsp;</td>
					--%><td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;height:24px;"><fmt:formatNumber type="currency" value="${deepMap.UNIT_PRICE }" ></fmt:formatNumber>&nbsp;</td>
			
				</tr>
					</c:forEach>
			</table>
			<center>
				<input type="button" name="sub" id="sub" class="ui-state-default ui-corner-all" onclick="subNotice();" value="提  交" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
