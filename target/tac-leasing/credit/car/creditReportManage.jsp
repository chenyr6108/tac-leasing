<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit/car/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/car/js/creditLog.js"></script>
	<script type="text/javascript">	
	$(function (){
		$("#visit_date").datepicker($.datepicker.regional['zh-CN']);
		$("#visit_date1").datepicker($.datepicker.regional['zh-CN']);
		$("#estimates_pay_date").datepicker($.datepicker.regional['zh-CN']);
		$("#processer").keyup(processerKeyup);
		$("#sensor").keyup(sensorKeyup);
	});
	function creditfile(id) {
		$("#creditfile").toggle(
				function() {
					$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReport.queryRentFile&prcd_id="+id+"&cardFlag=0"+"&rentFileFlag=1&isSalesDesk=${isSalesDesk}");
				});	
		$('#creditfile').dialog({
			modal:true,
			autoOpen: false,
			width: 830
		});	
		$('#creditfile').dialog('open');
	  }	
	  
	  
	  
	  function pdfFun(){
					  var chk_value =[];   
					  $('input[name="credit_idxx"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择报告");
					  	return false;}	  
	  		$("#__action").val("expContract.prePdf");
	  		$("#form1").submit();
	  		$("#__action").val("creditReport.creditManage");
	  }
	  //点击状态图标弹出财务导出层
	  function expandCorp(id){
	  	$("#pactCorp"+id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=creditReport.managePactCorp&credit_id="+id);
        });
	  }
	  
	  function cancel(param) {
		  $("#credit_id_cancel").val(param);
		  $("#cancelDiv").dialog({modal:true, autoOpen:false, width:600});
	      $("#cancelDiv").dialog("open");
	  }
	  
	  function cancelReport(form) {
		  form.submit();
	  }
	  
	  function enableReport(param) {
		  $("#credit_id").val(param);
		  $("#__action").val("creditReport.enableCredit");
		  $("#form1").submit();
	  }
	  
	  function updateVisitDate(credit_id){
		  $("#applyVisit_div").dialog({modal:true, autoOpen:false, width:500});
		  $("#applyVisit_div").dialog("open");
		  $("#visit_credit_id").val(credit_id);
	  }
	  
	  function updateVisitSub(){
		  //alert("Update...");
		  if($("#visit_date").val() == ""){
			  alert("请输入访厂日期!");
			  return;
		  }
		  $("#sumBut").attr("disabled", "disabled");
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {"__action" : "creditReport.updateVisitDate",
				  	"visit_credit_id" : $("#visit_credit_id").val(),
				  	"visit_date" : $("#visit_date").val()};
		  $.post(url, param, function (data){
			  if(data){
				  $("#applyVisit_div").dialog("close");
				  alert("修改成功！");
				  doSearch();
			  } else {
				  alert("修改失败！");
			  }
			  $("#sumBut").attr("disabled", false);
		  }, 'json');
	  }
	  
	  function openUpdateClerkDiv(param1,param2,param3,param4) {
		  $.ajax({
					  type:"post",
					  url:"${ctx }/servlet/defaultDispatcher",
					  data:"__action=creditReport.getSensorList&SUPERVISOR_ID="+param1,
					  dataType:"json",
					  success:function(data) {
						  var SENSOR_SELECT=$("#SENSOR");
						  if(data.length>0) {
							  var SENSOR_OPTION="";
							  $.each(data, function(i){
								  SENSOR_OPTION+= "<option value=\"" + data[i].ID + "=" + data[i].NAME+ "\">" + data[i].NAME + "</option>";
								});
							  SENSOR_SELECT.html(SENSOR_OPTION);
						  }
					  }
	  			 });
		  
		  $("#UPDATE_SENSOR_ID").dialog({modal:true,autoOpen:false,width:350, height:250});
		  $("#UPDATE_SENSOR_ID").dialog("open");
		  $("#SUPERVISOR_ID").val(param1);
		  $("#SENSOR_ID").val(param2);
		  $("#CREDIT_ID").val(param3);
		  $("#SENSOR_NAME").val(param4);
	  }
	  
	  function updateSensorId() {
		  
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {"__action" : "creditReport.updateSensorId",
				  	"CREDIT_ID":$("#CREDIT_ID").val(),
				  	"sensor":$("#sensor").val(),
				  	"sensor_id":$("#sensor_id").val(),
				  	"processer":$("#processer").val(),
				  	"processer_id":$("#processer_id").val(),
				  	"PREVIOUS_SENSOR_ID":$("#SENSOR_ID").val(),
				  	"PREVIOUS_SENSOR_NAME":$("#SENSOR_NAME").val()};
		  $.post(url,param,function(data) {
			  if(data){
				  $("#UPDATE_SENSOR_ID").dialog("close");
				  alert("修改成功！");
				  doSearch();
			  } else {
				  alert("修改失败！");
			  }
		  },'json');
	  }
	  
	  function showApplyVisit(visit_id){
			$("#errorMsg").text("");
			if(visit_id != null && visit_id != undefined){
				var url = "${ctx }/servlet/defaultDispatcher";
				var data = {__action : "visitCommand.getVisitInfo", "visit_id" : visit_id};
				$.post(url, data, function (result){
					if(result.resultFlag == "true"){
						$("#visit_area1").val(result.resultData.visit_area);
						$("#visit_date1").val(result.resultData.hope_visit_date_str);
						$("#visit_time1").val(result.resultData.hope_visit_time);
						$("#visit_area1").attr("disabled", true);
						$("#visit_date1").attr("disabled", true);
						$("#visit_time1").attr("disabled", true);
						$("#sumBut1").hide();
						$("#applyVisit_div1").dialog({modal:true, autoOpen:false, width:500});
						$("#applyVisit_div1").dialog("open");
					}
				}, "json");
			}
		}
	  
		function applyVisit(credit_id){
			
			$("#errorMsg").text("");
			$("#visit_area1").attr("disabled", false);
			$("#visit_date1").attr("disabled", false);
			$("#visit_time1").attr("disabled", false);
			$("#applyVisit_div1").find("input[type='text']").each(function (){
				$(this).val("");
			});
			$("#visit_time1").val("0");
			$("#sumBut1").show();
			$("#applyVisit_div1").dialog({modal:true, autoOpen:false, width:500});
			$("#credit_id1").val(credit_id);
			$("#isSalesDeskApply").val($("#isSalesDesk").val());
			$("#applyVisit_div1").dialog("open");
		}
		
		function apply_sub(e){
			$(e).attr("disabled", true);
			var visit_area = $("#visit_area1").val();
			var visit_date = $("#visit_date1").val();
			if(visit_area == ""){
				alert("请输入访厂区域！");
				$(e).attr("disabled", false);
				return false;
			}
			if(visit_date == ""){
				alert("请输入希望访厂时间！");
				$(e).attr("disabled", false);
				return false;
			}
			$("#doApplyForm").submit();
		}
		
		var processerKeyup = function (e){
			  getTheSame(e, "processer");
		  }
		  var sensorKeyup = function (e){
			  getTheSame(e, "sensor");
		  }
		  
		  function getTheSame(e, textId){
				if($.trim($("#" + textId).val()) != ""){
					//alert("do post");
					$.ajax({
						type: 'post',
						url: "${ctx }/servlet/defaultDispatcher",
						dataType: 'json',
						data: {"__action":"riskAudit.getTheSame", "searchTo.content":$("#" + textId).val()},
						success: function(data){
							$("#theSameName_" + textId).html("");
							if(data != null && data.length > 0){
								if(data.length == 1 && e.keyCode != 8){
									$("#" + textId).val(data[0].userName);
									$("#" + textId + "_id").val(data[0].userId);
									$("#theSameName_" + textId).css("display", "none");
								} else {
									var htmlContent = "";
									$.each(data,function(i){
										htmlContent += "<div class='nameTag" + ((i%2) + 1) + "' " + 
												"onclick=\"nameClean()\" " +
												"onmouseover=\"nameClick('" + data[i].userId + "','" + data[i].userName + "', this, '" + textId + "')\" " +
												"onmouseout=\"$(this).attr('className','nameTag" + ((i%2) + 1) + "')\" " + ">" + data[i].userName + 
												"<span id=\"span_" + textId + "_" + i + "\" style=\"display: none;\">" + data[i].userId + "," + data[i].userName + "</span></div>";
									});
									$("#theSameName_" + textId).html(htmlContent);
									$("#theSameName_" + textId).css("display", "block");
								}
							} else {
								$("#theSameName_" + textId).css("display", "none");
							}
						}
					});
				} else {
					$("#theSameName_" + textId).html("");
					$("#theSameName_" + textId).css("display", "none");
				}
			}
			function nameClean(){
				$("div[id^='theSameName_']").each(function (){
					$(this).html("");
					$(this).css("display", "none");
				});
			}
			function nameClick(userId, userName, e, textId){
				$(e).attr('className','nameTagOver');
				$("#" + textId).val(userName);
				$("#" + textId + "_id").val(userId);
				//nameClean();
			}
			function nameOut(textId){
				if($("#" + textId + "_id").val() == ""){
					var spanText = $("#span_" + textId + "_0").text();
					if($.trim(spanText) != ''){
						var spanInfo = spanText.split(",");
						$("#" + textId).val(spanInfo[1]);
						$("#" + textId + "_id").val(spanInfo[0]);
					}
				} 
				setTimeout(nameClean, 50);
			}
			
			
			function showUpdateEstimatesPayDate(credit_id, type){
				var num = null;
				var url = "${ctx }/servlet/defaultDispatcher";
				var param = {__action : "creditReport.getEstimatesPayDate", "credit_id" : credit_id};
				$.getJSON(url, param, function (data){
					$("#showUpdateEstimatesPayDateWin").dialog({modal:true, autoOpen:false, width:600});
					if(data != null){
						num = data.ESTIMATES_PAY_DATE_NUM;
						$("#estimates_credit_id").val(credit_id);
						$("#startDate").val(data.START_DATE);						
						$("#estimates_num").text(data.ESTIMATES_PAY_DATE_NUM);
						$("#estimates_num_last").text(5 - data.ESTIMATES_PAY_DATE_NUM).css("color", data.ESTIMATES_PAY_DATE_NUM >= 5 ? "red" : "black");
						$("#estimates_pay_date").val(data.ESTIMATES_PAY_DATE == "1900-1-1" ? "" : data.ESTIMATES_PAY_DATE);
						$("#estimates_pay_date_reason").val(data.ESTIMATES_PAY_DATE_REASON);
						$("#estimates_pay_date_log").html("");
						var logList = data.log;
						if(logList.length > 0){
							for(var i = 0 ; i < logList.length; i ++){
								var td1 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE_NUM);
								var td2 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE);
								var td3 = $("<td>").css("whiteSpace", "pre-wrap").text(logList[i].ESTIMATES_PAY_DATE_REASON);
								var td4 = $("<td>").text(logList[i].CREATE_TIME);
								var td5 = $("<td>").text(logList[i].CREATE_BY);
								$("<tr>").append(td1)
									.append(td2)
									.append(td3)
									.append(td4)
									.append(td5)
									.appendTo($("#estimates_pay_date_log"));
							}
						} else {
							var td = $("<td>");
							td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
							$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
						}
					} else {
						$("#estimates_credit_id").val(credit_id);
						$("#estimates_num").text(0);
						$("#estimates_num_last").text(5);
						$("#estimates_pay_date").val("");
						$("#estimates_pay_date_reason").val("");
						$("#estimates_pay_date_log").html("");
						var td = $("<td>");
						td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
						$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
					}
					if(type == "show"){
						$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", true);
						$("#showUpdateEstimatesPayDateWin").find("input[type='button']").hide();
					} else {
						$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", false);
						$("#showUpdateEstimatesPayDateWin").find("input[type='button']").show();
						if (num >= 5) {
							$("#button_sub").hide();
						} else {
							$("#button_sub").show();
						}
					}
					$("#showUpdateEstimatesPayDateWin").dialog("open");
				});
			}
			
			function doEstimates(){
				if($("#estimates_pay_date").val() == ""){
					alert("预估拨款日必选！");
					$("#estimates_pay_date").attr("className", "panel_text_error");
				} else if ($("#estimates_pay_date_reason").val() == "") {
					alert("请填写原因！");
					$("#estimates_pay_date_reason").attr("className", "panel_text_error");
				} else {
					if(checkStartDate()){
						$("#showUpdateEstimatesPayDateForm").submit();
					}					
				}
			}
		
		function checkStartDate(){
			//乘用车委贷起租日不得晚于预计支付日  
			var planDate = $("#estimates_pay_date").val();
			var startDate = $("#startDate").val();
			if(planDate!="" && startDate!="" && startDate>planDate){//非乘用车委贷startDate为空
				alert("乘用车委贷起租日不得晚于预计支付日.");
				return false;
			}
			return true;
		}
	</script>
	<style type="text/css">
		.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px; text-align: left;}
		.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
		.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
		.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default; }
	</style>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="creditReport.creditManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" id="commit_flag" name="commit_flag">
			<input type="hidden" id="isSalesDesk" name="isSalesDesk" value="${isSalesDesk }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">资料中客户清单</c:if><c:if test="${isSalesDesk ne 'Y' }">报告管理</c:if></span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          	<td>起始日期：</td>
				          	<td>
				          		<input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${start_date }">
				          	</td>
				          	<td>结束日期：</td>
				          	<td>
				          		<input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${end_date }">
							</td>
							<td>类型：</td>
							<td>
					<c:set var="type11" value=""></c:set>
					<c:set var="type12" value=""></c:set>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
					<c:set var="type5" value=""></c:set>
					<c:if test="${credit_type eq -1}">
						<c:set var="type11" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq -2}">
						<c:set var="type12" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 2}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>	
					<c:if test="${credit_type eq 5}">
						<c:set var="type5" value="selected='selected'"></c:set>
					</c:if>				
					<select name="credit_type" style=" height: 18px;">
						<option value="-2"${type12}>
							全部
						</option>
						<option value="0"${type0}>
							调查中
						</option>
						<option value="3"${type3}>
							提交主管
						</option>
						<option value="5"${type5}>
							提交副总
						</option>
						<option value="1"${type1}>
							主管通过
						</option>
						<%-- <option value="2"${type2}>
							主管驳回
						</option> --%>
						<option value="-1"${type11}>
							项目撤销
						</option>
					</select>
					</td>
					<td>
						访厂状态：
					</td>
					<td>
						<select id="HAS_VISIT" name="HAS_VISIT">
							<option value="" <c:if test="${HAS_VISIT eq '' }">selected='selected'</c:if>>所有</option>
							<option value="0" <c:if test="${HAS_VISIT eq '0' }">selected='selected'</c:if>>未访厂</option>
							<option value="1" <c:if test="${HAS_VISIT eq '1' }">selected='selected'</c:if>>已访厂</option>
						</select>
					</td>
				    </tr>
				          <tr>
				          <td>报告来源：</td>
				          <td>
				          	<select name="vip_flag">
				          		<option value="">全部</option>
				          		<option value="0" <c:if test="${vip_flag eq '0' }">selected="selected"</c:if>>一般案件</option>
				          		<option value="1" <c:if test="${vip_flag eq '1' }">selected="selected"</c:if>>绿色通道</option>
				          	</select>
				          </td>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table style="width: 100%;">
				<tr>
					<td>
						<c:if test="${add==true}">
							<input type="button" name="but" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditCustomer.initCreditCustomerAdd&isSalesDesk=${isSalesDesk }'" class="panel_button" value="新建报告">
						</c:if>
						<!--由于会导出空合同,暂时先把导出合同功能禁止掉 -->
						<!--input type="button" name="pdfbutton" onclick="pdfFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出合同"-->
					</td>
					<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
				</tr>
			</table>

			<table class="grid_table">
				<tr>
					<c:if test="${isSalesDesk eq 'Y' }">
					<th width="2%">
						&nbsp;
					</th>
					</c:if>
					<th style="width: 3%">
						<strong>进度 </strong>
					</th>
					<th style="width: 3%">
						<strong>标签 </strong>
					</th>
					<th style="width: 5%">
						<strong>报告来源 </strong>
					</th>
					<th style="width: 5%">
						<strong>资信类型 </strong>
					</th>
					<th style="width: 8%">
						<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th style="width: 12%">
						<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
					</th>
					<th style="width: 12%">
						<page:pagingSort orderBy="SUPPLIER" pagingInfo="${pagingInfo }"><strong>供应商名称 </strong></page:pagingSort>
					</th>
					<th style="width: 3%">
						<page:pagingSort orderBy="SUPP_LEVEL" pagingInfo="${pagingInfo }"><strong>评级 </strong></page:pagingSort>
					</th>
					<th style="width: 8%">
						<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${pagingInfo }"><strong>办事处</strong></page:pagingSort>
					</th>
					<th style="width: 5%">
						<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo }"><strong>办事处主管 </strong></page:pagingSort>
					</th>
					<th style="width: 5%">
						<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo }"><strong>客户经理 </strong></page:pagingSort>
					</th>
					
					<c:if test="${vip_flag eq '1' }">
						<th style="width: 5%">
							企划课人员
						</th>
					</c:if>
					
					<th style="width: 5%">
						<page:pagingSort orderBy="WIND_STATE" pagingInfo="${pagingInfo }"><strong>风控纪要 </strong></page:pagingSort>
					</th>
					<th style="width: 8%">
						<page:pagingSort orderBy="CREATE_DATE" pagingInfo="${pagingInfo }"><strong>生成时间 </strong></page:pagingSort>
					</th>
					<th style="width: 8%">
						<page:pagingSort orderBy="VISIT_DATE" pagingInfo="${pagingInfo }"><strong>访厂时间 </strong></page:pagingSort>
					</th>
					<th style="width: 8%">
						<page:pagingSort orderBy="ESTIMATES_PAY_DATE" pagingInfo="${pagingInfo }"><strong>预估拨款日 </strong></page:pagingSort>
					</th>
					<c:if test="${display==true}">
						<th style="width: 10%">
							<strong>操作 </strong>
						</th>
					</c:if>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item">
					<tr>   
						<c:if test="${isSalesDesk eq 'Y' }">
							<td style="text-align: center;">&nbsp;<c:if test="${item.FLAG eq 'Y'}"><img src="${ctx }/images/warning.jpg" title="异常案件"></c:if>&nbsp;</td>
							<td style="text-align: left" >
								<c:if test="${item.STATE eq 0}">调查中<%-- <img src="${ctx }/images/u608.gif" title="调查中"> --%></c:if>
								<c:if test="${item.STATE eq 3}">提交主管<%-- <img src="${ctx }/images/u611.gif" title="提交主管"> --%></c:if>
								<c:if test="${item.STATE eq 2}">主管驳回<%-- <img src="${ctx }/images/u614.gif" title="主管驳回"> --%></c:if>
								<c:if test="${item.STATE eq 1}">主管通过<%-- <img src="${ctx }/images/u622.gif" title="主管通过"> --%></c:if>
								<c:if test="${item.STATE eq -1}">项目撤销<%-- <img src="${ctx }/images/u617.gif" title="项目撤销"> --%></c:if>
								<c:if test="${item.STATE eq 5}">提交副总<%-- <img src="${ctx }/images/u620.gif" title="提交副总"> --%></c:if>
							</td>
						</c:if>
						<c:if test="${isSalesDesk ne 'Y' }">
							<td style="text-align: center">
								<c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if>
								<c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if>
								<c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u608.gif" title="调查中"><%-- <img src="${ctx }/images/u614.gif" title="主管驳回"> --%></c:if>
								<c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="主管通过"></c:if>
								<c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if>
								<c:if test="${item.STATE eq 5}"><img src="${ctx }/images/u620.gif" title="提交副总"></c:if>
							</td>
						</c:if>
						<td style="text-align: center;padding-top: 4px;">
							<c:forEach  items="${item.TAGS }" var="tag">
								&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
							</c:forEach>&nbsp;						
						</td>
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${item.VIP_FLAG == 1 }">
									<span style="color: green" title="绿色通道">绿色</span>
								</c:when>
								<c:otherwise>
									<span title="一般案件">一般</span>
								</c:otherwise>
							</c:choose>
							&nbsp;
						</td>
						<td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPPLIER }&nbsp;</td>
						<td style="text-align: center;">${item.SUPP_LEVEL }&nbsp;</td>
						<td style="text-align: center;">
							<c:if test="${not empty item.SENSOR_NAME }">
								${item.DECP_NAME_CN }
							</c:if>
							<c:if test="${empty item.SENSOR_NAME }">
								-
							</c:if>
							&nbsp;
						</td>
						<td style="text-align: center;">
							<c:if test="${not empty item.SENSOR_NAME }">
								${item.CLERK_NAME }
							</c:if>
							<c:if test="${empty item.SENSOR_NAME }">
								-
							</c:if>
							&nbsp;
						</td>
						<td style="text-align: center;">
							<c:if test="${not empty item.SENSOR_NAME }">
								${item.SENSOR_NAME }
							</c:if>
							<c:if test="${empty item.SENSOR_NAME }">
								-
							</c:if>
							&nbsp;
						</td>
						<c:if test="${vip_flag eq '1' }">
							<td>
								${item.PROCESSER }
							</td>
						</c:if>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if><c:if test="${item.WIND_STATE eq 4 and empty item.CREDIT_ID}">不通过</c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON}</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
						<td style="text-align: center;"
							<c:if test="${not empty item.ESTIMATES_PAY_DATE_REASON }">title="${item.ESTIMATES_PAY_DATE_REASON }"</c:if>
						><a href="javaScript:void(0)" onclick="showUpdateEstimatesPayDate('${item.ID}', 'show');">${item.ESTIMATES_PAY_DATE }</a>&nbsp;</td>
						<c:if test="${display==true}">
							<td style="line-height: 20px;">
								<c:if test="${view==true}">
									<a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a>
								</c:if>
								<c:if test="${modify==true}">|
									<c:choose>
										<c:when test="${item.STATE eq 0 or item.STATE eq 2}">
											<a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a>
										</c:when>
										<c:otherwise>
											<font color="#c0c0c0">修改</font>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${commit==true}">|
									<c:choose>
										<c:when test="${item.STATE eq 0 or item.STATE eq 2}">
											<a href="javaScript:void(0)" onclick="commitCredit(${item.ID},${item.CUST_ID});" id="commitURL${item.ID }">提交</a>
											<a href="#" id="showURL${item.ID }" style="display: none;">提交</a>
										</c:when>
										<c:otherwise>
											<font color="#c0c0c0">提交</font>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${info==true}">|
									<c:choose>
										<c:when test="${item.STATE eq 0 or item.STATE eq 2}">
											<a href="javascript:void(0)" onclick="creditfile('${item.ID}');">资料</a>
										</c:when>
										<c:otherwise>
											<font color="#c0c0c0">资料</font>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${log==true}">|
									<a href="javascript:void(0)" onclick="showBusinessLog('${item.ID}','');">日志</a>
								</c:if>
								<br/>
								<c:if test="${cancel==true}">
									<c:choose>
										<c:when test="${item.STATE eq 0 or item.STATE eq 2}">
											<a href="javaScript:void(0)" onclick="cancel('${item.ID }')">撤销</a>
										</c:when>
										<c:otherwise>
											<font color="#c0c0c0">
											<c:choose>
												<c:when test="${item.STATE eq 0 or item.STATE eq 2 or item.STATE eq -1}">
													<a href="javaScript:void(0)" onclick="enableReport('${item.ID }')">启用</a>
												</c:when>
												<c:otherwise>启用</c:otherwise>
											</c:choose>
											</font>
										</c:otherwise>
									</c:choose>
								</c:if>
								<%-- |&nbsp;<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javascript:void(0);" onclick="updateVisitDate('${item.ID }');">维护访厂</a></c:when><c:otherwise><font color="#c0c0c0">维护访厂</font></c:otherwise></c:choose> --%>
								<c:if test="${transfer==true}">
									<c:choose>
										<c:when test="${item.STATE eq 0 or item.STATE eq 3 or item.STATE eq 2}">|
											<%-- <a href="javascript:void(0);" onclick="openUpdateClerkDiv('${item.CLERK_ID}','${item.SENSOR_ID}','${item.ID}','${item.SENSOR_NAME }')">转移</a> --%>
											<a href="javascript:void(0);" onclick="openUpdateClerkDiv('${item.CLERK_ID}','${item.SENSOR_ID}','${item.ID}','${item.SENSOR_NAME }', '${item.PROCESSER }')">转移</a>
										</c:when>
										<c:otherwise>|
											<font color="#c0c0c0">转移</font>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${isSalesDesk eq 'Y' }">
									<c:choose>
										<c:when test="${item.VISIT_STATUS == null }">|
											<a href="javascript:void(0);" onclick="applyVisit('${item.ID}')">申请访厂</a>
										</c:when>
										<c:otherwise>|
											<a href="javascript:void(0);" onclick="showApplyVisit('${item.VISIT_ID}');">查看</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							<c:if test="${tag_authority}">|&nbsp;<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javaScript:void(0)" onclick="addTags(${item.ID },'${item.CREDIT_RUNCODE}')">标签</a></c:when><c:otherwise><font color="#c0c0c0">标签</font></c:otherwise></c:choose></c:if>
							|&nbsp;<a href="javaScript:void(0)" onclick="showUpdateEstimatesPayDate('${item.ID}', 'update');">预估拨款日</a>
						</td></c:if>
					</tr>
					<tr>
						<th class="pact">
							<div id="pactCorp${item.ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</th>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<c:if test="${isSalesDesk ne 'Y' }">
			<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td align="left">
							<font color="red">“-” 表示该案件为绿色通道案件，且还没有分配业务员。</font>
						</td>
						<td align="right">
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							提交主管
							<img src="${ctx }/images/u620.gif">
							提交副总
							<img src="${ctx }/images/u614.gif">
							主管驳回
							<img src="${ctx }/images/u622.gif">
							主管通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<c:forEach items="${tags}" var="tag" varStatus="position">
								<img src="${ctx }/images/tags/${tag.tagColor }.png" style="position:relative;top:4px;" title="${tag.comments}"/>			
								${tag.tagName } &nbsp;
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
			<c:if test="${isSalesDesk eq 'Y' }">
			<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left">
						&nbsp;
						<img src="${ctx }/images/warning.jpg">
						&nbsp;异常案件(<font color="red">*异常案件会重复显示,任选一个案件进行修改提交即可</font>)
					</td>
				</tr>
				<tr>
					<td align="right">
							<c:forEach items="${tags}" var="tag" varStatus="position">
								<img src="${ctx }/images/tags/${tag.tagColor }.png" style="position:relative;top:4px;" title="${tag.comments}"/>			
								${tag.tagName } &nbsp;
							</c:forEach>
					</td>
				</tr>
			</table>
			</c:if>
			</div>
				</div>
			</div>		
		</form>
			<div id="creditfile" align="center" title="资料管理" style="display: none; text-align:center; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>			
			
			
		<div style="display:none;" id="showUpdateEstimatesPayDateWin" title="预估拨款日">
			<form action="${ctx }/servlet/defaultDispatcher?__action=creditReport.updateEstimatesPayDate" id="showUpdateEstimatesPayDateForm" method="post">
			<input type="hidden" id="estimates_credit_id" name="credit_id">
			<input type="hidden" id="startDate">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table class="panel_table">
							<tr>
								<td style="width: 25%">预估次数：</td>
								<td style="width: 25%"><span id="estimates_num"></span></td>
								<td style="width: 25%">剩余次数：</td>
								<td style="width: 25%"><span id="estimates_num_last"></span></td>
							</tr>
							<tr>
								<td>预估拨款日：</td>
								<td colspan="3">
									<input type="text" id="estimates_pay_date" name="estimates_pay_date" class="panel_text" readonly="readonly" onchange="checkStartDate()"/>
									<font color="red">可以使用快捷键（Ctrl+End）来清除日期</font>
								</td>
							</tr>
							<tr>
								<td>预估原因：</td>
								<td colspan="3">
									<textarea id="estimates_pay_date_reason" name="estimates_pay_date_reason" cols="58" rows="3"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<input type="button" id="button_sub" value="保&nbsp;存" onclick="doEstimates();" class="panel_button">
									<input type="button" value="关&nbsp;闭" onclick="$('#showUpdateEstimatesPayDateWin').dialog('close');" class="panel_button">
								</td>
							</tr>
						</table>
						
						<table class="panel_table">
							<tr>
								<th>次数</th>
								<th>预估拨款日</th>
								<th>预估原因</th>
								<th>时间</th>
								<th>操作人</th>
							</tr>
							<tbody id="estimates_pay_date_log"></tbody>
						</table>
					</div>
				  </div>
		    </div>
		    </form>
		</div>
			
			
				<!--  日志弹出层开始   -->
			<!-- 弹出用函数 接收参数 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志" style="display: none" id="showBusinessLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=business.showBusinessLog">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号</td>
								<td style="text-align:center"  width="6%">编号</td>
								<td style="text-align:center"  width="6%">日志对象</td>
								<td style="text-align:center"  width="4%">日志操作</td>
								<td style="text-align:center"  width="6%">创建人</td>
								<td style="text-align:center"  width="6%">创建时间</td>
								<td style="text-align:center"  width="15%">备注</td>
							</tr>
					</table>
					<center>
					共<span id="barNum"></span>条,共<span id="total"></span>页
					当前第<span id="pageNum" ></span>页
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
					</center>
				</div>
				</div>
			</div>	
		</form>
		</div>

		<div id="cancelDiv" style="display:none;" title="撤销原因">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<form action="../servlet/defaultDispatcher?__action=creditReport.cancelCredit" id="funds_return_form" method="post">
						<input type="hidden" id="credit_id_cancel" name="credit_id_cancel">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<!-- <tr class="ui-state-default ui-jqgrid-hdiv">
								<td align="right">撤销说明:<font color="red">*</font>&nbsp;&nbsp;&nbsp;</td>
								<td>
									<select name="cancelReason" id="cancelReason">
											<option>啦啦啦</option>
											<option>哈哈哈</option>
									</select>
								</td>
								<td colspan="2">
								
								</td>
							</tr> -->
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td align="right">备注:&nbsp;&nbsp;&nbsp;</td>
								<td colspan="3">
									<textarea id="cancelRemark" name="cancelRemark" rows="8" cols="76" style="border: 1px solid #A6C9E2;"></textarea>
								</td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="4" id="button_flag" style="text-align: center;">
									<input type="button" value="确&nbsp;定&nbsp;撤&nbsp;销" onclick="cancelReport(this.form)" class="ui-state-default ui-corner-all" >
									<input type="button" value="关&nbsp;闭" onclick="$('#cancelDiv').dialog('close');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div style="display:none;" id="applyVisit_div" title="修改访厂时间">
			<input type="hidden" id="visit_credit_id" name="visit_credit_id"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td><strong>访厂日期：</strong><font color="red">*</font></td>
								<td><input type="text" id="visit_date" name="visit_date" class="tb_return" readonly="readonly"/>&nbsp;</td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2" id="button_flag" style="text-align: center;">
									<input type="button" id="sumBut" value="确&nbsp;定" onclick="updateVisitSub()" class="ui-state-default ui-corner-all" >
									<input type="button" value="关&nbsp;闭" onclick="$('#applyVisit_div').dialog('close');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 转移客户经理DIV -->
		<!-- <div style="display:none;" id="UPDATE_SENSOR_ID" title="修改客户经理">
			<input type="hidden" id="SENSOR_ID" name="SENSOR_ID">
			<input type="hidden" id="SUPERVISOR_ID" name="SUPERVISOR_ID">
			<input type="hidden" id="CREDIT_ID" name="CREDIT_ID">
			<input type="hidden" id="SENSOR_NAME" name="SENSOR_NAME">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table cellspacing="0" cellpadding="0" border="0">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="100px;" style="text-align:center;">客户经理</td>
								<td width="200px;" style="text-align:center;"><select id="SENSOR" name="SENSOR"></select></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center;">
									<input type="button" value="转&nbsp;移" onclick="updateSensorId()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									<input type="button" value="关&nbsp;闭" onclick="$('#UPDATE_SENSOR_ID').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
								</td>
							</tr>
						</table>
					</div>
				  </div>
		    </div>
		</div> -->
		<div style="display:none;" id="UPDATE_SENSOR_ID" title="修改客户经理">
			<input type="hidden" id="SENSOR_ID" name="SENSOR_ID">
			<input type="hidden" id="SUPERVISOR_ID" name="SUPERVISOR_ID">
			<input type="hidden" id="CREDIT_ID" name="CREDIT_ID">
			<input type="hidden" id="SENSOR_NAME" name="SENSOR_NAME">
			<input type="hidden" id="FROM_PROCESSER" name="FROM_PROCESSER">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table cellspacing="0" cellpadding="0" border="0">
							<tr class="ui-widget-content jqgrow ui-row-ltr" style="height: 28px;">
								<td width="100px;">企划课人员</td>
								<td width="300px;"><input type="text" name="processer" id="processer" class="tb_return" 
									onfocus="$('#processer_id').val('');" onblur="getTheSame(0, 'processer');nameOut('processer');"/><input type="hidden" 
									name="processer_id" id="processer_id" /><div id="theSameName_processer" style="position: absolute; 
									width: 148px; background-color: white;border: 1px solid #A6C9E2; display: none; z-index: 99;">
									</div></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr" style="height: 28px;">
								<td width="100px;">业务员</td>
								<td width="300px;"><input type="text" name="sensor" id="sensor" class="tb_return" 
									onfocus="$('#sensor_id').val('');" onblur="getTheSame(0, 'sensor');nameOut('sensor');"/><input type="hidden" 
									name="sensor_id" id="sensor_id" /><div id="theSameName_sensor" style="position: absolute; 
									width: 148px; background-color: white;border: 1px solid #A6C9E2; display: none; z-index: 99;">
									</div></td>
							</tr>
							<tr style="height: 28px;">
								<td colspan="2" style="text-align:center;">
									<input type="button" value="转&nbsp;移" onclick="updateSensorId()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									<input type="button" value="关&nbsp;闭" onclick="$('#UPDATE_SENSOR_ID').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
								</td>
							</tr>
						</table>
					</div>
				  </div>
		    </div>
		</div>
		
		
	<div style="display:none;" id="applyVisit_div1" title="申请访厂">
	<font color="red" id="errorMsg"></font>
	<form action="../servlet/defaultDispatcher" method="post" id="doApplyForm">
	<input  type="hidden" id="isSalesDeskApply" name="isSalesDesk" value="${isSalesDesk }">
	<input type="hidden" name="__action" value="visitCommand.doApplyVisit"/>
	<input type="hidden" name="visitationTo.credit_id" id="credit_id1"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td width="23%"><strong>访厂区域：</strong><font color="red">*</font></td>
						<td width="77%"><input type="text" id="visit_area1" name="visitationTo.visit_area" class="tb_return"/>&nbsp;<font color="red">(例：苏州市吴中区)</font></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td><strong>希望访厂日期：</strong><font color="red">*</font></td>
						<td><input type="text" id="visit_date1" name="visitationTo.hope_visit_date_str" class="tb_return" readonly="readonly"/>&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td><strong>时间：</strong><font color="red">*</font></td>
						<td><select class="tb_return_t" id="visit_time1" name="visitationTo.hope_visit_time">
							<option value="0">全天</option>
							<option value="1">上午</option>
							<option value="2">下午</option>
						</select></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2"><font color="red">下午3点前申请的，可申请次日访厂，如3点后申请，则只能申请隔日访厂。</font></td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut1" value="确&nbsp;定" onclick="apply_sub(this)" class="ui-state-default ui-corner-all" style="cursor: pointer;">
							<input type="button" value="关&nbsp;闭" onclick="$('#applyVisit_div1').dialog('close');" class="ui-state-default ui-corner-all" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</form>
</div>

<div id="addTags" style="display:none">
	<form action="../servlet/defaultDispatcher" name="tag2prjt_creditForm" id="tag2prjt_creditForm" method="post">
	<input type="hidden" name="project_id" id="project_id">
	<div>
	<table>
	
	<c:forEach items="${tags}" var="tag" varStatus="position">
		<tr>
			<td>
				<input type="checkbox" id="tag_${tag.id }" name="tag" value="${tag.id }" />
			</td>
			<td>
				<img src="${ctx }/images/tags/${tag.tagColor }.png">	
			</td>
			<td>
				<label for="tag_${tag.id }">${tag.tagName }</label>	
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>	
	</form>
</div>

<c:if test="${not empty specialAlert }">
	<script>alert('${specialAlert }')</script>
</c:if>
	</body>
</html>