<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访厂申请</title>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px;}
	.tb_return_t{width: 100px; height: 22px;}
	#grid-data td{text-align: center;}
</style>	
<script type="text/javascript">
	$(function (){
		$("#visit_date").datepicker($.datepicker.regional['zh-CN']);
		var errorMsg = "${errorMsg}";
		var credit_id = "${visitationTo.credit_id}";
		if(errorMsg != ""){
			if(credit_id == ""){
				alert("操作失败！\n\t" + errorMsg);
			} else {
				applyVisit(credit_id);
				$("#visit_area").val('${visitationTo.visit_area}');
				$("#visit_date").val('${visitationTo.hope_visit_date_str}');
				$("#visit_time").val('${visitationTo.hope_visit_time}');
				$("#errorMsg").text(errorMsg);
			}
		}
	});

	function applyVisit(credit_id){
		$("#errorMsg").text("");
		$("#visit_area").attr("disabled", false);
		$("#visit_date").attr("disabled", false);
		$("#visit_time").attr("disabled", false);
		$("#applyVisit_div").find("input[type='text']").each(function (){
			$(this).val("");
		});
		$("#visit_time").val("0");
		$("#sumBut").show();
		$("#applyVisit_div").dialog({modal:true, autoOpen:false, width:500});
		$("#credit_id").val(credit_id);
		$("#applyVisit_div").dialog("open");
	}
	
	function showApplyVisit(visit_id){
		$("#errorMsg").text("");
		if(visit_id != null && visit_id != undefined){
			var url = "${ctx }/servlet/defaultDispatcher";
			var data = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
			$.post(url, data, function (result){
				if(result.resultFlag == "true"){
					$("#visit_area").val(result.resultData.visit_area);
					$("#visit_date").val(result.resultData.hope_visit_date_str);
					$("#visit_time").val(result.resultData.hope_visit_time);
					$("#visit_area").attr("disabled", true);
					$("#visit_date").attr("disabled", true);
					$("#visit_time").attr("disabled", true);
					$("#sumBut").hide();
					$("#applyVisit_div").dialog({modal:true, autoOpen:false, width:500});
					$("#applyVisit_div").dialog("open");
				}
			}, "json");
		}
	}
	
	function getCredit(credit_id){
		var url = "${ctx }";
		window.parent.openCredit(url,"creditReport.selectCreditForShow&credit_id=" + credit_id);
	}
	function apply_sub(e){
		$(e).attr("disabled", true);
		var visit_area = $("#visit_area").val();
		var visit_date = $("#visit_date").val();
		if(visit_area == ""){
			alert("请输入访厂区域！");
			$(e).attr("disabled", false);
			return false;
		}
		if(visit_date == ""){
			alert("请输入希望访厂时间！");
			$(e).attr("disabled", false);
			return false;
		}
		$("#doApplyForm").submit();
	}
	
</script> 
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="visitCommand.applyVisit"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;访厂申请</span>
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
			<strong>资信类型 </strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREDIT_RUNCODE"><strong>案件号 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CUST_NAME"><strong>客户名称 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="DECP_NAME_CN"><strong>办事处</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="UP_NAME"><strong>办事处主管 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="NAME"><strong>客户经理 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREATE_DATE"><strong>生成时间</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>资信调查报告</strong>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>操作 </strong>
		</th>
	</tr>
	</thead>
	<tbody id="grid-data">
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td>${index.count }&nbsp;</td>
			<td>${item.TYPE }&nbsp;</td>
			<td>${item.CREDIT_RUNCODE }&nbsp;</td>
			<td>${item.CUST_NAME }&nbsp;</td>
			<td>${item.DECP_NAME_CN } &nbsp;</td>
			<td>${item.UP_NAME } &nbsp;</td>
			<td>${item.NAME } &nbsp;</td>
			<td><fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="getCredit('${item.ID}');">[查看]</a></td>
			<td><c:choose><c:when test="${item.VISIT_STATUS == null }"><a href="javascript:void(0);" onclick="applyVisit('${item.ID}')">[申请访厂]</a>&nbsp;</c:when><c:otherwise><a href="javascript:void(0);" onclick="showApplyVisit('${item.VISIT_ID}');">[查看]</a>&nbsp;</c:otherwise></c:choose></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
</div>
</div>
</div>
</form>
<div style="display:none;" id="applyVisit_div" title="申请访厂">
	<font color="red" id="errorMsg"></font>
	<form action="../servlet/defaultDispatcher" method="post" id="doApplyForm">
	<input type="hidden" name="__action" value="visitCommand.doApplyVisit"/>
	<input type="hidden" name="visitationTo.credit_id" id="credit_id"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td width="23%"><strong>访厂区域：</strong><font color="red">*</font></td>
						<td width="77%"><input type="text" id="visit_area" name="visitationTo.visit_area" class="tb_return"/>&nbsp;<font color="red">(例：苏州市吴中区)</font></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td><strong>希望访厂日期：</strong><font color="red">*</font></td>
						<td><input type="text" id="visit_date" name="visitationTo.hope_visit_date_str" class="tb_return"/>&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td><strong>时间：</strong><font color="red">*</font></td>
						<td><select class="tb_return_t" id="visit_time" name="visitationTo.hope_visit_time">
							<option value="0">全天</option>
							<option value="1">上午</option>
							<option value="2">下午</option>
						</select></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2"><font color="red">下午3点前申请的，可申请次日访厂，如3点后申请，则只能申请隔日访厂。</font></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut" value="确&nbsp;定" onclick="apply_sub(this)" class="ui-state-default ui-corner-all" >
							<input type="button" value="关&nbsp;闭" onclick="$('#applyVisit_div').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</form>
</div>
</body>
</html>