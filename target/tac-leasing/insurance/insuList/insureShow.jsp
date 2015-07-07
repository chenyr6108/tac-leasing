<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>查看保单</title>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">

		</script>
		<script type="text/javascript">
			$(function (){
				$("#affirmInsuDate").datepicker($.datepicker.regional['zh-CN']);
				$("#affirmSeizeDate").datepicker($.datepicker.regional['zh-CN']);
				$("#printInsuDate").datepicker($.datepicker.regional['zh-CN']);
				$("#insu_start_date").datepicker($.datepicker.regional['zh-CN']);
				$("#insu_end_date").datepicker($.datepicker.regional['zh-CN']);
				$(".dateText").datepicker($.datepicker.regional['zh-CN']);
			});
			
			function saveInsuInfo(e){
				$(e).hide();
				if($("#insu_start_date").val() == ""){
					alert("请填写保单开始日期。");
					$(e).show();
					return false;
				}
				if($("#insu_end_date").val() == ""){
					alert("请填写保单结束日期。");
					$(e).show();
					return false;
				}
				if($("#insuPrice").val() == ""){
					alert("保险费不正确。");
					$(e).show();
					return false;
				}
				$("#form").submit();
			}
			function changeInsuFee(){
				var insu_start_date_str = $("#insu_start_date").val();
				var insu_end_date_str = $("#insu_end_date").val();
				var insuAmount = "${insu.insuAmount }";
				var insuRate = parseFloat("${insu.insuRate}");
				if(insuAmount == 0){
					$("#insuPrice").val("0");
				} else {
					var s = insu_start_date_str.split("-");
					var insu_start_date = new Date(s[0], s[1] - 1, s[2]);
					var e = insu_end_date_str.split("-");
					var insu_end_date = new Date(e[0], e[1] - 1, e[2]);
					if(insu_end_date < insu_start_date){
						alert("结束日期必须大于开始日期。");
						$("#insuPrice").val("");
						return;
					}
					var dayDiff = parseInt(Math.abs(insu_end_date - insu_start_date) / 1000 / 60 / 60 /24);
					var insuPrice = (insuAmount * (insuRate / 1000)) / 365 * (dayDiff + 1);
					$("#day_diff").text(dayDiff + 1);
					$("#insuPrice").val(insuPrice.toFixed(2));
				}
			}
			
			function saveList(e){
				$(e).attr("disabled", true);
				if($("input:checkbox:checked").length == 0){
					alert("请至少选择一个批单类型！");
					$(e).attr("disabled", false);
				} else {
					$("#action").val("insuranceCommand.addEndorsements");
					$("#form").submit();
				}
			}
			
			function saveListCode(e, id){
				$(e).attr("disabled", true);
				$("#id").val(id);
				$("#listCode").val($("#listCode_" + id).val());
				$("#getTime").val($("#getTime_" + id).val());
				$("#remark").val($("#remark_" + id).val());
				$("#saveForm").submit();
				$(e).attr("disabled", false);
			}
		</script>
	</head>
	<body >
		
		<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" id="action" value="insuranceCommand.updateInsuInfo">
			<input type="hidden" name="insuId" value="${insu.insuId }">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保单</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险信息</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="width: 10%; text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险公司</th>
					<td style="width: 40%;">${insu.incpName }</td>
					<th style="width: 10%; text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">费率(%)</th>
					<td style="width: 40%;">${insu.insuRate }</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保单号</th>
					<td colspan="3"><input type="text" name="insuCode" id="insuCode" value="${insu.insuCode}" style="width: 200px;" <c:if test="${action_model != 'update' }">disabled="disabled"</c:if>/></td>
				</tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">商业险投保期限</th>
					<td colspan="3">开始时间：
						<input type="text" name="insu_start_date" id="insu_start_date" 
							style="width: 90px;"
							value="<fmt:formatDate value='${insu.insuStartDate }' pattern='yyyy-MM-dd'/>" 
							<c:if test="${action_model != 'update' }">disabled="disabled"</c:if>
							onchange="changeInsuFee();" />
						&nbsp;00：00时起，至 结束时间：
						<input type="text" name="insu_end_date" id="insu_end_date" 
							style="width: 90px;"
							value="<fmt:formatDate value="${insu.insuEndDate }" pattern="yyyy-MM-dd"/>" 
							<c:if test="${action_model != 'update' }">disabled="disabled"</c:if>
							onchange="changeInsuFee();" />
						&nbsp;24：00时止，共
						<span id="day_diff">${insu.dayDiff }</span>天</td>
	
			    </tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="13" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险项目及保险金额</td>
				</tr>
				<tr >
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险金额</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">费率（‰）</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险费</th>
					
				
				</tr>
				<c:forEach items="${eqmtList}" var="e" varStatus="status">
					<tr>					
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.THING_NAME }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><fmt:formatNumber value="${e.UNIT_PRICE }" type="currency"/>&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${insu.insuRate}</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><fmt:formatNumber value="${e.UNIT_PRICE * insu.insuRate / 1000 / 365 * insu.dayDiff }" type="currency"/>&nbsp;</td>
					</tr>
				</c:forEach>
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保险总金额</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${insu.insuAmount }" type="currency"/></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">总保险费</th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><input name="insuPrice" id="insuPrice" value="<fmt:formatNumber value='${insu.insuPrice }' pattern='##0.00'/>" id="insuPrice" <c:if test="${action_model != 'update' }">disabled="disabled"</c:if>/></th>
				
				</tr>
			</table>
			<%-- <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">投保确认时间：<input type="text" value="${insu.affirmInsuDate }" name="affirmInsuDate" id="affirmInsuDate" <c:if test="${action_model != 'update' }">disabled="disabled"</c:if> /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">缴费确认时间：<input type="text" value="${insu.affirmSeizeDate }" name="affirmSeizeDate" id="affirmSeizeDate" <c:if test="${action_model != 'update' }">disabled="disabled"</c:if> /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保单打印时间：<input type="text" value="${insu.printInsuDate }" name="printInsuDate" id="printInsuDate" <c:if test="${action_model != 'update' }">disabled="disabled"</c:if>  /></th>
				</tr>
			</table> --%>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">设备信息</td>
				</tr>
				<tr>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备厂商</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备单价</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">机号</th>
					<th style="width:25%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险物所在地址</th>
				</tr>
				<c:forEach items="${eqmtList}" var="e" varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.THING_NAME }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.MODEL_SPEC }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.BRAND}&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><fmt:formatNumber value="${e.UNIT_PRICE}" type="currency"/>&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.THING_NUMBER}&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${e.EQUPMENT_ADDRESS }&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px; text-align: left;">批单状态</th>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="width: 10%;">
						批单类型
					</td>
					<td style="width: 10%;">
						<c:forEach items="${listType}" var="t">
							<div style="vertical-align:middle ; line-height: 16px;">
								<input type="checkbox" name="type" value="${t.code }" style="vertical-align:middle ;" />${t.flag }
							</div>
						</c:forEach>
					</td>
					<td align="left" style="width: 80%;">
						<input type="button" value="提交" onclick="saveList(this);" style="height: 30px; width: 60px;" />
					</td>
			   	</tr>
			   	<tr>
					<td colspan="3">
						<table class="grid_table">
							<tr>
								<th style="width: 3%">序号</th>
								<th style="width: 10%">批单类型</th>
								<th style="width: 10%">批单状态</th>
								<th style="width: 10%">提交时间</th>
								<th style="width: 5%">提交人</th>
								<th style="width: 10%">批单号</th>
								<th style="width: 10%">批单时间</th>
								<th style="width: 37%">备注</th>
								<th style="width: 5%">操作</th>
							</tr>
							<c:forEach items="${endorsements }" var="e" varStatus="ei">
								<tr>
									<td>${ei.count }</td>
									<td>${e.listType }</td>
									<td>
										<c:if test="${e.status == 0 }">
											批单未回
										</c:if>
										<c:if test="${e.status == 1 }">
											批单已回
										</c:if>
									</td>
									<td><fmt:formatDate value="${e.create_date }" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>${e.create_by }</td>
									<td>
										<c:choose>
											<c:when test="${e.status == 0 }">
												<input type="text" id="listCode_${e.id }" value="${e.listCode }" style="border: 1px solid #ABADB3; width: 100%; height: 22px;"/>
											</c:when>
											<c:otherwise>
												${e.listCode }
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${e.status == 0 }">
												<input type="text" id="getTime_${e.id }" value="<fmt:formatDate value="${e.getTime }" pattern="yyyy-MM-dd"/>" style="border: 1px solid #ABADB3; width: 100%; height: 22px;" class="dateText"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${e.getTime }" pattern="yyyy-MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${e.status == 0 }">
												<textarea id="remark_${e.id }" style="height: 36px; width: 100%; border: 1px solid #ABADB3;">${e.remark}</textarea>
											</c:when>
											<c:otherwise>
												<textarea disabled="disabled" style="height: 36px; width: 100%; border: 0px;">${e.remark}</textarea>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${e.status == 0 }">
												<input type="button" value="保存" onclick="saveListCode(this, '${e.id}');" class="ui-state-default ui-corner-all"/>
											</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
										
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
			   	</tr>
			</table>
			<center>
				<c:if test="${action_model eq 'update' }">
					<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="saveInsuInfo(this);" value="保   存" />
					&nbsp;&nbsp;&nbsp;
				</c:if>
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
		<form id="saveForm" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="insuranceCommand.saveListCode"/>
			<input type="hidden" name="insuId" value="${insu.insuId }">
			<input type="hidden" name="id" id="id"/>
			<input type="hidden" name="listCode" id="listCode"/>
			<input type="hidden" name="getTime" id="getTime"/>
			<input type="hidden" name="remark" id="remark"/>
		</form>
	</body>
</html>
