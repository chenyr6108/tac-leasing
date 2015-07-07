<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
						
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							ÐòºÅ
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							ºÏÍ¬±àºÅ
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							ÐÕÃû
						</th>
						<c:forEach items="${bonus }" var="bonus">
							<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
								${bonus.BONUS_NAME }
							</th>
						</c:forEach>
						
						
					</tr>
					<tbody>
					<c:forEach items="${bonusList }" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'>${item.CONTRACT_CODE }</td>
						<td style='text-align: center;height: 25px;'>${item.BONUS_NAME }</td>
						<c:forEach items="${bonus }" var="bonus">
							
							 <c:set var="number" value="0"></c:set>
							<c:forEach items="${item.typeList }" var="typeList">
								<c:choose>
									<c:when test="${typeList.typeName eq bonus.BONUS_NAME}"><td style='text-align: right;height: 25px;'><fmt:formatNumber type="currency" value="${typeList.typeUpMoney eq null ? 0 :typeList.typeUpMoney }" /></td> <c:set var="number" value="1"></c:set></c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${number==0 }"><td style='text-align: right;height: 25px;'><fmt:formatNumber type="currency" value="0" /></td></c:if>
							
						</c:forEach>
					</tr>
					</c:forEach>         
				</tbody>
