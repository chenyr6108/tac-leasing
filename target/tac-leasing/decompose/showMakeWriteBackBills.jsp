<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>分解单冲红管理</title>
		 
	<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
	<script type="text/javascript">	
	
	</script>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="checkDecompose.queryMakeCollWriteBackBills">

			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;冲红单制作</span>
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
				    <!--   
					<td colspan="5">
					&nbsp;
					</td>
					<td>
					&nbsp;
					</td> -->    
						  <td>查询状态：</td>
				          <td colspan="3"><select name="selecttype"  style=" width:200px;height:18px; font-size: 12px;"><option value="">--请选择--</option><option <c:if test="${selecttype==1 }">selected="selected"</c:if> value="1">整单冲红未完成</option><option <c:if test="${selecttype==2 }">selected="selected"</c:if> value="2">分项冲红未完成</option><option <c:if test="${selecttype==3 }">selected="selected"</c:if> value="3">整单冲红已完成</option><option <c:if test="${selecttype==4 }">selected="selected"</c:if> value="4">分项冲红已完成</option></select>
				          </td> 
				          </tr> 
				          </tr>  
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td>&nbsp;</td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<!-- <th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>合同ID</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>支付表号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>承租人编号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>承租人姓名</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款ID</strong>
			</th>-->
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款时间</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>收款单位</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>对方户名</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>对方账号</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款类型</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款金额</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>交易附言</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>冲红单制作</strong>
			</th> 
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>操作</strong>
			</th>
		</tr>
		<c:forEach items="${dw.rs}" var="items" varStatus="status">
			<tr	class="ui-widget-content jqgrow ui-row-ltr">
				<!-- <td style="text-align: center;">${items.RECP_ID }&nbsp;</td>
				<td style="text-align: center;">${items.RECP_CODE }&nbsp;</td>
				<td style="text-align: center;">${items.CUST_CODE }&nbsp;</td>
				<td style="text-align: center;">${items.CUST_NAME }&nbsp;</td>
				
				<td style="text-align: center;">${items.FIIN_ID }&nbsp;</td>
				 -->
				<td style="text-align: center;"><fmt:formatDate value="${items.OPPOSING_DATE }" pattern="yyyy-MM-dd" />&nbsp;</td>
				<td style="text-align: center;">${items.RECEIPT_UNIT }&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_UNIT }&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_BANKNO }&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_TYPE}&nbsp;</td>
				<td style="text-align: right;"><fmt:formatNumber value="${items.INCOME_MONEY }" type="currency"></fmt:formatNumber>&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_POSTSCRIPT }&nbsp;</td>
				<!-- <td style="text-align: center;"><c:if test="${items.RED_TYPE ==1 and items.FICB_TYPE ==0}"><a href="#" onclick="writeBackBillMakeAll('${items.FIIN_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(整单)</a></c:if><c:if test="${items.RED_TYPE ==0 and items.FICB_TYPE ==0}"><a href="#" onclick="writeBackBillMakeSome('${items.FIIN_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(分项)</a></c:if><c:if test="${items.FICB_TYPE ==2 }">冲红已完成&nbsp;</c:if><c:if test="${items.FICB_TYPE ==1 }">冲红已完成&nbsp;</c:if>&nbsp;</td> -->
				<td style="text-align: center;"><c:choose><c:when test="${items.RED_TYPE ==1 and items.FICB_TYPE ==0}"><a href="#" onclick="writeBackBillMakeAll('${items.FIIN_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(整单)</a></c:when><c:when test="${items.RED_TYPE ==0 and items.JUDGEOVERN eq null}"><a href="#" onclick="writeBackBillMakeSome('${items.FIIN_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(分项)</a></c:when><c:when test="${items.RED_TYPE ==1 and items.FICB_TYPE ==2 and items.DECOMPOSE_STATUS !=1 }">整单冲红已完成&nbsp;</c:when><c:when test="${items.RED_TYPE ==0 and (items.JUDGEOVERN>0) }">分项冲红已完成&nbsp;</c:when><c:when test="${items.RED_TYPE ==1 and items.DECOMPOSE_STATUS==1 and items.FICB_TYPE ==2}"><a href="#" onclick="writeBackBillMakeAll('${items.FIIN_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(整单)</a>&nbsp;</c:when><c:otherwise>其他情况</c:otherwise></c:choose>&nbsp;</td>
				<td style="text-align: center;"><a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${items.FIIN_ID }">查看</a>&nbsp;</td>			
			</tr>
		</c:forEach>
	</table>
			<%@ include file="/common/pageControl.jsp"%>
			
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>