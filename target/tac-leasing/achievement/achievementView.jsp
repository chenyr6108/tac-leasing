<%-- <%@ page language="java"   pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业绩进度控管</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="业绩进度控管">
	 
<script type="text/javascript">
//导出合同
			 function excelFun()
			 {
	  		location.href='${ctx }/servlet/defaultDispatcher?__action=achievement.achievementExcel&start_date='+$("#start_date").val();
	  }
	  $(function (){
			$("#start_date").datepicker($.datepicker.regional['zh-CN']);
		});
		function doSearch() {
			$("#form1").submit() ;
		}
		function updateDateMonth(){
			var date = $("#start_date").val() ;
			$("#start_date").val(date.toString().substring(0,7)) ;
		}
</script>
  </head>
  <body>
		
    <table width="2200" align="center">
  <!--  <jsp:useBean id="monthd" class="java.util.Date"></jsp:useBean>
    <jsp:setProperty name="monthd"  property="month" value="${monthd.month}" /> --> 
				<tr><td>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业绩进度控管( <fmt:formatDate value="${start_date_date}" pattern="yyyy-MM"/>  )</span>
	  		 	</div>
	  		 	<div style="margin: 6 0 6 0px;">
	  		 	<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=achievement.achievementView">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>日期：  </td>
				          <td><input type="text" value="<fmt:formatDate value="${start_date_date}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="start_date" id="start_date" readonly="readonly" style="width:150px; height:18px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </form>
	          		</div>	
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           	<div class="zc_grid_body jqgrowleft">
        	<div class="ui-state-default ui-jqgrid-hdiv ">
        
        
        <c:set var="number" value="0"></c:set>
        <c:set var="num" value="0"></c:set>
        
        
        <c:set var="fatherRow" value="0"></c:set>
        <c:set var="fatherRowAdd" value="0"></c:set>
        <c:set var="fatherId" value="0"></c:set>
        <c:set var="fatherNum" value="0"></c:set>
        <c:set var="fatherMoney" value="0"></c:set>
        
       
          <c:set var="sunRow" value="0"></c:set>
        <c:set var="sunRowAdd" value="0"></c:set>
        <c:set var="sunId" value="0"></c:set>
        <c:set var="sunNum" value="0"></c:set>
        <c:set var="sunMoney" value="0"></c:set>
      
        <table width="100%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
        <tr class="ui-state-default ui-th-ltr zc_grid_head"><td colspan="25"><input type="button" name="pdfbutton" onclick="excelFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出业绩进度"></td></tr>
        
        <tr>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head" width="150px" style="text-align: center"  >单位</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >部门月目标(单位：仟元)</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >业务</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >月目标金額(单位：仟元)</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >客户</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >厂牌</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >客户属性</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >来源</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >客户区域</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px"  style="text-align: center"  >租赁方式</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >保证金 </td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >租金</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >租期</td>
         <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >申请拨款金额</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >拨款额</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px"  style="text-align: center"  >合约签订日期</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >动拨日期</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   style="text-align: center"  >起租</td>
      <!-- <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   style="text-align: center"  >原因</td> -->  
        </tr>
        
        <c:forEach items="${comp}" var="EMPL" varStatus="rowNum">
        <tr>
        <c:if test="${fatherNum==0}">
      		<c:forEach items="${company_count }" var="fatherCount" varStatus="status">
      				
      			<c:if test="${status.index==number }">
      				
      					<c:set  var="fatherRow" value="${fatherCount.DEPT_COUNT }"></c:set>
      					<c:choose > 
      						<c:when test="${fatherRowAdd==0 }">
      							<c:set var="fatherRowAdd" value="${fatherRow }"></c:set>
      						</c:when> 
      						<c:otherwise>
      							<c:set var="fatherRowAdd" value="${fatherRow+fatherRowAdd }"></c:set>
      						</c:otherwise>
      					</c:choose>
      					<c:set  var="fatherId" value="${fatherCount.DECP_ID }"></c:set>
      					<c:set  var="fatherMoney" value="${fatherCount.EMPL_ACHIEVEMENT }"></c:set>
      				
      				
      				<td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"   rowspan="${fatherRow }"> ${fatherCount.DECP_NAME_CN }  &nbsp;</td>
        			<td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:right"   rowspan="${fatherRow }">   <fmt:formatNumber value="${fatherMoney }" type="currency" /> &nbsp;</td>
      			</c:if>
      		</c:forEach>
        </c:if>
        <c:if test="${sunNum==0 }">
        	<c:forEach items="${user_count }" var="userCount" varStatus="status">
        		<c:if test="${status.index==num }">
        				<c:set var="sunRow" value="${userCount.EMPL_COUNT }"></c:set>
        				<c:choose > 
      						<c:when test="${sunRowAdd==0 }">
      							<c:set var="sunRowAdd" value="${sunRow }"></c:set>
      						</c:when> 
      						<c:otherwise>
      							<c:set var="sunRowAdd" value="${sunRow+sunRowAdd }"></c:set>
      						</c:otherwise>
      					</c:choose>
      					<c:set  var="sunId" value="${userCount.ID }"></c:set>
      					<c:set  var="sunMoney" value="${userCount.EMPL_ACHIEVEMENT }"></c:set>
        			
        			<td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  rowspan="${sunRow }"> ${userCount.NAME }  &nbsp;</td>
        			<td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: right"  rowspan="${sunRow }"> <fmt:formatNumber value="${EMPL.EMPL_ACHIEVEMENT }" type="currency" />  &nbsp;</td>
        		</c:if>
        	</c:forEach>
        </c:if>
        		
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  > ${EMPL.CUST_NAME }  &nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  > ${EMPL.BRAND }  &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.CUSTOMER_COME } &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.SPONSOR } &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.AREA }  &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >${EMPL.CONTRACT_TYPE } &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  >    <fmt:formatNumber value="${EMPL.PLEDGE_PRICE }" type="currency" />  &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  >   <fmt:formatNumber value="${EMPL.LEASE_TOPRIC }" type="currency" /> &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >   ${EMPL.LEASE_PERIOD }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: right"  > <fmt:formatNumber value="${EMPL.LEASE_TOPRIC-EMPL.PLEDGE_AVE_PRICE }" type="currency" />   &nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: right"  > <fmt:formatNumber value="${EMPL.PAY_MONEY }" type="currency" />   &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.LESSOR_TIME == '1900-01-01' ? '' : EMPL.LESSOR_TIME} &nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >   <fmt:formatDate pattern="yyyy-MM-dd" value="${EMPL.MODIFY_DATE }"/> &nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  > ${EMPL.START_DATE == '1900-01-01' ? '' : EMPL.START_DATE }<input type="hidden" value="${EMPL.REASON == 1 ? '核准未拨款': EMPL.REASON == 2 ? '当月拨款':  EMPL.REASON == 3 ? '当月H分级':''}"/>&nbsp;</td>
         <c:set  var="sunNum" value="${sunNum+1 }"></c:set>
        	<c:if test="${rowNum.index==sunRowAdd-1 }">
        	 	<c:set  var="sunNum" value="0"></c:set>
        	  	<c:set  var="num" value="${num+1 }"></c:set>
        	</c:if>
		
		 	<c:set  var="fatherNum" value="${fatherNum+1 }"></c:set>
       		<c:if test="${rowNum.index==fatherRowAdd-1 }">
        	 	<c:set  var="fatherNum" value="0"></c:set>
        	  	<c:set  var="number" value="${number+1 }"></c:set>
        	</c:if>
        </tr>
        <c:set var="TOTAL_EMPL_APPLY" value="${EMPL.LEASE_TOPRIC-EMPL.PLEDGE_AVE_PRICE+TOTAL_EMPL_APPLY }"></c:set>
		<c:set var="TOTAL_EMPL_PAY_MONEY" value="${EMPL.PAY_MONEY+TOTAL_EMPL_PAY_MONEY }"></c:set>
        </c:forEach>
        <tr>
			<td   height="26" class="ui-state-default ui-th-ltr zc_grid_head" width="150px" style="text-align: center"  >总计:</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: right"  ><fmt:formatNumber value="${amount }" type="currency" /></td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px"  style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >&nbsp; </td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >&nbsp;</td>
         <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  ><fmt:formatNumber value="${TOTAL_EMPL_APPLY }" type="currency" />&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  ><fmt:formatNumber value="${TOTAL_EMPL_PAY_MONEY }" type="currency" />&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px"  style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >&nbsp;</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   style="text-align: center"  >&nbsp;</td>
		</tr>
        </table>
					 </div> 
					 </div>
   					 </div>
					 </td>
			 </tr>
			 </table>
  </body>
</html>
 --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工业绩进度表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="员工业绩进度表">

<script type="text/javascript">
		$(function (){
			$("#DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function doQuery() {
			$("#form").submit();
		}
		
		function doSort(param) {
			$("#SORT").val(param);
			doQuery();
		}
		
		function fontStyle(param1,param2,param3) {
			document.getElementsByName("DEPT_LINK")[param3].style.color=param1;
			document.getElementsByName("DEPT_LINK")[param3].style.fontWeight=param2;
		}
		
		function achievementByUser(param) {
		        $("#dept"+param).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=achievement.achievementByUser&DEPT_ID="+param+"&DATE="+$("#DATE").val());
		        });
		}
</script>
</head>
<body>
	<form id="form" name="form" method="POST"
		action="${ctx}/servlet/defaultDispatcher?__action=achievement.achievementView">
		<input type="hidden" id="SORT" name="SORT">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align:left;height:30px">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;员工业绩进度表</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table width="80%" border="0" cellspacing="0" cellpadding="0"
			bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">日期：<input type="text" id="DATE"
								name="DATE" value="${DATE }" readonly="readonly">&nbsp;&nbsp;</td>
						</tr>
					</table></td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a>
				</td>
			</tr>
		</table>
		<br><br><br>&nbsp;&nbsp;&nbsp;
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;color:#222222;">
		<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:20px;">
					序号
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:300px;">
					区域(点击获得详细)
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:300px;cursor:pointer;" 
					onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>' )">
					部门月目标(单位K,点击排序 <c:if test="${SORT eq 'ASC' }">↑</c:if>
										    <c:if test="${SORT eq 'DESC' }">↓</c:if>)
				</td>
			</tr>
			<c:forEach items="${resultList}" var="item" varStatus="statusDept">
				<c:set var="MONTH_TARGET_TOTAL" value="${item.MONTH_TARGET+MONTH_TARGET_TOTAL }"/>
				<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:40px;">
					${statusDept.count}
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:300px;">
					<a href="#" style="text-decoration:none;color:#222222;" onclick="achievementByUser(${item.DEPT_ID })"
					 onMouseOver="fontStyle('#2E6E9E','bold',${statusDept.count-1});" onMouseOut="fontStyle('#222222','normal',${statusDept.count-1});" name="DEPT_LINK">${item.DEPT_NAME }</a>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:300px;">
					<fmt:formatNumber value="${item.MONTH_TARGET }" type="currency" pattern="#,##0"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:center;" colspan="3" align="center">
					<div id="dept${item.DEPT_ID}" align="center" 
					style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
						<img src="${ctx }/images/loading.gif">
					</div>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:40px;">
					总计
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:300px;">
					&nbsp;
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:300px;">
					<fmt:formatNumber value="${MONTH_TARGET_TOTAL }" type="currency" pattern="#,##0"/>
				</td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;<font style="color:#FF0000;">*</font>备注：此报表内容包含之案件<br>&nbsp;&nbsp;1：当月已拨款<br>&nbsp;&nbsp;2：已列印合同未拨款<br>&nbsp;&nbsp;3：未拨尾款
		</div>
		</div>
	</form>
</body>
</html>