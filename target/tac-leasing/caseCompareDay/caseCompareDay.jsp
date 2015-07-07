<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>

	function doQuery() {
		if(isNaN($('#A-G').val())) {
			alert("G-A栏位请输入数字!");
			$('#A-G').val("");
			return;
		}
		if(isNaN($('#A-B').val())) {
			alert("G-F栏位请输入数字!");
			$('#A-B').val("");
			return;
		}
		if(isNaN($('#B-C').val())) {
			alert("F-E栏位请输入数字!");
			$('#B-C').val("");
			return;
		}
		if(isNaN($('#C-D').val())) {
			alert("E-D栏位请输入数字!");
			$('#C-D').val("");
			return;
		}
		if(isNaN($('#D-E').val())) {
			alert("D-C栏位请输入数字!");
			$('#D-E').val("");
			return;
		}
		if(isNaN($('#E-F').val())) {
			alert("C-B栏位请输入数字!");
			$('#E-F').val("");
			return;
		}
		if(isNaN($('#F-G').val())) {
			alert("B-A栏位请输入数字!");
			$('#F-G').val("");
			return;
		}
		$("#form").submit();
	}
	
	function doSort(param1,param2) {
		$("#TYPE").val(param1);
		if(param1=='A_G') {
			$("#A_G_SORT").val(param2);
		} else if(param1=='A_B') {
			$("#A_B_SORT").val(param2);
		} else if(param1=='B_C') {
			$("#B_C_SORT").val(param2);
		} else if(param1=='C_D') {
			$("#C_D_SORT").val(param2);
		} else if(param1=='D_E') {
			$("#D_E_SORT").val(param2);
		} else if(param1=='E_F') {
			$("#E_F_SORT").val(param2);
		} else if(param1=='F_G') {
			$("#F_G_SORT").val(param2);
		}
		doQuery();
	}
	
	function reSet() {
		$("#__action").val("caseCompareDayCommand.reset");
		$("#form").submit();
	}
	
	$(function () {
		if($("#F-G").val()!="") {
			$("#A").css("color","red");
		}
		if($("#E-F").val()!="") {
			$("#B").css("color","red");
		}
		if($("#D-E").val()!="") {
			$("#C").css("color","red");
		}
		if($("#C-D").val()!="") {
			$("#D").css("color","red");
		}
		if($("#B-C").val()!="") {
			$("#E").css("color","red");
		}
		if($("#A-B").val()!="") {
			$("#F").css("color","red");
		}		
		if($("#A-G").val()!="") {
			$("#G").css("color","red");
		}
	});
	
	function goBack() {
		window.location.href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryCaseCompare";
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="caseCompareDayCommand.query">
		<input type="hidden" name="TYPE" id="TYPE">
		<input type="hidden" name="A_G_SORT" id="A_G_SORT">
		<input type="hidden" name="A_B_SORT" id="A_B_SORT">
		<input type="hidden" name="B_C_SORT" id="B_C_SORT">
		<input type="hidden" name="C_D_SORT" id="C_D_SORT">
		<input type="hidden" name="D_E_SORT" id="D_E_SORT">
		<input type="hidden" name="E_F_SORT" id="E_F_SORT">
		<input type="hidden" name="F_G_SORT" id="F_G_SORT">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;案件进度时间表</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<table width="1200px;" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" >
			<tr>
				<td width="8" >&nbsp;</td>
				<td width="60" class="ss_o" >&nbsp;</td>
				<td class="ss_t" >
					<table style="margin-left:30px;">
						<tr>
							<td>
							月份：
							<select id="DATE" name="DATE">
								<c:forEach items="${dateList}" var="item">
									<option value="${item.createOnCode }" <c:if test="${item.createOnCode == DATE }">selected="selected"</c:if>>
										${item.createOnDescr }
									</option>
								</c:forEach>
							</select>
							办事处：
							<select id="DEPT_ID" name="DEPT_ID">
									<option value="">--所有--</option>
								<c:forEach items="${deptList}" var="item">
									<option value="${item.deptId }" <c:if test="${item.deptId eq DEPT_ID }">selected="selected"</c:if>>
										${item.deptName }
									</option>
								</c:forEach>
							</select>
							业务经理：
							<select id="USER_ID" name="USER_ID">
									<option value="">--所有--</option>
								<c:forEach items="${userList}" var="item">
									<option value="${item.userId }" <c:if test="${item.userId eq USER_ID }">selected="selected"</c:if>>
										${item.userName }
									</option>
								</c:forEach>
							</select>
							内容：
							<input id="CONTENT" name="CONTENT" value="${CONTENT }">
							<br>
							<table border="0" cellspacing="0" cellpadding="0" >
								<tr><td><!-- <input type="checkbox" onclick="enableInput('A-F')"> --></td><td>&nbsp;G-A></td><td><input style="width:30px;" id="A-G" name="A-G" value="${A_G }" onkeyup="value=value.replace(/[^\d]/g,'')"

								>天</td>
									<%-- <td>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="checkbox" onclick="enableInput('A-B')"> --></td><td>&nbsp;A-B></td><td><input style="width:30px;" id="A-B" name="A-B" value="${A_B }">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="checkbox" onclick="enableInput('B-C')"> --></td><td>&nbsp;B-C></td><td><input style="width:30px;" id="B-C" name="B-C" value="${B_C }">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="checkbox" onclick="enableInput('C-D')"> --></td><td>&nbsp;C-D></td><td><input style="width:30px;" id="C-D" name="C-D" value="${C_D }">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="checkbox" onclick="enableInput('D-E')"> --></td><td>&nbsp;D-E></td><td><input style="width:30px;" id="D-E" name="D-E" value="${D_E }">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="checkbox" onclick="enableInput('E-F')"> --></td><td>&nbsp;E-F></td><td><input style="width:30px;" id="E-F" name="E-F" value="${E_F }">天</td> --%>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;B-A></td><td><input style="width:30px;" id="F-G" name="F-G" value="${F_G }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;C-B></td><td><input style="width:30px;" id="E-F" name="E-F" value="${E_F }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;D-C></td><td><input style="width:30px;" id="D-E" name="D-E" value="${D_E }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;E-D></td><td><input style="width:30px;" id="C-D" name="C-D" value="${C_D }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;F-E></td><td><input style="width:30px;" id="B-C" name="B-C" value="${B_C }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;G-F></td><td><input style="width:30px;" id="A-B" name="A-B" value="${A_B }" onkeyup="value=value.replace(/[^\d]/g,'')">天</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="55" class="ss_th" valign="top" >&nbsp;</td>
				<td width="20%" ><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a>
								 <!-- <a href="#" name="search" id="search"
					onclick="reSet();" class="blue_button">重置</a> -->
					</td>
			</tr>
		</table>
		<br><br><br>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<c:if test="${isUnnatural eq 'Y' }">
				<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="goBack()" style="cursor: pointer;"/>
				<input type="hidden" name="showBackButton" value="Y">
				<br><br>
			</c:if>
						<table cellspacing="0" cellpadding="0" border="0" style="width:1700px;">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:30px;">
										序号
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:90px;">
										合同号
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:160px;">
										客户
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:60px;">
										客户经理
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:70px;">
										办事处
									</td><!-- 由于栏位的顺寻重新排列,所有title的别名重新命名,代码的命名并没有重新命名 add by ShenQi -->
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="G"
									onclick="doSort('A_G',<c:if test='${A_G_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${A_G_SORT eq "ASC" or A_G_SORT==null }'>'DESC'</c:if>)">
										<!-- A-F -->G-A(天)<br>点击排序<c:if test='${A_G_SORT eq "DESC" }'>↓</c:if><c:if test='${A_G_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										进件时间(<!-- F -->A)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="A"
									onclick="doSort('F_G',<c:if test='${F_G_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${F_G_SORT eq "ASC" or F_G_SORT==null }'>'DESC'</c:if>)">
										<!-- E-F -->B-A(天)<br>点击排序<c:if test='${F_G_SORT eq "DESC" }'>↓</c:if><c:if test='${F_G_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										访厂时间(<!-- F -->B)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="B"
									onclick="doSort('E_F',<c:if test='${E_F_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${E_F_SORT eq "ASC" or E_F_SORT==null }'>'DESC'</c:if>)">
										<!-- E-F -->C-B(天)<br>点击排序<c:if test='${E_F_SORT eq "DESC" }'>↓</c:if><c:if test='${E_F_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:110px;">
										初次提交风控时间(<!-- E -->C)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="C"
									onclick="doSort('D_E',<c:if test='${D_E_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${D_E_SORT eq "ASC" or D_E_SORT==null }'>'DESC'</c:if>)">
										<!-- D-E -->D-C(天)<br>点击排序<c:if test='${D_E_SORT eq "DESC" }'>↓</c:if><c:if test='${D_E_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:110px;">
										最终提交风控时间(<!-- D -->D)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="D"
									onclick="doSort('C_D',<c:if test='${C_D_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${C_D_SORT eq "ASC" or C_D_SORT==null }'>'DESC'</c:if>)">
										<!-- C-D -->E-D(天)<br>点击排序<c:if test='${C_D_SORT eq "DESC" }'>↓</c:if><c:if test='${C_D_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										审查核准时间(<!-- C -->E)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="E"
									onclick="doSort('B_C',<c:if test='${B_C_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${B_C_SORT eq "ASC" or B_C_SORT==null }'>'DESC'</c:if>)">
										<!-- B-C -->F-E(天)<br>点击排序<c:if test='${B_C_SORT eq "DESC" }'>↓</c:if><c:if test='${B_C_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										业管初审时间(<!-- B -->F)
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:80px;cursor:pointer;" id="F"
									onclick="doSort('A_B',<c:if test='${A_B_SORT eq "DESC" }'>'ASC'</c:if><c:if test='${A_B_SORT eq "ASC" or A_B_SORT==null }'>'DESC'</c:if>)">
										<!-- A-B -->G-F(天)<br>点击排序<c:if test='${A_B_SORT eq "DESC" }'>↓</c:if><c:if test='${A_B_SORT eq "ASC" }'>↑</c:if>
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										拨款时间(<!-- A -->G)
									</td>
								</tr>
								<c:forEach items="${resultList}" var="item" varStatus="status">
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${status.count }
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.leaseCode }&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.custName }&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.userName }&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.deptName }&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.a_g }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.creditCreateDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.f_g }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.visitDate }' pattern='yyyy-MM-dd'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.e_f }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.firstRiskDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.d_e }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.lastRiskDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.c_d }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.confirmDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.b_c }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.auditDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber pattern="##0.00" value="${item.a_b }"/>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													<fmt:formatDate value='${item.payDate }' pattern='yyyy-MM-dd HH:mm:ss'/>&nbsp;
												</td>
											</tr>
								</c:forEach>
						</table>
				</div>
				<font color="#FF0000">*</font>${DATE }&nbsp;20:00:00之数据
			</div>
	</form>
	<br>
	<font color="#FF0000">*</font>案件进度表不含委贷企金
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-45</p>
</body>
</html>