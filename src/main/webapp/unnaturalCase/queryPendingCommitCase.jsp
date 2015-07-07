<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>访厂逾14天未提交审查</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	function showcreditMemo(credit_id) {
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {
				  "__action" : "creditReportVip.getCreditMemo",
				  "credit_id" : credit_id,
		  };
		  $.post(url, param, function (data){
			  var bodyHtml = "";
			  if(data.length > 0){
				  $.each(data, function (i){
					  bodyHtml += "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
						"<td style=\"text-align: center;\">" + data[i].create_date_str.substring(0, 19) + "&nbsp;</td>" + 
						"<td style=\"text-align: center;\">" + data[i].create_by + "&nbsp;</td>" + 
						"<td style=\"text-align: center;\">" + data[i].content + "&nbsp;</td>" + 
						"</tr>";
				  });
				  if (data.length == 10) {
					  bodyHtml += "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
					  	"<td style=\"text-align: right;\" colspan=\"3\">" +
					  	"<a href=\"javascript:void(0);\" onclick=\"openPath('creditReportVip.getCreditMemoAll&credit_id=" + credit_id + "');\">更多...</a>" + 
					  	"</td>" + 
					  	"</tr>";
				}
			  } else {
				  bodyHtml = "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
						"<td style=\"text-align: center;\" colspan=\"3\">无备注！&nbsp;</td>" + 
						"</tr>";
			  }
			  $("#memo_body").html(bodyHtml);
			  $("#credit_memo").dialog({modal:true,autoOpen:false,width:600});
			  $("#credit_id_memo").val(credit_id);
			  $("#credit_memo").dialog("open");
		  }, "json");
		}
		
		function saveCreditMemo(e) {
			$(e).attr("disabled", true);
			if($.trim($("#memo_credit").val()) == ""){
				$(e).attr("disabled", false);
				return false;
			} else {
				var url = "${ctx }/servlet/defaultDispatcher";
				var param = {
				  "__action" : "creditReportVip.addCreditMemo",
				  "credit_id" : $("#credit_id_memo").val(),
				  "memo" : $("#memo_credit").val(),
				};
				$.post(url, param, function (data){
				 if(data){
				  $("#memo_credit").val("");
				  $(e).attr("disabled", false);
				  showcreditMemo($("#credit_id_memo").val());
				 }
				}, "json");
			}
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="unnaturalCaseCommand.queryPendingCommitCase">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;访厂逾14天未提交审查(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;17:30:00)</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td>
									时间：
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
									办事处：
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
						</table></td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a>
					</td>
				</tr>
			</table>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="creditRunCode" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="custName" pagingInfo="${pagingInfo }"><strong>客户名称</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="upName" pagingInfo="${pagingInfo }"><strong>业务主管</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="visitDate" pagingInfo="${pagingInfo }"><strong>实际访厂日</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="createOn" pagingInfo="${pagingInfo }"><strong>访厂报告提交日</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="dayDiff" pagingInfo="${pagingInfo }"><strong>距今天数</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="leaseRze" pagingInfo="${pagingInfo }"><strong>融资额</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>增提资料 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>备注 </strong>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: center;">${item.creditRunCode }&nbsp;</td>
						<td style="text-align: center;">${item.custName }&nbsp;</td>
						<td style="text-align: center;">${item.name }&nbsp;</td>
						<td style="text-align: center;">${item.upName }&nbsp;</td>
						<td style="text-align: center;">${item.visitDate }&nbsp;</td>
						<td style="text-align: center;">${item.createOn }&nbsp;</td>
						<td style="text-align: right;">${item.dayDiff }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value="${item.leaseRze }" type="currency"/>&nbsp;</td>
						<td style="text-align: center;">${item.recordRemark }&nbsp;</td>
						<td style="text-align: center;"><a href="javascript:void(0)" onclick="showcreditMemo('${item.creditId}');">备注</a></td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
<!-- 备注窗口 -->
<div style="display:none;" id="credit_memo" title="案件备注">
	<form action="${ctx }/servlet/defaultDispatcher?__action=creditReportVip.addCreditMemo" method="post" id="credit_memo_form">
	<input type="hidden" id="credit_id_memo" name="credit_id">
	<input type="hidden" id="url" name="url" value="${ctx }"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div>
				<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 80px;">
							备注时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
							备注人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							备注
						</th>
					</tr>
					<tbody id="memo_body">
					</tbody>
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;" colspan="3">&nbsp;</td>
					</tr>
					<tfoot>
						<tr class="ui-jqgrid-labels" style="height: 25px;">
							<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="3" align="left">
								<b>新增备注</b>
							</th>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td colspan="3"><textarea rows="3" cols="90" name="memo" id="memo_credit"></textarea></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td colspan="3" align="center" style="text-align: center;"><input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" onclick="saveCreditMemo(this);" /></td>
						</tr>
					</tfoot>
				</table>
			</div>
		  </div>
    </div>
    </form>
</div>
</body>