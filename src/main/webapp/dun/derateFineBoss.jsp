<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>免息管理</title>
		<script type="text/javascript" src="${ctx }/dun/js/dunRent.js"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
					<input type="hidden" id="__action" name="__action"
					value="dunTask.derateFineBos" />   
			 
			<div>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">
				 经理免息审批
				 </span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${start_date }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
					<c:set var="type4" value=""></c:set>
					<c:set var="type5" value=""></c:set>
					
					<c:if test="${empty state}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${state eq 0}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${state eq 1}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if> 
					<c:if test="${state eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${state eq 4}">
						<c:set var="type4" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${state eq 5}">
						<c:set var="type5" value="selected='selected'"></c:set>
					</c:if>
					<select name="state" style="border: #03515d solid 1px;">
						<option value="" ${ type0}>
							全部
						</option>
						<option value="0" ${ type1}>
							未审核
						</option>
						<option value="4" ${ type4}>
							未审批
						</option> 
						<option value="5" ${ type5}>
							未通过
						</option> 
						<option value="3" ${ type3}>
							已撤销
						</option> 
						<option value="1" ${ type2}>
							已通过
						</option> 
					</select>	    
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr>
								<td align="right" colspan="11" style="text-align:center;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
									<%@ include file="/common/pageControlTop.jsp"%>
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									状态
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									承租人
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付表号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									减免日期
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									罚息金额
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									减免罚息
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									申请人
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									申请日期
								</th> 
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									详细
								</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><c:choose><c:when test="${item.STATE eq 3 }"><img src="${ctx }/images/u617.gif"></c:when><c:when test="${item.STATE eq 4 }"><img src="${ctx }/images/u608.gif"></c:when><c:when test="${item.STATE  eq 2 }"><img src="${ctx }/images/u620.gif"></c:when><c:when test="${item.STATE eq 1 }"><img src="${ctx }/images/u611.gif"></c:when><c:when test="${item.STATE eq  5 }"><img src="${ctx }/images/u622.gif"></c:when><c:otherwise><img src="${ctx }/images/u614.gif"></c:otherwise></c:choose></td>
								<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
								<td style="text-align: center;">${item.RECP_CODE }&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.DERATE_DATE }"  />&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber type="currency"
										value="${item.FINE }"></fmt:formatNumber></td>
								<td style="text-align: right;"><fmt:formatNumber type="currency"
										value="${item.DERATE_FINE }"></fmt:formatNumber></td>
								<td style="text-align: center">${item.APPLY_USER_NAME }&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.APPLY_DATE }"  /></td>
								<td style="text-align: center"><c:choose><c:when test="${item.STATE eq 4 }"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getDerateFineExamine&Boss=boss&dufd_id=${item.DUFD_ID }'">经理审批|</a></c:when><c:when test="${item.STATE ne 4 }"><font color="#c0c0c0">经理审批|</font></c:when></c:choose><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getDerateFineInfo&dufd_id=${item.DUFD_ID }'">详细</a></td>
							</tr> 
						</c:forEach>
						<tr>
							<td align="right" colspan="11" style="text-align:center;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<%@ include file="/common/pageControl.jsp"%>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;height: 26px" colspan="11">
								<img src="${ctx }/images/u614.gif">
								 未审批 
								<img src="${ctx }/images/u617.gif">
								 已撤销 
								<img src="${ctx }/images/u620.gif">
								 审查部未通过 
								<img src="${ctx }/images/u608.gif"  >
								 审查部通过 
								<img src="${ctx }/images/u611.gif" alt="经理审批通过">
								 经理审批通过 
								<img src="${ctx }/images/u622.gif" alt="">
								 经理审批未通过 
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</form> 
	</body>
</html>