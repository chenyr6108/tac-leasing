<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>虚拟账号管理</title>
  </head>
  <script type="text/javascript">
	$(function (){
		$("#search_date_from").datepicker($.datepicker.regional['zh-CN']);
		$("#search_date_to").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function checkAll(e){
		$(".cb").attr("checked", $(e).attr("checked"));
	}
  	
  	function confirmOne(cust_id){
  		if(confirm("确定要这么做吗？")){
  			var url = "${ctx }/servlet/defaultDispatcher";
  			var param = {__action : "customer.confirmOne", "cust_id" : cust_id, "company_code" : $("#company_code").val()};
  			$.getJSON(url, param, function (data){
  				if(data){
  					alert("操作成功。");
  					$("#form1").submit();
  				}
  			});
  		}
  	}
  	
  	function confirmAll(){
  		if(confirm("确定要这么做吗？")){
  			var cust_id = "";
  	  		$(".cb").each(function (){
  	  			if($(this).attr("checked")){
  	  				cust_id += $(this).val() + ",";
  	  			}
  	  		});
  	  		if(cust_id.length > 0){
  	  			cust_id = cust_id.substring(0, cust_id.length - 1);
  	  			var url = "${ctx }/servlet/defaultDispatcher";
  	  			var param = {__action : "customer.confirmAll", "cust_ids" : cust_id, "company_code" : $("#company_code").val()};
  	  			$.getJSON(url, param, function (data){
  	  				if(data){
  	  					alert("操作成功。");
  	  					$("#form1").submit();
  	  				}
  	  			});
  	  		} else {
  	  			alert("请至少选择一个。");
  	  		}
  		}
  	}
  	
  	function backOne(cust_id){
  		if(confirm("确定要这么做吗？")){
  			var url = "${ctx }/servlet/defaultDispatcher";
  			var param = {__action : "customer.backOne", "cust_id" : cust_id, "company_code" : $("#company_code").val()};
  			$.getJSON(url, param, function (data){
  				if(data){
  					alert("操作成功。");
  					$("#form1").submit();
  				}
  			});
  		}
  	}
  	
  	function backAll(){
  		if(confirm("确定要这么做吗？")){
  			var cust_id = "";
  	  		$(".cb").each(function (){
  	  			if($(this).attr("checked")){
  	  				cust_id += $(this).val() + ",";
  	  			}
  	  		});
  	  		if(cust_id.length > 0){
  	  			cust_id = cust_id.substring(0, cust_id.length - 1);
  	  			var url = "${ctx }/servlet/defaultDispatcher";
  	  			var param = {__action : "customer.backAll", "cust_ids" : cust_id, "company_code" : $("#company_code").val()};
  	  			$.getJSON(url, param, function (data){
  	  				if(data){
  	  					alert("操作成功。");
  	  					$("#form1").submit();
  	  				}
  	  			});
  	  		} else {
  	  			alert("请至少选择一个。");
  	  		}
  		}
  	}
  	
  	function applyOne(cust_id){
  		if(confirm("确定要这么做吗？")){
  			var url = "${ctx }/servlet/defaultDispatcher";
  			var param = {__action : "customer.applyOne", "cust_id" : cust_id, "company_code" : $("#company_code").val()};
  			$.getJSON(url, param, function (data){
  				if(data){
  					alert("操作成功。");
  					$("#form1").submit();
  				}
  			});
  		}
  	}
  	
  	function applyAll(){
  		if(confirm("确定要这么做吗？")){
  			var cust_id = "";
  	  		$(".cb").each(function (){
  	  			if($(this).attr("checked")){
  	  				cust_id += $(this).val() + ",";
  	  			}
  	  		});
  	  		if(cust_id.length > 0){
  	  			cust_id = cust_id.substring(0, cust_id.length - 1);
  	  			var url = "${ctx }/servlet/defaultDispatcher";
  	  			var param = {__action : "customer.applyAll", "cust_ids" : cust_id, "company_code" : $("#company_code").val()};
  	  			$.getJSON(url, param, function (data){
  	  				if(data){
  	  					alert("操作成功。");
  	  					$("#form1").submit();
  	  				}
  	  			});
  	  		} else {
  	  			alert("请至少选择一个。");
  	  		}
  		}
  	}
  	
  	function doApplyVirtualAccount(){
  		var url = "${ctx }/servlet/defaultDispatcher";
		var param = {__action : "customer.doApplyVirtualAccount"};
		$.getJSON(url, param, function (data){
			if(data){
				alert("操作成功。");
				$("#form1").submit();
			}
		});
  	}
  	
  	function doRemark(cust_id){
		var num = null;
		var url = "${ctx }/servlet/defaultDispatcher";
		var param = {__action : "customer.getRemarkById", "cust_id" : cust_id};
		$.getJSON(url, param, function (data){
			$("#showAddRemarkWin").dialog({modal:true, autoOpen:false, width:500});
			if(data != null){
				$("#remark").val(data);
			} else {
				$("#remark").val("");
			}
			$("#CUST_ID").val(cust_id);
			$("#showAddRemarkWin").dialog("open");
		});
	}
  	
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="customer.virtualAccountManager" />
<input type="hidden" id="company_code" name="company_code"  value="${search_company }" />
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;虚拟账号管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
				        	<tr>
				        		<td>客户类型:</td>
				        		<td>
				        			<select name="search_type" class="panel_select">
				        				<option value="" >全部</option>
				        				<option value="1" <c:if test="${search_type eq '1' }">selected="selected"</c:if>>设备</option>
				        				<option value="2" <c:if test="${search_type eq '2' }">selected="selected"</c:if>>商用车</option>
				        				<option value="3" <c:if test="${search_type eq '3' }">selected="selected"</c:if>>乘用车</option>
				        			</select>
				        		</td>
				        		<td>公司:</td>
				        		<td>
				        			<select name="search_company" class="panel_select">
				        				<option value="1" <c:if test="${search_company eq '1' }">selected="selected"</c:if>>裕融</option>
				        				<option value="2" <c:if test="${search_company eq '2' }">selected="selected"</c:if>>裕国</option>
				        			</select>
				        		</td>
				        		<td>状态:</td>
				        		<td>
				        			<select name="search_status" class="panel_select" <c:if test="${!manageRole }">disabled="disabled"</c:if>>
				        				<option value="0" <c:if test="${search_status eq '0' }">selected="selected"</c:if>>未申请</option>
				        				<option value="10" <c:if test="${search_status eq '10' }">selected="selected"</c:if>>待申请</option>
				        				<option value="1" <c:if test="${search_status eq '1' }">selected="selected"</c:if>>申请中</option>
				        				<option value="2" <c:if test="${search_status eq '2' }">selected="selected"</c:if>>已申请</option>
				        			</select>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>申请时间:</td>
				        		<td colspan="3">
				        			<input type="text" name="search_date_from" id="search_date_from" value="${search_date_from }" class="panel_text" style="width: 100px;"/>-
				        			<input type="text" name="search_date_to" id="search_date_to" value="${search_date_to }" class="panel_text" style="width: 100px;"/>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>关键字:</td>
				        		<td colspan="3">
				        			<input type="text" name="search_content" value="${search_content }" class="panel_text" style="width: 300px;"/>
				        		</td>
				        	</tr>
				        </table>
		 		</td>
				<td style="width:50px;" class="ss_bigt" valign="middle">
					<a href="javaScript:void(0)" id="search_but" onclick="$('#form1').submit();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
	</div>
	<br/>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table style="width: 100%">
					<tr>
						<td>
							
							<c:if test="${search_status == 0}">
					   			<input type="button" value="批量申请" onclick="applyAll();" class="panel_button"/>
					   		</c:if>
					   		<c:if test="${search_status == 1}">
					   			<input type="button" value="批量确认" onclick="confirmAll();" class="panel_button"/>
					   		</c:if>
					   		<c:if test="${search_status == 10}">
					   			<input type="button" value="批量确认" onclick="backAll();" class="panel_button"/>
					   		</c:if>
							
							<%-- <input type="button" value="Test" onclick="doApplyVirtualAccount();" class="panel_button"/> --%>
						</td>
						<td align="right"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
					</tr>
				</table>
				<table class="grid_table">
					<tr>
						<th style="text-align: center;">
							<input type="checkbox" onclick="checkAll(this);"/>
						</th>
						<th style="text-align: center;">
							状态
						</th>
						<th style="text-align: center;">
							序号
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CUST_CODE">承租人编号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CUST_NAME">承租人名称</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="VIRTUAL_CODE">虚拟账号</page:pagingSort>
						</th>
						<c:if test="${manageRole }">
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="EXPORT_DATE">申请时间</page:pagingSort>
						</th>
						<c:if test="${search_status eq '1' or search_status eq '2' }">
						<th style="text-align: center;">
							备注
						</th>
						</c:if>
						</c:if>
						<c:if test="${search_status ne '2' }">
						<th style="text-align: center;">
							操作
						</th>
						</c:if>
					</tr>
					<tbody>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="i">
					<tr>
						<td>
							<c:if test="${item.EXPORT_FLAG == 1 || item.EXPORT_FLAG == 0|| item.EXPORT_FLAG == 10}">
								<input type="checkbox" class="cb" value="${item.CUST_ID}" />
							</c:if>
						</td>
						<td>
							<c:if test="${item.EXPORT_FLAG == 0}">
								<img src="${ctx }/images/u608.gif" title="未申请">
							</c:if>
							<c:if test="${item.EXPORT_FLAG == 10}">
								<img src="${ctx }/images/u620.gif" title="待申请">
							</c:if>
							<c:if test="${item.EXPORT_FLAG == 1}">
								<img src="${ctx }/images/u622.gif" title="申请中">
							</c:if>
							<c:if test="${item.EXPORT_FLAG == 2}">
								<img src="${ctx }/images/u611.gif" title="已申请">
							</c:if>
						</td>
						<td>${i.count}&nbsp;</td>
						<td>${item.CUST_CODE}&nbsp;</td>
						<td>${item.CUST_NAME}&nbsp;</td>
						<td>${item.VIRTUAL_CODE}&nbsp;</td>
						<c:if test="${manageRole }">
						<td><fmt:formatDate value="${item.EXPORT_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
						<c:if test="${search_status eq '1' or search_status eq '2' }">
						<td style="white-space: pre-wrap;">${item.EXPORT_REMARK}&nbsp;</td>
						</c:if>
						<c:if test="${search_status ne '2' }">
					   	<td>
					   		<c:if test="${item.EXPORT_FLAG == 0}">
					   			<a href="#" onclick="applyOne('${item.CUST_ID}');">申请</a>
					   		</c:if>
					   		<c:if test="${item.EXPORT_FLAG == 10}">
					   			<a href="#" onclick="backOne('${item.CUST_ID}');">驳回</a>
					   		</c:if>
					   		<c:if test="${item.EXPORT_FLAG == 1}">
					   			<a href="#" onclick="confirmOne('${item.CUST_ID}');">确认</a>
					   			&nbsp;|&nbsp;
					   			<a href="#" onclick="doRemark('${item.CUST_ID}');">备注</a>
					   		</c:if>
					   		&nbsp;
					   	</td>
					   	</c:if>
					   	</c:if>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			<table style="width: 100%">
				<tr>
					<td align="right">
						<img src="${ctx }/images/u608.gif">
						未申请&nbsp;
						<img src="${ctx }/images/u620.gif">
						待申请&nbsp;
						<img src="${ctx }/images/u622.gif">
						申请中&nbsp;
						<img src="${ctx }/images/u611.gif">
						已申请
					</td>
				</tr>
			</table>	
			</div>
			</div>
			</div>
			</form>
			
<!-- 添加案件 -->
<div id="showAddRemarkWin" title="添加备注" style="display: none;">
<form action="../servlet/defaultDispatcher" id="showAddRemarkForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="customer.addRemark" />
<input type="hidden" id="company_code_add" name="company_code"  value="${search_company }" />
<input type="hidden" id="CUST_ID" name="CUST_ID" />
	<table class="panel_table">
		<tr>
			<th>备注：</th>
			<td style="text-align: left;">
				<textarea rows="5" cols="60" name="remark" id="remark"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="$('#showAddRemarkForm').submit();">
			</th>
		</tr>
	</table>
</form>
</div>


<div id="logWin" title="日志" style="display: none;">
	<img src="${ctx }/images/loading.gif">
</div>

</body>
</html>		