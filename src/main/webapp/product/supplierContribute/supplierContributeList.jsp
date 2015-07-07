<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>供应商贡献度</title>
		<script type="text/javascript" src="${ctx }/product/supplierContribute/js/supplierContribute.js"></script>
		<script type="text/javascript">
		function expand(iddiv,id){
		        $("#" + iddiv).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=supplierContribute.querySupplContract&ID=" + id);
		        });
		}
		
		function doSortorder(ordername){
			if(ordername != $("#sortorder").val()){
				$("#sortorder").val(ordername);
				$("#ordertype").val("DESC");
			}else{
				if("DESC" == $("#ordertype").val()){
					$("#ordertype").val("ASC");
				} else if("ASC" == $("#ordertype").val()){
					$("#ordertype").val("DESC");
				} else {
					$("#ordertype").val("DESC");
				}
			}
			doSearch();
		}
		
		</script>
	</head>
	
	<body>
		<form id="form1" method="POST" action="${ctx}/servlet/defaultDispatcher" onsubmit="formtValue();">
			<input type="hidden" name="__action" value="supplierContribute.findAllSupplierContribute" />
			<input type="hidden" id="sortorder" name="sortorder" value="${sortorder }" />
			<input type="hidden" id="ordertype" name="ordertype" value="${ordertype }" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商贡献度</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          查询内容：<input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table></div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						供应商名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('COUNT_RECT')" style="cursor: pointer;">
						合同笔数(点击排序<c:if test="${sortorder eq 'COUNT_RECT' }">
											<c:if test="${ordertype eq 'ASC' }">↑</c:if>
											<c:if test="${ordertype eq 'DESC' }">↓</c:if>
										</c:if>)
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('SUMLEASE_RZE')" style="cursor: pointer;">
						净拨款金额(点击排序<c:if test="${sortorder eq 'SUMLEASE_RZE' }">
											<c:if test="${ordertype eq 'ASC' }">↑</c:if>
											<c:if test="${ordertype eq 'DESC' }">↓</c:if>
										</c:if>)
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('COUNT_RECD')" style="cursor: pointer;">
						设备数量(点击排序<c:if test="${sortorder eq 'COUNT_RECD' }">
											<c:if test="${ordertype eq 'ASC' }">↑</c:if>
											<c:if test="${ordertype eq 'DESC' }">↓</c:if>
										</c:if>)
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('SUM_REN')" style="cursor: pointer;">
						利息总额(点击排序<c:if test="${sortorder eq 'SUM_REN' }">
											<c:if test="${ordertype eq 'ASC' }">↑</c:if>
											<c:if test="${ordertype eq 'DESC' }">↓</c:if>
										</c:if>)
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('AVG_TR')" style="cursor: pointer;">
						平均实际TR(点击排序<c:if test="${sortorder eq 'AVG_TR' }">
											<c:if test="${ordertype eq 'ASC' }">↑</c:if>
											<c:if test="${ordertype eq 'DESC' }">↓</c:if>
										</c:if>)
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						授信总额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						授信余额
					</th>
				</tr>
			<tbody>
				<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${status.count}</td>
						<td style="text-align: center;" onClick="expand('pactAffix${item.ID}',${item.ID});">${item.NAME}&nbsp;</td>
						<td style="text-align: center;">${item.COUNT_RECT}&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.SUMLEASE_RZE}' type='currency'/>&nbsp;</td>
						<td style="text-align: center;">${item.COUNT_RECD }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.SUM_REN}' type='currency'/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.AVG_TR }" pattern="##0.000"/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.GRANT_PRICE}' type='currency'/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.LAST_PRICE}' type='currency'/>&nbsp;</td>
					</tr> 
					<tr>
						<td style="text-align: center;" colspan="10" align="center">
							<div id="pactAffix${item.ID}" align="center"
								style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
		</form>
	</body>
</html>