<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>尽职调查报告</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js" ></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<!-- Modify By Michael 修正js修改后不能更新 Bug-->
		<script type="text/javascript" src="${ctx }/credit/js/selectEquipment_new.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectInsureItem.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/creditSchemaIrrMonthPrice.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/selectOtherPrice.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/paylistLink.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/schemeControl.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
		<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
		<script type="text/javascript">	
			function changeLab() {
				if($("#TAX_PLAN_CODE").val()==4) {
					$("select[name=contract_typew] option").each(function() {
						if($(this).val()==7) {
							$(this).attr("selected","selected");
						}
					});
				} else if($("#TAX_PLAN_CODE").val()==5) {
					$("select[name=contract_typew] option").each(function() {
						if($(this).val()==8) {
							$(this).attr("selected","selected");
						}
					});
				} else if($("#TAX_PLAN_CODE").val()==6) {
					$("select[name=contract_typew] option").each(function() {
						if($(this).val()==9) {
							$(this).attr("selected","selected");
						}
					});
				} else if($("#TAX_PLAN_CODE").val()==7) {
					$("select[name=contract_typew] option").each(function() {
						if($(this).val()==10) {
							$(this).attr("selected","selected");
						}
					});
				} else if($("#TAX_PLAN_CODE").val()==8) {
					$("select[name=contract_typew] option").each(function() {
						if($(this).val()==11) {
							$(this).attr("selected","selected");
						}
					});
				}
				if($("#TAX_PLAN_CODE").val()==4||$("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
					$("#lab11").html("用于一次抵冲租金");
					$("#tax1").hide();
					$("#tax2").hide();
					$("#tax3").hide();
				} else {
					$("#lab11").html("用于平均抵冲金额");
					$("#tax1").show();
					$("#tax2").show();
					$("#tax3").show();
				}
				
				if($("#TAX_PLAN_CODE").val()==5) {
					$(".pay_panel").show();
				} else {
					$(".pay_panel").hide();
				}
			}
			var baseRate = ${baseRateJson};
			$(function (){
				$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
				if($("#TAX_PLAN_CODE").val()==4||$("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
					$("#lab11").html("用于一次抵冲租金");
				} else {
					$("#lab11").html("用于平均抵冲金额");
				}
				if($("#TAX_PLAN_CODE").val()==4||$("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
					$("#tax1").hide();
					$("#tax2").hide();
					$("#tax3").hide();
				}
				if($("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
					$("#BEFORE_PAY").hide();
				}
				
				if($("#TAX_PLAN_CODE").val()==5) {
					$(".pay_panel").show();
				} else {
					$(".pay_panel").hide();
				}
				
				if($("#TAX_PLAN_CODE").val()==7) {
					$(".pay_panel").show();
					$("#hd1").hide();
					$("#hd2").hide();
					$("#hd3").hide();
					$("#hd4").hide();
					$("#hd5").hide();
					$("#hd6").hide();
				}
			});
			function dateClick(){
				$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
			}
		</script>
		<script type="text/javascript">			
			function checkTime(){
				var startDate = $("#START_DATE").val()
				var nowDate=new Date().format("yyyy-MM-dd");
				

				
				
				if(startDate<nowDate){
					alert("请选择今天之后的日期作为预估起租日");
					$("#START_DATE").val("") ;
					return false;
				}	
				//乘用车委贷起租日不得晚于预计支付日  
				var taxPlanCode = $("#TAX_PLAN_CODE").val();
				if(taxPlanCode==5){
					var planDate = $("#estimates_pay_date").val();
					if(planDate!="" && startDate>planDate){
						alert("乘用车委贷起租日不得晚于预计支付日.");
						$("#START_DATE").val("") ;
						return false;
					}
				}
				return true;
			}
			
			 
		function showApplyGrant(id,value){
			var supperid=$("#"+id).val();
			//alert("xialaduixiangz:"+supperid+"this.vale"+value);
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditReport.getApplyGrantBySupperId&supperid='+value,
				dataType:'json',
				success:function(dataBack){ 
					supperGrantMap = dataBack.supperGrantMap;
					var grantprice="当前供应商："+supperGrantMap.SUPNAME+"的授信额度是："+supperGrantMap.GRANT_PRICE+"授信余额是："+supperGrantMap.LAST_PRICE+"交机前拨款额度为："+supperGrantMap.advance_grant+"交机前拨款余额为:"+supperGrantMap.advance_machine;
					$("#shownowgrant").html(grantprice);		
					$("#shownowgranttr").show();
					$("#shownowgranthidden").hide();
				}
			});		
		}
		function updateAppropiate0(){
			if(document.getElementById("PAYPERCENT0").value != null && document.getElementById("PAYPERCENT0").value != ""){
				var lease_sum=document.getElementById("BEGMONEY").value;
				var percent=document.getElementById("PAYPERCENT0").value;
				lease_sum = parseFloat(lease_sum.replace(/[￥,]/g, ''));
				document.getElementById("APPROPIATEMON0").value=Math.round(lease_sum*percent)/100;
			}else{
				document.getElementById("APPROPIATEMON0").value=0;
			}
		}
		function updateAppropiate1(){
			if(document.getElementById("PAYPERCENT1").value !=null && document.getElementById("PAYPERCENT1").value != ""){
				var lease_sum=document.getElementById("BEGMONEY").value;
				var percent=document.getElementById("PAYPERCENT1").value;
				lease_sum = parseFloat(lease_sum.replace(/[￥,]/g, ''));
				document.getElementById("APPROPIATEMON1").value=Math.round(lease_sum*percent)/100;
			}else{
				document.getElementById("APPROPIATEMON1").value=0;
			}
		}
		
		function updateAppropiate00(){
			var lease_sum=document.getElementById("BEGMONEY").value;
			var app = 0;
			if(document.getElementById("APPROPIATEMON0").value != "" &&document.getElementById("APPROPIATEMON0").value != null){
				app=parseCurrency(document.getElementById("APPROPIATEMON0").value);
			}
			lease_sum = parseFloat(lease_sum.replace(/[￥,]/g, ''));
			document.getElementById("PAYPERCENT0").value=Math.round(app/lease_sum * 10000)/100;
//			document.getElementById("PAYPERCENT0").value=forDight(app/lease_sum)*100;
		}
		function updateAppropiate01(){
			var lease_sum=document.getElementById("BEGMONEY").value;
			var app = 0;
			if(document.getElementById("APPROPIATEMON1").value != "" &&document.getElementById("APPROPIATEMON1").value != null){
				app=parseCurrency(document.getElementById("APPROPIATEMON1").value);
			}
			lease_sum = parseFloat(lease_sum.replace(/[￥,]/g, ''));
			document.getElementById("PAYPERCENT1").value=Math.round(app/lease_sum * 10000)/100;
//			document.getElementById("PAYPERCENT1").value=forDight(app/lease_sum)*100;
		}
		
		function updatePrice1(){
			var PLEDGE_ENTER_MCTOAG = parseInt(parseCurrency(document.getElementById("PLEDGE_ENTER_MCTOAG").value));
			var PLEDGE_ENTER_AG = parseInt(parseCurrency(document.getElementById("PLEDGE_ENTER_AG").value));
			var LEASE_TOPRIC = parseInt(parseCurrency(document.getElementById("LEASE_TOPRIC").value));
			document.getElementById("BEGMONEY").value = LEASE_TOPRIC-(PLEDGE_ENTER_MCTOAG+PLEDGE_ENTER_AG);
			updateAppropiate0();
			updateAppropiate1();
		}
		
		function updatePrice2(){
			var PLEDGE_ENTER_MCTOAG = parseInt(parseCurrency(document.getElementById("PLEDGE_ENTER_MCTOAG").value));
			var PLEDGE_ENTER_AG = parseInt(parseCurrency(document.getElementById("PLEDGE_ENTER_AG").value));
			var LEASE_TOPRIC = parseInt(parseCurrency(document.getElementById("LEASE_TOPRIC").value));
			if(parseInt(parseCurrency(document.getElementById("BEGMONEY").value)) != LEASE_TOPRIC-(PLEDGE_ENTER_MCTOAG+PLEDGE_ENTER_AG)){
				alert("申请拨款金额与保证金的和应为租赁总价值");
				document.getElementById("BEGMONEY").value = LEASE_TOPRIC-(PLEDGE_ENTER_MCTOAG+PLEDGE_ENTER_AG);
			}
		}
		
		function changeAddress(){
			var province_id_eq = "";
			var city_id_eq = "";
			var area_id_eq = "";
			var address = province_id_eq + city_id_eq + area_id_eq;
			if($("#province_id_eq").val() != -1){
				province_id_eq = $("#province_id_eq option:selected").text();
			}
			if($("#city_id_eq").val() != -1){
				city_id_eq = $("#city_id_eq option:selected").text();
			}
			if($("#area_id_eq").val() != -1){
				area_id_eq = $("#area_id_eq option:selected").text();
			}
			address = province_id_eq + city_id_eq + area_id_eq;
			$("#EQUPMENT_ADDRESS").val(address);
		}
		
		//是否显示  产品是否为三个月内之新品
		function showIsNewProduction() {
			if($("#contract_typew").val()==7) {//直租
				$("select[name=TAX_PLAN_CODE] option").each(function() {
					if($(this).val()==4) {
						$(this).attr("selected","selected");
					}
				});
			} else if($("#contract_typew").val()==8) {//乘用车委贷
				$("select[name=TAX_PLAN_CODE] option").each(function() {
					if($(this).val()==5) {
						$(this).attr("selected","selected");
					}
				});
			} else if($("#contract_typew").val()==9) {//设备售后回租
				$("select[name=TAX_PLAN_CODE] option").each(function() {
					if($(this).val()==6) {
						$(this).attr("selected","selected");
					}
				});
			} else if($("#contract_typew").val()==10||$("#contract_typew").val()==12||$("#contract_typew").val()==13) {//乘用车售后回租
				$("select[name=TAX_PLAN_CODE] option").each(function() {
					if($(this).val()==7) {
						$(this).attr("selected","selected");
					}
				});
			} else if($("#contract_typew").val()==11) {//商用车售后回租
				$("select[name=TAX_PLAN_CODE] option").each(function() {
					if($(this).val()==8) {
						$(this).attr("selected","selected");
					}
				});
			}
			if($("#contract_typew").val()==2) {
				document.getElementById("IS_NEW_PRODUCTION").style.display="block";
			} else {
				document.getElementById("IS_NEW_PRODUCTION").style.display="none";
			}
			
			if($("#contract_typew").val()==8) {
				$("#pay11").show();
				$("#pay22").show();
				$("#pay33").show();
				$("#pay44").show();
				$("#pay55").show();
				$("#pay66").show();
			} else {
				$("#pay11").hide();
				$("#pay22").hide();
				$("#pay33").hide();
				$("#pay44").hide();
				$("#pay55").hide();
				$("#pay66").hide();
			}
			
			if($("#contract_typew").val()==0||$("#contract_typew").val()==1||$("#contract_typew").val()==2||$("#contract_typew").val()==5
					||$("#contract_typew").val()==7||$("#contract_typew").val()==9) {
				$("#PAY_MONEY_WAY_FONT_0").html('交机');
				$("#PAY_MONEY_WAY_FONT_1").html('交机');
				$("#PAY_MONEY_WAY_FONT_2").html('交机');
				$("#PAY_MONEY_WAY_FONT_3").html('交机');
				$("#PAY_MONEY_WAY_FONT_4").html('交机');
				$("#PAY_MONEY_WAY_FONT_5").html('交机');
				$("#PAY_MONEY_WAY_FONT_6").html('交机');
				$("#PAY_MONEY_WAY_FONT_7").html('交机');
				$("#PAY_MONEY_WAY_FONT_8").html('交机');
			} else {
				$("#PAY_MONEY_WAY_FONT_0").html('设定');
				$("#PAY_MONEY_WAY_FONT_1").html('设定');
				$("#PAY_MONEY_WAY_FONT_2").html('设定');
				$("#PAY_MONEY_WAY_FONT_3").html('设定');
				$("#PAY_MONEY_WAY_FONT_4").html('设定');
				$("#PAY_MONEY_WAY_FONT_5").html('设定');
				$("#PAY_MONEY_WAY_FONT_6").html('设定');
				$("#PAY_MONEY_WAY_FONT_7").html('设定');
				$("#PAY_MONEY_WAY_FONT_8").html('设定');
			}
			$("#PAY_MONEY_WAY_FONT_0").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_1").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_2").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_3").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_4").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_5").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_6").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_7").css("font-size","14px");
			$("#PAY_MONEY_WAY_FONT_8").css("font-size","14px");
			
			if($("#contract_typew").val()==9||$("#contract_typew").val()==10||$("#contract_typew").val()==11||$("#contract_typew").val()==12||$("#contract_typew").val()==13) {
				$("#BEFORE_PAY").hide();
			} else {
				$("#BEFORE_PAY").show();
			}
			
			if($("#TAX_PLAN_CODE").val()==4||$("#TAX_PLAN_CODE").val()==6||$("#TAX_PLAN_CODE").val()==7||$("#TAX_PLAN_CODE").val()==8) {
				$("#lab11").html("用于一次抵冲租金");
				$("#tax1").hide();
				$("#tax2").hide();
				$("#tax3").hide();
			} else {
				$("#lab11").html("用于平均抵冲金额");
				$("#tax1").show();
				$("#tax2").show();
				$("#tax3").show();
			}
		}
		
		function isBuyBackFunction(suplId) {
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=suplEquipment.getIsBuyBackBySuplId&SUEQ_ID='+document.getElementById(suplId).value,
				dataType:'json',
				success:function(dataBack){  
		   			if(dataBack.isBuyBack!=null){
			   			if(dataBack.isBuyBack=='N'&&$("#SUPL_TRUE option").length==3) {
			   				$("#SUPL_TRUE").append('<option value="4">无	</option>');
			   			} else if(dataBack.isBuyBack=='Y'&&$("#SUPL_TRUE option").length==4) {
			   				$("#SUPL_TRUE option[value='4']").remove(); 
			   			}
		        	}
		        }   
			});
		}
		
		function addOption() {
			if($("#SUPL_TRUE option").length==3) {
				$("#SUPL_TRUE").append('<option value="4">无	</option>');
			}
		}
		
		function changePledgeLastPrice(){
			form=document.schemeForm;
			var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE_TAB1");
			var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END_TAB1");
			var PAY_IRR_MONTH_PRICE_START = document.getElementsByName("PAY_IRR_MONTH_PRICE_START_TAB1");
					
			if(PAY_IRR_MONTH_PRICE_END.length==0){
				$("#PLEDGE_LAST_PERIOD").val(0);
				alert("请添加每期应付未税租金");
				return false;
			}
			
			var PLEDGE_LAST_PERIOD = parseInt(form.PLEDGE_LAST_PERIOD.value);
			for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
				if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.LEASE_TERM.value){
					$("#PLEDGE_LAST_PERIOD").val(0);
					alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
					return false;
				}else if(i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value == form.LEASE_TERM.value){
					if(PLEDGE_LAST_PERIOD>parseInt(PAY_IRR_MONTH_PRICE_END[i].value)){
						$("#PLEDGE_LAST_PERIOD").val(0);
						alert("用于抵充最后期数应小于或等于租赁方案中的租赁期数！");
						return false;
					}else{
						if(PLEDGE_LAST_PERIOD-1<=(parseInt(PAY_IRR_MONTH_PRICE_END[i].value)-parseInt(PAY_IRR_MONTH_PRICE_START[i].value))){
							form.PLEDGE_LAST_PRICE.value=parseCurrency(PAY_IRR_MONTH_PRICE[i].value)*PLEDGE_LAST_PERIOD;
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
							form.PLEDGE_LAST_PRICE.value=total_pledge_last_price;
						}
					}
				}
			}
			updateLeaseRZE();
			updatePledgeRealPrice();
		}
		
		function jsAddItemToSelect() {       
			jsAddItemToobjSelect();
			jsAddItemToobjSelectDefer();
		}
		
		function jsAddItemToobjSelect() {       
			var objSelect=document.getElementById("PLEDGE_LAST_PERIOD");
			var value=objSelect.value;
			//先将值清空
			objSelect.options.length=0;
			
			//增加 0
			 var varItem0 = new Option(0, 0);
			 objSelect.options.add(varItem0);
			 
			 for (var i=1;i<=getLeasePeriodTab1();i++){
				 var varItem = new Option(i, i);
				 objSelect.options.add(varItem);
				 
				 if (i==value){
					 objSelect.options[i].selected=true;
				 }
			 }
		}
		
		function jsAddItemToobjSelectDefer() {       
			// Add by Michael 2013 02-01 增加延迟拨款期数
			var objSelectDefer=document.getElementById("DEFER_PERIOD");
			var value1 = objSelectDefer.value;
			objSelectDefer.options.length=0;
			
			//增加 0
			 var varItem0 = new Option(0, 0);
			 objSelectDefer.options.add(varItem0);
			 
			 for (var i=1;i<=getLeasePeriodTab1();i++){
				 var varItem = new Option(i, i);
				 objSelectDefer.options.add(varItem);
				 if (i==value1){
					 objSelectDefer.options[i].selected=true;
				 }
			 }
		}
		
		function changeSchemaLastRentPrice(){
			$("#PLEDGE_LAST_PERIOD").val(0);
			$("#PLEDGE_LAST_PRICE").val(0);
			updateLeaseRZE();
			updatePledgeRealPrice();
		}
		
		function removeRecord(index){
			$("#MOUNTINGS_tr_" + index).remove();
			$("#eq_tr_" + index).remove();
			updateLeaseTopric();
		}
		//遍历供应商联系人zhangbo
		function supplierContactButton(){
			//alert(111);
			 document.getElementById("supplierContactId").onclick = function(){}
			document.getElementById("supplierContactId").options.length=0;
			 $('#supplierContactId').append('<option value="-1">'+'请选择联系人'+'</option>');
			//取第一个供应商
			var supplierId=$("#SUPPIER1_dropDownList_value").val();
			//alert(supplierId);
			if(typeof  supplierId=='undefined'){
				alert("请先选择客户购买意向。");
			}else{
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditReport.getSupplierContact&suppl_id='+supplierId,
					dataType:'json',
					success:function(dataBack){  
			   		 	if(dataBack.supplLinkman!=null){
				   		 	jQuery.each(dataBack.supplLinkman, function(i,item){ 
				                //alert(item.LINK_MOBILE+","+item.LINK_NAME);  
				                $('#supplierContactId').append('<option value="'+item.CULM_ID+'">'+item.LINK_NAME+'</option>');
				            
				   		 	}); 
			        	} 
			        },
			        error: function(){  
			            return;  
			        }
				
				});
			}
		}
		
		function showTd() {
			if($("#contract_typew").val()==7||$("#contract_typew").val()==9||$("#contract_typew").val()==10||$("#contract_typew").val()==11) {
				for(var i=0;i<document.getElementsByName("upr").length;i++) {
					document.getElementsByName("upr")[i].style.display="none";
				}
			} else {
				for(var i=0;i<document.getElementsByName("upr").length;i++) {
					document.getElementsByName("upr")[i].style.display="block";
				}
			}
		}
		function showRiskLevel(credit_id){
			var url = "${ctx }/servlet/defaultDispatcher";
			var param = {__action : "riskAudit.getRiskLevel", "credit_id" : credit_id};
			$.getJSON(url, param, function (data){
				if(data != null){
					alert("权限别：“" + data.riskLevel + "”。\n" + "说明：" + data.riskLevelMsg);
				}
			});
		}

		 
		function updateLeaseTopric(){
			var value = 0;
			$("#eqBody").find("input[id^='TOTAL']").each(function (){
				value += parseFloat($(this).val().replace(/,/g, ""));
			});
			$("#LEASE_TOPRIC").val(value);
		}
		
		function changeDeferPeriod(value){
			if(value>0){
				$("#cheque").click();
				$("#chequespan").html("(延迟拨款期数:"+value+")");
			}else{
				$("#OnlinetBank").click();		
				$("#chequespan").html("");
			}
		}
		var payWays = new Array();
		<c:forEach items="${payWayList}" var="item">
		payWays.push({"name":"${item.FLAG}","value":"${item.CODE}"})
		</c:forEach>
		
		</script>
		<style type="text/css">
			.ui-fix-width{
				width: 100px !important;
			}
			.ui-dialog {
				text-align: center;
				vertical-align: middle;
			}
			.ui-dialog-titlebar-close {
				display: none;
			}
			#progressbar .ui-progressbar-value {
				background-color: #ccc;
			}
		</style>
		
	</head>
	<!-- <body onload="loadEquipmentTypes();"> -->
	<body>
		<div id="progressbar" style="display: none;">
			<img src="${ctx }/images/loading.gif">
		</div>
		<button type="button" onclick="showRiskLevel('${creditMap.ID }')" class="panel_button">测算审查权限级别</button>
		<form action="../servlet/defaultDispatcher" name="schemeForm" id="form1" method="post">
			<input type="hidden" name="__action" value="creditReport.createScheme">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="H_CUST_TYPE" value="${creditMap.CUST_TYPE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${creditMap.CONTRACT_TYPE }">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv " style="background-color: white; overflow: hidden !important;">
			<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="font-size: 14px;">报告类型：</td>
					<td style="font-size: 14px;">
						<select id="creditTypesName"  name="creditTypesName">
							<c:forEach items="${creditTypes}" var="creditTypes">
								<option value="${creditTypes.FLAG}" <c:if test="${creditTypes.FLAG eq creditMap.TYPE}">selected="selected"</c:if>>${creditTypes.FLAG}</option>
							</c:forEach>
						</select>
					</td>
					<td style="font-size: 14px;">客户来源：</td>
					<td style="font-size: 14px;">
						<select id="customerComeList" name="customerComeList" <c:if test="${customer!=true }">disabled="disabled"</c:if>>
							<c:forEach items="${customerCome}" var="customerCome">
								<option value="${customerCome.CODE}" <c:if test="${customerCome.FLAG eq creditMap.CUSTOMER_COME}">selected="selected"</c:if>>${customerCome.FLAG}</option>
							</c:forEach>
						</select>
					</td>
					<td style="font-size: 14px;">承租人地区：</td>
					<td style="font-size: 14px;">
						<select id="province_id" name="province_id"	onchange="getCitys();">
							<option value="-1">
								-请选择省份-
							</option>
							<c:forEach items="${provinces}" var="itemA">
								<option value="${itemA.ID }" <c:if test="${itemA.ID eq creditMap.PROVINCE_ID}">selected="selected"</c:if>>${itemA.NAME }</option>
							</c:forEach>
						</select><select id="city_id" name="city_id" onchange="getArea();">
							<option value="-1">
								-请选择市区-
							</option>
							<c:forEach items="${citys}" var="itemB">
								<option value="${itemB.ID }" <c:if test="${itemB.ID eq creditMap.CITY_ID}">selected="selected"</c:if>>${itemB.NAME }</option>
							</c:forEach>							
						</select><select id="area_id" name="area_id">
							<option value="-1">
								-请选择区-
							</option>
							<c:forEach items="${area}" var="itemC">
								<option value="${itemC.ID }" <c:if test="${itemC.ID eq creditMap.AREA_ID}">selected="selected"</c:if>>${itemC.NAME }</option>
							</c:forEach>							
						</select>
					</td>	
				</tr>						
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="font-size: 14px;">租赁方式：</td>
					<td style="font-size: 14px;">
						<select id="contract_typew" name="contract_typew" onchange="clearUnitPrice();showIsNewProduction();showImportEqipItem(this.value)"> 
							<c:forEach items="${contractType}" var="contractType">
								<option value="${contractType.CODE}" <c:if test="${contractType.CODE eq creditMap.CONTRACT_TYPE}">selected="selected"</c:if>>
									${contractType.FLAG }
								</option>
							</c:forEach>
						</select>
					</td>
					<td style="font-size: 14px;"><font color="red" style="font-size: 14px;">专案：</font></td>
					<td style="font-size: 14px;">
						<select name="creditSpecialCode" id="creditSpecialCode">
							<option value="">无</option>
							<c:forEach items="${creditSpecialList }" var="item">
								<option value="${item.creditCode }" <c:if test="${creditMap.CREDIT_SPECIAL_CODE eq item.creditCode }">selected="selected"</c:if>>${item.creditName }</option>
							</c:forEach>
						</select>
					</td>			
					<td style="font-size: 14px;">供应商联系人：</td>
					<td style="font-size: 14px;">
						<select id="supplierContactId" name="supplierContact"	onclick="supplierContactButton();">
							<c:if test="${ !empty creditMap.SUPPLIER_CONTACT }"><option value="${creditMap.SUPPLIER_CONTACT}">${supplierContactMap.LINK_NAME}</option></c:if>
							<option value="-1">
								-请选择联系人-
							</option>
						</select>
					</td>
				</tr>				
			</table>
			<div style="width: 100%; overflow-x:auto !important;">
			<table id="equipmentTab" cellspacing="0" cellpadding="2" border="0" class="ui-jqgrid-htable zc_grid_title" >
				<tr>
					<td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">客户购买意向</strong>
					</td>
					<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						相关操作：
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addEquipmentRow();" style="font-size: 14px;">添加</a>
					</td>
				</tr>
				<tr>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">供应商</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">厂牌</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">制造商</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">产品名称</strong>
					</th>
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">规格型号</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">留购价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 含税单价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">单价(元)</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 数量</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 单位</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;"> 合计</strong>
					</th>
					
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">锁码方式</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						操作<input type="hidden" id="eq_count" value="${fn:length(equipmentsList)}" style="width: 10px;"/>
					</th>
				</tr>
				<tbody id="eqBody">
				<c:forEach items="${equipmentsList}" var="item" varStatus="status">
					<tr id="eq_tr_${ status.count }">
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="SUPPIER${ status.count }" name="SUPPIER" value="${item.BRAND }"
								style="width: 100px;" class="dropDownList"/>
							<%-- <select id="SUPPIER${ status.count }" name="SUPPIER"
								onchange="showApplyGrant('SUPPIER${ status.count }',this.value);$('#SUPPIER_NAME${ status.count }').val(this.options[this.selectedIndex].text);isBuyBackFunction('SUPPIER${ status.count }')">
								<option value="${ item.SUEQ_ID }">
									${item.BRAND }
								</option>
							</select> --%>
						</td>
						<td align="center"  style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="TYPE${ status.count }" name="TYPE" value="${item.THING_KIND }"
								style="width: 100px;" class="dropDownList"/>
							<%-- <select id="TYPE${ status.count }" name="TYPE" class="ui-fix-width"
								onchange="loadEquipmentKinds(KIND${ status.count },this.value);$('#TYPE_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.THING_KIND }
								</option>
							</select> --%>
						</td>
						<td align="center"  style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="MANUFACTURER${ status.count }" name="MANUFACTURER" value="${item.MANUFACTURER }"
								style="width: 100px; font-size: 14px; height: 22px;" class="dropDownList"/>
							<%-- <select id="MANUFACTURER${ status.count }" name="MANUFACTURER"
								onchange="loadEquipmentManufacturer(TYPE${ status.count },this.value);"
								class="ui-fix-width">
								<option value="${ status.count }">
									${item.MANUFACTURER }
								</option>
							</select> --%>
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="KIND${ status.count }" name="KIND" value="${item.THING_NAME }"
								style="width: 80px;" class="dropDownList"/>
							<%-- <select id="KIND${ status.count }" name="KIND" class="ui-fix-width"
								onchange="loadEquipmentProducts(PRODUCT${ status.count },this.value);$('#KIND_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.THING_NAME }
								</option>
							</select> --%>
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="PRODUCT${ status.count }" name="PRODUCT" value="${item.MODEL_SPEC }"
								style="width: 60px;" class="dropDownList"/>
							<%-- <select id="PRODUCT${ status.count }" name="PRODUCT"
								onchange="loadEquipmentSuppliers(SUPPIER${ status.count },this.value);$('#PRODUCT_NAME${ status.count }').val(this.options[this.selectedIndex].text);">
								<option value="${ status.count }">
									${item.MODEL_SPEC }
								</option>
							</select> --%>
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="STAYBUY_PRICE${ status.count }"
								name="STAYBUY_PRICE" value="<fmt:formatNumber pattern='#,##0.00' value="${item.STAYBUY_PRICE }" />" onchange="positive(this, '租赁物留购价');setFormatCurrency(this);" 
								style="text-align: right; width: 55px;">
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="SHUI_PRICE${ status.count }" name="SHUI_PRICE" style="text-align: right; width: 100px;" 
								value="<fmt:formatNumber pattern='#,##0.00' value="${item.SHUI_PRICE }" />"  
								onchange="hunewupdateTotal('${ status.count }','${creditMap.CONTRACT_TYPE }');">
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						<!--Modify By Michael 2011 12/5 单价不能修改  -->
						<input readonly="readonly" type="text" id="UNIT_PRICE${ status.count }"
								name="UNIT_PRICE" value="<fmt:formatNumber pattern='#,##0.00' value="${item.UNIT_PRICE }" />" 
								style="text-align: right; width: 100px;">
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="AMOUNT${ status.count }" name="AMOUNT"
								value="${item.AMOUNT }" onchange="updateTotal('${ status.count }');"
								style=" width: 20px;">
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="UNIT" id="UNIT${ status.count }" style=" width: 50px;" class="dropDownList" value="${item.UNIT }" />
							<%-- <c:set var="tai" value=""></c:set>
							<c:set var="liang" value=""></c:set>
							<c:set var="tao" value=""></c:set>
							<c:set var="jian" value=""></c:set>
							<c:set var="pi" value=""></c:set>
							<c:if test="${item.UNIT eq '台'}">
								<c:set var="tai" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '辆'}">
								<c:set var="liang" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '套'}">
								<c:set var="tao" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '件'}">
								<c:set var="jian" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${item.UNIT eq '批'}">
								<c:set var="pi" value="selected='selected'"></c:set>
							</c:if>							
							<select name="UNIT" id="UNIT${ status.count }">
								<option value="台"${tai }>
									台
								</option>
								<option value="辆"${liang }>
									辆
								</option>
								<option value="套"${tao }>
									套
								</option>
								<option value="件"${jian }>
									件
								</option>
								<option value="批"${pi}>
									批
								</option>								
							</select> --%>
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" id="TOTAL${ status.count }" name="TOTAL" style="text-align: right; width: 100px;" readonly="readonly"
								size=17 value="<fmt:formatNumber pattern='#,##0.00' value="${item.TOTAL }" />">
						</td>
						
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="LOCK_CODE" id="LOCK_CODE${ status.count }" style=" width: 50px;" class="dropDownList" value="${item.LOCK_CODE }" />
							<%-- <select name="LOCK_CODE">
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
							</select> --%>
						</td>
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<div style="position: inherit;">
								<a href="#" onclick="removeRecord('${ status.count }');"><span id="del${status.count+3 }"><img src="${ctx }/images/u103.gif">删除</span></a>
								<%-- <a href="#" onclick="addOption();deleteRow.call(this);"><span id="del${status.count+3 }"><img src="${ctx }/images/u103.gif">删除</span></a> --%>
							</div>
							<input type="hidden" name="TYPE_NAME"
								ID="TYPE_NAME${ status.count }" value="${item.THING_KIND }">
							<input type="hidden" name="KIND_NAME"
								ID="KIND_NAME${ status.count }" value="${item.THING_NAME }">
							<input type="hidden" name="PRODUCT_NAME"
								ID="PRODUCT_NAME${ status.count }" value="${item.MODEL_SPEC }">
							<input type="hidden" name="SUPPIER_NAME"
								ID="SUPPIER_NAME${ status.count }" value="${item.BRAND }">
						</td>
					</tr>
					<tr id="MOUNTINGS_tr_${ status.count }">
						<td align="center" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						配件说明:
						</td>
						<td colspan="12" class="ui-widget-content jqgrow ui-row-ltr">
							<textarea cols="100" id="MOUNTINGS${ status.count }" name="MOUNTINGS" >${ item.MOUNTINGS}</textarea>
						</td>
					</tr>
				</c:forEach>
				</tbody>
				<tr>
					<td colspan="9" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="leaseTopricBig"></span>
						<script type="text/javascript">document.getElementById('leaseTopricBig').innerHTML=atoc(${schemeMap.LEASE_TOPRIC });</script>
					</td>
					<td colspan="4" style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）
						<input name="LEASE_TOPRIC" readonly="readonly" value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC }" />" id="LEASE_TOPRIC" style="text-align: right;">
					</td>
				</tr>
			</table>
			</div>
			<table align="center" width="1300" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">					
				<tr style="display: block" id="shownowgranthidden">
					<td colspan="12" width="1300" style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose><c:when test="${supperGrantMap eq null }">&nbsp;</c:when>			
							 
						<c:otherwise>
						<div style="font-size: 14px;">当前供应商：${supperGrantMap.SUPNAME }的授信额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.GRANT_PRICE?0: supperGrantMap.GRANT_PRICE}" type="currency"/>授信余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.LAST_PRICE?0:supperGrantMap.LAST_PRICE }" type="currency"/>&nbsp;&nbsp;&nbsp;交机前拨款额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.advance_grant?0:supperGrantMap.advance_grant }" type="currency"/>&nbsp;&nbsp;交机前拨款余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${empty supperGrantMap.advance_machine?0:supperGrantMap.advance_machine }" type="currency"/></div>
						</c:otherwise></c:choose>
					</td>	
				</tr>
				<c:choose><c:when test="${custGrantMap eq null }">
				<tr>
					<td colspan="12" style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
					当前客户没有授信
					</td>
				</tr>
				</c:when><c:otherwise>
				<tr>
					<td colspan="12" style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose><c:when test="${custGrantMap.GRANT_PRICE eq null }">当前客户：${custGrantMap.CUST_NAME }没有授信</c:when>
						<c:otherwise>当前客户：${custGrantMap.CUST_NAME }的授信额度为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.GRANT_PRICE}" type="currency"/>
						</c:otherwise></c:choose>
						<c:choose><c:when test="${supperGrantMap.LAST_PRICE eq null}">&nbsp;</c:when>
						<c:otherwise>授信余额为：(￥)<fmt:formatNumber pattern='#,##0.00' value="${custGrantMap.LAST_PRICE }" type="currency"/>
						</c:otherwise></c:choose>
					</td>
				</tr>
				</c:otherwise></c:choose>				
				<tr style="display: none" id="shownowgranttr" >
					<td colspan="12" class="ui-widget-content jqgrow ui-row-ltr">
						<div id="shownowgrant" style="font-size: 14px;"></div>&nbsp;
					</td>
				</tr>
				<tr  id="custgrant" style="display: none;text-align: left" >
					<td colspan="12" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						 <div id="showcustgrant" style="font-size: 14px;"></div><input type="hidden" id="custgrantprice" value="${custGrantMap.LAST_PRICE }"/><input type="hidden" id="custgrantprices" value="${custGrantMap.GRANT_PRICE }"/>&nbsp;
					</td>
				</tr>
			</table>
			<div id="isImportEqipDiv"  <c:if test="${creditMap.CONTRACT_TYPE != 7 and creditMap.CONTRACT_TYPE != 9}">style="display:none"</c:if>><br><br><br>
				<input type="checkbox" value="1" name="isImportEqip" id="isImportEqip" <c:if test="${schemeMap.IS_IMPORT_EQIP == 1}">checked</c:if>>&nbsp;&nbsp;&nbsp;<label for="isImportEqip">进口设备，成本不确定</label>
			</div>
			<div id="IS_NEW_PRODUCTION" style="display: none;font-size: 14px;"><br><br><br>是否为三个月新机：是<input type="radio" name="IS_NEW_PRODUCTION"  value="Y" <c:if test="${creditMap.IS_NEW_PRODUCTION eq 'Y' }">checked="checked"</c:if>>否<input type="radio" name="IS_NEW_PRODUCTION"  <c:if test="${creditMap.IS_NEW_PRODUCTION eq 'N' or creditMap.IS_NEW_PRODUCTION==null }">checked="checked"</c:if> value="N"></div>			
			<br><br><br>
			<table align="center" width="950" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td align="left" colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">租赁方案</strong>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁期数
					</td>
					<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="LEASE_TERM" id="LEASE_TERM" onchange="updateYearInterest();jsAddItemToSelect();changePayIrrMonthPriceEndTab1();" value="${schemeMap.LEASE_PERIOD }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁周期
					</td>
					<td style="text-align: left;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
						<select name='LEASE_COURSE' onchange="updateYearInterest();">
							<option value="1" <c:if test="${schemeMap.LEASE_COURSE eq 1}">selected='selected'</c:if>>
								-月份-
							</option>
							<option value="2" <c:if test="${schemeMap.LEASE_COURSE eq 2}">selected='selected'</c:if>>
								-双份-
							</option>
							<option value="3" <c:if test="${schemeMap.LEASE_COURSE eq 3}">selected='selected'</c:if>>
								-季度-
							</option>
							<option value="6" <c:if test="${schemeMap.LEASE_COURSE eq 6}">selected='selected'</c:if>>
								-半年-
							</option>
							<option value="12" <c:if test="${schemeMap.LEASE_COURSE eq 12}">selected='selected'</c:if>>
								-年度-
							</option>
						</select>
					</td>
				</tr>
			<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						支付方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="PAY_WAY" onchange="updateLeaseRZE();" id="PAY_WAY">
							<c:forEach items="${payWayList}" var="item">
								<c:if test="${creditMap.CONTRACT_TYPE eq 13 and (item.CODE eq 11 or item.CODE eq 13)}">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.PAY_WAY }">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
								</c:if>
								
								<c:if test="${creditMap.CONTRACT_TYPE ne 13}">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.PAY_WAY}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						&nbsp;						 	
					</td>
				</tr>
				<tr>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						税费测算方案<font color="red">&nbsp;*</font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="TAX_PLAN_CODE" id="TAX_PLAN_CODE" onchange="changeLab();clearUnitPrice()">
								<c:forEach items="${taxPlanList}" var="item">
									<option value="${item.CODE }"
										<c:if test="${ schemeMap.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
									</option>
								</c:forEach>
						</select>
						<input type="hidden" name="PAY_TOTAL_VALUEADDED_TAX" id="PAY_TOTAL_VALUEADDED_TAX" value="${empty schemeMap.TOTAL_VALUEADDED_TAX?0: schemeMap.TOTAL_VALUEADDED_TAX}">
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
						&nbsp;
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
						&nbsp;
					</td>
		</tr>
		<tr class="pay_panel">
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				佣金
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				${empty schemeMap.SALES_PAY?0:schemeMap.SALES_PAY }&nbsp;
				<input name="pay__money" type="hidden" value="${empty schemeMap.SALES_PAY?0:schemeMap.SALES_PAY }">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd1">
				银行手续费
			</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd4">
				${empty schemeMap.OUT_PAY?0:schemeMap.OUT_PAY }&nbsp;
				<input name="outPay" type="hidden" value="${empty schemeMap.OUT_PAY?0:paylist.OUT_PAY }" id="outPay">
			</span>
			</td>
		</tr>
		<tr class="pay_panel">
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd2">
				手续费收入
			</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd5">
				<c:if test="${schemeMap.INCOME_PAY_TYPE eq 1 }">无手续费，</c:if>
				<c:if test="${schemeMap.INCOME_PAY_TYPE eq 2 }">非月结，</c:if>
				<c:if test="${schemeMap.INCOME_PAY_TYPE eq 3 }">月结，</c:if>
				${empty schemeMap.INCOME_PAY?0:schemeMap.INCOME_PAY }&nbsp;
				<input name="incomePayType" type="hidden" value="${empty schemeMap.INCOME_PAY_TYPE?0:schemeMap.INCOME_PAY_TYPE }">
				<input name="incomePay" type="hidden" value="${empty schemeMap.INCOME_PAY?0:schemeMap.INCOME_PAY }">
			</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd3">
				手续费收入税额
			</span>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<span id="hd6">
				${empty schemeMap.INCOME_PAY?0:schemeMap.INCOME_PAY*0.055 }&nbsp;
			</span>
			</td>
		</tr>
		
				<tr> 
			<td colspan="4">
				<table id="irrMonthPriceTabTab1" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁方案测算方式一(每期应付租金)</b>&nbsp;<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addIrrMonthPriceRowTab1();">添加</a>
						</td>
						<td style="text-align: left;height: 24px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
							&nbsp;
						</td>
					</tr>
					<c:forEach var="item" items="${irrMonthPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text"  name="PAY_IRR_MONTH_PRICE_TAB1" class="input_right" onchange="changeSchemaLastRentPrice();"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								对应期次
							</td>
							<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_MONTH_PRICE_START_TAB1" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END_TAB1" onchange="changeIrrMonthPriceEndTab1(this);">
									<c:forEach begin="1" end="${schemeMap.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
								<span name="delSpanTab1"<c:if test="${status.count ne fn:length(irrMonthPaylines)}">style="display: none;"</c:if>><input type="button" name="delBut" onclick="deleteIrrMonthPriceRowTab1.call(this)" value="删 除" class="ui-state-default ui-corner-all"></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>					
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保证金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PLEDGE_PRICE_RATE" size="8"
							value="<fmt:formatNumber type='number' value='${empty schemeMap.PLEDGE_PRICE_RATE ? 0 : schemeMap.PLEDGE_PRICE_RATE }' maxFractionDigits="3"/>"  onchange="updatePledgePrice();updatePledgeRealPrice();">
						%
						<input type="text" name="PLEDGE_PRICE" id="PLEDGE_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_PRICE?0:schemeMap.PLEDGE_PRICE }" />" onchange="updatePledgePriceRate();updatePledgeRealPrice();" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
					<!-- 
						实际使用保证金
						 -->&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="hidden" name="PLEDGE_REALPRIC" 
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_REALPRIC ? 0 : schemeMap.PLEDGE_REALPRIC }" />" style="text-align: right">&nbsp;
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<span id="lab11" style="font-size: 14px;">用于平均抵冲金额</span>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PLEDGE_AVE_PRICE" id="PLEDGE_AVE_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_AVE_PRICE ?0:schemeMap.PLEDGE_AVE_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="PLEDGE_BACK_PRICE" id="PLEDGE_BACK_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_BACK_PRICE ?0 :schemeMap.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						用于最后抵冲期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="hidden" name="PLEDGE_LAST_PRICE" id="PLEDGE_LAST_PRICE" onchange="updateLeaseRZE();updatePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_LAST_PRICE?0:schemeMap.PLEDGE_LAST_PRICE }" />" style="text-align: right">
						<select name="PLEDGE_LAST_PERIOD" onchange="changePledgeLastPrice();" id="PLEDGE_LAST_PERIOD">
							<option value="0" <c:if test="${empty schemeMap.PLEDGE_LAST_PERIOD and schemeMap.PLEDGE_LAST_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="${schemeMap.LEASE_PERIOD }" step="1">
							  <option value="${i }" <c:if test="${not empty schemeMap.PLEDGE_LAST_PERIOD and schemeMap.PLEDGE_LAST_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select> 
<%-- 						<input type="text" name="PLEDGE_LAST_PERIOD" size="8"
							value="${empty schemeMap.PLEDGE_LAST_PERIOD?0:schemeMap.PLEDGE_LAST_PERIOD }" style="text-align: center;"> --%>
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						延迟拨款期数<!--	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="DEFER_PERIOD" id="DEFER_PERIOD" onchange="changeDeferPeriod(this.value)">
							<option value="0" <c:if test="${empty schemeMap.DEFER_PERIOD and schemeMap.DEFER_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="2" step="1">
							  <option value="${i }" <c:if test="${not empty schemeMap.DEFER_PERIOD and schemeMap.DEFER_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select> 
					
						<input type="hidden" name="PLEDGE_PERIOD" size="8"
							value="${empty schemeMap.PLEDGE_PERIOD?0:schemeMap.PLEDGE_PERIOD }" style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保证金入账
					</td>
					<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!--<input type="radio" name="PLEDGE_ENTER_WAY" value="1" <c:if test="${empty schemeMap.PLEDGE_ENTER_WAY or schemeMap.PLEDGE_ENTER_WAY eq 1 }">checked="checked"</c:if> >-->入我司&nbsp;&nbsp;&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_CMPRICE" id="PLEDGE_ENTER_CMPRICE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMPRICE?0:schemeMap.PLEDGE_ENTER_CMPRICE}" />" >&nbsp;&nbsp;<span id="tax1">税金&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_CMRATE"  style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_CMRATE?0:schemeMap.PLEDGE_ENTER_CMRATE}" />">&nbsp;&nbsp;</span>我司入供应商&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_MCTOAG" id="PLEDGE_ENTER_MCTOAG"  onchange="updatePrice1();" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAG?0:schemeMap.PLEDGE_ENTER_MCTOAG}" />">&nbsp;&nbsp;<span id="tax2">税金&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_MCTOAGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_MCTOAGRATE?0:schemeMap.PLEDGE_ENTER_MCTOAGRATE}" />"></span>
						<br>
						<!--<input type="radio" name="PLEDGE_ENTER_WAY"  value="2" <c:if test="${schemeMap.PLEDGE_ENTER_WAY eq 2 }">checked="checked"</c:if>>-->入供应商&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_AG" id="PLEDGE_ENTER_AG" style="text-align: right;"  onchange="updatePrice1();" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AG?0:schemeMap.PLEDGE_ENTER_AG }" />">&nbsp;&nbsp;<span id="tax3">税金&nbsp;
						<input type="text" size="15" name="PLEDGE_ENTER_AGRATE" style="text-align: right;" value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.PLEDGE_ENTER_AGRATE?0:schemeMap.PLEDGE_ENTER_AGRATE}" />"></span>
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						首期租金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
					<input type="text" name="HEAD_HIRE_PERCENT" size="8"
							value="<fmt:formatNumber pattern='#,##0.00' value='${empty schemeMap.HEAD_HIRE_PERCENT ? 0 : schemeMap.HEAD_HIRE_PERCENT}'/>"  onchange="updateHeadHire();">
						%
						<input type="text" name="HEAD_HIRE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.HEAD_HIRE ? 0 : schemeMap.HEAD_HIRE}" />" onchange="updateHeadHirePercent();" style="text-align: right">
						<font color="RED"><b>(期初支付时需keyin金额，期末支付时不需keyin)</b></font>
					<!-- 
						<input type="text" name="MANAGEMENT_FEE_RATE" size="8"
							value="${empty schemeMap.MANAGEMENT_FEE_RATE?0:schemeMap.MANAGEMENT_FEE_RATE }" onchange="updateManagementFee();">
						%
						<input type="text" name="MANAGEMENT_FEE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schemeMap.MANAGEMENT_FEE?0:schemeMap.MANAGEMENT_FEE }" />"  onchange="updateManagementFeeRate();" style="text-align: right;">
					 -->
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
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14" onchange="updateLeaseRZE();"
										value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >来源：<select name="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG}</option>
										</c:forEach></select></td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14" onchange="updateLeaseRZE();"
									value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >来源：<select name="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select></td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">来源：<select name="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select></td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b style="font-size: 14px;">&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" size="14"
								value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">来源：<select name="${item.CREATE_FILED_NAME }_SOURCE"><c:forEach items="${feeSourceList }" var="item11"  varStatus="status">
											<option value="${item11.CODE }" <c:if test="${item11.CODE eq item.SOURCE_CODE }">selected</c:if>>${item11.FLAG }</option>
										</c:forEach></select></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->					
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!-- 利率上浮比例 -->
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="FLOAT_RATE" size="8" style="display: none;"
							value='<fmt:formatNumber type="number" value="${schemeMap.FLOAT_RATE }" maxFractionDigits="3"/>' onchange="updateYearInterest();">
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						合同利率
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="YEAR_INTEREST" size="8"
							value="<fmt:formatNumber type='number' value='${schemeMap.YEAR_INTEREST }' maxFractionDigits='3'/>" onchange="updateFloatRate();">
						%
						<input type="radio" name="YEAR_INTEREST_TYPE" value="1" <c:if test="${empty schemeMap or empty schemeMap.YEAR_INTEREST_TYPE or schemeMap.YEAR_INTEREST_TYPE eq 1}">checked="checked"</c:if> >浮动
						<input type="radio" name="YEAR_INTEREST_TYPE" checked="checked" value="2" <c:if test="${schemeMap.YEAR_INTEREST_TYPE eq 2}">checked="checked"</c:if> >固定
					</td>
					
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b style="font-size: 14px;">客户TR</b></font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"><!-- Modify by Michael 2012 1/9 进入修改页面时重新计算TR -->
					<b style="font-size: 14px;">&nbsp;<!-- <fmt:formatNumber value="${schemeMap.TR_RATE }" pattern="##0.000"></fmt:formatNumber> -->
						<fmt:formatNumber value="${paylist.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;&nbsp;</b>%
						<input type="hidden" name="TR_RATE" value="${empty paylist.TR_RATE ? 0 : paylist.TR_RATE }">
						<input type="hidden" name="TR_IRR_RATE" value="${empty paylist.TR_IRR_RATE ? 0 : paylist.TR_IRR_RATE }">
					
					<!--  Modify by Mcihael 2012 02/06 增加利差  -->
					<c:set value="0" var="RATE_DIFF"></c:set>
					<c:forEach items="${paylist.paylines }" var="item111" varStatus="status">
						<c:set value="${RATE_DIFF + item111.PV_PRICE}" var="RATE_DIFF"></c:set>
					</c:forEach>
					<input type="hidden" name="RATE_DIFF" value="<fmt:formatNumber value="${RATE_DIFF }" type="currency" maxFractionDigits="0" />" readonly="readonly">
					
					<!--
					<input type="hidden" name="RATE_DIFF" value="${empty schemeMap.RATE_DIFF ? 0 : schemeMap.RATE_DIFF }">
					  -->
					  
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<font color="RED"><b style="font-size: 14px;">实际TR</b></font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr"><!-- Modify by Michael 2012 1/9 进入修改页面时重新计算TR -->
						<b style="font-size: 14px;">&nbsp;&nbsp;<!--  <fmt:formatNumber value="${schemeMap.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber> --><fmt:formatNumber value="${paylist.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
					</td>					

				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						概算成本（RZE）
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="LEASE_RZE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_RZE }" />" onchange="setFormatCurrency(this);" style="text-align: right;" readonly="readonly">
						
						
						<font color="red"><b>
						承作成數:
						<span id="leaseRzePrecent">
						<c:if test="${schemeMap.LEASE_TOPRIC>0 }">					
						<fmt:formatNumber maxFractionDigits="2"  type ="percent" value="${schemeMap.LEASE_RZE /schemeMap.LEASE_TOPRIC }" />				
					    </c:if>
					    </span>
						</b></font>
				
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<!-- 预估起租日 -->预计交机日
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="START_DATE" id="START_DATE" readonly="readonly" 
							value="<fmt:formatDate value="${schemeMap.START_DATE }" pattern="yyyy-MM-dd"/>" onchange="checkTime()">
						 	
					</td>
				</tr>			
	
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						介绍人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="SPONSOR" 
							value="${schemeMap.SPONSOR }">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						发票人
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="INVOICE_PERSON"
							value="${schemeMap.INVOICE_PERSON }">
					</td>
				</tr>
				
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						差旅费
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
					<c:choose><c:when test="${schemeMap.BUSINESS_TRIP_PRICE eq null}"><input type="text" name="BUSINESS_TRIP_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="0" />" onchange="setFormatCurrency(this);" style="text-align: right;">
					</c:when> 
					<c:otherwise><input type="text" name="BUSINESS_TRIP_PRICE"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.BUSINESS_TRIP_PRICE }" />" onchange="setFormatCurrency(this);" style="text-align: right;">
					</c:otherwise></c:choose>
					
					
					
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						申请拨款金额&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" name="BEGMONEY" id="BEGMONEY" onChange="updatePrice2();updateAppropiate0();updateAppropiate1();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${schemeMap.LEASE_TOPRIC-schemeMap.PLEDGE_ENTER_MCTOAG-schemeMap.PLEDGE_ENTER_AG }" />"  style="text-align: right;">&nbsp;

					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">预计拨款日</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="text" id="estimates_pay_date" name="estimates_pay_date" value="${schemeMap.ESTIMATES_PAY_DATE }" readonly="readonly"/>
						<input type="hidden" name="ESTIMATES_PAY_DATE_NUM" value="${schemeMap.ESTIMATES_PAY_DATE_NUM }" readonly="readonly"/>
						<input type="hidden" name="ESTIMATES_PAY_DATE_REASON" value="${schemeMap.ESTIMATES_PAY_DATE_REASON }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td  rowspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						拨款方式（<span id="PAY_MONEY_WAY_FONT_1"></span>情形）
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
					<span id="BEFORE_PAY">
						<input type="checkbox" name="APPROPRIATEFUNS"
							value="0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">checked="true"</c:if></c:forEach> style="text-align: right;"><span id="PAY_MONEY_WAY_FONT_0"></span>前&nbsp;
							<span id="PAY_MONEY_WAY_FONT_2"></span>前比例:<input type="text" name="PAYPERCENT0" id="PAYPERCENT0" onchange="updateAppropiate0();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="${item.PAYPERCENT}"</c:if></c:forEach>/>%&nbsp;
							<span id="PAY_MONEY_WAY_FONT_3"></span>前拨款金额:<input type="text" name="APPROPIATEMON0" id="APPROPIATEMON0" onchange="updateAppropiate00();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="<fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/>"</c:if></c:forEach>  style="text-align: right;"/>
						    <span id="PAY_MONEY_WAY_FONT_4"></span>前拨款给:<input type="text" name="APPRORIATENAME0" id="APPROPIATENAME0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 0}">value="${item.APPRORIATENAME}"</c:if></c:forEach>  style="text-align: right;"/>
						<!-- <input type="checkbox" name="APPROPRIATEFUNS"
							value="1"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">checked="true"</c:if></c:forEach>   style="text-align: right;">交机后&nbsp;
							交机后比例:<input type="text" name="PAYPERCENT1" id="PAYPERCENT0" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="${item.PAYPERCENT}"</c:if></c:forEach>/>%&nbsp;
							交机前拨款金额:<input type="text" name="APPROPIATEMON1" id="APPROPIATEMON1" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="<fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/>"</c:if></c:forEach>  style="text-align: right;"/>
					 -->	
					 </span>
					</td>
					
				</tr>
				<tr>
					
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">					
							<input type="checkbox" name="APPROPRIATEFUNS"
							value="1"  <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">checked="true"</c:if></c:forEach>   style="text-align: right;"><span id="PAY_MONEY_WAY_FONT_5"></span>后&nbsp;
							<span id="PAY_MONEY_WAY_FONT_6"></span>后比例:<input type="text" name="PAYPERCENT1" id="PAYPERCENT1" onchange="updateAppropiate1();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="${item.PAYPERCENT}"</c:if></c:forEach>/>%&nbsp;
							<span id="PAY_MONEY_WAY_FONT_7"></span>后拨款金额:<input type="text" name="APPROPIATEMON1" id="APPROPIATEMON1" onchange="updateAppropiate01();" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="<fmt:formatNumber pattern='#,##0.00' value="${item.APPRORIATEMON}"/>"</c:if></c:forEach>  style="text-align: right;"/>
						    <span id="PAY_MONEY_WAY_FONT_8"></span>后拨款给:<input type="text" name="APPRORIATENAME1" id="APPROPIATENAME1" <c:forEach items="${appropiateList}" var="item"><c:if test="${item.TYPE eq 1}">value="${item.APPRORIATENAME}"</c:if></c:forEach>  style="text-align: right;"/>					
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						拨款方式（勾选）
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<input type="radio" id="OnlinetBank" name="appropriation_way" <c:if test="${schemeMap.APPROPRIATION_WAY ne 1 }">checked="checked"</c:if> onclick="javascript:$('#chequeDiv').hide()" value="2"><label for="OnlinetBank">网银</label>
						<input type="radio" id="cheque" name="appropriation_way" <c:if test="${schemeMap.APPROPRIATION_WAY eq 1 }">checked="checked"</c:if> onclick="javascript:$('#chequeDiv').show()" value="1"><label  for="cheque">支票</label>
						<span id="chequespan">
						<c:if test="${schemeMap.DEFER_PERIOD >0}">(延迟拨款期数:${schemeMap.DEFER_PERIOD})</c:if>
						</span><br>
					</td>
					
				</tr>
				<tr id="chequeDiv" <c:if test="${schemeMap.APPROPRIATION_WAY ne 1 }">style="display:none"</c:if>>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						背书人
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						第一背书人：<input type="text" id="endorser_1" name="endorser_1"  value="${schemeMap.ENDORSER_1 }"/>;第二背书人：<input type="text" id="endorser_2" name="endorser_2"  value="${schemeMap.ENDORSER_2 }"/>
					</td>
					
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">供应商保证</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="SUPL_TRUE" id="SUPL_TRUE">
							<c:forEach items="${suplList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.SUPL_TRUE}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }" <c:if test="${IS_BUY_BACK eq 'Y' and item.CODE eq '3' }">selected="selected"</c:if>>
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
				<tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁物件设置场所
					</td>
					
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select id="province_id_eq" name="province_id_eq" onchange="getCitysByProvId('province_id_eq', 'city_id_eq');changeAddress();">
						 	<option value="-1" <c:if test="${cust.PROVINCE_ID eq -1}"> selected="selected"</c:if>>-请选择省份-</option>
						 	<c:forEach items="${provinces}" var="item">
						 		<option value="${item.ID }" <c:if test="${schemeMap.EQUPMENT_PROVINCE eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach>
						</select>
						<select id="city_id_eq" name="city_id_eq" onchange="getAreaByCityId('city_id_eq', 'area_id_eq');changeAddress();">
						 	<option value="-1">-请选择市区-</option>
						 	<c:forEach items="${citys_eq}" var="item">
						 		<option value="${item.ID }" <c:if test="${schemeMap.EQUPMENT_CITY eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach> 
						</select>
						<select id="area_id_eq" name="area_id_eq" onchange="changeAddress();">
						 	<option value="-1">-请选择市区-</option>
						 	<c:forEach items="${areas_eq}" var="item">
						 		<option value="${item.ID }" <c:if test="${schemeMap.EQUPMENT_AREA eq item.ID}"> selected="selected"</c:if>>${item.NAME }</option>
						 	</c:forEach> 
						</select>
						<input type="text" name="EQUPMENT_ADDRESS" id="EQUPMENT_ADDRESS"
							value="${schemeMap.EQUPMENT_ADDRESS }" style="width: 400px;">&nbsp;
						<br>经纬度：
						X-<input type="text" name="EQUPMENT_X" value="${schemeMap.EQUPMENT_X }" style="width: 60px;">
						Y-<input type="text" name="EQUPMENT_Y" value="${schemeMap.EQUPMENT_Y }" style="width: 60px;">
					</td>
				</tr>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						租赁期满处理方式
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="DEAL_WAY">
							<c:forEach items="${dealWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.DEAL_WAY}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> &nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						&nbsp;
					</td>								
				</tr>
				<tr style="display: none;">
					<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						保险公司
					</td>
					<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
						<select name="INSURANCE_COMPANY_ID">
							<c:forEach items="${insureCompanyList}" var="item">
								<c:choose>
									<c:when
										test="${item.INCP_ID eq schemeMap.INSURANCE_COMPANY_ID}">
										<option value="${item.COMPANY_ID }" selected="selected">
											${item.INCP_NAME }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.INCP_ID }">
											${item.INCP_NAME }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select> &nbsp;
					</td>
					<input type="hidden" name="BUY_INSURANCE_WAY" id="BUY_INSURANCE_WAY" value="0">
					<input type="hidden" name="INSURE_REBATE_RATE" id="INSURE_REBATE_RATE" value="0.00">
					<input type="hidden" name="BUY_INSURANCE_TIME" id="BUY_INSURANCE_TIME" value="0">
					<!-- <td  class="ui-widget-content jqgrow ui-row-ltr">
						购买方式
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<select name="BUY_INSURANCE_WAY">
							<c:forEach items="${insureBuyWayList}" var="item">
								<c:choose>
									<c:when test="${item.CODE eq schemeMap.BUY_INSURANCE_WAY}">
										<option value="${item.CODE }" selected="selected">
											${item.FLAG }
										</option>
									</c:when>
									<c:otherwise>
										<option value="${item.CODE }">
											${item.FLAG }
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>-->
				</tr>
				<!--<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						保险返利百分比
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
					<c:choose>
					<c:when test="${empty schemeMap.INSURE_REBATE_RATE  }">
					<input type="text" name="INSURE_REBATE_RATE" size="8"value="0"></c:when>  
					
					<c:otherwise><input type="text" name="INSURE_REBATE_RATE" size="8"value="${schemeMap.INSURE_REBATE_RATE }"></c:otherwise></c:choose>
						%
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						购买时间
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<c:choose>
							<c:when test="${empty schemeMap.BUY_INSURANCE_TIME }">
								<input type="radio" name="BUY_INSURANCE_TIME" value="1"
									checked="checked">
											全年购买
											<input type="radio" name="BUY_INSURANCE_TIME" value="2">
											分年购买
										</c:when>
							<c:otherwise>
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 1}">
									<input type="radio" name="BUY_INSURANCE_TIME" value="1"
										checked="checked">
												全年购买
												<input type="radio" name="BUY_INSURANCE_TIME" value="2">
												分年购买
											</c:if>
								<c:if test="${schemeMap.BUY_INSURANCE_TIME eq 2}">
									<input type="radio" name="BUY_INSURANCE_TIME" value="1">
												全年购买
												<input type="radio" name="BUY_INSURANCE_TIME" value="2"
										checked="checked">
												分年购买
											</c:if>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				-->
			</table>
			<br><br><br>
			<table align="center" width="950" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
				<tr>
					<td align="left" colspan="6"  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">保险费</strong>
					</td>
					<!--  
					<td align="left" colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addInsureItem();">添加</a>
					</td>
					-->
				</tr>
				<tr>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						保险项目
					</th>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						保险期间
					</th>
					<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						保险费率
					</th>
					<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						保险费用
					</th>
					<th width="27%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						备注
					</th>
					<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						操作
					</th>
				</tr>
				<c:set value="0" var="insureTotal"></c:set>
				<c:forEach items="${insuresList}" var="item" varStatus="status">
					<tr>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="INSURE_ITEM${status.count }" name="INSURE_ITEM">
								<c:forEach items="${insureTypeList}" var="insureType">
									<c:choose>
										<c:when test="${insureType.INTP_ID eq item.INSURE_ITEM}">
											<option value="${insureType.INTP_ID }" selected="selected">
												${insureType.INTP_NAME }
											</option>
										</c:when>
										<c:otherwise>
											<option value="${insureType.INTP_ID }">
												${insureType.INTP_NAME }
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="START_DATE${status.count }" name="_"
								size="11" value="${item.START_DATE }" />
							到
							<input id="END_DATE${status.count }" name="END_DATE" size="11"
								value="${item.END_DATE }" />
						</td>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_RATE${status.count }" name="INSURE_RATE"
								size="4" value="${item.INSURE_RATE }">
							%
						</td>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_PRICE${status.count }" name="INSURE_PRICE" onchange="changeInsurePrice();"
								size="15"  value="<fmt:formatNumber value="${item.INSURE_PRICE }" pattern="#,##0.00"/>" style="text-align: right">
							<c:set var="insureTotal" value="${insureTotal+item.INSURE_PRICE }"></c:set>	
						</td>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_MEMO${status.count }" name="INSURE_MEMO"
								size="25" value="${item.MEMO }">
						</td>
						<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteRow2.call(this)">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="left" colspan="4" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="insureTotalBig" style="font-size: 14px;"></span>
					<script type="text/javascript">document.getElementById('insureTotalBig').innerHTML=atoc(${insureTotal});</script>
					</td>
					<td align="left" colspan="2" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）<input type="text" id="TOTAL_INSURE" readonly="readonly" value="<fmt:formatNumber value="${insureTotal}" pattern="#,##0.00"/>" style="text-align: right">
					</td>
				</tr>

			</table>

			<br><br><br>
			<table align="center" width="950" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
				<tr>
					<td align="left" colspan="3"   class="ui-state-default ui-th-ltr zc_grid_head">
						<strong style="font-size: 14px;">其他费用</strong>
					</td>
					<td align="left" colspan="2"   class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addOtherPrice();">添加</a>
					</td>
				</tr>
				<tr>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						费用名称
					</th>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						费用金额
					</th>
					<th width="20%"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						产生费用时间
					</th>
					<th width="35%"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						备注
					</th>
					<th width="5%"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						操作
					</th>
				</tr>
				<c:set var="totalOtherPrice" value="0" />
				<c:forEach items="${otherPriceList}" var="otherPrice"
					varStatus="status">
					<tr>
						<td align="center"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="OTHER_NAME${status.count }" name="OTHER_NAME"
								value="${otherPrice.OTHER_NAME }" />
						</td>
						<td align="center"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="OTHER_PRICE${status.count }" name="OTHER_PRICE"
								value="<fmt:formatNumber value="${otherPrice.OTHER_PRICE }" pattern="#,##0.00"/>" onchange="changeOtherPrice();" style="text-align: right">
							<c:set var="totalOtherPrice" value="${otherPrice.OTHER_PRICE+totalOtherPrice }" />
						</td>
						<td align="center"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="OTHER_DATE${status.count }" name="OTHER_DATE"  readonly='readonly'
								value="<fmt:formatDate pattern="yyyy-MM-dd" value="${otherPrice.OTHER_DATE }"/>">
						</td>
						<td align="center"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="OTHER_MEMO${status.count }" name="OTHER_MEMO"
								size="30" value="${otherPrice.MEMO }">
						</td>
						<td align="center"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="left" colspan="3"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="totalOtherPriceBig" style="font-size: 14px;"></span>
						<script type="text/javascript">
							document.getElementById("totalOtherPriceBig").innerHTML=atoc(${totalOtherPrice});
						</script>
					</td>
					<td align="left" colspan="2"   style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥） <input id="totalOtherPrice"
								value="<fmt:formatNumber value="${totalOtherPrice}" pattern="#,##0.00"/>" style="text-align: right">
					</td>
				</tr>

			</table>
			<br><br><br>
			<table align="center" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						建议承做理由
					</td>
				</tr>
				<tr>
					<td style="font-size: 14px;">
						内容：<textarea rows="5" cols="100" id="ADVISE_CONTENT" name="ADVISE_CONTENT"><c:forEach items="${contentList}" var="item" varStatus="status"><c:if test="${item.STATE eq 1}">${item.PROJECT_CONTENT }</c:if></c:forEach></textarea>
					</td>
				</tr>
			</table>
			<br>
			<table align="center" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
						其他租赁条件说明
					</td>
				</tr>
				<tr>
					<td style="font-size: 14px;">
						内容：<textarea rows="5" cols="100" id="EXPLAIN_CONTENT" name="EXPLAIN_CONTENT"><c:forEach items="${contentList}" var="item" varStatus="status"><c:if test="${item.STATE eq 50}">${item.PROJECT_CONTENT }</c:if></c:forEach></textarea>
					</td>
				</tr>
			</table>
			<table align="center" width="950" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">

				<tr>
					<td colspan="5" align="center">
						<input type="button" name="sub" value="保  存"  class="ui-state-default ui-corner-all"
							onclick="saveScheme();">
						<input type="reset" name="res" value="重  置"  class="ui-state-default ui-corner-all">
					</td>
				</tr>
			</table>
			<br/>
			</div>
</div>
</div>
		</form>
	</body>
	<script type="text/javascript">
		if($("#contract_typew").val()==2) {
			document.getElementById("IS_NEW_PRODUCTION").style.display="block";
		} else {
			document.getElementById("IS_NEW_PRODUCTION").style.display="none";
		}
		
		if($("#contract_typew").val()==0||$("#contract_typew").val()==1||$("#contract_typew").val()==2||$("#contract_typew").val()==5) {
			$("#PAY_MONEY_WAY_FONT_0").html('交机');
			$("#PAY_MONEY_WAY_FONT_1").html('交机');
			$("#PAY_MONEY_WAY_FONT_2").html('交机');
			$("#PAY_MONEY_WAY_FONT_3").html('交机');
			$("#PAY_MONEY_WAY_FONT_4").html('交机');
			$("#PAY_MONEY_WAY_FONT_5").html('交机');
			$("#PAY_MONEY_WAY_FONT_6").html('交机');
			$("#PAY_MONEY_WAY_FONT_7").html('交机');
			$("#PAY_MONEY_WAY_FONT_8").html('交机');
		} else {
			$("#PAY_MONEY_WAY_FONT_0").html('设定');
			$("#PAY_MONEY_WAY_FONT_1").html('设定');
			$("#PAY_MONEY_WAY_FONT_2").html('设定');
			$("#PAY_MONEY_WAY_FONT_3").html('设定');
			$("#PAY_MONEY_WAY_FONT_4").html('设定');
			$("#PAY_MONEY_WAY_FONT_5").html('设定');
			$("#PAY_MONEY_WAY_FONT_6").html('设定');
			$("#PAY_MONEY_WAY_FONT_7").html('设定');
			$("#PAY_MONEY_WAY_FONT_8").html('设定');
		}
		$("#PAY_MONEY_WAY_FONT_0").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_1").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_2").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_3").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_4").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_5").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_6").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_7").css("font-size","14px");
		$("#PAY_MONEY_WAY_FONT_8").css("font-size","14px");
	</script>
</html>
