<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(function() {
		$("#fromDate").datepicker($.datepicker.regional['zh-CN']);
		$("#toDate").datepicker($.datepicker.regional['zh-CN']);
		$("#refundDate").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function showClaimDiv(incomeId,restMoney) {
		$("#claimBtn").attr("disabled",false);
		$("input[name=claimIncomeId]").val(incomeId);
		$("input[name=claimRestMoney]").val(restMoney);
		$("#claimMoney").val("");
		$("#claimReason").val("");
		$("#claimDiv").dialog({modal:true, autoOpen:false, width:510 ,position:['center',150], show:'slide'});
		$("#claimDiv").dialog("open");
	}
	function showRefundDiv(incomeId,restMoney,incomeName,incomeAccount) {
		
		$("#refundBtn").attr("disabled",false);
		$("input[name=refundIncomeId]").val(incomeId);
		$("input[name=refundRestMoney]").val(restMoney);
		$("#payee").val(incomeName);
		$("input[name='other']").val("");
		$("#refundMoney").val("");
		$("#fee").val("");
		$("#amount").val("");
		$("#refundRemark").val("");
		$("#bankName").val("");
		$("#bankAccount").val(incomeAccount);
		$("#refundType").val(0);
		$("#payWay").val(0);
		$(".reason_other_r").css("display", "none");
		$("#refundDiv table").find("tr").eq(2).hide();
		var now=new Date();
		$("#refundDate").val(now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate());
		$("#refundDiv").dialog({modal:true, autoOpen:false, width:600 ,position:['center',150], show:'slide'});
		$("#refundDiv").dialog("open");
	}
	
	function clearNoNum(obj) {
		//先把非数字的都替换掉，除了数字和.
		obj.value = obj.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.		
		obj.value = obj.value.replace(/^\./g,"");		
		//保证只有出现一个.而没有多个.		
		obj.value = obj.value.replace(/\.{2,}/g,".");		
		//保证.只出现一次，而不能出现两次以上		
		obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");		
	}
	
	function checkAmount(id,id1) {
		if($("#"+id).val()-$("#"+id1).val()<0) {
			alert("金额不能大于剩余金额");
			$("#"+id1).val("");
			if(id1=="refundMoney") {
				$("#fee").val("");
				$("#amount").val("");
			}
			return;
		}
	}
	
	function commitClaim() {
		if($.trim($("#claimMoney").val())=='') {
			alert("请填写认领金额!");
			$("#claimMoney").focus();
			return;
		}
		if($.trim($("#claimReason").val())=='') {
			alert("请填写认领原因!");
			$("#claimReason").focus();
			return;
		}
		//后台验证认领金额是否大于剩余金额
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'rentFinanceCommand.checkClaimRefundAmount',incomeId:$("#claimIncomeId").val(),money:$("#claimMoney").val()},
			dataType:'json',
			success:function(flag) { 
				if(flag) {
					alert("认领金额大于剩余金额!");
				} else {
					$("#claimBtn").attr("disabled",true);
					$("#claimForm").submit();
				}
			}
		});
	}
	
	function commitRefund() {
		if($.trim($("#payee").val())=='') {
			alert("请填写收款人!");
			$("#payee").focus();
			return;
		}
		if($.trim($("#amount").val())=='') {
			alert("请填写实际退款总额!");
			$("#amount").focus();
			return;
		}
		if($.trim($("#refundRemark").val())=='') {
			alert("请填写备注!");
			$("#refundRemark").focus();
			return;
		}
		if($("#refundType").val()==0) {
			alert("请选择请款说明!");
			return;
		}
		if($("#payWay").val()==0) {
			alert("请选择支付方式!");
			return;
		}
		if($("#refundType").val()=='误汇款'||$("#refundType").val()=='保险退款') {
			if($.trim($("#refundMoney").val())=='') {
				alert("请填写退款总额!");
				$("#refundType").focus();
				return;
			}
		} else if($("#refundType").val()==-1) {
			if($.trim($("input[name='other']").val())=="") {
				alert("请填写其他说明!");
				$("input[name='other']").focus();
				return;
			}
		}
		//后台验证认领金额是否大于剩余金额
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'rentFinanceCommand.checkClaimRefundAmount',incomeId:$("#refundIncomeId").val(),money:$("#amount").val()},
			dataType:'json',
			success:function(flag) { 
				if(flag) {
					alert("认领金额大于剩余金额!");
				} else {
					$("#refundBtn").attr("disabled",true);
					$("#refundForm").submit();
				}
			}
		});
	}
	
	function showClaimRefundList(incomeId) {
		$("#pactAffix_"+incomeId).toggle(function() {
	        $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.showClaimRefundList&incomeId="+incomeId);
	    });
	}
	
	function approveFund(incomeId) {
		if(!confirm("确认通过?")) {
			return;
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'rentFinanceCommand.approveFund',incomeId:incomeId},
			dataType:'json',
			success:function(data) { 
				alert("操作完成!");
				$("#form1").submit();
			}
		});
	}
	
	function showRemarkDiv(incomeId,remark) {
		
		$("#addRemark").val("");
		$("#remark").html(remark);
		$("#remarkDiv").dialog({
			draggable: true,resizable:true, modal: true,closeOnEscape: false ,title: "添加备注" ,
			width:400,height:300,position:['center',150],show:'slide',
			buttons: {
			 	关闭: function() {
			 		$(this).dialog("close");
			 	},
			 	添加: function() {
			 		addRemark(incomeId,$("#addRemark").val());
			 	}
			 }				
		});
	}
	
	function addRemark(incomeId,remark) {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'rentFinanceCommand.addRemark',incomeId:incomeId,remark:remark},
			dataType:'json',
			success:function(data) { 
				alert("添加完成!");
				$("#form1").submit();
			}
		});
	}
	
	//显示与来款金额相同的合同
	function showCustRecp(incomeMoney) {
		$.ajax({
			type:"POST",
			data:'__action=decompose.getCustRecpFundReturn&FOUND='+incomeMoney,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack) {
				var html="";
				var loop=databack.writeBackDetails.length;
	
				html="<tr class=\"ui-jqgrid-labels\">"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">客户名称</th>"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">合同号</th>"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">期数</th>"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">支付日期</th>"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">应付租金</th>"+
				"<th class=\"ui-state-default ui-th-ltr zc_grid_head\">业务员</th>"+
				"</tr>";
				
				for(var i=0;i<loop;i++) {
					html+="<tr class='ui-widget-content jqgrow ui-row-ltr'>";
					html+="<td style='text-align:center'>"+databack.writeBackDetails[i].CUST_NAME+"</td>";
					html+="<td style='text-align:center'>"+databack.writeBackDetails[i].LEASE_CODE+"</td>";
					html+="<td style='text-align:right'>"+databack.writeBackDetails[i].PERIOD_NUM+"</td>";
					html+="<td style='text-align:center'>"+databack.writeBackDetails[i].PAY_DATE+"</td>";
					html+="<td style='text-align:right'>￥"+databack.writeBackDetails[i].IRR_MONTH_PRICE+"</td>";
					html+="<td style='text-align:center'>"+databack.writeBackDetails[i].NAME+"</td>";
					html+="</tr>";
				}
				html+="<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center' colspan='6'>";
				html+="<input type='button' value='关&nbsp;闭' onclick="+"$('#showCustRecpDiv').dialog('close');"+" class='ui-state-default ui-corner-all'>";
				html+="</td></tr>";
				$("#showCustRecpTableID").html(html);
			},
			error:function(databack) {
				alert("网络错误,请稍后重试！");
				return ;
			}
		});
		$("#showCustRecpDiv").dialog({
			modal:true,
			autoOpen:false,
			width:600,
			position:['center',150],
			show:'slide'
		});
		$("#showCustRecpDiv").dialog('open');
	}
	
	function showUploadDiv(incomeId) {
		$("input[name='incomeId']").val(incomeId);
		$("#uploadDiv").dialog({
			modal:true,
			autoOpen:false,
			width:400,
			position:['center',150],
			show:'slide'
		});
		$("#uploadDiv").dialog('open');
	}
	
	function uploadFile() {
		if($("#upLoadFile").val()=='') {
			alert("请选择上传附件!");
			return;
		}
		if(!confirm("确认上传附件?")) {
			return;
		}
		$("#ubtn").attr("disabled",true);
		$("#uploadForm").submit();
	}
	
	function expandUploadFile(incomeId) {	
	    $("#pactAffix"+incomeId).toggle(function() {
	        $(this).load("../servlet/defaultDispatcher?__action=rentFinanceCommand.showUploadFileList&incomeId="+incomeId);
	    });
	}
</script>
<title>暂收款管理</title>
</head>
<body>
	<form name="form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="rentFinanceCommand.queryFundList"/>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	 	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;暂收款管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			      <tr valign="center">
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="500px" class="ss_bigt" valign="center" >
					        <table>
					        	<tr>
					        		<td style="text-align: right;">
					        			来款时间：
					        		</td>
					        		<td>
					        			<input name="fromDate" id="fromDate" style="width: 80px;" readonly="readonly" value="${fromDate }">-
					        			<input name="toDate" id="toDate" style="width: 80px;" readonly="readonly" value="${toDate }">
					        		</td>
					        		<td style="text-align: right;">
					        			&nbsp;&nbsp;来款金额：
					        		</td>
					         		<td colspan="2">
					         			<input id="fromMoney" name="fromMoney" value="${fromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="toMoney" name="toMoney" value="${toMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
					        	</tr>
					        	<tr>
				         			<td style="text-align: right;">查询内容：</td>
				         			<td><input id="content" name="content" value="${content }" style="width: 169px;"></td>
				         			<td style="text-align: right;">
					        			&nbsp;&nbsp;剩余金额：
					        		</td>
					         		<td>
					         			<input id="restFromMoney" name="restFromMoney" value="${restFromMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="restToMoney" name="restToMoney" value="${restToMoney }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
				         		</tr>
				         		<tr>
				         			<td style="text-align: right;">是否备注：</td>
				         			<td>
				         				<select name="hasRemark" style="width: 60px;">
				         					<option value="0" <c:if test="${hasRemark eq 0 }">selected="selected"</c:if>>
				         						全部
				         					</option>
				         					<option value="1" <c:if test="${hasRemark eq 1 }">selected="selected"</c:if>>
				         						是
				         					</option>
				         					<option value="-1" <c:if test="${hasRemark eq -1 }">selected="selected"</c:if>>
				         						否
				         					</option>
				         				</select>
				         			</td>
				         			<td style="text-align: right;">认退记录：</td>
				         			<td colspan="2">
					         			<input id="fromCount" name="fromCount" value="${fromCount }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">-
					         			<input id="toCount" name="toCount" value="${toCount }" style="width: 60px;" onkeyup="value=value.replace(/[^\d]/g,'')">
				         			</td>
				         		</tr>
				         		<tr>
				         			<td style="text-align: right;">是否有水单：</td>
				         			<td>
				         				<select name="hasFile" style="width: 60px;">
				         					<option value="0" <c:if test="${hasFile eq 0 }">selected="selected"</c:if>>
				         						全部
				         					</option>
				         					<option value="1" <c:if test="${hasFile eq 1 }">selected="selected"</c:if>>
				         						是
				         					</option>
				         					<option value="-1" <c:if test="${hasFile eq -1 }">selected="selected"</c:if>>
				         						否
				         					</option>
				         				</select>
				         			</td>
				         			<td style="text-align: right;">来款状态：</td>
				         			<td>
				         				<select name="initCount">
				         					<option value="2" <c:if test="${initCount eq 2 }">selected="selected"</c:if>>
				         						全部
				         					</option>
				         					<option value="0" <c:if test="${initCount eq 0 }">selected="selected"</c:if>>
				         						初始（可认退）
				         					</option>
				         					<option value="1" <c:if test="${initCount eq 1 }">selected="selected"</c:if>>
				         						有认领或退款
				         					</option>
				         					<option value="-1" <c:if test="${initCount eq -1 }">selected="selected"</c:if>>
				         						未申请
				         					</option>
				         				</select>
				         			</td>
				         			<td>
									公司别：
									<select name="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
				         		</tr>
				 			</table>
			 			</td>
				   		<td width="100" class="ss_bigt" valign="middle">
				   			<a href="javaScript:void(0)" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				     	<td width="13" class="ss_bigth" valign="top">&nbsp;</td>
				  </tr>
				</table>
			</div>
			<br>
		<div class="ui-state-default ui-jqgrid-hdiv">
			<table class="panel_table">
				<tr>
					<td>
						<page:pagingToolbarTop pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th style="text-align:center;">序号</th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="FILE_COUNT">查看水单</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="INCOME_DATE">来款时间</page:pagingSort></th>
					<th style="text-align:center;">对方户名</th>
					<th style="text-align:center;">系统自动匹配之客户名称</th>
					<th style="text-align:center;">对方账号</th>
					<th style="text-align:center;">虚拟账号</th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="INCOME_MONEY">来款金额</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="REST_MONEY">剩余金额</page:pagingSort></th>
					<th style="text-align:center;"><page:pagingSort pagingInfo="${dw }" orderBy="COUNT">认退记录</page:pagingSort></th>
					<th style="text-align:center;">操作</th>
				</tr>
			<c:forEach items="${dw.resultList}" var="item" varStatus="index">
				<tr>
					<td style="text-align:center;">${index.count }&nbsp;</td>
					<td style="text-align:right;">
						<c:if test="${item.FILE_COUNT >0 }"><a href="javascript:void(0)" onclick="expandUploadFile('${item.INCOME_ID }');"><img src="${ctx }/images/attach.jpg" title="已有水单上传" style="cursor: pointer;"></c:if>${item.FILE_COUNT }份<c:if test="${item.FILE_COUNT >0 }"></a></c:if>&nbsp;
					</td>
					<td style="text-align:center">${item.INCOME_DATE }&nbsp;</td>
					<td style="text-align:center">${item.INCOME_NAME }&nbsp;</td>
					<td style="text-align:center">${item.INCOME_NAME_TRUE }&nbsp;</td>
					<td style="text-align:center">${item.INCOME_ACCOUNT }&nbsp;</td>
					<td style="text-align:center">${item.VIRTUAL_ACCOUNT }&nbsp;</td>
					<td style="text-align:right"><a href="javascript:void(0)" onclick="showCustRecp('${item.INCOME_MONEY }')"><fmt:formatNumber type="currency" value="${item.INCOME_MONEY }"/></a>&nbsp;</td>
					<td style="text-align:right"><fmt:formatNumber type="currency" value="${item.REST_MONEY }"/>&nbsp;</td>
					<td style="text-align:center">
						<c:if test="${item.COUNT >0 }"><a href="javascript:void(0)" onclick="showClaimRefundList('${item.INCOME_ID }')">${item.COUNT }</a></c:if>
						<c:if test="${item.COUNT <=0 }">${item.COUNT }&nbsp;</c:if>&nbsp;
					</td>
					<td style="text-align:center">
						&nbsp;
						<c:if test="${CLAIM eq 'Y' }"><c:if test="${item.REST_MONEY>0 }"><a href="javascript:void(0)" onclick="showClaimDiv('${item.INCOME_ID }','${item.REST_MONEY }')">[认领]</a></c:if><c:if test="${item.REST_MONEY<=0 }">[认领]</c:if>&nbsp;</c:if>
						<c:if test="${REFUND eq 'Y' }"><c:if test="${item.REST_MONEY>0 }"><a href="javascript:void(0)" onclick="showRefundDiv('${item.INCOME_ID }','${item.REST_MONEY }','${item.INCOME_NAME }','${item.INCOME_ACCOUNT }')">[退款]</a></c:if><c:if test="${item.REST_MONEY<=0 }">[退款]</c:if>&nbsp;</c:if>
						<c:if test="${APPROVE eq 'Y' }"><c:if test="${item.INIT_COUNT >0 }"><a href="javascript:void(0)" onclick="approveFund('${item.INCOME_ID }')">[通过]</a></c:if><c:if test="${item.INIT_COUNT <=0 }">[通过]</c:if>&nbsp;</c:if>
						<c:if test="${UPLOAD eq 'Y' }"><a href="javascript:void(0)" onclick="showUploadDiv('${item.INCOME_ID }')">[上传水单]</a>&nbsp;</c:if>
						<c:if test="${MODIFY_REMARK eq 'Y' }"><a href="javascript:void(0)" onclick="showRemarkDiv('${item.INCOME_ID }','${item.REMARK }')">[<c:if test="${not empty item.REMARK }">查看或</c:if>添加备注]</a></c:if>
					</td>
				</tr>
				<tr>
					<th colspan="14" class="pact">
						<div id="pactAffix_${item.INCOME_ID}" align="center" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
							<img src="${ctx }/images/029.gif">
						</div>
					</th>
				</tr>
				<tr>
					<th colspan="14" class="pact">
						<div id="pactAffix${item.INCOME_ID}" align="center" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:40%">
							<img src="${ctx }/images/029.gif">
						</div>
					</th>											
				</tr>
			</c:forEach>
		    </table>
		    <table class="panel_table">
				<tr>
					<td>
						<page:pagingToolbar pagingInfo="${dw }"/>
					</td>
				</tr>
			</table>
		  </div>
	    </div>
	</div>
	</form>
	<div style="display:none;" id="claimDiv" title="认领">
		<form id="claimForm" name="claimForm">
		<input type="hidden" id="claimIncomeId" name="claimIncomeId">
		<input type="hidden" id="claimRestMoney" name="claimRestMoney">
		<input type="hidden" name="__action" value="rentFinanceCommand.commitClaim">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		       <div class="zc_grid_body jqgrowleft">
				  <div class="ui-state-default ui-jqgrid-hdiv">
					<table class="panel_table">
						<tr>
							<th style="text-align: right;"><font color="red">*</font>认领金额：</th>
							<td><input type="text" id="claimMoney" name="claimMoney" width="150" class="tb_return" onkeyup="clearNoNum(this)" onblur="checkAmount('claimRestMoney','claimMoney')"/></td>
						</tr>
						<tr>
							<th style="text-align: right;"><font color="red">*</font>是否开立发票：</th>
							<td>
								<select name="claimIsOpenInvoice" id="claimIsOpenInvoice" style="cursor: pointer;">
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</td>
						</tr>					
						<tr>
							<th style="text-align: right;"><font color="red">*</font>认领原因：</th>
							<td>
								<textarea id="claimReason" name="claimReason" rows="8" cols="55" style="border: 1px solid #A6C9E2;"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="button" id="claimBtn" value="确&nbsp;定" onclick="commitClaim()" class="ui-state-default ui-corner-all">
								<input type="button" value="关&nbsp;闭" onclick="$('#claimDiv').dialog('close');" class="ui-state-default ui-corner-all">
							</td>
						</tr>
					</table>
				  </div>
			   </div>
			</div>
		</form>
	</div>
	<div id="remarkDiv" style="display:none">
			<table class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="2" style="text-align: left">
						<p id="remark"></p>
						<br>
					</td>
				</tr>
				<tr>
					<td>
						添加备注
					</td>
					<td>
						<textarea rows="2" cols="40" id="addRemark"></textarea>
					</td>
				</tr>
			</table>
		</div>
	<div style="display: none;" id="showCustRecpDiv" title="相同租金合同">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-widget-content jqgrow ui-row-ltr">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showCustRecpTableID">
					</table>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none;" id="uploadDiv" title="上传水单">
	    <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	       <div class="zc_grid_body jqgrowleft">
				<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
					<input name="incomeId" type="hidden">
					<input name="__action" type="hidden" value="rentFinanceCommand.saveFileToDiskAndDB">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;background: white;border-bottom: 0;"><input class="ui-state-default ui-corner-all" size="15" type="file" name="upLoadFile" id="upLoadFile" style="height: 27px;background: white;"/></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">
								<input type="button" value="上&nbsp;传" onclick="uploadFile()" class="ui-state-default ui-corner-all" id="ubtn">&nbsp;
								<input type="button" value="关&nbsp;闭" onclick="$('#uploadDiv').dialog('close');" class="ui-state-default ui-corner-all">
							</td>
						</tr>						
					</table>
				</form>
			</div>
		</div>
	</div>
	<div style="display: none;" id="refundDiv" title="退款">
	   <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	      <div class="ui-state-default ui-jqgrid-hdiv">
	       	  <form action="../servlet/defaultDispatcher" id="refundForm" method="post">
	       	  	  <input type="hidden" name="__action" value="rentFinanceCommand.commitRefund">
	       	  	  <input type="hidden" id="refundIncomeId" name="refundIncomeId">
	       	  	  <input type="hidden" id="refundRestMoney" name="refundRestMoney">
	       	  	  <table class="panel_table">
						<tr>
							<th style="text-align: right;"><font color="red">*</font>收款人：</th>
							<td><input type="text" id="payee" name="payee" class="tb_return" style="width: 120px"></td>
							<th style="text-align: right;">退款日期：</th>
							<td><input type="text" id="refundDate" name="refundDate" class="tb_return" readonly="readonly" style="width: 120px"></td>
						</tr>
						<tr>
							<th style="text-align: right;"><font color="red">*</font>请款说明：</th>
							<td>
								<select name="refundType" id="refundType" onchange="showOtherType(this)" style="width: 120px">
									<option value="0">
										--请选择--										
									</option>
									<option value="误汇款">误汇款</option>
									<option value="供应商代垫租金">供应商代垫租金</option>
									<option value="保险退款" >保险退款</option>
									<option value="保证金入我司">保证金入我司</option>
									<option value="我司转入供应商">我司转入供应商</option>
									<option value="-1">其他</option>
								</select>
							</td>
							<th style="text-align: right;">
								<span class="reason_other_r"><font color="red">*</font>其他说明：</span>
							</th>
							<td>
								<span class="reason_other_r"><input name="other" style="width: 120px"></span>
							</td>
						</tr>
						<tr id="handling_charge_item">
							<th style="text-align: right;"><font color="red">*</font>退款总额：</th>
							<td><input type="text" id="refundMoney" name="refundMoney" class="tb_return" style="width: 120px" onkeyup="clearNoNum(this);generateFee()" onblur="checkAmount('refundRestMoney','refundMoney')"></td>
							<th style="text-align: right;"><font color="red">*</font>手续费：</th>
							<td><input type="text" id="fee" name="fee" class="tb_return" style="width: 120px" readonly="readonly" onkeyup="clearNoNum(this)"></td>
						</tr>
						<tr>
							<th style="text-align: right;"><font color="red">*</font>实际退款总额：</th>
							<td><input type="text" id="amount" name="amount" class="tb_return" style="width: 120px" onkeyup="clearNoNum(this)" onblur="checkAmount('refundRestMoney','amount')"></td>
							<th style="text-align: right;"><font color="red">*</font>支付方式：</th>
							<td>
								<select id="payWay" name="payWay" class="tb_return" style="width: 120px">
									<option value="0">--请选择--</option>
									<option value="网银">网银</option>
									<option value="转账支票">转账支票</option>
								</select>
							</td>
						</tr>
						<tr>
							<th style="text-align: right;">银行名称：</th>
							<td><input type="text" id="bankName" name="bankName" class="tb_return" style="width: 120px"></td>
							<th style="text-align: right;">银行账号：</th>
							<td><input type="text" id="bankAccount" name="bankAccount" class="tb_return" style="width: 120px"></td>
						</tr>
						<tr>
							<th style="text-align: right;"><font color="red">*</font>备注：</th>
							<td colspan="3">
								<textarea id="refundRemark" name="remark" rows="8" cols="69"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">
								<input type="button" id="refundBtn" value="确&nbsp;定" onclick="commitRefund()" class="ui-state-default ui-corner-all">
								<input type="button" value="关&nbsp;闭" onclick="$('#refundDiv').dialog('close');" class="ui-state-default ui-corner-all">
							</td>
						</tr>
					</table>
	       	  </form>
	      </div>
	   </div>
	</div>
	<script type="text/javascript">
		function showOtherType(e) {
			$("#refundMoney").val("");
			$("#fee").val("");
			$("#amount").val("");
			if ($(e).val() == -1) {
				$(".reason_other_r").css("display", "block");
				$("#handling_charge_item").hide();
				$("#amount").attr("readOnly", false);
				$("#amount").css("border", "1px solid #A6C9E2");
			} else if("误汇款" == $(e).val() || "保险退款" == $(e).val()) {
				$(".reason_other_r").css("display", "none");
				$("#handling_charge_item").show();
				$("#amount").attr("readOnly", true);
				$("#amount").css("border", "1px solid #AFAFAF");
			} else {
				$(".reason_other_r").css("display", "none");
				$("#handling_charge_item").hide();
				$("#amount").attr("readOnly", false);
				$("#amount").css("border", "1px solid #A6C9E2");
			}
			
			
			
			/* if($("#refundType").val()==-1) {
				$("#amount").attr("readonly",false);
				$("#refundDiv table").find("tr").eq(2).hide();
			} else {
				$("#refundDiv table").find("tr").eq(1).find("td").eq(2).hide();
				$("#refundDiv table").find("tr").eq(1).find("td").eq(3).hide();
				if($("#refundType").val()=='误汇款') {
					$("#amount").attr("readonly",true);
					$("#refundDiv table").find("tr").eq(2).show();
				} else if($("#refundType").val()=='保险退款') {
					$("#amount").attr("readonly",true);
					$("#refundDiv table").find("tr").eq(2).show();
				} else {
					$("#amount").attr("readonly",false);
					$("#refundDiv table").find("tr").eq(2).hide();
				}
			} */
		}
		
		function generateFee() {
			var fee=$("#fee").val();
			var inputRefundMoney=parseFloat($("#refundMoney").val());
			if(inputRefundMoney<=10000) {
				fee=5.5;
			} else if(inputRefundMoney<=100000) {
				fee=10.5;
			} else if(inputRefundMoney<=500000) {
				fee=15.5;
			} else if(inputRefundMoney<=1000000) {
				fee=20.5;
			} else {
				fee=inputRefundMoney*0.2/1000+0.5;
			}
			if(fee>200.5){
				fee=200.5;
			}
			if(inputRefundMoney-fee<0) {
				$("#amount").val(0);
			} else {
				$("#amount").val(inputRefundMoney-fee);
			}
			$("#fee").val(fee);
		}
	</script>
	
	<!-- <input type='button' value="数据迁移" onclick="transfer()">
	<script type="text/javascript">
		function transfer() {
			location.href="../servlet/defaultDispatcher?__action=rentFinanceCommand.transferData";
		}
	</script> -->
</body>
</html>