<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异常案件</title>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px;}
	.tb_return_t{width: 100px; height: 22px;}
	#grid-data td{text-align: center;}
</style>	
<script type="text/javascript">
	function openPath(path){
		var url = $("#url").val();
		window.parent.openNewTab(url,path,'所有备注');
	}
	
	function showcreditMemo(credit_id){
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
	
	function saveCreditMemo(){
	  var url = "${ctx }/servlet/defaultDispatcher";
	  var param = {
			  "__action" : "creditReportVip.addCreditMemo",
			  "credit_id" : $("#credit_id_memo").val(),
			  "memo" : $("#memo_credit").val(),
	  };
	  $.post(url, param, function (data){
		  if(data){
			  $("#memo_credit").val("");
			  showcreditMemo($("#credit_id_memo").val());
		  }
	  }, "json");
	}
</script> 
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="anomalousProjectCommand.getAnomalousByNotCommitted"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;异常案件</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	      <tr>
	      <td width="65">&nbsp;</td>
	        <td width="60" class="ss_o">&nbsp;</td>
	        <td width="439" class="ss_t">&nbsp;&nbsp;
	          <input type="text" name="search_content" value="${search_content }" style="width:395px; height:20px;"></td>
	        <td width="55" class="ss_th" valign="top">&nbsp;</td>
	        <td><a href="#" name="search" id="search"  class="blue_button" onclick="$('#form1').submit();">搜 索</a></td>
	      </tr>
	    </table>
	    </div>
<br/>
<div class="ui-state-default ui-jqgrid-hdiv ">
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<tr >
		<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>序号</strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="creditRuncode"><strong>案件号 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="custName"><strong>客户名称 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="decpName"><strong>办事处</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="upperUser"><strong>区域主管 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="sensorUser"><strong>客户经理 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="realVisitDate"><strong>实际访厂日</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>融资额</strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>增提资料 </strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>备注</strong>
		</th>
	</tr>
	</thead>
	<tbody id="grid-data">
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td>${index.count }&nbsp;</td>
			<td>${item.creditRuncode }&nbsp;</td>
			<td>${item.custName }&nbsp;</td>
			<td>${item.decpName }&nbsp;</td>
			<td>${item.upperUser }&nbsp;</td>
			<td>${item.sensorUser }&nbsp;</td>
			<td><fmt:formatDate value="${item.realVisitDate }" pattern="yyyy-MM-dd"/>&nbsp;</td>
			<td><fmt:formatNumber type="currency" value="${item.leaseRze }"/>&nbsp;</td>
			<td>${item.addedInfo }&nbsp;</td>
			<td><a href="javascript:void(0)" onclick="showcreditMemo('${item.creditId}');">备注</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
</div>
</div>
</div>
</form>

<div>
	<%@ include file="/chartDirector/baseLineChart.jsp" %>
</div>

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
							<td colspan="3" align="center" style="text-align: center;"><input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" onclick="saveCreditMemo();" /></td>
						</tr>
					</tfoot>
				</table>
			</div>
		  </div>
    </div>
    </form>
</div>
</body>
</html>