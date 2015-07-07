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
	<meta http-equiv="description" content="业绩进度控管">
	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	 
<script type="text/javascript">

			 function excelFun()
			 {
					   var date=$("#datebegin").val();
					   
	  				 location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.activitiesStatisitceExcel&Query_DATE='+date;
	  		}
	  		
	  		function doSearch()
	  		{
	  			document.form1.submit();
	  		}
</script>
  </head>
  <body>
  <form action="../servlet/defaultDispatcher?__action=activitiesLog.activitiesStatisitce" name="form1" id="form1" method="post">
			  
			 <jsp:useBean id="monthd" class="java.util.Date"></jsp:useBean>
    <jsp:setProperty name="monthd"  property="month" value="${monthd.month}" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;业务人员活动日报表(${Query_DATE })</span>
			</div>
  <div style="margin: 6 0 6 0px;">
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr> 
				          <td>查询日期：</td>
				          <td><input type="text" name="Query_DATE" id="datebegin" style="width:150px; height:18px;" readonly="readonly" id="datebegin" value="${Query_DATE }" ></td> </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
	           </form>		
    <table align="center">
   
				<tr><td>
			
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           	<div class="zc_grid_body jqgrowleft">
        	<div class="ui-state-default ui-jqgrid-hdiv ">
        
        
        <c:set var="number" value="0"></c:set>
        
        
        <c:set var="fatherRow" value="0"></c:set>
        <c:set var="fatherRowAdd" value="0"></c:set>
        <c:set var="fatherId" value="0"></c:set>
        <c:set var="fatherNum" value="0"></c:set>
       <c:set var="zhi0" value="0"></c:set> 
        <c:set var="zhi1" value="0"></c:set>
         <c:set var="zhi2" value="0"></c:set>
          <c:set var="zhi3" value="0"></c:set>
           <c:set var="zhi4" value="0"></c:set>
            <c:set var="zhi5" value="0"></c:set>
             <c:set var="zhi6" value="0"></c:set>
              <c:set var="zhi7" value="0"></c:set>
               <c:set var="zhi8" value="0"></c:set>
                <c:set var="zhi9" value="0"></c:set>
                 <c:set var="zhi10" value="0"></c:set>
                  <c:set var="zhi11" value="0"></c:set>
                   <c:set var="zhi12" value="0"></c:set>
                    <c:set var="zhi13" value="0"></c:set>
                     <c:set var="zhi14" value="0"></c:set>
                     <c:set var="H_AMOUNT" value="0"></c:set>
                     <c:set var="A_AMOUNT" value="0"></c:set>
                     <c:set var="B_AMOUNT" value="0"></c:set>
      
        <table width="100%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
        <tr class="ui-state-default ui-th-ltr zc_grid_head"><td colspan="25"><input type="button" name="pdfbutton" onclick="excelFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出活动日报表"></td></tr>
        
        <tr>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head" width="150px" style="text-align: center"  >单位</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px" style="text-align: center"  >业代姓名</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >首次拜访</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >新开拓数</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="50px" style="text-align: center"  >勘厂</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >客户服务</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >经销商拜访</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"     width="50px" style="text-align: center"  >回访</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="120px" style="text-align: center"  >H(件数/金额)</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="120px" style="text-align: center"  >A(件数/金额)</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="120px"  style="text-align: center"  >B(件数/金额)</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="100px" style="text-align: center"  >首次报价数 </td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"     width="75px" style="text-align: center"  >送件数</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"    width="75px" style="text-align: center"  >签约数</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="75px" style="text-align: center"  >入保证金</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="100px"  style="text-align: center"  >当日动拨金额</td>
        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="100px" style="text-align: center"  >当月累计动拨金额</td>
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
      				
      				
      				<td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"   rowspan="${fatherRow }"> ${EMPL.DECP_NAME_CN }  &nbsp;</td>
        			
      			</c:if>
      		</c:forEach>
        </c:if>
        
        
       
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center" >  ${EMPL.USERS_NAME } &nbsp;</td>		
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" > <c:if test="${EMPL.TOTAL eq null }">0</c:if><c:if test="${EMPL.TOTAL>=0 }">${EMPL.TOTAL }<c:set var="zhi0" value="${zhi0+EMPL.TOTAL }"></c:set></c:if>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" > <c:if test="${EMPL.CREATECOUNT eq null }">0</c:if><c:if test="${EMPL.CREATECOUNT>=0 }">${EMPL.CREATECOUNT }<c:set var="zhi1" value="${zhi1+EMPL.CREATECOUNT }"></c:set></c:if>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" > <c:if test="${EMPL.VISITFACTORYCOUNT eq null }">0</c:if><c:if test="${EMPL.VISITFACTORYCOUNT>=0 }">${EMPL.VISITFACTORYCOUNT }<c:set var="zhi2" value="${zhi2+EMPL.VISITFACTORYCOUNT }"></c:set></c:if> &nbsp;</td>
        		
        
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  <c:if test="${EMPL.FUHECOUNT eq null }">0</c:if><c:if test="${EMPL.FUHECOUNT>=0 }">${EMPL.FUHECOUNT }<c:set var="zhi3" value="${zhi3+EMPL.FUHECOUNT }"></c:set></c:if>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  <c:if test="${EMPL.CUSTVISITCOUNT eq null }">0</c:if><c:if test="${EMPL.CUSTVISITCOUNT>=0 }">${EMPL.CUSTVISITCOUNT }<c:set var="zhi4" value="${zhi4+EMPL.CUSTVISITCOUNT }"></c:set></c:if>&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > <c:if test="${EMPL.BACKVISITCOUNT eq null }">0</c:if><c:if test="${EMPL.BACKVISITCOUNT>=0 }">${EMPL.BACKVISITCOUNT }<c:set var="zhi5" value="${zhi5+EMPL.BACKVISITCOUNT }"></c:set></c:if>&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > <c:if test="${EMPL.HCOUNT eq null }">0</c:if><c:if test="${EMPL.HCOUNT>=0 }">${EMPL.HCOUNT }<c:set var="zhi6" value="${zhi6+EMPL.HCOUNT }"></c:set></c:if>
        <c:if test="${EMPL.H == null }">/&nbsp;￥0.00</c:if><c:if test="${EMPL.H>=0 }">/&nbsp;<fmt:formatNumber value="${EMPL.H }" type="currency" /><c:set var="H_AMOUNT" value="${EMPL.H+H_AMOUNT }"></c:set></c:if>
        &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >   <c:if test="${EMPL.ACOUNT eq null }">0</c:if><c:if test="${EMPL.ACOUNT>=0 }">${EMPL.ACOUNT }<c:set var="zhi7" value="${zhi7+EMPL.ACOUNT }"></c:set></c:if>
        <c:if test="${EMPL.A == null }">/&nbsp;￥0.00</c:if><c:if test="${EMPL.A>=0 }">/&nbsp;<fmt:formatNumber value="${EMPL.A }" type="currency" /><c:set var="A_AMOUNT" value="${EMPL.A+A_AMOUNT }"></c:set></c:if>
        &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  ><c:if test="${EMPL.BCOUNT eq null }">0</c:if><c:if test="${EMPL.BCOUNT>=0 }">${EMPL.BCOUNT }<c:set var="zhi8" value="${zhi8+EMPL.BCOUNT }"></c:set></c:if> 
        <c:if test="${EMPL.B == null }">/&nbsp;￥0.00</c:if><c:if test="${EMPL.B>=0 }">/&nbsp;<fmt:formatNumber value="${EMPL.B }" type="currency" /><c:set var="B_AMOUNT" value="${EMPL.B+B_AMOUNT }"></c:set></c:if>
        &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >   <c:if test="${EMPL.FIRSTPRICECOUNT eq null }">0</c:if><c:if test="${EMPL.FIRSTPRICECOUNT>=0 }">${EMPL.FIRSTPRICECOUNT }<c:set var="zhi9" value="${zhi9+EMPL.FIRSTPRICECOUNT }"></c:set></c:if> &nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >   <c:if test="${EMPL.SENDCOUNT eq null }">0</c:if><c:if test="${EMPL.SENDCOUNT>=0 }">${EMPL.SENDCOUNT }<c:set var="zhi10" value="${zhi10+EMPL.SENDCOUNT }"></c:set></c:if>&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  ><c:if test="${EMPL.SHENGHECOUNT eq null }">0</c:if><c:if test="${EMPL.SHENGHECOUNT>=0 }">${EMPL.SHENGHECOUNT }<c:set var="zhi11" value="${zhi11+EMPL.SHENGHECOUNT }"></c:set></c:if>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  <c:if test="${EMPL.MARGINCOUNT eq null }">0</c:if><c:if test="${EMPL.MARGINCOUNT>=0 }">${EMPL.MARGINCOUNT }<c:set var="zhi12" value="${zhi12+EMPL.MARGINCOUNT }"></c:set></c:if>&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  ><c:if test="${EMPL.PAY_MONEYDAYCOUNT eq null }">￥ 0.00</c:if><c:if test="${EMPL.PAY_MONEYDAYCOUNT>=0 }"><fmt:formatNumber value="${EMPL.PAY_MONEYDAYCOUNT }" type="currency" /><c:set var="zhi13" value="${zhi13+EMPL.PAY_MONEYDAYCOUNT }"></c:set></c:if>&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: right"  > <c:if test="${EMPL.PAY_MONEYMONTHCOUNT eq null }">￥ 0.00</c:if><c:if test="${EMPL.PAY_MONEYMONTHCOUNT>=0 }"><fmt:formatNumber value="${EMPL.PAY_MONEYMONTHCOUNT }" type="currency" /><c:set var="zhi14" value="${zhi14+EMPL.PAY_MONEYMONTHCOUNT }"></c:set></c:if>&nbsp;</td>
       
		
		 	<c:set  var="fatherNum" value="${fatherNum+1 }"></c:set>
       		<c:if test="${rowNum.index==fatherRowAdd-1 }">
        	 	<c:set  var="fatherNum" value="0"></c:set>
        	  	<c:set  var="number" value="${number+1 }"></c:set>
        	</c:if>
        </tr>
        	
        </c:forEach>
        <tr>
        		 <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center" > &nbsp;</td>
         <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align:center" >  合计 &nbsp;</td>
         <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" >${zhi0 }&nbsp;</td>		
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" >${zhi1 }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center" > ${zhi2 }&nbsp;</td>
        		
        
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  > ${zhi3 }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  ${zhi4 }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${zhi5 }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  > ${zhi6 }&nbsp;/<fmt:formatNumber value="${H_AMOUNT }" type="currency" /></td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >  ${zhi7 }&nbsp;/<fmt:formatNumber value="${A_AMOUNT }" type="currency" /></td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >${zhi8 }&nbsp;/<fmt:formatNumber value="${B_AMOUNT }" type="currency" /></td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >  ${zhi9 }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >   ${zhi10 }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center"  >${zhi11 }&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: center"  >  ${zhi12 }&nbsp;</td>
        <td     class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right"  ><fmt:formatNumber value="${zhi13 }" type="currency" />&nbsp;</td>
        <td    class="ui-widget-content jqgrow ui-row-ltr"  style="text-align: right"  > <fmt:formatNumber value="${zhi14 }" type="currency" />&nbsp;</td>
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
