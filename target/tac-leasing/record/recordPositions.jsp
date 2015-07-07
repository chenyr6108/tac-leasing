<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>档案存放地区管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/record/js/record.js"></script>		
		<script type="text/javascript">		
			$(function(){
				initRecordAreas("area",'${area}');
				initRecordRooms('${area}','room','${room}');
			});
			
			function doQuery(){
				$("#form1").submit();
			}
			
			function managePosition(type,id){
				var param = {"id":id};
				if(type==1 || type==2){
					if(type==1){
						$("#area_name").val("");
						$("#area_comment").val("");
						$("#area_id").val("");	
					}else{
						$.ajax({
							url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getArea",
							data:param,
							dataType:"json",
							type:"post",
							async:false,
							success:function(data){
								$("#area_name").val(data.AREA_NAME);
								$("#area_comment").val(data.COMMENT);
								$("#area_id").val(data.ID);	
							},
							error:function(){
								alert("操作失败，请联系系统管理员！");
							}	
						});
					}

					$("#areaDiv").dialog({
						title:"存放地区",
						height: 230,
						width:480,
						modal: true,
						resizable:false
					});
				}else if(type ==3 || type ==4){
					if(type==3){
						$("#createRoomArea").show();
						$("#modifyRoomArea").hide();
						$("#room_name").val("");
						$("#room_comment").val("");
						$("#room_id").val("");	
						initRecordAreas("room_area");
					}else{
						$("#createRoomArea").hide();
						$("#modifyRoomArea").show();
						$.ajax({
							url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getRoom",
							data:param,
							dataType:"json",
							type:"post",
							async:false,
							success:function(data){
								$("#room_name").val(data.ROOM_NAME);
								$("#room_comment").val(data.COMMENT);
								$("#room_id").val(data.ID);	
								$("#room_area_view").html(data.AREA_NAME);
								initRecordAreas("room_area",data.AREA_ID);
							},
							error:function(){
								alert("操作失败，请联系系统管理员！");
							}	
						});
					}

					$("#roomDiv").dialog({
						title:"存放地区",
						height: 280,
						width:480,
						modal: true,
						resizable:false
					});
				}else if(type ==5 || type==6){
					if(type==5){
						$("#createChestArea").show();
						$("#modifyChestArea").hide();
						$("#createChestRoom").show();
						$("#modifyChestRoom").hide();
						$("#chest_name").val("");
						$("#chest_comment").val("");
						$("#chest_id").val("");	
						resetRecordPosition("chest_area","chest_room");
					}else{
						$("#createChestArea").hide();
						$("#modifyChestArea").show();
						$("#createChestRoom").hide();
						$("#modifyChestRoom").show();
						$.ajax({
							url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getChest",
							data:param,
							dataType:"json",
							type:"post",
							async:false,
							success:function(data){
								$("#chest_name").val(data.CHEST_NAME);
								$("#chest_comment").val(data.COMMENT);
								$("#chest_id").val(data.ID);	
								$("#chest_area_view").html(data.AREA_NAME);
								$("#chest_room_view").html(data.ROOM_NAME);
								initRecordAreas("chest_area",data.AREA_ID);
								initRecordRooms(data.AREA_ID,"chest_room",data.ROOM_ID);
							},
							error:function(){
								alert("操作失败，请联系系统管理员！");
							}	
						});
					}

					$("#chestDiv").dialog({
						title:"存放柜号",
						height: 300,
						width:490,
						modal: true,
						resizable:false
					});
				}else if(type ==7 || type==8){
					if(type==7){
						$("#createFloorArea").show();
						$("#modifyFloorArea").hide();
						$("#createFloorRoom").show();
						$("#modifyFloorRoom").hide();
						$("#createFloorChest").show();
						$("#modifyFloorChest").hide();
						$("#floor_name").val("");
						$("#floor_comment").val("");
						$("#floor_id").val("");	
						$("#floor_capacity").val("");
						$("#floor_qty").val(0);
						$("#floor_qty_span").hide();
						initFloorType("floor_type",'');
						resetRecordPosition("floor_area","floor_room","floor_chest");
					}else{
						$("#createFloorArea").hide();
						$("#modifyFloorArea").show();
						$("#createFloorRoom").hide();
						$("#modifyFloorRoom").show();
						$("#createFloorChest").hide();
						$("#modifyFloorChest").show();
						$.ajax({
							url:"${ctx}/servlet/defaultDispatcher?__action=recordCommand.getFloor",
							data:param,
							dataType:"json",
							type:"post",
							async:false,
							success:function(data){
								$("#floor_name").val(data.FLOOR_NAME);
								$("#floor_comment").val(data.COMMENT);
								$("#floor_id").val(data.ID);	
								$("#floor_area_view").html(data.AREA_NAME);
								$("#floor_room_view").html(data.ROOM_NAME);
								$("#floor_chest_view").html(data.CHEST_NAME);
								$("#floor_capacity").val(data.CAPACITY);
								$("#floor_qty").val(data.QTY);
								$("#floor_qty_span").html("已存放档案数：" + data.QTY);
								$("#floor_qty_span").show();
								initFloorType("floor_type",data.TYPE);
								initRecordAreas("floor_area",data.AREA_ID);
								initRecordRooms(data.AREA_ID,"floor_room",data.ROOM_ID);
								initRecordChests(data.ROOM_ID,"floor_chest",data.CHEST_ID);
							},
							error:function(){
								alert("操作失败，请联系系统管理员！");
							}	
						});
					}

					$("#floorDiv").dialog({
						title:"存放柜号",
						height: 400,
						width:490,
						modal: true,
						resizable:false
					});
				}
				
			}
			
			
			function saveArea(){
				if($("#area_name").val()==""){
					alert("请输入地区名称！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#areaForm").serialize(),
					dataType:"json",
					type:"post",
					async:false,
					success:function(data){
						if(eval(data)){
							alert("操作成功");
							doQuery();
						}else{
							alert("地区名称已经存在");
						}
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			function saveRoom(){
				if($("#room_area").val()==""){
					alert("请选择地区名称！");
					return;
				}				
				if($("#room_name").val()==""){
					alert("请输入库房名称！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#roomForm").serialize(),
					dataType:"json",
					type:"post",
					async:false,
					success:function(data){
						if(eval(data)){
							alert("操作成功");
							doQuery();
						}else{
							alert("库房名称已经存在");
						}
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			
			function saveChest(){
				if($("#chest_area").val()==""){
					alert("请选择地区名称！");
					return;
				}
				if($("#chest_room").val()==""){
					alert("请选择库房名称！");
					return;
				}
				if($("#chest_name").val()==""){
					alert("请输入柜号！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#chestForm").serialize(),
					dataType:"json",
					type:"post",
					async:false,
					success:function(data){
						if(eval(data)){
							alert("操作成功");
							doQuery();
						}else{
							alert("柜号已经存在");
						}
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			

			function saveFloor(){
				if($("#floor_area").val()==""){
					alert("请选择地区名称！");
					return;
				}
				if($("#floor_room").val()==""){
					alert("请选择库房名称！");
					return;
				}
				if($("#floor_chest").val()==""){
					alert("请选择柜号！");
					return;
				}
				if($("#floor_name").val()==""){
					alert("请输入层数！");
					return;
				}
				if($("#floor_capacity").val()==""){
					alert("请输入容量！");
					return;
				}else{
					var capacity = $("#floor_capacity").val();
					if(!isPositiveInteger(capacity)){
						alert("容量必须为正整数！");
						return;
					}else{
						var qty = $("#floor_qty").val(); 
						if(parseInt(capacity,10) < parseInt(qty,10)){
							alert("容量必须为大于已存放的档案数！");
							return;
						}
					}
				}
				if($("#floor_type").val()==""){
					alert("请选择存放类型！");
					return;
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher",
					data:$("#floorForm").serialize(),
					dataType:"json",
					type:"post",
					async:false,
					success:function(data){
						if(eval(data)){
							alert("操作成功");
							doQuery();
						}else{
							alert("层数已经存在");
						}
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
					}	
				});
			}
			
			function initFloorType(id,val){
				$("#"+id).find("option").each(function(){
					$(this).remove();
				});

				var flag1 =" ";
				if(1 == val){
					flag1 =" selected ";
				}
				var flag2 =" ";
				if(2 == val){
					flag2 =" selected ";
				}
				var flag3 =" ";
				if(3 == val){
					flag3 =" selected ";
				}
				
				$("#"+id).append("<option value=\"\">--请选择--</option>");
				$("#"+id).append("<option value=\"1\" "+flag1+">设备</option>");
				$("#"+id).append("<option value=\"2\" "+flag2+">商用车</option>");
				$("#"+id).append("<option value=\"3\" "+flag3+">乘用车</option>");
			}
			
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" value="recordCommand.getRecordPositions" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;档案存放地区管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      	<td width="8">&nbsp;</td>
					        <td width="40" class="ss_o"></td>
					        <td width="60%" class="ss_t" valign="center">
					          <table>
					          	<tr>
					          		<td>查询内容：</td>
									<td><input type="text" name="content" value="${content}" size="44"/></td>
									<td>存放地区：</td>	
									<td>
									<select name="area" id="area" onchange="initRecordRooms(this.value,'room')">
										<option value="">--所有地区--</option>
									</select>
									</td>	
									<td>存放库房：</td>	
									<td><select name="room" id="room"></select></td>
									<td>存放类型：</td>	
									<td>
										<select name="type" id="type">
											<option value="">--请选择--</option>
											<option value="1" <c:if test="${type eq 1}">selected</c:if>>设备</option>
											<option value="2" <c:if test="${type eq 2}">selected</c:if>>商用车</option>
											<option value="3" <c:if test="${type eq 3}">selected</c:if>>乘用车</option>
										</select>
									</td>
								</tr>
							  </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
					      </tr>
				    </table>
				
				
				
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td><input type="button" value="添加地区" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="managePosition(1)"></td>
							<td><input type="button" value="添加库房" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="managePosition(3)"></td>
							<td><input type="button" value="添加柜号" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="managePosition(5)"></td>
							<td><input type="button" value="添加层数" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="managePosition(7)"></td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<thead>
								<tr>
									<th>存放地区</th>	
									<th>存放库房</th>	
									<th>存放柜号</th>
									<th>存放层数</th>	
									<th>存放类型</th>
									<th>存放容量</th>
									<th>备注</th>																														
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
										<td style="text-align: center;"><a href="javascript:;" onclick="managePosition(2,'${item.AREA_ID}')">${item.AREA_NAME }</a>&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:;" onclick="managePosition(4,'${item.ROOM_ID}')">${item.ROOM_NAME }</a>&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:;" onclick="managePosition(6,'${item.CHEST_ID}')">${item.CHEST_NAME }</a>&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:;" onclick="managePosition(8,'${item.FLOOR_ID}')">${item.FLOOR_NAME }</a>&nbsp;</td>
										<td style="text-align: center;">
										<c:choose>
											<c:when test="${item.TYPE eq 1 }">设备</c:when>
											<c:when test="${item.TYPE eq 2 }">商用车</c:when>
											<c:when test="${item.TYPE eq 3 }">乘用车</c:when>
										</c:choose>
										&nbsp;</td>
										<td style="text-align: center;">${item.QTY }/${item.CAPACITY }&nbsp;</td>
										<td style="text-align: center;">${item.COMMENT }&nbsp;</td>						
									</tr>
									<tr>
										<th colspan="15" class="pact">
											<div id="detail${item.id}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
				</div>
				</div>
				</div>
		</form>
		<div id="areaDiv" style="display:none">
			<form action="" name="areaForm" id="areaForm">
				<input type="hidden" name="__action" value="recordCommand.saveArea" />
				<input type="hidden" name="area_id" value="" id="area_id"/>
				<table class="panel_table">
					<tr>
						<th>地区名称：<font color="red">*</font></th>
						<td><input type="text" name="area_name" id="area_name"></td>
					</tr>
					<tr>
						<th>备    注：</th>
						<td>
							<textarea rows="5" style="resize: none;width:100%" name="area_comment" id="area_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveArea()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#areaDiv').dialog('close');">
						</td>
					</tr>					
				</table>
			</form>
		</div>
		<div id="roomDiv" style="display:none">
			<form action="" name="roomForm" id="roomForm">
				<input type="hidden" name="__action" value="recordCommand.saveRoom" />
				<input type="hidden" name="room_id" value="" id="room_id"/>
				<table class="panel_table">
					<tr id="createRoomArea">
						<th>地区名称：<font color="red">*</font></th>
						<td>
							<select name="room_area" id="room_area"></select>
						</td>
					</tr>
					<tr id="modifyRoomArea">
						<th>地区名称：<font color="red">*</font></th>
						<td id="room_area_view">
							
						</td>
					</tr>
					<tr>
						<th>库房名称：<font color="red">*</font></th>
						<td>
							<input type="text" name="room_name" id="room_name">
						</td>
					</tr>
					<tr>
						<th>备    注：</th>
						<td>
							<textarea rows="5" style="resize: none;width:100%" name="room_comment" id="room_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveRoom()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#roomDiv').dialog('close');">
						</td>
					</tr>					
				</table>
			</form>
		</div>
		<div id="chestDiv" style="display:none">
			<form action="" name="chestForm" id="chestForm">
				<input type="hidden" name="__action" value="recordCommand.saveChest" />
				<input type="hidden" name="chest_id" value="" id="chest_id"/>
				<table class="panel_table">
					<tr id="createChestArea">
						<th>地区名称：<font color="red">*</font></th>
						<td>
							<select name="chest_area" id="chest_area" onchange="initRecordRooms(this.value,'chest_room')"></select>
						</td>
					</tr>
					<tr id="modifyChestArea">
						<th>地区名称：<font color="red">*</font></th>
						<td id="chest_area_view">
							
						</td>
					</tr>
					<tr id="createChestRoom">
						<th>库房名称：<font color="red">*</font></th>
						<td>
							<select name="chest_room" id="chest_room"></select>
						</td>
					</tr>
					<tr id="modifyChestRoom">
						<th>库房名称：<font color="red">*</font></th>
						<td id="chest_room_view">
							
						</td>
					</tr>
					<tr>
						<th>柜     号：<font color="red">*</font></th>
						<td>
							<input type="text" name="chest_name" id="chest_name">
						</td>
					</tr>
					<tr>
						<th>备    注：</th>
						<td>
							<textarea rows="5"  name="chest_comment" id="chest_comment"  style="resize: none;width:100%"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveChest()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#chestDiv').dialog('close');">
						</td>
					</tr>					
				</table>
			</form>
		</div>
		<div id="floorDiv" style="display:none">
			<form action="" name="floorForm" id="floorForm">
				<input type="hidden" name="__action" value="recordCommand.saveFloor" />
				<input type="hidden" name="floor_id" value="" id="floor_id"/>
				<table class="panel_table">
					<tr id="createFloorArea">
						<th>地区名称：<font color="red">*</font></th>
						<td>
							<select name="floor_area" id="floor_area" onchange="initRecordRooms(this.value,'floor_room','','floor_chest')"></select>
						</td>
					</tr>
					<tr id="modifyFloorArea">
						<th>地区名称：<font color="red">*</font></th>
						<td id="floor_area_view">
							
						</td>
					</tr>
					<tr id="createFloorRoom">
						<th>库房名称：<font color="red">*</font></th>
						<td>
							<select name="floor_room" id="floor_room" onchange="initRecordChests(this.value,'floor_chest')"></select>
						</td>
					</tr>
					<tr id="modifyFloorRoom">
						<th>库房名称：<font color="red">*</font></th>
						<td id="floor_room_view">
							
						</td>
					</tr>
					<tr id="createFloorChest">
						<th>柜    号：<font color="red">*</font></th>
						<td>
							<select name="floor_chest" id="floor_chest"></select>
						</td>
					</tr>
					<tr id="modifyFloorChest">
						<th>柜    号：<font color="red">*</font></th>
						<td id="floor_chest_view">
							
						</td>
					</tr>
					<tr>
						<th>层    数：<font color="red">*</font></th>
						<td>
							<input type="text" name="floor_name" id="floor_name">
						</td>
					</tr>
					<tr>
						<th>容   量：<font color="red">*</font></th>
						<td>
							<input type="text" name="floor_capacity" id="floor_capacity">
							<input type="hidden" name="floor_qty" id="floor_qty">
							<span id="floor_qty_span"></span>
						</td>
					</tr>
					<tr>
						<th>存放类型<font color="red">*</font></th>
						<td>
							<select  name="floor_type" id="floor_type"></select>
						</td>
					</tr>
					<tr>
						<th>备    注：</th>
						<td>
							<textarea rows="5" style="resize: none;width:100%" name="floor_comment" id="floor_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2">
							<input type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveFloor()"> &nbsp;&nbsp;
							<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#floorDiv').dialog('close');">
						</td>
					</tr>					
				</table>
			</form>
		</div>
	</body>
</html>