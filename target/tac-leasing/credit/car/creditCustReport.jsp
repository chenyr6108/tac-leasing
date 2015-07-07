<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>业绩进度控管</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="客户案况表">
	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	 
<script type="text/javascript">
			$(function (){
				$("#BEGIN_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
			});
			
			 function excelFun()
			 {
					   var sensorId=$("#sensorId").val();
					    var creditcontext=$("#creditcontext").val();
					     var state=$("#state").val();
					      var decp_name=$("#decp_name").val();
					   
	  				 location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.queryCreditByCustExcel&sensorId='+sensorId+'&creditcontext='+creditcontext+'&state='+state+'&decp_name='+decp_name;
	  		}
	  		
	  		function doSearch()
	  		{
	  			document.form1.submit();
	  		}
</script>
  </head>
  <body>
  <form action="../servlet/defaultDispatcher?__action=creditReport.queryCreditByCust" name="form1" id="form1" method="post">
			  
			 <jsp:useBean id="monthd" class="java.util.Date"></jsp:useBean>
    <jsp:setProperty name="monthd"  property="month" value="${monthd.month}" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;客户案况表</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
  <div style="margin: 6 0 6 0px;">
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;<br></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr> 
				              <td>经办：</td>
				          <td><input type="text" name="sensorId" id="sensorId" style="width:100px; height:18px;"  value="${sensorId }" ></td> 
				          <td>内容：</td>
				          <td><input type="text" name="creditcontext" id="creditcontext" style="width:150px; height:18px;"  value="${creditcontext }" ></td> 
				          <td>案件状况：</td>
				          <td>
				          <select name="state" id="state">
				          <option value="">--请选择--</option>
				         <c:forEach items="${actLog }" var="actLogSun" varStatus="status">
				          		<option value="${actLogSun.ACTLOG_ID }" <c:if test="${actLogSun.ACTLOG_ID==state }">selected="selected"</c:if> >${actLogSun.ACTLOG_NAME }</option>
				          	</c:forEach>
				          </select>
				          </td>
				          </tr>
				          <tr>
				         <td>单位：</td>
				          <td>
				          <select name="decp_name" id="decp_name">
				          	<option value="">--请选择--</option>
				          	<c:forEach items="${company_count1 }" var="fatherCount" varStatus="status">
				          		<option value="${fatherCount.DECP_ID }" <c:if test="${fatherCount.DECP_ID==decp_name }">selected="selected"</c:if> >${fatherCount.DECP_NAME_CN }</option>
				          	</c:forEach>
				          </select>
				          </td>
				          <td colspan="4">
				         	 &nbsp;&nbsp;&nbsp;查询条件：
				          		<select name="DATE_TYPE" id="DATE_TYPE">
				          			<option value="">--请选择--</option>
				          			<option value="1" <c:if test="${DATE_TYPE eq 1 }">selected="selected"</c:if>>预估拨款日</option>
				          			<option value="2" <c:if test="${DATE_TYPE eq 2 }">selected="selected"</c:if>>实际拨款日</option>
				          			<option value="3" <c:if test="${DATE_TYPE eq 3 }">selected="selected"</c:if>>预计起租日</option>
				          		</select>
				          开始时间<input type="text" name="BEGIN_DATE" id="BEGIN_DATE" readonly="readonly" value="${BEGIN_DATE }">
				          结束时间<input type="text" name="END_DATE" id="END_DATE" readonly="readonly" value="${END_DATE }"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
	           </form>		
	      <div class="ui-state-default ui-jqgrid-hdiv ">     
    <table align="center" width="2200px">
   
				<tr><td>
			
        
        
        <c:set var="number" value="0"></c:set>
        
        
        <c:set var="fatherRow" value="0"></c:set>
        <c:set var="fatherRowAdd" value="0"></c:set>
        <c:set var="fatherId" value="0"></c:set>
        <c:set var="fatherNum" value="0"></c:set>
      
        <table width="100%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
        <!-- <tr class="ui-state-default ui-th-ltr zc_grid_head"><td colspan="25"><input type="button" name="pdfbutton" onclick="excelFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出客户案况"></td></tr> -->
        
        <tr>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head" width="100px" style="text-align: center"  >单位</td>
        <!-- <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head" width="100px" style="text-align: center"  >报告号</td> -->
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >客户编号</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="200px" style="text-align: center"  >客户名称</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="250px" style="text-align: center"  >介绍人</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="250px" style="text-align: center"  >供应商</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="80px" style="text-align: center"  >租赁方式</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"     width="250px" style="text-align: center"  >租赁物概要</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >申请额度</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >案件状况</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="60px"  style="text-align: center"  >经办</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  > 核准额度</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"     width="80px" style="text-align: center"  >访厂日</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="80px" style="text-align: center"  >送件日</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="80px" style="text-align: center"  >核准日期</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="80px"  style="text-align: center"  >预估拨款日</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="80px"  style="text-align: center"  >实际拨款日</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >启租额度</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="80px" style="text-align: center"  >预估启租日</td>
        </tr>
        
        <c:forEach items="${comp}" var="EMPL" varStatus="rowNum">
        <tr>
        <!--<c:if test="${fatherNum==0}">
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
      				<td class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"   rowspan="${fatherRow }"> ${EMPL.DECP_NAME_CN }  &nbsp;</td>
      			</c:if>
      		</c:forEach>
        </c:if>
        -->
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center" >  ${EMPL.DECP_NAME_CN } &nbsp;</td>	
        <%-- <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center;"><br>  
        <a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${EMPL.CREDIT_ID }'">
        ${EMPL.CREDIT_CODE }</a> &nbsp;
        </td> --%>	
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center;"><br>  ${EMPL.CUST_CODE } &nbsp;</td>		
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"> ${EMPL.CUST_NAME }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" > ${EMPL.SPONSOR } &nbsp;</td>
        		
        
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  ${EMPL.BRAND }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  ${EMPL.ZULINTYPE }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.CREDIT_VALUE }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  > <fmt:formatNumber value="${EMPL.SQBKJE }" type="currency" />&nbsp;</td>
        <!-- <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  > <fmt:formatNumber value="${EMPL.PLEDGE_PRICE }" type="currency" />&nbsp;</td>-->
         <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >${EMPL.CASESTATE }   &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >  ${EMPL.SENSORNAME }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  >  <fmt:formatNumber value="${EMPL.SQBKJE  }" type="currency" />&nbsp;</td>
        <!-- <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  >  <fmt:formatNumber value="${EMPL.LEASE_TOPRIC }" type="currency" />&nbsp;</td>-->
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${EMPL.VISITFACTORYDATE } &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${EMPL.COMMIT_WIND_DATE }"/> &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${EMPL.HEZHUNTIME }"/>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${EMPL.EXPECTEDDATE }"/>&nbsp;</td>
       <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${EMPL.PAY_DATE }"/> &nbsp; &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  ><fmt:formatNumber value="${EMPL.SQBKJE }" type="currency" />&nbsp;</td>
        <!-- <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  ><fmt:formatNumber value="${EMPL.START_TOPRIC }" type="currency" />&nbsp;</td>-->
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  > <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${EMPL.START_DATE }"/> &nbsp;</td>
       
		
		 	<c:set  var="fatherNum" value="${fatherNum+1 }"></c:set>
       		<c:if test="${rowNum.index==fatherRowAdd-1 }">
        	 	<c:set  var="fatherNum" value="0"></c:set>
        	  	<c:set  var="number" value="${number+1 }"></c:set>
        	</c:if>
        </tr>
        	
        </c:forEach>
        </table>
					 </td>
			 </tr>
			 </table>
			 </div>
			</div>
  </body>
</html>
