<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乘用车拨款日首期支付日更改</title>
<script type="text/javascript">
	$(function() {
		/* $("#payDate").datepicker($.datepicker.regional['zh-CN']);
		$("#firstPayDate").datepicker($.datepicker.regional['zh-CN']); */
		$("#newDate").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function openDialog(custName,recpId,creditId) {
		
		$("#custName").html(custName);
		$("#payDate").val("");
		$("#firstPayDate").val("");
		
		$("#updateDiv").dialog({
			draggable: true,resizable:true, modal: true,closeOnEscape: false ,title: "更新" ,
			width:300,height:180,position:['center',150],
			buttons: {
			 	关闭: function() {
			 		$(this).dialog("close");
			 	},
			 	更新: function() {
			 		updateDate(recpId,creditId);
			 	}
			 }				
		});
	}
	
	function updateDate(recpId,creditId) {
		/* if($("#firstPayDate").val()=="") {
			alert("首期支付日未填写!");
			$("#firstPayDate").focus();
			return;
		}
		if($("#payDate").val()=="") {
			alert("拨款日未填写!");
			$("#payDate").focus();
			return;
		} */
		
		if($("#newDate").val()=="") {
			alert("银行拨款日未填写!");
			$("#newDate").focus();
			return;
		}
		
		/* if(!confirm("确认首期支付日："+$("#firstPayDate").val()+", 拨款日："+$("#payDate").val())) {
			return;
		} */
		if(!confirm("银行拨款日："+$("#newDate").val())) {
			return;
		}
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=businessSupport.updateMotorCarDate&recpId='+recpId+'&creditId='+creditId+'&newDate='+$("#newDate").val(),
			dataType:'json',
			success:function(dataMap) {		
				alert(dataMap.msg);
				$("#form1").submit();
			}
		});
	}
	
	function enableDate(recpId) {
		if(!confirm("确认启用么?")) {
			return;
		}
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=businessSupport.enableMotorCarDate&recpId='+recpId,
			dataType:'json',
			success:function(flag) {		
				if(flag) {
					alert("启用成功");
					$("#form1").submit();
				}
			}
		});
	}
	
	function alertMsg() {
		alert("不好了,想要再修改要上资讯需求单了!");
	}
	
	function expand(iddiv,recpId) {
        $("#"+iddiv).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=businessSupport.queryMotorCarLog&recpId="+recpId);
        });
	}
</script>
</head>
<body>
	<form id="form1" name="form1" method="post"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="businessSupport.queryMotorCarRecp"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;乘用车首期支付日更改</span>
		   	</div><br>
		   	<table width="70%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
		      <tr>
		      	<td width="8">&nbsp;</td>
		        <td width="60" class="ss_o"></td>
		        <td width="60%" class="ss_t">
		          <table style="margin-left: 10px;">
			          <tr>
			          	<td>查询内容：</td>
			          	<td>
			          		<input type="text" name="content" value="${content }">
			          	</td>
			          	<td>办事处：</td>
			          	<td>
			          		<select name="deptId">
			          			<option value="">--所有--</option>
			          			<c:forEach items="${deptList }" var="item">
			          				<option <c:if test="${deptId eq item.COMPANYID }">selected="selected"</c:if> value="${item.COMPANYID }">${item.COMPANYNAME }</option>
			          			</c:forEach>
			          		</select>
			          	</td>
			    	  </tr>
		          </table>
		        </td>
		        <td width="55" class="ss_th" valign="top">&nbsp;</td>
		        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
		      </tr>
			</table>
			<br>
	          <div class="zc_grid_body jqgrowleft"><br>
				<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										序号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支付表号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo}">案件号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo}">客户名称</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo}">业务经办</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务主管
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										拨款金额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="FINANCECONTRACT_DATE" pagingInfo="${pagingInfo}">拨款日</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="FIRST_PAY_DATE" pagingInfo="${pagingInfo}">首期支付日</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作日志
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="COUNT" pagingInfo="${pagingInfo}">修改次数</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
									<c:if test="${flag==true }">
										<th class="ui-state-default ui-th-ltr zc_grid_head">
											重新开启更新操作(资讯操作)
										</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;">
											<a onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'" href="javascript:void(0);">${item.RECP_CODE }</a>
										</td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.NAME }</td>
										<td style="text-align: center;">${item.UP_NAME }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
										<td style="text-align: center;">${item.FINANCECONTRACT_DATE }</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.FIRST_PAY_DATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: left;">${item.MEMO }&nbsp;</td>
										<td style="text-align: right;">
											<c:if test="${item.COUNT>0 }">
												<c:if test="${flag==true }">
													<a href="#" onClick="expand('pactAffix${item.RECP_ID}',${item.RECP_ID});">${item.COUNT }</a>
												</c:if>
												<c:if test="${flag!=true }">
													${item.COUNT }
												</c:if>
											</c:if>
											<c:if test="${item.COUNT==0 }">${item.COUNT }</c:if>
										</td>
										<td style="text-align: center;" <c:if test="${item.AUTH_COUNT>0 }">onclick="alertMsg()"</c:if>>
											<input type="button" class="panel_button" value="更新" <c:if test="${item.AUTH_COUNT>0 }">disabled="disabled"</c:if> onclick="openDialog('${item.CUST_NAME }','${item.RECP_ID }','${item.ID }')">
										</td>
										<c:if test="${flag==true }">
											<td style="text-align: center;width: 170px;">
												<input type="button" class="panel_button" value="启用" onclick="enableDate('${item.RECP_ID}')" <c:if test="${item.AUTH_COUNT==0 }">disabled="disabled"</c:if>>
											</td>
										</c:if>
									</tr>
									<tr>
										<td class="pact" colspan="13">
											<div id="pactAffix${item.RECP_ID }" align="left"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:70%">
												<img src="${ctx }/images/029.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
			  </div>
		    </div>
		    <br><br>
		    <font color="red">*请注意</font>&nbsp;&nbsp;选择日期后,银行拨款日会更新为所选日期,每行数据只允许修改<font color="red">1</font>次,如果更新错误需提交资讯需求单方能再次修改
	 </form>
	 <div id="updateDiv" style="display: none;text-align: left;">
			<table class="ui-jqgrid-htable zc_grid_title" style="margin-left: 2px;">
				<tr>
					<td style="text-align: right;">
						客户名称：
						<br>
					</td>
					<td><p id="custName"></p></td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<font color="red">*</font>银行拨款日：
						<br>
					</td>
					<td><input id="newDate" style="width: 80px;" readonly="readonly"></td>
				</tr>
				<!-- <tr>
					<td style="text-align: right;">
						<font color="red">*</font>首期支付日：
						<br>
					</td>
					<td><input id="firstPayDate" style="width: 80px;" readonly="readonly"></td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<font color="red">*</font>拨款日：
					</td>
					<td><input id="payDate" style="width: 80px;" readonly="readonly"></td>
				</tr> -->
			</table>
		</div>
</html>