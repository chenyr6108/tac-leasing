<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>修改机号</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/link.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/createRentContract.js"></script>
		<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/selectEquipment.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSEE_TIME").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSOR_TIME").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSEE_TIME").bind('focus',function (){
				//alert(parseInt($("#ui-datepicker-div").css('top')));
				$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
			});
			$("#LESSOR_TIME").bind('focus',function (){
				$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
			});
		});
		
			function dateClick(){
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
			}
	
	function loadEquipmentManufacturer(id,value){
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=suplEquipment.getAllTypesByManufacturer&MANUFACTURER='+value,
			dataType:'json',
			success:function(dataBack){   
	   			var htm="<option  value='-1'>--厂牌--</option>";
	   			if(dataBack.manufacturer !=null ){
	   			for(i=0;i<dataBack.manufacturer.length;i++){
	   				htm=htm+"<option value="+dataBack.manufacturer[i].ID+">"+dataBack.manufacturer[i].NAME+"</option>";
	        	}
	        	}
	        	$(id).html(htm);
	        }   
	});
}

	function checkModifyThingNum(){
	 var form = document.rentContractForm;
	 var table = document.getElementById("equipmentTab");
	    if(table.rows.length >=3){
	    	//Add by Michael 2013 04-03 检查此次输入的机号是否有重复的
	    	var tempThingNum="";
	    	var tempProduct="";
		    for (var i = 0; i < table.rows.length-1; i++) {

		    	if (blank(form.NUMBER[i], '产品机号')) {
		    		return false;
		    	}

		        if(form.NUMBER[i].value!="待补机号" && form.NUMBER[i].value!="无机号" && form.NUMBER[i].value==tempThingNum && form.PRODUCT[i].value==tempProduct){
		        	alert("相同设备型号机号不允许重复！");
		        	return false;
		        }
		        tempProduct=form.PRODUCT[i].value;
		        tempThingNum=form.NUMBER[i].value;
	   		}
	    }
	}	
	
	function checkThingNumber(number){
		var product=$(number).parent().parent().children(":eq(2)").children(":eq(0)").val();
		var value = $(number).val() ;
		if(value.trim() != ""){
			if(!(product > 0)){
				alert("请选择产品型号") ;
				$(number).val("") ;
				return ;
			}
			
			if(value.trim() != "无机号" && value.trim() != "待补机号"){
				
				$.ajax({
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=suplEquipment.checkProductNumber&THING_NUMBER="+value+"&PRCD_ID="+${PRCD_ID}+"&PRODUCT_ID="+product,
					dataType:"json",
					success:function(json){
						if(json.count!=0){
							alert("产品机号已存在");
							$(number).val("") ;
						//	$(number).focus() ;
						}
						else{
							//alert("产品机号可以使用！");
						}
					},
					error:function(){
						alert('验证发生错误!');
					}
		     }); 
				
			}
		 }
		//$("#alertDiv").append(document.activeElement.id);
		$("#alertDiv").hide();
	}
	
	function showAlertDiv(e){
		var eoffset = $(e).offset();
		var height = parseInt($(e).css("height").replace("px", ""));
		var alertDiv = $("#alertDiv");
		//alertDiv.offset({ top: (eoffset.top + height + 10), left: eoffset.left });
		alertDiv.css("left", eoffset.left);
		alertDiv.css("top", eoffset.top + height + 8);
		/* alertDiv.css("left", "10px");
		alertDiv.css("top", "10px"); */
		$("#alertDiv").show();
		//$("#alertDiv").append("f");
	}
	
	function inputValue(text){
		var e = $("#" + document.activeElement.id);
		var thingNumberId = e.attr("class");
		e.data("oldVlaue", e.val());
		e.val(text);
		$("#" + thingNumberId).val(text);
	}
	function resetOld(){
		var e = $("#" + document.activeElement.id);
		var thingNumberId = e.attr("class");
		e.val(e.data("oldVlaue"));
		$("#" + thingNumberId).val(e.data("oldVlaue"));
	}
</script>		

<style type="text/css">
	#alertDiv .div-item{
		padding: 3px;
		background-color: white;
		cursor: default;
	}
	#alertDiv .div-item:hover{
		padding: 3px;
		background-color: #808080;
		cursor: default;
	}
</style>
</head>
<body>
	<div id="alertDiv" style="display: none; position: absolute; 
		border: 1px solid #808080; z-index: 99; background-color: white;"
	>
		<div class="div-item" onmouseover="inputValue('无机号');"
			onmouseout="resetOld()"
		>
			如无机号请输入：<font color="red" size="+1"><b>无机号</b></font>
		</div>
		<div class="div-item" onmouseover="inputValue('待补机号');"
			onmouseout="resetOld()"
		>
			如机号待补请输入：<font color="red" size="+1"><b>待补机号</b></font>
		</div>
	</div>
		<form action="${ctx }/servlet/defaultDispatcher" method="post" onsubmit="return checkModifyThingNum();"  name="rentContractForm" id="rentContractForm">
			<input type="hidden" name="__action"
				value="rentContractEquiMDF.modifyThingNumber">
			<input type="hidden" name="RECT_ID" value="${RECT_ID }">
			<input type="hidden" name="PRCD_ID" value="${PRCD_ID }">			
			<input type="hidden" name="CUST_ID" value="${cust.CUST_ID }">
			<input type="hidden" name="CUST_TYPE" value="${cust.CUST_TYPE }">
			<input type="hidden" name="CUST_CODE" value="${cust.CUST_CODE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${cust.CONTRACT_TYPE }">
			<center>
			<table width="982">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改机号</span>
					   	</div>
					   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
							<table width="982" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td>
										<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
										           				<div class="zc_grid_body jqgrowleft">
										        <div class="ui-state-default ui-jqgrid-hdiv ">
										<table id="equipmentTab" align="center" width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">

											<tr>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>制造商</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>厂牌</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>产品名称</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>规格型号</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>供应商</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>产品机号</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>含税价(元)</strong>
												</th>
												<!-- 
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>含税单价(元)</strong>
												</th>
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>单价(元)</strong>
												</th>
												<th align="center" width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong> 数量</strong>
												</th>
												<th align="center" width="6%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong> 单位</strong>
												</th>
												<th align="center" width="14%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong> 合计</strong>
												</th>
												 -->
												<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>锁码方式</strong>
												</th>
												<th align="center" width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
													&nbsp;
												</th>
											</tr>
											<c:set value="0" var="euqipTotal"></c:set>
											<c:forEach items="${equipmentList }" var="item" varStatus="status">
												<c:set value="${euqipTotal + item.UNIT_PRICE * item.AMOUNT}" var="euqipTotal"></c:set>
												<tr>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
												<select id="MANUFACTURER${ status.index }" name="MANUFACTURER" 
													onchange="loadEquipmentManufacturer(TYPE${ status.index },this.value);" disabled>
													<option value="-1">
														--制造商--
													</option>
													<c:forEach items="${manufacturerlist}" var="manufacturerlist">
														<option value="${manufacturerlist.MANUFACTURER }" 
														<c:if test="${manufacturerlist.MANUFACTURER eq item.MANUFACTURER }"> selected="selected"</c:if>>
															${manufacturerlist.MANUFACTURER }
														</option>
													</c:forEach> 	
												</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select id="TYPE${status.index }" name="TYPE"
															onchange="loadEquipmentKinds(KIND${status.index },this.value);$('#TYPE_NAME${status.index }').val(this.options[this.selectedIndex].text);" disabled>
															<option value="-1">
																--厂牌--
															</option>
															<c:forEach items="${typeList}" var="typeList">
																<c:if test="${typeList.TYPE_ID eq item.TYPE_ID }">
																	<option value="${typeList.TYPE_ID }" selected="selected">
																		${typeList.TYPE_NAME }
																	</option>
																</c:if>
															</c:forEach>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select id="KIND${status.index }" name="KIND"
															onchange="loadEquipmentProducts(PRODUCT${status.index },this.value);$('#KIND_NAME${status.index }').val(this.options[this.selectedIndex].text);" disabled>
															<option value="-1">
																--名称--
															</option>
															<c:forEach items="${item.kindList}" var="kindList">
																<option value="${kindList.KIND_ID }"
																	<c:if test="${kindList.KIND_ID eq item.KIND_ID }">selected="selected"</c:if>>
																	${kindList.KIND_NAME }
																</option>
															</c:forEach>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select id="PRODUCT${status.index }" name="PRODUCT"
															onchange="loadEquipmentSuppliers(SUPPIER${status.index },this.value,NUMBER${status.index });$('#PRODUCT_NAME${status.index }').val(this.options[this.selectedIndex].text);" disabled>
															<option value="-1">
																--型号--
															</option>
															<c:forEach items="${item.productList}" var="productList">
																<option value="${productList.PRODUCT_ID }"
																	<c:if test="${productList.PRODUCT_ID eq item.PRODUCT_ID }">selected="selected"</c:if>>
																	${productList.PRODUCT_NAME }
																</option>
															</c:forEach>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select id="SUPPIER${status.index }" name="SUPPIER"
															onchange="$('#SUPPIER_NAME${status.index }').val(this.options[this.selectedIndex].text);" disabled>
															<option value="-1">
																--供应商--
															</option>
															<c:forEach items="${item.supplierList}" var="supplierList">
																<option value="${supplierList.SUEQ_ID }"
																	<c:if test="${supplierList.SUPPLIER_ID eq item.SUPPLIER_ID }">selected="selected"</c:if>>
																	${supplierList.SUPPLIER_NAME }
																</option>
															</c:forEach>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" name="NUMBER" id="NUMBER${status.index }" value="${item.THING_NUMBER}" 
																class="NUMBER_NAME${status.index }"
																onchange="$('#NUMBER_NAME${status.index }').val(this.value);" 
																onblur="checkThingNumber(this) ;"
																onfocus="showAlertDiv(this);"
																>
													</td>													  
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">				
														<input class="input_right" type="text" id="SHUI_PRICE"
															name="SHUI_PRICE" size=8
															 value="${item.SHUI_PRICE }" readonly="readonly">
													</td>
													<!--
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input class="input_right" type="text" id="SHUI_PRICE"
															name="SHUI_PRICE" size=12 <c:if test="${cust.CONTRACT_TYPE eq null}">onchange="changeFields('SHUI_PRICE',this,'${rentContract.CONTRACT_TYPE }');"</c:if><c:if test="${rentContract.RECT_TYPE eq null}">onchange="changeFields('SHUI_PRICE',this,'${cust.CONTRACT_TYPE }');"</c:if> 
															value="<fmt:formatNumber value="${item.SHUI_PRICE }" type="currency" />" readonly>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input class="input_right" type="text" id="UNIT_PRICE"
															name="UNIT_PRICE" size=12 onchange="changeField('UNIT_PRICE',this);" 
															value="<fmt:formatNumber value="${item.UNIT_PRICE }" type="currency" />" readonly>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" id="AMOUNT" name="AMOUNT" size=3 onchange="changeField('AMOUNT',this);" 
															value="${item.AMOUNT }" readonly>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select name="UNIT" id="UNIT">
															<option value="台"
																<c:if test="${item.UNIT eq '台' }">selected="selected"</c:if>>
																-台-
															</option>
															<option value="辆"
																<c:if test="${item.UNIT eq '辆' }">selected="selected"</c:if>>
																-辆-
															</option>
															<option value="套"
																<c:if test="${item.UNIT eq '套' }">selected="selected"</c:if>>
																-套-
															</option>
															<option value="件"
																<c:if test="${item.UNIT eq '件' }">selected="selected"</c:if>>
																-件-
															</option>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" class="input_right" id="TOTAL" name="TOTAL" readonly="readonly"
															size=17
															value="<fmt:formatNumber value="${item.UNIT_PRICE * item.AMOUNT}" type="currency" />">
													</td>
													 -->
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<select name="LOCK_CODE" disabled>
														<c:forEach items="${lockList}" var="items">
															<c:choose>
																<c:when test="${items.CODE eq item.LOCK_CODE}">
																	<option value="${items.CODE }" selected="selected">${items.FLAG }</option>
																</c:when>
																<c:otherwise>
																	<option value="${items.CODE }">${items.FLAG }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														</select>
													</td>
													<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;
														<input type="hidden" name="TYPE_NAME" ID="TYPE_NAME${status.index }"
															value="${item.THING_KIND }">
														<input type="hidden" name="KIND_NAME" ID="KIND_NAME${status.index }"
															value="${item.THING_NAME }">
														<input type="hidden" name="PRODUCT_NAME" ID="PRODUCT_NAME${status.index }"
															value="${item.MODEL_SPEC }">
														<input type="hidden" name="NUMBER_NAME" ID="NUMBER_NAME${status.index }"
															value="${item.THING_NUMBER }">
														<input type="hidden" name="SUPPIER_NAME" ID="SUPPIER_NAME${status.index }"
															value="${item.BRAND }">
														<input type="hidden" name="EQMT_ID" id="EQMT_ID${status.index }"
															value="${item.EQMT_ID }">
														<input type="hidden" name="SUEQ_ID" id="SUEQ_ID${status.index }"
															value="${item.SUEQ_ID }">																
													</td>
												</tr>
											</c:forEach>
										</table>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" align="center">
														<input type="submit" name="subBut" value=修&nbsp;&nbsp;改
															class="ui-state-default ui-corner-all" cursor="hand">
													</td>
												</tr>
											</table>
										</div>
										</div>
										</div>									
									</td>
								</tr>
							</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</center>			
		</form>
	</body>
</html>
