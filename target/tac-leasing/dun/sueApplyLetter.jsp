<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibsNew.jsp"%>
<html>
<head>
<title>起诉申请单</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
	function apply(rectId,recpId,suplTrue,sueId,type){
		$("#showApplySue").dialog({
			at: "left bottom",
			modal:true,
			width: 970,
			height: 500,
			open: function(){
				$("#applySue").load("../servlet/defaultDispatcher?__action=litigationCommand.showSueApplyLetterInfo&rectId="+rectId+"&recpId="+recpId+"&suplTrue="+suplTrue+"&opType=" + type + "&sueId=" + sueId);
			}
		});
	}
	function closeDialog(msg){
		$(msg).dialog('close');
	}
	function submitserach() {
		var startrange = $("#startrange").val();
		var endrange = $("#endrange").val();
		if ((!endrange == "") || (!endrange == null)) {
			if (!checkInteger(endrange)) {
				alert("逾期天数查询请输入整数!");
				$("#endrange").focus();
				return false;
			}
		}
		if ((!startrange == "") || (!startrange == null)) {
			if (!checkInteger(startrange)) {
				alert("逾期天数查询请输入整数!");
				$("#startrange").focus();
				return false;
			}
		}
		$("#__currentPage").val("1");
		$("#form1").submit();
	}

	function checkInteger(checkStr) {
		var regex = /^[\+\-]?[\d]+$/;

		return regex.test(checkStr);
	}
	//查看起诉申请单
	function expand(rectId,recpId,suplTrue,sueId){
        $("#letter"+rectId).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=litigationCommand.showSueApplyLetterInfo&rectId="+rectId+"&recpId="+recpId+"&suplTrue="+suplTrue+"&sueId=" + sueId +"&opType=show");
        });
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" id="__action" name="__action" value="litigationCommand.querySueApplyLetter" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;起诉申请单</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px;">
								<tr>
									<td>查询日期：</td>
									<td><input type="text" name="dun_date" style="width: 80px; height: 18px;" readonly="readonly" id="dun_date" value="${dun_date }">
									<td>逾期天数：</td>
									<td><input type="text" name="startrange" id="startrange" style="width: 40px; height: 18px;" value="${startrange }">~
										<input type="text" name="endrange" id="endrange" style="width: 40px; height: 18px;" value="${endrange}"></td>
								</tr>
								<tr>
									<td>查询内容：</td>
									<td colspan="3"><input type="text" id="content" name="content" value="${content }" style="width: 240px; height: 18px; font-size: 12px;"></td>
									<td>业务员：</td>
									<td><input type="text" name="NAME" id="NAME" style="width: 100px; height: 18px;" value="${NAME }"></td>
								</tr>
							</table>

						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="searchs" id="searchs" onclick="submitserach();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr>
							<td align="right" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbarTop pagingInfo="${pagingInfo }" /></td>
						</tr>
					</thead>
				</table>
				<table class="grid_table" id="#table1">
					<thead>
						<tr>
							<th width="50">状态</th>
							<th width="50">合同号</th>
							<th width="100">承租人</th>
							<th width="50">业务员</th>
							<th width="50">主管</th>
							<th width="50">供应商名称</th>
							<th width="50">供应商责任</th>
							<th width="50">逾期天数 </th>
							<th width="40">查看</th>
							<th width="40">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagingInfo.resultList}" var="letter" varStatus="status">
							<tr>
								<td style="text-align:center;">
									${letter.STATE==null?"未申请":letter.STATE==1?"已驳回":letter.STATE==2?"单位主管审核中":letter.STATE==3?"部门主管审核中":letter.STATE==4?"总经理审核中":letter.STATE==5?"委寄":""}
								</td>
								<td style="text-align: center;">&nbsp;${letter.LEASECODE}</td>
								<td style="text-align: center;">&nbsp;${letter.CUSTNAME}</td>
								<td style="text-align: center;">&nbsp;${letter.NAME}</td>
								<td style="text-align: center;">&nbsp;${letter.UPNAME}</td>
								<td style="text-align: center;">&nbsp;${letter.BRAND}</td>
								<td style="text-align: center;">&nbsp;${letter.SUPLTRUE}</td>
								<td style="text-align: center;">&nbsp;${letter.DUNDAY}</td>
								<td style="text-align: center;">&nbsp;
									<input type="button" onclick="expand('${letter.RECTID}','${letter.RECPID}','${letter.SUPLTRUE}','${letter.SUEID }');" style="padding:0 10px;" class="ui-state-default ui-corner-all" value="查看">
								</td>
								<td style="text-align: center;">&nbsp;
									<c:if test="${letter.STATE==null && createAccess eq 'Y'}">
										<input type="button" onclick="apply('${letter.RECTID}','${letter.RECPID}','${letter.SUPLTRUE}','${letter.SUEID}','apply');" style="padding:0 10px;" class="ui-state-default ui-corner-all" value="申请">
									</c:if>
									<c:if test="${letter.STATE==2 && createAccess eq 'Y'}">
										<input type="button" onclick="apply('${letter.RECTID}','${letter.RECPID}','${letter.SUPLTRUE}','${letter.SUEID}','apply');" style="padding:0 10px;" class="ui-state-default ui-corner-all" value="修改">
									</c:if>
									<c:if test="${letter.STATE==null && createAccess eq 'N'}">未申请</c:if>
									<c:if test="${letter.STATE!=null && (createAccess eq 'N' || letter.STATE!=2)}">已申请</c:if>
								</td>
							</tr>
							<tr>
								<th style="text-align:center; height:0;" class="pact" colspan="10" align="center">
									<div id="letter${letter.RECTID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:70%"></div>
								</th>
							</tr>
						</c:forEach>
						</table>
						<table style="width: 100%;" cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td align="right" colspan="14" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbar pagingInfo="${pagingInfo }"/></td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	
	<div title="案件起诉申请单" style="display: none" id="showApplySue" >
		<form id="applySue" name="applySue" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=business.applySue">
		</form>
	</div>
</body>
</html>