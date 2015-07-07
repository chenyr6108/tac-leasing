<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>业管收件文审</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			function receptionRentFile(credit_id,dispatch_id,ID,CONTRACT_TYPE){
				var divName="receptionRentFile";
				$("#CREDIT_ID").val(credit_id);
				$("#DISPATCH_USER_ID").val(dispatch_id);
				$("#CONTRACT_TYPE").val(CONTRACT_TYPE);
				$("#ID").val(ID);
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 500
				});
				$("#"+divName).dialog('open');
			}
			function confirmReception(){
/* 				if($("#DISPATCH_USER_ID").val()==""){
					alert("请分派文审人员");
					return false;
				} 
				$("#DISPATCH_USER").val($.trim($("#DISPATCH_USER_ID").find("option:selected").text()));
				*/
			    $("#receptionRentFileForm").submit();
			}
			
			function rejectRentFile(credit_id,ID){
				if (!confirm("确认退件？")) {
					return false;
				}
				location.href = '${ctx }/servlet/defaultDispatcher?__action=rentContract.rejectRentFile&CREDIT_ID='+credit_id+'&ID='
				+ ID;
			}
			
			function examRentFile(credit_id,ID,CONTRACT_TYPE){
			    $("#rentfile").toggle(function(){
			        $("#rentfile").load("../servlet/defaultDispatcher?__action=backMoney.examRentFileForHW&saveFlag=true&CONTRACT_TYPE="+CONTRACT_TYPE+"&FSS_ID="+ID+"&CREDIT_ID=" + credit_id );
			        
					$("#rentfile").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 940
					    });
					    $("#rentfile").dialog('open');        
			    });
			}
			function examRentFileForShow(credit_id,ID,CONTRACT_TYPE){
			    $("#rentfile").toggle(function(){
			        $("#rentfile").load("../servlet/defaultDispatcher?__action=backMoney.examRentFileForHW&saveFlag=false&CONTRACT_TYPE="+CONTRACT_TYPE+"&FSS_ID="+ID+"&CREDIT_ID=" + credit_id );
			        
					$("#rentfile").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 940
					    });
					    $("#rentfile").dialog('open');        
			    });
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentFileSenderFollow" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管收件文审</span>
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
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-2" <c:if test="${QSELECT_STATUS eq -2}">selected='selected'</c:if>>
								全部
							</option>
							<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								单位主管通过
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								提交单位主管
							</option>
							<option value="3" <c:if test="${QSELECT_STATUS eq 3}">selected='selected'</c:if>>
								单位主管驳回
							</option>
							<option value="4" <c:if test="${QSELECT_STATUS eq 4}">selected='selected'</c:if>>
								业管收件
							</option>
							<option value="5" <c:if test="${QSELECT_STATUS eq 5}">selected='selected'</c:if>>
								业管退件
							</option>
							<option value="6" <c:if test="${QSELECT_STATUS eq 6}">selected='selected'</c:if>>
								业管主管驳回
							</option>
							<option value="7" <c:if test="${QSELECT_STATUS eq 7}">selected='selected'</c:if>>
								财务驳回
							</option>	
							<option value="8" <c:if test="${QSELECT_STATUS eq 8}">selected='selected'</c:if>>
								总经理驳回
							</option>
							<option value="9" <c:if test="${QSELECT_STATUS eq 9}">selected='selected'</c:if>>
								业管初审
							</option>																				
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								业管过案
							</option>														
							</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
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
						<tr>
							<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										送件状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务经办
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务行政
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="MODIFY_TIME" pagingInfo="${dw}">提交单位主管时间</page:pagingSort>
									</th>										
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="SALES_MANAGE_TIME" pagingInfo="${dw}">单位主管确认时间</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="DISPATCH_NAME" pagingInfo="${dw}">分派文审</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="HW_TIME" pagingInfo="${dw}">业管收件时间</page:pagingSort>
									</th>	
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="HW_AUDIT_TIME" pagingInfo="${dw}">业管初审时间</page:pagingSort>
									</th>																										
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><a href="#" onclick="examRentFileForShow('${item.CREDIT_ID }','${item.ID }','${item.CONTRACT_TYPE }');"><c:if test="${item.STATE eq 9 and empty item.RECT_ID}">业管初审</c:if><c:if test="${item.STATE eq 8}">总经理驳回</c:if><c:if test="${item.STATE eq 7}">财务驳回</c:if><c:if test="${item.STATE eq 6}">业管主管驳回</c:if><c:if test="${item.STATE eq 9 and not empty item.RECT_ID }">已过案</c:if><c:if test="${item.STATE eq 1}">提交单位主管</c:if><c:if test="${item.STATE eq 2}">单位主管通过</c:if><c:if test="${item.STATE eq 3}">单位主管驳回</c:if><c:if test="${item.STATE eq 4}">业管收件</c:if><c:if test="${item.STATE eq 5}">业管退件</c:if></a></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.ASSISTANT_NAME }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.MODIFY_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.SALES_MANAGE_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;">${item.DISPATCH_NAME }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.HW_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.HW_AUDIT_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td style="text-align: center;">
											<c:if test="${item.STATE eq 4  and hwReception }"><a href="javascript:void(0)" onclick="examRentFile('${item.CREDIT_ID }','${item.ID }','${item.CONTRACT_TYPE }');">初审</a></c:if>
											<c:if test="${item.STATE eq 2 and hwReception }"><a href="javascript:void(0)" onclick="receptionRentFile('${item.CREDIT_ID }','${item.DISPATCH_USER_ID }','${item.ID }','${item.CONTRACT_TYPE }');">业管收件</a></c:if>&nbsp;&nbsp;
											<c:if test="${ item.STATE eq 4 and empty item.RECT_ID and hwReject}"><a href="javascript:void(0)" onclick="rejectRentFile('${item.CREDIT_ID }','${item.ID }');">业管退件</a></c:if>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="11" align="center">
											<div id="pactAffix${item.PRCD_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
			<div title="业管收件分案" style="display: none" id="receptionRentFile" >
		<form id="receptionRentFileForm"  name="receptionRentFileForm" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=rentContract.receptionRentFile">
			<input type="hidden" id ="CREDIT_ID" name="CREDIT_ID"/>
			<!--  <input type="hidden" id="DISPATCH_USER" name="DISPATCH_USER"/> -->
			<input type="hidden" id="ID" name="ID"/>
			<input type="hidden" id="CONTRACT_TYPE" name="CONTRACT_TYPE"/>
			
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<%-- 					<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">分派文审人员</td>
								<td style="text-align:center"  width="10%">
									<select name="DISPATCH_USER_ID" id="DISPATCH_USER_ID">
										<option value=""></option>
										<c:forEach items="${dispatch_user}" var="item" varStatus="status">
											<option value="${item.ID }">${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr> --%>
							<tr> 
								<td style="text-align:center"  width="4%" colspan="2">&nbsp;</td>
							</tr>						
							<tr> 
								<td style="text-align:center"  width="4%" colspan="2"><input class="ui-state-default ui-corner-all" type="button" value="确认收件" onclick="confirmReception();" style="cursor: pointer;"/></td>
							</tr>
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

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 940px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
	</body>
</html>