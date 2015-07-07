<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>逾期状况统计表</title>
<style type="text/css">
.tdb{background-color: #99CCFF; text-align: center;}
.tdh{background-color: #E0EFFC; text-align: center;}
.tdl{background-color: #A7A7A7; text-align: center;}
.tds{background-color: #FFFF99; text-align: center;}
.tbw{background-color: #FFFFFF; width: 100%}
</style>
<script type="text/javascript">
$(function (){
	$("#search_dun_day").datepicker($.datepicker.regional['zh-CN']);
});

function expand(iddiv,deptName,date){
    $("#"+iddiv).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=dunCaseCommand.query&DATE="+date+"&DEPT_NAME="+deptName);
    });
}
function doSearch(){
	var date = $("#search_dun_day").val();
	var sDate = new Date(date.replace(/-/g,"/"));
	var validDate = new Date("2013/12/31");
	if(sDate.getTime() > validDate.getTime()){
		alert("数据查询有效日期截止至2013-12-31日，如需查询2014年或之后数据，请至新的逾期状况统计表1(办事处)中查询！");
		return false;
	}
	$("#f").submit();
}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post" id="f">
		<input type="hidden" name="__action"  value="report.queryDunInfo" />
		<input type="hidden" name="type"  value="${type }" />
		日期：<input type="text" name="search_dun_day" id="search_dun_day" value="${search_dun_day}" style="width:80px; height:18px;" />&nbsp;
			<c:if test="${type eq 1 }">
			业务类别：<select name="QUERY_TYPE" style=" height: 18px;">
						<option value="" <c:if test="${QUERY_TYPE eq 0}">selected='selected'</c:if>> 全部 </option>
						<option value="1" <c:if test="${QUERY_TYPE eq 1}">selected='selected'</c:if>> 商用车 </option>
						<option value="2" <c:if test="${QUERY_TYPE eq 2}">selected='selected'</c:if>> 设备 </option>
						<option value="3" <c:if test="${QUERY_TYPE eq 3}">selected='selected'</c:if>> 乘用车 </option>
					 </select>
			</c:if>
			<c:if test="${type eq 7 }">
			区域：<select name="area" style=" height: 18px;">
						<option value="">全部</option>
						<c:forEach items="${areaList}" var="item">
							<option value="${item.CODE }" <c:if test="${item.CODE eq area}">selected='selected'</c:if>>
								${item.FLAG }
							</option>
						</c:forEach>
				 </select>
			</c:if>
		&nbsp;<input type="button" onclick="doSearch();" value="查询" style="width : 50px; height : 30px;cursor: pointer;" class="ui-state-default ui-corner-all"/>
	</form>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table cellspacing="1" cellpadding="0" border="0" class="tbw" style="width: 120%">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						办事处<c:if test="${dunInfoList[0].FLAG eq 'Y' }"><br>(查看业务员)</c:if>
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
				<c:forEach items="${dunInfoList}" var="dunInfo" varStatus="index">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; white-space:nowrap;">
							<c:if test="${dunInfo.FLAG eq 'Y' }">
								<a href="#" onclick="expand('pactAffix${index.count}','${dunInfo.DECP_NAME }','${search_dun_day }')">${dunInfo.DECP_NAME }</a>
							</c:if>
							<c:if test="${dunInfo.FLAG eq 'N' }">
								${dunInfo.DECP_NAME }
							</c:if>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${dunInfo.TOTAL_DUN_COUNT }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.TOTAL_DUN_PRICE }"/></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_8 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_8 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_8}" />%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_8}" />%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_15 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_15}"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_15}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_15}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_31 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_31}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_31}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_61 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_61 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_61}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_61}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_8+dunInfo.DUN_COUNT_15 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_8+dunInfo.DUN_PRICE_15 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_8+dunInfo.DUN_COUNT_PER_15}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_8+dunInfo.DUN_PRICE_PER_15}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_31_TOTAL }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31_TOTAL }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_31_TOTAL}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_31_TOTAL}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_31_TOTAL-dunInfo.DUN_COUNT_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31_TOTAL-dunInfo.DUN_PRICE_180 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_31_TOTAL-dunInfo.DUN_COUNT_PER_180}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_31_TOTAL-dunInfo.DUN_PRICE_PER_180}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_91_TOTAL }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_91_TOTAL }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_91_TOTAL}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_91_TOTAL}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_91_TOTAL-dunInfo.DUN_COUNT_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_91_TOTAL-dunInfo.DUN_PRICE_180 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_91_TOTAL-dunInfo.DUN_COUNT_PER_180}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_91_TOTAL-dunInfo.DUN_PRICE_PER_180}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${dunInfo.DUN_COUNT_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_180 }"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_COUNT_PER_180}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.DUN_PRICE_PER_180}"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${dunInfo.SUB_DUN_COUNT}&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${dunInfo.SUB_DUN_PRICE}"/>
							<br/>
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.SUB_DUN_COUNT_PER}"/>%&nbsp;/&nbsp;
							<fmt:formatNumber pattern="##0.00" value="${dunInfo.SUB_DUN_PRICE_PER}"/>%
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
				</tbody>
			</table>
		</div>
	</div>
	<br><font color="red">*</font><font>合同數量包含已交完租金，但未交留購款或罰息，而未辦理結清之案件</font>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">
		<c:if test="${type eq '1' }">编号：IT-RPT-11</c:if>
		<c:if test="${type eq '7' }">编号：IT-RPT-12</c:if>
	</p>
	<script>
	$(function () {
			var dd = '${search_dun_day }';
			/* var d=new Date();
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
		    } */
		    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+dd+"  "+"20:00之数据";
		});
	</script>
</body>
</html>