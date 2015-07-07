<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>报价管理</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistLink.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistIrrMonthPrice.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistLink.js"></script>


<script type="text/javascript">
var baseRate = ${baseRateJson};
	function addEquipmentRow(){
	
	 var tid = document.getElementById("equipmentTab");
	 
	 var row = tid.insertRow(tid.rows.length);

	 addCell(row,0,'TYPE_NAME','text',null,'','',null);	
	 addCell(row,1,'KIND_NAME','text',null,'','',null);	
	 addCell(row,2,'AMOUNT','text',null,'','',null);	
	 addCell(row,3,'SUPL_NAME','text',null,'','',null);
	 addCell(row,4,'','a',null,'','',null);
	
	}
	

	function addCell(row, index, name,type,cls,value,size,height){
		var sed = document.getElementById("equipmentTab").rows.length;
		var html='';

		 if(type=='text'){
		 	html=html+"<input type='text' id='"+name+sed+"' name='"+name+"'  size='30' value='"+value+"' ";
	 		html=html+"/>";
		 }
		 
		 if(type=='a'){
		 	html=html+"<img src='../images/u103.gif'><a href='javascript:void(0)' onclick='deleteRow.call(this)'>删除</a>";
		 }
		 var cell = row.insertCell(index); 
		 cell.align='center';
		 if (height != null) {
	                cell.height = height;
	            }
		 cell.innerHTML =html;
		 row.appendChild(cell);
		 return;
	}

	 function deleteRow(){
	      var tr = this.parentNode.parentNode;
	      tr.parentNode.removeChild(tr); 
	}

	 function valueIsNumber1(field) {
			var value = field.value;
		    value = value.trim();
		    var m=/^(\d)+$/;
		    if(value.match(m)) {
		        // field.value = value;
		    } else {
		         field.value = 1;
		    }
	}
	function getBaseRate (totalMonth) {
			if (totalMonth <= 6) {
				return baseRate.SIX_MONTHS;
			} else if (totalMonth <= 12) {
				return baseRate.ONE_YEAR;
			} else if (totalMonth <= 36) {
				return baseRate.ONE_THREE_YEARS;
			} else if (totalMonth <= 60) {
				return baseRate.THREE_FIVE_YEARS;
			} else {
				return baseRate.OVER_FIVE_YEARS;
			}
		}
	 function updateYearInterest() {
		var form = document.payForm;
		valueIsNumber1(form.PAY_LEASE_PERIOD);
		var lease_period = form.PAY_LEASE_PERIOD.value;
		var lease_term = form.PAY_LEASE_TERM.value;
		
		if (lease_term == 0) {
			alert("请选择租赁周期!");
	    	form.PAY_LEASE_TERM.focus();
	    	return;
		}

		var float_rate = form.PAY_FLOAT_RATE.value;
		form.PAY_YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,6))/Math.pow(10,6);
	 }
	 
	 function deleteIrrMonthPriceRowX(){
		   var tr = obj.parentNode.parentNode.parentNode;
		   alert(tr);
		   tr.parentNode.removeChild(tr); 
		   hideDelSpanX();
	}
	 function hideDelSpanX(){
			var spans = document.getElementsByName("delSpan");
			var len = spans.length-1;
			for (var i=0;i<spans.length;i++){
				
				if (i != len){
					spans[i].style.display = 'none';
				} else {
					spans[i].style.display = 'block';
				}
			}
		}
	 
	 function addIrrMonthPriceRowX(){
			var tab = document.getElementById("irrMonthPriceTab");
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

			var tid = document.getElementById("irrMonthPriceTab");
			var row = tid.insertRow(trs+1);
			addCellIrrMonthPriceX(row,0,'IRRMONTHPRICEWORD', null,null);	
			addCellIrrMonthPriceX(row,1,'IRRMONTHPRICE',null,null);	
			addCellIrrMonthPriceX(row,2,'STARTANDENDWORD',null,null);	
			addCellIrrMonthPriceX(row,3,'STARTANDEND',value,null);
			addCellIrrMonthPriceX(row,4,'DELSPAN',null,null);	
			
			hideDelSpan();
		}

		function addCellIrrMonthPriceX(row, index, name,value,height){
			var sed = document.getElementById("irrMonthPriceTab").rows.length;
			var html='';
			var cell = row.insertCell(index); 
			cell.className = "ui-widget-content jqgrow ui-row-ltr";
			
			if (name == "IRRMONTHPRICEWORD") {
				html = html + "未税应付租金<font color=\"red\">&nbsp;*</font>";
			}
			if (name == "IRRMONTHPRICE"){
				html = html + '<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right" onchange="changeLastRentPrice();" style="width: 130px;" value="">';
			}
			if (name == "STARTANDENDWORD") {
				html = html + "对应期次";
			}
			if (name == "STARTANDEND" ){
				html = html + '第'
							+'<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="'+value+'" readonly="readonly" style="width: 30px;text-align: center;">'
							+'期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">';
				for (var i=1;i<=getLeasePeriod();i++){
					if (i==value){
						html = html + '<option value="'+i+'" selected="selected">'+i+'</option>'
					} else {
						html = html + '<option value="'+i+'">'+i+'</option>'
					}
				}
				
				html = html + '</select>期';
			}
			if (name == "DELSPAN"){
				html = html + '<span name="delSpan" style="display: block;"><input type="button" name="delBut" onclick="deleteIrrMonthPriceRow.call(this);" value="删 除" class="ui-state-default ui-corner-all"></span>'
			}
			
			if (height != null) {
				cell.height = height;
			}
			cell.innerHTML =html;
			row.appendChild(cell);
			return;
		}	 

		function submitQuotation(flag) {
		    var form = document.payForm;
		    if (form.CUST_NAME.value==""){
		    	alert("客户名称不能为空！");
		    	form.CUST_NAME.focus();
		    	return false;
		    }
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
			    if (notPositive(form.PAY_PLEDGE_AVE_PRICE, '用于平均抵冲金额')) {
			        return;
			    }
			    //
			    if (notPositive(form.PAY_PLEDGE_BACK_PRICE, '用于期末退还金额')) {
			        return;
			    }
			    //
			    if (notPositive(form.PAY_PLEDGE_LAST_PRICE, '用于最后抵冲金额')) {
			        return;
			    }
			    //
			    if (notPositive(form.PAY_PLEDGE_LAST_PERIOD, '用于最后抵冲期数')) {
			        return;
			    }
			    
			    if (notPositive(form.PLEDGE_AVG_PRICE, '税金')) {
			        return;
			    }
			    
			    if (notPositive(form.STAYBUY_PRICE, '设备留购款')) {
			        return;
			    }
			    
			    if (form.STAYBUY_PRICE.value<100){
			    	alert("设备留购款必须是一个大于100的数！");
			    	form.STAYBUY_PRICE.focus();
			    	return false;
			    }
			    
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
				
				for (var i=0;i<form.AMOUNT.length;i++){
			   	 	if (positive(form.AMOUNT[i], '设备数量')) {
			            return false;
			        }
			    }
				
				var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
				var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");
				for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
			   
					if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.PAY_LEASE_PERIOD.value){
						alert("你选择的未税应付租金期数与租赁方案中租赁期数不符！");
						return false;
					}
			    }
			    if(form.PAY_PAY_WAY.value == 13 ||form.PAY_PAY_WAY.value == 11){
			    	var head_price=form.PAY_HEAD_HIRE.value;
			    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
			    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
			    		alert("期初方式首栏的未税应付租金应该等于首期租金");
			    		return false;
			    	}
			    }
				var strVal=0;
				var trueFlag=true;
				 $("input[name='PAY_IRR_MONTH_PRICE']").each(function(){
					 if (strVal=="0"){
						strVal= parseCurrency($(this).val());
					}
					if (strVal!=parseCurrency($(this).val())){		
						if (form.PAY_PAY_WAY.value=="21"||form.PAY_PAY_WAY.value=="11"){
							alert("每期租金不一致，应选择不等额支付方式！");
							trueFlag= false;
						}
					}
				 });
				 
				 if (trueFlag==false){
					 return false;
				 }	 
				 
				 if ($("input[name='PAY_IRR_MONTH_PRICE']").length=="1"){
					if (form.PAY_PAY_WAY.value=="13"||form.PAY_PAY_WAY.value=="23"){
						alert("每期租金一致时，应选择等额支付方式！");
						return false;
					}
				 }    
				 
				  if (flag == 1){
					  form.__action.value = "quotation.createScheme";
					  form.submit();
				  }else if (flag == 2) {
				    form.__action.value = "quotation.calculateQuotationPaylistIRR";
					form.submit();
			    } 

	}
		function changeLastRentPrice(){
			$("#PAY_PLEDGE_LAST_PRICE").val(0);
			$("#PAY_PLEDGE_LAST_PERIOD").val(0);
			paylistchangeRZE();
			paylistchangePledgeRealPrice();
		}
</script>
</head>

<body>	
<form action="../servlet/defaultDispatcher" name="payForm" id="payForm"  method="post">
	<input type="hidden" name="__action" value="">
	<input type="hidden" name="SCHEME_ID" value="${schema.ID }">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 900px">
           	<div class="zc_grid_body jqgrowleft" style="width: 900px">
        <div class="ui-state-default ui-jqgrid-hdiv " style="width: 900px">
			<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 900px">
				<tr width="900">
					<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="5">
						<strong>承租人：</strong><font color="red">&nbsp;*</font><input name="CUST_NAME" size="30" value="${schema.CUST_NAME }">
					</td>
				</tr>	
				<tr>
					<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户购买意向</strong>
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						相关操作：
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addEquipmentRow();">添加</a>
					</td>
				</tr>
				<tr>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
						<strong>厂牌</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>产品名称</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
						<strong> 数量</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
						<strong>供应商</strong>
					</th>					
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="6%">
						操作
					</th>
				</tr>
				<c:forEach items="${equipmentList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="TYPE_NAME"  size="30" value="${item.TYPE_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="KIND_NAME"  size="30" value="${item.KIND_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="AMOUNT"  size="30" value="${item.AMOUNT }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="SUPL_NAME"  size="30" value="${item.SUPL_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<img src='../images/u103.gif'><a href='javascript:void(0)' onclick='deleteRow.call(this)'>删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
	
	<table width="900" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="wuzd">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
				<b>&nbsp;&nbsp;融资租赁方案</b>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				融资租赁总价值<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_LEASE_TOPRIC" id="PAY_LEASE_TOPRIC" onchange="changeFieldPay('PAY_LEASE_TOPRIC',this);"
					value="<fmt:formatNumber value="${schema.LEASE_TOPRIC }" type="currency" />"
					class="input_right" style="width: 130px;">
				<select name="IS_TAX">
					<option value="0" <c:if test="${schema.IS_TAX eq 0 }">selected="selected"</c:if>>含税</option>
					<option value="1" <c:if test="${schema.IS_TAX eq 1 }">selected="selected"</c:if>>未税</option>
				</select>
			</td>
		 
			<td    class="ui-widget-content jqgrow ui-row-ltr">
				概算成本（RZE）
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_LEASE_RZE" id="PAY_LEASE_RZE" readonly="readonly"
					value="<fmt:formatNumber value="${schema.LEASE_RZE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
		</tr>
		<tr>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
				租赁期数<font color="red">&nbsp;*</font>
			</td>
			<td width="25%"style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="updateYearInterest();changeFieldPay('PAY_LEASE_PERIOD',this);"
					name="PAY_LEASE_PERIOD" id="PAY_LEASE_PERIOD"
					value="${schema.LEASE_PERIOD }" style="width: 60px;">
			</td>
			<td width="17%"    class="ui-widget-content jqgrow ui-row-ltr">
				租赁周期<font color="red">&nbsp;*</font>
			</td>
			<td width="43%"   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_LEASE_TERM" id="PAY_LEASE_TERM"
					onchange="changeFieldPay('PAY_LEASE_TERM',this);">
					<option value="1"
						<c:if test="${schema.LEASE_TERM eq 1 }">selected="selected"</c:if>>
						月份
					</option>
					<option value="2"
						<c:if test="${schema.LEASE_TERM eq 2 }">selected="selected"</c:if>>
						双份
					</option>
					<option value="3"
						<c:if test="${schema.LEASE_TERM eq 3 }">selected="selected"</c:if>>
						季度
					</option>
					<option value="6"
						<c:if test="${schema.LEASE_TERM eq 6 }">selected="selected"</c:if>>
						半年
					</option>
					<option value="12"
						<c:if test="${schema.LEASE_TERM eq 12 }">selected="selected"</c:if>>
						年度
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				首期租金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE_PERCENT',this);"
					name="PAY_HEAD_HIRE_PERCENT" id="PAY_HEAD_HIRE_PERCENT"
					value="${empty schema.HEAD_HIRE_PERCENT ? 0 : schema.HEAD_HIRE_PERCENT }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE',this);"
					name="PAY_HEAD_HIRE" id="PAY_HEAD_HIRE" class="input_right"
					style="width: 130px;"
					value="<fmt:formatNumber value="${empty schema.HEAD_HIRE ? 0 : schema.HEAD_HIRE }" type="currency" />">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;&nbsp;&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				保证金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE_RATE',this);"
					name="PAY_PLEDGE_PRICE_RATE" id="PAY_PLEDGE_PRICE_RATE"
					value="${schema.PLEDGE_PRICE_RATE }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE',this);"
					name="PAY_PLEDGE_PRICE" id="PAY_PLEDGE_PRICE"
					value="<fmt:formatNumber value="${schema.PLEDGE_PRICE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
		
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于平均抵冲金额
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_AVE_PRICE" id="PAY_PLEDGE_AVE_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_AVE_PRICE?0:schema.PLEDGE_AVE_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_BACK_PRICE" id="PAY_PLEDGE_BACK_PRICE" onchange="paylistchangeRZE();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_BACK_PRICE?0:schema.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于最后抵冲金额/期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_LAST_PRICE" id="PAY_PLEDGE_LAST_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_LAST_PRICE?0:schema.PLEDGE_LAST_PRICE }" />" style="text-align: right">
						<input type="text" name="PAY_PLEDGE_LAST_PERIOD" id="PAY_PLEDGE_LAST_PERIOD" size="8"
							value="${empty schema.PLEDGE_LAST_PERIOD?0:schema.PLEDGE_LAST_PERIOD }" style="text-align: center;">
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr">
					<!-- 	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="hidden" name="PAY_PLEDGE_PERIOD" size="8" id="PAY_PLEDGE_PERIOD"
							value="${empty schema.PLEDGE_PERIOD?0:schema.PLEDGE_PERIOD }" style="text-align: center;">
					</td>
				</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				税金
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PLEDGE_AVG_PRICE" id="PLEDGE_AVG_PRICE"
					value="<fmt:formatNumber value="${empty schema.PLEDGE_AVG_PRICE?0:schema.PLEDGE_AVG_PRICE }"  pattern='#,##0.00' />"
					class="input_right" style="width: 130px;">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						设备留购款<font color="red">&nbsp;*</font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="STAYBUY_PRICE" id="STAYBUY_PRICE" 
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.STAYBUY_PRICE?0:schema.STAYBUY_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
				</tr>			
			<tr>
				<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
					<font color="RED"><b>管理费收入(影响TR计算)</b></font>
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
					<font color="RED"><b>非管理费收入(不影响TR计算)</b></font>
				</td>
			</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
										 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
									 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
							 value="${empty item.FEE?0:item.FEE }" style="text-align: right" feeListRZE="feeListRZE2">
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
								 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE2">
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->
				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				支付方式<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_PAY_WAY" id="PAY_PAY_WAY" onchange="changeFieldPay('PAY_PAY_WAY',this);">
					<c:forEach items="${payWays}" var="item">
						<option value="${item.CODE }"
							<c:if test="${ schema.PAY_WAY eq item.CODE }"> selected="selected"</c:if>>
							${item.FLAG }
						</option>
					</c:forEach>
				</select>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>客户TR</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
			<input type="hidden" name="TR_RATE" id="TR_RATE" value="<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"/>">
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>实际TR</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
				<input type="hidden" name="TR_IRR_RATE" id="TR_IRR_RATE" value="<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"/>">
			</td>
		</tr>
		<c:set value="0" var="RATE_DIFF"></c:set>
		<c:forEach items="${paylist.paylines }" var="item111" varStatus="status">
			<c:set value="${RATE_DIFF + item111.PV_PRICE}" var="RATE_DIFF"></c:set>
		</c:forEach>
		
		<c:set value="0" var="REN_PRICE"></c:set>
		<c:forEach items="${paylist.paylines }" var="item222" varStatus="status">
			<c:set value="${REN_PRICE + item222.REN_PRICE}" var="REN_PRICE"></c:set>
		</c:forEach>
		<c:set value="0" var="SALES_TAX"></c:set>
		<c:forEach items="${paylist.paylines }" var="item333" varStatus="status">
			<c:set value="${SALES_TAX + item333.SALES_TAX}" var="SALES_TAX"></c:set>
		</c:forEach>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>利差</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<!-- Modify by Michael 2012 1/5 增加利差 -->
					<b><input type="text" name="RATE_DIFF" id="RATE_DIFF"
					value="<fmt:formatNumber value="${schema.RATE_DIFF }" type="currency" maxFractionDigits="0" />"
					class="input_right" style="width: 130px;" readonly="readonly"></b>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税费测算方案<font color="red">&nbsp;*</font>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
				<select name="PAY_TAX_PLAN_CODE" id="PAY_TAX_PLAN_CODE">
						<c:forEach items="${taxPlanList}" var="item">
							<option value="${item.CODE }"
								<c:if test="${ schema.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
							</option>
						</c:forEach>
				</select>
				<input type="hidden" name="TOTAL_VALUEADDED_TAX" id="TOTAL_VALUEADDED_TAX" value="${ schema.TOTAL_VALUEADDED_TAX}"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">
<table id="irrMonthPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
						</td>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
							<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addIrrMonthPriceRowX();">添加</a>
						</td>
					</tr>
					<c:forEach var="item" items="${schema.irrMonthPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								未税应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right" onchange="changeLastRentPrice();"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								对应期次
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">
									<c:forEach begin="1" end="${schema.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
							
								<span name="delSpan"
										<c:if test="${status.count ne fn:length(schema.irrMonthPaylines)}">style="display: none;"</c:if>
									><input type="button" name="delBut" onclick="deleteIrrMonthPriceRow.call(this);" value="删 除" class="ui-state-default ui-corner-all"></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="button" name="sub2" onclick="submitQuotation(2);" value="根据【应收租金】测算支付表" class="ui-state-default ui-corner-all">
			</td>
		</tr>
		
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				<!-- 利率上浮比率 -->
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_FLOAT_RATE',this);"
					name="PAY_FLOAT_RATE" id="PAY_FLOAT_RATE" value="${schema.FLOAT_RATE }"
					style="width: 60px;display: none;">
				%
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				合同利率
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_YEAR_INTEREST',this);"
					name="PAY_YEAR_INTEREST" id="PAY_YEAR_INTEREST"
					value="<fmt:formatNumber value="${schema.YEAR_INTEREST }" pattern="#0.00000000" />"
					style="width: 60px;">
				%
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>		
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="button" class="ui-state-default ui-corner-all" id="But" value="保    存" name="But" onclick="submitQuotation(1);" ${disabled }>
			</td>
		</tr>
	</table>

	<center>
	<input type="hidden" name="REN_PRICE" id="REN_PRICE" value="<fmt:formatNumber value="${REN_PRICE }" type="currency" maxFractionDigits="0" />"	class="input_right" style="width: 130px;" readonly="readonly">
	<input type="hidden" name="SALES_TAX" id="SALES_TAX" value="<fmt:formatNumber value="${SALES_TAX }" type="currency" maxFractionDigits="0" />"	class="input_right" style="width: 130px;" readonly="readonly">
	</center>
</div>
</div>
</div>
</form>
</body>
</html>