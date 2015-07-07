<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>档案管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/record/js/record.js"></script>		
		<script type="text/javascript">		
			function recordManage(rect_id,flag,leaseCode){
				$("#rect_id").val(rect_id);
				var params = {"rect_id":rect_id};
				if(flag==0){//归档
					$("#record_lease_code").html(leaseCode);
					$("#record_comment").val("");
					$("#record_rect_id").val(rect_id);	
					resetRecordPosition('record_area','record_room','record_chest','record_floor');
					$("#record_files").html("无");
					$("#record_floor").attr("qty",0);
					$("#record_qty").html("");
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getRentFilesByRectId",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){
							var h = 0;
							if(data.list){
								var html = "";
								for(var i=0;i<data.list.length;i++){
									h += 12;
									html += (i+1) + "." + data.list[i].FILE_NAME+"<br/>";									
								}
								$("#record_files").html(html);
							}
							if(data.flag){
								initRecordAreas("record_area",data.position.AREA_ID);
								initRecordRooms(data.position.AREA_ID,"record_room",data.position.ROOM_ID);
								initRecordChests(data.position.ROOM_ID,"record_chest",data.position.CHEST_ID);
								initRecordFloors(data.position.CHEST_ID,"record_floor",data.position.FLOOR_ID);
								$("#record_qty").html("可存放档案数："+data.position.QTY);
								$("#record_qty").show();
								$("#record_floor").attr("qty",data.position.QTY);
							}
							
							$("#recordDiv").dialog({
								title:"归档("+leaseCode+")",
								height: 375+h,
								width:680,
								modal: true,
								resizable:false
							});
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});				
				}else if(flag==1){//借出
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
				}else if(flag==3){//转移
					$("#transfer_lease_code").html(leaseCode);
					$("#transfer_rect_id").val(rect_id);
					$("#transfer_qty").html("");
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getRecordByRectId",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){
							if(data){
								$("#transfer_from_position").html(data.AREA + " " + data.ROOM + " " + data.CHEST + " " + data.FLOOR);
								initRecordAreas("transfer_to_area");
								initRecordRooms('',"transfer_to_room");
								initRecordChests('',"transfer_to_chest");
								initRecordFloors('',"transfer_to_floor");
								$("#transferDiv").dialog({
									title:"档案转移("+leaseCode+")",
									height: 390,
									width:680,
									modal: true,
									resizable:false
								});
							}				
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});
					//
				}else if(flag==4 || flag==5){//查看和修改备注
					$("#view_lease_code").html(leaseCode);
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getRecordByRectId",
						data:params,
						dataType:"json",
						type:"post",
						success:function(data){
							if(data){
								$("#modify_id").val(data.ID);
								$("#view_position").html(data.AREA + " " + data.ROOM + " " + data.CHEST + " " + data.FLOOR);
								var html = "";
								var h =0;
								for(var i=0;i<data.list.length;i++){
									h += 12;
									html += (i+1) + "." + data.list[i].FILE_NAME+"<br/>";									
								}
								$("#view_createuser").html(data.CREATE_USER);
								$("#view_createdate").html(data.CREATE_DATE);
								
								$("#view_files").html(html);
								$("#view_comment").html(data.COMMENT);
								var title = "档案";
								if(flag==5){
									$("#modify_comment").val("");
									$("#modify_comment_tr").css("display","");
									$("#modify_button_tr").css("display","");									
									title += "修改 ("+leaseCode+")";
									h+= 140;
								}else{
									$("#modify_comment_tr").css("display","none");
									$("#modify_button_tr").css("display","none");
									title += "查看("+leaseCode+")";
								}
								$("#viewDiv").dialog({
									title:title,
									height: 350+h,
									width:680,
									modal: true,
									resizable:false
								});
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
				}else if(flag==7||flag==8){//批量转移 批量归档
					var chks = $("input[name='batch_rect_id']:checked");

					if(chks.length<=0){
						alert("至少选择一条数据！");
						return;
					}
					var title="";
					if(flag==7){
						title = "案件批量转移";
						$("#formAction").val("recordCommand.batchTransferRecords");
					}else{
						title = "案件批量归档";
						$("#formAction").val("recordCommand.batchCreateRecords");
					}
					
					initRecordAreas("batch_to_area",'');
					initRecordRooms('',"batch_to_room");
					initRecordChests('',"batch_to_chest");
					initRecordFloors('',"batch_to_floor");
					$("#batch_comment").val("");
					$("#batch_qty").html("");				
					$("#batchDiv").dialog({
						title:title,
						height: 340,
						width:500,
						modal: true,
						resizable:false
					});
				}
			}	
			
			function doQuery(){
				$("#formAction").val("recordCommand.queryRentContractRecord");
				$("#form1").submit();
			}
			

			var user_map = null;
			
			$(function(){
				$("#startDate").datepicker($.datepicker.regional['zh-CN']);
				$("#endDate").datepicker($.datepicker.regional['zh-CN']);
				$("#borrow_plan_return_date").datepicker($.datepicker.regional['zh-CN']);			
				$.ajax({
					url : "${ctx}/servlet/defaultDispatcher",
					data : {"__action" : "employeeCommand.getAllEmpInfo"},
					dataType : "json",
					success : function (data){
						user_map = $.map(data, function (item){
							return{
								label : item.display_name,
								value : item.option_value
							};
						});
						$("#borrow_borrower").dropDownList(user_map);			
					}
				});
				
				initRecordAreas("area",'${area}');
				initRecordRooms('${area}',"room",'${room}');
				initRecordChests('${room}',"chest",'${chest}');
				initRecordFloors('${chest}',"floor",'${floor}');
			});		
			
			
			function recordCreate(){
				if($("#record_area").val()==''){
					alert('请选择存放地区！');
					return;
				}
				if($("#record_room").val()==''){
					alert('请选择存放库房！');
					return;
				}
				if($("#record_chest").val()==''){
					alert('请选择存放柜号！');
					return;
				}
				if($("#record_floor").val()==''){
					alert('请选择存放层数！');
					return;
				}
				var qty = $("#record_floor").attr("qty");
				if(parseInt(qty,10)<=0){
					alert('该层已满，请重新选择！');
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#recordForm").serialize(),
					dataType:"json",
					type:"post",
					success:function(data){
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
			
			function borrowRecord(){
				if($("#borrow_borrower").getValue()==""){
					alert("借出人不能为空！");
					return;
				}
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
			
			function transferRecord(){
				if($("#transfer_to_area").val()==''){
					alert('请选择存放地区！');
					return;
				}
				if($("#transfer_to_room").val()==''){
					alert('请选择存放库房！');
					return;
				}
				if($("#transfer_to_chest").val()==''){
					alert('请选择存放柜号！');
					return;
				}
				if($("#transfer_to_floor").val()==''){
					alert('请选择存放层数！');
					return;
				}
				var qty = $("#transfer_to_floor").attr("qty");
				if(parseInt(qty,10)<=0){
					alert('该层已满，请重新选择！');
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#transferForm").serialize(),
					dataType:"json",
					type:"post",
					success:function(data){
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
			
			function modifyRecord(){
				if($("#modify_comment").val()==""){
					alert("修改内容不能为空！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#modifyForm").serialize(),
					dataType:"json",
					type:"post",
					success:function(data){
						if(eval(data)){									
							alert("操作成功！");
							$('#viewDiv').dialog('close');
						}			
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
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
			
			function batchRecord(){
				if($("#batch_to_area").val()==''){
					alert('请选择存放地区！');
					return;
				}
				if($("#batch_to_room").val()==''){
					alert('请选择存放库房！');
					return;
				}
				if($("#batch_to_chest").val()==''){
					alert('请选择存放柜号！');
					return;
				}
				if($("#batch_to_floor").val()==''){
					alert('请选择存放层数！');
					return;
				}
				var qty = $("#batch_to_floor").attr("qty");
				if(parseInt(qty,10)<=0){
					alert('该层已满，请重新选择！');
					return;
				}else{
					var chks = $("input[name='batch_rect_id']:checked");
					if(chks.length>qty){
						if(!confirm("你选择的档案数大于该层的可存放数，只能处理部分档案，\n是否要继续执行此操作？")){
							return;
						}
					}
				}
				$("#form_to_area").val($("#batch_to_area").val());
				$("#form_to_room").val($("#batch_to_room").val());
				$("#form_to_chest").val( $("#batch_to_chest").val());
				$("#form_to_floor").val($("#batch_to_floor").val());
				$("#form_comment").val($("#batch_comment").val());

				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#form1").serialize(),
					dataType:"json",
					type:"post",
					success:function(data){								
						alert(data.msg);
						doQuery();			
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			
			function selectAllChks(obj){
				var flag = false;
				if($(obj).attr("checked")){
					flag = true;
				}
				$("input[name='batch_rect_id']").each(function(){
					$(this).attr("checked",flag);
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
			
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" value="recordCommand.queryRentContractRecord" id="formAction"/>
			<input type="hidden" name="form_to_area" value="" id="form_to_area"/>
			<input type="hidden" name="form_to_room" value="" id="form_to_room"/>
			<input type="hidden" name="form_to_chest" value="" id="form_to_chest"/>
			<input type="hidden" name="form_to_floor" value="" id="form_to_floor"/>
			<input type="hidden" name="form_comment" value="" id="form_comment"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;档案管理</span>
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
					          		<td>归档日期:</td>
					          		<td><input type="text" id="startDate" name="startDate" value="${startDate }" size="14"/>~<input type="text" id="endDate" name="endDate" value="${endDate}"  size="14"/></td>
					          		<td>档案状态：</td>
					          		<td>
										<select name="status">
											<option value=""  <c:if test="${empty status}">selected="selected"</c:if>>--请选择--</option>
											<option value="0" <c:if test="${status eq '0'}">selected="selected"</c:if> >未归档</option>
											<option value="1" <c:if test="${status eq '1'}">selected="selected"</c:if> >已归档</option>
											<option value="2" <c:if test="${status eq '2'}">selected="selected"</c:if> >归档后借出</option>
											<option value="3" <c:if test="${status eq '3'}">selected="selected"</c:if> >借出后归还</option>
										</select>
										&nbsp;
									</td>
									<td>合同状态：</td>
					          		<td>
										<select name="recp_status">
											<option value=""  <c:if test="${empty recp_status}">selected="selected"</c:if>>--请选择--</option>
											<option value="0" <c:if test="${recp_status eq '0'}">selected="selected"</c:if> >正常</option>
											<option value="1" <c:if test="${recp_status eq '1'}">selected="selected"</c:if> >正常结清</option>
											<option value="3" <c:if test="${recp_status eq '3'}">selected="selected"</c:if> >提前结清</option>
										</select>
										&nbsp;
									</td>
									<td>产品类别：</td>
					          		<td>
										<select name="production_type">
											<option value=""  <c:if test="${empty production_type}">selected="selected"</c:if>>--请选择--</option>
											<option value="1" <c:if test="${production_type eq '1'}">selected="selected"</c:if> >设备</option>
											<option value="2" <c:if test="${production_type eq '2'}">selected="selected"</c:if> >商用车</option>
											<option value="3" <c:if test="${production_type eq '3'}">selected="selected"</c:if> >乘用车</option>
										</select>
										&nbsp;
									</td>
									<td>是否逾期：</td>
					          		<td>
										<select name="isOverdue">
											<option value=""  <c:if test="${empty isOverdue}">selected="selected"</c:if>>--请选择--</option>
											<option value="0" <c:if test="${isOverdue eq '1'}">selected="selected"</c:if> >未逾期</option>
											<option value="1" <c:if test="${isOverdue eq '2'}">selected="selected"</c:if> >已逾期</option>
										</select>
										&nbsp;
									</td>
					          	</tr>
					          	<tr>
					          		<td>查询内容：</td>
									<td><input type="text" name="content" value="${content}" size="32"/></td>
									<td>存放地区：</td>	
									<td>
										<select name="area" id="area"  onchange="initRecordRooms(this.value,'room','','chest','floor')"></select>
									</td>	
									<td>存放库房：</td>	
									<td>
										<select name="room" id="room"  onchange="initRecordChests(this.value,'chest','','floor')"></select>
									</td>
									<td>存放柜号：</td>	
									<td>
										<select name="chest" id="chest" onchange="initRecordFloors(this.value,'floor')"></select>
									</td>
									<td>存放层数：</td>	
									<td>
										<select name="floor" id="floor"></select>
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
							<td>
								<input type="button" value="批量归档" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="recordManage('',8,'')">
								<input type="button" value="批量转移" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="recordManage('',7,'')">
							</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<thead>
								<tr>
									<th><input type="checkbox" onclick="selectAllChks(this)">全选</th>
									<th>异常</th>
									<th>档案状态</th>
									<th>合同状态</th>
									<th>案件号</th>
									<th>合同号</th>
									<th>客户名称</th>
									<th>办事处</th>
									<th>办事处主管</th>
									<th>客户经理</th>
									<th>拨款日期</th>
									<th>归档人员</th>
									<th>归档日期</th>	
									<th>存放位置</th>							
									<th>操作</th>																									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
										<td>
											<input type="checkbox" name="batch_rect_id" value="${item.RECT_ID}">
										</td>
										<td>
											<c:if test="${item.DAYS>0}">
											<img src="${ctx }/images/1076216.gif" title="逾期${item.DAYS}天">
											</c:if>&nbsp;
										</td>
										<td style="text-align: center;cursor:pointer;" onclick="showRecordDeatil('detail${item.RECT_ID}','${item.RECT_ID}')">
											<c:if test="${item.STATUS == 0}"><img src="${ctx }/images/u617.gif" title="未归档"></c:if>
											<c:if test="${item.STATUS == 1}"><img src="${ctx }/images/u620.gif" title="已归档"></c:if>
											<c:if test="${item.STATUS == 2}"><img src="${ctx }/images/u614.gif" title="归档后借出"></c:if>
											<c:if test="${item.STATUS == 3}"><img src="${ctx }/images/u608.gif" title="借出后归还"></c:if>
										</td>
										<td style="text-align: center;cursor:point;">
											<c:if test="${item.RECP_STATUS == 0}">正常</c:if>
											<c:if test="${item.RECP_STATUS == 1}">正常结清</c:if>
											<c:if test="${item.RECP_STATUS == 3}">提前结清</c:if>
										</td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.MANAGER }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
										<td style="text-align: center;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;">${item.CREATE_DATE}&nbsp;</td>
										<td style="text-align: center;">${item.AREA}&nbsp;${item.ROOM}&nbsp;${item.CHEST}&nbsp;${item.FLOOR}</td>		
										<td style="text-align: left;">
											&nbsp;&nbsp;
											<c:if test="${item.STATUS == 0}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },0,'${item.LEASE_CODE}')">归档</a>&nbsp;&nbsp;</c:if>
											<c:if test="${item.STATUS != 0}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },4,'${item.LEASE_CODE}')">查看</a>&nbsp;&nbsp;</c:if>
											<c:if test="${item.STATUS != 0}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },5,'${item.LEASE_CODE}')">修改备注</a>&nbsp;&nbsp;</c:if>
											<c:if test="${item.STATUS == 2}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },6,'${item.LEASE_CODE}')">延期</a>&nbsp;&nbsp;</c:if>
											<!--<c:if test="${item.STATUS == 1 or item.STATUS == 3}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },1,'${item.LEASE_CODE}')">借出</a>&nbsp;&nbsp;</c:if>-->	
											<c:if test="${item.STATUS == 2}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },2,'${item.LEASE_CODE}')">归还</a>&nbsp;&nbsp;</c:if>
											<c:if test="${item.STATUS == 1 or item.STATUS == 3}"><a href="javascript:void(0)" onclick="javascript:recordManage(${item.RECT_ID },3,'${item.LEASE_CODE}')">转移</a>&nbsp;&nbsp;</c:if>			
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
				<input type="hidden" name="__action" value="recordCommand.borrowRecord">
				<table width="100%" class="panel_table">
					<tr>
						<th width="30%" >合同号：</th>
						<td  id="borrow_lease_code">&nbsp;</td>
					</tr>				
					<tr>
						<th width="30%" >调阅人员：<font color="red">*</font></th>
						<td ><input type="text" id="borrow_borrower" style="width: 110px; height: 25px;" name="borrow_borrower"></td>
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
				<input type="hidden" name="__action" value="recordCommand.returnRecord">
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
		<div id="transferDiv" style="display: none">
			<form action="" name="transferForm" id="transferForm">
			<input type="hidden" name="__action" value="recordCommand.transferRecord">
			<input type="hidden" name="transfer_rect_id" id="transfer_rect_id" value="">
			<table width="100%" class="panel_table">
				<tr>
					<th width="30%" >合同号：</th>
					<td id="transfer_lease_code">&nbsp;</td>
				</tr>
				<tr>
					<th width="30%" >位置：</th>
					<td id="transfer_from_position"></td>
				</tr>
				<tr>
					<th width="30%" >存放地区：<font color="red">*</font></th>
					<td>
					<select id="transfer_to_area" name="transfer_to_area" onchange="initRecordRooms(this.value,'transfer_to_room','','transfer_to_chest','transfer_to_floor');"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放库房：<font color="red">*</font></th>
					<td>
					<select id="transfer_to_room" name="transfer_to_room" onchange="initRecordChests(this.value,'transfer_to_chest','','transfer_to_floor');"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放柜号：<font color="red">*</font></th>
					<td>
					<select id="transfer_to_chest" name="transfer_to_chest" onchange="initRecordFloorsByRectId(this.value,'transfer_to_floor');"></select>
					</td>
				</tr>
				<tr>
					<th width="30%" >存放层数：<font color="red">*</font></th>
					<td>
					<select id="transfer_to_floor" name="transfer_to_floor" onchange="getFloorQty(this,'transfer_qty')"></select><span id="transfer_qty"></span>
					</td>
				</tr>
				<tr>
					<th >备    注：</th>
					<td >
						<textarea rows="5" style="resize: none;width:100%" name="transfer_comment" id="transfer_comment"></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align:center" colspan="2">
						<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="transferRecord()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#transferDiv').dialog('close');">
					</td>
				</tr>
			</table>
			</form>
		</div>
		<div id="viewDiv" style="display: none">
			<table width="100%" class="panel_table">
				<tr>
					<th width="30%" >合同号：</th>
					<td id="view_lease_code"></td>
				</tr>
				<tr>
					<th width="30%" >存放位置：</th>
					<td id="view_position"></td>
				</tr>
				<tr>
					<th width="30%" >归档人员：</th>
					<td id="view_createuser"></td>
				</tr>
				<tr>
					<th width="30%" >归档时间：</th>
					<td id="view_createdate"></td>
				</tr>
				<tr>
					<th >待补文件：</th>
					<td id="view_files">
						
					</td>
				</tr>
				<tr height="120">
					<th>备    注：</th>
					<td id="view_comment"></td>
				</tr>
				<tr height="80" id="modify_comment_tr">
					<th>备    注：<font color="red">*</font></th>
					<td>
					<form id="modifyForm" name="modifyForm">
						<input type="hidden" value="recordCommand.modifyRecord" name="__action">
						<input type="hidden" id="modify_id" name="modify_id">
						<textarea rows="5" style="resize: none;width:100%" name="modify_comment" id="modify_comment"></textarea>
					</form>
					</td>
				</tr>
				<tr id="modify_button_tr">
					<td style="text-align:center" colspan="2">
						<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="modifyRecord()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#viewDiv').dialog('close');">
					</td>
				</tr>
			</table>
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
		<div style="display:none" id="batchDiv">
			<form id="batchForm" name="batchForm">
			<table width="100%" class="panel_table">
				<tr>
					<th width="30%">存放地区：<font color="red">*</font></th>
					<td>
						<select name="batch_to_area" id="batch_to_area" onchange="initRecordRooms(this.value,'batch_to_room','','batch_to_chest','batch_to_floor')"></select>
					</td>
				</tr>
				<tr>
					<th>存放库房：<font color="red">*</font></th>
					<td>
						<select name="batch_to_room" id="batch_to_room" onchange="initRecordChests(this.value,'batch_to_chest','','batch_to_floor')"></select>
					</td>
				</tr>
				<tr>
					<th>存放柜号：<font color="red">*</font></th>
					<td>
						<select name="batch_to_chest" id="batch_to_chest" onchange="initRecordFloors(this.value,'batch_to_floor')"></select>
					</td>
				</tr>
				<tr>
					<th>存放层数：<font color="red">*</font></th>
					<td>
						<select name="batch_to_floor" id="batch_to_floor" onchange="getFloorQty(this,'batch_qty')"></select><span id="batch_qty"></span>
					</td>
				</tr>
				<tr>
					<th>备注：</th>
					<td>
						<textarea rows="5" style="resize: none;width:100%" name="batch_comment" id="batch_comment"></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align:center" colspan="2">
						<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="batchRecord()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#batchDiv').dialog('close');">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>