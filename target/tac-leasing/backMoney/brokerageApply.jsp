<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>乘用车佣金请款</title>
		<script type="text/javascript">
			
			$(function (){
				var date = new Date();
				var defaultValue = date.getFullYear() + "" + getFullString(date.getMonth() + 1) + "" + date.getDate();
				$("#charge_code").val(defaultValue)
					.css("color", "#999999");
				$("#charge_code").bind("focus", function (){
					if($(this).val() == defaultValue){
						$(this).val("").css("color", "");
					}
				}).bind("blur", function (){
					if($(this).val() == ""){
						$(this).val(defaultValue).css("color", "#999999");
					}
				});
			});
		
			function addPayHandlingCharge(){
				/* $("#showAddProjectWin").dialog({modal:true, autoOpen:false, width:400});
		  		$("#showAddProjectWin").dialog("open"); */
		  		var url = "../servlet/defaultDispatcher";
		  		var map = {"user_id" : "${sessionScope.s_employeeId }", "__action" : "backMoney.addHandlingCharge"};
		  		alert(url);
		  		$.getJSON(url, map, function (data){
		  			alert(data);
		  			$("#form1").submit();
		  		});
			}
			
			function addProject(){
				
			}
			
			function getFullString(str){
				if((str + "").length == 1){
					str = "0" + str;
				}
				return str;
			}
			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="backMoney.queryHandlingCharge" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车佣金请款</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="middle">
				          <table style="margin-left: 10px;">
				          		<tr>
						          <td>状态：</td>
						          <td>
						          	<select name="search_status" class="panel_select">
						          		<option value="">全部</option>
						          		<option value="1" <c:if test="${search_status eq '1' }">selected="selected"</c:if>>未拨款</option>
						          		<option value="2" <c:if test="${search_status eq '2' }">selected="selected"</c:if>>拨款中</option>
						          		<option value="3" <c:if test="${search_status eq '3' }">selected="selected"</c:if>>已拨款</option>
						          		<option value="-2" <c:if test="${search_status eq '-2' }">selected="selected"</c:if>>作废</option>
						          	</select>
						          </td>
						          <td>查询内容：</td>
						          <td>
						          	<input type="text" name="search_value" value="${search_value }" class="panel_text" style="width: 300px;" />
						          </td>
					          </tr>
				          </table>
				        </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table style="width: 100%;">
						<tr>
							<td>
								<input type="button" value="新建拨款" class="panel_button" onclick="addPayHandlingCharge();"/>
							</td>
							<td align="right">
								<page:pagingToolbarTop pagingInfo="${dw }"/>
							</td>
						</tr>
					</table>
						<table class="grid_table">
							<tr>
								<th>
									状态
								</th>
								<th>
									单号
								</th>
								<th>
									金额
								</th>
								<th>
									创建人
								</th>
								<th>
									最后维护人
								</th>
								<th>
									最后更新时间
								</th>
								<th>
									操作
								</th>
							</tr>
							<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
								<tr>
									<td style="text-align: center; cursor: pointer;" >
										<c:if test="${item.status == 0}">
											<img src="${ctx }/images/u608.gif" title="拨款中">
										</c:if>
										<c:if test="${item.status == 1}">
											<img src="${ctx }/images/u611.gif" title="完成付款">
										</c:if>
										<c:if test="${item.status == -2}">
											<img src="${ctx }/images/u622.gif" title="作废">
										</c:if>
									</td>
									<td style="text-align: center;">${item.charge_code }&nbsp;</td>
									<td style="text-align: center;">${item.pay_money }&nbsp;</td>
									<td style="text-align: center;">${item.create_by }</td>
									<td style="text-align: center;">${item.modify_by }</td>
									<td style="text-align: center;"><fmt:formatDate value="${item.modify_date }" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td style="text-align: center;">
										<a>添加</a>
										&nbsp;
									</td>
								</tr>
								<tr>
									<th class="pact" colspan="13">
										<div id="pactTr${item.id }" align="center"
											style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<img src="${ctx }/images/loading.gif">
										</div>
									</th>
								</tr>
							</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">
										拨款中
										<img src="${ctx }/images/u622.gif">
										作废
										<img src="${ctx }/images/u611.gif">
										完成拨款&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
			
			<!-- 新建拨款 -->
			<div id="showAddProjectWin" title="新建拨款" style="display: none;">
			<form action="../servlet/defaultDispatcher" id="showAddProjectForm" method="post">
			<input type="hidden" id="action_add" name="__action"  value="backMoney.addHandlingCharge" />
				<table class="panel_table">
					<tr>
						<th>单号：</th>
						<td style="text-align: left;">
							<input type="text" name="charge_code" id="charge_code" class="panel_text" style="width: 200px;"/>
						</td>
					</tr>
					<tr>
						<th colspan="2" style="text-align: center;">
							<input type="button" value="提交" class="panel_button" onclick="addProject();">
						</th>
					</tr>
				</table>
			</form>
			</div>
	</body>
</html>