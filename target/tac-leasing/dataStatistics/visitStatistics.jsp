<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function doQuery() {
		$("#form").submit();
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>访厂统计表</title>

</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="visit.getStatis">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;访厂统计表(单位:次)</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white">
			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;年份： <select id="YEAR" name="YEAR"
									style="width: 70px">
										<c:forEach items="${yearList}" var="year" varStatus="status">
											<option value="${year}"
												<c:if test="${year eq YEAR}">selected='selected'</c:if>>${year}</option>
										</c:forEach>
								</select>&nbsp;&nbsp;办事处:<select id="DEPT" name="DEPT"
								    style="width: 140px">
								        <option value="">--所有办事处--</option>
								        <c:forEach items="${deptList}" var="dept">
								            <option value="${dept.DECP_ID}" <c:if test="${dept.DECP_ID eq DEPT}">selected='selected'</c:if>>
								            ${dept.DECP_NAME_CN}
								            </option>   
								        </c:forEach>
								</select>
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			<br> <br> <br>
			<div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white">
				<table cellspacing="0" cellpadding="0" border="0" class="grid_table"
					style="width: 100%">

					<tr>
					   <th style="width: 2%;"><strong>序号</strong></th>
					   <th style="width: 10%;"><strong>办事处</strong></th>
						<th style="width: 10%;"><strong>姓名</strong></th>
						<th style="width: 6%;"><strong>1月<br>
						</strong></th>
						<th style="width: 6%;"><strong>2月<br>
						</strong></th>
						<th style="width: 6%;"><strong>3月<br>
						</strong></th>
						<th style="width: 6%;"><strong>4月<br>
						</strong></th>
						<th style="width: 6%;"><strong>5月<br>
						</strong></th>
						<th style="width: 6%;"><strong>6月<br>
						</strong></th>
						<th style="width: 6%;"><strong>7月<br>
						</strong></th>
						<th style="width: 6%;"><strong>8月<br>
						</strong></th>
						<th style="width: 6%;"><strong>9月<br>
						</strong></th>
						<th style="width: 6%;"><strong>10月<br>
						</strong></th>
						<th style="width: 6%;"><strong>11月<br>
						</strong></th>
						<th style="width: 6%;"><strong>12月<br>
						</strong></th>
						<th style="width: 9%;"><strong>总计</strong><br></th>

					</tr>
					<c:forEach var="item" items="${dataResult}" varStatus="i">
						<tr>
						    <td>${i.index+1}</td>
						    <td>${item.DECP_NAME_CN}</td>
                            <td>${item.NAME}</td>
                            <td style="text-align: right">${item.JAN}</td>
                            <td style="text-align: right">${item.FEB}</td>
                            <td style="text-align: right">${item.MAR}</td>
                            <td style="text-align: right">${item.API}</td>
                            <td style="text-align: right">${item.MAY}</td>
                            <td style="text-align: right">${item.JUN}</td>
                            <td style="text-align: right">${item.JUL}</td>
                            <td style="text-align: right">${item.AUS}</td>
                            <td style="text-align: right">${item.SEP}</td>
                            <td style="text-align: right">${item.OCT}</td>
                            <td style="text-align: right">${item.NOV}</td>
                            <td style="text-align: right">${item.DEC}</td>
							<th style="text-align: right;"><c:forEach
									items="${sumOfVisit}" var="item3">
									<c:if test="${item.REAL_VISITOR==item3.id}">
                                          ${item3.count}
                                       </c:if>
								</c:forEach></th>
						</tr>
					</c:forEach>
					<tr>
						<th colspan="3">总计</th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==1}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==2}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==3}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==4}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==5}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==6}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==7}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==8}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==9}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==10}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==11}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;"><c:forEach
								items="${countForMonth}" var="item4">
								<c:if test="${item4.MON==12}">
                                          ${item4.CI}
                                       </c:if>
							</c:forEach></th>
						<th style="text-align: right;">
						    ${total}
						</th>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<br><br>
	<div>
	  <span style="color:red">*</span>&nbsp;${backDate }之数据
	</div>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-54</p>
</body>
</html>