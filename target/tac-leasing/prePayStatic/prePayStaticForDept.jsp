<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>交机前拨款金额统计表</title>

<script type="text/javascript">
	function doQuery() {
		$("#form").submit();
	}
	
	function exportExcel(form){
		var s=$("#YEAR").val();
		location.href="../servlet/defaultDispatcher?__action=prePayStaticForDept.exportExcel&YEAR="+s;
	}
	
	function exportLoseCase(form){
		location.href="../servlet/defaultDispatcher?__action=prePayStaticForDept.exportLoseCase";
	}
	<%--
	function findLoseCase(deptNo,date){
		var t='交机前拨款';
	    var f='购置凭证';
	    alert(date);
		window.location="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryUncompletedFileCase&TYPE="+t+"&CONTENT="+f+"&DEPT_ID="+deptNo+"&DATE="+date;
	}--%>
</script>

</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="prePayStaticForDept.query">
		<c:if test="${empty month}">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;交机前拨款金额统计表</span>
		</div>
				<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
		</c:if>	
		
		<c:if test="${month==1 or month==2 or month==3 or month==4 or month==5 or month==6 or month==7 or month==8 or month==9 or month==10 or month==11 or month==12}">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;width:1600px;">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;交机前拨款金额统计表</span>
		</div>
				<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white;width:1600px;">
		</c:if>	


			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">

				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;  年份: <select name="YEAR" id="YEAR">
										<c:forEach items="${YearList}" var="year">
										   <option value="${year}" <c:if test="${year eq YEAR}">selected='selected'</c:if>>${year}</option>
										</c:forEach>
								</select>&nbsp;&nbsp;月份:<select id="MONTH" name="MONTH">
								<option <c:if test="${empty month}">selected='selected'</c:if> value="">全部</option>
								<option <c:if test="${month==1}">selected='selected'</c:if> value="1">1</option>
								<option <c:if test="${month==2}">selected='selected'</c:if> value="2">2</option>
								<option <c:if test="${month==3}">selected='selected'</c:if> value="3">3</option>
								<option <c:if test="${month==4}">selected='selected'</c:if> value="4">4</option>
								<option <c:if test="${month==5}">selected='selected'</c:if> value="5">5</option>
								<option <c:if test="${month==6}">selected='selected'</c:if> value="6">6</option>
								<option <c:if test="${month==7}">selected='selected'</c:if> value="7">7</option>
								<option <c:if test="${month==8}">selected='selected'</c:if> value="8">8</option>
								<option <c:if test="${month==9}">selected='selected'</c:if> value="9">9</option>
								<option <c:if test="${month==10}">selected='selected'</c:if> value="10">10</option>
								<option <c:if test="${month==11}">selected='selected'</c:if> value="11">11</option>
								<option <c:if test="${month==12}">selected='selected'</c:if>value="12">12</option>
								</select>
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="30%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
				</tr>
			</table>
			<br> <br> <br>
			
			<c:set var="p"  value="${total}"></c:set>
			
			<c:if test="${empty month}">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
					<tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">1月</th>
						<th colspan="7" style="width: auto;">2月</th>
						<th colspan="7" style="width: auto;">3月</th>
						<th colspan="7" style="width: auto;">4月</th>
						<th colspan="7" style="width: auto;">5月</th>
						<th colspan="7" style="width: auto;">6月</th>
						<th colspan="7" style="width: auto;">7月</th>
						<th colspan="7" style="width: auto;">8月</th>
						<th colspan="7" style="width: auto;">9月</th>
						<th colspan="7" style="width: auto;">10月</th>
						<th colspan="7" style="width: auto;">11月</th>
						<th colspan="7" style="width: auto;">12月</th>
						<th colspan="7" style="width: auto;">合计</th>
					</tr>
					

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
		                <th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
				        <th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
					    <th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
					    <th>待补件数</th>
						<th>待补金额</th>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
			            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
					  <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfJan}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan }</td>
                         <td style="text-align:right;">${item.scaleOfJan}</td>
                         <td style="text-align:right;">${item.count1}<%-- <a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID} ,${item.date1})" >${item.count1}</a>--%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfFeb}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfFeb }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfFeb}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfFeb }</td>
                         <td style="text-align:right;">${item.scaleOfFeb}</td>
                         <td style="text-align:right;">${item.count2}<%-- <a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date2} )" >${item.count2}</a>--%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney2}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfMar}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfMar }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfMar}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfMar }</td>
                         <td style="text-align:right;">${item.scaleOfMar}</td>
                         <td style="text-align:right;">${item.count3}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date3} )" >${item.count3}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney3}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfApr}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfApr }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfApr}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfApr }</td>
                         <td style="text-align:right;">${item.scaleOfApr}</td>
                         <td style="text-align:right;">${item.count4}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date4} )" >${item.count4}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney4}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfMay}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfMay }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfMay}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfMay }</td>
                         <td style="text-align:right;">${item.scaleOfMay}</td>
                         <td style="text-align:right;">${item.count5}<%-- <a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date5} )" >${item.count5}</a>--%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney5}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJun}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJun }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJun}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJun }</td>
                         <td style="text-align:right;">${item.scaleOfJun}</td>
                         <td style="text-align:right;">${item.count6}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID} ,${item.date6})" >${item.count6}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney6}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJul}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJul }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJul}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJul }</td>
                         <td style="text-align:right;">${item.scaleOfJul}</td>
                         <td style="text-align:right;">${item.count7}<%-- <a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date7} )" >${item.count7}</a>--%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney7}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfAus}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfAus }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfAus}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfAus }</td>
                         <td style="text-align:right;">${item.scaleOfAus}</td>
                         <td style="text-align:right;">${item.count8}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID },${item.date8})" >${item.count8}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney8}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfSep}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfSep }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfSep}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfSep }</td>
                         <td style="text-align:right;">${item.scaleOfSep}</td>
                         <td style="text-align:right;">${item.count9}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID} ,${item.date9})" >${item.count9}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney9}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfOct}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfOct }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfOct}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfOct }</td>
                         <td style="text-align:right;">${item.scaleOfOct}</td>
                         <td style="text-align:right;">${item.count10}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID },${item.date10})" >${item.count10}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney10}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfNov}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfNov }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfNov}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfNov }</td>
                         <td style="text-align:right;">${item.scaleOfNov}</td>
                         <td style="text-align:right;">${item.count11}<%-- <a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID},${item.date11} )" >${item.count11}</a>--%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney11}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfDec }</td>
                         <td style="text-align:right;">${item.scaleOfDec}</td>
                         <td style="text-align:right;">${item.count12}<%--<a href="javascript:void(0);" onclick="findLoseCase(${item.DECP_ID },${item.date12})" >${item.count12}</a> --%></td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney12}"/></td>
                         
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                       <tr>
                    </c:forEach>
                    
                    
                 
                   <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan }"/></td>
                      <td style="text-align: right;">${p.actOfJan }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan}"/></td>
                      <td style="text-align: right;">${p.preOfJan }</td>
                      <td style="text-align: right;">${p.scaleSumOfJan }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfFeb}"/></td>
                      <td style="text-align: right;">${p.actOfFeb }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfFeb}"/></td>
                      <td style="text-align: right;">${p.preOfFeb }</td>
                      <td style="text-align: right;">${p.scaleSumOfFeb }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount2 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney2 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfMar}"/></td>
                      <td style="text-align: right;">${p.actOfMar }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfMar}"/></td>
                      <td style="text-align: right;">${p.preOfMar }</td>
                      <td style="text-align: right;">${p.scaleSumOfMar }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount3 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney3 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfApr}"/></td>
                      <td style="text-align: right;">${p.actOfApr }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfApr}"/></td>
                      <td style="text-align: right;">${p.preOfApr }</td>
                      <td style="text-align: right;">${p.scaleSumOfApr }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount4 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney4 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfMay}"/></td>
                      <td style="text-align: right;">${p.actOfMay }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfMay}"/></td>
                      <td style="text-align: right;">${p.preOfMay }</td>
                      <td style="text-align: right;">${p.scaleSumOfMay }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount5 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney5 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJun}"/></td>
                      <td style="text-align: right;">${p.actOfJun }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJun}"/></td>
                      <td style="text-align: right;">${p.preOfJun }</td>
                      <td style="text-align: right;">${p.scaleSumOfJun }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount6 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney6 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJul}"/></td>
                      <td style="text-align: right;">${p.actOfJul }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJul}"/></td>
                      <td style="text-align: right;">${p.preOfJul }</td>
                      <td style="text-align: right;">${p.scaleSumOfJul }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount7 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney7 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfAus}"/></td>
                      <td style="text-align: right;">${p.actOfAus }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfAus}"/></td>
                      <td style="text-align: right;">${p.preOfAus }</td>
                      <td style="text-align: right;">${p.scaleSumOfAus }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount8 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney8 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfSep}"/></td>
                      <td style="text-align: right;">${p.actOfSep }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfSep}"/></td>
                      <td style="text-align: right;">${p.preOfSep }</td>
                      <td style="text-align: right;">${p.scaleSumOfSep }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount9 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney9 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfOct}"/></td>
                      <td style="text-align: right;">${p.actOfOct }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfOct}"/></td>
                      <td style="text-align: right;">${p.preOfOct }</td>
                      <td style="text-align: right;">${p.scaleSumOfOct }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount10 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney10 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfNov}"/></td>
                      <td style="text-align: right;">${p.actOfNov }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfNov}"/></td>
                      <td style="text-align: right;">${p.preOfNov }</td>
                      <td style="text-align: right;">${p.scaleSumOfNov }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount11 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney11 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfDec }</td>
                      <td style="text-align: right;">${p.scaleSumOfDec }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney12 }"/></td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      
                      </tr>
					
                 </table>
			</div>
          </c:if>
                    
          <c:if test="${month==1}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">1月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
						<th>待补件数</th>
						<th>待补金额</th>
									            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfJan}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan }</td>
                         <td style="text-align:right;">${item.scaleOfJan}</td>
                         <td style="text-align:right;">${item.count1}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1}"/></td>
                                                  <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan }"/></td>
                      <td style="text-align: right;">${p.actOfJan }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan}"/></td>
                      <td style="text-align: right;">${p.preOfJan }</td>
                      <td style="text-align: right;">${p.scaleSumOfJan }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1 }"/></td>
                                            <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
            </c:if>
                    
            <c:if test="${month==2}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">2月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfFeb}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfFeb }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfFeb}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfFeb }</td>
                         <td style="text-align:right;">${item.scaleOfFeb}</td>
                         <td style="text-align:right;">${item.count2}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney2}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfFeb }"/></td>
                      <td style="text-align: right;">${p.actOfFeb }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfFeb}"/></td>
                      <td style="text-align: right;">${p.preOfFeb }</td>
                      <td style="text-align: right;">${p.scaleSumOfFeb }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount2 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney2 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==3}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">3月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfMar}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfMar }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfMar}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfMar }</td>
                         <td style="text-align:right;">${item.scaleOfMar}</td>
                         <td style="text-align:right;">${item.count3}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney3}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfMar }"/></td>
                      <td style="text-align: right;">${p.actOfMar }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfMar}"/></td>
                      <td style="text-align: right;">${p.preOfMar }</td>
                      <td style="text-align: right;">${p.scaleSumOfMar }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount3 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney3 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
               </c:if>
                    
            <c:if test="${month==4}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">4月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfApr}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfApr }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfApr}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfApr }</td>
                         <td style="text-align:right;">${item.scaleOfApr}</td>
                         <td style="text-align:right;">${item.count4}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney4}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfApr }"/></td>
                      <td style="text-align: right;">${p.actOfApr }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfApr}"/></td>
                      <td style="text-align: right;">${p.preOfApr }</td>
                      <td style="text-align: right;">${p.scaleSumOfApr }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount4 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney4 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==5}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">5月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfMay}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfMay }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfMay}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfMay }</td>
                         <td style="text-align:right;">${item.scaleOfMay}</td>
                         <td style="text-align:right;">${item.count5}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney5}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfMay }"/></td>
                      <td style="text-align: right;">${p.actOfMay }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfMay}"/></td>
                      <td style="text-align: right;">${p.preOfMay }</td>
                      <td style="text-align: right;">${p.scaleSumOfMay }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount5 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney5 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==6}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">6月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfJun}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJun }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJun}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJun }</td>
                         <td style="text-align:right;">${item.scaleOfJun}</td>
                         <td style="text-align:right;">${item.count6}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney6}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJun }"/></td>
                      <td style="text-align: right;">${p.actOfJun }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJun}"/></td>
                      <td style="text-align: right;">${p.preOfJun }</td>
                      <td style="text-align: right;">${p.scaleSumOfJun }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount6 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney6 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==7}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">7月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfJul}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJul }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJul}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJul }</td>
                         <td style="text-align:right;">${item.scaleOfJul}</td>
                         <td style="text-align:right;">${item.count7}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney7}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJul }"/></td>
                      <td style="text-align: right;">${p.actOfJul }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJul}"/></td>
                      <td style="text-align: right;">${p.preOfJul }</td>
                      <td style="text-align: right;">${p.scaleSumOfJul }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount7 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney7 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==8}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">8月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfAus}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfAus }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfAus}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfAus }</td>
                         <td style="text-align:right;">${item.scaleOfAus}</td>
                         <td style="text-align:right;">${item.count8}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney8}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfAus }"/></td>
                      <td style="text-align: right;">${p.actOfAus }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfAus}"/></td>
                      <td style="text-align: right;">${p.preOfAus }</td>
                      <td style="text-align: right;">${p.scaleSumOfAus }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount8 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney8 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==9}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">9月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfSep}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfSep }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfSep}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfSep }</td>
                         <td style="text-align:right;">${item.scaleOfSep}</td>
                         <td style="text-align:right;">${item.count9}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney9}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfSep }"/></td>
                      <td style="text-align: right;">${p.actOfSep }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfSep}"/></td>
                      <td style="text-align: right;">${p.preOfSep }</td>
                      <td style="text-align: right;">${p.scaleSumOfSep }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount9 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney9 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==10}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">10月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfOct}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfOct }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfOct}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfOct }</td>
                         <td style="text-align:right;">${item.scaleOfOct}</td>
                         <td style="text-align:right;">${item.count10}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney10}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfOct }"/></td>
                      <td style="text-align: right;">${p.actOfOct }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfOct}"/></td>
                      <td style="text-align: right;">${p.preOfOct }</td>
                      <td style="text-align: right;">${p.scaleSumOfOct }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount10 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney10 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==11}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">&nbsp;&nbsp;
            <input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">11月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfNov}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfNov }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfNov}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfNov }</td>
                         <td style="text-align:right;">${item.scaleOfNov}</td>
                         <td style="text-align:right;">${item.count11}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney11}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfNov }"/></td>
                      <td style="text-align: right;">${p.actOfNov }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfNov}"/></td>
                      <td style="text-align: right;">${p.preOfNov }</td>
                      <td style="text-align: right;">${p.scaleSumOfNov }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount11 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney11 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    
            <c:if test="${month==12}">
            <div class="ui-state-default ui-jqgrid-hdiv " style="width: 1600px;">
			<input type="button" value="导出Excel" onclick="exportExcel(this.form)"/>&nbsp;&nbsp;
			<input type="button" value="导出交机前未补回拨款案件" onclick="exportLoseCase(this.form)"/>
				<table class="grid_table">
                    <tr>
						<th rowspan="2" style="width: auto;">地区</th>
						<th colspan="7" style="width: auto;">12月</th>
						<th colspan="7" style="width: auto;">全年</th>
					</tr>

					<tr>
						<th>总拨款金额</th>
						<th>总拨款件数</th>
						<th>交机前拨款金额</th>
						<th>交机前拨款件数</th>
						<th>交机前拨款金额占比</th>
												<th>待补件数</th>
						<th>待补金额</th>
															            <th>全年拨款金额</th>
						<th>全年拨款件数</th>
						<th>全年交机前拨款金额</th>
						<th>全年交机前拨款件数</th>
						<th>全年交机前拨款金额占比</th>
						<th>全年待补件数</th>
						<th>全年待补金额</th>
					</tr>
					
                      <c:forEach items="${dataList}" var="item">
                       <tr class="ui-widget-content jqgrow ui-row-ltr" style="height: auto;">
                         
                         <td style="text-align:center;width:100px;">${item.name}</td>
                         
                         <td style="text-align:right;height:auto;"><fmt:formatNumber type="currency" value="${item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfDec }</td>
                         <td style="text-align:right;">${item.scaleOfDec}</td>
                         <td style="text-align:right;">${item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney12}"/></td>
                                                                           <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"/></td>
                         <td style="text-align:right;">${item.actrueNumOfJan+item.actrueNumOfFeb+item.actrueNumOfMar+item.actrueNumOfApr+item.actrueNumOfMay
                         +item.actrueNumOfJun+item.actrueNumOfJul+item.actrueNumOfAus+item.actrueNumOfSep+item.actrueNumOfOct+item.actrueNumOfNov+item.actrueNumOfDec }</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"/></td>
                         <td style="text-align:right;">${item.prePayNumOfJan+item.prePayNumOfFeb+item.prePayNumOfMar+item.prePayNumOfApr+item.prePayNumOfMay
                         +item.prePayNumOfJun+item.prePayNumOfJul+item.prePayNumOfAus+item.prePayNumOfSep+item.prePayNumOfOct+item.prePayNumOfNov+item.prePayNumOfDec }</td>
                        <c:set var="p1"  value="${item.actureOfJan+item.actureOfFeb+item.actureOfMar
                         +item.actureOfApr+item.actureOfMay+item.actureOfJun+item.actureOfJul+item.actureOfAus+item.actureOfSep+item.actureOfOct+item.actureOfNov+item.actureOfDec}"></c:set>
                        <c:set var="p2"  value="${item.prePayOfJan+item.prePayOfFeb+item.prePayOfMar
                         +item.prePayOfApr+item.prePayOfMay+item.prePayOfJun+item.prePayOfJul+item.prePayOfAus+item.prePayOfSep+item.prePayOfOct+item.prePayOfNov+item.prePayOfDec}"></c:set>
                        <c:set var="p3" value="${p2/p1}"></c:set>
                        <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                         <td style="text-align:right;">${item.count1+item.count2+item.count3+item.count4+item.count5+item.count6+item.count7+item.count8
                         +item.count9+item.count10+item.count11+item.count12}</td>
                         <td style="text-align:right;"><fmt:formatNumber type="currency" value="${item.remanentMoney1+item.remanentMoney2+item.remanentMoney3
                         +item.remanentMoney4+item.remanentMoney5+item.remanentMoney6+item.remanentMoney7+item.remanentMoney8+item.remanentMoney9+item.remanentMoney10
                         +item.remanentMoney11+item.remanentMoney12}"/></td>
                         </tr>
                       </c:forEach>
                       
                      <tr class="ui-jqgrid-labels">
                      <td>合计</td>
                      
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfDec }"/></td>
                      <td style="text-align: right;">${p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfDec }</td>
                      <td style="text-align: right;">${p.scaleSumOfDec }</td>
                      <td style="text-align: right;">${p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney12 }"/></td>
                                                                     <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"/></td>
                      <td style="text-align: right;">${p.actOfJan+p.actOfFeb+p.actOfMar+p.actOfApr+p.actOfMay+p.actOfJun+p.actOfJul+p.actOfAus+p.actOfSep+p.actOfOct+p.actOfNov+p.actOfDec }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"/></td>
                      <td style="text-align: right;">${p.preOfJan+p.preOfFeb+p.preOfMar+p.preOfApr+p.preOfMay+p.preOfJun+p.preOfJul+p.preOfAus+p.preOfSep+p.preOfOct+p.preOfNov+p.preOfDec }</td>
                      <c:set var="p1"  value="${p.actureSumOfJan+p.actureSumOfFeb+p.actureSumOfMar
                      +p.actureSumOfApr+p.actureSumOfMay+p.actureSumOfJun+p.actureSumOfJul+p.actureSumOfAus+p.actureSumOfSep+p.actureSumOfOct+p.actureSumOfNov+p.actureSumOfDec}"></c:set>
                      <c:set var="p2"  value="${p.prePaySumOfJan+p.prePaySumOfFeb+p.prePaySumOfMar
                      +p.prePaySumOfApr+p.prePaySumOfMay+p.prePaySumOfJun+p.prePaySumOfJul+p.prePaySumOfAus+p.prePaySumOfSep+p.prePaySumOfOct+p.prePaySumOfNov+p.prePaySumOfDec}"></c:set>
                      <c:set var="p3" value="${p2/p1}"></c:set>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${p3*100}"/>%</td>
                      <td style="text-align: right;">${p.preOfAddFileCount1+p.preOfAddFileCount2+p.preOfAddFileCount3+p.preOfAddFileCount4+p.preOfAddFileCount5
                      +p.preOfAddFileCount6+p.preOfAddFileCount7+p.preOfAddFileCount8+p.preOfAddFileCount9+p.preOfAddFileCount10+p.preOfAddFileCount11+p.preOfAddFileCount12 }</td>
                      <td style="text-align: right;"><fmt:formatNumber type="currency" value="${p.preOfAddFileMoney1+p.preOfAddFileMoney2+p.preOfAddFileMoney3+p.preOfAddFileMoney4+p.preOfAddFileMoney5
                      +p.preOfAddFileMoney6+p.preOfAddFileMoney7+p.preOfAddFileMoney8+p.preOfAddFileMoney9+p.preOfAddFileMoney10+p.preOfAddFileMoney11+p.preOfAddFileMoney12 }"/></td>
                      </tr>
                   </table>
                </div>
              </c:if>
                    


		</div>
	</form>
				<div>
				  <span style="color:red">*</span>${backDate}&nbsp;23:00之数据<br>
				  <span style="color:red">*</span>周期按照财务结帐周期
				</div>
				<p align="right" style="font-weight:bolder;">编号：IT-RPT-33</p>
</body>
</html>