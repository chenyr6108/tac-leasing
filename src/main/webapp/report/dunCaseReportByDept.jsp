<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>逾期状况统计表1</title>
<style type="text/css">
.tdb{background-color: #99CCFF; text-align: center;}
.tdh{background-color: #E0EFFC; text-align: center;}
.tdl{background-color: #A7A7A7; text-align: center;}
.tds{background-color: #FFFF99; text-align: center;}
.tbw{background-color: #FFFFFF; width: 100%}
</style>
<script type="text/javascript">
$(function (){
	$("#DATE").datepicker($.datepicker.regional['zh-CN']);
	$( "#type" ).buttonset();
});
function expand(iddiv,deptName,date){
    $("#"+iddiv).toggle(function(){
    	var urlParams = "dun_date___"+ date + "@@deptName___" + deptName;
        $(this).load("../servlet/defaultDispatcher?__action=dunCaseCommand.queryDunCaseReportDetail&DATE="+date+"&DECPNAME="+deptName+"&type="+$('input[name="type"]:checked').val()+"&byType="+$('#byType').val()+"&urlParams="+urlParams);
    });
}
function queryDetail(deptName,startrange,endrange,date){
	window.location = "../servlet/defaultDispatcher?__action=dunTask.manage&dun_date="+date+"&deptName="+deptName+"&startrange="+startrange+"&endrange="+endrange;
}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" id="byType" name="byType" value="dept" />
		<input type="hidden" name="__action"  value="dunCaseCommand.queryDunCaseReport" />
		<div style="font-size:24px; font-weight:bold; color:#2E6E9E; text-align:center;">逾期状况统计表1（按办事处）</div>
		日期&nbsp;<input type="text" name="DATE" id="DATE" value="${DATE }"  style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly/>
		&nbsp;&nbsp;
		业务类别：<select name="QUERY_TYPE" style=" height: 18px;">
						<option value="" <c:if test="${QUERY_TYPE eq 0}">selected='selected'</c:if>> 全部 </option>
						<option value="1" <c:if test="${QUERY_TYPE eq 1}">selected='selected'</c:if>> 商用车 </option>
						<option value="2" <c:if test="${QUERY_TYPE eq 2}">selected='selected'</c:if>> 设备 </option>
						<option value="3" <c:if test="${QUERY_TYPE eq 3}">selected='selected'</c:if>> 乘用车 </option>
					 </select>&nbsp;&nbsp;
					 区域：<select name="area" style=" height: 18px;">
						<option value="">全部</option>
						<c:forEach items="${areaList}" var="item">
							<option value="${item.CODE }" <c:if test="${item.CODE eq area}">selected='selected'</c:if>>
								${item.FLAG }
							</option>
						</c:forEach>
				 </select>&nbsp;&nbsp;
		<input type="submit" value="查询" style="width:50px; height:30px; margin-left:10px; pointer;" class="ui-state-default ui-corner-all"/>
		<div id="type" style="margin-top:4px;">分类
			<input type="radio" value="special" id="radio1" name="type" <c:if test="${type=='special'||(type!='orgUpUser'&&type!='orgUser'&&type!='price') }">checked="checked"</c:if> /><label for="radio1">专案</label>
			<input type="radio" value="orgUpUser" id="radio2" name="type" <c:if test="${type=='orgUpUser' }">checked="checked"</c:if> /><label for="radio2">原始主管</label>
			<input type="radio" value="orgUser" id="radio3" name="type" <c:if test="${type=='orgUser' }">checked="checked"</c:if> /><label for="radio3">原始经办人</label>
			<input type="radio" value="price" id="radio4" name="type" <c:if test="${type=='price' }">checked="checked"</c:if> /><label for="radio4">金额</label>
		</div>
	</form>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table cellspacing="1" cellpadding="0" border="0" class="tbw">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						办事处<br/>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						总件数/总金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						8 ~ 14天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						15 ~ 30天 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						31 ~ 60天 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						61 ~ 90天 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						8 ~ 30天 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						31天以上 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						31 ~ 180天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						91天以上 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						91 ~ 180天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						181天以上
					</th> 
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						小计（8天以上）
					</th> 
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
				</tr>
				<tbody>
				<c:forEach items="${resultList }" var="item" varStatus="index">
				<c:set var="totalCount" value="${item.totalCount+totalCount }"></c:set>
				<c:set var="totalPrice" value="${item.totalPrice+totalPrice }"></c:set>
				<c:set var="count1_7" value="${item.count1_7+count1_7 }"></c:set>
				<c:set var="price1_7" value="${item.price1_7+price1_7 }"></c:set>
				<c:set var="count8_14" value="${item.count8_14+count8_14 }"></c:set>
				<c:set var="price8_14" value="${item.price8_14+price8_14 }"></c:set>
				<c:set var="count15_30" value="${item.count15_30+count15_30 }"></c:set>
				<c:set var="price15_30" value="${item.price15_30+price15_30 }"></c:set>
				<c:set var="count31_60" value="${item.count31_60+count31_60 }"></c:set>
				<c:set var="price31_60" value="${item.price31_60+price31_60 }"></c:set>
				<c:set var="count61_90" value="${item.count61_90+count61_90 }"></c:set>
				<c:set var="price61_90" value="${item.price61_90+price61_90 }"></c:set>
				<c:set var="count91_180" value="${item.count91_180+count91_180 }"></c:set>
				<c:set var="price91_180" value="${item.price91_180+price91_180 }"></c:set>
				<c:set var="countMoreThan181" value="${item.countMoreThan181+countMoreThan181 }"></c:set>
				<c:set var="priceMoreThan181" value="${item.priceMoreThan181+priceMoreThan181 }"></c:set>
				</c:forEach>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<c:if test="${item.count1_7 != null }">
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; white-space:nowrap;">
								<a href="javascript:void(0);" onclick="expand('pactAffix${index.count}','${item.decpName  }','${DATE }')">${item.decpName  }</a>
								&nbsp;
							</td>
						</c:if>
						<c:if test="${item.count1_7 == null }">
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
								${item.decpName }
							</td>
						</c:if>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.totalPrice }"/>
						</td>
						<!-- 8 ~ 14天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count8_14==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count8_14!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',8,14,'${DATE }');">
									${item.count8_14 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count8_14/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price8_14/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 15 ~ 30天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count15_30==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count15_30!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',15,30,'${DATE }');">
									${item.count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price15_30 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count15_30/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price15_30/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31 ~ 60天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							<c:if test="${item.count31_60==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count31_60!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',31,60,'${DATE }');">
									${item.count31_60}&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count31_60/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price31_60/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 61 ~ 90天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count61_90==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
								<c:if test="${item.count61_90!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',61,90,'${DATE }');">
									${item.count61_90 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price61_90 }"/><br>
									<fmt:formatNumber type="number" value="${item.count61_90/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price61_90/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 8 ~ 30天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count8_14+item.count15_30)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count8_14+item.count15_30)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',8,30,'${DATE }');">
									${item.count8_14+item.count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14+item.price15_30 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count8_14+item.count15_30)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price8_14+item.price15_30)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',31,'','${DATE }');">
									${item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31 ~ 180天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',31,'180','${DATE }');">
									${item.count31_60+item.count61_90+item.count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60+item.price61_90+item.price91_180 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count31_60+item.count61_90+item.count91_180)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price31_60+item.price61_90+item.price91_180)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 91天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',91,'','${DATE }');">
									${item.count91_180+item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 91 ~ 180天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count91_180)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count91_180)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',91,'180','${DATE }');">
									${item.count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price91_180 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count91_180)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price91_180)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 181天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.countMoreThan181==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.countMoreThan181!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',181,'','${DATE }');">
									${item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${item.countMoreThan181/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.priceMoreThan181/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 小计（8天以上）  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryDetail('${item.decpName}',8,'','${DATE }');">
									${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181) }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14+item.price15_30+item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price8_14+item.price15_30+item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;" colspan="10" align="center">
							<div id="pactAffix${index.count }" align="center"
								style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							总计
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalPrice }"/>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',8,14,'${DATE }');">
								${count8_14 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price8_14 }"/><br>
								<fmt:formatNumber type="number" value="${count8_14/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${price8_14/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',15,30,'${DATE }');">
								${count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price15_30 }"/><br>
								<fmt:formatNumber type="number" value="${count15_30/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${price15_30/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',31,60,'${DATE }');">
								${count31_60 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price31_60 }"/><br>
								<fmt:formatNumber type="number" value="${count31_60/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${price31_60/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',61,90,'${DATE }');">
								${count61_90 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price61_90 }"/><br>
								<fmt:formatNumber type="number" value="${count61_90/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${price61_90/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',8,30,'${DATE }');">
								${count8_14+count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price8_14+price15_30 }"/><br>
								<fmt:formatNumber type="number" value="${(count8_14+count15_30)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(price8_14+price15_30)/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',31,'','${DATE }');">
								${count31_60+count61_90+count91_180+countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price31_60+price61_90+price91_180+priceMoreThan181 }"/><br>
								<fmt:formatNumber type="number" value="${(count31_60+count61_90+count91_180+countMoreThan181)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(price31_60+price61_90+price91_180+priceMoreThan181)/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',31,180,'${DATE }');">
								${count31_60+count61_90+count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price31_60+price61_90+price91_180 }"/><br>
								<fmt:formatNumber type="number" value="${(count31_60+count61_90+count91_180)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(price31_60+price61_90+price91_180)/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',91,'','${DATE }');">
								${count91_180+countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price91_180+priceMoreThan181 }"/><br>
								<fmt:formatNumber type="number" value="${(count91_180+countMoreThan181)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(price91_180+priceMoreThan181)/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',91,180,'${DATE }');">
								${count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price91_180 }"/><br>
								<fmt:formatNumber type="number" value="${(count91_180)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(price91_180)/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',181,'','${DATE }');">
								${countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${priceMoreThan181 }"/><br>
								<fmt:formatNumber type="number" value="${countMoreThan181/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${priceMoreThan181/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<a href="javascript:void(0);" onclick="queryDetail('',8,'','${DATE }');">
								${count8_14+count15_30+count31_60+count61_90+count91_180+countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${price8_14+price15_30+price31_60+price61_90+price91_180+priceMoreThan181 }"/><br>
								<fmt:formatNumber type="number" value="${(count8_14+count15_30+count31_60+count61_90+count91_180+countMoreThan181)/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${((price8_14+price15_30+price31_60+price61_90+price91_180+priceMoreThan181))/totalPrice *100 }" maxFractionDigits="2"/>%
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<span id="clock"></span><br>
	<span style="color:#FF0000">*总件数和总金额不包含已缴清租金但案件未结清</span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-22</p>
	<script>
	$(function () {
		var d=new Date();
		if($("#DATE").val() != ''){
			var dd = $("#DATE").val().replace(/\-/g,'/') + ' 20:00:00';
			d = new Date(dd);
		}
	    $("#clock").html("<font color='#FF0000'>*"+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+"20:00之数据"+"</font>");
	 });
	</script>
</body>
</html>