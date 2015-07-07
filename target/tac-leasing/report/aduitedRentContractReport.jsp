<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>业管文审统计表</title>
		<style type="text/css">
		.a_class{
			cursor: pointer;
			text-decoration:none;
			
		}	
		</style>
		<script type="text/javascript">
			function doQuery() {
				$("#form").submit();
			}
			
			function showAduitedRentContractDetail(userid,month){
				location.href="../servlet/defaultDispatcher?__action=aduitedRentContractReport.showDetail&userid="+userid+"&year=${year}&month="+month;
			}
			$(function () {
				var d=new Date();
			    var sec=d.getSeconds();
			    var min=d.getMinutes();
			    var hour=d.getHours();
			    if(sec<10) {
			    	sec="0"+sec;
			    }
			    if(min<10) {
			    	min="0"+min;
			    }
			    if(hour<10) {
			    	hour="0"+hour;
			    }
			    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
			});
		</script>
	</head>
	<body >
		<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="aduitedRentContractReport.getReport">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 1000px;">
			<div class="zc_grid_body jqgrowleft" style="width: 1000px;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 995px;">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管文审统计表</span>
		   	</div>
	          	<table width="1000px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table>
							<tr>
								<td>年份：</td>
								<td><select name="year"><c:forEach items="${yearList}" var="item"><option value="${item }" <c:if test="${item==year }">selected="selected"</c:if>>${item }</option></c:forEach></select></td>	</tr>
						  </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
				<table class="grid_table" style="width: 1000px;">
					<tr class="ui-state-default zc_grid_head">
						<td rowspan="2" style="text-align: center;">人名</td>
						<td colspan="2" style="text-align: center;">1月</td>
						<td colspan="2" style="text-align: center;">2月</td>
						<td colspan="2" style="text-align: center;">3月</td>
						<td colspan="2" style="text-align: center;">4月</td>
						<td colspan="2" style="text-align: center;">5月</td>
						<td colspan="2" style="text-align: center;">6月</td>
						<td colspan="2" style="text-align: center;">7月</td>
						<td colspan="2" style="text-align: center;">8月</td>
						<td colspan="2" style="text-align: center;">9月</td>
						<td colspan="2" style="text-align: center;">10月</td>
						<td colspan="2" style="text-align: center;">11月</td>
						<td colspan="2" style="text-align: center;">12月</td>
						<td colspan="2" style="text-align: center;">合计</td>
					</tr>
					<tr class="ui-state-default zc_grid_head">
						
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>
						<td style="text-align: center;">件</td>
						<td style="text-align: center;">小时</td>																							
					</tr>
					<c:forEach var="item"  items="${resultList}" varStatus="status"> 
						<tr >
							<td style="text-align: center;"><c:if test="${ item.STATUS eq -2}"><font color="red">${item.DISPATCH_NAME }</font></c:if><c:if  test="${ item.STATUS != -2}">${item.DISPATCH_NAME }</c:if></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_1 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',1)">${item.QTY_1 }</a></c:when> <c:otherwise>${item.QTY_1 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_1 }"/></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_2 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',2)">${item.QTY_2 }</a></c:when> <c:otherwise>${item.QTY_2 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_2 }"/></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_3 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',3)">${item.QTY_3 }</a></c:when> <c:otherwise>${item.QTY_3 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_3 }"/></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_4 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',4)">${item.QTY_4 }</a></c:when> <c:otherwise>${item.QTY_4 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_4 }"/></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_5 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',5)">${item.QTY_5 }</a></c:when> <c:otherwise>${item.QTY_5 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_5 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_6 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',6)">${item.QTY_6 }</a></c:when> <c:otherwise>${item.QTY_6 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_6 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_7 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',7)">${item.QTY_7 }</a></c:when> <c:otherwise>${item.QTY_7 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_7 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_8 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',8)">${item.QTY_8 }</a></c:when> <c:otherwise>${item.QTY_8 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_8 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_9 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',9)">${item.QTY_9 }</a></c:when> <c:otherwise>${item.QTY_9 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_9 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_10 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',10)">${item.QTY_10 }</a></c:when> <c:otherwise>${item.QTY_10 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_10 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_11 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',11)">${item.QTY_11 }</a></c:when> <c:otherwise>${item.QTY_11 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_11 }"/></td>							
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_12 >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}',12)">${item.QTY_12 }</a></c:when> <c:otherwise>${item.QTY_12 } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME_12 }"/></td>
							<td style="text-align: center;"><c:choose><c:when test="${item.QTY_TOTAL >0}"> <a href="javascript:;" class="a_class" onclick="showAduitedRentContractDetail('${item.USERID}','')">${item.QTY_TOTAL }</a></c:when> <c:otherwise>${item.QTY_TOTAL } </c:otherwise></c:choose></td>
							<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.AVG_TIME }"/></td>														
						</tr>
					</c:forEach>
				</table>
			</div>
			<span id="clock"></span>
			<br>
			<span><font color="red">*</font>注：红色名字为已离职人员</span>
		</div>
		</form>
		<br>
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-21</p>
	</body>
</html>
