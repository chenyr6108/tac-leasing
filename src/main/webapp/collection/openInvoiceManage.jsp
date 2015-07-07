<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>发票开具</title>
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);	
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);	
				$("input[name^='yudate']").datepicker($.datepicker.regional['zh-CN']);	
			});	
			function expPayToExcel(id,id2,id3,companyCode) {
						location.href='../servlet/defaultDispatcher?__action=openInvoice.openInvoice&QSTART_DATE='+id+'&QEND_DATE='+id2+'&USERID='+id3+'&companyCode='+companyCode;
			}	
			function expInvoiceToExcel() {
					  var chk_value =[];   
					  $('input[name="ids"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择支付表！");
					  	return false;}
						$("#__action").val("openInvoice.openInvoiceForPart");					  				
						$("#form1").submit();
						$("#__action").val("openInvoice.queryOpenInvoice");
			}		
		function updateYuDate(obj,id) {
				var yud = $(obj).val();	
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=openInvoice.updateYuDate&yud='+yud+'&recd_id='+id,
					dataType:'json',
					async: false,
					success: function(dataBack){
					
					},
					error:function(callback){
						alert("error!");
						return;
					}
				});
		}
		
		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		function checkItem(e, allName)
		{
		  var all = document.getElementsByName(allName)[0];
		  if(!e.checked) all.checked = false;
		  else
		  {
		    var aa = document.getElementsByName(e.name);
		    for (var i=0; i<aa.length; i++)
		     if(!aa[i].checked) return;
		    all.checked = true;
		  }
		}												
    	</script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="openInvoice.queryOpenInvoice" />
			<table width="1500"><tr><td>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;发票开具</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
			<table width="70%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起日从：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>起日到：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }"></td>
							<td>
							类型：
							</td>
							<td>
									<c:set var="type1" value=""></c:set>
									<c:set var="type2" value=""></c:set>
									<c:if test="${isopen eq 1}">
									<c:set var="type1" value="selected='selected'"></c:set>
									</c:if>
									<c:if test="${isopen eq 2}">
									<c:set var="type2" value="selected='selected'"></c:set>
									</c:if>
									<select name="isopen" style="border: #03515d solid 1px;">
										<option value="1" ${type1}>
										未开发票
										</option>
										<option value="2" ${type2}>
										已开发票
										</option>
									</select>
							</td>
							<td>公司别：
								<select name="companyCode">
									<option value="" >全部</option>
									<c:forEach items="${companys }" var="item">
										<option value="${item.code}"  <c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
									</c:forEach>						
								</select>
							</td>								
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="6"><input type="text" name="content" value="${content}" style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>				          
				          </table>          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
			 </table>
					</div>	
					<div class="ui-state-default ui-jqgrid-hdiv ">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
								<tr>
								<c:if test="${isopen eq 1}">
									<td>
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}','');">
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具(裕融)" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}',1);">
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具(裕国)" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}',2);">
									<input type="button" class="ui-state-default ui-corner-all" id="Butt" value="导出部分发票开具" name="Butt" onclick="expInvoiceToExcel();"></td>
								</c:if>		
									<td align="right"><%@ include file="/common/pageControlTop.jsp"%></td>			
								</tr>
							</table>		
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 100%">
							<tr class="ui-jqgrid-labels">
								<c:if test="${isopen eq 1}">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');">
								</th>	
								</c:if>																
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									税编
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户编号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付表编号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付方式
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									期次
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									起日
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									迄日
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									应付日期
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									应付租金
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									预开日期
								</th>	
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									利息
								</th>
								<c:if test="${isopen eq 2}">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									发票时间
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									发票编号
								</th>	
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									开票人
								</th>
								</c:if>																							
							</tr>					
						<c:forEach items="${dw.rs}" var="item" varStatus="status">  	
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<c:if test="${isopen eq 1}">
								<td style="text-align: center;"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.RECD_ID}" onclick="checkItem(this,'all')"></td>	
								</c:if>											
								<td style="text-align: center;">${item.RECD_ID}&nbsp;</td>		
								<td style="text-align: center;">${item.CORP_TAX_CODE}&nbsp;</td>
								<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
								<td style="text-align: center;">${item.CUST_CODE }&nbsp;</td>
								<td style="text-align: center;">${item.RECP_CODE}&nbsp;</td>
								<td style="text-align: center;"><c:if test="${item.PAY_WAY eq 11}">期初等额本息支付</c:if><c:if test="${item.PAY_WAY eq 12}">期初等额本金支付</c:if><c:if test="${item.PAY_WAY eq 13}">期初不等额支付</c:if><c:if test="${item.PAY_WAY eq 21}">期末等额本息支付</c:if><c:if test="${item.PAY_WAY eq 22}">期末等额本金支付</c:if><c:if test="${item.PAY_WAY eq 23}">期末不等额支付</c:if>&nbsp;</td>	
								<td style="text-align: center;">${item.PERIOD_NUM}/${item.LEASE_PERIOD }</td>					
								<!-- <td style="text-align: center;"><c:choose><c:when test="${item.PAY_WAY le 20}">${item.QI}</c:when><c:otherwise>${item.ZHI}</c:otherwise></c:choose></td> -->
								<td style="text-align: center;">${item.QI_DATE}</td>
								<!--<td style="text-align: center;">${item.ZHI}</td>	  -->					
								<td style="text-align: center;">${item.QIQI_DATE}</td>				
								<td style="text-align: center;">${item.PAY_DATE}</td>
								<td style="text-align: right"><fmt:formatNumber type="currency" value="${item.IRR_MONTH_PRICE}"/>&nbsp;</td>
								<td style="text-align: center;"><input type="text" name="yudate" style=" width: 80px; height: 18px;"  onchange="updateYuDate(this,'${item.RECD_ID}');" readonly="readonly" value="<c:choose><c:when test="${item.RESERVE_TIME eq null}">${item.YU}</c:when><c:otherwise>${item.RESERVE_TIME}</c:otherwise></c:choose>"></td>							
								<td style="text-align: right;center"><fmt:formatNumber type="currency" value="${item.REN_PRICE}"/>&nbsp;</td>
								<c:if test="${isopen eq 2}">
								<td style="text-align: center;"><fmt:formatDate value="${item.OPEN_TIME}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;">${item.INVOICE_CODE }&nbsp;</td>
								<td style="text-align: center;">${item.OPEN_USER}&nbsp;</td>
								</c:if>																
							</tr>
						</c:forEach>				
						</table>	
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
								<tr>
								<c:if test="${isopen eq 1}">
									<td>
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}');">
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具(裕融)" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}',1);">
									<input type="button" class="ui-state-default ui-corner-all" id="But" value="全部导出发票开具(裕国)" name="But" onclick="expPayToExcel('${QSTART_DATE }','${QEND_DATE }','${s_employeeId}',2);">
									<input type="button" class="ui-state-default ui-corner-all" id="Butt" value="导出部分发票开具" name="Butt" onclick="expInvoiceToExcel();"></td>
								</c:if>		
									<td align="right"><%@ include file="/common/pageControl.jsp"%></td>			
								</tr>
							</table>	
							</div>		
				</div>
			</div>				
			</td></tr></table>
		</form>
	</body>
</html>