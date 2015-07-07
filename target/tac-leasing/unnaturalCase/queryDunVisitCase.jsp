<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>访厂报告逾11天未提交</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="unnaturalCaseCommand.queryDunVisitCase">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;访厂报告逾11天未提交(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;01:00:00)</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
			          <td width="60" class="ss_o"></td>
			          <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          	<td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
									<select id="DATE" name="DATE">
										<c:forEach var="item" items="${dateList}">
											<option value="${item.DATE }" 
												<c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">selected="selected"</c:if></c:when>
														  <c:otherwise><c:if test="${item.DATE eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>${item.DATE }
											</option>
										</c:forEach>
									</select>
							</td>
							<td>
									&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<br>办事处：
									<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="item" items="${deptList}">
											<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${item.DEPT_NAME }
											</option>
										</c:forEach>
									</select>
							</td>
				          </tr>
				          </table>
			           </td>
				       <td width="55" class="ss_th" valign="top">&nbsp;</td>
				       <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				       </tr>
			     </table>
        	</div>
	           <div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
					<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>序号</strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="creditRunCode" pagingInfo="${pagingInfo }"><strong>案件号 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="custName" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="deptId" pagingInfo="${pagingInfo }"><strong>办事处</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>访厂区域</strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="visitDate" pagingInfo="${pagingInfo }"><strong>访厂日期</strong></page:pagingSort>
								</th>
								<%-- <th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="createOn" pagingInfo="${pagingInfo }"><strong>访厂报告生成时间 </strong></page:pagingSort>
								</th> --%>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="dayDiff" pagingInfo="${pagingInfo }"><strong>距今天数 </strong></page:pagingSort>
								</th>
							</tr>
							<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${index.count }&nbsp;</td>  
									<td style="text-align: center;">${item.creditRunCode }&nbsp;</td> 
									<td style="text-align: center;">${item.custName }&nbsp;</td>
									<td style="text-align: center;">${item.deptName }&nbsp;</td>
									<td style="text-align: center;">${item.name }&nbsp;</td>
									<td style="text-align: center;">${item.visitArea }&nbsp;</td>
									<td style="text-align: center;">${item.visitDate }&nbsp;</td>
									<%-- <td style="text-align: center;">${item.createOn }&nbsp;</td> --%>
									<td style="text-align: right;">${item.dayDiff }&nbsp;</td>
								</tr>
							</c:forEach>
							</table>
						<page:pagingToolbar pagingInfo="${pagingInfo }"/>
					</div>
				</div>
			</div>		
		</form>
	</body>
</html>