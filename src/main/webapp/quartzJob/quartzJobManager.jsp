<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>Job管理</title>

<script type="text/javascript" src="${ctx }/decompose/js/fillCustInfo.js"></script>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
<script type="text/javascript">

function changeJobStatus(job_id, run_flag){
	if(confirm("确定要这么做吗？")){
		$("#job_id").val(job_id);
		$("#run_flag").val(run_flag);
		$("#__action").val("jobCommand.updateJobRunFlag");
		$("#form1").submit();
	}
}

function showJobDetail(job_id){
	$("#pactAffix_" + job_id).toggle(function(){
        $(this).load("../servlet/defaultDispatcher?__action=jobCommand.showJobDetail&jobName=" + job_id);
    });
}

</script>
<style type="text/css">
	.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px;}
</style>
</head>
<body>
<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="${__action }" />
	<input type="hidden" id="job_id" name="job_id"/>
	<input type="hidden" id="run_flag" name="run_flag"/>

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;Job管理</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
			<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	      <tr>
	      <td width="65">&nbsp;</td>
	        <td width="60" class="ss_o">&nbsp;</td>
	        <td width="439" class="ss_t">&nbsp;&nbsp;
	          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"><br>
	          &nbsp;&nbsp;&nbsp;<input type="text" name="min" value="${min }" style="width:40px;height:20px;" onkeyup="value=value.replace(/[^\d]/g,'')"><font color="red">分钟以内会跑的Job</font> 
	        </td>
	        <td width="55" class="ss_th" valign="top">&nbsp;</td>
	        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
	      </tr>
	    </table>
	    </div>
<br/>
<font color="red">${errorMsg_rej}</font><br>
<div class="ui-state-default ui-jqgrid-hdiv ">

	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr >
			<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
		</tr>
	</table>
<table class="grid_table">
	<thead>
	<tr>
		<th style="width: 1%;">编号</th>
		<th style="width: 2%;">状态</th>
		<th style="width: 4%;">Job Name</th>
		<th style="width: 4%;">Job Description</th>
		<!-- <th style="width: 4%;">Job Group</th> -->
		<th style="width: 4%;">启动时间</th>
		<th style="width: 4%;">暂停时间</th>
		<th style="width: 4%;">上次执行时间</th>
		<th style="width: 4%;">本次执行时间</th>
		<th style="width: 4%;">下次执行时间</th>
		<th style="width: 4%;">操作</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="job" varStatus="index">
		<tr <c:if test="${job.FLAG eq 'N' }">style="color:red;"</c:if>>
			<td>${index.count }&nbsp;</td>
			<td><c:if test="${job.RUN_FLAG == 0 }">正常</c:if><c:if test="${job.RUN_FLAG == 1 }">暂停</c:if>&nbsp;</td>
			<td><a href="javascript:void(0);" onclick="showJobDetail('${job.JOB_NAME }');">${job.JOB_NAME }</a>&nbsp;</td>
			<td>${job.DESCRIPTION }&nbsp;</td>
			<%-- <td>${job.JOB_GROUP }&nbsp;</td> --%>
			<td><fmt:formatDate value="${job.START_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><fmt:formatDate value="${job.STOP_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><fmt:formatDate value="${job.PREVIOUS_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><fmt:formatDate value="${job.THIS_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><fmt:formatDate value="${job.NEXT_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td><c:if test="${job.RUN_FLAG == 0 }"><a href="javascript:void(0);" onclick="changeJobStatus(${job.ID}, '1');">[暂停]</a>&nbsp;&nbsp;</c:if><c:if test="${job.RUN_FLAG == 1 }"><a href="javascript:void(0);" onclick="changeJobStatus(${job.ID}, '0');">[启动]</a>&nbsp;&nbsp;</c:if></td>
		</tr>
		<tr>
			<th colspan="10" align="center" style="height: 0px; padding: 0px;">
				<div id="pactAffix_${job.JOB_NAME }" align="center"
					style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none;
					width: 50%;">
					<img src="${ctx }/images/loading.gif">
				</div>
			</th>
		</tr>
	</c:forEach>
	</tbody>
</table>
	<page:pagingToolbar pagingInfo="${pagingInfo }"/>
</div>
</div>
</div>
</form>
</body>
</html>