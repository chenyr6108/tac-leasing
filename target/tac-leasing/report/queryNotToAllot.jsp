<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("report.expNotToAllotToExcel");
		  $("#form1").submit();
		  $("#__action").val("report.queryNotToAllot");
		}	
		
		$(function (){
			$("#date").datepicker($.datepicker.regional['zh-CN']);
		});	
		
	 	function delayPay(param1,param2) {
	 		
	 		if(confirm("确认缓拨?")) {
	 			$("#CREDIT_ID").val(param1);
		 		$("#LEASE_CODE").val(param2);
		 		$("#__action").val("report.delayPay");
		 		$("#form1").submit();
	 		}
	 	}
	 	
	 	function enablePay(param1,param2) {
	 		
	 		$("#CREDIT_ID").val(param1);
	 		$("#LEASE_CODE").val(param2);
	 		$("#__action").val("report.enablePay");
	 		$("#form1").submit();
	 	}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="report.queryNotToAllot">
			<input type="hidden" name="CREDIT_ID" id="CREDIT_ID">
			<input type="hidden" name="LEASE_CODE" id="LEASE_CODE">
			<input type="hidden" name="date" id="date" value="${date }">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;已核准未拨款</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           		<div style="margin: 6 0 6 0px;">
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
						          <tr>
							          <td>办事处：</td>
							          <td colspan="5">
							          		<select id="OFFICE" name="OFFICE" style="width: 100px">
												<option value="">--请选择--</option>
												<c:forEach items="${companys}" var="company" varStatus="status">
												    <option value="${company.DECP_ID}" <c:if test="${company.DECP_ID eq OFFICE}">selected='selected'</c:if>>${company.DECP_NAME_CN}</option>
												</c:forEach>
										   </select>
							          		&nbsp;经办人：<input type="text" id="NAME" name="NAME" value="${NAME }" style="width:100px;height:20px;">
							          		&nbsp;查询内容：<input type="text" id="content" name="content" value="${content }" style="width:150px; height:20px;">
							          </td>
						          </tr>
						          <tr>
							          <td>过期状态：</td>
							          <td><select name="validateStatus" style="width:100px; height:20px;">
							          	<option value="A">全部</option>
							          	<option value="Y" <c:if test="${validateStatus eq 'Y'}">selected='selected'</c:if>>已过期</option>
							          	<option value="N" <c:if test="${validateStatus eq 'N'}">selected='selected'</c:if>>未过期</option>
							          </select>
							          &nbsp;缓拨状态：
							          &nbsp;<select name="delayStatus" style="width:100px; height:20px;">
							          	<option value="A">全部</option>
							          	<option value="Y" <c:if test="${delayStatus eq 'Y'}">selected='selected'</c:if>>缓拨</option>
							          	<option value="N" <c:if test="${delayStatus eq 'N'}">selected='selected'</c:if>>未缓拨</option>
							          </select>
							          &nbsp;案件类别：
							          &nbsp;<select name="vip_flag" style="width:100px; height:20px;">
							          	<option value="">全部</option>
							          	<option value="0" <c:if test="${vip_flag eq '0'}">selected='selected'</c:if>>一般</option>
							          	<option value="1" <c:if test="${vip_flag eq '1'}">selected='selected'</c:if>>绿色通道</option>
							          </select>
							          &nbsp;公司别：
									<select name="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys1}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected='selected'</c:if>>${item.name}</option>
										</c:forEach>
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
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE"><strong>合同编号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME"><strong>客户名称</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="NAME"><strong>经办人</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="SUPERNAME"><strong>主管</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="WIND_RESULT_DATE"><strong>核准日期(a)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="EFFECTDATE"><strong>有效期(b)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="VALID_DAY"><strong>有效天数(c=b-a)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort pagingInfo="${dw }" orderBy="AMOUNT"><strong>金额</strong></page:pagingSort>
					</th>
					<c:if test="${delayPay==true }">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作</strong>
					</th>
					</c:if>
				</tr>
				<c:forEach items="${dw.resultList}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>					
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>	
						<td style="text-align: center;">${item.BRAND }&nbsp;</td>	
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SUPERNAME }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.WIND_RESULT_DATE }" pattern="yyyy-MM-dd" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.EFFECTDATE }" pattern="yyyy-MM-dd" />&nbsp;</td>
						<td style="text-align: center;">${item.VALID_DAY }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.AMOUNT }" />&nbsp;</td>
						<c:if test="${delayPay==true }">
						<td style="text-align: center;"><c:if test="${item.DAILY_DAY <= item.VALID_DAY }"><c:choose><c:when test="${item.DELAY_PAY_STATUS!=-1 }"><a href="javaScript:void(0);" onclick="delayPay('${item.CREDIT_ID }','${item.LEASE_CODE }')">缓拨</a></c:when><c:otherwise><a href="javaScript:void(0);" onclick="enablePay('${item.CREDIT_ID }','${item.LEASE_CODE }')">启用</a></c:otherwise></c:choose></c:if>&nbsp;</td>
						</c:if>
					</tr>
				</c:forEach>
				    <tr class="ui-widget-content jqgrow ui-row-ltr">
				    <th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						总数:&nbsp;${totalCount }
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						总金额:&nbsp;<fmt:formatNumber type="currency" value="${totalAmount }"/>
					</th>
				    </tr>
			</table>
			<input type="hidden" id="totalCount" name="totalCount" value="${totalCount }"><input type="hidden" id="totalAmount" name="totalAmount" value="${totalAmount }">
			<input type="hidden" id="totalAmountForExcel" name="totalAmountForExcel" value="<fmt:formatNumber type="currency" value="${totalAmount}"/>">
			<page:pagingToolbar pagingInfo="${dw }"/>			
			</div>
				</div>
			</div>		
		</form>
		
			<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-39</p>
	<script>
	$(function () {
			var d=new Date();
		    var sec=d.getSeconds();
		    var min=d.getMinutes();
		    var hour=d.getHours();
		    if(sec<10) {
		    	sec="0"+sec;
		    }
		    if(min<10) {
		    	min="0"+min;
		    }
		    if(hour<10) {
		    	hour="0"+hour;
		    }
		    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
		});
	</script>
	</body>
</html>