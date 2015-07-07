<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>评分表设置</title>
  </head>
  <script type="text/javascript">
  	var user_map = null;
   	$(function (){
  		$(".td_div").bind("mouseover", function (){
  			$(this).attr("className", "td_div_hover");
  		}).bind("mouseout", function (){
  			$(this).attr("className", "td_div");
  		});
  		
  		if(user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "employeeCommand.getAllEmpInfo", "job" : "9"},
				dataType : "json",
				success : function (data){
					user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$("#create_by").dropDownList(user_map);
				}
			});
		}
  		$("#progressbar").dialog("close");
  	});
  	
  	function showAddProject(){
  		$("#showAddProjectWin").dialog({modal:true, autoOpen:false, width:600});
  		
  		$("#sql_id").val("");
  		$("#item_code").val("");
  		$("#sqlStr").val("");
  		
  		$("#showAddProjectWin").dialog("open");
  	}
  	
  	function updateSql(id, sqlCode){
  		$("#showAddProjectWin").dialog({modal:true, autoOpen:false, width:600});
  		
  		$("#sql_id").val(id);
  		$("#item_code").val(sqlCode);
  		$("#sqlStr").val($("#sql_div_" + id).text());
  		
  		$("#showAddProjectWin").dialog("open");
  	}
  	
  	function createSql(){
  		$("#action_add").val("businessSupport.createSql");
  		$("#showAddProjectForm").submit();
  	}
  	function createAndTestSql(){
  		$("#action_add").val("businessSupport.createAndTestSql");
  		$("#showAddProjectForm").submit();
  	}
  	function createAndExecuteSql(){
  		$("#action_add").val("businessSupport.createAndExecuteSql");
  		$("#showAddProjectForm").submit();
  	}
  	
	function createAndTestSql(){
		$("#action_add").val("businessSupport.createAndTestSql");
		$("#showAddProjectForm").submit();
  	}
  	
	function createAndExecuteSql(){
		$("#action_add").val("businessSupport.createAndExecuteSql");
		$("#showAddProjectForm").submit();
	}
  	
	function doTest(id){
		$("#progressbar").dialog({
			closeOnEscape : false,
			open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
			modal : true,
			resizable : false,
			draggable : false,
			title : "数据加载中... ..."
		});
		$("#__action").val("businessSupport.doTest");
		$("#id").val(id);
		$("#form1").submit();
	}
	
	function doExecute(id){
		$("#progressbar").dialog({
			closeOnEscape : false,
			open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
			modal : true,
			resizable : false,
			draggable : false,
			title : "数据加载中... ..."
		});
		$("#__action").val("businessSupport.doExecute");
		$("#id").val(id);
		$("#form1").submit();
	}
	
  </script>
	<style type="text/css">
		textarea{
			font-family: Courier New;
		}
		
		.td_div{
			position: relative;
			white-space: pre-wrap;
			overflow: hidden;
			font-family: Courier New !important;
			text-align: left;
			height: 30px;
		}
		
		.td_div_hover{
			white-space: pre-wrap;
			overflow: auto;
			font-family: Courier New !important;
			text-align: left;
			min-height: 60px;
			position: absolute;
			border: 1px solid #A6C9E2;
			background-color: white;
			z-index: 999999;
			margin-top: -22px;
			margin-left: -6px;
			padding: 5px;
			width: 450px;
		}
		
		.msg_div{
			position: relative;
			white-space: pre-wrap;
			overflow: auto;
			text-align: left;
			border: 1px solid #A6C9E2;
			font-weight: normal;
			color: black;
			background-color: white;
		}
		.ui-dialog {
			text-align: center;
			vertical-align: middle;
		}
	</style>
<body>
<div id="progressbar" style="display: none;">
	<img src="${ctx }/images/loading.gif">
</div>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="businessSupport.showDatabaseUpdate" />
<input type="hidden" id="id" name="id">
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;执行SQL语句</span>
</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="background-color: white;">
		<div class="zc_grid_body jqgrowleft">
		<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="60%" class="ss_t" valign="center">
					    <table style="margin-left: 10px;">
						<tr>
							<td>状态:</td>
							<td>
								<select name="search_status" class="panel_select">
									<option value="">全部</option>
									<option value="0" <c:if test="${search_status eq '0'}">selected="selected"</c:if>>初始</option>
									<option value="1"<c:if test="${search_status eq '1'}">selected="selected"</c:if>>已测试</option>
									<option value="2"<c:if test="${search_status eq '2'}">selected="selected"</c:if>>已执行</option>
								</select>
							</td>
							<td>创建人:</td>
							<td>
								<input type="text" name="create_by" id="create_by" value="${create_by}" class="panel_text" width="300px;"/>
							</td>
					        <td>查询内容：</td>
					        <td><input type="text" name="search_context" value="${search_context }" class="panel_text" style="width: 400px;"></td>
						</tr>
					  	</table>
					  </td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" id="search" onclick="$('#form1').submit();"  class="blue_button">搜 索</a></td>
				</tr>
			</table>
	    </div>
	<div class="ui-state-default ui-jqgrid-hdiv " style="height: 87%;">
	<table style="width: 100%">
		<tr>
			<td>
				<input type="button" value="新建SQL" onclick="showAddProject();" class="panel_button"/>&nbsp;
			</td>
			<td align="right"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
		</tr>
	</table>
	<table class="grid_table">
		<tr>
			<th style="width: 3%;">
				状态
			</th>
			<th style="width: 3%;">
				序号
			</th>
			<th style="width: 8%;">
				单号
			</th>
			<th style="width: 40%;">
				SQL语句
			</th>
			<th style="width: 8%;">
				SQL语句类型
			</th>
			<th style="width: 8%;">
				影响数据数量
			</th>
			<th style="width: 8%;">
				创建时间
			</th>
			<th style="width: 8%;">
				执行时间
			</th>
			<th style="width: 6%;">
				创建人
			</th>
			<th style="width: 8%;">
				操作
			</th>
		</tr>
		<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="i">
		<tr style="height: 42px;">
			<td>
				<c:if test="${item.status eq 0}">
					<img src="${ctx }/images/u611.gif" title="初始">
				</c:if>
				<c:if test="${item.status eq 1}">
					<img src="${ctx }/images/u622.gif" title="已测试">
				</c:if>
				<c:if test="${item.status eq 2}">
					<img src="${ctx }/images/u608.gif" title="已执行">
				</c:if>
			</td>
			<td>${i.count}&nbsp;</td>
			<td>${item.item_code}&nbsp;</td>
			<td>
				<div class="td_div" id="sql_div_${item.id}">${item.sql}</div>
			</td>
			<td>
				<c:if test="${empty item.sql_type }">
					无效SQL
				</c:if>
				${item.sql_type}&nbsp;
			</td>
			<td>${item.result}&nbsp;</td>
			<td><fmt:formatDate value="${item.create_time}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
			<td><fmt:formatDate value="${item.executed_time }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
			<td>${item.create_by }&nbsp;</td>	
		   	<td>
		   		<c:if test="${not empty item.sql_type }">
			   		<c:if test="${item.sql_type ne 'SELECT' and item.status < 2}">
			   			<a href="javascript:void(0);" onclick="doTest('${item.id}');">[测试]</a>
			   		</c:if>
			   		&nbsp;&nbsp;
			   		<c:if test="${item.status != 2 or item.sql_type eq 'SELECT'}">
			   			<a href="javascript:void(0);" onclick="updateSql('${item.id}', '${item.item_code}');">[修改]</a>
			   			&nbsp;&nbsp;
			   			<a href="javascript:void(0);" onclick="doExecute('${item.id}');">[执行]</a>
			   		</c:if>
		   		</c:if>
		   	</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<page:pagingToolbar pagingInfo="${pagingInfo }"/>
<table style="width: 100%">
	<tr>
		<td align="right">
			<img src="${ctx }/images/u611.gif">
			初始&nbsp;
			<img src="${ctx }/images/u622.gif">
			已测试&nbsp;
			<img src="${ctx }/images/u608.gif">
			已执行
		</td>
	</tr>
</table>	

<c:if test="${resultList != null}">
<script type="text/javascript">
$("#progressbar").dialog({
	closeOnEscape : false,
	open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
	modal : true,
	resizable : false,
	draggable : false,
	title : "数据加载中... ..."
});
</script>
	结果集：<br>
	<table class="panel_table">
		<c:forEach items="${resultList }" var="dataList" varStatus="i">
			<tr>
				<c:forEach items="${dataList }" var="data" varStatus="j">
					<c:if test="${i.count == 1 }">
						<th>${data }</th>
					</c:if>
					<c:if test="${i.count > 1 }">
						<td>${data }</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
</c:if>

<c:if test="${not empty msg }">
	反馈信息：<br>
	<div class="msg_div">${msg }</div>
</c:if>
</div>
</div>
</div>
</form>

<!-- 添加项目 -->
<div id="showAddProjectWin" title="新建修改SQL" style="display: none;">
<form action="../servlet/defaultDispatcher" id="showAddProjectForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="businessSupport.createSql" />
<input type="hidden" id="sql_id" name="sql_id" />

	<table class="panel_table">
		<tr>
			<th style="width: 15%">单号：</th>
			<td style="width: 85%">
				<input type="text" name="item_code" id="item_code" class="panel_text" style="width: 300px;">
			</td>
		</tr>
		<tr>
			<th style="width: 15%">SQL语句：</th>
			<td style="width: 85%">
				<textarea rows="10" cols="65" name="sqlStr" id="sqlStr" style="font-family: Courier New;"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="4" style="text-align: center;">
				<input type="button" value="保存" class="panel_button" onclick="createSql();">
				<input type="button" value="保存并测试" class="panel_button" onclick="createAndTestSql();">
				<input type="button" value="保存并执行" class="panel_button" onclick="createAndExecuteSql();">
			</th>
		</tr>
	</table>
</form>
</div>

</body>
</html>		