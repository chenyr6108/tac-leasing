<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/lockManagement/js/lockShow.js"></script>
		<title>锁码管理</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="lockManagement.show" />
			<input type="hidden" name="flag" value="2" />
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;锁码管理</span>
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
				          <td>提醒日：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 120px; height: 18px;" readonly="readonly"
								value="${end_date }">
							<td>&nbsp;</td>			
				         
					<!-- 去除锁码是否起租
					<td>是否起租:</td>
			        <td><select name="paydate_flag">
		          		<option value="">--请选择--</option>
		          		<option value="1" <c:if test="${paydate_flag eq 1 }">selected="selected"</c:if>>是</option>
		          		<option value="0" <c:if test="${paydate_flag eq 0 }">selected="selected"</c:if>>否</option>
		          	</select> 
			        </td> 
			        -->
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;">
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
						<td></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							承租人名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							支付表号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							当月是否锁码
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							支付时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							提醒日期
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							明细
						</th>
					</tr>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							${status.count }
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							${item.CUST_NAME }
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							${item.LEASE_CODE }&nbsp;
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							${item.RECP_CODE }&nbsp;
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							${item.THING_NAME }
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							<c:choose>
								<c:when test="${item.NUM == 0 }">
									<c:choose>
										<c:when test="${item.ISUNLOCK == 1 }">
											<font color="red">
												<c:if test="${item.ISUNLOCK ==1}">否</c:if>
												<c:if test="${item.ISUNLOCK ==0}">是</c:if>
											</font>
										</c:when>
										<c:otherwise>
											<font color="green">
												<c:if test="${item.ISUNLOCK ==1}">否</c:if>
												<c:if test="${item.ISUNLOCK ==0}">是</c:if>
											</font>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${item.ISUNLOCK == 1 }">
											<c:if test="${item.ISUNLOCK ==1}">否</c:if>
											<c:if test="${item.ISUNLOCK ==0}">是</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${item.ISUNLOCK ==1}">否</c:if>
											<c:if test="${item.ISUNLOCK ==0}">是</c:if>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/>&nbsp;
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							<fmt:formatDate value="${item.REMIN_DAY }" pattern="yyyy-MM-dd"/>&nbsp;
						</td>
						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
							<a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${item.RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a>
						</td>
					</tr>
					</c:forEach>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>