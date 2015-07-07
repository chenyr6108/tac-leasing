<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>

<html>
  <head>
  <script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
    <title>发送信息查询</title>
<script type="text/javascript">


</script>
  </head>
  
  <body>
    <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="emailAndSms.queryEmailAndSmsByCond" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;发送信息查询</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
		          <div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">
				        	
				         <table style="margin-left: 10px;">
				          <tr>
				          <td>发送日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          
				          <td>创建人：</td>
				          <td><input type="text" name="CREATE_BY" style="width:150px; height:18px;" id="CREATE_BY" value="${CREATE_BY }"></td>
				          <td>&nbsp;&nbsp;&nbsp;&nbsp;发送内容：</td>
				          <td ><input type="text" name="CONTENT" id="CONTENT" style="width:150px; height:18px;" value="${CONTENT }">
				          </td>
				          </tr>
				          <tr>
				          <td>承租人：</td>
				          <td><input type="text" name="cust_name" style="width:150px; height:18px;" id="cust_name" value="${cust_name }">
						<td>
						&nbsp;&nbsp;&nbsp;&nbsp;合同号：
						</td>
						<td>
							<input type="text" name="lease_code" id="lease_code" style="width:150px; height:18px;" value="${lease_code }">
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;发送号码:</td>
						<td><input type="text" name="MOBILE" id="MOBILE" style="width:150px; height:18px;" value="${MOBILE }"></td>
				          </tr>
				          </table>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td></td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							承租人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							接受人号码
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							发送内容
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							创建人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							发送时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							发送状态
						</th>
					</tr>
					<tbody>	
							<c:forEach items="${dw.resultList}" var="emailAndSms" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }&nbsp; </td>
								<td style="text-align: center;">${emailAndSms.CONTRACTNUMBER } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.CUSTOMERNAME } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.MOBILENUMBER } &nbsp;</td>
								<td style="text-align: center">${emailAndSms.MESSAGE } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.CREATEBY } </td>
								<td style="text-align: center;"><c:if test="${emailAndSms.SENDFLAG eq 1}"><fmt:formatDate value="${emailAndSms.SENDTIME }" pattern="yyyy-MM-dd HH:mm"/></c:if> &nbsp;</td>
								<td style="text-align: center;">&nbsp; <c:if test="${emailAndSms.SENDFLAG eq 0}">未发送</c:if><c:if test="${emailAndSms.SENDFLAG eq 1}">已发送</c:if>&nbsp;&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
			</div>				
		</form> 
  </body>
</html>
