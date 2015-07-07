<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>修改设备放置地</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function expandEqmtAddrForShow(id,LEASE_CODE, type){
				
			    if (type == 'manage') {
			        $("#" + id).toggle(function(){
			            $(this).load("../servlet/defaultDispatcher?__action=rentContract.showEqmtAddrForMDF&LEASE_CODE=" + LEASE_CODE );
			        });
			    }
			    else 
			        if (type == 'affix') {
			            $("#" + id).toggle(function(){
			                $(this).load(ctx + URL);
			            });
			        }
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentForMDFEqmtAddress" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改设备放置地</span>
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
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-2" <c:if test="${QSELECT_STATUS eq -2}">selected='selected'</c:if>>
								全部
							</option>
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								未初审
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								已初审
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								已复核
							</option>
							<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								复核驳回
							</option>
							</select>
					</td>
					<td>
					合同类型：
					</td>
					<td>
					<select name="RENTSTAUTS" style=" height: 18px;">
							<option value="-3" <c:if test="${RENTSTAUTS eq -3}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${RENTSTAUTS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="-1" <c:if test="${RENTSTAUTS eq -1}">selected='selected'</c:if>>
								作废
							</option>
							</select>
					</td>
					<td>
					结清状态：
					</td>
					<td>
					<select name="RECP_STATUS" style=" height: 18px;">
							<option value="">
								全部
							</option>
							<option value="1" <c:if test="${RECP_STATUS eq 1}">selected='selected'</c:if>>
								正常结清
							</option>
							<option value="3" <c:if test="${RECP_STATUS eq 3}">selected='selected'</c:if>>
								提前结清
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
						<tr >
						<td> 
						</td>
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										案件号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										合同编号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;" onClick="expandEqmtAddrForShow('pactAffix${item.PRCD_ID}','${item.LEASE_CODE}','manage');" style="cursor: pointer;"><!-- 	[${item.PRCD_STATUS }|${item.RECT_STATUS }] --><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}"><img src="${ctx }/images/u604.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS == 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="10" align="center">
											<div id="pactAffix${item.PRCD_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
										<img src="${ctx }/images/u604.gif">&nbsp;正常结清&nbsp;&nbsp;
										<img src="${ctx }/images/u614.gif">&nbsp;提前结清&nbsp;&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
	</body>
</html>