<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
$(function (){
	$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
	$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
});


function doQuery() {
	$("#form1").submit();
}
</script>
<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1" method="post">
	<input type="hidden" name="__action" id="__action" value="modifyOrderCommand.showOrderForDept">
	<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				         <td width="8">&nbsp;</td>
				         <td width="60" class="ss_o"></td>
				         <td width="60%" class="ss_t" valign="top">
						 <table style="margin-left: 10px;">
				         <tr>
				        	  <td>起始日期：</td>
				              <td> <input type="text" name="START_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${START_DATE }"> </td>
				              <td>结束日期：</td>
				              <td><input type="text" name="END_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${END_DATE }"></td>
				     	 </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
					</div>	
	
<div  class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		更改单统计表</div>
	<div class="portlet-content">
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			id="main">
			<div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv">
					&nbsp;&nbsp;&nbsp;
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center; font-size: 14px;font-weight: bold " >更改單統計表</td>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;font-weight: bold " >合计</td>
							<c:forEach items="${officeList}" var="listHead">
								<td style="text-align: center;font-weight: bold">
								<c:choose>
									<c:when test="${listHead.DECP_NAME_CN eq '苏州办事处'}">苏州总公司</c:when>
									<c:otherwise>${listHead.DECP_NAME_CN}</c:otherwise>
								</c:choose>
								</td>
							</c:forEach>
						</tr>
						<%--  <c:forEach items="${classList}" var="classname"> --%>
						<c:forEach items="${listByClass}" var="countClass">
							 <tr>
							
							 	 <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; font-size: 14px;">
							 		 <c:forEach items="${classList}" var="classname"><c:if test="${countClass.ORDER_CLASS eq classname.CODE}"><span style="<c:if test="${classname.STATUS eq '-1'}">color: #A3A3A3</c:if>">${classname.FLAG}</span></c:if>  </c:forEach>
							 	</td> 
							
							 		<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; font-size: 14px;font-weight: bold" >
								 		<%-- <c:if test="${countClass.ORDER_CLASS eq classname.CODE}">${countClass.CLASSNUM}</c:if> --%>
								 		${countClass.CLASSNUM}
							 		</td>
							 		<c:forEach items="${officeList}" var="listHead">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; font-size: 11px;">
										<c:forEach items="${list}" var="list">
													<c:if test="${list.DECP_ID eq  listHead.DECP_ID}">
														<c:if test="${countClass.ORDER_CLASS eq list.ORDER_CLASS}">
															${list.CLASSNUM}
														</c:if>
													</c:if>
										</c:forEach>
										&nbsp;</td>
									</c:forEach>
							 </tr>	
						 </c:forEach>
						 <tr>
							 <td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; font-size: 14px;font-weight: bold" >
							 合计：&nbsp;</td>
							 <td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; font-size: 14px;font-weight: bold;background-color: ">
							${couAll}</td>
							<c:forEach items="${officeList}" var="listHead">
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; font-size: 14px;font-weight: bold">
									 <c:forEach items="${listByDept}" var="countDept">
										<c:if test="${countDept.DECP_ID eq  listHead.DECP_ID}">${countDept.CLASSNUM}&nbsp;</c:if>
									</c:forEach>
								</td>
							</c:forEach>
						 <tr>
						 

					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><span style="color: red">*&nbsp;&nbsp;</span><span style=" color: black">灰色代表此分类已撤销</span></div>
</div>
</form>


<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-49</p>
	<script>
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