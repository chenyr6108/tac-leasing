<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag });
				
			});
			//选择tab
			function selectCard(action,n) {
				$("#cardFlag").val(n);
				$("#__action").val("rentFinanceCommand."+action);
				$("#form1").submit();
			}
			
			
			function exportMonthReport() {
				window.parent.callBirt("birtReport/dailyReport/dailyMonthReport.rptdesign","xls",{"queryDate":$("#monthDate").val(),"companyCode":$("#companyCode").val()});
			}
			function exportCashReport() {
				window.parent.callBirt("birtReport/dailyReport/cashMonthReport.rptdesign","xls",{"queryDate":$("#monthDate").val()});
			}
			function exportFundReport() {
				window.parent.callBirt("birtReport/dailyReport/fundMonthReport.rptdesign","xls",{"queryDate":$("#monthDate").val()});
			}
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title></title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard('queryCashMonthReport',0)">现金销帐</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard('queryFundMonthReport',1)">暂收款销帐</a></li>
			<!-- <li style="width: 120px;text-align: center;"><a href="#tabs-3" onclick="selectCard('queryBalanceMonthReport',2)">暂收款余额变动表</a></li> -->
		</ul>
		<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
				<br>	    
					<table width="900" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center" >
				         <table>
				         	<tr>
				         		<td>
				         			查询时间：
				         		</td>
				         		<td>
				         			<select name="monthDate" id="monthDate">
				         				<c:forEach items="${monthDateList }" var="item">
					         					<option value="${item }" <c:if test="${item==monthDate }">selected="selected"</c:if>>
					         						${item }
					         					</option>
					         				</c:forEach>
				         			</select>
				         		</td>
				         		<td>查询内容：</td>
				         		<td colspan="4"><input id="content" name="content" value="${content }" style="width: 314px;"></td>
				         		<td>
								公司别：
								<select name="companyCode" id="companyCode">
									<option value="">全部</option>
									<c:forEach items="${companys}" var="item">
										<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
									</c:forEach>
								</select>			          
								</td>
				         	</tr>
				         	<tr>
				         		<td>
				         			<c:if test="${cardFlag==0 ||cardFlag==1 }">产品类别：</c:if>
				         		</td>
				         		<td>
				         			<c:if test="${cardFlag==0 ||cardFlag==1 }">
				         				<select id="productionType" name="productionType" style="width: 80px">
					         				    <option value="">
					         				    	--所有--
					         				    </option>
					         				<c:forEach items="${productionTypeList }" var="item">
					         					<option value="${item.CODE }" <c:if test="${item.CODE==productionType }">selected="selected"</c:if>>
					         						${item.FLAG }
					         					</option>
					         				</c:forEach>
					         			</select>
				         			</c:if>
				         		</td>
				         		<td><c:if test="${cardFlag==0 ||cardFlag==1 }">税费方案：</c:if></td>
				         		<td>
					         		<c:if test="${cardFlag==0 ||cardFlag==1 }">
					         			<select id="taxPlanCode" name="taxPlanCode" style="width: 80px">
					         				    <option value="">
					         				    	--所有--
					         				    </option>
					         				<c:forEach items="${taxPlanList }" var="item">
					         					<option value="${item.CODE }" <c:if test="${item.CODE==taxPlanCode }">selected="selected"</c:if>>
					         						${item.FLAG }
					         					</option>
					         				</c:forEach>
					         			</select>
					         		</c:if>
				         		</td>
				         		<td style="text-align: right">
				         			<c:if test="${cardFlag==0 ||cardFlag==1 }">办事处：</c:if> 
				         		</td>
				         		<td>
				         			<c:if test="${cardFlag==0 ||cardFlag==1 }">
					         			<select id="DEPT_ID" name="DEPT_ID" style="width: 80px">
										<option value="">--所有--</option>
										<c:forEach items="${deptList}" var="dept" varStatus="status">
											<option value="${dept.companyId}"
												<c:if test="${dept.companyId eq DEPT_ID}">selected='selected'</c:if>>${dept.companyName}</option>
										</c:forEach>
										</select>
									</c:if>
				         		</td>
				         		<td><c:if test="${cardFlag==0 ||cardFlag==1 }">分解金额：</c:if></td>
				         		<td>
				         			<c:if test="${cardFlag==0 ||cardFlag==1 }">
				         			<input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
				         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</c:if>
			         			</td>
				         	</tr>
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
		    	<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
					<tr>
						<td style="border-right: 0px;">
							<input class="panel_button" type="button" value="导出销帐月报表" onclick="exportMonthReport()" name="exportBtn">&nbsp;
							<%-- <c:if test="${cardFlag==0 }">
								<input class="panel_button" type="button" value="导出现金销帐" onclick="exportCashReport()" name="exportBtn">&nbsp;
							</c:if>
							<c:if test="${cardFlag==1 }">
								<input class="panel_button" type="button" value="导出暂收款销帐" onclick="exportFundReport()" name="exportBtn">&nbsp;
							</c:if> --%>
							<%-- <c:if test="${cardFlag==2 }">
								<input class="panel_button" type="button" value="导出暂收款余额变动" onclick="exportBalanceReport()" name="exportBtn">&nbsp;
							</c:if> --%>
						</td>
					</tr>
				</table>
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
							<div id="tabs-1">
								<%@ include file="/rent/report/decomposeReport/cashReport.jsp"%>
							</div>
							<div id="tabs-2">
								<%@ include file="/rent/report/decomposeReport/fundReport.jsp"%>
							</div>
							<%-- <div id="tabs-3">
								<%@ include file="/rent/report/decomposeReport/balanceReport.jsp"%>
							</div> --%>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>