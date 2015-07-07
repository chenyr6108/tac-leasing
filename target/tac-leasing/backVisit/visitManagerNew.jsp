<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>回访信息</title>
		<script src="${ctx }/equipmentManager/js/equipmentManager.js" type="text/javascript"></script>
		<script type="text/javascript">
	    $(function (){
			$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
			$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
		});
			function showVisitReviewRecord(id,rectid){
				location.href='../servlet/defaultDispatcher?__action=backVisit.queryVisitReviewRecordByLeaseCodeNew&lease_code_List='+id+'&rect_id='+rectid;
			}

			function showViewVisitReviewRecord(id,cust_id){
				location.href='../servlet/defaultDispatcher?__action=backVisit.viewListVisitReviewRecordByLeaseCodeNew&cust_id='+cust_id;
			}

			function showEditVisitReviewRecord(id,rectid){
				location.href='../servlet/defaultDispatcher?__action=backVisit.editListVisitReviewRecordByLeaseCodeNew&lease_code_List='+id+'&rect_id='+rectid;
			}

 			function pdfFun(){
					  var chk_value =[];
					  $('input[name="lease_code_List"]:checked').each(function(){
					   chk_value.push($(this).val());
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择报告");
					  	return false;}	  
	  			$("#__action").val("visitViewToPdf.prePdf");
	  			$("#form1").submit();
	  			$("#__action").val("backVisit.queryAllBackVisitNew");
	  		}
	  		function pdfBackVisitRecord(){
	  			$("#__action").val("backVisitRecordPDF.expPDF") ;
	  			$("#form1").submit() ;
	  			$("#__action").val("backVisit.queryAllBackVisitNew") ;
	  			
	  		}
	  		
			function exportVisitReviewrecords(e){
				$(e).attr("disabled", "disabled");
				var QSTART_DATE = "";
				//QSTART_DATE= document.getElementById("datebegin").value;
				var QEND_DATE = "";
				//QEND_DATE= document.getElementById("dateend").value;
				var lease_code="";
				//lease_code= document.getElementById("lease_code").value;
				var visit_results="";
				visit_results= document.getElementById("visit_results").value;
				var STATECON="";
				STATECON== document.getElementById("STATECON").value;
				var s_employeeId="";
				s_employeeId=${s_employeeId };
				
				window.parent.callBirt("birtReport/visitReviewRecords/visitReviewRecords_11.rptdesign", "xls", {"start_date" : QSTART_DATE,"end_date" : QEND_DATE,"lease_code" : lease_code,"visit_results" : visit_results,"statecon" : STATECON,"s_employee_id" : s_employeeId});
				
				$(e).attr("disabled", false);
			}	  		
</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="backVisit.queryAllBackVisitNew" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;回访信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
					<div>
					<table width="900" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="600" class="ss_t"  valign="top">
						 <table style="margin-left: 10px;">
				          <tr>
				          <td>客户名称：</td>
				          <td><input type="text" name="cust_name" style="width:220px; height:18px;" id="cust_name" value="${cust_name }">
				          <!-- <td>
				          回访人员：</td>
				          <td><input type="text" name="" id="" style="width:100px; height:18px;">
							</td> -->
						<%-- <td>回访起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>结束日期：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
						</td>
						</tr>
						<tr>
						<td>
						合同号：
						</td>
						<td>
							<input type="text" name="lease_code" id="lease_code" style="width:80px; height:18px;" value="${lease_code }">
						</td>--%>
						</tr>
						<tr>
				          <td>回访结果：</td>
				         	<td><select name="visit_results" id="visit_results">
				         	<option value="">--请选择--</option>
							<option value="0" <c:if test="${visit_results eq '0' }">selected</c:if>>正常</option><option value="1" <c:if test="${visit_results eq '1' }">selected</c:if>>异常</option>
							<option value="2" <c:if test="${visit_results eq '2' }">selected</c:if>>已停业</option><option value="3" <c:if test="${visit_results eq '3' }">selected</c:if>>其他</option>
							</select></td>
				           <td>回访原因：</td>
				          <td colspan="3">
				          <select id="STATECON" name="STATECON">
				          	<option value="">--请选择--</option>
				          	<option value="-1" <c:if test="${STATECON eq '-1' }">selected</c:if>>逾期25天</option>
				          	<option value="0" <c:if test="${STATECON eq '0' }">selected</c:if>>异常提前回访</option>
				          	<option value="1" <c:if test="${STATECON eq '1' }">selected</c:if>>再访回访</option>
				          	<option value="2" <c:if test="${STATECON eq '2' }">selected</c:if>>正常回访</option>
				          	<option value="3" <c:if test="${STATECON eq '3' }">selected</c:if>>其他回访</option>
				          </select>
				          </td> 
				          </tr>
				          </table>
				       <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr >
						<td><input type="button" name="pdfbutton" onclick="pdfFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出回访记录"></td>
						<td><input type="button" name="pdfbutton" onclick="exportVisitReviewrecords(this);" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出回访管控表"></td>
						<td><!-- <input type="button" name="pdfbutton" onclick="pdfBackVisitRecord();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="回访记录表"> --></td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							&nbsp;
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							最近回访日
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							回访状态
						</th> 
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="CUST_NAME" pagingInfo="${dw}">客户名称</page:pagingSort>
						</th>
						<%-- <th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同号</page:pagingSort>
						</th > --%>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							经办人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							办事处主管
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort orderBy="DECP_NAME_CN" pagingInfo="${dw}">办事处</page:pagingSort>
						</th>
						<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
							供应商
						</th> -->
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<c:forEach items="${dw.resultList}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;"><c:if test="${not empty item.VISIT_DATE}"><input type="checkbox" value="${item.LEASE_CODE },${item.CUST_ID }"  name ="lease_code_List"  ></c:if><c:if test="${item.STATE eq 0 }"><input type="checkbox" value="${item.LEASE_CODE },${item.RECT_ID }"  name ="lease_code_List"  ></c:if><c:if test="${item.STATE eq 1 }"><input type="checkbox" value="${item.LEASE_CODE },${item.RECT_ID }"  name ="lease_code_List" disabled="disabled" ></c:if><c:if test="${item.STATE eq 2 }"><input type="checkbox" value="${item.LEASE_CODE },${item.RECT_ID }"  name ="lease_code_List" disabled="disabled" ></c:if><c:if test="${item.STATE eq 3 }"><input type="checkbox" value="${item.LEASE_CODE },${item.RECT_ID }"  name ="lease_code_List"  ></c:if><c:if test="${item.STATE eq 4 }"><input type="checkbox" value="${item.LEASE_CODE },${item.RECT_ID }"  name ="lease_code_List"  ></c:if> &nbsp;</td>
							<td style="text-align: center;">${status.count }</td>
							<td style="text-align: center;">${item.VISIT_DATE }&nbsp;</td>
							<td style="text-align: center;"><c:if test="${not empty item.VISIT_DATE}"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">已回访</a></c:if><c:if test="${item.STATE eq 0 }">已回访</c:if>&nbsp;</td>
							<td style="text-align: center;">${item.CUST_NAME }</td>
							<%-- <td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td> --%>
							<td style="text-align: center;">${item.USER_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.SUPER_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
							<%-- <td style="text-align: center;">${item.BRAND }&nbsp;</td> --%>
							<%--2011/12/9 Yang Yun Update processing menu(Delete "编辑") Start--%>
							<%--
							<td style="text-align: center;"><c:if test="${item.STATE eq 0 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">正常再回访</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">查看</a></c:if><c:if test="${item.STATE eq -1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">新建</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">查看</a></c:if><c:if test="${item.STATE eq 3 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">正常再回访</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">查看</a></c:if><c:if test="${item.STATE eq 4 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">新建</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">查看</a></c:if><c:if test="${item.STATE eq 1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">新建</a>| <font color="#c0c0c0">编辑</font>|<font color="#c0c0c0">查看</font></c:if><c:if test="${item.STATE eq 2 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECD_ID }');">新建</a>|<font color="#c0c0c0">编辑</font>|<font color="#c0c0c0">查看</font></c:if>&nbsp;</td>
							--%>
							<%-- 		
							<td style="text-align: center;"><c:if test="${item.STATE eq 0 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">正常再回访</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">查看</a></c:if><c:if test="${item.STATE eq -1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">新建</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">查看</a></c:if><c:if test="${item.STATE eq 3 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">正常再回访</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">查看</a></c:if><c:if test="${item.STATE eq 4 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">新建</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">查看</a></c:if><c:if test="${item.STATE eq 1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">新建</a>| <font color="#c0c0c0">查看</font></c:if><c:if test="${item.STATE eq 2 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${item.LEASE_CODE }','${item.RECT_ID }');">新建</a>|<font color="#c0c0c0">查看</font></c:if>&nbsp;</td>
							 --%>
							<%--2011/12/9 Yang Yun Update processing menu(Delete "编辑") End--%>
							
							<td style="text-align: center;"><c:if test="${not empty item.VISIT_DATE}"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('<%-- ${item.LEASE_CODE } --%>','${item.RECT_ID }');">再回访</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.CUST_ID }');">查看</a></c:if><c:if test="${empty item.VISIT_DATE }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('<%-- ${item.LEASE_CODE } --%>','${item.RECT_ID }');">新建</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${item.LEASE_CODE }','${item.CUST_ID }');">查看</a></c:if></td>
					</c:forEach>
				</table>
					<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>