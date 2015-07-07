<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/employee/js/employee.js"></script>
		<title>员工管理</title>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="employee.getEmployees" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;员工管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
					<div>
						<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
							<td>
							<input type="button" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=employee.preAdd'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加人员"></td>
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							员工姓名
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							性别
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							所在部门
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							职务
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							用户名
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							最后一次登录时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>
								<td style="text-align: center;">${item.NAME }</td>
								<td style="text-align: center;">${item.SEX }</td>
								<td style="text-align: center;">${item.DEPT_NAME }&nbsp;</td>
								<td style="text-align: center;" ><c:choose> <c:when test="${empty item.FLAG }">${item.JOB }</c:when><c:otherwise>${item.FLAG }</c:otherwise></c:choose>&nbsp;</td>  
								<td style="text-align: center;">${item.CODE }</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.LAST_LOGIN }" pattern="yyyy-MM-dd HH:m:s"/> &nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showEmployee(${item.ID });">查看</a>&nbsp;<a href="javaScript:void(0);" onclick="preUpdateEmployee(${item.ID });">更新</a>&nbsp;<a href="javaScript:void(0);" onclick="invalidEmployee(${item.ID }, '${item.NAME }');">作废</a>&nbsp;<a href="javaScript:void(0);" onclick="resetPass(${item.ID });">重置密码</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>