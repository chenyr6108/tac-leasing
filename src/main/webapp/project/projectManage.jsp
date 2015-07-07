<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>项目申请管理</title>	 
	<script type="text/javascript" src="${ctx }/project/js/project.js"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="projectManage.projectManage">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;项目申请管理</span>
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
					类型：
					</td>
					<td>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
					<c:if test="${PRJT_STATUS eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${PRJT_STATUS eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${PRJT_STATUS eq 2}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${PRJT_STATUS eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>
					<select name="prjt_status" style=" height: 18px;">
						<option value="-2"${ type0}>
							全部
						</option>
						<option value="0"${ type0}>
							未提交
						</option>
						<option value="1"${ type1}>
							已提交
						</option>
						<option value="2"${ type2}>
							受理
						</option>
						<option value="3"${ type3}>
							已驳回
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
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" name="but" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=projectManage.initProjectAdd'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建项目"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<input type="checkbox">
					</th>
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>申请类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>区域 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处主管 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>创建时间 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;"><input type="checkbox" value="${item.PRJT_ID }"></td>
						<td style="text-align: center;"><c:if test="${item.PRJT_STATUS eq 0}"><img src="${ctx }/images/u620.gif" title="未提交"></c:if><c:if test="${item.PRJT_STATUS eq 1}"><img src="${ctx }/images/u611.gif" title="已提交"></c:if><c:if test="${item.PRJT_STATUS eq 2}"><img src="${ctx }/images/u608.gif" title="受理"></c:if><c:if test="${item.PRJT_STATUS eq 3}"><img src="${ctx }/images/u617.gif" title="已驳回"></c:if></td>
						<td style="text-align: center;"><c:if test="${item.TYPE eq 1}">新客户</c:if><c:if test="${item.TYPE eq 2}">授信客户</c:if><c:if test="${item.TYPE eq 3}">续签客户</c:if></td>
						<td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
						<td style="text-align: center;">${item.CUST_NAME }</td>
						<td style="text-align: center;">${item.AREANAME }</td>
						<td style="text-align: center;">${item.CLERKNAME }</td>
						<td style="text-align: center;">${item.CREATE_TIME }</td>
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=projectManage.selectProjectForShow&prjt_id=${item.PRJT_ID }'">查看</a>|<c:choose><c:when test="${item.PRJT_STATUS eq 1 ||item.PRJT_STATUS eq 2}"><font color="#c0c0c0">修改</font></c:when><c:otherwise><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=projectManage.projectCreateJsp&prjt_id=${item.PRJT_ID }'">修改</a></c:otherwise></c:choose>|<c:choose><c:when test="${item.PRJT_STATUS eq 1||item.PRJT_STATUS eq 2}"><font color="#c0c0c0">提交</font></c:when><c:otherwise><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=projectManage.selectProjectForShow&FLAG=1&prjt_id=${item.PRJT_ID }'">提交</a></c:otherwise></c:choose>|<c:choose><c:when test="${item.PRJT_STATUS eq 1||item.PRJT_STATUS eq 2}"><font color="#c0c0c0">删除</font></c:when><c:otherwise><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=projectManage.deleteProject&prjt_id=${item.PRJT_ID }'">删除</a></c:otherwise></c:choose></td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>
			<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u620.gif">
							未提交
							<img src="${ctx }/images/u611.gif">
							已提交
							<img src="${ctx }/images/u608.gif">
							受理
							<img src="${ctx }/images/u617.gif">
							已驳回&nbsp;
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