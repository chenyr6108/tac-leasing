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
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName}');" title="点击删除导航"></span>案况件数(${descr})
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft" style="font-family: 微软雅黑">
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
								<c:if test="${item.DISPLAY eq 'TRUE' }">
									<tr>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> ${item.DATE }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.INFO_COUNT }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.HAS_ACCESS_COUNT }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.AUDIT_COUNT }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.APPROVE_COUNT }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.COUNTA }&nbsp;</td>
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> ${item.COUNTB }&nbsp;</td>
									</tr>
								</c:if>
								</c:forEach>
								</table>
						</div>
						<font color="red">*</font>${date }&nbsp;17:30之数据
			</div>
		</div>
	</div>
</div>