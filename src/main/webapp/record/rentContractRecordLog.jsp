<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>档案日志查询</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/record/js/record.js"></script>
		<script type="text/javascript">			
			
			function doQuery(){
				$("#form1").submit();
			}
			

			var user_map = null;
			
			$(function(){
				$("#startDate").datepicker($.datepicker.regional['zh-CN']);
				$("#endDate").datepicker($.datepicker.regional['zh-CN']);
			});	
			
			function showComment(id){
				var flag = $("#"+id).is(":hidden");//是否隐藏
				if(flag){
					$("#"+id).show();
				}else{
					$("#"+id).hide();
				}			
			}
		</script>		
	</head>
	<body>

		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" value="recordCommand.getRentContractRecordLog" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;档案日志查询</span>
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
					          		<td>借出日期:</td>
					          		<td><input type="text" id="startDate" name="startDate" value="${startDate }" size="12"/>~<input type="text" id="endDate" name="endDate" value="${endDate}" size="12"/></td>
					          		<td>用途：</td>
					          		<td>
										<select name="reason" id="reason">
											<option value="">--请选择--</option>
											<option value="调阅" <c:if test="${reason eq '调阅' }">selected</c:if>>调阅</option>
											<option value="增案" <c:if test="${reason eq '增案' }">selected</c:if>>增案</option>
											<option value="变更" <c:if test="${reason eq '变更' }">selected</c:if>>变更</option>
											<option value="拨尾款" <c:if test="${reason eq '拨尾款' }">selected</c:if>>拨尾款</option>
											<option value="结清" <c:if test="${reason eq '结清' }">selected</c:if>>结清</option>
											<option value="诉讼" <c:if test="${reason eq '诉讼' }">selected</c:if>>诉讼</option>
											<option value="回访" <c:if test="${reason eq '回访' }">selected</c:if>>回访</option>
											<option value="转移" <c:if test="${reason eq '转移' }">selected</c:if>>转移</option>
											<option value="其他"<c:if test="${reason eq '其他' }">selected</c:if>>其他</option>
										</select>
									</td>
									<td>状态：</td>
									<td>
									<select name="status">
										<option value="">--请选择--</option>
										<option value="0" <c:if test="${status eq '0' }">selected</c:if>>未归还</option>
										<option value="1" <c:if test="${status eq '1' }">selected</c:if>>已归还</option>
									</select>
									</td>
					          	</tr>
					          	<tr>
					          		<td>内容：</td>
									<td><input type="text" name="comment" value="${comment}" size="28"/></td>
									<td>出库人员：</td>
									<td><input type="text" name="createUser" value="${createUser}" size="12"/></td>
					          		<td>调阅人员：</td>
									<td><input type="text" name="borrower" value="${borrower}" size="12"/></td>									
								</tr>
							  </table>
				            </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
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
									<th >
										合同号
									</th>
									<th >
										客户名称
									</th>
									<th >
										调阅人员
									</th>
									<th >
										调阅日期
									</th>
									<th >
										计划归还日期
									</th>
									<th >
										调阅位置
									</th>
									<th >
										调阅用途
									</th>								
									<th>
										归还日期
									</th>
									<th >
										存放位置
									</th>
									<th >
										出库人员
									</th>
									<th >
										入库人员
									</th>																									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr style="cursor:pointer" onclick="showComment('comment_${item.ID}')">
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BORROWER }&nbsp;</td>
										<td style="text-align: center;">${item.BORROW_DATE }&nbsp;</td>
										<td style="text-align: center;">${item.PLAN_RETURN_DATE }&nbsp;</td>
										<td style="text-align: center;">${item.FROM_POSITION }&nbsp;</td>
										<td style="text-align: center;">${item.REASON }&nbsp;</td>
										<td style="text-align: center;">${item.RETURN_DATE }&nbsp;</td>	
										<td style="text-align: center;">${item.TO_POSITION }&nbsp;</td>	
										<td style="text-align: center;">${item.CREATE_USER}&nbsp;</td>	
										<td style="text-align: center;">${item.MODIFY_USER}&nbsp;</td>							
									</tr>
									<tr id="comment_${item.ID}" style="display:none">
										<th colspan="10">
											<div align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px; width: 60%">
												<table class="panel_table">
													<tr>
														<th width="20%">调阅备注</th>
														<td>${item.COMMENT}</td>
													</tr>
													<c:if test="${not empty item.RETURN_DATE }">
													<tr>													
														<th>归还备注</th>
														<td>${item.RETURN_COMMENT}</td>
													</tr>
													</c:if>
												</table>
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
	</body>
</html>