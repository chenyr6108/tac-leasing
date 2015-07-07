<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>暂停、续开具发票确认</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>		

	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="settleManage.queryAllCkeckInvoiceSuspen" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;暂停续开发票确认</span>
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
				          <td>
				          	公司别：
				          	<select name="companyCode">
				          		<option value="">全部</option>
				          		<c:forEach items="${companys}" var="item">
				          			<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
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
									类别
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
							</tr>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;"><c:choose><c:when test="${item.INVOICE_STATUS eq 2 }"><img src="${ctx }/images/u617.gif" title="财务驳回"></c:when><c:when test="${item.INVOICE_STATUS eq 1 }"><img src="${ctx }/images/u620.gif" title="财务通过"></c:when><c:otherwise><img src="${ctx }/images/u608.gif" title="正常"></c:otherwise></c:choose></td>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }'">${item.RECP_CODE}</a></td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
							<td style="text-align:center"><c:if test="${item.INVOICE_TYPE eq 0 }">暂停发票开具</c:if><c:if test="${item.INVOICE_TYPE eq 1 }">续开发票</c:if>&nbsp;</td>							
							<td style="text-align: center;"><c:if test="${item.INVOICE_TYPE eq 0 }"><a href="../servlet/defaultDispatcher?__action=settleManage.queryInvoiceSuspenDetail&ID=${item.ID }">查看</a></c:if><c:if test="${item.INVOICE_TYPE eq 1 }"><a href="../servlet/defaultDispatcher?__action=settleManage.queryApplyInvoiceSuspenDetail&ID=${item.ID }">查看</a></c:if></td>	
							</tr>
							<td align="center" colspan="12">
								<div id="settleDetail${status.count }" align="center"
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
								<img src="${ctx }/images/u620.gif">&nbsp;财务通过&nbsp;&nbsp;
								<img src="${ctx }/images/u617.gif">&nbsp;财务驳回&nbsp;&nbsp;
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