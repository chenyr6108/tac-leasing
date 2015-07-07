<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>归户管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
			function findContractInfod(name,type,code){
        		$("#contractinfod" + name+type+code).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=applyCompanyManage.findContractInfoByDanbaorenId&type="+type+"&name="+name+"&code="+code);
       			 });
				//window.location.href="${ctx }/servlet/defaultDispatcher?__action=applyCompanyManage.findContractInfoBySupplierId&supplierid="+id;
			}	

		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="applyCompanyManage.findAllApplyCompany" />
			<input type="hidden" name="guihutype" id="guihutype" value="${guihutype }" />
			<!-- <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;归户管理</span>
		   	</div> -->
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          	<tr>
								 <!-- <td>归户类型：</td>
								<td>
									<select id="guihutype" name="guihutype"  value="${guihutype }" style="width:200px; height: 18px;">
												<option value="0" <c:if test="${guihutype eq 0}">selected='selected'</c:if>>供应商</option>
												<option value="1" <c:if test="${guihutype eq 1}">selected='selected'</c:if>>客户</option>
												<option value="2" <c:if test="${guihutype eq 2}">selected='selected'</c:if>>担保人</option>
									</select>
								</td>
								<td>组织机构代码</td>
								<td><input type="text" name="orgcode" value="${orgcode }" style=" width:200px;height:18px; font-size: 12px;"></td>
				          </tr>-->
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="orgcodes" value="${orgcodes }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
						<!-- <td><input type="button" name="pdfbutton" onclick="" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出合同"> </td>-->
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<!--  <th width="2%" class="ui-state-default ui-th-ltr zc_grid_head">
										<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'credit_idxx');">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
									</th>-->
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="NAME" pagingInfo="${dw}">担保人名称</page:pagingSort>
										
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="COUNTS" pagingInfo="${dw}">合同数</page:pagingSort>
										
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="SUMMONTH_PRICE" pagingInfo="${dw}">合同租金总额</page:pagingSort>
										
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										合同租金余额
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										实际剩余本金
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										额度
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										剩余额度
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										已用连保额度
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										已用回购额度
									</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
									<!--  	<td style="text-align: center;"><input type="checkbox" value="${item.PRCD_ID }"  name ="credit_idxx"><input type="hidden" name="contract_type" value="${item.CONTRACT_TYPE }"></td>
										<td style="text-align: center;" onClick="expand('pactAffix${item.PRCD_ID}','${item.PRCD_ID }','${item.RECT_ID }','manage','${item.STATUS }');" style="cursor: pointer;"><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
									-->
										<td style="text-align: center;"><a href="#" onclick="findContractInfod('${item.NAME }','${item.DIFFREENT }','${item.IDENTYCODE }')">${item.NAME }&nbsp;</td>
										<td style="text-align: center;"><c:if test="${item.COUNTS eq null }">0</c:if>${item.COUNTS }&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.SUMMONTH_PRICE }" type="currency" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.SHENGYUZUJIN }" type="currency" />&nbsp;</td>
										<%-- <td style="text-align: right;"><fmt:formatNumber value="${item.SUMLASTPRICE }" type="currency" />&nbsp;</td> --%>
										<td style="text-align: right;"><fmt:formatNumber value="${item.remainingPrincipal }" type="currency" />&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.GRANT_PRICE}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.LAST_PRICE}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.LIANBAO}" type="currency"/>&nbsp;</td>
										<td style="text-align: right;"><fmt:formatNumber value="${item.HUIGOU}" type="currency"/>&nbsp;</td>							
									</tr>
									<tr>
										<td style="text-align: center;" colspan="9" align="center">
											<div id="contractinfod${item.NAME }${item.DIFFREENT }${item.IDENTYCODE }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<!--<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
										  -->
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