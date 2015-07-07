<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" value="businessSupport.decomposePledgeBQuery">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;历史手动冲回的保证金B之数据</span>
	    </div>
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
            <div class="zc_grid_body jqgrowleft">
            	<div>
            		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="70%" class="ss_t">
				          <table style="margin-left:10px;">
					          <tr>
					          	 <td>&nbsp;&nbsp;查询内容：</td>
					          	 <td>
					          	 	<input name="content" id="content" value="${content }">
					          	 </td>
					          </tr>
				          </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
            	</div>
            	<div class="ui-state-default ui-jqgrid-hdiv" style="background: white;">
            	<page:pagingToolbar pagingInfo="${pagingInfo }"/>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
						<tr>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								序号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								案件号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								客户名称
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								合同号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								支付表号
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								保证金类型
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="PRICE" pagingInfo="${pagingInfo }">保证金金额</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo }">冲回操作人</page:pagingSort>
							</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 11px;">
								<page:pagingSort orderBy="CREATE_TIME" pagingInfo="${pagingInfo }">冲回时间</page:pagingSort>
							</th>
						</tr>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${item.RECP_STATUS == 3 }">style="background:gray"</c:if>>
							<td style="text-align: center;">${index.count }</td>
							<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align: center;">${item.LEASE_CODE }</td>
							<td style="text-align: center;">${item.RECP_CODE }</td>
							<td style="text-align: center;">${item.PLEDGE_TYPE }</td>
							<td style="text-align: right;"><fmt:formatNumber value="${item.PRICE }" pattern="#,##0.00"/>&nbsp;</td>
							<td style="text-align: center;">${item.NAME }</td>
							<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
					</table>
					<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
            </div>
        </div>
	</form>
	<br>
	<form action="../servlet/defaultDispatcher?__action=businessSupport.decomposePledgeB" name="form2" id="form2" method="post">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 400px;">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;手动冲回保证金B至待分解来款</span>
	    </div>
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 400px;">
            <div class="zc_grid_body jqgrowleft" style="width: 400px;">
            	<div>
            	</div>
            	<div class="ui-state-default ui-jqgrid-hdiv" style="background-color: white;">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td style="width: 60%;text-align: center;">
								支付表号:<input name="recpCode" id="recpCode"><font color="red">*</font>
							</td>
							<td><input type="button" value="冲回" class="ui-state-default ui-corner-all" style="height: 25px;" onclick="chargeBack()"></td>
						</tr>
					</table>
				</div>
            </div>
        </div>
	</form>
</body>
<script type="text/javascript">
	function chargeBack() {
		if($("#recpCode").val()=='') {
			alert("支付表号不能为空!");
			$("#recpCode").focus();
			return;
		}
		if(!confirm("确认冲回?")) {
			return;
		}
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=businessSupport.decomposePledgeB&recpCode="+$("#recpCode").val(),
			dataType:"json",
			success:function(map) {
				if(map==null) {
					alert("生成失败!");
					return;
				}
				alert(map.msg);
				$("#form1").submit();
			},
			error:function() {
				alert("生成失败!");
			}
     	});
	}
</script>
</html>