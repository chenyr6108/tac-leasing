<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>本金收据列印</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>	
		 <script type="text/javascript">
		 $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQSTART_DATE").datepicker($.datepicker.regional["zh-CN"]);
				$("#JQEND_DATE").datepicker($.datepicker.regional["zh-CN"]);
				$("#startDate").datepicker($.datepicker.regional['zh-CN']);
			});
		 
		 //批量打印
		 function rentReceiptToPdf(){
			  $("#But").attr('disabled',true);
			  $("#But1").attr('disabled',true);
			  var chk_value =[];   
			  $('input[name="ids"]:checked').each(function(){   
			   chk_value.push($(this).val()); 
			   var id =$(this).val();
			   $("#"+id).attr('disabled',true);
			   $("#"+id).val('已打印');
			   /* $("#ids"+id).attr('disabled','disabled'); */
			  });   
			  if(chk_value.length==0){
			  	alert("你还没有选择收据！");
			  	return false;
			  	}
			$("#__action").val("rentReceiptToPdf.receiptToPdf");
			$("#form1").submit();
			$("#__action").val("rentReceipt.queryRentReceiptList");
		}
		 //单次打印
		 function rentReceiptOne(rId){
			  $("#But").attr('disabled',true);
			  $("#But1").attr('disabled',true);
			  $("#"+rId).attr('disabled',true);
			  $("#"+rId).val('已打印');
			  $("#ids"+rId).attr('checked',true);
			  $("#__action").val("rentReceiptToPdf.receiptToPdf");
			  $("#form1").submit();
			  $("#__action").val("rentReceipt.queryRentReceiptList");
		 }
		 //查看日志
		 function viewLog(){
			 location.href="../servlet/defaultDispatcher?__action=rentReceipt.viewLog";
		 }
		  
			function updateDateMonth(){
				var date = $("#startDate").val() ;
				$("#startDate").val(date.toString().substring(0,7)) ;
			}
			
		function expToExcel(){
			  $("#__action").val("rentReceipt.queryRentReceiptListToExcel");
			  $("#form1").submit();
			  $("#__action").val("rentReceipt.queryRentReceiptList");
		}	
		 </script>
</head>
<body>

		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="rentReceipt.queryRentReceiptList" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;本金收据列印</span>
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
				              <td> <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }"> </td>
				              <td>结束日期：</td>
				              <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }"></td>
							  <td> 状态： </td>
							<td>
							<select name="QSELECT_STATUS" style=" height: 18px;">
									<option value="" <c:if test="${QSELECT_STATUS eq ''}">selected='selected'</c:if>> 请选择 </option>
									<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>> 已打印 </option>
									<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>> 未打印 </option>
							</select>
							</td>
 							<td>拨款月份： <input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:100px; height:18px;"> </td>
				              <td>类型：
								<select name="OLDNEW_STATUS" style=" height: 18px;">
										<option value="" <c:if test="${OLDNEW_STATUS eq ''}">selected='selected'</c:if>> 请选择 </option>
										<option value="0" <c:if test="${OLDNEW_STATUS eq 0}">selected='selected'</c:if>> 旧案 </option>
										<option value="1" <c:if test="${OLDNEW_STATUS eq 1}">selected='selected'</c:if>> 新案 </option>
								</select>
								</td>
				     	 </tr>
				          <tr>
					          <td>查询内容：</td>
					          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
					          style=" width:395px;height:18px; font-size: 12px;">
					          </td>
					          <td>是否开票：
					          <select name="ISINVOICE" style=" height: 18px;">
										<option value="" <c:if test="${ISINVOICE eq ''}">selected='selected'</c:if>> 请选择 </option>
										<option value="0" <c:if test="${ISINVOICE eq 0}">selected='selected'</c:if>> 未开票 </option>
										<option value="1" <c:if test="${ISINVOICE eq 1}">selected='selected'</c:if>> 已开票 </option>
								</select>
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
					<td>
						<input type="button" class="ui-state-default ui-corner-all" id="But" value="批量打印(PDF)" name="But" onclick="rentReceiptToPdf();">
					</td>
					<td>
						<input type="button" class="ui-state-default ui-corner-all" id="But" value="查看打印记录" name="Log" onclick="viewLog();">
					</td>
					<td>
						<input type="button" class="ui-state-default ui-corner-all" id="But" value="导出Excel" name="excel" onclick="expToExcel();">
					</td>
					<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
			</tr>
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head" >
									<INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');">
								</th>
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>							
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									合同编号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									还款期数
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									收据金额
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									发票编号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="PRINCIPALRUNCODE" pagingInfo="${dw}">本金收据编号</page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									原本金收据编号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="CREATEDATE" pagingInfo="${dw}">生成日期</page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									打印状态
								</th>
							</tr>
						<c:forEach items="${dw.resultList}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
							    <td style="text-align: center;"><c:if test="${!item.ISPRINT}"><INPUT TYPE="checkbox" NAME="ids" id="ids${item.PRINCIPALRUNCODE}" value="${item.PRINCIPALRUNCODE}"></c:if><c:if test="${item.ISPRINT}"><INPUT TYPE="checkbox"  value="" disabled="disabled"></c:if></td>
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;">${item.CUSTNAME }</td>	
								<td style="text-align: center;">${item.LEASECODE }</td>	
								<td style="text-align: center;">${item.RECDPERIOD }</td>
								<td style="text-align: center;">${item.REALOWNPRICE }</td>	
								<td style="text-align: center;">${item.INVOICE_CODE }&nbsp;</td>	
								<td style="text-align: center;">${item.PRINCIPALRUNCODE }&nbsp;</td>
								<td style="text-align: center;">${item.ORIPRINCIPALRUNCODE}&nbsp;</td>	
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.CREATEDATE }" />&nbsp;</td>
								<td style="text-align: center;"><c:if test="${!item.ISPRINT}"><input type="button" value="导出打印" id="${item.PRINCIPALRUNCODE}" onclick="rentReceiptOne('${item.PRINCIPALRUNCODE}');"/></c:if><c:if test="${item.ISPRINT}"><input type="button" value="已打印" onclick="" disabled="disabled"/></c:if></td>
							</tr>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td><input type="button" class="ui-state-default ui-corner-all" id="But1" value="批量打印(PDF)" name="But1" onclick="rentReceiptToPdf();">
							<td align="right" colspan="10"><page:pagingToolbar pagingInfo="${dw }"/></td>
						</tr>
					</table>
					<!--  备注弹出层  结束  -->
				</div>
				</div>
			</div>
		</div>		
		</form>
	
</body>
</html>