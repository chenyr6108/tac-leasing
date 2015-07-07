<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<script type="text/javascript">
		function openAddDiv() {
			$("#addDiv").dialog({modal:true,autoOpen:false,width:300,hide:'slide', show:'slide'});
	        $("#addDiv").dialog("open");
		}
		
		function openUpdateDiv(year,target) {
			$("#UPDATE_YEAR").val(year);
			$("#UPDATE_TARGET").val(target);
			$("#updateDiv").dialog({modal:true,autoOpen:false,width:300,hide:'slide', show:'slide'});
	        $("#updateDiv").dialog("open");
		}
		
		function save() {
			if($("#YEAR").val()=='') {
				alert("年份不能为空!");
				$("#YEAR").focus();
				return;
			}
			if($("#TARGET").val()=='') {
				alert("目标不能为空!");
				$("#TARGET").focus();
				return;
			}
			
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=loanCommand.checkExistYear&YEAR='+$("#YEAR").val(),
				dataType:'json',
				success: function(flag)	{
					if(!flag) {
						alert("该年份的目标已存在,不能重复录入!");
						$("#YEAR").focus();
					} else {
						$("#addForm").submit();
					}
				}
			});
		}
		
		function update() {
			$("#updateForm").submit();
		}
	</script>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="text-align:left;height:30px;width: 600px;">
				<span class="ui-jqgrid-title" style="line-height:30px;font-size:15px;">&nbsp;&nbsp;委贷目标录入</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 600px;">
		<input type="button" value="新建目标" class="ui-state-default ui-corner-all" onclick="openAddDiv()" style="cursor:pointer;">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;width: 600px;">
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table" style="width: 600px;">
				<tr>
					<th>
						年份
					</th>
					<th>
						目标
					</th>
					<th>
						件数
					</th>
					<th>
						累计拨款
					</th>
					<th>
						达成率
					</th>
					<th>
						剩余时间
					</th>
				</tr>
				<c:forEach var="item" items="${result }">
					<tr style="cursor: pointer;">
						<td style="text-align: center;">
							<a href="javascript:void(0)" onclick="openUpdateDiv('${item.year }','<fmt:formatNumber value="${item.target }" type="currency" pattern="#,##0.00"/>')">${item.year }</a>
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber value="${item.target }" type="currency" pattern="#,##0.00"/>&nbsp;
						</td>
						<td style="text-align: right;">
							${item.count }&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber value="${item.payMoney }" type="currency" pattern="#,##0.00"/>&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber value="${item.achievePer }" pattern="0.00"/>%&nbsp;
						</td>
						<td style="text-align: right;">
							<fmt:formatNumber value="${item.limitMonth }" pattern="0"/>月&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="updateDiv" style="display:none;" title="更新目标">
		<form action="../servlet/defaultDispatcher?__action=loanCommand.updateTarget" id="updateForm" method="post">
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
				<tr>
					<td style="text-align:right;width:100px;font-weight:normal;">
						<font color="#E83038;">*</font>年份：
					</td>
					<td>
						 <input style="width:150px;" id="UPDATE_YEAR" name="UPDATE_YEAR" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td style="text-align:right;width:100px;font-weight:normal;">
						<font color="#E83038;">*</font>目标：
					</td>
					<td>
						 <input style="width:150px;" id="UPDATE_TARGET" name="UPDATE_TARGET" onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">(元)
					</td>
				</tr>
			</table>
			<center>
				<input type="button" value="保&nbsp;存" onclick="update()" class="ui-state-default ui-corner-all" style="cursor:pointer;">&nbsp;<input type="button" value="关&nbsp;闭" onclick="$('#updateDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
			</center>
		</form>
	</div>
	<div id="addDiv" style="display:none;" title="新建目标">
		<form action="../servlet/defaultDispatcher?__action=loanCommand.saveTarget" id="addForm" method="post">
			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
				<tr>
					<td style="text-align:right;width:100px;font-weight:normal;">
						<font color="#E83038;">*</font>年份：
					</td>
					<td>
						 <input style="width:150px;" id="YEAR" name="YEAR" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="4">
					</td>
				</tr>
				<tr>
					<td style="text-align:right;width:100px;font-weight:normal;">
						<font color="#E83038;">*</font>目标：
					</td>
					<td>
						 <input style="width:150px;" id="TARGET" name="TARGET" onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}">(元)
					</td>
				</tr>
			</table>
			<center>
				<input type="button" value="保&nbsp;存" onclick="save()" class="ui-state-default ui-corner-all" style="cursor:pointer;">&nbsp;<input type="button" value="关&nbsp;闭" onclick="$('#addDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
			</center>
		</form>
	</div>
</body>
</html>