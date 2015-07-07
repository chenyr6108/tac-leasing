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
  	$(function (){
  	});
  	
  	function addRatingSubject(){
  		$("#showAddProjectForm").submit();
  	}
  	
  	function showAddProject(){
  		$("#showAddProjectWin").dialog({modal:true, autoOpen:false, width:400});
  		/* $("#rating_type_add").val($("#rating_type").val()); */
  		$("#showAddProjectWin").dialog("open");
  	}
  	
  	function showSecond(e){
  		if($(e).val() == "2"){
  			$("#up_id_add").show();
  		} else {
  			$("#up_id_add").hide();
  		}
  	}
  	
  	function showDetail(subject_id){
  		$("#subject_id").val(subject_id);
  		$("#form1").submit();
  	}
  	
  	function showAddOption(){
  		$("#showAddOptionWin").dialog({modal:true, autoOpen:false, width:400});
  		$("#showAddOptionWin").dialog("open");
  	}
  	
  	function addRatingOption(){
  		$("#showAddOptionForm").submit();
  	}
  	
  	function updateSubjectStatus(id, status){
  		$("#status_update").val(status);
  		$("#id_update").val(id);
  		$("#__action").val("riskAudit.updateRatingSubjectStatus");
  		$("#form1").submit();
  	}
  	
  	function updateOptionStatus(id, status){
  		$("#status_update").val(status);
  		$("#id_update").val(id);
  		$("#__action").val("riskAudit.updateRatingOptionStatus");
  		$("#form1").submit();
  	}
  	
  	function showScoreCardForCurrent(){
  		var url = "${ctx }";
  		var scoreCard = $("#scoreCard").val();
		window.parent.openNewTab(url,"riskAudit.showScoreCardForCurrent&scoreCard=" + scoreCard, "评分表显示");
  	}
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="riskAudit.riskScoreCardSettingPage" />
<%-- <input type="hidden" id="rating_type" name="rating_type" value="${rating_type_search }" /> --%>
<input type="hidden" id="subject_id" name="subject_id" value="${subject_id }" />
<input type="hidden" id="status_update" name="status" />
<input type="hidden" id="id_update" name="id" />
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评分表题库</span>
</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
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
								<select name="search_status">
									<option value="N">全部</option>
									<option value="0" <c:if test="${search_status eq '0'}">selected="selected"</c:if>>正常</option>
									<option value="-1"<c:if test="${search_status eq '-1'}">selected="selected"</c:if>>作废</option>
								</select>
							</td>
					        <td>查询内容：</td>
					        <td><input type="text" name="search_context" value="${search_context }" style=" width:395px;height:20px; font-size: 12px;"></td>
						</tr>
					  	</table>
					  </td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" id="search" onclick="$('#form1').submit();"  class="blue_button">搜 索</a></td>
				</tr>
			</table>
	    </div>
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<table style="width: 100%">
		<tr>
			<td>
				<input type="button" value="添加项目" onclick="showAddProject();" class="panel_button"/>&nbsp;
			</td>
			<td align="right"><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
		</tr>
	</table>
	<table class="grid_table">
		<tr>
			<th style="text-align: center;">
				状态
			</th>
			<th style="text-align: center;">
				序号
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="subject">项目名称</page:pagingSort>
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="subject_level">项目等级</page:pagingSort>
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="option_count">选项数量</page:pagingSort>
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="option_score_sum">选项满分</page:pagingSort>
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="subject_order_by">排序</page:pagingSort>
			</th>
			<th style="text-align: center;">
				<page:pagingSort pagingInfo="${pagingInfo }" orderBy="subject_create_date">创建时间</page:pagingSort>
			</th>
			<th style="text-align: center;">
				创建人
			</th>
			<th style="text-align: center;">
				操作
			</th>
		</tr>
		<tbody>
		<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="i">
		<tr onclick="showDetail(${item.subject_id});">
			<td>
				<c:if test="${item.subject_id eq subject_id }">
					<font style="color: red;">▶</font>
				</c:if>
				<c:if test="${item.subject_status eq -1}">
					<img src="${ctx }/images/u617.gif">
				</c:if>
				<c:if test="${item.subject_status eq 0}">
					<img src="${ctx }/images/u611.gif">
				</c:if>
			</td>
			<td>${i.count}&nbsp;</td>
			<td>${item.subject}&nbsp;</td>
			<td>${item.subject_level}级&nbsp;</td>
			<td>${item.option_count}&nbsp;</td>
			<td>${item.option_score_sum}分&nbsp;</td>
			<td>${item.subject_order_by }&nbsp;</td>
			<td><fmt:formatDate value="${item.subject_create_date }" pattern="yyyy-MM-dd"/>&nbsp;</td>
			<td>${item.subject_create_by }&nbsp;</td>	
		   	<td>
				<c:if test="${item.subject_status eq -1}">
					<a href="#" onclick="updateSubjectStatus('${item.subject_id}', '0');">启用</a>&nbsp;
				</c:if>
				<c:if test="${item.subject_status eq 0}">
					<a href="#" onclick="updateSubjectStatus('${item.subject_id}', '-1');">作废</a>&nbsp;
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
			正常&nbsp;
			<img src="${ctx }/images/u617.gif">
			作废
		</td>
	</tr>
</table>	
</div>
</div>
</div>
</form>
<c:if test="${not empty subject_id }">
<input type="button" value="添加选项" onclick="showAddOption();" class="panel_button"/>
<table class="grid_table">
	<tr>
		<th>状态</th>
		<th>序号	</th>
		<th>选项内容</th>
		<th>分数</th>
		<th>类型</th>
		<th>排序</th>
		<th>创建时间</th>
		<th>创建人</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${ratingOptionList}" var="item" varStatus="i">
		<tr>
			<td>
				<c:if test="${item.option_status eq -1}">
					<img src="${ctx }/images/u617.gif">
				</c:if>
				<c:if test="${item.option_status eq 0}">
					<img src="${ctx }/images/u611.gif">
				</c:if>
			</td>
			<td>${i.count}&nbsp;</td>
			<td>${item.option_name}&nbsp;</td>
			<td>${item.option_score}分&nbsp;</td>
			<td>
				<c:if test="${item.option_type eq 1}">
					单选
				</c:if>
				<c:if test="${item.option_type eq 2}">
					复选
				</c:if>
				&nbsp;
			</td>
			<td>${item.option_order_by }&nbsp;</td>
			<td><fmt:formatDate value="${item.option_create_date }" pattern="yyyy-MM-dd"/>&nbsp;</td>
			<td>${item.option_create_by }&nbsp;</td>	
		   	<td>
		   		<c:if test="${item.option_status eq -1}">
					<a href="#" onclick="updateOptionStatus('${item.option_id}', '0');">启用</a>&nbsp;
				</c:if>
				<c:if test="${item.option_status eq 0}">
					<a href="#" onclick="updateOptionStatus('${item.option_id}', '-1');">作废</a>&nbsp;
				</c:if>
		   	</td>
		</tr>
	</c:forEach>
</table>
</c:if>
<!-- 添加项目 -->
<div id="showAddProjectWin" title="添加项目" style="display: none;">
<form action="../servlet/defaultDispatcher" id="showAddProjectForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="riskAudit.addRatingSubject" />
<!-- <input type="hidden" id="rating_type_add" name="riskScoreCard.rating_type" /> -->
	<table class="panel_table">
		<tr>
			<th style="width: 20%">项目名称：</th>
			<td style="width: 80%">
				<input type="text" name="riskScoreCard.subject" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th>项目级别：</th>
			<td style="text-align: left;">
				<select name="riskScoreCard.subject_level" onchange="showSecond(this);" style="height: 25px;">
					<option value="">请选择</option>
					<option value="1">1级</option>
					<option value="2">2级</option>
				</select>
				<tac:dropdownListTag name="riskScoreCard.up_id" id="up_id_add" item="${subjectLevel1 }" style="height: 25px; display: none; width: 200px;"/>
			</td>
		</tr>
		<tr>
			<th>项目排序：</th>
			<td style="text-align: left;">
				<input type="text" name="riskScoreCard.subject_order_by" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th>说明：</th>
			<td style="text-align: left;">
				<input type="text" name="riskScoreCard.subject_memo" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th colspan="4" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="addRatingSubject();">
			</th>
		</tr>
	</table>
</form>
</div>

<!-- 添加选项 -->
<div id="showAddOptionWin" title="添加选项" style="display: none;">
<form action="../servlet/defaultDispatcher" id="showAddOptionForm" method="post">
<input type="hidden" id="action_add" name="__action"  value="riskAudit.addRatingOption" />
<input type="hidden" name="riskScoreCard.subject_id" value="${subject_id }" />
	<table class="panel_table">
		<tr>
			<th style="width: 20%">选项名称：</th>
			<td style="width: 80%">
				<input type="text" name="riskScoreCard.option_name" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th>选项分数：</th>
			<td style="text-align: left;">
				<input type="text" name="riskScoreCard.option_score" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th>选项类型：</th>
			<td style="text-align: left;">
				<select name="riskScoreCard.option_type" class="panel_select">
					<option value="">请选择</option>
					<option value="1">单选</option>
					<option value="2">复选</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>选项排序：</th>
			<td style="text-align: left;">
				<input type="text" name="riskScoreCard.option_order_by" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th>说明：</th>
			<td style="text-align: left;">
				<input type="text" name="riskScoreCard.option_memo" class="panel_text" style="width: 250px;"/>
			</td>
		</tr>
		<tr>
			<th colspan="4" style="text-align: center;">
				<input type="button" value="提交" class="panel_button" onclick="addRatingOption();">
			</th>
		</tr>
	</table>
</form>
</div>

</body>
</html>		