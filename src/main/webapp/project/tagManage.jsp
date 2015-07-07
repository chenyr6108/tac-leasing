<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>标签管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function doQuery(){
				$("#form1").submit();
			}
			
			function updateTagStatus(id,status){
				var  param = {__action:'tagManageCommand.updateTagStatus','id':id,'status':status};
				if(status == 1){
					if(confirm("确定要作废？")){
						$.ajax({
								type:'post',
								url:'${ctx}/servlet/defaultDispatcher',
								data:param,
								dataType:'json',
								success:function(data){
									var success = data.success;
									if(success){
										alertMessage("操作成功");																		
									}else{
										alertMessage("操作失败");
									}					
								}
						});					
					}
				}else {
					$.ajax({
						type:'post',
						url:'${ctx}/servlet/defaultDispatcher',
						data:param,
						dataType:'json',
						success:function(data){
							var success = data.success;
							if(success){
								alertMessage("操作成功");																		
							}else{
								alertMessage("操作失败");
							}					
						}
				});	
				}
			}
			
			function  alertMessage(message){
				 $("#dialog-message" ).html("<p>" + message + "</p>");				
				 $("#dialog-message" ).dialog({
					 modal: true,
					 buttons: {
						 确认: function() {
							 $( this ).dialog( "close" );
							 doQuery();
						 	}
						 }
				});
				
			}

		</script>		
	</head>
	<body>
		<div id="dialog-message" title="提示" style="display:none">
			
		</div>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="tagManageCommand.getTags" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;标签管理</span>
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
					          		<td>标签名称：</td>
									<td><input type="text" name="tagName" value="${tagName}"/></td>	
									<td>标签类型：</td>
									<td>
										<select name="tagType">
											<option value=""  <c:if test="${empty tagType}">selected="selected"</c:if>>--请选择--</option>
											<option value="1" <c:if test="${tagType eq '1'}">selected="selected"</c:if> >案件</option>
										</select>
										&nbsp;
									</td>
									<td>标签状态：</td>
									<td>
										<select name="status">
											<option value=""  <c:if test="${empty status}">selected="selected"</c:if>>--请选择--</option>
											<option value="0" <c:if test="${status eq '0'}">selected="selected"</c:if> >启用</option>
											<option value="1" <c:if test="${status eq '1'}">selected="selected"</c:if> >作废</option>
										</select>
										&nbsp;
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
							<td><input type="button" name="btn" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=tagManageCommand.initTagCreate'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建标签"></td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										标签状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										标签图标
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										标签名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										标签CODE
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										标签类型
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										备注
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										最新修改人
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>																									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><c:choose><c:when test="${item.status == 0 }"><img src="${ctx }/images/u620.gif" title="启用"></c:when><c:otherwise><img src="${ctx }/images/u617.gif" title="作废"></c:otherwise></c:choose></td>
										<td style="text-align: center;"><img src="${ctx }/images/tags/${item.tagColor}.png"></td>
										<td style="text-align: center;">${item.tagName }&nbsp;</td>
										<td style="text-align: center;">${item.tagCode }&nbsp;</td>
										<td style="text-align: center;"><c:if test="${item.tagType == 1}">案件</c:if>&nbsp;</td>
										<td style="text-align: center;">${item.comments }&nbsp;</td>	
										<td style="text-align: center;">${item.modify_by }&nbsp;</td>	
										<td>
											
											<a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=tagManageCommand.initTagModify&id=${item.id }'">修改 </a>|
										<c:choose>
											<c:when test="${item.status == 0 }">	
												<font color="#c0c0c0">启用  </font>|<a href="javascript:void(0)" onclick="updateTagStatus(${item.id },1)">作废  </a>	
											</c:when>
											<c:when test="${item.status == 1 }">
												<a href="javascript:void(0)" onclick="updateTagStatus(${item.id },0)">启用  </a><font color="#c0c0c0">作废  </font>
											</c:when>
										</c:choose>								
										</td>							
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw}"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u620.gif">
										启用
										<img src="${ctx }/images/u617.gif">
										作废&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
		</form>
	
	</body>
</html>