<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			function openDialog(recpId,flag) {
				
				$("p").html("");
				$("textarea").val("");
				
				if(flag==1) {//正常结清
					$("#progressbar").dialog({
				    	closeOnEscape:false, modal:true, autoOpen:false,
				    	open:function(event,ui) {$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();},
					});
				    $("#progressbar").dialog("open");
				    
				    $("#recp_id").val(recpId);
				    //ajax后台取数据
				    $.ajax({
				        type: 'post',
				        url: '../servlet/defaultDispatcher',
				        data: '__action=rentFinanceCommand.getSettlementDetail&recpId='+recpId,
				        dataType: 'json',
				        success: function(data) {
				    		$("#progressbar").dialog("close");
				    		$("#lease_code").html(data.custInfo.LEASE_CODE);
				    		$("#cust_name").html(data.custInfo.CUST_NAME);
				    		$("#period_num").html(data.custInfo.PERIOD_NUM);
				    		$("#pay_period").html(data.custInfo.PAY_PERIOD);
				    		$("#pay_price").html(data.custInfo.PAY_PRICE);
				    		
				    		$("input[name=pay_price]").val(data.custInfo.PAY_PRICE);
				    		$("#should_period_num").val(data.custInfo.PERIOD_NUM);
				    		$("#pay_period_num").val(data.custInfo.PAY_PERIOD);
				    		
				    		$("#own_price").html(data.settlementPrice.OWN_PRICE);
				    		$("#ren_price").html(data.settlementPrice.REN_PRICE);
				    		$("#value_added_tax").html(data.settlementPrice.VALUE_ADDED_TAX);
				    		$("#law_fee").html(data.settlementPrice.LAW_FEE);
				    		$("#stay_fee").html(data.settlementPrice.STAY_FEE);
				    		$("#other_fee").html(data.settlementPrice.OTHER_FEE);
				    		$("#fine").html(data.settlementPrice.FINE);
				    		var total_fee = parseFloat(data.settlementPrice.OWN_PRICE.replace(",",""))+
						    				   parseFloat(data.settlementPrice.REN_PRICE.replace(",",""))+
						    				   parseFloat(data.settlementPrice.VALUE_ADDED_TAX.replace(",",""))+
						    				   parseFloat(data.settlementPrice.LAW_FEE.replace(",",""))+
						    				   parseFloat(data.settlementPrice.OTHER_FEE.replace(",",""))+
						    				   parseFloat(data.settlementPrice.FINE.replace(",",""))+
						    				   parseFloat(data.settlementPrice.STAY_FEE.replace(",",""));
				    		$("#total_fee").html(new Number(total_fee).toFixed(2));
				    		
				    		$("input[name='should_own_price']").val(data.settlementPrice.OWN_PRICE.replace(",",""));
				    		$("input[name='should_ren_price']").val(data.settlementPrice.REN_PRICE.replace(",",""));
				    		$("input[name='should_value_added_tax']").val(data.settlementPrice.VALUE_ADDED_TAX.replace(",",""));
				    		$("input[name='should_law_fee']").val(data.settlementPrice.LAW_FEE.replace(",",""));
				    		$("input[name='should_stay_fee']").val(data.settlementPrice.STAY_FEE.replace(",",""));
				    		$("input[name='should_other_fee']").val(data.settlementPrice.OTHER_FEE.replace(",",""));
				    		$("input[name='should_fine']").val(data.settlementPrice.FINE.replace(",",""));
				    		var should_total_fee = parseFloat(data.settlementPrice.OWN_PRICE.replace(",",""))+
													parseFloat(data.settlementPrice.REN_PRICE.replace(",",""))+
													parseFloat(data.settlementPrice.VALUE_ADDED_TAX.replace(",",""))+
													parseFloat(data.settlementPrice.LAW_FEE.replace(",",""))+
													parseFloat(data.settlementPrice.OTHER_FEE.replace(",",""))+
													parseFloat(data.settlementPrice.FINE.replace(",",""))+
													parseFloat(data.settlementPrice.STAY_FEE.replace(",",""));
				    		$("input[name='should_total_fee']").val(new Number(should_total_fee).toFixed(2));
				    		
				    		$("input[name='pay_own_price']").val(data.settlementPrice.OWN_PRICE);
				    		$("input[name='pay_ren_price']").val(data.settlementPrice.REN_PRICE);
				    		$("input[name='pay_value_added_tax']").val(data.settlementPrice.VALUE_ADDED_TAX);
				    		$("input[name='pay_law_fee']").val(data.settlementPrice.LAW_FEE);
				    		$("input[name='pay_stay_fee']").val(data.settlementPrice.STAY_FEE);
				    		$("input[name='pay_other_fee']").val(data.settlementPrice.OTHER_FEE);
				    		$("input[name='pay_fine']").val(data.settlementPrice.FINE);
				    		var pay_total_fee = parseFloat(data.settlementPrice.OWN_PRICE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.REN_PRICE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.VALUE_ADDED_TAX.replace(",",""))+
							    				   parseFloat(data.settlementPrice.LAW_FEE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.OTHER_FEE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.FINE.replace(",",""))+
							    				   parseFloat(data.settlementPrice.STAY_FEE.replace(",",""));
				    		$("input[name='pay_total_fee']").val(new Number(pay_total_fee).toFixed(2));
				        },
				        error: function(data) {
							alert("网络错误,请稍后重试!");
							$("#progressbar").dialog("close");
							return;
						}
				    });
				    
					$("#applySettlementDiv").dialog({
						position:['center',50], hide:'slide', show:'slide',
						modal:true,
						autoOpen:false,
						width:650
					});
					$(".ui-dialog-titlebar-close").hide();
					$("#applySettlementDiv").dialog('open');
				} else {//提前结清
					alert("提前结清功能还未上线");
				}
			}
					
			function closeDialog(id) {
				$("#"+id).dialog("close");
			}
			
			function controlCheckBox(flag) {
				if(flag==1) {
					if($("#normal_settlement").attr("checked")) {
						$("#advance_settlement").attr("checked",false);
						$("#process_settlement").attr("checked",false);
					}
				} else if(flag==2) {
					if($("#advance_settlement").attr("checked")) {
						$("#normal_settlement").attr("checked",false);
						$("#process_settlement").attr("checked",false);
					}
				} else {
					if($("#process_settlement").attr("checked")) {
						$("#normal_settlement").attr("checked",false);
						$("#advance_settlement").attr("checked",false);
					}
				}
			}
			
			function replaceSymbol(obj) {
				obj.value=obj.value.replace("￥","").replace(",","");
				obj.select();
			}
			
			function clearNoNum(obj) {
				//先把非数字的都替换掉，除了数字和.
				obj.value = obj.value.replace(/[^\d.]/g,"");
				//必须保证第一个为数字而不是.		
				obj.value = obj.value.replace(/^\./g,"");		
				//保证只有出现一个.而没有多个.		
				obj.value = obj.value.replace(/\.{2,}/g,".");		
				//保证.只出现一次，而不能出现两次以上		
				obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");		
			}
			
			function calPrice(id, ob) {
				//$(ob).val(Math.round($(ob).val()*100)/100);
				$(ob).val(new Number($(ob).val()).toFixed(2));
				var diff = new Number($("input[name=pay_"+id+"]").val() - $("#"+id).html().replace(",","")).toFixed(2);
				if(diff==0){
					$("#diff_"+id).css("color", "black");
				} else {
					$("#diff_"+id).css("color", "red");
				}
				$("#diff_"+id).html(diff);
				
				$("input[name='pay_total_fee']").val(0);
				var totalFee=0;
				$("input[name^=pay_]").each(function() {
					if($(this).attr("name")!='pay_period_num'&&$(this).attr("name")!='pay_price') {
						totalFee=totalFee+parseFloat($(this).val().replace(",",""));
					}
				});
				$("input[name='pay_total_fee']").val(new Number(totalFee).toFixed(2));
				var diffTotal = new Number(totalFee - $("#total_fee").html().replace(",","")).toFixed(2);
				if(diffTotal==0){
					$("#diff_total_fee").css("color", "black");
				} else {
					$("#diff_total_fee").css("color", "red");
				}
				$("#diff_total_fee").html(diffTotal);
			}
			
			function commitSalesManager() {
				if($("#remarkMsg").val().trim() == ''){
					alert("请填写备注信息！");
					$("#remarkMsg").focus();
					return;
				}
				//检查重复提交
				$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=rentFinanceCommand.checkDuplicateCommit&recpId='+$("#recp_id").val(),
						dataType:'json',
						success:function(flag) {
							if(flag) {
								alert("请误重复提交!请重新打开结清申请页面");
								return;
							} else {
								$.ajax({
									type:"post",
									url:'../servlet/defaultDispatcher',
									data:'__action=rentFinanceCommand.checkPendingData&recpId='+$("#recp_id").val(),
									dataType:'json',
									success:function(flag) {//检查租金分解中是否有待确认的
										if(flag) {
											alert("请联系业管处理,此案件在租金分解中,暂不能申请结清");
											$("#applySettlementDiv").dialog("close");
											return;
										} else {
											$("input[name^=pay_]").each(function() {
												$(this).val($(this).val().replace("￥","").replace(",",""));
											});
											$("#commitBtn").attr("disabled",true);
											$("#form2").submit();
										}
									}
								});
							}
						}
					});
			}
			
			function expand(iddiv,recpId){
		        $("#"+iddiv).toggle(function() {
		            $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.getSettlementHistoryByRecpId&recpId="+recpId);
		        });
			}
		</script>
	</head>
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryContractList" />
				<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
			   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;结清申请</span>
			   	</div>
			   	<br>
			   	<table width="900" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8" >&nbsp;</td>
						<td width="60" class="ss_o" >&nbsp;</td>
						<td class="ss_t" >
					         <table>
					         	<tr>
					         		<td style="text-align: right">查询内容:</td>
					         		<td colspan="4"><input id="content" name="content" value="${content }" style="width: 300px;"></td>
					         	</tr>
					         	<tr>
					         		<td>&nbsp;&nbsp;支付表状态:</td>
					         		<td>
						         		<select name="recp_status">
											<option value="-1" <c:if test="${recp_status eq -1}">selected='selected'</c:if>>
												全部
											</option>
											<option value="0" <c:if test="${recp_status eq 0}">selected='selected'</c:if>>
												正常
											</option>
											<option value="1" <c:if test="${recp_status eq 1}">selected='selected'</c:if>>
												正常结清
											</option>
											<option value="3" <c:if test="${recp_status eq 3}">selected='selected'</c:if>>
												提前结清
											</option>
										</select>
					         		</td>
					         		<td style="vertical-align: middle;">&nbsp;&nbsp;
					         			&nbsp;&nbsp;<input type="checkbox" id="normal_settlement" name="normal_settlement" value="1" <c:if test="${normal_settlement eq 1}">checked='checked'</c:if> style="vertical-align: middle;cursor: pointer;" onclick="controlCheckBox(1)">
					         			&nbsp;可申请正常结清案件
				         			</td>
				         			<%-- <td style="vertical-align: middle;">&nbsp;&nbsp;
					         			&nbsp;&nbsp;<input type="checkbox" id="advance_settlement" name="advance_settlement" value="1" <c:if test="${advance_settlement eq 1}">checked='checked'</c:if> style="vertical-align: middle;cursor: pointer;" onclick="controlCheckBox(2)">
					         			&nbsp;可申请提前结清案件
				         			</td> --%>
				         			<td style="vertical-align: middle;">&nbsp;&nbsp;
					         			&nbsp;&nbsp;<input type="checkbox" id="process_settlement" name="process_settlement" value="1" <c:if test="${process_settlement eq 1}">checked='checked'</c:if> style="vertical-align: middle;cursor: pointer;" onclick="controlCheckBox(3)">
					         			&nbsp;结清申请流程中
				         			</td>
					         	</tr>
			       			 </table>
	   					</td>
	   					<td width="55" class="ss_th" valign="top" >&nbsp;</td>
			            <td width="20%">
			       		 	<a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
				      </tr>
			    </table>
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
								</tr>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									<tr class="ui-jqgrid-labels">
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											序号
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px">
											状态(点击查看)
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="RECP_CODE">支付表号</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户名称</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="NAME">业务员</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="UP_NAME">业务主管</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="HIRE_DATE">起租日</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="SHOULD_PRICE">应付租金</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="REDUCE_OWN_PRICE">已销租金</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											<page:pagingSort pagingInfo="${dw }" orderBy="INCOME_DATE">最后期来款时间</page:pagingSort>
										</th>
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											操作
										</th>
									</tr>
									<c:forEach items="${dw.resultList }" var="item" varStatus="status">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td style="text-align: center">
													${status.count }
												</td>
												<td style="text-align: center;cursor: pointer;" onClick="expand('pactAffix${item.RECP_ID}',${item.RECP_ID});">
													<%-- ${item.RECP_STATUS_DESCR } --%>
													<c:if test="${item.RECP_STATUS==0 }"><img src="${ctx }/images/u608.gif" alt="正常"/></c:if>
													<c:if test="${item.RECP_STATUS==1 }"><img src="${ctx }/images/u622.gif" alt="正常结清"/></c:if>
													<c:if test="${item.RECP_STATUS==3 }"><img src="${ctx }/images/u611.gif" alt="提前结清"/></c:if>
												</td>
												<td style="text-align: center">
													${item.CREDIT_RUNCODE }&nbsp;
												</td>
												<td style="text-align: center">
													<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&RECP_ID=${item.RECP_ID}&FLAG=1'" href="javascript:void(0);">${item.RECP_CODE }</a>&nbsp;
												</td>
												<td style="text-align: center">
													${item.CUST_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.UP_NAME }&nbsp;
												</td>
												<td style="text-align: center">
													${item.HIRE_DATE }&nbsp;
												</td>
												<td style="text-align: right">
													￥<fmt:formatNumber pattern="#,##0.00" value="${item.SHOULD_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: right">
													￥<fmt:formatNumber pattern="#,##0.00" value="${empty item.REDUCE_OWN_PRICE?0:item.REDUCE_OWN_PRICE }"/>&nbsp;
												</td>
												<td style="text-align: center">
													${item.INCOME_DATE }&nbsp;
												</td>
												<td style="text-align: center;color:gray">
												<c:if test="${item.DISPLAY_COMMIT_LINK eq 'Y' }">
													<c:if test="${item.RECP_STATUS==0 }">
														<c:if test="${item.REDUCE_OWN_PRICE>=item.SHOULD_PRICE }">
															<a href="javascript:void(0)" onclick="openDialog('${item.RECP_ID}',1)">申请正常结清</a>
														</c:if>
														<c:if test="${item.REDUCE_OWN_PRICE<item.SHOULD_PRICE or empty item.REDUCE_OWN_PRICE }">申请正常结清</c:if>
													</c:if>
													<c:if test="${item.RECP_STATUS!=0 }">
														申请正常结清
													</c:if>
													<%-- |
													<c:if test="${item.RECP_STATUS==0 }">
														<c:if test="${item.REDUCE_OWN_PRICE<item.SHOULD_PRICE or empty item.REDUCE_OWN_PRICE }">
															<a href="javascript:void(0)" onclick="openDialog('${item.RECP_ID}',2)">申请提前结清</a>
														</c:if>
														<c:if test="${item.REDUCE_OWN_PRICE>=item.SHOULD_PRICE  }">
															申请提前结清
														</c:if>
													</c:if>
													<c:if test="${item.RECP_STATUS!=0 }">
														申请提前结清
													</c:if> --%>
												</c:if>
												<c:if test="${item.DISPLAY_COMMIT_LINK eq 'N' }">
													申请正常结清
													<!-- |
													申请提前结清 -->
												</c:if>
													&nbsp;
												</td>
											</tr>
											<tr>
												<td style="text-align: center;" colspan="11" align="center">
													<div id="pactAffix${item.RECP_ID}" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 86%">
														<img src="${ctx }/images/029.gif" style="vertical-align: middle;">
													</div>
												</td>
											</tr>
									</c:forEach>
							</table>
							<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
								<tr>
									<td><page:pagingToolbar pagingInfo="${dw }"/></td>
								</tr>
								<tr>
									<td style="text-align: right;"><img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;<img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
			</form>
		</div>
		<font color="red">*</font>申请正常结清的条件：此合同的<font color="red">每一期租金</font>销完后方可申请正常结清
		
		<div id="progressbar" style="display: none;background-color: white;text-align: center;" title="数据加载中... ...">
			<br><br>
			<img src="${ctx }/images/029.gif" style="vertical-align: middle;">
		</div>
		
		<div style="display: none;" title="申请正常结清" id="applySettlementDiv">
			<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
				<input type="hidden" name="__action" id="__action" value="rentFinanceCommand.commitSettlement">
				<input type="hidden" name="recp_id" id="recp_id" value="">
				<input type="hidden" name="should_period_num" id="should_period_num" value="">
				<input type="hidden" name="pay_period_num" id="pay_period_num" value="">
				<input type="hidden" name="pay_price" value="">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 600px;margin: auto;">
		           <div class="zc_grid_body jqgrowleft" style="width: 600px;">
					  <div class="ui-state-default ui-jqgrid-hdiv" style="width: 600px;">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-th-ltr zc_grid_head">
								<th colspan="5" style="text-align: left">
									基本信息
								</th>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">合同号</td>
								<td style="text-align: center;">客户名称</td>
								<td style="text-align: center;">合同租赁期数</td>
								<td style="text-align: center;">合同已缴期数</td>
								<td style="text-align: center;">合同已缴租金</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><p id="lease_code"></p></td>
								<td style="text-align: center;"><p id="cust_name"></p></td>
								<td style="text-align: right;"><p id="period_num"></p></td>
								<td style="text-align: right;"><p id="pay_period"></p></td>
								<td style="text-align: right;"><p id="pay_price"></p></td>
							</tr>
							<tr class="ui-state-default ui-th-ltr zc_grid_head">
								<th colspan="5" style="text-align: left">
									结清明细
								</th>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;width: 50px;">试算项目</td>
								<td style="text-align: center;width: 80px;">应付金额</td>
								<td style="text-align: center;width: 100px;">申请还款金额</td>
								<td style="text-align: center;width: 100px;">差额</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">本金:</td>
								<td style="text-align: right;"><p id="own_price"></p></td>
								<td style="text-align: center;"><input name="should_own_price" type="hidden"><input name="pay_own_price" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('own_price', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_own_price"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">利息:</td>
								<td style="text-align: right;"><p id="ren_price"></p></td>
								<td style="text-align: center;"><input name="should_ren_price" type="hidden"><input name="pay_ren_price" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('ren_price', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_ren_price"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">增值税:</td>
								<td style="text-align: right;"><p id="value_added_tax"></p></td>
								<td style="text-align: center;"><input name="should_value_added_tax" type="hidden"><input name="pay_value_added_tax" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('value_added_tax', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_value_added_tax"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">罚息:</td>
								<td style="text-align: right;"><p id="fine"></p></td>
								<td style="text-align: center;"><input name="should_fine" type="hidden"><input name="pay_fine" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('fine', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_fine"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">法务费用:</td>
								<td style="text-align: right;"><p id="law_fee"></p></td>
								<td style="text-align: center;"><input name="should_law_fee" type="hidden"><input name="pay_law_fee" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('law_fee', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_law_fee"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">期满购买金:</td>
								<td style="text-align: right;"><p id="stay_fee"></p></td>
								<td style="text-align: center;"><input name="should_stay_fee" type="hidden"><input name="pay_stay_fee" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('stay_fee', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_stay_fee"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">其他费用:</td>
								<td style="text-align: right;"><p id="other_fee"></p></td>
								<td style="text-align: center;"><input name="should_other_fee" type="hidden"><input name="pay_other_fee" style="text-align: right;width: 90px;" onfocus="replaceSymbol(this)" onkeyup="clearNoNum(this)" onblur="calPrice('other_fee', this)" maxlength="11"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_other_fee"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">合计:</td>
								<td style="text-align: right;"><p id="total_fee"></p></td>
								<td style="text-align: center;"><input name="should_total_fee" type="hidden"><input name="pay_total_fee" style="text-align: right;width: 90px;" readonly="readonly"></td>
								<td style="text-align: right;width: 100px;"><p id="diff_total_fee"></p></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;">备注:</td>
								<td style="text-align: center;" colspan="3"><textarea id="remarkMsg" rows="10" cols="60" maxlength="200" name="remark"></textarea></td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">
									<input type="button" value="提交财务检核" onclick="commitSalesManager()" class="ui-state-default ui-corner-all" id="commitBtn">
									&nbsp;&nbsp;
									<input type="button" value="关&nbsp;闭" onclick="closeDialog('applySettlementDiv')" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
						<span style="color:red;">*</span>所有金额单位均为RMB
				     </div>
				  </div>
				</div>
			</form>
		</div>
	</body>
</html>