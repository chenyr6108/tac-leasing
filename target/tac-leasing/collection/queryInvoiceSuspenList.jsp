<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>申请暂停开具发票</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>		
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
			});
			
		    function showInvoiceSuspen(recp_id){
		    	$("#RECP_ID1").val(recp_id);
		    	$("#invoiceSuspen").dialog({modal:true, autoOpen:false, width:500});
		    	$("#invoiceSuspen").dialog("open");
		    }
		    function showAppInvoiceSuspen(recp_id){
		    	$("#RECP_ID2").val(recp_id);
		    	$("#applyInvoiceSuspen").dialog({modal:true, autoOpen:false, width:500});
		    	$("#applyInvoiceSuspen").dialog("open");
		    }		
		    
		    function subInvoiceSuspen(){
		    	if($.trim($("#MEMO1").val()) == ""){
		    		alert("请输入原因。");
			    		return false;
		    	}
		    	$("#sumBut_r").attr("disabled", true);
		    	$("#invoiceForm").submit();
		    }	
		    function subApplyInvoiceSuspen(){
		    	if($.trim($("#MEMO2").val()) == ""){
		    		alert("请输入原因。");
			    		return false;
		    	}		    	
		    	$("#sumBut").attr("disabled", true);
		    	$("#applyInvoiceForm").submit();
		    }
		    
		    function showInvoiceSuspenDetail(recp_id){
		    	$("#settleDetail" + recp_id).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=settleManage.showInvoiceSuspen&RECP_ID=" + recp_id);
		        });
		    }		    
    	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="settleManage.queryAllRenList" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;暂停发票开具</span>
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
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
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
				<td>&nbsp;&nbsp;
				</td>
					<td align="right"><%@ include file="/common/pageControlTop.jsp"%></td>			
			</tr>
			
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									状态
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付表号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户经理
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									办事处主管
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									创建日期
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									起租日期
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
							</tr>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;cursor: pointer;"  onClick="showInvoiceSuspenDetail(${item.RECP_ID});"><c:if test="${item.RECP_STATUS eq 0 || item.RECP_STATUS eq 5}"><c:choose><c:when test="${item.STATE == 2 }"><img src="${ctx }/images/u617.gif" title="财务驳回"></c:when><c:when test="${item.STATE == 1 }"><img src="${ctx }/images/u620.gif" title="财务通过"></c:when><c:otherwise><img src="${ctx }/images/u608.gif" title="正常"></c:otherwise></c:choose></c:if><c:if test="${item.RECP_STATUS eq 1}"><img src="${ctx }/images/u622.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS eq 3}"><img src="${ctx }/images/u611.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS eq 4}"><img src="${ctx }/images/u614.gif" title="回购"></c:if></td>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a></td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.SENSORNAME }</td>
								<td style="text-align: center;">${item.CLERKNAME }</td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.CREATE_TIME }" /></td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.START_DATE }" /></td>
				
							<td style="text-align:center"><c:if test="${item.INVOICE_STATUS eq 0 }"><a href="javascript:void(0);" onclick="showInvoiceSuspen(${item.RECP_ID})">[暂停开发票]</a></c:if><c:if test="${item.INVOICE_STATUS eq 1 }"><a href="javascript:void(0);" onclick="showAppInvoiceSuspen(${item.RECP_ID})">[续开发票]</a></c:if>&nbsp;</td>							
							</tr>
							<td align="center" colspan="12">
									<div id="settleDetail${item.RECP_ID}" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
							</td>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td>&nbsp;</td>
								<td align="right" colspan="10"><%@ include file="/common/pageControl.jsp"%></td>
						   </tr> 
						<tr>
							<td align="right" colspan="11" style="height:24px; text-align:right;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;
								<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;
								<img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;
								<img src="${ctx }/images/u620.gif">&nbsp;财务通过&nbsp;&nbsp;
								<img src="${ctx }/images/u617.gif">&nbsp;财务驳回&nbsp;&nbsp;
								<img src="${ctx }/images/u614.gif">&nbsp;回购&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>
				</div>
			</div>
		</div>		
		</form>
		
<div style="display:none;" id="invoiceSuspen" title="请填写暂停开发票原因">
	<font color="red">${errorMsg }</font>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="../servlet/defaultDispatcher" id="invoiceForm" method="post" name="invoiceForm">
				<input type="hidden" id="__action" name="__action" value="settleManage.createInvoiceSuspen" />
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>暂停开发票原因：</strong><font color="red">*</font></td>
						<td>
						<input type="hidden" id="RECP_ID1" name="RECP_ID"/>
							<textarea id="MEMO1" name="MEMO" rows="8" cols="55" style="border: 1px solid #A6C9E2;"></textarea>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut" value="确&nbsp;定" onclick="subInvoiceSuspen()" class="ui-state-default ui-corner-all" >
							<input type="button" value="关&nbsp;闭" onclick="$('#invoiceSuspen').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<c:if test="${errorMsg != null }">
<script type="text/javascript">
	$("#invoiceSuspen").dialog({modal:true, autoOpen:false, width:500});
	$("#invoiceSuspen").dialog("open");
</script>
</c:if>		

<div style="display:none;" id="applyInvoiceSuspen" title="请填写续开发票原因">
	<font color="red">${errorMsg }</font>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="../servlet/defaultDispatcher" id="applyInvoiceForm" method="post" name="applyInvoiceForm">
				<input type="hidden" id="__action" name="__action" value="settleManage.createApplyInvoiceSuspen" />
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>续开发票原因：</strong><font color="red">*</font></td>
						<td>
						<input type="hidden" id="RECP_ID2" name="RECP_ID"/>
							<textarea id="MEMO2" name="MEMO" rows="8" cols="55" style="border: 1px solid #A6C9E2;"></textarea>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
							<input type="button" id="sumBut" value="确&nbsp;定" onclick="subApplyInvoiceSuspen()" class="ui-state-default ui-corner-all" >
							<input type="button" value="关&nbsp;闭" onclick="$('#applyInvoiceSuspen').dialog('close');" class="ui-state-default ui-corner-all">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<c:if test="${errorMsg != null }">
<script type="text/javascript">
	$("#applyInvoiceSuspen").dialog({modal:true, autoOpen:false, width:500});
	$("#applyInvoiceSuspen").dialog("open");
</script>
</c:if>		
	</body>
</html>