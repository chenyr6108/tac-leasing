<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
	function addAlterUserList(){
		openLogandsee('addAlterUserDiv');
	}
	
	//打开弹出层
	function openLogandsee(divName) {
		$("#" + divName).dialog({
			autoOpen : false,
			width : 700
		});
		$("#" + divName).dialog('open');
	}
	function addAlterUserBut(){
		$("#addAlterUser").submit();
	}
	function saveAlter(){
		$("#form1").submit();
	}
	function updateCount(userId){
		if(confirm("确定要修改吗？")){
			var count =$("#count_"+userId).val(); 
			var url = "${ctx }/servlet/defaultDispatcher";
			var data = {__action : "modifyOrderCommand.updateCount", "COUNT" : count,"USER_ID":userId};
			
			$.post(url, data, function (result){
				if(result.resultFlag == "true"){
					//
					alert("更改成功");
				}
			}, "json");
		}
	}
</script>
</head>
<body>
		
		<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" value="modifyOrderCommand.updateAlterUser">
		<input type="hidden" name="id" id="id">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;width: 500px;">
			<span class="ui-jqgrid-title" style="line-height:30px;font-size:15px;">&nbsp;&nbsp;处理人员管理</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 500px;">
		<br>
		<input type="button" value="新增处理人员" onclick="addAlterUserList();" class="ui-state-default ui-corner-all"/>
		<br><br>
			<%-- <page:pagingToolbarTop pagingInfo="${users }"/> --%>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table" style="width: 500px;">
							<tr>
								<th><strong>用户名</strong></th>
								<th><strong>可否参与修改</strong></th>
								<th><strong>修改更改单基数</strong></th>
							</tr>
							<c:forEach items="${users.resultList}" var="alter">
								<tr>
									<td style="text-align: center;"><strong>${alter.NAME }</strong></td>
									<td style="text-align: center;"><input type="checkbox" name="USER_CHECK" value="${alter.USER_ID }" <c:if test="${alter.USER_STATUS eq 1 }">checked="checked"</c:if>/></td>
									<td style="text-align: center;"><strong><input type="text" value="${alter.COUNT}" id="count_${alter.USER_ID }" style="width: 50px;"/></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="修改" onclick="updateCount('${alter.USER_ID }')" class="ui-state-default ui-corner-all"/></td>
								</tr>
							</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 500px;">
							<tr><td colspan="3" align="center"><input type="button" value="保存" onclick="saveAlter()" class="ui-state-default ui-corner-all" style="font-size: 12px;"></td></tr>
						</table>
			<%-- <page:pagingToolbar pagingInfo="${users }"/> --%>
			</div>
	</form>
					<div title="处理单" style="display: none" id="addAlterUserDiv">
									<form id="addAlterUser" name="addAlterUser" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addAlterUser">
										<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
											<div class="zc_grid_body jqgrowleft">
												<div class="ui-state-default ui-jqgrid-hdiv ">
													<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td style="text-align: center" width="10%">请选择名单:</td>
															<td style="text-align: center; height: 50px;" width="90%"><select id="USER_ID" name="USER_ID" style="width: 150px"><option>请选择</option>
																	<c:forEach items="${userList}" var="user">
																		<option value="${user.ID }">${user.NAME}</option>
																	</c:forEach>
																</select></td>
														</tr>
													<tr class="ui-widget-content jqgrow ui-row-ltr">
														<td colspan="2" style="text-align: center; height: 30px;"
															width="100%"><input type="button" value="提交" onclick="addAlterUserBut()" class="ui-state-default ui-corner-all"/></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</form>
					</div>
	</body>
</html>