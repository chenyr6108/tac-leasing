<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>支付表浏览</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>		
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQSTART_DATE").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQEND_DATE").datepicker($.datepicker.regional["zh-CN"]);	
			}); 
					function expPayToPdf(){
						  var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择支付表！");
						  	return false;
						  }else if(chk_value.length>1){
						  	alert("只能选择一个支付表！");
						  	return false;  
						  }	
						  var value_added_tax =[];
						  var tempStr="";
						  var valueAddedFlag;

					      for (var i=0; i<chk_value.length; i++){
						    	tempStr=chk_value[i];
						    	value_added_tax=tempStr.split(",");
						    	if (value_added_tax[1]=="2"){
						    		valueAddedFlag=2;
						    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"){
						    		valueAddedFlag=1;
						    	}
					       }
						
					    var aa = document.getElementsByName("ids");
					    var tempStrValue="";
					    var tempArrayValue="";
					    for (var i=0; i<aa.length; i++){
					    	tempStrValue=aa[i].value;
					        if(aa[i].checked){
					        	tempArrayValue=tempStrValue.split(",");
					        	aa[i].value=tempArrayValue[0];
					        }
				        }
					      
						if (valueAddedFlag==2){
							$("#__action").val("exportPayToPdf.expPayToPdfByValueAdded");
						}else if(valueAddedFlag==1){
							$("#__action").val("exportPayToPdf.expPayToPdf");
						}
						
						$("#form1").submit();
						$("#__action").val("collectionManage.queryPaylistForExport");
					}				
					function expZulwToPdf(){
						  var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
							  	alert("你还没有选择支付表！");
							  	return false;
						  	}else if(chk_value.length>1){
							  	alert("只能选择一个支付表！");
							  	return false;  
						  }	
						  
						  var value_added_tax =[];
						  var tempStr="";
						  var valueAddedFlag;

					      for (var i=0; i<chk_value.length; i++){
						    	tempStr=chk_value[i];
						    	value_added_tax=tempStr.split(",");
						    	if (value_added_tax[1]=="2"){
						    		valueAddedFlag=2;
						    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"){
						    		valueAddedFlag=1;
						    	}
					       }
						
					    var aa = document.getElementsByName("ids");
					    var tempStrValue="";
					    var tempArrayValue="";
					    for (var i=0; i<aa.length; i++){
					    	tempStrValue=aa[i].value;
					        if(aa[i].checked){
					        	tempArrayValue=tempStrValue.split(",");
					        	aa[i].value=tempArrayValue[0];
					        }
				        }	  
						  
						$("#__action").val("expQuoToPdf.expCollectionZulwToPdf");
						$("#form1").submit();
						$("#__action").val("collectionManage.queryPaylistForExport");
					}	
					function expPayToExcel(){
						var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择支付表！");
						  	return false;
						  }else if(chk_value.length>1){
							  	alert("只能选择一个支付表！");
							  	return false;  
						  }		
						  
						  var value_added_tax =[];
						  var tempStr="";
						  var valueAddedFlag;

					      for (var i=0; i<chk_value.length; i++){
						    	tempStr=chk_value[i];
						    	value_added_tax=tempStr.split(",");
						    	if (value_added_tax[1]=="2"){
						    		valueAddedFlag=2;
						    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"||value_added_tax[1]=="4"||value_added_tax[1]=="5"
						    		||value_added_tax[1]=="6"
						    			||value_added_tax[1]=="7"
						    				||value_added_tax[1]=="8"){
						    		valueAddedFlag=1;
						    	}
					       }
						
					    var aa = document.getElementsByName("ids");
					    var tempStrValue="";
					    var tempArrayValue="";
					    for (var i=0; i<aa.length; i++){
					    	tempStrValue=aa[i].value;
					        if(aa[i].checked){
					        	tempArrayValue=tempStrValue.split(",");
					        	aa[i].value=tempArrayValue[0];
					        }
				        }
						if (valueAddedFlag==2){
							$("#__action").val("collectionManage.expPayToExcelByValueAdded");
						}else if(valueAddedFlag==1){
							$("#__action").val("collectionManage.expPayToExcel");
						}  
						  $("#form1").submit();
						  $("#__action").val("collectionManage.queryPaylistForExport");
					}	
					
					function expRZSYToExcel(){
						var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择支付表！");
						  	return false;
						  }else if(chk_value.length>1){
							  	alert("只能选择一个支付表！");
							  	return false;  
						  }	
						  
						  var value_added_tax =[];
						  var tempStr="";
						  var valueAddedFlag;

					      for (var i=0; i<chk_value.length; i++){
						    	tempStr=chk_value[i];
						    	value_added_tax=tempStr.split(",");
						    	if (value_added_tax[1]=="2"){
						    		valueAddedFlag=2;
						    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"){
						    		valueAddedFlag=1;
						    	}
					       }
						
					    var aa = document.getElementsByName("ids");
					    var tempStrValue="";
					    var tempArrayValue="";
					    for (var i=0; i<aa.length; i++){
					    	tempStrValue=aa[i].value;
					        if(aa[i].checked){
					        	tempArrayValue=tempStrValue.split(",");
					        	aa[i].value=tempArrayValue[0];
					        }
				        }					  
						  
						  $("#__action").val("collectionManage.expRZSYToExcel");
						  $("#form1").submit();
						  $("#__action").val("collectionManage.queryPaylistForExport");
					}	
					function expExpcel(){
						  var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
							  	alert("你还没有选择支付表！");
							  	return false;
						  	}else if(chk_value.length>1){
							  	alert("只能选择一个支付表！");
							  	return false;  
						  }
						  var value_added_tax =[];
						  var tempStr="";
						  var valueAddedFlag;

					      for (var i=0; i<chk_value.length; i++){
						    	tempStr=chk_value[i];
						    	value_added_tax=tempStr.split(",");
						    	if (value_added_tax[1]=="2"){
						    		valueAddedFlag=2;
						    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"){
						    		valueAddedFlag=1;
						    	}
					       }
						
					    var aa = document.getElementsByName("ids");
					    var tempStrValue="";
					    var tempArrayValue="";
					    for (var i=0; i<aa.length; i++){
					    	tempStrValue=aa[i].value;
					        if(aa[i].checked){
					        	tempArrayValue=tempStrValue.split(",");
					        	aa[i].value=tempArrayValue[0];
					        }
				        }						  
						$("#__action").val("settleManage.expExpcel");
						$("#form1").submit();
						$("#__action").val("collectionManage.queryPaylistForExport");
					}
					
			//Add by Michael 2012 4-20 For导出本息摊还表
			function expOwnPriceToExcel(){
				var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支付表！");
				  	return false;
				  }else if(chk_value.length>1){
					  	alert("只能选择一个支付表！");
					  	return false;  
				  }
				  
				  var value_added_tax =[];
				  var tempStr="";
				  var valueAddedFlag;

			      for (var i=0; i<chk_value.length; i++){
				    	tempStr=chk_value[i];
				    	value_added_tax=tempStr.split(",");
				    	if (value_added_tax[1]=="2"){
				    		valueAddedFlag=2;
				    	}else if(value_added_tax[1]=="1"||value_added_tax[1]=="3"){
				    		valueAddedFlag=1;
				    	}
			       }
				
			    var aa = document.getElementsByName("ids");
			    var tempStrValue="";
			    var tempArrayValue="";
			    for (var i=0; i<aa.length; i++){
			    	tempStrValue=aa[i].value;
			        if(aa[i].checked){
			        	tempArrayValue=tempStrValue.split(",");
			        	aa[i].value=tempArrayValue[0];
			        }
		        }
				  
				if (valueAddedFlag==2){
					$("#__action").val("exportPayToPdf.expOwnPriceToPdfByValueAddedTax");
				}else if(valueAddedFlag==1){
					$("#__action").val("exportPayToPdf.expOwnPriceToPdf");
				} 			    
			    
				  $("#form1").submit();
				  $("#__action").val("collectionManage.queryPaylistForExport");
			}


			function showCarPayApplyInfo(recp_id){
				document.carFormCarPay.recp_id.value=recp_id;
				$.ajax({
					type:"POST",
					data: '__action=collectionManage.queryCarPayAccount&recp_id='+recp_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						document.carFormCarPay.PAY_MAN.value=databack.writeBackDetails.PAY_MAN;
						document.carFormCarPay.ID_CAR.value=databack.writeBackDetails.ID_CAR;
						document.carFormCarPay.BANK_NAME.value=databack.writeBackDetails.BANK_NAME;
						document.carFormCarPay.BANK_ACCOUNT.value=databack.writeBackDetails.BANK_ACCOUNT;
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
				$("#showCarPayApplyInfo").dialog({
					modal:true,
					autoOpen: false,
					width: 450
				});
				$("#showCarPayApplyInfo").dialog('open');
			}			
			
			function createCarPayApplyInfo(){
				if(document.carFormCarPay.PAY_MAN.value.trim()==""){
					alert("还款人不能为空！");
					document.carFormCarPay.PAY_MAN.focus();
					return false;
				}
				if(document.carFormCarPay.ID_CAR.value.trim()==""){
					alert("证件号码不能为空！");
					document.carFormCarPay.ID_CAR.focus();
					return false;
				}
				if(document.carFormCarPay.BANK_NAME.value.trim()==""){
					alert("开户行不能为空！");
					document.carFormCarPay.BANK_NAME.focus();
					return false;
				}
				if(document.carFormCarPay.BANK_ACCOUNT.value.trim()==""){
					alert("银行账号不能为空！");
					document.carFormCarPay.BANK_ACCOUNT.focus();
					return false;
				}
				 $("#carFormCarPay").submit();
			}
			
    	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="collectionManage.queryPaylistForExport" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;支付表浏览</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								正常结清
							</option>
							<option value="3" <c:if test="${QSELECT_STATUS eq 3}">selected='selected'</c:if>>
								提前结清
							</option>
							<option value="4" <c:if test="${QSELECT_STATUS eq 4}">selected='selected'</c:if>>
								回购
							</option>
							<option value="5" <c:if test="${QSELECT_STATUS eq 5}">selected='selected'</c:if>>
								结清确认待分解
							</option>
							</select>
					</td>
					<td>
					公司別：
					</td>
					<td>
					<select name="companyCode" style=" height: 18px;">
							<option value="" >
								全部
							</option>
							<option value="1" <c:if test="${companyCode eq 1}">selected='selected'</c:if>>
								裕融
							</option>
							<option value="2" <c:if test="${companyCode eq 2}">selected='selected'</c:if>>
								裕国
							</option>
							</select>
					</td>				
					<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
					<td>结清起始日期：</td>
				          <td>
				          <input type="text" name="JQSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="JQSTART_DATE" value="${JQSTART_DATE }"></td>
				         
				          </tr></c:if>		
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="7"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:383px;height:18px; font-size: 12px;">
				          </td>
				          <c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
				           <td>
				          结清结束日期：</td>
				          <td><input type="text" name="JQEND_DATE" id="JQEND_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${JQEND_DATE }">
					</td></c:if>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
					</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table style="width: 100%;"> 
				<tr>
					<td>
						<!-- <input type="button" class="panel_button" id="But" value="导出支付表(PDF)" name="But" onclick="expPayToPdf();"> -->
			<!-- 		<input type="button" class="panel_button" id="But2" value="导出租赁物详细表" name="But2" onclick="expZulwToPdf();"> -->
						<input type="button" class="panel_button" id="But" value="导出支付表(EXCEL)" name="But" onclick="expPayToExcel();">
						<input type="button" class="panel_button" id="But" value="未实现融资收益分配表(EXCEL)" name="But" onclick="expRZSYToExcel();">
						<!-- <input type="button" class="panel_button" id="But" value="本息摊还表(PDF)" name="But" onclick="expOwnPriceToExcel();"> -->
						<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}"><input type="button" class="panel_button" id="But" value="结清明细表(EXCEL)" name="But" onclick="expExpcel();"></c:if>
					</td>
					<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
				</tr>
			</table>
					<table class="grid_table">
							<tr>
								<th width="4%" >
									&nbsp;<!-- <INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');"> -->
								</th>							
								<th width="4%">
									序号
								</th>																
								<th >
									状态
								</th>
								<th>
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
								</th>
								<th>
									<page:pagingSort orderBy="RECP_CODE" pagingInfo="${dw}">支付表号</page:pagingSort>
								</th>
								<th>
									客户名称
								</th>
								<th>
									版本号
								</th>
								<th>
									客户经理
								</th>
								<th>
									办事处主管
								</th>
								<th>
									创建日期
								</th>
								<th>
									起租日期
								</th>
								<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
								<th>
									结清日期
								</th>
								</c:if>
								<!-- Add by Michael 2012 02/01 增加罚息明细查询   -->
								<th>
									还款明细
								</th>
								<th>
									操作
								</th>																
							</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr>
							    <td style="text-align: center;"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.RECP_ID},${item.TAX_PLAN_CODE}" onclick="checkItem(this,'all')"></td>
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;"><c:if test="${item.RECP_STATUS eq 0}"><img src="${ctx }/images/u608.gif" title="正常"></c:if><c:if test="${item.RECP_STATUS eq 1}"><img src="${ctx }/images/u622.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS eq 3}"><img src="${ctx }/images/u611.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS eq 4}"><img src="${ctx }/images/u614.gif" title="回购"></c:if><c:if test="${item.RECP_STATUS eq 5}"><img src="${ctx }/images/u620.gif" title="结清确认待分解"></c:if></td>
								<!-- add by Michael 2012 07-13 增加案件号 -->
								<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">${item.RECP_CODE}</a></td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.VERSION_CODE }</td>
								<td style="text-align: center;">${item.SENSORNAME }</td>
								<td style="text-align: center;">${item.CLERKNAME }</td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.CREATE_TIME }" /></td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.FIRST_PAYDATE }" /></td>
								<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.JQDATE }" />&nbsp;</td>
								</c:if>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.showNewDunDetailByDecpId&RECP_CODE=${item.RECP_CODE}&RECP_ID=${item.RECP_ID }&CUST_NAME=${item.CUST_NAME }&RECP_STATUS=${item.RECP_STATUS }'">还款明细</a></td>
								<td style="text-align: center;"><c:if test="${addCarPayAccount}"><a href="javascript:void(0);" onclick="showCarPayApplyInfo('${item.RECP_ID }')">添加扣款账户</a></c:if></td>
							</tr>
						</c:forEach>
						</table>
						<table style="width: 100%;">
						<tr>
							<td>
								<!-- <input type="button" class="panel_button" id="But" value="导出支付表(PDF)" name="But" onclick="expPayToPdf();"> -->
					<!-- 		<input type="button" class="panel_button" id="But2" value="导出租赁物详细表" name="But2" onclick="expZulwToPdf();"> -->
								<input type="button" class="panel_button" id="But" value="导出支付表(EXCEL)" name="But" onclick="expPayToExcel();">
								<input type="button" class="panel_button" id="But" value="未实现融资收益分配表(EXCEL)" name="But" onclick="expRZSYToExcel();">
								<!-- <input type="button" class="panel_button" id="But" value="本息摊还表(PDF)" name="But" onclick="expOwnPriceToExcel();"> -->
								<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}"><input type="button" class="panel_button" id="But" value="结清明细表(EXCEL)" name="But" onclick="expExpcel();"></c:if>
							</td>
							<td align="right" colspan="10"><page:pagingToolbar pagingInfo="${dw }"/></td>
						</tr>
						<tr>
							<td align="right" colspan="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3 ? 12 : 11}" style="height:24px; text-align:right;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;<img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;<img src="${ctx }/images/u614.gif">&nbsp;回购&nbsp;&nbsp;<img src="${ctx }/images/u620.gif">&nbsp;结清确认待分解&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table> 
				</div>
				</div>
			</div> 	
		</form>
		
<!------------弹出层:添加重车扣款账户信息------------>
<div style="display: none;" id="showCarPayApplyInfo" title="您当前的位置:添加重车扣款账户信息">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="carFormCarPay" id="carFormCarPay" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="collectionManage.createCarPayAccount" />
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showCarPayApplyInfoTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;">还款人:</td>
						<td style="text-align: left;"><input type="text" name="PAY_MAN" size="30" /></td>
						<input name="recp_id" size="30" type="hidden" />
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;">证件号码:</td>
						<td style="text-align: left;"><input type="text"  name="ID_CAR" size="30" /></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;">开户行:</td>
						<td style="text-align: left;"><input type="text"  name="BANK_NAME" size="30" /></td>
					</tr>	
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;">还款账号:</td>
						<td style="text-align: left;"><input type="text"  name="BANK_ACCOUNT" size="30" value="${writeBackDetails.BANK_ACCOUNT}"/></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="2"><input type="button" id="subUpload" value="确&nbsp;定" onclick="createCarPayApplyInfo()" class="panel_button" ></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>		
	</body>
</html>