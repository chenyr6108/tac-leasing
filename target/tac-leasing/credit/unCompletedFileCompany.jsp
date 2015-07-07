<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>待补文件清单</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	<script type="text/javascript">	
	
	$(document).ready(function(){
		
        var content = {
            tipInfo: "<H5>查询内容包括:</H5><H5>案件号,合同号,客户名称,供应商名称</H5>"
        };
        $("#content").showTip(content);  

    });

	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="isSalesDesk" name="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" id="__action" name="__action" value="creditReport.getAllUnCompletedFileCompany">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;待补文件清单</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
			          <td width="60" class="ss_o"></td>
			          <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td><br>查询内容：</td>
				          <td><br><input type="text" id="content" name="content" value="${content }" style="width:200px;height:18px; font-size: 12px;" onfocus="showDescr()">
				          </td>
				          </tr>
				          </table>
			           </td>
				       <td width="55" class="ss_th" valign="top">&nbsp;</td>
				       <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				       </tr>
			     </table>
        	</div>
	           <div class="zc_grid_body jqgrowleft">
	          		<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
					<div class="ui-state-default ui-jqgrid-hdiv ">
					<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>序号</strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo }"><strong>案件号 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${pagingInfo }"><strong>合同号 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="CUST_NAME" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="FILE_NAME" pagingInfo="${pagingInfo }"><strong>待补文件名称</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="NAME" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="BRAND" pagingInfo="${pagingInfo }"><strong>供应商</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="FINANCECONTRACT_DATE" pagingInfo="${pagingInfo }"><strong>拨款日</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="SHOULD_FINISH_DATE" pagingInfo="${pagingInfo }"><strong>应补回日</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="DELAY_DAY" pagingInfo="${pagingInfo }"><strong>延迟天数 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="ISSURE_REASON" pagingInfo="${pagingInfo }"><strong>待补原因 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="TYPE" pagingInfo="${pagingInfo }"><strong>拨款方式 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="FILE_MEMO" pagingInfo="${pagingInfo }"><strong>备注 </strong></page:pagingSort>
								</th>
							</tr>
							<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${index.count }&nbsp;</td>  
									<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td> 
									<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
									<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.FILE_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.BRAND }&nbsp;</td>
									<td style="text-align: center;">${item.FINANCECONTRACT_DATE }&nbsp;</td>
									<td style="text-align: center;">${item.SHOULD_FINISH_DATE }&nbsp;</td>
									<td style="text-align: center;">${item.DELAY_DAY }&nbsp;</td>
									<td style="text-align: center;">${item.ISSURE_REASON }&nbsp;</td>
									<td style="text-align: center;">${item.TYPE }&nbsp;</td>
									<td style="text-align: center;">${item.FILE_MEMO }&nbsp;</td>
								</tr>
							</c:forEach>
							</table>
						<page:pagingToolbar pagingInfo="${pagingInfo }"/>
					</div>
				</div>
			</div>		
		</form>
	</body>
</html>