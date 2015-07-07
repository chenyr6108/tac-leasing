<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>档案借出管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/record/js/record.js"></script>		
		<script type="text/javascript">	
		
			function recordManage(rect_id,flag,leaseCode){
				$("#rect_id").val(rect_id);
				var params = {"rect_id":rect_id};
				if(flag==1){//借出
					$("#borrow_rect_id").val(rect_id);
					$("#borrow_lease_code").html(leaseCode);
					$("#borrow_borrower").cleanValue();					
					$("#borrow_reason").val("");
					$("#borrow_comment").val("");
					if(leaseCode.indexOf("0509")==0){
						$("#borrow_plan_return_date").val(addDays(40));
					}else{
						$("#borrow_plan_return_date").val(addDays(15));
					}
					$("#borrowDiv").dialog({
						title:"档案借出("+leaseCode+")",
						height: 340,
						width:680,
						modal: true,
						resizable:false
					});
				}else if(flag==2){//归还
					$("#return_lease_code").html(leaseCode);	
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getUnReturnRecordDetail",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){
							if(data){
								$("#return_record_id").val(data.RECORD_ID);
								$("#return_return_comment").val("");
								$("#return_borrower").html(data.BORROWER);
								$("#return_borrow_date").html(data.BORROW_DATE);
								$("#return_plan_return_date").html(data.PLAN_RETURN_DATE);
								$("#return_reason").html(data.REASON);
								$("#return_from_position").html(data.FROM_POSITION);
								initRecordAreas("return_to_area",data.FROM_AREA);
								initRecordRooms(data.FROM_AREA,"return_to_room",data.FROM_ROOM);
								initRecordChests(data.FROM_ROOM,"return_to_chest",data.FROM_CHEST);
								initRecordFloors(data.FROM_CHEST,"return_to_floor",data.FROM_FLOOR);
								$("#return_to_floor").attr("qty",data.QTY);
								$("#return_qty").html("可存放档案数：" + data.QTY);
								$("#return_qty").show();
								$("#return_commentTd").html(data.COMMENT);
								$("#returnDiv").dialog({
									title:"档案归还("+leaseCode+")",
									height: 530,
									width:680,
									modal: true,
									resizable:false
								});
							}else{
								alert("档案已归还！");
								doQuery();		
							}				
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
				}else if(flag == 6){//延期
					$("#delay_lease_code").html(leaseCode);
					$("#delay_days").val("");					
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getUnReturnRecordDetail",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){
							if(data){
								$("#delay_record_id").val(data.RECORD_ID);
								$("#delay_return_comment").val("");
								$("#delay_borrower").html(data.BORROWER);
								$("#delay_borrow_date").html(data.BORROW_DATE);
								$("#delay_plan_return_date").html(data.PLAN_RETURN_DATE);
								$("#delay_reason").html(data.REASON);
								$("#delay_from_area").html(data.FROM_AREA);
								$("#delay_from_room").html(data.FROM_ROOM);								
								$("#delay_comment").html(data.COMMENT);
								$("#delayDiv").dialog({
									title:"延期归还("+leaseCode+")",
									height: 360,
									width:680,
									modal: true,
									resizable:false
								});
							}else{
								alert("档案已归还！");
								doQuery();		
							}				
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
				}
			}
			function doQuery(){
				$("#formAction").val("recordCommand.queryRentContractRecordForApply");
				$("#form1").submit();
			}
			
			
			
			$(function(){
				$("#startDate").datepicker($.datepicker.regional['zh-CN']);
				$("#endDate").datepicker($.datepicker.regional['zh-CN']);
				$("#borrow_plan_return_date").datepicker($.datepicker.regional['zh-CN']);			
			});		
			
				
			function borrowRecord(){
				if($("#borrow_plan_return_date").val()==""){
					alert("预计归还日期不能为空！");
					return;
				}else{
					if($("#borrow_plan_return_date").val()<getTodayDate()){
						alert("预计归还日期不能小于今日！");
						return;
					}
				}
				if($("#borrow_reason").val()==""){
					alert("借出用途不能为空！");
					return;
				}
				$.ajax({
					url : "${ctx}/servlet/defaultDispatcher",
					data : $("#borrowForm").serialize(),
					dataType : "json",
					type:"post",
					success:function (data){
						if(eval(data)){									
							alert("操作成功！");						
						}else{
							alert("已被他人借出！");
						}
						doQuery();
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}
				});			
			}
			
			function returnRecord(){				
				if($("#return_to_area").val()==''){
					alert('请选择存放地区！');
					return;
				}
				if($("#return_to_room").val()==''){
					alert('请选择存放库房！');
					return;
				}
				if($("#return_to_chest").val()==''){
					alert('请选择存放柜号！');
					return;
				}
				if($("#return_to_floor").val()==''){
					alert('请选择存放层数！');
					return;
				}
				var qty = $("#return_to_floor").attr("qty");
				if(parseInt(qty,10)<=0){
					alert('该层已满，请重新选择！');
					return;
				}
				$.ajax({
					url : "${ctx}/servlet/defaultDispatcher",
					data : $("#returnForm").serialize(),
					dataType : "json",
					type:"post",
					success:function (data){
						if(data.flag){									
							alert("操作成功！");
							doQuery();
						}else{
							alert(data.msg);
						}
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}
				});			
			}
			
			function showRecordDeatil(id,rect_id){
		        $("#" + id).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=recordCommand.getRecordDeatil&rect_id="+rect_id);
		        });	
			}
			
			
			
			
			
			function delayRecord(){
				if(!isPositiveInteger($("#delay_days").val())){
					alert("请输入正整数！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#delayForm").serialize(),
					dataType:"json",
					type:"post",
					success:function(data){
						if(eval(data)){									
							alert("操作成功！");
						}else{
							alert("已被他人归还！");
						}
						doQuery();			
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			
			
			function getFloorQty(obj,id){
				if(obj.value == ''){
					$(obj).attr("qty",0);
					$("#"+id).html("");
				}else{
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getQtyByFloorId&floor_id="+obj.value,
						dataType:"json",
						type:"get",
						success:function(data){								
							$(obj).attr("qty",data.qty);
							$("#"+id).html("可存放档案数："+data.qty);
							$("#"+id).show();
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
				}
			}
			
			
			function updateRecordApplyStatus(id,status,rect_id){
				if(confirm("确认通过？")){
					var params = {"id":id,"apply_status":status,"rect_id":rect_id};
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.updateRecordApplyStatus",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){								
							alert("操作成功！");
							doQuery();
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
				}
			}
			
			function cancelRecordApply(apply_id){
				if(confirm("确认要撤销此申请？")){
					var params = {"apply_id":apply_id};
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.cancelRecordApply",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){								
							alert("操作成功！");
							doQuery();
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
				}
			}
			
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" value="recordCommand.queryRentContractRecordForApply" id="formAction"/>
			<input type="hidden" name="form_to_area" value="" id="form_to_area"/>
			<input type="hidden" name="form_to_room" value="" id="form_to_room"/>
			<input type="hidden" name="form_to_chest" value="" id="form_to_chest"/>
			<input type="hidden" name="form_to_floor" value="" id="form_to_floor"/>
			<input type="hidden" name="form_comment" value="" id="form_comment"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;档案借出管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="40" class="ss_o"></td>
					        <td width="80%" class="ss_t" valign="center">
					          <table>
					          	<tr>
					          		<td>合同号：</td>
									<td><input type="text" name="lease_code" value="${lease_code}" size="32"/></td>
									<td>状态：</td>
									<td>
										<select name="apply_status">
											<option value="">--全部--</option>
											<option value="1" <c:if test="${apply_status eq 1}">selected="selected"</c:if>>单位主管审核中</option>
											<option value="5" <c:if test="${apply_status eq 5}">selected="selected"</c:if>>业管处主管审核中</option>
											<option value="10" <c:if test="${apply_status eq 10}">selected="selected"</c:if>>待借出</option>
											<option value="15" <c:if test="${apply_status eq 15}">selected="selected"</c:if>>待归还</option>
										</select>
									</td>
					          	</tr>
							  </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="10%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
					      </tr>
				    </table>
				
				
				
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<thead>
								<tr>
									<th>档案状态</th>
									<th>合同号</th>
									<th>客户名称</th>
									<th>办事处</th>
									<th>办事处主管</th>
									<th>申请人</th>
									<th>申请办事处</th>
									<th>申请日期</th>
									<th>申请原因</th>
									<th>申请人操作</th>				
									<th>单位主管审批</th>	
									<th>业管处主管审批</th>	
									<th>业管窗口处理</th>																							
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
										<td style="text-align: center;cursor:pointer;" onclick="showRecordDeatil('detail${item.RECT_ID}','${item.RECT_ID}')">
											<c:if test="${item.STATUS == 0}"><img src="${ctx }/images/u617.gif" title="未归档"></c:if>
											<c:if test="${item.STATUS == 1}"><img src="${ctx }/images/u620.gif" title="已归档"></c:if>
											<c:if test="${item.STATUS == 2}"><img src="${ctx }/images/u614.gif" title="归档后借出"></c:if>
											<c:if test="${item.STATUS == 3}"><img src="${ctx }/images/u608.gif" title="借出后归还"></c:if>
										</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.MANAGER }&nbsp;</td>
										<td>${item.APPLY_NAME }&nbsp;</td>
									    <td>${item.DECP_NAME }&nbsp;</td>
									    <td>${item.APPLY_DATE }&nbsp;</td>
									    <td>${item.REASON }&nbsp;</td>
										<td style="text-align: center;">
											<c:if test="${(item.STATUS == 1 or item.STATUS == 3) and item.APPLY_STATUS ==0}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },1,'${item.LEASE_CODE}')">申请借出</a>&nbsp;&nbsp;</c:if>
											<c:if test="${(item.APPLY_STATUS >= 1 and item.APPLY_STATUS <= 10) and item.isApplyUser}"><a href="javascript:void(0)" onclick="cancelRecordApply(${item.ID})">撤销申请</a>&nbsp;&nbsp;</c:if>
											<c:if test="${item.STATUS == 2 and item.isApplyUser}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },6,'${item.LEASE_CODE}')">申请延期</a>&nbsp;&nbsp;</c:if>
										</td>
										<td style="text-align: center;">
											<c:if test="${item.APPLY_STATUS ==1 and item.isDeptLeader}">
												<a href="javascript:void(0)" onclick="updateRecordApplyStatus(${item.ID},5,${item.RECT_ID})">通过</a>
											</c:if>
											<c:if test="${item.APPLY_STATUS ==1 and !item.isDeptLeader}">
												未审核
											</c:if>
											<c:if test="${item.APPLY_STATUS > 1}">
												Y
											</c:if>
										</td>
										<td style="text-align: center;">
											<c:if test="${item.APPLY_STATUS < 5 and item.APPLY_STATUS>0}">
												未审核
											</c:if>
											<c:if test="${item.APPLY_STATUS == 5 and isBussManager}">
												<a href="javascript:void(0)" onclick="updateRecordApplyStatus(${item.ID},10,${item.RECT_ID})">通过</a>
											</c:if>
											<c:if test="${item.APPLY_STATUS > 5}">
												Y
											</c:if>										
										</td>
										<td style="text-align: center;">
											<c:if test="${item.APPLY_STATUS ==10 and isDealer}">
												<a href="javascript:void(0)" onclick="updateRecordApplyStatus(${item.ID},15,${item.RECT_ID})">借出</a>
											</c:if>
											<c:if test="${item.APPLY_STATUS == 15 and isDealer}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },2,'${item.LEASE_CODE}')">归还</a>&nbsp;&nbsp;</c:if>
																				
											<c:if test="${item.APPLY_STATUS ==10 and !isDealer}">
												未借出
											</c:if>	
											<c:if test="${item.STATUS == 2 and !isDealer}">
												已借出未归还
											</c:if>	
										</td>
						
									</tr>
									<tr>
										<th colspan="15" class="pact">
											<div id="detail${item.RECT_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u617.gif">
										未归档&nbsp;
										<img src="${ctx }/images/u620.gif">
										已归档&nbsp;
										<img src="${ctx }/images/u614.gif">
										归档后借出&nbsp;
										<img src="${ctx }/images/u608.gif">
										借出后归还&nbsp;										
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
		</form>
		<!--用于归档、转移、归还时过滤层数的类型-->
		<input type="hidden" id="rect_id" >
		<div id="recordDiv" style="display: none">
			<form action="" name="recordForm" id="recordForm">
			<input type="hidden" name="__action" value="recordCommand.recordCreate">
			<input type="hidden" name="record_rect_id" id="record_rect_id" value="">
			<table width="100%" class="panel_table">
				<tr>
					<th width="30%" >合同号：<font color="red">*</font></th>
					<td id="record_lease_code">&nbsp;</td>
				</tr>
				<tr>
					<th width="30%" >存放地区：<font color="red">*</font></th>
					<td>
						<select name="record_area" id="record_area" onchange="initRecordRooms(this.value,'record_room','','record_chest','record_floor')"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放库房：<font color="red">*</font></th>
					<td>
						<select name="record_room" id="record_room" onchange="initRecordChests(this.value,'record_chest','','record_floor')"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放柜号：<font color="red">*</font></th>
					<td>
						<select name="record_chest" id="record_chest" onchange="initRecordFloorsByRectId(this.value,'record_floor')"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放层数：<font color="red">*</font></th>
					<td>
						<select name="record_floor" id="record_floor" qty="" onchange="getFloorQty(this,'record_qty')"></select><span id="record_qty"></span>
					</td>
				</tr>
				<tr>
					<th >待补文件：</th>
					<td id="record_files">
						
					</td>
				</tr>
				<tr>
					<th >备    注：</th>
					<td >
						<textarea rows="5" style="resize: none;width:100%" name="record_comment" id="record_comment"></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align:center" colspan="2">
						<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="recordCreate()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#recordDiv').dialog('close');">
					</td>
				</tr>
			</table>
			</form>
		</div>
		<div id="borrowDiv" style="display: none">
			<form action="" name="borrowForm" id="borrowForm">
				<input type="hidden" name="borrow_rect_id" id="borrow_rect_id">
				<input type="hidden" name="__action" value="recordCommand.borrowRecordForApply">
				<table width="100%" class="panel_table">
					<tr>
						<th width="30%" >合同号：</th>
						<td  id="borrow_lease_code">&nbsp;</td>
					</tr>				
					<tr>
						<th >预计归还日期：<font color="red">*</font></th>
						<td ><input id="borrow_plan_return_date" type="text" name="borrow_plan_return_date"></td>
					</tr>
					<tr>
						<th >调阅用途：<font color="red">*</font></th>
						<td >
							<select name="borrow_reason" id="borrow_reason">
								<option value="">--请选择--</option>
								<option value="调阅">调阅</option>
								<option value="增案">增案</option>
								<option value="变更">变更</option>
								<option value="拨尾款">拨尾款</option>
								<option value="结清">结清</option>
								<option value="诉讼">诉讼</option>
								<option value="回访">回访</option>
								<option value="其他">其他</option>
							</select>
						</td>
					</tr>
					<tr>
						<th >备    注：</th>
						<td >
							<textarea rows="5" style="resize: none;width:100%" name="borrow_comment" id="borrow_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="borrowRecord()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#borrowDiv').dialog('close');">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="returnDiv" style="display: none">
			<form action="" name="returnForm" id="returnForm">
				<input type="hidden" name="return_record_id" id="return_record_id">
				<input type="hidden" name="__action" value="recordCommand.returnRecordForApply">
				<table width="100%" class="panel_table">
					<tr>
						<th width="30%" >合同号：</th>
						<td  id="return_lease_code">
						</td>
					</tr>
					<tr>
						<th width="30%" >调阅位置：</th>
						<td  id="return_from_position"></td>
					</tr>
					<tr>
						<th width="30%" >调阅人员：</th>
						<td  id="return_borrower"></td>
					</tr>
					<tr>
						<th >调阅日期：</th>
						<td  id="return_borrow_date"></td>
					</tr>
					<tr>
						<th >预计归还日期：</th>
						<td  id="return_plan_return_date"></td>
					</tr>
					<tr>
						<th >调阅用途：</th>
						<td  id="return_reason"></td>
					</tr>
					<tr>
						<th >备    注：</th>
						<td  id="return_commentTd"></td>
					</tr>
					<tr>
						<th>存放地区：<font color="red">*</font></th>
						<td><select id="return_to_area" name="return_to_area" onchange="initRecordRooms(this.value,'return_to_room','','return_to_chest','return_to_floor');"></select></td>
					</tr>
					<tr>
						<th>存放库房：<font color="red">*</font></th>
						<td><select id="return_to_room" name="return_to_room" onchange="initRecordChests(this.value,'return_to_chest','','return_to_floor');"></select></td>
					</tr>
					<tr>
						<th>存放柜号：<font color="red">*</font></th>
						<td><select id="return_to_chest" name="return_to_chest" onchange="initRecordFloorsByRectId(this.value,'return_to_floor');"></select></td>
					</tr>
					<tr>
						<th>存放层数：<font color="red">*</font></th>
						<td><select id="return_to_floor" name="return_to_floor" onchange="getFloorQty(this,'return_qty')"></select><span id="return_qty"></span></td>
					</tr>
					<tr>
						<th >备    注：</th>
						<td>
							<textarea rows="5" style="resize: none;width:100%" name="return_comment" id="return_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="returnRecord()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#returnDiv').dialog('close');">
						</td>
					</tr>
					
				</table>
			</form>
		</div>
		
		<div id="delayDiv" style="display: none">
			<form action="" id="delayForm" name="delayForm">
				<input type="hidden" value="recordCommand.delayRecord" name="__action">
				<input type="hidden" id="delay_record_id" name="delay_record_id">
				<table width="100%" class="panel_table">
					<tr>
						<th width="30%" >合同号：</th>
						<td id="delay_lease_code"></td>
					</tr>
					<tr>
						<th width="30%" >调阅地区：</th>
						<td  id="delay_from_area"></td>
					</tr>
					<tr>
						<th width="30%" >调阅库房：</th>
						<td  id="delay_from_room"></td>
					</tr>
					<tr>
						<th width="30%" >调阅人员：</th>
						<td  id="delay_borrower"></td>
					</tr>
					<tr>
						<th >调阅日期：</th>
						<td  id="delay_borrow_date"></td>
					</tr>
					<tr>
						<th >预计归还日期：</th>
						<td  id="delay_plan_return_date"></td>
					</tr>
					<tr>
						<th >调阅用途：</th>
						<td  id="delay_reason"></td>
					</tr>
					<tr>
						<th>备    注：</th>
						<td  id="delay_comment"></td>
					</tr>
					<tr>
						<th width="30%" >延期天数：</th>
						<td>
							<input name="delay_days" id="delay_days" size="4" style="text-align:right;">天
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
						<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="delayRecord()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#delayDiv').dialog('close');">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>