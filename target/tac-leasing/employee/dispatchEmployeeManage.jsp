<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>业管文审人员管理</title>
	<script type="text/javascript">
		function addDispaUser(){
			openLogandsee('addDispatchUserDiv');
		}
	
	//打开弹出层
	function openLogandsee(divName) {
		$("#" + divName).dialog({
			autoOpen : false,
			width : 700
		});
		$("#" + divName).dialog('open');
	}
	function addDispatchUserBut(){
		$("#addDispatchUser").submit();
	}
	function saveDispatch(){
	    var statusLengthC = $("input[name='statusLengthC']").val();
	    var regex = /^[\+\-]?\d+(\.\d+)?$/; 
	    var regex2 = /^\-\d+(\.\d+)?$/;
	    for (var i=1;i<=statusLengthC;i++){
	    	if($("#PROPORTION"+i).val()==""){
	    		$("#PROPORTION"+i).val(0);
	    	}else if(!regex.test($("#PROPORTION"+i).val())){
	    		alert("只能输入数字！");
	    		$("#PROPORTION"+i).select();
	    		return false;
	    	}else if(regex2.test($("#PROPORTION"+i).val())){
	    		alert("必须是一个正数！");
	    		$("#PROPORTION"+i).select();
	    		return false;
	    	}
	    	if($("#PROPORTION_AUTO"+i).val()==""){
	    		$("#PROPORTION_AUTO"+i).val(0);
	    	}else if(!regex.test($("#PROPORTION_AUTO"+i).val())){
	    		alert("只能输入数字！");
	    		$("#PROPORTION_AUTO"+i).select();
	    		return false;
	    	}else if(regex2.test($("#PROPORTION_AUTO"+i).val())){
	    		alert("必须是一个正数！");
	    		$("#PROPORTION_AUTO"+i).select();
	    		return false;
	    	}
	    	if($("#PROPORTION_CAR"+i).val()==""){
	    		$("#PROPORTION_CAR"+i).val(0);
	    	}else if(!regex.test($("#PROPORTION_CAR"+i).val())){
	    		alert("只能输入数字！");
	    		$("#PROPORTION_CAR"+i).select();
	    		return false;
	    	}else if(regex2.test($("#PROPORTION_CAR"+i).val())){
	    		alert("必须是一个正数！");
	    		$("#PROPORTION_CAR"+i).select();
	    		return false;
	    	}
	    } 
		var TYPE_USER_IDS="";
		var RENT_TYPE_USER_IDS="";
		var AUTO_TYPE_USER_IDS="";
		var CAR_TYPE_USER_IDS="";
		$('input[name="TYPE"]:checked').each(function(){   
			if (TYPE_USER_IDS!=""){
				TYPE_USER_IDS=TYPE_USER_IDS+","+$(this).val();
			}else{
				TYPE_USER_IDS=TYPE_USER_IDS+$(this).val();
			}
		});
		form1.TYPE_USER_IDS.value=TYPE_USER_IDS;
		
		$('input[name="RENT_TYPE"]:checked').each(function(){   
			if (RENT_TYPE_USER_IDS!=""){
				RENT_TYPE_USER_IDS=RENT_TYPE_USER_IDS+","+$(this).val();
			}else{
				RENT_TYPE_USER_IDS=RENT_TYPE_USER_IDS+$(this).val();
			}
		});
		form1.RENT_TYPE_USER_IDS.value=RENT_TYPE_USER_IDS;
		
		$('input[name="AUTO_TYPE"]:checked').each(function(){   
			if (AUTO_TYPE_USER_IDS!=""){
				AUTO_TYPE_USER_IDS=AUTO_TYPE_USER_IDS+","+$(this).val();
			}else{
				AUTO_TYPE_USER_IDS=AUTO_TYPE_USER_IDS+$(this).val();
			}
		});
		form1.AUTO_TYPE_USER_IDS.value=AUTO_TYPE_USER_IDS;
		
		$('input[name="CAR_TYPE"]:checked').each(function(){   
			if (CAR_TYPE_USER_IDS!=""){
				CAR_TYPE_USER_IDS=CAR_TYPE_USER_IDS+","+$(this).val();
			}else{
				CAR_TYPE_USER_IDS=CAR_TYPE_USER_IDS+$(this).val();
			}
		});
		form1.CAR_TYPE_USER_IDS.value=CAR_TYPE_USER_IDS;
		$("#form1").submit();
	}
	
	</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="employee.updateDispatchUser" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管文审人员管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
					<div>
						<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
							<td><a href="#" name="addDispatchUserID" id="addDispatchUserID" onclick="addDispaUser()" style="cursor:pointer" class="blue_button"/>添加人员</a></td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							姓名
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							是否请假
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							审核设备案件
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							审核乘用车案件
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							审核重车案件
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备案件比例
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							乘用车案件比例
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							重车案件比例
						</th>					
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
						<input name="USER_ID${status.count }" type="hidden" value="${item.USER_ID }"/>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${item.NAME }</td>
								<td style="text-align: center;"><input type="checkbox" name="TYPE" value="${item.USER_ID }" <c:if test="${item.TYPE eq 1 }">checked="checked"</c:if>/></td>
								<td style="text-align: center;"><input type="checkbox" name="RENT_TYPE" value="${item.USER_ID }" <c:if test="${item.RENT_TYPE eq 1 }">checked="checked"</c:if>/></td>
								<td style="text-align: center;"><input type="checkbox" name="CAR_TYPE" value="${item.USER_ID }" <c:if test="${item.CAR_TYPE eq 1 }">checked="checked"</c:if>/></td>
								<td style="text-align: center;"><input type="checkbox" name="AUTO_TYPE" value="${item.USER_ID }" <c:if test="${item.AUTO_TYPE eq 1 }">checked="checked"</c:if>/>&nbsp;</td>
								<td style="text-align: center;" ><input type="text" id="PROPORTION${status.count }" name="PROPORTION${status.count }" value="${item.PROPORTION }" />&nbsp;</td>  
								<td style="text-align: center;" ><input type="text" id="PROPORTION_CAR${status.count }" name="PROPORTION_CAR${status.count }" value="${item.PROPORTION_CAR }" />&nbsp;</td>  
								<td style="text-align: center;"><input type="text" id="PROPORTION_AUTO${status.count }" name="PROPORTION_AUTO${status.count }" value="${item.PROPORTION_AUTO }" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;" colspan="6"><a onclick="saveDispatch()" class="blue_button" style="cursor:pointer"/>保&nbsp;&nbsp;存</a></td>
						</tr>
						<input type="hidden" name="statusLengthC"  value="${fn:length(dw.resultList)}"/>
						<input name="TYPE_USER_IDS" type="hidden"/>
						<input name="RENT_TYPE_USER_IDS" type="hidden"/>
						<input name="AUTO_TYPE_USER_IDS" type="hidden"/>
						<input name="CAR_TYPE_USER_IDS" type="hidden"/>
					</tbody>
				</table>
					<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
		
							<div title="添加文审人员" style="display: none" id="addDispatchUserDiv">
									<form id="addDispatchUser" name="addDispatchUser" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=employee.addDispatchUser">
										<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
											<div class="zc_grid_body jqgrowleft">
												<div class="ui-state-default ui-jqgrid-hdiv ">
													<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td style="text-align: center" width="10%">请选择人员:</td>
															<td style="text-align: left; height: 50px;" width="90%"><select id="USER_ID" name="USER_ID" style="width: 150px"><option>请选择</option>
																	<c:forEach items="${userList}" var="user">
																		<option value="${user.ID }">${user.NAME}</option>
																	</c:forEach>
																</select></td>
														</tr>
													<tr class="ui-widget-content jqgrow ui-row-ltr">
														<td colspan="2" style="text-align: center; height: 30px;"
															width="100%"><input type="button" value="提交" onclick="addDispatchUserBut()"/></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</form>
					</div>
	</body>
</html>