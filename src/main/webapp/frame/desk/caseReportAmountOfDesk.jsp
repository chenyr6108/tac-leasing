<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
		function showCount() {
			if(document.getElementById("divCount").style.display=="none") {
				document.getElementById("divCount").style.display="block";
				document.getElementById("showOrHidden").innerHTML="隐藏件数";
			} else if(document.getElementById("divCount").style.display=="block") {
				document.getElementById("divCount").style.display="none";
				document.getElementById("showOrHidden").innerHTML="显示件数";
			}
		}
</script>
<div id='${divName}' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName}');" title="点击删除导航"></span>案况统计表(${descr })
		<!-- 
		<br>
		<span onclick="showCount()" style="cursor:pointer" id="showOrHidden">显示件数</span>
		 -->
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="font-family: 微软雅黑">
       			<div class="zc_grid_body jqgrowleft">
       			<div>&nbsp;&nbsp;&nbsp;单位:K
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td  style="text-align: center;font-size:12px;">月份 </td>
							<td  style="text-align: center;font-size:12px;">资料中 </td>
							<td  style="text-align: center;font-size:12px;">已访厂 </td>
							<td  style="text-align: center;font-size:12px;">审核中 </td>
							<td  style="text-align: center;font-size:12px;">已核准 </td>
							<td  style="text-align: center;font-size:12px;">总计A(全部)</td>
							<td  style="text-align: center;font-size:12px;">总计B<br/>(不含资料中)</td>
						</tr>
					<c:forEach var="item" items="${dw}" >
					<c:if test="${item.DISPLAY eq 'TRUE' }">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.DATE }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.INFO_AMOUNT }" pattern="#,##0"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.HAS_ACCESS_AMOUNT }" pattern="#,##0"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.AUDIT_AMOUNT }" pattern="#,##0"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.APPROVE_AMOUNT }" pattern="#,##0"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.TOTALA }" pattern="#,##0"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;font-size:11px;"> <fmt:formatNumber type="currency" value="${item.TOTALB }" pattern="#,##0"/>&nbsp;</td>
						</tr>
					</c:if>
					</c:forEach>
					</table>
				</div>
				
				<div class="ui-state-default ui-jqgrid-hdiv" style="display:none;" id="divCount">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td  style="text-align: center;font-size:12px;">月份 </td>
							<td  style="text-align: center;font-size:12px;">资料中件数 </td>
							<td  style="text-align: center;font-size:12px;">已访厂件数 </td>
							<td  style="text-align: center;font-size:12px;">审核中件数 </td>
							<td  style="text-align: center;font-size:12px;">已核准件数 </td>
							<td  style="text-align: center;font-size:12px;">件数A(全部)</td>
							<td  style="text-align: center;font-size:12px;">件数B<br/>(不含资料中)</td>
						</tr>
						<c:forEach var="item" items="${dw}" >
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.DATE }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.INFO_COUNT }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.HAS_ACCESS_COUNT }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.AUDIT_COUNT }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.APPROVE_COUNT }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.COUNTA }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;font-size:11px;"> ${item.COUNTB }</td>
							</tr>
						</c:forEach>
						</table>
				</div>
			</div>
			<font color="red">*</font>${date }&nbsp;17:30之数据
		</div>
	</div>
</div>