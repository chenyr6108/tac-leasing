<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/credit/car/js/paylistLink.js"></script>
<script type="text/javascript" src="${ctx }/credit/car/js/paylistIrrMonthPrice.js"></script>
		<script type="text/javascript">
		function lockIt() {
			alert("税费方案与租赁方式锁定！请返回租赁方案tab修改");
		}
		function expQuoToPdf(id) {
		    var form = document.payForm;
		    
		    //
		    if (notPositive(form.PAY_LEASE_PERIOD, '租赁期数')) {
		        return ;
		    } 
		    // 租赁周期
		    if (form.PAY_LEASE_TERM.value == 0) {
		    	form.PAY_LEASE_TERM.value=1;
		    	form.PAY_LEASE_TERM.focus();
		    	return;
		    }
		    // 支付方式
		    if (form.PAY_PAY_WAY.value == 0) {
		    	alert("请选择支付方式!");
		    	form.PAY_PAY_WAY.focus();
		    	return;
		    }
			// 
		    if (notPositive(form.PAY_LEASE_TOPRIC, '融资租赁总价值')) {
		        return;
		    }
			// 
		    if (notPositive(form.PAY_PLEDGE_PRICE_RATE, '保证金（比率）')) {
		        return;
		    }
		    if (notPositive(form.PAY_PLEDGE_PRICE, '保证金')) {
		        return;
		    }
		    //
		    if (notPositive(form.PAY_HEAD_HIRE_PERCENT, '首期租金（比率）')) {
		        return;
		    }
		    if (notPositive(form.PAY_HEAD_HIRE, '首期租金')) {
		        return;
		    }
		    //
		    if (notPositive(form.PAY_LEASE_RZE, '概算成本（RZE）')) {
		        return;
		    }
		    //
		    //
		    if (checkNumber(form.PAY_FLOAT_RATE, '利率上浮比例')) {
		        return;
		    }
		    //
		    if (checkNumber(form.PAY_YEAR_INTEREST, '合同利率')) {
		        return;
		    }
		    //
		    //if (notPositive(form.PAY_PLEDGE_REALPRIC, '保证金')) {
		   //     return;
		   // }
		    //
		    var paylines = document.getElementsByName("MONTH_PRICE");
		    for (var i=0;i<paylines.length;i++){
		    
		   	 	if (positive(form.MONTH_PRICE[i], '每期租金')) {
		            return;
		        }
		    }
		    //
		    var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");
			
			if (PAY_IRR_MONTH_PRICE.length == 0 ) {
				alert("请填写未税应付租金！");
				return false;
			} else if (PAY_IRR_MONTH_PRICE.length == 1) {
				if (positive(form.PAY_IRR_MONTH_PRICE, '未税应付租金')) {
		            return false;
		        }
			} else {
				for (var i=0;i<PAY_IRR_MONTH_PRICE.length;i++){
		    
			   	 	if (positive(form.PAY_IRR_MONTH_PRICE[i], '未税应付租金')) {
			            return false;
			        }
			    }
			}
			checkBZJ();
		    
			var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
			for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
		   
				if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.PAY_LEASE_PERIOD.value){
					alert("你选择的未税应付租金期数与租赁方案中租赁期数不符！");
					return false;
				}
		    }
			form.__action.value = "expQuoToPdf.expPayToPdf";
		    $("#each_price").val(parseCurrency($("#each_price").val()));
			$("#each2_price").val(parseCurrency($("#each2_price").val()));
    
			form.submit();		
//			each_price=parseCurrency($("#each_price").val());
//			each2_price=parseCurrency($("#each2_price").val());
//			location.href='../servlet/defaultDispatcher?__action=expQuoToPdf.expPayToPdf&id='+id+'&each_price='+each_price+'&each2_price='+each2_price;
		}
		function changePayPledgeLastPrice(){
			form=document.payForm;
			var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");
			var PAY_IRR_MONTH_PRICE_START = document.getElementsByName("PAY_IRR_MONTH_PRICE_START");
			var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
			if(PAY_IRR_MONTH_PRICE_END.length==0){
				alert("请添加每期应付未税租金");
				$("#PAY_PLEDGE_LAST_PERIOD").val(0);
				return false;
			}
			
			var PLEDGE_LAST_PERIOD = parseInt(form.PAY_PLEDGE_LAST_PERIOD.value);
			for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
				if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.PAY_LEASE_PERIOD.value){
					$("#PAY_PLEDGE_LAST_PERIOD").val(0);
					alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
					return false;
				}else if(i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value == form.PAY_LEASE_PERIOD.value){
					if(PLEDGE_LAST_PERIOD>parseInt(PAY_IRR_MONTH_PRICE_END[i].value)){
						$("#PAY_PLEDGE_LAST_PERIOD").val(0);
						alert("用于抵充最后期数应小于或等于租赁方案中的租赁期数！");
						return false;
					}else{
						if(PLEDGE_LAST_PERIOD-1<=(parseInt(PAY_IRR_MONTH_PRICE_END[i].value)-parseInt(PAY_IRR_MONTH_PRICE_START[i].value))){
							form.PAY_PLEDGE_LAST_PRICE.value=parseCurrency(PAY_IRR_MONTH_PRICE[i].value)*PLEDGE_LAST_PERIOD;
						}else{
							var total_pledge_last_price=0.0;
							var temp_pledge_last_period=PLEDGE_LAST_PERIOD;
							
							var j=i;
							while (temp_pledge_last_period>0){
								if(temp_pledge_last_period>=(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1)){
									total_pledge_last_price=total_pledge_last_price+parseCurrency(PAY_IRR_MONTH_PRICE[j].value)*(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1);
								}else{
									total_pledge_last_price=total_pledge_last_price+parseCurrency(PAY_IRR_MONTH_PRICE[j].value)*temp_pledge_last_period;
								}
								temp_pledge_last_period=temp_pledge_last_period-(parseInt(PAY_IRR_MONTH_PRICE_END[j].value)-parseInt(PAY_IRR_MONTH_PRICE_START[j].value)+1);
								j--;
							}
							
							form.PAY_PLEDGE_LAST_PRICE.value=total_pledge_last_price;
						}
					}
				}
			}
			paylistchangeRZE();
			paylistchangePledgeRealPrice();
		}	
		
		function changeLastRentPrice(){
			$("#PAY_PLEDGE_LAST_PRICE").val(0);
			$("#PAY_PLEDGE_LAST_PERIOD").val(0);
			paylistchangeRZE();
			paylistchangePledgeRealPrice();
		}
		</script>
		<script type="text/javascript"> 
		function changeTax() {
			if($("#PAY_TAX_PLAN_CODE").val()==4||$("#PAY_TAX_PLAN_CODE").val()==6||$("#PAY_TAX_PLAN_CODE").val()==7||$("#PAY_TAX_PLAN_CODE").val()==8) {
				$("#aaa").html("用于一次抵冲租金");
				$("#aaa1").hide();
				$("#aaa2").hide();
				$("#aaa3").hide();
			} else {
				$("#aaa").html("用于平均抵冲金额");
				$("#aaa1").show();
				$("#aaa2").show();
				$("#aaa3").show();
			}
			if($("#PAY_TAX_PLAN_CODE").val()==5) {
				$("#pay1").show();
				$("#pay2").show();
				$("#pay3").show();
				$("#pay4").show();
				$("#pay5").show();
				$("#pay6").show();
				$("#incomePay").show();
				$("#incomePayTax").show();
				$("#outPay").show();
				$("#incomePayType").show();
			} else {
				$("#pay1").hide();
				$("#pay2").hide();
				$("#pay3").hide();
				$("#pay4").hide();
				$("#pay5").hide();
				$("#pay6").hide();
				$("#incomePay").hide();
				$("#incomePayTax").hide();
				$("#outPay").hide();
				$("#incomePayType").hide();
			}
		}
		$(function (){
			if($("#PAY_TAX_PLAN_CODE").val()==4||$("#PAY_TAX_PLAN_CODE").val()==6||$("#PAY_TAX_PLAN_CODE").val()==7||$("#PAY_TAX_PLAN_CODE").val()==8) {
				$("#aaa").html("用于一次抵冲租金");
			} else {
				$("#aaa").html("用于平均抵冲金额");
			}
			if($("#PAY_TAX_PLAN_CODE").val()==5) {
				document.getElementById("yearRent11").innerHTML=Number($("#totalRenPrice").val()/(${paylist.LEASE_TOPRIC }-${paylist.PLEDGE_AVE_PRICE})/($("#PAY_LEASE_PERIOD").val()/12)*100).toFixed(2)+'%';
				$("#pay1").show();
				$("#pay2").show();
				
				if($("#PAY_LEASE_TOPRIC").val().replace(/[￥,]/g, '')-$("#PAY_PLEDGE_PRICE").val().replace(/[￥,]/g, '')<100000) {
					document.getElementById("pay3").innerHTML="手续费收入：";/* 2000 */
					document.getElementById("pay4").innerHTML="手续费收入税额：";/* +(2000*0.055).toString() */
					document.getElementById("pay6").innerHTML="";/* 2000 */
					if($("#incomePay").val()=="") {
						$("#incomePay").val(2000);
						$("#incomePayTax").val(2000*0.055);
					} else {
						$("#incomePayTax").val($("#incomePay").val()*0.055);
					}
					if($("#outPay").val()==""||$("#outPay").val()==0) {
						$("#outPay").val(2000);
					}
				} else {
					document.getElementById("pay3").innerHTML="手续费收入：";/* 2500 */
					document.getElementById("pay4").innerHTML="手续费收入税额：";/* +(2500*0.055).toString() */
					document.getElementById("pay6").innerHTML="";/* 2500 */
					if($("#incomePay").val()=="") {
						$("#incomePay").val(2500);
						$("#incomePayTax").val(2500*0.055);
					} else {
						$("#incomePayTax").val($("#incomePay").val()*0.055);
					}
					if($("#outPay").val()==""||$("#outPay").val()==0) {
						$("#outPay").val(2500);
					}
				}
				paylistchangeRZE();
				$("#pay3").show();
				$("#pay4").show();
				$("#pay5").show();
				$("#pay6").show();
				$("#incomePayType").show();
			} else {
				$("#pay1").hide();
				$("#pay2").hide();
				$("#pay3").hide();
				$("#pay4").hide();
				$("#pay5").hide();
				$("#pay6").hide();
				$("#incomePay").css("display","none");
				$("#incomePayTax").css("display","none");
				$("#outPay").css("display","none");
				$("#incomePayType").hide();
			}
			$("#PAY_START_DATE").datepicker($.datepicker.regional["zh-CN"]);
			
			var tax=0;
			if($("#PAY_TAX_PLAN_CODE").val()=='4') {
				tax=$("#totalPayAddTax1").val();
			} else if($("#PAY_TAX_PLAN_CODE").val()=='6') {
				tax=$("#totalPayAddTax1").val()/1.1;
			} else {
				tax=$("#totalPayAddTax1").val();
			}
			
			if($("#PAY_TAX_PLAN_CODE").val()==4||$("#PAY_TAX_PLAN_CODE").val()==6||$("#PAY_TAX_PLAN_CODE").val()==7||$("#PAY_TAX_PLAN_CODE").val()==8) {
				//含税年平息
				document.getElementById("yearRent").innerHTML=Number($("#totalRenPrice").val()/(${paylist.LEASE_TOPRIC }-${paylist.PLEDGE_AVE_PRICE})/($("#PAY_LEASE_PERIOD").val()/12)*100).toFixed(2)+'%';
				//未税年平息
				document.getElementById("yearRent1").innerHTML=Number(($("#totalRenPrice").val()-tax)/(${paylist.LEASE_TOPRIC }-${paylist.PLEDGE_AVE_PRICE})/($("#PAY_LEASE_PERIOD").val()/12)*100).toFixed(2)+'%';
				if($("#PAY_TAX_PLAN_CODE").val()==4) {
				document.getElementById("valueAdd").innerHTML=$("#totalPayAddTax").val();
				document.getElementById("valueAdd1").innerHTML=$("#incomeTax").val();
				}
			}
			if($("#PAY_TAX_PLAN_CODE").val()==4||$("#PAY_TAX_PLAN_CODE").val()==6||$("#PAY_TAX_PLAN_CODE").val()==7||$("#PAY_TAX_PLAN_CODE").val()==8) {
				$("#aaa1").hide();
				$("#aaa2").hide();
				$("#aaa3").hide();
			}
			if($("#PAY_TAX_PLAN_CODE").val()==7) {
				$("#pay1").show();
				$("#pay2").show();
				paylistchangeRZE();
			}
		});
		var baseRate = ${baseRateJson};
		</script>
		<script type="text/javascript"> 
			function addWuzdRow(){
				var tab = document.getElementById("wuzd");
				var trs = tab.rows.length-1;
				var leasePeriod = getLeasePeriod();
				var value =1;
				if (trs>0){
					var lastTr = tab.rows[trs];
					var lastVal = $(lastTr).find("select").val();
					if (lastVal >= leasePeriod) {
						alert("上一结束期次已经到达租赁期数的最大值！");
						return ;
					} else {
						value = Number(lastVal) + 1;
					}
				}
				var tid = document.getElementById("wuzd");
				var row = tid.insertRow(trs+1);
				addWuzd(row,0,'NAME', null);	
				addWuzd(row,1,'VALUE',value);	
				addWuzd(row,2,'DELSPAN',null);	
				
				hideWuzdDelSpan();
			}
			function addWuzd(row, index, name,value){
				var sed = document.getElementById("wuzd").rows.length;
				var html='';
				var cell = row.insertCell(index); 
				cell.className = "ui-widget-content jqgrow ui-row-ltr";
				
				if (name == "NAME") {
					html = html + "融资租赁总价值<font color=\"red\">&nbsp;*</font>";
				}
				if (name == "VALUE"){
					html = html + '<input type="text"  name="W" class="input_right" style="width: 130px;" value="">';
					html = html + '第<select name="W">';
					for (var i=0;i<=getLeasePeriod();i++){
							html = html + '<option value="'+i+'">'+i+'</option>';
						}
					html = html + '</select>月支付';					
				}
				if (name == "DELSPAN"){
					html = html + '<span name="wuzdDelSpan" style="display: block;"><input type="button" name="delBut" onclick="deleteWuzdRow(this)" value="删 除" class="ui-state-default ui-corner-all"></span>'
				}
				cell.innerHTML =html;
				row.appendChild(cell);
				return;
			}
			
			function deleteWuzdRow(obj){
			   var tr = obj.parentNode.parentNode.parentNode;
			   tr.parentNode.removeChild(tr); 
			   hideWuzdDelSpan();
			}
			function hideWuzdDelSpan(){
				var spans = document.getElementsByName("wuzdDelSpan");
				var len = spans.length-1;
				for (var i=0;i<spans.length;i++){
					if (i != len){
						spans[i].style.display = 'none';
					} else {
						spans[i].style.display = 'block';
					}
				}
			}	
			
			function jsPayListAddItemToSelect() {       
				jsPayAddItemToobjSelect();
				jsPayAddItemToobjSelectDefer();
			}
			
			function jsPayAddItemToobjSelect() {       
				var objSelect=document.getElementById("PAY_PLEDGE_LAST_PERIOD");
				var value=objSelect.value;
				//先将值清空
				objSelect.options.length=0;
				
				//增加 0
				 var varItem0 = new Option(0, 0);
				 objSelect.options.add(varItem0);
				 for (var i=1;i<=getLeasePeriod();i++){
					 var varItem = new Option(i, i);
					 objSelect.options.add(varItem);
					 
					 if (i==value){
						 objSelect.options[i].selected=true;
					 }
				 }
			}
			
			function jsPayAddItemToobjSelectDefer() {       
				// Add by Michael 2013 02-01 增加延迟拨款期数
				var objSelectDefer=document.getElementById("PAY_DEFER_PERIOD");
				var value1 = objSelectDefer.value;
				objSelectDefer.options.length=0;
				
				//增加 0
				 var varItem0 = new Option(0, 0);
				 objSelectDefer.options.add(varItem0);
				 
				 for (var i=1;i<=getLeasePeriod();i++){
					 var varItem = new Option(i, i);
					 objSelectDefer.options.add(varItem);
					 if (i==value1){
						 objSelectDefer.options[i].selected=true;
					 }
				 }
			}

			function changeRze1() {
				$("#incomePayTax").val($("#incomePay").val()*0.055);
				paylistchangeRZE();
			}
			
			function changeIncomePayType(e){
				if($(e).val() == "1"){
					$("#incomePay").val(0);
					$("#incomePay").attr("readOnly", true);
				} else {
					$("#incomePay").attr("readOnly", false);
				}
			}
			
			$(function (){
				if($("#incomePayType").val() == "1"){
					$("#incomePay").val(0);
					$("#incomePay").attr("readOnly", true);
				} else {
					$("#incomePay").attr("readOnly", false);
				}
			});
			
		</script>		
<form action="../servlet/defaultDispatcher" name="payForm" id="payForm" onsubmit="return submitPayForm();" method="post">
	<input type="hidden" name="__action" value="">
	<input type="hidden" name="functionFrom" value="${SUPPORT }">
	<input type="hidden" name="credit_id" id="cccccc" value="${creditMap.ID }">
	<input type="hidden" name="contract_type" id="contract_type" value="${creditMap.CONTRACT_TYPE }">
	<input type="hidden" name="word" value="${word }">
	<input type="hidden" value="<fmt:formatNumber value="${paylist.LEASE_TOPRIC/1.17*0.17 }" type="currency" />" id='incomeTax'>
	<c:forEach items="${paylist.paylines }" var="item"  varStatus="status">
	<input type="hidden" name="FIRST_OWN_PRICE" id="FIRST_OWN_PRICE${ status.count }" value="<fmt:formatNumber value="${item.REAL_OWN_PRICE }" type="currency" />" />
	</c:forEach>
	<c:if test="${SUPPORT eq 'Y' }"><button onclick="submitCalCulate('2','2');" class="panel_button" type="button">测算并更新合同租赁方案与支付表</button><br>*如果租赁方案中的设备单价信息需要修改,请先至租赁方案进行修改<br><br></c:if>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           	<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
	<table width="982" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="wuzd">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
				<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁方案</b>
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				融资租赁总价值<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_LEASE_TOPRIC" id="PAY_LEASE_TOPRIC" onchange="changeFieldPay('PAY_LEASE_TOPRIC',this);"
					value="<fmt:formatNumber value="${paylist.LEASE_TOPRIC }" type="currency" />"
					class="input_right" style="width: 130px;" <c:if test="${SUPPORT ne 'Y' }">readonly="readonly"</c:if>>
			</td>
		 
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				概算成本（RZE）
			</td>
			<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_LEASE_RZE" id="PAY_LEASE_RZE" readonly="readonly"
					value="<fmt:formatNumber value="${paylist.LEASE_RZE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
		</tr>

		<tr>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				租赁期数<font color="red">&nbsp;*</font>
			</td>
			<td width="25%" style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_LEASE_PERIOD',this);jsPayListAddItemToSelect();"
					name="PAY_LEASE_PERIOD" id="PAY_LEASE_PERIOD"
					value="${paylist.LEASE_PERIOD }" style="width: 60px;">
			</td>
			<td width="17%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				租赁周期<font color="red">&nbsp;*</font>
			</td>
			<td width="43%"   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_LEASE_TERM" id="PAY_LEASE_TERM"
					onchange="changeFieldPay('PAY_LEASE_TERM',this);">
					<option value="1"
						<c:if test="${paylist.LEASE_TERM eq 1 }">selected="selected"</c:if>>
						月份
					</option>
					<option value="2"
						<c:if test="${paylist.LEASE_TERM eq 2 }">selected="selected"</c:if>>
						双份
					</option>
					<option value="3"
						<c:if test="${paylist.LEASE_TERM eq 3 }">selected="selected"</c:if>>
						季度
					</option>
					<option value="6"
						<c:if test="${paylist.LEASE_TERM eq 6 }">selected="selected"</c:if>>
						半年
					</option>
					<option value="12"
						<c:if test="${paylist.LEASE_TERM eq 12 }">selected="selected"</c:if>>
						年度
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				支付方式<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_PAY_WAY" id="PAY_PAY_WAY" onchange="changeFieldPay('PAY_PAY_WAY',this);">
					<c:forEach items="${payWays}" var="item">
						<option value="${item.CODE }"
							<c:if test="${ paylist.PAY_WAY eq item.CODE }"> selected="selected"</c:if>>
							${item.FLAG }
						</option>
					</c:forEach>
				</select>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				预估起租日
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_START_DATE" id="PAY_START_DATE"
					value="<fmt:formatDate value="${paylist.START_DATE }" pattern="yyyy-MM-dd" />"
					style="width: 100px" readonly="readonly" />
			</td>
		</tr>		
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税费测算方案<font color="red">&nbsp;*</font>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="PAY_TAX_PLAN_CODE" id="PAY_TAX_PLAN_CODE" onchange="changeTax()" onclick="lockIt()" onfocus="lockIt()">
						<c:forEach items="${taxPlanList}" var="item">
							<option value="${item.CODE }"
								<c:if test="${ paylist.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
							</option>
						</c:forEach>
				</select>
				<input type="hidden" name="TOTAL_VALUEADDED_TAX" id="TOTAL_VALUEADDED_TAX" value="${empty paylist.TOTAL_VALUEADDED_TAX?0:paylist.TOTAL_VALUEADDED_TAX}"/>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay1" style="font-size:14px;display: none;">佣金<font color="red">&nbsp;*</font></span>&nbsp;
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay2" style="font-size:14px;"><input id="pay__money" name="pay__money" value="${empty paylist.SALES_PAY?0:paylist.SALES_PAY }" onchange="paylistchangeRZE()" onkeyup="value=value.replace(/[^\d]/g,'')"></span>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span id="pay3" style="font-size:14px;">手续费收入：</span>
				
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="incomePayType" id="incomePayType" onchange="changeIncomePayType(this);">
					<option value="1" <c:if test="${incomePayType eq 1 }">selected="selected"</c:if>>无手续费</option>
					<option value="2" <c:if test="${incomePayType eq 2 }">selected="selected"</c:if>>非月结</option>
					<option value="3" <c:if test="${incomePayType eq 3 }">selected="selected"</c:if>>月结</option>
				</select>
				<input type="text" id="incomePay" name="incomePay" value="${incomePay }" style="width:80px;" onchange="changeRze1()">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<span id="pay4" style="font-size:14px;">手续费收入税额：</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" id="incomePayTax" name="incomePayTax" value="${empty incomePayTax?0:incomePayTax }" readonly="readonly" style="width:80px;">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
				<span id="pay5" style="font-size:14px;">银行手续费：</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;" colspan="3">
				<span id="pay6" style="font-size:14px;"></span><input type="text" id="outPay" name="outPay" value="${outPay }" style="width:80px;" onchange="paylistchangeRZE()" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<table id="irrMonthPriceTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b style="font-size: 14px;">&nbsp;&nbsp;<!-- 融资租赁方案测算方式一 --></b>
						</td>
						<td style="text-align: left;height: 24px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
							<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addIrrMonthPriceRow();">添加</a>
						</td>
					</tr>
					<c:forEach var="item" items="${paylist.irrMonthPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right" onchange="changeLastRentPrice();"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />"
									onkeyup="value=value.replace(/[^\d]/g,'')">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								对应期次
							</td>
							<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">
									<c:forEach begin="1" end="${paylist.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
								<span name="delSpan"
								<c:if test="${status.count ne fn:length(paylist.irrMonthPaylines)}">style="display: none;"</c:if>
									><input type="button" name="delBut" onclick="deleteIrrMonthPriceRow.call(this);" value="删 除" class="ui-state-default ui-corner-all"></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				首期租金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE_PERCENT',this);"
					name="PAY_HEAD_HIRE_PERCENT" id="PAY_HEAD_HIRE_PERCENT"
					value="${empty paylist.HEAD_HIRE_PERCENT ? 0 : paylist.HEAD_HIRE_PERCENT }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE',this);"
					name="PAY_HEAD_HIRE" id="PAY_HEAD_HIRE" class="input_right"
					style="width: 130px;"
					value="<fmt:formatNumber value="${empty paylist.HEAD_HIRE ? 0 : paylist.HEAD_HIRE }" type="currency" />">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" colspan="2" style="font-size: 14px;">
				<font color="RED"><b style="font-size: 14px;">(期初支付时需keyin金额，期末支付时不需keyin金额)</b></font>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				保证金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE_RATE',this);"
					name="PAY_PLEDGE_PRICE_RATE" id="PAY_PLEDGE_PRICE_RATE"
					value="${paylist.PLEDGE_PRICE_RATE }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE',this);"
					name="PAY_PLEDGE_PRICE" id="PAY_PLEDGE_PRICE"
					value="<fmt:formatNumber value="${paylist.PLEDGE_PRICE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<!-- 
					实际使用保证金<font color="red">&nbsp;*</font>
				 -->&nbsp;
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;<input type="hidden" name="PAY_PLEDGE_REALPRIC" id="PAY_PLEDGE_REALPRIC" value="${paylist.PLEDGE_REALPRIC }">
			</td>
		</tr>
		<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<span id="aaa" style="font-size: 14px;">用于平均抵冲金额</span>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PAY_PLEDGE_AVE_PRICE" id="PAY_PLEDGE_AVE_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_AVE_PRICE?0:paylist.PLEDGE_AVE_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PAY_PLEDGE_BACK_PRICE" id="PAY_PLEDGE_BACK_PRICE" onchange="paylistchangeRZE();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_BACK_PRICE?0:paylist.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于最后抵冲期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="hidden" name="PAY_PLEDGE_LAST_PRICE" id="PAY_PLEDGE_LAST_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_LAST_PRICE?0:paylist.PLEDGE_LAST_PRICE }" />" style="text-align: right">
						<select name="PAY_PLEDGE_LAST_PERIOD" onchange="changePayPledgeLastPrice();" id="PAY_PLEDGE_LAST_PERIOD" >
							<option value="0" <c:if test="${empty paylist.PLEDGE_LAST_PERIOD and paylist.PLEDGE_LAST_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="${paylist.LEASE_PERIOD }" step="1">
							  <option value="${i }" <c:if test="${not empty paylist.PLEDGE_LAST_PERIOD and paylist.PLEDGE_LAST_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select> 
<%-- 						<input type="text" name="PAY_PLEDGE_LAST_PERIOD" id="PAY_PLEDGE_LAST_PERIOD" size="8"
							value="${empty paylist.PLEDGE_LAST_PERIOD?0:paylist.PLEDGE_LAST_PERIOD }" style="text-align: center;"> --%>
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						延迟拨款期数<!-- 	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="PAY_DEFER_PERIOD" id="PAY_DEFER_PERIOD">
							<option value="0" <c:if test="${empty paylist.DEFER_PERIOD and paylist.DEFER_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="2" step="1">
							  <option value="${i }" <c:if test="${not empty paylist.DEFER_PERIOD and paylist.DEFER_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select>
					
						<input type="hidden" name="PAY_PLEDGE_PERIOD" size="8" id="PAY_PLEDGE_PERIOD"
							value="${empty paylist.PLEDGE_PERIOD?0:paylist.PLEDGE_PERIOD }" style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!--<input type="radio" name="PAY_PLEDGE_ENTER_WAY" value="1" <c:if test="${empty paylist.PLEDGE_ENTER_WAY or paylist.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;

						<input type="text" size="15" name="PAY_PLEDGE_ENTER_CMPRICE" id="PAY_PLEDGE_ENTER_CMPRICE" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_CMPRICE?0:paylist.PLEDGE_ENTER_CMPRICE }" />" >&nbsp;&nbsp;<span id="aaa1" style="font-size: 14px;">税金&nbsp;
						<input type="text" size="15" name="PAY_PLEDGE_ENTER_CMRATE" id="PAY_PLEDGE_ENTER_CMRATE" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_CMRATE?0:paylist.PLEDGE_ENTER_CMRATE }" />">&nbsp;&nbsp;</span>我司入供应商&nbsp;
						<input type="text" size="15" name="PAY_PLEDGE_ENTER_MCTOAG" id="PAY_PLEDGE_ENTER_MCTOAG" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_MCTOAG?0:paylist.PLEDGE_ENTER_MCTOAG}" />">&nbsp;&nbsp;<span id="aaa2" style="font-size: 14px;">税金&nbsp;
						<input type="text" size="15" name="PAY_PLEDGE_ENTER_MCTOAGRATE" id="PAY_PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_MCTOAGRATE?0:paylist.PLEDGE_ENTER_MCTOAGRATE}" />"></span>
						<br>
						<!--<input type="radio" name="PAY_PLEDGE_ENTER_WAY" value="2" <c:if test="${paylist.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;

						<input type="text" size="15" name="PAY_PLEDGE_ENTER_AG" id="PAY_PLEDGE_ENTER_AG" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_AG?0:paylist.PLEDGE_ENTER_AG }" />">&nbsp;&nbsp;<span id="aaa3" style="font-size: 14px;">税金&nbsp;
						<input type="text" size="15" name="PAY_PLEDGE_ENTER_AGRATE" id="PAY_PLEDGE_ENTER_AGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty paylist.PLEDGE_ENTER_AGRATE?0:paylist.PLEDGE_ENTER_AGRATE}" />"></span>
					</td>
				</tr>
	
<!-- Add by Michael 2012 01/14 费用参数化 -->				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">管理费收入(影响TR计算)</b></font>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b style="font-size: 14px;">非管理费收入(不影响TR计算)</b></font>
			</td>
		</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14" onchange="paylistchangeRZE();"
										 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" id="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG}</option>
										</c:forEach></select>
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14" onchange="paylistchangeRZE();"
									 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" id="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG}</option>
										</c:forEach></select>
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14"
							 value="${empty item.FEE?0:item.FEE }" style="text-align: right" feeListRZE="feeListRZE2">来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" id="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG}</option>
										</c:forEach></select>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14"
								 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE2">来源：<select name="${item.CREATE_FILED_NAME }_SOURCE" id="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG}</option>
										</c:forEach></select>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->

		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<font color="RED"><b style="font-size: 14px;">客户TR</b></font>
			</td>
			<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<b style="font-size: 14px;">&nbsp;&nbsp;<fmt:formatNumber value="${paylist.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
			<input type="hidden" name="TR_RATE" id="TR_RATE" value="<fmt:formatNumber value="${paylist.TR_RATE }" pattern="##0.000"/>">
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<font color="RED"><b style="font-size: 14px;">实际TR</b></font>
			</td>
			<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<b style="font-size: 14px;">&nbsp;&nbsp;<fmt:formatNumber value="${paylist.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
				<input type="hidden" name="TR_IRR_RATE" id="TR_IRR_RATE" value="<fmt:formatNumber value="${paylist.TR_IRR_RATE }" pattern="##0.000"/>">
			</td>
		</tr>
		<c:set value="0" var="RATE_DIFF"></c:set>
		<c:forEach items="${paylist.paylines }" var="item111" varStatus="status">
			<c:set value="${RATE_DIFF + item111.PV_PRICE}" var="RATE_DIFF"></c:set>
		</c:forEach>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<font color="RED"><b style="font-size: 14px;">利差</b></font>
			</td>
			<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<!-- Modify by Michael 2012 1/5 增加利差 -->
					<b style="font-size: 14px;"><input type="text" name="RATE_DIFF" id="RATE_DIFF"
					value="<fmt:formatNumber value="${RATE_DIFF }" type="currency" maxFractionDigits="0" />"
					class="input_right" style="width: 130px;" readonly="readonly"></b>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				&nbsp;
			</td>
			<td   style="text-align:  left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>

		<tr>
			<td colspan="4" style="text-align: center;height: 26px;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="button" name="sub2" onclick="submitCalCulate('2','2');" value="根据【应收租金】测算支付表" class="ui-state-default ui-corner-all">
			</td>
		</tr>
		<tr>
			<td style="text-align: left;height: 24px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
				<b style="font-size: 14px;">&nbsp;&nbsp;<!-- 融资租赁方案测算方式二 --></b>
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;display: none;">
				<!-- 利率上浮比率 -->
			</td>
			<td   style="text-align:  left;font-size: 14px;display: none;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_FLOAT_RATE',this);"
					name="PAY_FLOAT_RATE" id="PAY_FLOAT_RATE" value="${paylist.FLOAT_RATE }"
					style="width: 60px;display: none;">
				%
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="4">
				合同利率：<input type="hidden" onchange="changeFieldPay('PAY_YEAR_INTEREST',this);"
					name="PAY_YEAR_INTEREST" id="PAY_YEAR_INTEREST"
					value="<fmt:formatNumber value="${paylist.YEAR_INTEREST }" pattern="#0.00000000" />"
					style="width: 60px;">
				<fmt:formatNumber value="${paylist.YEAR_INTEREST }" pattern="#0.000" />%&nbsp;&nbsp;
				<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
				未税年平息率：<span id="yearRent1" style="font-size: 14px;"></span>&nbsp;&nbsp;
				含税年平息率：<span id="yearRent" style="font-size: 14px;"></span>&nbsp;&nbsp;
				<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
				增值税进销项差额：<span id="valueAdd" style="font-size: 14px;"></span>&nbsp;&nbsp;
				进项增值税：<span id="valueAdd1" style="font-size: 14px;"></span>
				</c:if>
			</c:if>
			<c:if test="${paylist.TAX_PLAN_CODE eq '5' }">
				年平息率：<span id="yearRent11" style="font-size: 14px;"></span>&nbsp;&nbsp;
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 	<input type="button" name="sub1" onclick="submitCalCulate('1');" value="根据【合同利率】测算支付表" class="ui-state-default ui-corner-all"> -->&nbsp;
				<input type="button" name="but" value="将此融资租赁方案加入对比" class="ui-state-default ui-corner-all" onclick="addSchema('${word }');">
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${paylist.TAX_PLAN_CODE eq '2' }">
			<%-- <c:if test="${paylist.TAX_PLAN_CODE eq '2'} "> --%>
				<%@ include file="creditPaylineCreateValueAdded.jsp"%>
			<%-- </c:if>
			<c:if test="${paylist.TAX_PLAN_CODE eq '1'} ">
				<%@ include file="creditPaylineCreate.jsp"%>
			</c:if> --%>
		</c:when>
		<c:when test="${paylist.TAX_PLAN_CODE eq '1' or paylist.TAX_PLAN_CODE eq '3' or paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '5' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
		<%@ include file="creditPaylineCreate.jsp"%>
			<%-- <c:if test="${paylist.TAX_PLAN_CODE eq '2'} "> 
				<%@ include file="creditPaylineShowValueAdded.jsp"%>
				--%>
			<%-- </c:if>
			<c:if test="${paylist.TAX_PLAN_CODE eq '1'} ">
				<%@ include file="creditPaylineShow.jsp"%>
			</c:if> --%>
		</c:when>
	</c:choose>
	<center>
	    <!-- 有时会导出空合同,暂时先禁止掉 -->
		<!--input type="button" class="ui-state-default ui-corner-all"   value="导出合同"  onclick="expCat('${creditMap.ID}');"-->
		<!-- <input type="button" class="ui-state-default ui-corner-all" id="But" value="导出报价单" name="But" onclick="expQuoToPdf('${creditMap.ID}');"> -->
		<!--input type="button" class="ui-state-default ui-corner-all" id="But" value="导出租赁物情况表" name="But" onclick="submitCalCulate('3');"-->
		<c:if test="${paylist.TAX_PLAN_CODE ne '4' and paylist.TAX_PLAN_CODE ne '6' and paylist.TAX_PLAN_CODE ne '7' and paylist.TAX_PLAN_CODE ne '8'}">
		<input type="button" class="ui-state-default ui-corner-all" id="But" value="导出测算表" name="But" onclick="submitCalCulate('4','${paylist.TAX_PLAN_CODE}');"> <input type="hidden" name="TAX_PLAN_CODE" value="${paylist.TAX_PLAN_CODE}">
		</c:if>
	</center>
</div>
</div>
</div>
</form>

<div id="showDuibi" style="display: none;" title="融资租赁方案对比">
   <table border="0" width="100%">
      <tr id="showDuibiTr">
         
      </tr>
   </table>
