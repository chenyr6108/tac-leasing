<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>担保人授信</title>
		<script type="text/javascript">	
			function findCreditInfod(id,type){
        		$("#creditinfod" + id).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=creditVouchManage.getAllCieditByVouch&type="+type+"&danbaorenid="+id);
       			 });
			}	
		</script>	
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" id="__action" value="creditVouchManage.getAllCieditVouch">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;担保人授信</span>
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
				          <tr> <td>授信额度：</td>
				          <td><input type="text" name="QSTARTMONEY" id="QSTARTMONEY" value="${QSTARTMONEY }" style=" width:66px;height:18px; font-size: 12px;">-
			          	      <input type="text" name="QENDMONEY" id="QENDMONEY" value="${QENDMONEY }" style=" width:66px;height:18px; font-size: 12px;">
				          </td>
				          <td>类型：</td>
						<td><c:set var="type0" value=""></c:set>
							<c:set var="type1" value=""></c:set>
							<c:set var="type2" value=""></c:set>
							<c:if test="${type eq 2}"><c:set var="type2" value="selected='selected'"></c:set></c:if>
							<c:if test="${type eq 0}"><c:set var="type0" value="selected='selected'"></c:set></c:if>	
							<c:if test="${type eq 1}"><c:set var="type1" value="selected='selected'"></c:set></c:if>								
							<select name="type" style=" height: 18px;">
							    <option value="2"${type2}>全部</option>
								<option value="0"${type0}>自然人</option>
								<option value="1"${type1}>法人</option></select>
						</td>
						<td>授信状态：
				          	<select name="QCUGPDTATUS" id="QCUGPDTATUS" style=" height: 18px;">
				          	 	<option value="-1">请选择</option>
				          	 	<option value="2" <c:if test="${QCUGPDTATUS eq 2 }">selected</c:if>>未授信</option>
				          	 	<option value="0" <c:if test="${QCUGPDTATUS eq 0 }">selected</c:if> >已授信</option>
				          	 	<option value="1" <c:if test="${QCUGPDTATUS eq 1 }">selected</c:if>>取消授信</option>
				          	</select></td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
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
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>担保人类型</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>报告个数</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>证件号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>联系方式</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>授信额度</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>授信余额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>授信状态</strong>
					</th>										
					<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>承租人</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>报告编号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同编号</strong>
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;"><c:if test="${item.TYPE eq 0}">自然人</c:if><c:if test="${item.TYPE eq 1}">法人</c:if>&nbsp;</td>
						<td style="text-align: center;">${item.COUNTSUM }&nbsp;</td>
						<td style="text-align: center;"><a href="#" onclick="findCreditInfod('${item.ID }','${item.TYPE }')">${item.NAME }</a>&nbsp;</td>
						<td style="text-align: center;">${item.CODE }&nbsp;</td>
						<td style="text-align: center;">${item.PHONE }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber pattern="#,##0.00"  value="${item.GRANT_PRICE}"/>&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber pattern="#,##0.00"  value="${item.LAST_PRICE }"/>&nbsp;</td>
						<td style="text-align: center;"> <c:if test="${empty item.PDVP_ID}">未授信</c:if><c:if test="${not empty item.PDVP_ID}"><c:if test="${item.CUVP_STATUS eq 0}">已授信 </c:if><c:if test="${item.CUVP_STATUS eq 1}">取消授信</c:if></c:if>&nbsp;</td>
						<!--  <td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>-->
						<td style="text-align: center;"><c:if test="${item.TYPE eq 0}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVouchManage.queryLog&VOUCH_NAME=${item.NAME }&VOUCH_CODE=${item.CODE }&TYPE=${item.TYPE }'">查看</a></c:if><c:if test="${item.TYPE eq 1}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getAllVouchCorpShow&ID=${item.ID }'">查看</a></c:if></td>
					</tr>
					<tr>
										<td style="text-align: center;" colspan="9" align="center">
											<div id="creditinfod${item.ID }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>