<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>发票寄发查询</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
			});
		function submitserach() {
			$("#__currentPage").val("1");
			$("#form1").submit();
		}
		
		function addOneBarcode(){
			location.href="../servlet/defaultDispatcher?__action=oneBarcodeCommand.writeOneBarcode";
		}
		function deleteOneBarcode(id){
			$("#opResultMessage").html("你确定要删除该条记录么？");
			$('#opResult').dialog({
				resizable: false,
			    modal: true,
			    buttons: {
			      "取消": function() {
			        $(this).dialog("close");
			      },
			      "删除":function(){
						$(this).dialog("close");
			    	  	$.post("../servlet/defaultDispatcher?__action=oneBarcodeCommand.deleteOneBarcode&id=" + id
			  				, function(data){
			  					if(data == 'ok'){
			  						$("#opResultMessage1").html("删除成功！");
			  						$('#opResult1').dialog({
			  							 buttons: {
				  							"确定": function() {
				  						        $(this).dialog("close");
				  						      	submitserach();
				  						      }
			  							 }
			  						});
			  					} else {
			  						$("#opResultMessage1").html("删除失败！");
			  						$('#opResult1').dialog({
			  							 buttons: {
				  							"确定": function() {
				  						        $(this).dialog("close");
				  						      }
			  							 }
			  						});
			  					}
			  				});
			      }
			    }
			});
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" id="__action" name="__action" value="oneBarcodeCommand.queryOneBarcodeList" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;发票寄发查询</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px;">
							<tr>
								<td>起始日期：</td>
				              <td> <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }"> </td>
				              <td>结束日期：</td>
				              <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }"></td>
								<td>快递公司：
									<select id="expressNameId" name="expressNameId">
									         <option <c:if test="${expressNameId eq '-1' }">selected="selected"</c:if> value="-1">请选择</option>
									     	<c:forEach items="${expressList}" var="list">
													<option  <c:if test="${expressNameId eq list.CODE }">selected="selected"</c:if>  value="${list.CODE}">${ list.FLAG}</option>
											</c:forEach>
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
								<td>
									状态：
									<select name="status">
										<option value="0" <c:if test="${status eq '0' }">selected="selected"</c:if>>有效</option>
										<option value="1" <c:if test="${status eq '1' }">selected="selected"</c:if>>已删除</option>
									</select>			          
									</td>
								</tr>
								<tr>
									<td>查询内容：</td>
									<td colspan="6"><input type="text" name="content" value="${content}" style="width: 240px; height: 18px; font-size: 12px;"></td>
								</tr>
							</table>

						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="searchs" id="searchs" onclick="submitserach();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<c:if test="${oneCode}">
				<div style="margin-left: 40px">
					<input type="button" name="addbutton" onclick="addOneBarcode();" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="录入条形码">
				</div>
			</c:if>
			<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr>
							<td align="right" colspan="14" style="text-align: center; background-color: #C5DBEC;" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbarTop pagingInfo="${pagingInfo }" /></td>
						</tr>
					</thead>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">支付表号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">承租人名称</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">期数</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">客户经理</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">办事处</th>
							 <th class="ui-state-default ui-th-ltr zc_grid_head" width="50">快递单号</th>
							 <th class="ui-state-default ui-th-ltr zc_grid_head" width="50">快递公司</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">录入时间</th>
							<c:if test="${status eq '0' }">
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">操作 </th>
							</c:if>
							<c:if test="${status eq '1' }">
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">删除人(时间)</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagingInfo.resultList}" var="oneBarcode" varStatus="s">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">&nbsp;${oneBarcode.RECP_CODE}</td>
								<td style="text-align: center;">&nbsp;${oneBarcode.CUST_NAME}</td>
								<td style="text-align: center;">&nbsp;${oneBarcode.PERIOD}</td>
							    <td style="text-align: center;">&nbsp;${oneBarcode.NAME}</td>
								<td style="text-align: center;">&nbsp;${oneBarcode.DECP_NAME_CN}</td>
								<td style="text-align: center;">&nbsp;${oneBarcode.EXPRESS_ID}</td>
								<td style="text-align: center;">&nbsp;
								<c:if test="${ oneBarcode.FLAG eq '顺丰'}"><a href="http://www.sf-express.com/cn/sc/" target="_blank">${oneBarcode.FLAG}</a></c:if>
								<c:if test="${ oneBarcode.FLAG eq '汇通'}"><a href="http://www.htky365.com/" target="_blank">${oneBarcode.FLAG}</a></c:if>
								<c:if test="${ oneBarcode.FLAG eq 'EMS'}"><a href="http://www.ems.com.cn/" target="_blank">${oneBarcode.FLAG}</a></c:if>
								</td>
								<td style="text-align: center;">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${oneBarcode.CREATE_TIME}"/>&nbsp;</td>
								<td style="text-align: center;">
									<c:if test="${status eq '0' && (canDelete || s_employeeId == 383 || s_employeeId == 381) }"><a href="javascript:void(0)" onclick="deleteOneBarcode('${oneBarcode.ID}')">删除</a>&nbsp;</c:if>
									<c:if test="${status eq '1' }">${oneBarcode.DELETE_USER_NAME }(<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${oneBarcode.DELETE_TIME}"/>)</c:if>&nbsp;
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td align="right" colspan="14" style="text-align: center; background-color: #C5DBEC;" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbar pagingInfo="${pagingInfo }"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	
	<div id="opResult" title="操作提示">
  		<p id="opResultMessage">${opResultMessage }</p>
	</div>
	<div id="opResult1" title="操作提示">
  		<p id="opResultMessage1">${opResultMessage }</p>
	</div>
</body>
</html>