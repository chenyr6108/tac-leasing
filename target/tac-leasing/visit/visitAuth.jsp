<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务主管审核</title>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#grid-data td{text-align: center;}
</style>	 
<script type="text/javascript">
	
	$(function (){
		$("#search_status").val('${search_status}' == '' ? '0' : '${search_status}');
	});
	
	function visitPass(visit_id, credit_id, auth_date_str, credit_special_name){
		//if (confirm("确定要这么做吗？")) {
			$("#auth_type").val("Pass");
			$("#visit_id").val(visit_id);
			$("#credit_id").val(credit_id);
			$("#auth_date_str").val(auth_date_str);
			//$("#authForm").submit();
			$("#authForm_div").dialog({modal:true, autoOpen:false, width:500});
			$("#auth_memo").attr("disabled", false);
			$("#auth_memo").val("");
			$("#sumBut_rej").show();
			
			if(credit_special_name == ""){
				$("#sg_text").text("无专案");
				$("#sg_check").attr("disabled", "disabled");
			} else {
				$("#sg_text").text("（" + credit_special_name + "）");
				$("#sg_check").attr("disabled", "");
			}
			
			$("#authForm_div").dialog("open");
		//}
		
	}
	
	function visitReject(visit_id, credit_id, auth_date_str, credit_special_name){
		var url = "../servlet/defaultDispatcher";
		var data = {"__action" : "visitCommand.getCreditState",
					"credit_id" : credit_id};
		$.getJSON(url, data, function (rs){
			if(rs.state == 1){
				alert("案件已提交审查，无法驳回，如无需访厂，请走免访厂流程。");
			} else {
				$("#auth_type").val("Reject");
				$("#visit_id").val(visit_id);
				$("#credit_id").val(credit_id);
				$("#auth_date_str").val(auth_date_str);
				//$("#authForm").submit();
				$("#authForm_div").dialog({modal:true, autoOpen:false, width:500});
				$("#auth_memo").attr("disabled", false);
				$("#auth_memo").val("");
				$("#sumBut_rej").show();
				if(credit_special_name == ""){
					$("#sg_text").text("无专案");
					$("#sg_check").attr("disabled", "disabled");
				} else {
					$("#sg_text").text("（" + credit_special_name + "）");
					$("#sg_check").attr("disabled", "disabled");
				}
				$("#authForm_div").dialog("open");
			}
		});
	}
	
	function getCredit(credit_id){
		var url = "${ctx }";
		window.parent.openCredit(url,"creditReport.selectCreditForShow&credit_id=" + credit_id);
	}
	
	function showRejectReason(visit_id){
		$("#pactAffix_" + visit_id).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=visitCommand.showRejectReason&visit_id=" + visit_id);
	    });
	}
	
	function showAuthMemo(visit_id){
		var url = "${ctx }/servlet/defaultDispatcher";
		var data = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
		$.post(url, data, function (result){
			if(result.resultFlag == "true"){
				$("#auth_memo").val(result.resultData.auth_memo);
				$("#auth_memo").attr("disabled", true);
				$("#sumBut_rej").hide();
				$("#authForm_div").dialog({modal:true, autoOpen:false, width:500});
				$("#authForm_div").dialog("open");
			}
		}, "json");
	}
</script>
</head>
<body>
<form action="../servlet/defaultDispatcher" id="form1" method="post">
<input type="hidden" name="__action" value="visitCommand.authVisit"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业务主管审核</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	      <tr>
	      <td width="65">&nbsp;</td>
	        <td width="60" class="ss_o">&nbsp;</td>
	        <td width="439" class="ss_t">
	        	&nbsp;&nbsp;状态：&nbsp;<select name="search_status" id="search_status"><option value="2">全部</option><option value="0">未审批</option><option value="1">已审批</option></select>
	        	&nbsp;&nbsp;<input type="text" name="search_content" value="${search_content }" style="width:395px; height:20px;"></td>
	        <td width="55" class="ss_th" valign="top">&nbsp;</td>
	        <td><a href="#" name="search" id="search"  class="blue_button" onclick="$('#form1').submit();">搜 索</a></td>
	      </tr>
	    </table>
	    </div>
<br/>
<div class="ui-state-default ui-jqgrid-hdiv ">
<font color="red"><b>${errorMsg }</b></font>
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
			<strong>状态</strong>
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
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="BUSI_HOPE_VISIT_DATE"><strong>申请访厂时间</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="VISIT_AREA"><strong>申请访厂区域 </strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREATE_DATE"><strong>提交时间</strong></page:pagingSort>
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			<page:pagingSort pagingInfo="${pagingInfo }" orderBy="AUTH_DATE"><strong>审核时间 </strong></page:pagingSort>
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
			<td><c:choose><c:when test="${item.VISIT_STATUS < 0 }"><img src="${ctx }/images/u617.gif"></c:when><c:when test="${item.VISIT_STATUS > 0 }"><img src="${ctx }/images/u611.gif"></c:when><c:otherwise><c:choose><c:when test="${item.MEMO_COUNT > 0 }"><a href="javascript:void(0);" onclick="showRejectReason('${item.VISIT_ID}');"><img src="${ctx }/images/u614.gif" ></a></c:when><c:otherwise><img src="${ctx }/images/u608.gif"></c:otherwise></c:choose></c:otherwise></c:choose></td>
			<td>${item.TYPE }&nbsp;</td>
			<td>${item.CREDIT_RUNCODE }&nbsp;</td>
			<td>${item.CUST_NAME }&nbsp;</td>
			<td>${item.DECP_NAME_CN } &nbsp;</td>
			<td>${item.UP_NAME } &nbsp;</td>
			<td>${item.NAME } &nbsp;</td>
			<td>${item.BUSI_HOPE_VISIT_DATE }&nbsp;<c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 1}">上午</c:if><c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 2}">下午</c:if><c:if test="${item.BUSI_HOPE_VISIT_DATE_TIME == 0}">全天</c:if></td>
			<td>${item.VISIT_AREA } &nbsp;</td>
			<td><fmt:formatDate value="${item.CREATE_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="showAuthMemo('${item.VISIT_ID}')"><fmt:formatDate value="${item.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm:ss"/></a>&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="getCredit('${item.ID}');">[查看]</a></td>
			<td>
				<c:if test="${item.VISIT_STATUS == 0}">
					<a href="javascript:void(0);" onclick="visitPass('${item.VISIT_ID}', '${item.ID}', '<fmt:formatDate value="${item.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm:ss SSS"/>', '${item.CREDIT_SPECIAL_NAME }')">[通过]</a>
					&nbsp;&nbsp;
					<a href="javascript:void(0);" onclick="visitReject('${item.VISIT_ID}', '${item.ID}', '<fmt:formatDate value="${item.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm:ss SSS"/>', '${item.CREDIT_SPECIAL_NAME }')">[驳回]</a>
				</c:if>&nbsp;
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="10" align="center">
				<div id="pactAffix_${item.VISIT_ID}" align="center"
					style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
					<img src="${ctx }/images/loading.gif">
				</div>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<font color="red"><b>*</b>&nbsp;&nbsp;</font>
				<font color="red" size="-6" style="font-weight: bold;">点击“审核时间”可以查看业务主管的审批意见。</font>
			</td>
			<td align="right">
				<img src="${ctx }/images/u608.gif">
				待审批&nbsp;
				<img src="${ctx }/images/u611.gif">
				业务主管通过&nbsp;
				<img src="${ctx }/images/u617.gif">
				业务主管驳回&nbsp;
				<img src="${ctx }/images/u614.gif" >
				审查驳回(点击查看原因)&nbsp;
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>
</form>

<div style="display:none;" id="authForm_div" title="请输入意见">
<form action="../servlet/defaultDispatcher" id="authForm" method="post">
	<input type="hidden" name="__action" value="visitCommand.doAuthVisit"/>
	<input type="hidden" name="auth_type" id="auth_type"/>
	<input type="hidden" name="visit_id" id="visit_id"/>
	<input type="hidden" name="credit_id" id="credit_id"/>
	<input type="hidden" name="auth_date_str" id="auth_date_str">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table class="panel_table">
			<tr>
				<th style="text-align: center;"><strong>专案免访厂：<br/></strong></th>
				<td>
					<input type="checkbox" name="non_visit" id="sg_check" value="1">
					<span id="sg_text"></span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;"><strong>意见：<br/></strong><font color="red" size="-2">(非必填)</font></th>
				<td><textarea name="auth_memo" id="auth_memo" cols="55" rows="5"></textarea></td>
			</tr>
			<tr>
				<th colspan="2" id="button_flag" style="text-align: center;">
					<input type="button" id="sumBut_rej" value="确&nbsp;定" onclick="$(this).attr('disabled', true);$('#authForm').submit();" class="panel_button" >
					<input type="button" value="关&nbsp;闭" onclick="$('#authForm_div').dialog('close');" class="panel_button">
				</th>
			</tr>
		</table>
	</div>
</form>
</div>

</body>
</html>