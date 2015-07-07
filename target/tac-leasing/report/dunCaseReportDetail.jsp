<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function queryData(urlParams, thisParam){
	urlParams = urlParams.replace(/(___)/g,'=');
	urlParams = urlParams.replace(/(@@)/g,'&');
	window.location = "../servlet/defaultDispatcher?__action=dunTask.manage&" + urlParams + "&" + thisParam;
}
</script>
<div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						${type=="dept"?"办事处":type=="special"?"专案名":type=="orgUpUser"?"原始主管":type=="orgUser"?"原始经办人":type=="price"?"金额":"" }
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						总件数/总金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						8 ~ 14天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						15 ~ 30天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						31 ~ 60天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						61 ~ 90天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						8 ~ 30天 
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						31天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						31 ~ 180天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						91天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						91 ~ 180天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						181天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						小计（8天以上）
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
				</tr>
				<tbody>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; white-space:nowrap;"> 
							<c:if test="${type=='dept'}">
								<c:set var="thisParam" value="deptName=${item.decpName }"></c:set>
								${item.decpName }
							</c:if>
							<c:if test="${type=='special'}">
								<c:set var="thisParam" value="CREDIT_SPECIAL_CODE=${item.creditSpecialCode }"></c:set>
								${item.creditSpecialCode=="-1"?"非专案":item.creditSpecialName }
							</c:if>
							<c:if test="${type=='orgUpUser'}">
								<c:set var="thisParam" value="orgUpUserName=${item.upUserName }"></c:set>
								${item.upUserName }
							</c:if>
							<c:if test="${type=='orgUser'}">
								<c:set var="thisParam" value="orgUserName=${item.orgUserName }"></c:set>
								${item.orgUserName }
							</c:if>
							<c:if test="${type=='price'}">
								<c:if test="${item.remark==money_50}">
									<c:set var="thisParam" value="moneyEnd=500000"></c:set>
								</c:if>
								<c:if test="${item.remark==money_50_100}">
									<c:set var="thisParam" value="moneyBegin=500000&moneyEnd=1000000"></c:set>
								</c:if>
								<c:if test="${item.remark==money_100_200}">
									<c:set var="thisParam" value="moneyBegin=1000000&moneyEnd=2000000"></c:set>
								</c:if>
								<c:if test="${item.remark==money_200_300}">
									<c:set var="thisParam" value="moneyBegin=2000000&moneyEnd=3000000"></c:set>
								</c:if>
								<c:if test="${item.remark==money_300}">
									<c:set var="thisParam" value="moneyBegin=3000000"></c:set>
								</c:if>
								${item.remark }
							</c:if>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.totalPrice }"/>
						</td>
						<!-- 8 ~ 14天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count8_14==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count8_14!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=8&endrange=14');">
									${item.count8_14 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count8_14/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price8_14/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 15 ~ 30天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count15_30==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count15_30!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=15&endrange=30');">
									${item.count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price15_30 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count15_30/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price15_30/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31 ~ 60天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							<c:if test="${item.count31_60==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count31_60!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=31&endrange=60');">
									${item.count31_60}&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60 }"/><br> 
									<fmt:formatNumber type="number" value="${item.count31_60/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price31_60/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 61 ~ 90天 -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count61_90==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count61_90!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=61&endrange=90');">
									${item.count61_90 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price61_90 }"/><br>
									<fmt:formatNumber type="number" value="${item.count61_90/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price61_90/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 8 ~ 30天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count8_14+item.count15_30)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count8_14+item.count15_30)!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=8&endrange=30');">
									${item.count8_14+item.count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14+item.price15_30 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count8_14+item.count15_30)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price8_14+item.price15_30)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=31');">
									${item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 31 ~ 180天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count31_60+item.count61_90+item.count91_180)!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=31&endrange=180');">
									${item.count31_60+item.count61_90+item.count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price31_60+item.price61_90+item.price91_180 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count31_60+item.count61_90+item.count91_180)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price31_60+item.price61_90+item.price91_180)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 91天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=91');">
									${item.count91_180+item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 91 ~ 180天  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.count91_180==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.count91_180!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=91&endrange=180');">
									${item.count91_180 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price91_180 }"/><br>
									<fmt:formatNumber type="number" value="${item.count91_180/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.price91_180/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 181天以上  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${item.countMoreThan181==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${item.countMoreThan181!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=181');">
									${item.countMoreThan181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${item.countMoreThan181/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.priceMoreThan181/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
						<!-- 小计（8天以上）  -->
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							<c:if test="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)==0}">-&nbsp;/&nbsp;-<br>-&nbsp;/&nbsp;-</c:if>
							<c:if test="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)!=0}">
								<a href="javascript:void(0);" onclick="queryData('${urlParams}','${thisParam}&startrange=8');">
									${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181) }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.price8_14+item.price15_30+item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181 }"/><br>
									<fmt:formatNumber type="number" value="${(item.count8_14+item.count15_30+item.count31_60+item.count61_90+item.count91_180+item.countMoreThan181)/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${(item.price8_14+item.price15_30+item.price31_60+item.price61_90+item.price91_180+item.priceMoreThan181)/item.totalPrice *100 }" maxFractionDigits="2"/>%
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>