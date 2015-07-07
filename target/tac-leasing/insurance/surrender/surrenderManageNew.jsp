<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>退保管理</title>
  </head>
  <script type="text/javascript">
	$(function (){
		$("#start_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#start_date_to").datepicker($.datepicker.regional['zh-CN']);
		$("#end_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#end_date_to").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function showSurrender(e, id){
		$(e).hide();
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.showSurrender&insuId=" + id + "&action_model=show";
	}
	function updateSurrender(e, id){
		$(e).hide();
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.showSurrender&insuId=" + id + "&action_model=update";
	}
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="insuranceCommand.getSurrender" />
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;退保管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
				        	
				        	<tr>
				        		<td>保险开始日期：从</td>
				        		<td>
				        			<input type="text" name="start_date_from" id="start_date_from" value="${start_date_from }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td align="center">~</td>
				        		<td>
				        			<input type="text" name="start_date_to" id="start_date_to" value="${start_date_to }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td>保险终止日期：从</td>
				        		<td>
				        			<input type="text" name="end_date_from" id="end_date_from" value="${end_date_from }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td align="center">~</td>
				        		<td>
				        			<input type="text" name="end_date_to" id="end_date_to" value="${end_date_to }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>保险公司:</td>
				        		<td>
				        			<select name="incp_id" style="width:100px; height:20px;">
				        				<option value="">请选择</option>
				        				<c:forEach items="${company}" var="item" > 
				        					<option value="${item.INCP_ID }" <c:if test="${item.INCP_ID eq incp_id }">selected</c:if>>
				        						${item.SHORT_NAME }
				        					</option>
				        				</c:forEach>
				        			</select>
				        		</td>
				        		<td>退保状态:</td>
				        		<td colspan="5">
				        			<select name="surrenderStatus" style="width:100px; height:20px;">
				        				<option value="">全部</option>
				        				<option value="0" <c:if test="${surrenderStatus eq '0' }">selected</c:if>>待退保</option>
				        				<option value="10" <c:if test="${surrenderStatus eq '10' }">selected</c:if>>已退保</option>
				        			</select>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>查询内容:</td>
				        		<td colspan="7">
				        			<input type="text" name="content" value="${content }" style="width:260px; height:20px;">
				        		</td>
				        	</tr>
				        </table>
		 		</td>
				<td style="width:50px;" class="ss_bigt" valign="middle">
					<a href="javaScript:void(0)" id="search_but" onclick="$('#form1').submit();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
	</div>
	<br/>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr>
						<!-- <td>
							<input type="button" value="模拟保险入口" onclick="testStartInsurance();" style="width: 100px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟投保" onclick="testInsurance();" style="width: 80px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟续保" onclick="testRenewalInsurance();" style="width: 80px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟结清待退保" onclick="testWaitingForSurrender();" style="width: 100px; height: 25px;"/>
						</td> -->
						<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
					</tr>
				</table>
				<table cellspacing="1" class="grid_table">
					<tr>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStatus">状态</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="creditRuncode">案件号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="custName">客户名称</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="leaseCode">合同号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="incpName">保险公司</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuCode">保单号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStartDate">开始日期</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuEndDate">终止日期</page:pagingSort>
						</th>
     				    <th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuPrice">保费</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStartDate">退保日期</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStartDate">退保金额</page:pagingSort>
						</th>
						<th style="text-align: center;" >
							操作
						</th>

					</tr>
					<tbody>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">
					<tr id="trForColor" 
						<c:if test="${item.exceptionStatus > 0 }">style="color: red"</c:if>>
					    <td style='text-align: center;height: 25px;'>
					    	<c:choose>
					    		<c:when test="${item.status eq 1}"><img src="${ctx }/images/u617.gif" alt="作废"></c:when>
					    		<c:otherwise>
					    			<c:choose>
					    				<c:when test="${item.surrenderStatus eq 0 }"><img src="${ctx }/images/u608.gif" alt="待退保"></c:when>
					    				<c:when	test="${item.surrenderStatus eq 10 }"><img src="${ctx }/images/u611.gif" alt="已退保"></c:when>
						    		</c:choose>
						    	</c:otherwise>
						    </c:choose>&nbsp;</td>
					    <td style='text-align: center;'>${item.creditRuncode}&nbsp;</td>
						<td style='text-align: center;'>${item.custName}&nbsp;</td>
						<td style='text-align: center;'>${item.leaseCode}&nbsp;</td>
						<td style='text-align: center;'>${item.incpName }&nbsp;</td>
						<td style='text-align: center;'>${item.insuCode }&nbsp;</td>
						<td style='text-align: center;'><fmt:formatDate value="${item.insuStartDate }" pattern="yyyy-MM-dd"/>&nbsp;</td>	
						<td style='text-align: center;'><fmt:formatDate value="${item.insuEndDate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
					 	<td style='text-align: center;'><fmt:formatNumber value="${item.insuPrice }" type="currency"/>&nbsp;</td>
					 	<td style='text-align: center;'><fmt:formatDate value="${item.surrenderDate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
					 	<td style='text-align: center;'><fmt:formatNumber value="${item.surrenderPrice }" type="currency"/>&nbsp;</td> 
					   	<td style='text-align: center;'>
					   		<a href="javascript:void(0)" onclick="showSurrender(this, '${item.insuId }');">[查看]</a>
					   		<c:if test="${item.surrenderStatus eq 0 }">
					   			<a href="javascript:void(0)" onclick="updateSurrender(this, '${item.insuId }');">[修改]</a>
					   		</c:if>
					   	</td>
					</tr>
					</c:forEach>         
				</tbody>
			</table>
				<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td align="right">
								<img src="${ctx }/images/u608.gif">
								待退保&nbsp;
								<img src="${ctx }/images/u611.gif">
								已退保&nbsp;
								<img src="${ctx }/images/u617.gif">
								作废&nbsp;
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			</div>
		</form>
		
	</body>
</html>		