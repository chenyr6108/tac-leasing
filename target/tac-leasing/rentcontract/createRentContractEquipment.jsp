<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript"
	src="${ctx }/rentcontract/js/selectEquipment.js"></script>
<script type="text/javascript">
var kindData = ${typeJsonList}
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
			$("#alertDiv").hide();
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
		function showAlertDiv(e){
			var eoffset = $(e).offset();
			var height = parseInt($(e).css("height").replace("px", ""));
			var alertDiv = $("#alertDiv");
			//alertDiv.offset({ top: (eoffset.top + height + 10), left: eoffset.left });
			alertDiv.css("left", eoffset.left - 14);
			alertDiv.css("top", eoffset.top + height - 36);
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
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
<table id="equipmentTab" align="center" width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="13" style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>&nbsp;&nbsp;客户购买意向</strong>
		</td>
		<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
		<td colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head">
			相关操作：
			<img src="${ctx }/images/u100.gif" onclick="addEquipmentRow();">
			<a href="javascript:void(0);" style="cursor: pointer;"
				onclick="addEquipmentRow();">添加</a>
		</td> --%>
	</tr>
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
			<strong>留购价(元)</strong>
		</th>
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
		
		<th align="center" width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>锁码方式</strong>
		</th>
		<!-- 2011/12/31 Yang Yun 客户购买意向字段锁定
		<th align="center" width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>操作</strong>
		</th> -->
	</tr>
	<c:set value="0" var="euqipTotal"></c:set>
	<c:forEach items="${equipmentList }" var="item" varStatus="status">
		<c:set value="${euqipTotal + item.UNIT_PRICE * item.AMOUNT}" var="euqipTotal"></c:set>
		<tr>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
				<select id="MANUFACTURER${ status.index }" name="MANUFACTURER" 
					onchange="loadEquipmentManufacturer(TYPE${ status.index },this.value);">
					<option value="-1">
						--制造商--
					</option>
					<c:forEach items="${manufacturer}" var="manufacturer">
						<option value="${manufacturer.MANUFACTURER }" 
							<c:if test="${manufacturer.MANUFACTURER eq item.MANUFACTURER }">selected="selected"</c:if>>
							${manufacturer.MANUFACTURER }
						</option>
					</c:forEach> 	
				</select> --%>
				
				<select id="MANUFACTURER${ status.index }" name="MANUFACTURER" disabled="disabled">
					<!-- Marked by Michael 2012 02/03 修正合同初审时制造商信息带错 Bug
					<option value="-1">
						--制造商--
					</option>
					-->
					<c:forEach items="${manufacturer}" var="manufacturer">
						<c:if test="${manufacturer.MANUFACTURER eq item.MANUFACTURER }">
						<option value="${manufacturer.MANUFACTURER }" selected="selected">
							${manufacturer.MANUFACTURER }
						</option>
						<input type="hidden" name="MANUFACTURER" value="${manufacturer.MANUFACTURER }"/>
						</c:if>
					</c:forEach> 	
				</select>
				
				
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
				<select id="TYPE${status.index }" name="TYPE"
					onchange="loadEquipmentKinds(KIND${status.index },this.value);$('#TYPE_NAME${status.index }').val(this.options[this.selectedIndex].text);">
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
				</select> --%>
				<select id="TYPE${status.index }" name="TYPE" disabled="disabled">
					<option value="-1">
						--厂牌--
					</option>
					<c:forEach items="${typeList}" var="typeList">
						<c:if test="${typeList.TYPE_ID eq item.TYPE_ID }">
							<option value="${typeList.TYPE_ID }" selected="selected">
								${typeList.TYPE_NAME }
							</option>
							<input type="hidden" name="TYPE" value="${typeList.TYPE_ID }"
								onchange="$('#TYPE_NAME${status.index }').val('${typeList.TYPE_NAME }');"/>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
				<select id="KIND${status.index }" name="KIND"
					onchange="loadEquipmentProducts(PRODUCT${status.index },this.value);$('#KIND_NAME${status.index }').val(this.options[this.selectedIndex].text);">
					<option value="-1">
						--名称--
					</option>
					<c:forEach items="${item.kindList}" var="kindList">
						<option value="${kindList.KIND_ID }"
							<c:if test="${kindList.KIND_ID eq item.KIND_ID }">selected="selected"</c:if>>
							${kindList.KIND_NAME }
						</option>
					</c:forEach>
				</select> --%>
				<select id="KIND${status.index }" name="KIND" disabled="disabled">
					<option value="-1">
						--名称--
					</option>
					<c:forEach items="${item.kindList}" var="kindList">
						<c:if test="${kindList.KIND_ID eq item.KIND_ID }">
							<option value="${kindList.KIND_ID }"
								selected="selected">
								${kindList.KIND_NAME }
							</option>
							<input type="hidden" name="KIND" value="${kindList.KIND_ID }"
								onchange="$('#KIND_NAME${status.index }').val('${kindList.KIND_NAME }');"/>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
				<select id="PRODUCT${status.index }" name="PRODUCT"
					onchange="loadEquipmentSuppliers(SUPPIER${status.index },this.value,NUMBER${status.index });$('#PRODUCT_NAME${status.index }').val(this.options[this.selectedIndex].text);">
					<option value="-1">
						--型号--
					</option>
					<c:forEach items="${item.productList}" var="productList">
						<option value="${productList.PRODUCT_ID }"
							<c:if test="${productList.PRODUCT_ID eq item.PRODUCT_ID }">selected="selected"</c:if>>
							${productList.PRODUCT_NAME }
						</option>
					</c:forEach>
				</select> --%>
				<select id="PRODUCT${status.index }" name="PRODUCT" disabled="disabled">
					<option value="-1">
						--型号--
					</option>
					<c:forEach items="${item.productList}" var="productList">
						<c:if test="${productList.PRODUCT_ID eq item.PRODUCT_ID }">
							<option value="${productList.PRODUCT_ID }"
								selected="selected">
								${productList.PRODUCT_NAME }
							</option>
							<input type="hidden" name="PRODUCT" value="${productList.PRODUCT_ID }"
								onchange="$('#PRODUCT_NAME${status.index }').val('${productList.PRODUCT_NAME }');"/>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
				<select id="SUPPIER${status.index }" name="SUPPIER"
					onchange="$('#SUPPIER_NAME${status.index }').val(this.options[this.selectedIndex].text);">
					<option value="-1">
						--供应商--
					</option>
					<c:forEach items="${item.supplierList}" var="supplierList">
						<option value="${supplierList.SUEQ_ID }"
							<c:if test="${supplierList.SUPPLIER_ID eq item.SUPPLIER_ID }">selected="selected"</c:if>>
							${supplierList.SUPPLIER_NAME }
						</option>
					</c:forEach>
				</select> --%>
				<select id="SUPPIER${status.index }" name="SUPPIER" disabled="disabled">
					<option value="-1">
						--供应商--
					</option>
					<c:forEach items="${item.supplierList}" var="supplierList">
						<c:if test="${supplierList.SUPPLIER_ID eq item.SUPPLIER_ID }">
							<option value="${supplierList.SUEQ_ID }"
								selected="selected">
								${supplierList.SUPPLIER_NAME }
							</option>
							<input type="hidden" name="SUPPIER" value="${supplierList.SUEQ_ID }"
								onchange="$('#SUPPIER_NAME${status.index }').val('${supplierList.SUPPLIER_NAME }');"/>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
<%-- 			<input type="text" name="NUMBER" id="NUMBER${status.index }" value="${item.THING_NUMBER}" 
					onchange="$('#NUMBER_NAME${status.index }').val(this.value);"
					onblur="checkThingNumber(this) ;"> --%>
	<!-- 不检查机号重复 -->
	<input type="text" name="NUMBER" id="NUMBER${status.index }" value="${item.THING_NUMBER}" 
					class="NUMBER_NAME${status.index }"
					onchange="$('#NUMBER_NAME${status.index }').val(this.value);"
					onblur="checkThingNumber(this) ;" 
					onfocus="showAlertDiv(this);">				
				<!-- 
				<select id="NUMBER${status.index }" name="NUMBER"
				   onchange="$('#NUMBER_NAME${status.index }').val(this.options[this.selectedIndex].value);">
					<option value="-1">
						--机号--
					</option>
					<c:forEach items="${item.numberList}" var="numberList">
						<option value="${numberList.ID }"
							<c:if test="${numberList.ID eq item.NUMBER_ID }">selected="selected"</c:if>>
							${numberList.NAME }
						</option>
					</c:forEach>
				</select>
				-->
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<!-- 2011/12/31 Yang Yun 客户购买意向字段锁定 增加代码（readonly="readonly"）-->
				<input class="input_right" type="text" id="STAYBUY_PRICE" readonly="readonly"
					name="STAYBUY_PRICE" size=8
					value="<fmt:formatNumber value="${item.STAYBUY_PRICE }" type="currency" />">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 2011/12/31 Yang Yun 客户购买意向字段锁定 -->
				<input class="input_right" type="text" id="SHUI_PRICE" readonly="readonly"
					name="SHUI_PRICE" size=12 <c:if test="${cust.CONTRACT_TYPE eq null}">onchange="changeFields('SHUI_PRICE',this,'${rentContract.CONTRACT_TYPE }');"</c:if><c:if test="${rentContract.RECT_TYPE eq null}">onchange="changeFields('SHUI_PRICE',this,'${cust.CONTRACT_TYPE }');"</c:if> 
					value="<fmt:formatNumber value="${item.SHUI_PRICE }" type="currency" />">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 2011/12/31 Yang Yun 客户购买意向字段锁定 -->
				<input class="input_right" type="text" id="UNIT_PRICE" readonly="readonly"
					name="UNIT_PRICE" size=12 onchange="changeField('UNIT_PRICE',this);" 
					value="<fmt:formatNumber value="${item.UNIT_PRICE }" type="currency" />">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 2011/12/31 Yang Yun 客户购买意向字段锁定 -->
				<input type="text" id="AMOUNT" name="AMOUNT" size=3 onchange="changeField('AMOUNT',this);" readonly="readonly"
					value="${item.AMOUNT }">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
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
				</select> --%>
				${item.UNIT }
				<input type="hidden" value="${item.UNIT }" name="UNIT" id="UNIT">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" class="input_right" id="TOTAL" name="TOTAL" readonly="readonly"
					size=17
					value="<fmt:formatNumber value="${item.UNIT_PRICE * item.AMOUNT}" type="currency" />">
			</td>
			
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="LOCK_CODE">
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
			<%-- 2011/12/31 Yang Yun 客户购买意向字段锁定
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0);" onclick="deleteRow.call(this)">删除</a>
			--%>
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
				<input type="hidden" name="EQMT_ID" value="0" id="EQMT_ID${status.index }">
				
				<!-- Add by Michael 2012 4-18 增加重车相关资料 -->
				<input type="hidden" name="CAR_COLOR" ID="CAR_COLOR${status.index }"
				value="${item.CAR_COLOR }">
				<input type="hidden" name="CAR_RIGSTER_NUMBER" ID="CAR_RIGSTER_NUMBER${status.index }"
				value="${item.CAR_RIGSTER_NUMBER }">
				<input type="hidden" name="CAR_ID_NUMBER" ID="CAR_ID_NUMBER${status.index }"
				value="${item.CAR_ID_NUMBER }">
				<input type="hidden" name="CAR_ENGINE_NUMBER" ID="CAR_ENGINE_NUMBER${status.index }"
				value="${item.CAR_ENGINE_NUMBER }">				
				<input type="hidden" name="CAR_IMPORT_DOMESTIC" ID="CAR_IMPORT_DOMESTIC${status.index }"
				value="${item.CAR_IMPORT_DOMESTIC }">	
								
			</td> 
		</tr>

	</c:forEach>

	<tr>
		<td colspan="9" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="totalUpper"><script type="text/javascript">document.write(atoc(parseFloat(${euqipTotal }).toFixed(0)));</script>
			</span>
		</td>
		<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：￥）
			<input name="LEASE_TOPRIC" id="LEASE_TOPRIC" readonly="readonly"
				value="<fmt:formatNumber value="${euqipTotal}" type="currency" maxFractionDigits="0"/>"> <!-- Modify By Michael 2011 11/21 For修正四舍五入Bug -->
		</td>
	</tr>
</table>
</div>
</div>
</div>