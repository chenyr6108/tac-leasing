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
<div id='case_report_count' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'case_report_count');" title="点击删除导航"></span>案况件数
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv" id="divCount">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"> 
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td  style="text-align: center;">月份 </td>
									<td  style="text-align: center;">资料中件数 </td>
									<td  style="text-align: center;">已访厂件数 </td>
									<td  style="text-align: center;">审核中件数 </td>
									<td  style="text-align: center;">已核准件数 </td>
									<td  style="text-align: center;">件数A(全部)</td>
									<td  style="text-align: center;">件数B<br/>(不含资料中)</td>
								</tr>
								<c:forEach var="item" items="${dw}" >
									<tr>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> ${item.DATE }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.INFO_COUNT }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.HAS_ACCESS_COUNT }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.AUDIT_COUNT }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.APPROVE_COUNT }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.COUNTA }</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.COUNTB }</td>
									</tr>
								</c:forEach>
								</table>
						</div>
			</div>
		</div>
	</div>
</div>