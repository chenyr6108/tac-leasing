<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit_vip/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit_vip/js/creditLog.js"></script>
	
	<script type="text/javascript">	
	$(function (){
		$("#visit_date").datepicker($.datepicker.regional['zh-CN']);
		$("#processer").keyup(processerKeyup);
		$("#sensor").keyup(sensorKeyup);
	});
	function creditfile(id) {
		$("#creditfile").toggle(
				function() {
					$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReportVip.queryRentFile&prcd_id="+id+"&cardFlag=0"+"&rentFileFlag=1");
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
            $(this).load("../servlet/defaultDispatcher?__action=creditReportVip.managePactCorp&credit_id="+id);
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
		  $("#__action").val("creditReportVip.enableCredit");
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
	  
	  function openUpdateClerkDiv(param1,param2,param3,param4,param5) {
		  $.ajax({
					  type:"post",
					  url:"${ctx }/servlet/defaultDispatcher",
					  data:"__action=creditReportVip.getSensorList&sensorid="+param2,
					  dataType:"json",
					  success:function(data) {
						  var SENSOR_SELECT=$("#SENSOR");
						  if(data.length>0) {
							  var SENSOR_OPTION="<option value=\"\">请选择</option>";
							  $.each(data, function(i){
								  SENSOR_OPTION+= "<option value=\"" + data[i].ID + "=" + data[i].NAME+ "\">" + data[i].NAME + "</option>";
								});
							  SENSOR_SELECT.html(SENSOR_OPTION);
						  }
					  }
	  			 });
		  
		  $("#UPDATE_SENSOR_ID").dialog({modal:true,autoOpen:false,width:400,height:200});
		  $("#UPDATE_SENSOR_ID").dialog("open");
		  $("#SUPERVISOR_ID").val(param1);
		  $("#SENSOR_ID").val(param2);
		  $("#CREDIT_ID").val(param3);
		  $("#SENSOR_NAME").val(param4);
		  $("#FROM_PROCESSER").val(param5);
	  }
	  
	  function updateSensorId() {
		  
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {"__action" : "creditReportVip.updateSensorId",
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
	  
	  function openPath(path){
			var url = $("#url").val();
			window.parent.openNewTab(url,path,'所有备注');
		}
	  
	  function showcreditMemo(credit_id){
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {
				  "__action" : "creditReportVip.getCreditMemo",
				  "credit_id" : credit_id,
		  };
		  $.post(url, param, function (data){
			  var bodyHtml = "";
			  if(data.length > 0){
				  $.each(data, function (i){
					  bodyHtml += "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
						"<td style=\"text-align: center;\">" + data[i].create_date_str.substring(0, 19) + "&nbsp;</td>" + 
						"<td style=\"text-align: center;\">" + data[i].create_by + "&nbsp;</td>" + 
						"<td style=\"text-align: center;\">" + data[i].content + "&nbsp;</td>" + 
						"</tr>";
				  });
				  if (data.length == 10) {
					  bodyHtml += "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
					  	"<td style=\"text-align: right;\" colspan=\"3\">" +
					  	"<a href=\"javascript:void(0);\" onclick=\"openPath('creditReportVip.getCreditMemoAll&credit_id=" + credit_id + "');\">更多...</a>" + 
					  	"</td>" + 
					  	"</tr>";
				}
			  } else {
				  bodyHtml = "<tr class=\"ui-widget-content jqgrow ui-row-ltr\">" + 
						"<td style=\"text-align: center;\" colspan=\"3\">无备注！&nbsp;</td>" + 
						"</tr>"
			  }
			  $("#memo_body").html(bodyHtml);
			  $("#credit_memo").dialog({modal:true,autoOpen:false,width:600});
			  $("#credit_id_memo").val(credit_id);
			  $("#credit_memo").dialog("open");
		  }, "json");
	  }
	  
	  function saveCreditMemo(){
		  var url = "${ctx }/servlet/defaultDispatcher";
		  var param = {
				  "__action" : "creditReportVip.addCreditMemo",
				  "credit_id" : $("#credit_id_memo").val(),
				  "memo" : $("#memo_credit").val(),
		  };
		  $.post(url, param, function (data){
			  if(data){
				  $("#memo_credit").val("");
				  showcreditMemo($("#credit_id_memo").val());
			  }
		  }, "json");
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
		
		function expandExportPDF(id,credit_id){
	        $("#" + id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=creditReport.queryPdfFile&&vip=1&&credit_id="+credit_id);
	        });
		}
	</script>
	<style type="text/css">
		.tb_return{border: 1px solid #A6C9E2; width: 200px; height: 22px; text-align: left;}
		.nameTag1{background-color: white; height: 25px; line-height:25px; padding: 2px; cursor: default;}
		.nameTag2{background-color: #DADFE4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
		.nameTagOver{background-color: #A3CBF4; height: 25px; line-height:25px; padding: 2px; cursor: default;}
	</style>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="creditReportVip.creditManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" id="commit_flag" name="commit_flag">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报告管理(绿色通道)</span>
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
				          <input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${start_date }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					类型：
					</td>
					<td>
					<c:set var="type11" value=""></c:set>
					<c:set var="type12" value=""></c:set>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
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
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
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
						<option value="1"${type1}>
							主管通过
						</option>
						<option value="2"${type2}>
							主管驳回
						</option>
						<option value="-1"${type11}>
							项目撤销
						</option>
					</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><c:if test="${add==true}"><input type="button" name="but" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditCustomerVip.initCreditCustomerAdd'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建报告"></c:if><!--由于会导出空合同,暂时先把导出合同功能禁止掉 --><!--input type="button" name="pdfbutton" onclick="pdfFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出合同"--></td>
					<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>标签 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="SUPPLIER" pagingInfo="${pagingInfo }"><strong>供应商名称 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="PROVINCE" pagingInfo="${pagingInfo }"><strong>区域 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${pagingInfo }"><strong>办事处</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CLERK_NAME" pagingInfo="${pagingInfo }"><strong>区域主管 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="PROCESSER" pagingInfo="${pagingInfo }"><strong>服务课人员 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="SENSOR_NAME" pagingInfo="${pagingInfo }"><strong>协办业务 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="WIND_STATE" pagingInfo="${pagingInfo }"><strong>风控纪要 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="CREATE_DATE" pagingInfo="${pagingInfo }"><strong>生成时间 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="VISIT_DATE" pagingInfo="${pagingInfo }"><strong>访厂时间 </strong></page:pagingSort>
					</th>
					<c:if test="${display==true}">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>操作 </strong>
						</th>
					</c:if>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item">
				
					<c:if test="${s_employeeName eq item.SENSOR_NAME and s_employeeName != item.PROCESSER}">
						<c:set var="view" value="true"/>
						<c:set var="modify" value="false"/>
						<c:set var="commit" value="false"/>
						<c:set var="info" value="false"/>
						<c:set var="showInfo" value="true"/>
					</c:if>
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;cursor: pointer;" onclick="expandExportPDF('pactCorp${item.ID}',${item.ID})"> <!--  点击状态弹出层(放在td里面) onClick="expandCorp('${item.ID}')"  --> <c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="主管驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="主管通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
						<td style="text-align: center;;padding-top: 4px;">
							<c:forEach  items="${item.TAGS }" var="tag">
								&nbsp;<img title="${tag.tagName}" src="${ctx}/images/tags/${tag.tagColor}.png">	
							</c:forEach>&nbsp;						
						</td>
						<td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPPLIER }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROCESSER }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if><c:if test="${item.WIND_STATE eq 4 and empty item.CREDIT_ID}">不通过</c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><c:choose><c:when test="${not empty item.NONE_VISIT_REASON }">${item.NONE_VISIT_REASON }</c:when><c:otherwise>${item.VISIT_DATE }</c:otherwise></c:choose>&nbsp;</td>
						<c:if test="${display==true}"><td style="text-align: center;"><c:if test="${view==true}"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.selectCreditForShow&credit_id=${item.ID }'">查看</a></c:if><c:if test="${modify==true}">|<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReportVip.selectCreditForUpdate&credit_id=${item.ID }'">修改</a></c:when><c:otherwise><font color="#c0c0c0">修改</font></c:otherwise></c:choose></c:if><c:if test="${commit==true}">|<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javaScript:void(0)" onclick="commitCredit(${item.ID},${item.CUST_ID});">提交</a></c:when><c:otherwise><font color="#c0c0c0">提交</font></c:otherwise></c:choose></c:if> <c:if test="${showInfo==true}">|<a href="javascript:void(0)" onClick="creditfiles('${item.ID }','${item.CONTRACT_TYPE+1 }');">资料</a></c:if><c:if test="${info==true}">|<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javascript:void(0)" onclick="creditfile('${item.ID}');">资料</a></c:when><c:otherwise><font color="#c0c0c0">资料</font></c:otherwise></c:choose></c:if><c:if test="${log==true}">| <a href="javascript:void(0)" onclick="showBusinessLog('${item.ID}','');">日志</a> | <a href="javascript:void(0)" onclick="showcreditMemo('${item.ID}');">备注</a></c:if><c:if test="${cancel==true}">|<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javaScript:void(0)" onclick="cancel('${item.ID }')">撤销</a></c:when><c:otherwise><font color="#c0c0c0"><c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2 or item.STATE eq -1}"><a href="javaScript:void(0)" onclick="enableReport('${item.ID }')">启用</a></c:when><c:otherwise>启用</c:otherwise></c:choose></font></c:otherwise></c:choose></c:if>&nbsp;<%-- |&nbsp;<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javascript:void(0);" onclick="updateVisitDate('${item.ID }');">维护访厂</a></c:when><c:otherwise><font color="#c0c0c0">维护访厂</font></c:otherwise></c:choose> --%><c:if test="${transfer==true}">|<a href="javascript:void(0);" onclick="openUpdateClerkDiv('${item.CLERK_ID}','${item.SENSOR_ID}','${item.ID}','${item.SENSOR_NAME }', '${item.PROCESSER }')">转移</a></c:if>
						<c:if test="${tag_authority}">|<c:choose><c:when test="${item.STATE eq 0 or item.STATE eq 2}"><a href="javaScript:void(0)" onclick="addTags(${item.ID },'${item.CREDIT_RUNCODE}')">标签</a></c:when><c:otherwise><font color="#c0c0c0">标签</font></c:otherwise></c:choose></c:if>
						</td></c:if>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="9" align="center">
						<div id="pactCorp${item.ID}" align="center"
						style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
						<img src="${ctx }/images/loading.gif">
						</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<table class="STYLE2" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							提交主管
							<img src="${ctx }/images/u614.gif">
							主管驳回
							<img src="${ctx }/images/u622.gif">
							主管通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
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
				</tbody>
			</table>
			</div>
				</div>
			</div>		
		</form>
			<div id="creditfile" align="center" title="资料管理" style="display: none; text-align:center; width: 840px">
				<img src="${ctx }/images/loading.gif">
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
						<form action="../servlet/defaultDispatcher?__action=creditReportVip.cancelCredit" id="funds_return_form" method="post">
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
								<td width="100px;">服务课人员</td>
								<td width="300px;"><input type="text" name="processer" id="processer" class="tb_return" 
									onfocus="$('#processer_id').val('');" onblur="getTheSame(0, 'processer');nameOut('processer');"/><input type="hidden" 
									name="processer_id" id="processer_id" /><div id="theSameName_processer" style="position: absolute; 
									width: 148px; background-color: white;border: 1px solid #A6C9E2; display: none; z-index: 99;">
									</div></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr" style="height: 28px;">
								<td width="100px;">业务协办</td>
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
		
		<!-- 备注窗口 -->
		<div style="display:none;" id="credit_memo" title="案件备注">
			<form action="${ctx }/servlet/defaultDispatcher?__action=creditReportVip.addCreditMemo" method="post" id="credit_memo_form">
			<input type="hidden" id="credit_id_memo" name="credit_id">
			<input type="hidden" id="url" name="url" value="${ctx }"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 80px;">
									备注时间
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
									备注人
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									备注
								</th>
							</tr>
							<tbody id="memo_body">
							</tbody>
							<tr class="ui-widget-content jqgrow ui-row-ltr">   
								<td style="text-align: center;" colspan="3">&nbsp;</td>
							</tr>
							<tfoot>
								<tr class="ui-jqgrid-labels" style="height: 25px;">
									<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="3" align="left">
										<b>新增备注</b>
									</th>
								</tr>
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="3"><textarea rows="3" cols="90" name="memo" id="memo_credit"></textarea></td>
								</tr>
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="3" align="center" style="text-align: center;"><input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" onclick="saveCreditMemo();" /></td>
								</tr>
							</tfoot>
						</table>
					</div>
				  </div>
		    </div>
		    </form>
		</div>
		<!-- 标签 -->
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
	</body>
</html>