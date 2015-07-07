<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>结清确认</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>		
		 <script type="text/javascript">
		    $(function (){
				$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
				$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
			});
			
			//弹出备注的层
					function openChangePassDiv(divName){
						$("#"+divName).dialog({
							modal:true,
							autoOpen: false,
							width: 670
						});
						$("#"+divName).dialog('open');
					}
					function closeDialog(msg){
						$("#"+msg).dialog('close');
					}
					
					function expSettleTransferProvePDF(){
						  var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择结清单！");
						  	return false;
						  	}			
						$("#__action").val("settleManage.SettleTransferProvePDF");
						$("#form1").submit();
						$("#__action").val("settleManage.queryCheckSettleList");
					}	
					/*			
					function expExpcel(){
						  var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择结清单！");
						  	return false;
						  	}			
						$("#__action").val("settleManage.expExpcel");
						$("#form1").submit();
						$("#__action").val("settleManage.queryCheckSettleList");
					}				
					*/
					//结清数据明细
				function exSettleDetail(id,recp_id,type){
				    if (type == 'manage') {
				        $("#" + id).toggle(function(){
				            $(this).load("../servlet/defaultDispatcher?__action=settleManage.querySettleDetail&recp_id=" + recp_id);
				        });
				    }
				}
				function expCustStatementPDF(){
						var chk_value =[];   
						  $('input[name="ids"]:checked').each(function(){   
						   chk_value.push($(this).val());   
						  });   
						  if(chk_value.length==0){
						  	alert("你还没有选择结清单！");
						  	return false;
						  }	
						  $("#__action").val("statement.expCustStatementPDF");
						  $("#form1").submit();
						  $("#__action").val("settleManage.queryCheckSettleList");
					}				
    	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="settleManage.queryCheckSettleList" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;结清确认</span>
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
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								财务已通过
							</option>
							<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								财务驳回
							</option>
							</select>
					</td>				
				          </tr>	
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
			<td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出移转证明书" name="But" onclick="expSettleTransferProvePDF();"></td>
			<td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出客户对账单(PDF)" name="But" onclick="expCustStatementPDF();"></td>
			<!-- <td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出结清明细表(Exl)" name="But" onclick="expExpcel();"></td> -->
					<td align="right"><%@ include file="/common/pageControlTop.jsp"%></td>			
			</tr>
			
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head" >
								&nbsp;
								</th>	
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
									本金
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									利息
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									违约金
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									损害金
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									期满购买金
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
							</tr>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><INPUT TYPE="checkbox" NAME="ids" id="ids" value="${item.RECP_ID}" onclick="checkItem(this,'all')" <c:if test="${item.STATE != 1}">disabled="disabled"</c:if>></td>
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;cursor: pointer;"  onClick="exSettleDetail('settleDetail${status.count}','${item.RECP_ID}','manage');">&nbsp;<c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="正常"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u617.gif" title="财务驳回"></c:if><c:if test="${item.STATE == 1}"><c:if test="${item.RECP_STATUS eq 1}"><img src="${ctx }/images/u611.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS eq 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS != 1 &&  item.RECP_STATUS != 3}"><img src="${ctx }/images/u622.gif" title="财务已通过"></c:if></c:if></td>
								<td style="text-align: center;"><!-- <a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'"> -->${item.RECP_CODE}</td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.OWN_PRICE }" /></td>
								<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.REN_PRICE }" /></td>
								<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.BREACH_PRICE }" /></td>
								<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.DAMAGE_PRICE}" /></td>
								<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.STAYBUY_PRICE}"  /></td>
								<td style="text-align: center"><a href="${ctx }/servlet/defaultDispatcher?__action=settleManage.showCheckSettle&trse_id=${item.TRSE_ID }" >查看</a></td>
							</tr>
							<td align="center" colspan="11">
									<div id="settleDetail${status.count }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<!-- <tr>
							<td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出支付表" name="But" onclick="expPayToPdf();">
							<input type="button" class="ui-state-default ui-corner-all" id="But2" value="导出租赁物详细表" name="But2" onclick="expZulwToPdf();">
							<input type="button" class="ui-state-default ui-corner-all" id="But" value="未实现融资收益分配表(EXCEL)" name="But" onclick="expRZSYToExcel();">
							</td>-->
							<tr>
								<td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出移转证明书" name="But" onclick="expSettleTransferProvePDF();"></td>
								<td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出客户对账单(PDF)" name="But" onclick="expCustStatementPDF();"></td>
								<!-- <td><input type="button" class="ui-state-default ui-corner-all" id="But" value="导出结清明细表(Exl)" name="But" onclick="expExpcel();"></td> -->
								<td align="right" colspan="10"><%@ include file="/common/pageControl.jsp"%></td>
						</tr> 
						<tr>
							<td align="right" colspan="11" style="height:24px; text-align:right;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;<img src="${ctx }/images/u622.gif">&nbsp;财务已通过&nbsp;&nbsp;<img src="${ctx }/images/u617.gif">&nbsp;财务已驳回&nbsp;&nbsp;<img src="${ctx }/images/u611.gif">&nbsp;正常结清&nbsp;&nbsp;<img src="${ctx }/images/u614.gif">&nbsp;提前结清&nbsp;
							</td>
						</tr>
					</table>
				</div>
				</div>
			</div>
		</div>		
		</form>
	</body>
</html>