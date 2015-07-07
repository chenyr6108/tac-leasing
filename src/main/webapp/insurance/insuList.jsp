<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insuPolicy.js"></script>
  	<script type="text/javascript">
  		// 添加理赔
			function addItem(id){
			  	window.location.href="../servlet/defaultDispatcher?__action=satisfaction.CreatePre&INCU_ID="+id
			}
  		$(function (){
				$("#AFFIRM_INSU_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#PRINT_INSU_DATE").datepicker($.datepicker.regional['zh-CN']);
			});
  	</script>
    <title>添加理赔</title>
  </head>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="satisfaction.insuManage" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;添加理赔</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;"> 
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;投保确认日期:<input  style="width:80px; height:18px;" type="text" name="AFFIRM_INSU_DATE" id="AFFIRM_INSU_DATE"  value="${AFFIRM_INSU_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly >&nbsp;保单打印日期:<input type="text"  style="width:80px; height:18px;" name="PRINT_INSU_DATE" id="PRINT_INSU_DATE" value="${PRINT_INSU_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly >
				          &nbsp;&nbsp;<input type="text" name="content" value="${content }" style="width:460px; height:18px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="tableForColor">
					<tr class="ui-jqgrid-labels">
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险开始日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保险终止日期
						</th>
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							总保费</th>
			           <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							缴费凭证号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							被保险人
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							投保人
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" >
							操作
						</th>

					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCU_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_START_DATE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.INSU_END_DATE} &nbsp;</td>
					 	<td style='text-align: center;height: 25px;'>${item.INSU_PRICE }&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.CHARGE_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.TO_INSU_NAME }&nbsp;</td>
					   <td style='text-align: center;height: 25px;'><a href="javascript:void(0)" onclick="addItem('${item.INCU_ID}')" >添加</a>&nbsp;</td>
					</tr>
					</c:forEach>         

						
						<%--<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							投保人
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							投保确认日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保险费总额(元)
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单打印日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单开始日期
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保单结束日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr">
						<td height="24px" style="text-align: left;">${status.count}&nbsp;</td>
						<td height="24px" style="text-align: left;">${item.INCP_NAME}&nbsp; </td>
						<td height="24px" style="text-align: left;">${item.TO_INSU_NAME }&nbsp;</td>
						<td height="24px" style="text-align: left;">${fn:substring(item.AFFIRM_INSU_DATE,0,10)}</td>
						<td height="24px" style="text-align: left;"><fmt:formatNumber value="${item.INSU_PRICE_TOTAL}" type="currency"  />&nbsp;</td>
						<td height="24px" style="text-align: left;">${fn:substring(item.PRINT_INSU_DATE,0,10)}&nbsp;</td>
						<td height="24px" style="text-align: left;">${fn:substring(item.INSU_START_DATE,0,10)}&nbsp;</td>
						<td height="24px" style="text-align: left;">${fn:substring(item.INSU_END_DATE,0,10)}&nbsp;</td>
						<td height="24px" style="text-align: left;"><a href="javascript:void(0)" onclick="addItem('${item.INCU_ID}')" >添加</a></td>
					</tr>
					</c:forEach>         
				--%></tbody>
			</table> 
			<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				</table>
				<%@ include file="/common/pageControl.jsp"%>
			</div>
			</div>
			</div>
		</form>		
	</body>
</html>		