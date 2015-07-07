<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>每日应收租金、每日实际来款表</title>
     
     <script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	$(function() {
		$("#start").datepicker($.datepicker.regional['zh-CN']);
	});
</script>

</head>
<body>
     	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="rentOfDay.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;每日应收租金、每日实际来款表</span>
		</div>
		
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;
							日期:<input type="text" name="SEARCHDATE" id="start" readonly="readonly" value="${payDate}">&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="30%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
						</td>
				</tr>
			</table>
			<br><br><br>
			<div class="ui-state-default ui-jqgrid-hdiv ">
		<table width="50%">
		  <tr>
		     <td><%@ include file="/common/pageControl.jsp"%></td>
		  </tr>
		</table>
		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="tableForColor" 
		       style="width:50%">
		        <thead>
				<tr class="ui-jqgrid-labels">
                     <th class="ui-state-default ui-th-ltr zc_grid_head" style="width:4%">状态</th>  
                     <th class="ui-state-default ui-th-ltr zc_grid_head">收款日期</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">应收租金</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">实收来款</th>
                     <th class="ui-state-default ui-th-ltr zc_grid_head">比例</th>
				</tr>
			    </thead>
			    
			<tbody>
               <c:forEach items="${dataList }" var="item">
                  <tr class="ui-widget-content jqgrow ui-row-ltr">
                    <td style="text-align:center">
                      <c:choose>
                        <c:when test="${item.ACTUREPAY<item.RENTOFDAY }"><img src="${ctx }/images/u617.gif" title="付款不足"></c:when>
                        <c:otherwise><img src="${ctx }/images/u620.gif" title="正常"></c:otherwise>
                      </c:choose>
                    </td>
                    <td style="text-align:center">${item.PAYDATE }</td>
                    <td style="text-align:right"><fmt:formatNumber type="currency" value="${item.RENTOFDAY  }"/></td>
                    <td style="text-align:right"><fmt:formatNumber type="currency" value="${item.ACTUREPAY }"/></td>
                    <td style="text-align:right"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.scale}"/>%</td>
                  </tr>
               </c:forEach>
			</tbody>
			
		</table>
		<table width="50%">
		  <tr>
		     <td><%@ include file="/common/pageControl.jsp"%></td>
		  </tr>
		</table>
		
								<table class="STYLE2" width="50%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
                                       		<img src="${ctx }/images/u620.gif" title="正常">正常&nbsp;<img src="${ctx }/images/u617.gif" title="正常">付款不足
									</td>
								</tr>
							</tbody>
						</table>
		</div>
			</div>
		</form>
		<div>
		  <span style="color:red">*</span>${backDate}之数据
		</div>
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-35</p>
</body>
</html>