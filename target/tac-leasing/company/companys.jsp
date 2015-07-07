<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>公司管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function doQuery(){
				$("#form1").submit();
			}
			
			function companyManage(flag,id){
				$("#saveBtn").removeAttr("disabled");
				$("#companyId").val("");
				var title = '新建公司';
				if(flag==2){//edit
					title = '编辑公司';
					var params = {"id":id};
					$.ajax({
						url:"${ctx}/servlet/defaultDispatcher?__action=companyCommand.getCompanyById",
						dataType:"json",
						data:params,
						type:"post",
						async:false,
						success:function(data){
							$("#companyId").val(data.id);
							$("#companyName").val(data.name);
							$("#companyCode").val(data.code);
							$("#legalPerson").val(data.legalPerson);
							$("#companyTelephone").val(data.telephone);
							$("#companyFax").val(data.fax);
							$("#companyAddress").val(data.address);
							$("#companyUrl").val(data.url);
							$("#companyPostcode").val(data.postcode);
							$("#companyOrder").val(data.orderNo);
							var parentId = data.parentId;
							
							if(!parentId || parentId == ''){
								$("#parentId").get(0).selectedIndex = 0;
							}else{
								$("#parentId").find("option").each(function(){
									if(this.value== parentId){
										$(this).attr("selected",true);
									}else{
										$(this).removeAttr("selected");
									}
									
								});
							}
						},
						error:function(){
							alert("操作失败，请联系系统管理员！");
						}	
					});	
				}else{					
					$("#parentId").get(0).selectedIndex = 0;
				}
				$("#companyManageDiv").dialog({
					title:title,
					height: 380,
					width:480,
					modal: true,
					resizable:false
				});				
			}
			
			function saveCompany(){
				if($("#companyName").val()==""){
					alert("公司名称不能为空！");
					return;
				}
				$("#saveBtn").attr("disabled","disabled");
				var params = $("#companyForm").serializeArray();
				var action  = "companyCommand.addCompany";
				if($("#companyId").val()!=""){
					action  = "companyCommand.modifyCompany";
				}
				$.ajax({
					url:"${ctx}/servlet/defaultDispatcher?__action=" + action,
					dataType:"json",
					data:params,
					type:"post",
					async:false,
					success:function(data){
						alert("操作成功");
						$("#companyManageDiv").dialog("close");
						doQuery();
					},
					error:function(){
						alert("操作失败，请联系系统管理员！");
						$("#saveBtn").removeAttr("disabled");
					}	
				});	
				
			}
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="companyCommand.getCompanys" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;公司管理</span>
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
					          		<td>内容:</td>
									<td><input type="text" name="content" value="${content}"/></td>		
								</tr>
							  </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜索</a></td>
					      </tr>
				    </table>
				
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr>
							<td><input type="button" name="btn" onclick="companyManage(1)" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建"></td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
							<thead>
								<tr>
								     <th>公司名称&nbsp;</th>
								     <th>法人代表&nbsp;</th>
								     <th>公司代码&nbsp;</th>
								     <th>公司电话&nbsp;</th>
								     <th>公司传真&nbsp;</th>
								     <th>公司网址&nbsp;</th>
								     <th>公司邮编&nbsp;</th>
								     <th>公司地址&nbsp;</th>
								     <th>父公司&nbsp;</th>
								     <th>顺序&nbsp;</th>
								</tr>															
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
								     	<td><a href="javascript:;" onclick="companyManage(2,${item.id})">${item.name}</a>&nbsp;</td>
								     	<td>${item.legalPerson}&nbsp;</td>
								     	<td>${item.code}&nbsp;</td>
								     	<td>${item.telephone}&nbsp;</td>
								     	<td>${item.fax}&nbsp;</td>
								     	<td><a href="${item.url}" target="_blank">${item.url}</a>&nbsp;</td>
								     	<td>${item.postcode}&nbsp;</td>	
								     	<td>${item.address}&nbsp;</td>
								     	<td>${item.parentCompanyName}&nbsp;</td>
								     	<td>${item.orderNo}&nbsp;</td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
						<!--
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u620.gif">
										status1
										<img src="${ctx }/images/u617.gif">
										status2&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
						-->
				</div>
				</div>
				</div>
		</form>
		<div id="companyManageDiv" style="display:none">
			<form action="" id="companyForm">
			<input type="hidden" name="companyId" id="companyId">
			<table class="panel_table">
				<tr>
					<th>公司名称：</th>
					<td>
						<input type="text" name ="companyName" id="companyName"/>
					</td>
				</tr>
				<tr>
					<th>公司代码：</th>
					<td>
						<input type="text" name="companyCode" id="companyCode"/>
					</td>
				</tr>
				<tr>
					<th>法人代表：</th>
					<td>
						<input type="text" name="legalPerson" id="legalPerson"/>
					</td>
				</tr>
				<tr>
					<th>公司电话：</th>
					<td>
						<input type="text" name="companyTelephone" id="companyTelephone"/>
					</td>
				</tr>
				<tr>
					<th>公司传真：</th>
					<td>
						<input type="text" name="companyFax" id="companyFax"/>
					</td>
				</tr>
				<tr>
					<th>公司网址：</th>
					<td>
						<input type="text" name="companyUrl" id="companyUrl"/>
					</td>
				</tr>
				<tr>
					<th>公司邮编：</th>
					<td>
						<input type="text" name="companyPostcode" id="companyPostcode"/>
					</td>
				</tr>
				<tr>
					<th>公司地址：</th>
					<td>
						<input type="text" size="50" name="companyAddress" id="companyAddress"/>
					</td>
				</tr>
				<tr>
					<th>公司排序：</th>
					<td>
						<input type="text" size="5" name="companyOrder" id="companyOrder"/>
					</td>
				</tr>	
				<tr>
					<th>父公司：</th>
					<td>
						<select id="parentId" name="parentId">
					 			<option value="">--请选择--</option>
					 			<c:forEach var="company" items="${companys}">
						 			<option value="${company.id }">${company.name }</option>
					 			</c:forEach>
				 		</select>
					</td>
				</tr>				
				<tr>
					<td style="text-align:center" colspan="2">
						<input id="saveBtn" type="button" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveCompany()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#companyManageDiv').dialog('close');">
					</td>
				</tr>								
			</table>
			</form>
		</div>
	</body>
</html>