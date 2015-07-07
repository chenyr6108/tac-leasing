<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/decompose/js/fillCustInfo.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript">
			//显示客户的autocomplete控件
			var options={minChars:1,
						      max:20, 
				        mustMatch:false, 
				    matchContains:true, 
				       formatItem:function(row, i, max) {
							var rs=row.CUSTINFO;
							if(row.CUSTINFO!=null&&row.CUSTINFO.length>0) {
								rs="名称："+row.CUST_NAME+"<br>类别："+row.CUST_TYPE+"<br>省份："+row.ADD_NAME+"<br>证件："+row.TYPE_NO;
							}
							return rs;
						}, formatMatch:function(row, i, max) {
							return " 名称："+row.CUST_NAME+"<br>类别："+row.CUST_TYPE+"<br>省份："+row.ADD_NAME+"<br>证件："+row.TYPE_NO;
						}, formatResult:function(row) {
							return row.CUSTINFO;
						}};
			function initAutoComplete(data) {
				dataList=data.custList;
				$("#cust_name").autocomplete(dataList,options);
				$("#cust_name").result(function(event, data, formatted) {
					if(data!=null) {
						$("#cust_code").val(data.CUST_CODE);
					}
				});
				$("#decomposeDiv").dialog({
					modal:true,
					autoOpen:false,
					width:450
				});
				$("#decomposeDiv").dialog('open');
			}
			
			function initAutoCompleteSettlement(data) {
				dataList=data.custList;
				$("#cust_name_").autocomplete(dataList,options);
				$("#cust_name_").result(function(event, data, formatted) {
					if(data!=null) {
						$("#cust_code_").val(data.CUST_CODE);
						$("#recp_id_").val(data.RECP_ID);
					}
				});
				
				$("#settlementDiv").dialog({
					modal:true,
					autoOpen:false,
					width:450
				});
				$("#settlementDiv").dialog('open');
			}
			
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag });
				if($("#menu").val()=='confirmDecompose') {
					$("#tabs").tabs('disable',0);
					$("#tabs").tabs('disable',1);
				}
				$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
				$("#toDate").datepicker($.datepicker.regional['zh-CN']);
			});
			
			//选择tab
			function selectCard(action,n) {
				$("#cardFlag").val(n);
				$("#__action").val("rentFinanceCommand."+action);
				$("#form1").submit();
			}
			
			//显示租金分解div
			function showDecomposeDiv() {
				var chk_value=[];   
			    $('input[name="key"]:checked').each(function() {   
			   		chk_value.push($(this).val());   
			  	});   
			  	if(chk_value.length==0) {
			  		alert("请选择一条记录!");
			  		return;
			  	}
			  	$("#income_name").html($("#income_name_"+chk_value[0]).val());
			  	$("#income_name_true").html($("#income_name_true_"+chk_value[0]).val());
			  	$("#income_id").val(chk_value[0]);
			  	$("#cust_name").val("");
			  	$("#cust_code").val("");
				$.ajax({type:"post",url:"../servlet/defaultDispatcher",data:"__action=rentFinanceCommand.queryCustInfo",dataType:"json",success:initAutoComplete});
			}
			
			//显示结清分解div
			function showSettlementDecomposeDiv() {
				var chk_value=[];   
			    $('input[name="key"]:checked').each(function() {   
			   		chk_value.push($(this).val());   
			  	});   
			  	if(chk_value.length==0) {
			  		alert("请选择一条记录.");
			  		return;
			  	}
			  	$("#income_name_").html($("#income_name_"+chk_value[0]).val());
			  	$("#income_name_true_").html($("#income_name_true_"+chk_value[0]).val());
			  	$("#income_id_").val(chk_value[0]);
			  	$("#cust_name_").val("");
			  	$("#cust_code_").val("");
				$.ajax({type:"post",url:"../servlet/defaultDispatcher",data:"__action=rentFinanceCommand.querySettlementCustInfo",dataType:"json",success:initAutoCompleteSettlement});
			}
			
			function closeDialog(id) {
				$("#"+id).dialog("close");
			}
			
			function showDecomposeList() {
				if($("#cust_name").val()==""&&$("#cust_code").val()=="") {
					alert("请选择需分解客户");
					return;
				} else if($("#cust_name").val()!=""&&$("#cust_code").val()=="") {
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=rentFinanceCommand.checkCustNameHasPayList&cust_name='+$("#cust_name").val(),
						dataType:'json',
						success:function(dataBack) {		
							if(dataBack.CUST_CODE==null||dataBack.CUST_CODE==''){
								alert("此客户没有支付表！请重新输入或按空格键查询") ;
								$("#cust_name").val('') ;
								return;
							} else {
								$("#cust_code").val(dataBack.CUST_CODE);
								$("#form2").submit();
							}
						}
					});
				} else {
					$("#form2").submit();
				}
			}
			function showDecomposeDetailList(incomeId,periodNum,recpId,decomposeStatus,menu) {
				location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.showDecomposeDetailList&incomeId="+incomeId+"&periodNum="+periodNum+"&recpId="+recpId+"&decomposeStatus="+decomposeStatus+"&menu="+menu
						+"&content="+$("#content").val()+"&fromMoney="+$("#fromMoney").val()+"&toMoney="+$("#toMoney").val()+"&fromDate="+$("#fromDate").val()+"&toDate="+$("#toDate").val();
			}
			
			function showCashFlow(incomeId,billId) {
				$.ajax({
			        type: 'post',
			        url: '../servlet/defaultDispatcher',
			        data: '__action=rentFinanceCommand.showCashFlow&incomeId='+incomeId,
			        dataType: 'json',
			        success: function(dataMap) {
			        	var html="";
			        	var cashFlow=dataMap.cashFlow;
						var loop=dataMap.cashFlow.length;
			
						html="<tr class=\"ui-jqgrid-labels\">"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">序号</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">合同号</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">客户名称</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">销帐类型</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">销帐金额</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">期数</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">分解类型</th>"+
						"</tr>";
						
						for(var i=0;i<loop;i++) {
							html+="<tr class='ui-widget-content jqgrow ui-row-ltr'>";
							html+="<td style='text-align:center'>"+(i+1)+"</td>";
							html+="<td style='text-align:center'>"+cashFlow[i].LEASE_CODE+"</td>";
							html+="<td style='text-align:center'>"+cashFlow[i].CUST_NAME+"</td>";
							html+="<td style='text-align:center'>"+cashFlow[i].FLAG+"</td>";
							html+="<td style='text-align:right'>￥"+cashFlow[i].DECOMPOSE_PRICE+"</td>";
							html+="<td style='text-align:right'>"+cashFlow[i].PERIOD_NUM+"</td>";
							html+="<td style='text-align:center'>"+cashFlow[i].DECOMPOSE_TYPE+"</td>";
							html+="</tr>";
						}
						html+="<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center' colspan='7'>";
						html+="<input type='button' value='关&nbsp;闭' onclick="+"$('#cashFlowDiv').dialog('close');"+" class='ui-state-default ui-corner-all'>";
						html+="</td></tr>";
						$("#cashFlowTable").html(html);
						
						var cashIncome=dataMap.cashIncome;
						html1="<tr class=\"ui-jqgrid-labels\">"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款时间</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款户名</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款金额</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">来款帐号</th>"+
						"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">收款帐号</th>"+
						"</tr>";
						
						html1+="<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
						"<td style='text-align:center'>"+cashIncome.INCOME_DATE+"</td>"+
						"<td style='text-align:center'>"+cashIncome.INCOME_NAME+"</td>"+
						"<td style='text-align:right'>￥"+cashIncome.INCOME_MONEY+"</td>"+
						"<td style='text-align:center'>"+cashIncome.INCOME_ACCOUNT+"</td>"+
						"<td style='text-align:center'>"+cashIncome.RECEIPT_ACCOUNT+"</td>"+
						"</tr>";
						
						$("#cashIncomeTable").html(html1);
			        },
			        error:function(callback) {
						alert("网络错误，请稍后重试！");
						return ;
					}
			    });
				
				$("#cashFlowDiv").dialog({
					modal:true,
					autoOpen:false,
					width:800,
					position:['center',150],
					show:'slide'
				});
				$("#cashFlowDiv").dialog('open');
			}
			
			function autoDecompose() {
			    if(!confirm("确认自动分解来款?")) {
					return;
				}
			    
			    $.ajax({
			        type: 'post',
			        url: '../servlet/defaultDispatcher',
			        data: '__action=rentFinanceCommand.checkCanBeAutoDecompose',
			        dataType: 'json',
			        success: function(flag) {
			        	if(flag) {
			        		$("#progressbar").dialog({
						    	closeOnEscape:false, modal:true, autoOpen:false,
						    	open:function(event,ui) {$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();},
							});
						    $("#progressbar").dialog("open");
						    $.ajax({
						        type: 'post',
						        url: '../servlet/defaultDispatcher',
						        data: '__action=rentFinanceCommand.autoDecompose',
						        dataType: 'json',
						        success: function(callback) {
						    	$("#progressbar").dialog("close");
						        	alert(callback.msg);
					              	$("#form1").submit();
						           
						        },
						        error:function(callback) {
									alert("网络错误，请稍后重试！");
									return ;
								}
						    });
			        	} else {
			        		alert("租金分解中有提交中或者财务待确认数据,请处理后再使用自动分解销帐功能");
			        	}
			        },
			        error:function(callback) {
						alert("网络错误，请稍后重试！");
						return ;
					}
			    });
			}
			
			function autoConfirm() {
				var chk_value=[];   
			    $('input[name="checkBox"]:checked').each(function() {   
			   		chk_value.push($(this).val());   
			  	});   
			  	if(chk_value.length==0) {
			  		alert("请选择一条记录.");
			  		return;
			  	}
			  	if(!confirm("确认通过所选分解单?")) {
			  		return;
			  	}
			  	$("#progressbar").dialog({
			    	closeOnEscape:false, modal:true, autoOpen:false,
			    	open:function(event,ui) {$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();},
				});
			    $("#progressbar").dialog("open");
			    
			  	$("input[type='button']").each(function() {
					$(this).attr("disabled",true);
				});
				$("#__action").val("rentFinanceCommand.autoConfirm");
				$("#form1").submit();
			}
			
			function showSettlementDecomposeList() {
				if($("#cust_name_").val()!=""&&$("#cust_code_").val()!="") {
					$("#form3").submit();
				} else {
					alert("请选择下拉提示客户");
				}
			}
			
			function expandUploadFile(incomeId) {	
			    $("#fileAffix"+incomeId).toggle(function() {
			        $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.showUploadFileList&incomeId="+incomeId);
			    });
			}
			function expandUploadFile2(incomeId) {	
			    $("#fileAffix_"+incomeId).toggle(function() {
			        $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.showUploadFileList&incomeId="+incomeId);
			    });
			}
		</script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title></title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" <c:if test='${menu eq "rentDecompose" }'>onclick="selectCard('queryUnDecomposeMoney',0)"</c:if>>未分解</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" <c:if test='${menu eq "rentDecompose" }'>onclick="selectCard('queryOnDecomposeMoney',1)"</c:if>>分解中</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard('queryCommitFinanceMoney',2)">提交财务</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-4" onclick="selectCard('queryFinanceConfirm',3)">财务确认</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-5" onclick="selectCard('queryFinanceReject',4)">财务驳回</a></li>
		</ul>
		<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
			<input type="hidden" id="menu" name="menu" value="${menu }" />
				<br>	    
					<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center">
				         <table>
				         	<tr>
				         		<td>来款时间:</td>
				         		<td><input id="fromDate" name="fromDate" value="${fromDate }" readonly="readonly" style="width: 80px;">-
				         			<input id="toDate" name="toDate" value="${toDate }" readonly="readonly" style="width: 80px;">
				         		</td>
				         		<td style="text-align: right;">来款金额:</td>
				         		<td><input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
				         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
			         			</td>
				         	</tr>
				         	<tr>
				         		<td>查询内容:</td>
				         		<td><input id="content" name="content" value="${content }" style="width: 169px;"></td>
				         		<c:if test="${cardFlag==0 }">
				         		<td style="text-align: right;">是否有水单:</td>
			         			<td>
			         				<select name="hasFile" style="width: 60px;">
			         					<option value="0" <c:if test="${hasFile eq 0 }">selected="selected"</c:if>>
			         						全部
			         					</option>
			         					<option value="1" <c:if test="${hasFile eq 1 }">selected="selected"</c:if>>
			         						是
			         					</option>
			         					<option value="-1" <c:if test="${hasFile eq -1 }">selected="selected"</c:if>>
			         						否
			         					</option>
			         				</select>
			         			</td>
			         			</c:if>
				         		<c:if test="${cardFlag==2 or cardFlag==3 or cardFlag==4 }">
				         		<td style="text-align: right">类型:</td>
				         		<td>
				         			<select name="type">
				         				<option value="0" <c:if test="${type eq '0' }">selected='selected'</c:if>>全部</option>
				         				<option value="1" <c:if test="${type eq '1' }">selected='selected'</c:if>>手动分解</option>
				         				<option value="2" <c:if test="${type eq '2' }">selected='selected'</c:if>>自动分解</option>
				         				<option value="3" <c:if test="${type eq '3' }">selected='selected'</c:if>>红冲</option>
				         			</select>
				         		</td>
				         		</c:if>
				         	</tr>
				         	<c:if test="${cardFlag==2 or cardFlag==3 or cardFlag==4 }">
					         	<tr>
					         		<td style="text-align: right">来源:</td>
					         		<td>
						         		<select name="from">
						         			<option value="-1" <c:if test="${from eq '-1' }">selected='selected'</c:if>>全部</option>
						         			<option value="0" <c:if test="${from eq '0' }">selected='selected'</c:if>>租金分解</option>
						         			<option value="1" <c:if test="${from eq '1' }">selected='selected'</c:if>>结清分解</option>
						         		</select>
					         		</td>
					         		<td style="text-align: right;">
					         			公司别:
					         		</td>
					         		<td>
					         			<select name="companyCode" id="companyCode">
					         				<option value="">全部</option>
					         				<option value="1" <c:if test="${companyCode eq '1' }">selected='selected'</c:if>>裕融</option>
					         				<option value="2" <c:if test="${companyCode eq '2' }">selected='selected'</c:if>>裕国</option>
					         			</select>
					         		</td>
					         	</tr>
				         	</c:if>
		       			 </table>
       					</td>
			            <td width="100" class="ss_bigt">
			       		 <a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
		         	    <td width="13" class="ss_bigth" valign="top">&nbsp;
		         	    </td>
				      </tr>
				    </table>
		    	<br>
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-right: 0px;"><c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="制作分解单" onclick="showDecomposeDiv()">&nbsp;</c:if>
								<c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="制作结清分解单" onclick="showSettlementDecomposeDiv()">&nbsp;</c:if>
								<c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="自动分解" onclick="autoDecompose()">&nbsp;</c:if>
								<c:if test="${menu eq 'confirmDecompose' && cardFlag==2 }"><input class="ui-state-default ui-corner-all" type="button" value="确认通过所选分解单" class="button_keda" onclick="autoConfirm()"></c:if></td>
								<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
							</tr>
						</table>
							<div id="tabs-1">
								<%@ include file="/rent/finance/rentDecompose/unDecomposeMoney.jsp"%>
							</div>
							<div id="tabs-2">
								<%@ include file="/rent/finance/rentDecompose/onDecomposeMoney.jsp"%>
							</div>
							<div id="tabs-3">
								<%@ include file="/rent/finance/rentDecompose/commitDecomposeMoney.jsp"%>
							</div>
							<div id="tabs-4">
								<%@ include file="/rent/finance/rentDecompose/confirmDecomposeMoney.jsp"%>
							</div>
							<div id="tabs-5">
								<%@ include file="/rent/finance/rentDecompose/rejectDecomposeMoney.jsp"%>
							</div>
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-right: 0px;"><c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="制作分解单" onclick="showDecomposeDiv()">&nbsp;</c:if>
								<c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="制作结清分解单" onclick="showSettlementDecomposeDiv()">&nbsp;</c:if>
								<c:if test="${cardFlag==0 }"><input class="ui-state-default ui-corner-all" type="button" value="自动分解" onclick="autoDecompose()">&nbsp;</c:if>
								<c:if test="${menu eq 'confirmDecompose' && cardFlag==2 }"><input class="ui-state-default ui-corner-all" type="button" value="确认通过所选分解单" class="button_keda" onclick="autoConfirm()"></c:if></td>
								<td><page:pagingToolbar pagingInfo="${dw }"/></td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div style="display: none;" title="制作分解单" id="decomposeDiv">
			<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
				<input type="hidden" name="__action" id="__action" value="rentFinanceCommand.getDecomposeList">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		           <div class="zc_grid_body jqgrowleft">
					  <div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="22%">来款户名：</td>
								<td width="78%"><p id="income_name"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="22%">系统自动匹配之客户名称：</td>
								<td width="78%"><p id="income_name_true" onclick="javascript:$('#cust_name').val($('#income_name_true').html())" style="color: #5094CA;cursor: pointer;"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>客户名称：</td>
								<td>
									<input type="text" name="cust_name"	id="cust_name" value="" style="width: 250;height: 30;" onchange="$('#cust_code').val('');">
									<input type="hidden" name="cust_code" id="cust_code" value=""/>
									<input type="hidden" name="income_id" id="income_id" value=""/>
								</td>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="showDecomposeList()">
									<input type="button" value="关&nbsp;闭" onclick="closeDialog('decomposeDiv');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
				     </div>
				  </div>
				</div>
			</form>
		</div>
		
		<div style="display: none;" title="制作结清分解单" id="settlementDiv">
			<form id="form3" name="form3" action="../servlet/defaultDispatcher"	method="post">
				<input type="hidden" name="__action" id="__action_" value="rentFinanceCommand.showSettlementList">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		           <div class="zc_grid_body jqgrowleft">
					  <div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="22%">来款户名：</td>
								<td width="78%"><p id="income_name_"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="22%">系统自动匹配之客户名称：</td>
								<td width="78%"><p id="income_name_true_" style="color: #5094CA;cursor: pointer;"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>客户名称：</td>
								<td>
									<input type="text" name="cust_name"	id="cust_name_" value="" style="width: 250;height: 30;" onchange="$('#cust_code_').val('');">
									<input type="hidden" name="cust_code" id="cust_code_" value=""/>
									<input type="hidden" name="recpId" id="recp_id_" value=""/>
									<input type="hidden" name="income_id" id="income_id_" value=""/>
								</td>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="showSettlementDecomposeList()">
									<input type="button" value="关&nbsp;闭" onclick="closeDialog('settlementDiv');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
				     </div>
				  </div>
				</div>
			</form>
		</div>
		
		<div id="progressbar" style="display: none;background-color: white;text-align: center;" title="数据加载中... ...">
			<br><br>
			<img src="${ctx }/images/029.gif" style="vertical-align: middle;">
		</div>
		<c:if test="${!empty msg }">
		<script>
			$(function() {
				alert("自动确认通过完成!");
			});
		</script>
		</c:if>
	</body>
</html>