<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>员工业绩目标录入</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="员工业绩目标录入">
	 

  </head>
  <script type="text/javascript">
  	//值计算
	
  function changDept(thisMon, decp_id){
  	
	var zz = Number(0);
	
	var empmid='empm'+decp_id;
	
	var bb=Number($("#wmon").val());
	var cc=Number($("#wcount").val());
	 for(var i = 1;i<=cc;i++){
	 	if($("#tMonth"+bb + "_" +i).attr("name")==empmid){
			var jw = Number($("#tMonth"+bb + "_" +i).val());
			zz = zz +jw;
	 	}
	 }	
	  
	
  	var valu  = document.getElementsByName("empm"+decp_id) ;
  	var total = $("#dept_act"+decp_id).val();
	$("#decp_id"+decp_id).empty();
//	 for(var i = 0;i<valu.length;i++){
//		var jw = Number(valu[i].value);
//		zz = zz +jw;
//	 }
		
		zz = zz.toFixed(1);
		$("#decp_id"+decp_id).append(""+zz +"K");
		//2012/01/16 Yang Yun 动态修改合计项
		$("#countMon_" + thisMon + "_"+decp_id).empty();
		$("#countMon_" + thisMon + "_"+decp_id).append(""+zz +"K");
	  	$("#dept_act"+decp_id).val(zz);
    
  }
  
  
  
  //传递值
  
  function changeValue(count,decp_id){
  		var valu= $("#thisMonth"+ count).val(); 
  		  $("#tMonth"+ count).val(valu);   
		  changDept(count.split("_")[0],decp_id);
		  //2012/01/16 Yang Yun 动态修改合计项
		  changMonCount(count,decp_id);
  }
	//2012/01/16 Yang Yun 动态修改合计项
  function changMonCount(count,decp_id){
	  var thisMon = count.split("_")[0];
	  //if(thisMon != "2"){
		  var tCount = Number(0);
		  $("input[id^='tMonth" + thisMon + "_'][name='empm" + decp_id + "']").each(function (){
			  tCount = tCount + Number($(this).val());
		  });
		  $("#countMon_" + thisMon + "_" + decp_id).empty();
		  $("#countMon_" + thisMon + "_" + decp_id).append(""+ Math.round(tCount*10)/10 + "K");
	  //}
  }
  
  function updateAchie(){
	  	$("#__action").val("achievement.saveorUpdateEmplAchievement");
 		$("#form1").submit();
  }
  
  //
  $(function(){
	   $("input[id^='thisMont']").each(function(){
				$(this).change();
	   }); 
  });
  
  function searchAchievement() {
	  $("#__action").val("achievement.achievementPage");
	  $("#form1").submit();
  }
  </script>
  
  
  
  <body>
	<form action="../servlet/defaultDispatcher" method="post" name="form1"   id="form1">
	<input type="hidden" name="__action" id="__action" value="">
	<input type="hidden" id="wmon" value="${mon}">
	<input type="hidden" id="wcount" value="${(fn:length(EMPLOYEE2JOB))}">
	<%-- 2012/01/16 Yang Yun 目标业绩中新增待补和合计字段
	<table width="2590" align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工业绩目标录入（${getDate}）</span>
				  		</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           	<div class="zc_grid_body jqgrowleft">
			        	<div class="ui-state-default ui-jqgrid-hdiv ">
					        <table width="100%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
						        <tr>
							        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="170px" style="text-align: center"  >单位</td>
							        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="135px" style="text-align: center"  >部門月目標</td>
							        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"   width="125px"  style="text-align: center" >业务</td>
							        <c:forEach var="nmonth" items="${monthList}">
							        <td   height="26" class="ui-state-default ui-th-ltr zc_grid_head"  width="180px" style="text-align: center"  > <fmt:formatDate pattern="yyyy-MM" value="${nmonth}"/> <input type="hidden" name="mon_flag" value="<fmt:formatDate pattern="yyyy-MM" value="${nmonth}"/>" >  </td>
						      		 </c:forEach>
						        </tr>
					       		 <c:forEach var="item"  items="${EMPLOYEE2JOB}" varStatus="status"> 
						         <tr>
								 <c:choose > <c:when test="${empty item.DEPT_COUNT}"></c:when> <c:otherwise><td   height="26px"  width="170px" class="ui-widget-content jqgrow ui-row-ltr" rowspan="${item.DEPT_COUNT}"  style="text-align: center"  >${item.DECP_NAME_CN}&nbsp;</td></c:otherwise> </c:choose>      
								 <c:choose > <c:when test="${empty item.DEPT_COUNT}"></c:when> <c:otherwise><td  height="26px"   class="ui-widget-content jqgrow ui-row-ltr" width="135px"  rowspan="${item.DEPT_COUNT}"   style="text-align: center"  ><span id="decp_id${item.DECP_ID}" style="font-size:18;" ></span>  <input  type="hidden" id="dept_act${item.DECP_ID}" name="dept_achievement"> &nbsp; </td></c:otherwise> </c:choose>      
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"   width="125px" style="text-align: center"  >   ${item.NAME} &nbsp; </td>
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth1_${status.count}" name="empl_achievement1" value="${item.MON1}" onchange="changeValue('1_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth1_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id1" value="${item.ID}" ><input type="hidden"  name="decp_id1" value="${item.DECP_ID}" ><input type="hidden" name="empl_month1" value="1" > </td>  
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth2_${status.count}" name="empl_achievement2" value="${item.MON2}" onchange="changeValue('2_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth2_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id2" value="${item.ID}" ><input type="hidden"  name="decp_id2" value="${item.DECP_ID}" ><input type="hidden" name="empl_month2" value="2" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth3_${status.count}" name="empl_achievement3" value="${item.MON3}" onchange="changeValue('3_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth3_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id3" value="${item.ID}" ><input type="hidden"  name="decp_id3" value="${item.DECP_ID}" ><input type="hidden" name="empl_month3" value="3" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth4_${status.count}" name="empl_achievement4" value="${item.MON4}" onchange="changeValue('4_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth4_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id4" value="${item.ID}" ><input type="hidden"  name="decp_id4" value="${item.DECP_ID}" ><input type="hidden" name="empl_month4" value="4" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth5_${status.count}" name="empl_achievement5" value="${item.MON5}" onchange="changeValue('5_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth5_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id5" value="${item.ID}" ><input type="hidden"  name="decp_id5" value="${item.DECP_ID}" ><input type="hidden" name="empl_month5" value="5" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth6_${status.count}" name="empl_achievement6" value="${item.MON6}" onchange="changeValue('6_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth6_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id6" value="${item.ID}" ><input type="hidden"  name="decp_id6" value="${item.DECP_ID}" ><input type="hidden" name="empl_month6" value="6" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth7_${status.count}" name="empl_achievement7" value="${item.MON7}" onchange="changeValue('7_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth7_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id7" value="${item.ID}" ><input type="hidden"  name="decp_id7" value="${item.DECP_ID}" ><input type="hidden" name="empl_month7" value="7" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth8_${status.count}" name="empl_achievement8" value="${item.MON8}" onchange="changeValue('8_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth8_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id8" value="${item.ID}" ><input type="hidden"  name="decp_id8" value="${item.DECP_ID}" ><input type="hidden" name="empl_month8" value="8" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth9_${status.count}" name="empl_achievement9" value="${item.MON9}" onchange="changeValue('9_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth9_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id9" value="${item.ID}" ><input type="hidden"  name="decp_id9" value="${item.DECP_ID}" ><input type="hidden" name="empl_month9" value="9" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth10_${status.count}" name="empl_achievement10" value="${item.MON10}" onchange="changeValue('10_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth10_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id10" value="${item.ID}" ><input type="hidden"  name="decp_id10" value="${item.DECP_ID}" ><input type="hidden" name="empl_month10" value="10" > </td>   
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth11_${status.count}" name="empl_achievement11" value="${item.MON11}" onchange="changeValue('11_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth11_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id11" value="${item.ID}" ><input type="hidden"  name="decp_id11" value="${item.DECP_ID}" ><input type="hidden" name="empl_month11" value="11" > </td>   
										 <!-- Modify By Michael 2011 12/02-->
										 <!-- 修正十二月份不能保存Bug -->
										 <td   height="26px"  class="ui-widget-content jqgrow ui-row-ltr"  width="80px" style="text-align: center"  ><input type="text" id="thisMonth12${status.count}" name="empl_achievement12" value="${item.MON12}" onchange="changeValue('12${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth12${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id12" value="${item.ID}" ><input type="hidden"  name="decp_id12" value="${item.DECP_ID}" ><input type="hidden" name="empl_month12" value="12" > </td>
								</tr>   
					        	</c:forEach>
					        </table>
						 </div> 
						 </div>
	   					 </div>
					 </td>
			 </tr>
			 <tr> <td><center><input type="button" id=""  class="ui-state-default ui-corner-all"    value="保存" onclick="updateAchie()">  </center> </td></tr>
			 </table>
	--%>
    <table align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工业绩目标录入
				   			<select id="YEAR" name="YEAR" onchange="searchAchievement()">
				   				<option value="2012" <c:if test="${YEAR eq '2012' }">selected="selected"</c:if>>2012</option>
				   				<option value="2013" <c:if test="${YEAR eq '2013' }">selected="selected"</c:if>>2013</option>
				   				<option value="2014" <c:if test="${YEAR eq '2014' }">selected="selected"</c:if>>2014</option>
				   				<option value="2015" <c:if test="${YEAR eq '2015' }">selected="selected"</c:if>>2015</option>
				   				<option value="2016" <c:if test="${YEAR eq '2016' }">selected="selected"</c:if>>2016</option></select></span>
				  		</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           	<div class="zc_grid_body jqgrowleft">
			        	<div class="ui-state-default ui-jqgrid-hdiv ">
					        <table width="100%"  cellspacing="2" cellpadding="0" border="0" style="background-color: #C5DBEC">
						        <tr style="background-color : #E0EFFC">
							        <td   height="26" width="80px" style="text-align: center"  >单位</td>
							        <td   height="26" width="80px" style="text-align: center"  >部門月目標</td>
							        <td   height="26" width="80px"  style="text-align: center" >业务员</td>
							        <c:forEach var="nmonth" items="${monthList}">
							        <td   height="26" width="50px" style="text-align: center"  > <fmt:formatDate pattern="yyyy-MM" value="${nmonth}"/> <input type="hidden" name="mon_flag" value="<fmt:formatDate pattern="yyyy-MM" value="${nmonth}"/>" >  </td>
						      		 </c:forEach>
						        </tr>
					       		 <c:forEach var="item"  items="${EMPLOYEE2JOB}" varStatus="status"> 
						         <tr <c:choose ><c:when test="${fn:substring(item.NAME,0,1) eq '*' }">style="background-color: #3399FF"</c:when>
						         			<c:when test="${fn:substring(item.NAME,0,1) eq '_' }">style="background-color: #A8A8A8"</c:when>
						         	<c:otherwise>
						         		<c:if test="${status.count % 2 == 0}">
						         			style="background-color: #A3CBF4"</c:if>
						         		<c:if test="${status.count % 2 != 0}">
						         			style="background-color: #FFFFFF"</c:if>
						         	</c:otherwise>
						         	</c:choose >>
								 <c:choose > 
								 	<c:when test="${empty item.DEPT_COUNT}"></c:when> 
								 	<c:otherwise>
								 		<td style="background-color: #FFFFFF"  height="26px"  width="50px" 
								 				rowspan="${item.DEPT_COUNT + 1}"  style="text-align: center"  >${item.DECP_NAME_CN}&nbsp;</td>
								 	</c:otherwise>
								 </c:choose>      
								 <c:choose ><c:when test="${empty item.DEPT_COUNT}"></c:when> <c:otherwise>
							 		 <td style="background-color: #FFFFFF"  height="26px"   width="50px"  rowspan="${item.DEPT_COUNT + 1}"   style="text-align: center"  >
							 		 <span id="decp_id${item.DECP_ID}" style="font-size:18;" ></span>  
							 		 <input  type="hidden" id="dept_act${item.DECP_ID}" name="dept_achievement"> &nbsp; </td>
								 </c:otherwise> </c:choose>
								 	<c:choose>
									 	<c:when test="${fn:substring(item.NAME,0,1) eq '*' }">
									 		<td   height="26px"  width="100px" style="text-align: center"  >   合计 &nbsp; </td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_1_${item.DECP_ID }">${item.MON1}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_2_${item.DECP_ID }">${item.MON2}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_3_${item.DECP_ID }">${item.MON3}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_4_${item.DECP_ID }">${item.MON4}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_5_${item.DECP_ID }">${item.MON5}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_6_${item.DECP_ID }">${item.MON6}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_7_${item.DECP_ID }">${item.MON7}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_8_${item.DECP_ID }">${item.MON8}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_9_${item.DECP_ID }">${item.MON9}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_10_${item.DECP_ID }">${item.MON10}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_11_${item.DECP_ID }">${item.MON11}K</span></td>
											 <td   height="26px"  width="80px" style="text-align: center"  ><span id="countMon_12_${item.DECP_ID }">${item.MON12}K</span></td>
									 	</c:when>  
									 	<c:otherwise>
										 <td   height="26px"    width="100px" style="text-align: center"  >   ${fn:substring(item.NAME,0,1) eq '_' ? fn:substring(item.NAME,1,fn:length(item.NAME)) : item.NAME} &nbsp; </td>
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth1_${status.count}" name="empl_achievement1" value="${item.MON1}" onchange="changeValue('1_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth1_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id1" value="${item.ID}" ><input type="hidden"  name="decp_id1" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id1" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month1" value="1" > </td>  
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth2_${status.count}" name="empl_achievement2" value="${item.MON2}" onchange="changeValue('2_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth2_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id2" value="${item.ID}" ><input type="hidden"  name="decp_id2" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id2" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month2" value="2" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth3_${status.count}" name="empl_achievement3" value="${item.MON3}" onchange="changeValue('3_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth3_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id3" value="${item.ID}" ><input type="hidden"  name="decp_id3" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id3" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month3" value="3" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth4_${status.count}" name="empl_achievement4" value="${item.MON4}" onchange="changeValue('4_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth4_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id4" value="${item.ID}" ><input type="hidden"  name="decp_id4" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id4" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month4" value="4" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth5_${status.count}" name="empl_achievement5" value="${item.MON5}" onchange="changeValue('5_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth5_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id5" value="${item.ID}" ><input type="hidden"  name="decp_id5" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id5" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month5" value="5" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth6_${status.count}" name="empl_achievement6" value="${item.MON6}" onchange="changeValue('6_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth6_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id6" value="${item.ID}" ><input type="hidden"  name="decp_id6" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id6" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month6" value="6" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth7_${status.count}" name="empl_achievement7" value="${item.MON7}" onchange="changeValue('7_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth7_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id7" value="${item.ID}" ><input type="hidden"  name="decp_id7" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id7" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month7" value="7" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth8_${status.count}" name="empl_achievement8" value="${item.MON8}" onchange="changeValue('8_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth8_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id8" value="${item.ID}" ><input type="hidden"  name="decp_id8" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id8" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month8" value="8" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth9_${status.count}" name="empl_achievement9" value="${item.MON9}" onchange="changeValue('9_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth9_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id9" value="${item.ID}" ><input type="hidden"  name="decp_id9" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id9" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month9" value="9" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth10_${status.count}" name="empl_achievement10" value="${item.MON10}" onchange="changeValue('10_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth10_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id10" value="${item.ID}" ><input type="hidden"  name="decp_id10" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id10" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month10" value="10" > </td>   
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth11_${status.count}" name="empl_achievement11" value="${item.MON11}" onchange="changeValue('11_${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth11_${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id11" value="${item.ID}" ><input type="hidden"  name="decp_id11" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id11" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month11" value="11" > </td>   
										 <!-- Modify By Michael 2011 12/02-->
										 <!-- 修正十二月份不能保存Bug -->
										 <td   height="26px"   width="80px" style="text-align: center"  ><input type="text" style="width: 50px;" id="thisMonth12${status.count}" name="empl_achievement12" value="${item.MON12}" onchange="changeValue('12${status.count}','${item.DECP_ID}');"> K <input  type="hidden" id="tMonth12${status.count}" value="" name="empm${item.DECP_ID}"><input type="hidden" name="empl_id12" value="${item.ID}" ><input type="hidden"  name="decp_id12" value="${item.DECP_ID}" ><input type="hidden"  name="dept_id12" value="${item.DEPT_ID}" ><input type="hidden" name="empl_month12" value="12" > </td>
										 </c:otherwise>   
									</c:choose>
								</tr>   
					        	</c:forEach>
					        	<tr style="background-color : #E0EFFC">
							        <td   height="26" width="80px" style="text-align: center"  >总计</td>
							        <td   height="26" width="80px" style="text-align: center"  >&nbsp;</td>
							        <td   height="26" width="80px" style="text-align: center"  >&nbsp;</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon1 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon2 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon3 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon4 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon5 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon6 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon7 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon8 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon9 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon10 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon11 }K</td>
							        <td   height="26" width="80px"  style="text-align: center" >&nbsp;${mon12 }K</td>
						        </tr>
					        </table>
						 </div> 
						 </div>
	   					 </div>
					 </td>
			 </tr>
			 <tr> <td><center><input type="button" id=""  class="ui-state-default ui-corner-all"    value="保存" onclick="updateAchie()">  </center> </td></tr>
			 </table>
			 </form>	
  </body>
</html>