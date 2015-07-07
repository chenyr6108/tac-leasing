<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审批</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	<script type="text/javascript">	
	function creditfile(id) {
		$("#creditfile").toggle(
				function() {
					$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReport.queryRentFile&prcd_id="+id+"&cardFlag=0"+"&rentFileFlag=2");
				});	
		$('#creditfile').dialog({
			modal:true,
			autoOpen: false,
			width: 830
		});	
		$('#creditfile').dialog('open');
	  }	
	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="creditReport.creditExamine">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" name="rentFileFlag" id="rentFileFlag" value="2">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报告审批</span>
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
					<!-- 类型： -->
					</td>
					<td>
					<!--
					<c:set var="type11" value=""></c:set>
					<c:set var="type12" value=""></c:set>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
					<c:if test="${credit_type eq -1}">
						<c:set var="type11" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq -2}">
						<c:set var="type12" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 2}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>					
					<select name="credit_type" style=" height: 18px;">
						<%-- <option value="-2"${type12}>
							全部
						</option>
						<option value="0"${type0}>
							调查中
						</option> --%>
						<option value="3"${type3}>
							提交主管
						</option>
						<%-- <option value="1"${type1}>
							主管通过
						</option>
						<option value="2"${type2}>
							主管驳回
						</option>
						<option value="-1"${type11}>
							项目撤销
						</option> --%>
					</select>
					-->
					</td>
					<%-- <td>
					报告类型：
					</td>
					<td>
					<c:set var="type111" value=""></c:set>
					<c:set var="type110" value=""></c:set>
					<c:set var="type113" value=""></c:set>
					<c:if test="${creditStauts eq 0}">
						<c:set var="type110" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${creditStauts eq -1}">
						<c:set var="type111" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${creditStauts eq -3}">
						<c:set var="type113" value="selected='selected'"></c:set>
					</c:if>					
					<select name="creditStauts" style=" height: 18px;">
						<option value="-3"${type113}>
							全部
						</option>
						<option value="0"${type110}>
							正常
						</option>
						<option value="-1"${type111}>
							作废
						</option>
					</select>
					</td> --%>
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
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table style="width: 100%;">
				<tr >
					<td> </td>
					<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
				</tr>
			</table>

			<table class="grid_table">
				<tr>
					<th width="4%">
						<strong>状态 </strong>
					</th>
					<th>
						<strong>标签 </strong>
					</th>
					<th>
						<strong>资信类型 </strong>
					</th>
					<th>
						<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="PROVINCE" pagingInfo="${pagingInfo }"><strong>区域 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo }"><strong>办事处主管 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo }"><strong>客户经理 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="WIND_STATE" pagingInfo="${pagingInfo }"><strong>风控纪要 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="CREATE_DATE" pagingInfo="${pagingInfo }"><strong>生成时间 </strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort orderBy="VISIT_DATE" pagingInfo="${pagingInfo }"><strong>访厂时间 </strong></page:pagingSort>
					</th>
					<th>
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item">
					<tr>
						<td style="text-align: center;"><c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="主管驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="主管通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
						<td style="text-align: center;padding-top: 4px;">
							<c:forEach  items="${item.TAGS }" var="tag">
								&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
							</c:forEach>&nbsp;						
						</td>
						<td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON }</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
						<!-- Modify by Michael 2012 1/5去除资信报告的修改功能 -->
						<!--
						<td style="text-align: center;"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a>|<c:choose><c:when test="${item.STATE eq 3 and item.STATUS eq 0}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a></c:when><c:otherwise><font color="#c0c0c0">修改</font></c:otherwise></c:choose>|<c:choose><c:when test="${item.STATE eq 3 and item.STATUS eq 0}"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }&examineFlag=1'">审批</a></c:when><c:otherwise><font color="#c0c0c0">审批</font></c:otherwise></c:choose>|<c:if test="${item.STATUS eq 0}"><c:choose><c:when test="${item.STATE eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.invCredit&credit_id=${item.ID }'">作废</a></c:when><c:otherwise><font color="#c0c0c0">作废</font></c:otherwise></c:choose></c:if><c:if test="${item.STATUS eq -1}"><c:choose><c:when test="${item.STATE eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.enaCredit&credit_id=${item.ID }'">启用</a></c:when><c:otherwise><font color="#c0c0c0">启用</font></c:otherwise></c:choose></c:if>|<a href="javascript:void(0)" onclick="creditfile('${item.ID}');">资料</a> </td>
						-->
						<td style="text-align: center;"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a>|<c:choose><c:when test="${item.STATE eq 3 and item.STATUS eq 0}"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }&examineFlag=1'">审批</a></c:when><c:otherwise><font color="#c0c0c0">审批</font></c:otherwise></c:choose><%--作废启用废除,加入到业务支撑 |<c:if test="${item.STATUS eq 0}"><c:choose><c:when test="${item.STATE eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.invCredit&credit_id=${item.ID }'">作废</a></c:when><c:otherwise><font color="#c0c0c0">作废</font></c:otherwise></c:choose></c:if><c:if test="${item.STATUS eq -1}"><c:choose><c:when test="${item.STATE eq 3}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.enaCredit&credit_id=${item.ID }'">启用</a></c:when><c:otherwise><font color="#c0c0c0">启用</font></c:otherwise></c:choose></c:if> --%>|<a href="javascript:void(0)" onclick="creditfile('${item.ID}');">资料</a> </td>
			
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<table class="STYLE2" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
						<img src="${ctx }/images/u611.gif">
							提交主管&nbsp;&nbsp;&nbsp;
						<!-- 
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							提交主管
							<img src="${ctx }/images/u614.gif">
							主管驳回
							<img src="${ctx }/images/u622.gif">
							主管通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
						 -->
						</td>
					</tr>
					<tr>
						<td align="right">
								<c:forEach items="${tags}" var="tag" varStatus="position">
									<img src="${ctx }/images/tags/${tag.tagColor }.png" style="position:relative;top:4px;" title="${tag.comments}"/>			
									${tag.tagName } &nbsp;
								</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
				</div>
			</div>		
		</form> 
			<div id="creditfile" align="center" title="资料管理" style="display: none; text-align:center; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>			
	</body>
</html>