<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/fillCustInfo.js"></script>
		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script src="${ctx }/decompose/js/selectCard.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
		</script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title>分解单管理--来款分解</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
// 关闭层
function closeDialogremarkdiv() {
alert(12);
//document.getElementById(remarkdiv).dialog("close");
	//$("#remarkdiv").dialog("close");
}			
			function decompostSub() {
				var flag = true ;
				var custName = $("#decomposeCustName").val() ;
				if(custName == null || custName == ''){
					alert("承租人名称不能为空") ;
					return false ;
				}
				var custCode = $("#cust_code").val() ;
				if(custCode == null || custCode == ""){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=decompose.ajaxCheckCustNameIsDecompose&cust_name='+custName,
						dataType:'json',
						async: false,
						success: function(dataBack){		
							CUST_CODE = dataBack.CUST_CODE;
							if(CUST_CODE == null || CUST_CODE == ''){
								alert("此承租人没有支付表！请重新输入或按空格键查询") ;
								$("#decomposeCustName").val('') ;
								flag = false ;
							} else {
								$("#cust_code").val(CUST_CODE) ;
								flag = true ;
							}
						},
						error:function(callback){
							alert("验证用户名错误!");
							flag = false ;
						}
					});
				}
				return flag ;
			}
			function settleSub(){
				recp_code
			}
		</script>
	</head>
	<body>
		<div id="tabs">
		<ul>
			
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">未分解</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">分解中</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">提交财务</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-4" onclick="selectCard(3)">财务确认</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-5" onclick="selectCard(4)">财务驳回</a></li>
			<li style="width: 0px;text-align: center; display:none;"><a href="#tabs-6" onclick="selectCard(5)"></a></li>
			<li style="width: 0px;text-align: center; display:none;"><a href="#tabs-7" onclick="selectCard(6)"></a></li>
			<!--  <li style="width: 100px;text-align: center;"><a href="#tabs-8" onclick="selectCard(7)">全部</a></li> -->
		</ul>
		<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
			<!--<input type="hidden" name="__action" id="__action" value="decompose.showAllIncomeInfo" />-->
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
				<br>	    
					<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr valign="center">
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center" >
				         <table>
			          <tr>
			            <td width="9%">起始日期:</td>
			            <td width="15%"><input type="text" value="${search_startdate}" name="search_startdate" id="datebegin" readonly="readonly" style="width:80px; height:18px;"></td>
			            <td width="12%">结束日期:</td>
			            <td width="15%" ><input type="text" value="${search_enddate}" name="search_enddate" id="dateend" readonly="readonly" style="width:80px; height:18px;"></td>
			           	<td>来款金额:</td>
			            <td>从
			              <input type="text" id="search_startmoney"
												value="${search_startmoney}" name="search_startmoney"
												style="width: 100px;"
												onkeypress="if (event.keyCode == 13) { selectincome() }" />
			              -
			              <input type="text" id="search_endmoney" value="${search_endmoney}"
												name="search_endmoney" style="width: 100px;"
												onkeypress="if (event.keyCode == 13) { selectincome() }" /></td>
			            
			          </tr>
			          <tr>
			          	<td width="8%">银行：</td>
			            <td colspan="5"><select name="search_bankname" id="search_bankname" onChange="showbankno()">
									<option value="全部">
										全部
									</option>
									<c:forEach items="${bankList }" var="bank"
										varStatus="status">
										<c:choose>
											<c:when test="${bank.BANK_NAME eq search_bankname}">
												<option value="${bank.BANK_NAME }" selected="selected">
													${bank.BANK_NAME }
												</option>
											</c:when>
											<c:otherwise>
												<option value="${bank.BANK_NAME }">
													${bank.BANK_NAME }
												</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
					            &nbsp;&nbsp;
					            <select name="search_bankno" id="search_bankno">
									<c:choose>
										<c:when test="${not empty search_bankno }">
											<option value="${search_bankno }" selected="selected">
												${search_bankno }
											</option>
										</c:when>
										<c:otherwise>
											<option value="全部">
												全部	
											</option>
										</c:otherwise>
									</c:choose>
								</select></td>
			          </tr>
			          <tr>
			            <td width="10%">查询内容:</td>
			            <td colspan="5">
			            <input type="text" name="search_content" id="search_content" value="${search_content }" style="width: 400px"
																onKeyPress="if (event.keyCode == 13) { selectincome() }">
			            </td>
			          </tr>
       			 </table>
       			</td>
		       <td width="100" class="ss_bigt" valign="center">
		       <a href="javaScript:void(0)" name="search" id="search" onclick="selectincome();" class="blue_button">搜 索</a></td>
		         <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
		      </tr>
		    </table>
		    <br>
				<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr ><c:if test="${cardFlag==0 or (empty cardFlag ) or (cardFlag==4 ) or (cardFlag == 1)}">
						<td>
							<input name="input3" class="ui-state-default ui-corner-all" type="button" value="制作分解单" class="button_keda"	onClick="showCustInfo();">
						</td>
						<td>
							<input name="input4" class="ui-state-default ui-corner-all" type="button" value="制作结清单" class="button_keda"	onClick="showRecpInfo();">
						</td>
						<td>
							<input name="input5" class="ui-state-default ui-corner-all" type="button" id="incomeAllClean1" value="自动分解所有来款"	onClick="incomeAllClean();">
						</td></c:if>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<div id="tabs-1">
					<%@ include file="/decompose/income_undecomposed.jsp"%>
				</div>
				
			<!-- endone -->
				<div id="tabs-2">
					<%@ include file="/decompose/income_decompose.jsp"%>
					
				</div>
				
			<!-- endone -->
				<div id="tabs-3">
					<%@ include file="/decompose/income_submit.jsp"%>
				</div>
				<!-- endone -->
				
				<div id="tabs-4">
					<%@ include file="/decompose/income_confirmation.jsp"%>
				</div>
				
				<!-- endone -->
				<div id="tabs-5">
					<%@ include file="/decompose/income_rebut.jsp"%>
				</div>

			<!-- endone -->
			<!--	<div id="tabs-8">	
					<%-- <%@  include file="/decompose/income_all.jsp"%> --%>
				</div>  -->
			
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
					<c:if test="${cardFlag==0 or (empty cardFlag ) or (cardFlag==4 ) or (orcardFlag == 1)}">
						<td>
							<input name="input3" class="ui-state-default ui-corner-all" type="button" value="制作分解单" class="button_keda"	onClick="showCustInfo()">
						</td>
						<td>
							<input name="input4" class="ui-state-default ui-corner-all" type="button" value="制作结清单" class="button_keda"	onClick="showRecpInfo();">
						</td>
						<td>
							<input name="input5" class="ui-state-default ui-corner-all" type="button" id="incomeAllClean2" value="自动分解所有来款"	onClick="incomeAllClean();">
						</td>
					 </c:if>
						<td><%@ include file="/common/pageControl.jsp"%></td>
					</tr>
				</table>
				<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td align="right">
								<img src="${ctx }/images/u617.gif">
								已撤销
								<img src="${ctx }/images/u620.gif">
								未处理
								<img src="${ctx }/images/u614.gif">
								分解中
								<img src="${ctx }/images/u608.gif" alt="已提交">
								已提交
								<img src="${ctx }/images/u611.gif" alt="">
								已确认
							</td>
						</tr>
					</tbody>
				</table>
				<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td align="right">
								<img src="${ctx }/images/u604.gif">
								来款金额不一致
								<img src="${ctx }/images/u622.gif">
								未分解
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				</div>
			</div>
		</form>
		</div>
		<!------------弹出层:选择承租人------------>
		<div style="display: none;" id="tanchu1" title="您当前的位置:租金分解">
		<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
			<input type="hidden" name="__action" id="__action" value="decompose.queryCustDecomposeInfo">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="22%">来款户名：</td>
					<td width="78%"><p id="decompose_opposingname"></p><input type="hidden" name="select_income_id" id="select_income_id" value=""><input type="hidden" name="opposing_date" id="opposing_date" value=""></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人名称：<input type="hidden" name="ficb_flag" id="ficb_flag" value="0"></td>
					<td><input type="text" name="decomposeCustName"	id="decomposeCustName" value="" style="width: 250;height: 30;" onchange="$('#cust_code').val('');"><input type="hidden" name="cust_code" id="cust_code" value=""/></td>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>友情提示：</td>
					<td>为避免承租人姓名重复的情况，<br>您选择承租人的时候必须点击提示弹出承租人信息。</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td align="center"><input type="checkbox" name="locked" id="locked" value="0">是否锁定：</td>
					<td>提示：慎重操作，自动分解或者手动分解后方可自动解锁！<br>提交财务为分解的最终状态，之前的操作不影响分解的正常进行。</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="return decompostSub() ;">
						<input type="button" value="关&nbsp;闭" onclick="closeDialog('tanchu1');" class="ui-state-default ui-corner-all">
					</td>
				</tr>
			</table>
			</div>
				</div>
				</div>
		</form>
		</div>
		<!------------弹出层:选择支付表------------>
		<div style="display: none;" id="recpDiv" title="您当前的位置:租金分解">
		<form id="recpForm" name="recpForm" action="../servlet/defaultDispatcher"	method="post">
			<input type="hidden" name="__action1" id="__action1" value="decompose.queryRecpNormalSettleInfo">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>支付表号：<input type="hidden" name="select_income_id1" id="select_income_id1" value=""></td>
					<td><input type="text" name="decomposeRecpCode"	id="decomposeRecpCode" value="" onchange="$('#recp_code').val('') ;" style="width: 250;height: 30;"><input type="hidden" name="cust_code1" id="cust_code1" value=""/><input type="hidden" name="recp_code" id="recp_code" value=""/></td>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>友情提示：</td>
					<td>为避免承租人姓名重复的情况，<br>您选择支付表的时候必须点击提示弹出支付表信息。</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<!-- <input type="button" value="正常结清" class="ui-state-default ui-corner-all" onclick="normalSettle()"> -->
						<input type="button" value="结清" class="ui-state-default ui-corner-all" onclick="aheadSettle()">
						<input type="button" value="关&nbsp;闭" onclick="closeDialog('recpDiv');" class="ui-state-default ui-corner-all">
					</td>
				</tr>
			</table>
			</div>
				</div>
				</div>
		</form>
		</div>
		<!------------弹出层:备注信息------------>
		<div style="display: none;" id="remarkdiv" title="您当前的位置:租金分解">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><strong><p id="remark_operate">添加备注</p></strong></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;">
									<input type="hidden" id="select_incomeid" name="select_incomeid" value="" />
									<textarea id="operate_remark" name="operate_remark" rows="10" cols="70" ></textarea>
								</td>
							</tr>
							<tr>
								<td id="button_flag" style="text-align: center;">
									<input type="button" value="确&nbsp;定" class="ui-state-default ui-corner-all" onclick="updateRemark()">
									<input type="button" value="关&nbsp;闭" onclick="closeDialogremarkdiv();" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="progressbar" style="display: none;background-color: white;text-align: center;" title="数据加载中... ...">
			<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
		</div>
	</body>
</html>