<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>系统日志</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
	$(function (){
				$("#start_date").datepicker($.datepicker.regional['zh-CN']);
				$("#end_date").datepicker($.datepicker.regional['zh-CN']);
			});
			
	//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    

        if(event.keyCode==13)
        {
                doSearch();   
                                             
        }
 } 
	</script>
	</head>
	<body>
		
				<form action="../servlet/defaultDispatcher" name="form1" id="form1"
					method="post">
					<input type="hidden" name="__action" id="__action"
						value="businessLog.manage">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<div class="zc_grid_body jqgrowleft">
			
						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td>
									<div
										class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
										style="height: 30px">
										<span class="ui-jqgrid-title"
											style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;系统日志</span>
									</div>
								</td>
							</tr>
							<tr>
								<td >
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
				          <input type="text"  value="${start_date }"name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"id="start_date" ></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text"  style=" width: 80px; height: 18px;" readonly="readonly" value="${end_date}" name="end_date" id="end_date">
					</td>
					
				          </tr>
				          <tr>
				          <td>查询关键字：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }"  style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="$('#form1').submit();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
						</td>
							</tr>
							<tr>
								<td colspan="3" >
								<div class="ui-state-default ui-jqgrid-hdiv ">
									<table class="grid_table">
										<tr>
											<th colspan="9">
												<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
											</th>
										</tr>
										<tr>
											<th style="width: 3%">
												承租人类型
											</th>
											<th style="width: 20%">
												承租人
											</th>
											<th style="width: 5%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="LEASE_CODE">合同号</page:pagingSort>
											</th>
											<th style="width: 5%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="LOG_TYPE">日志对象</page:pagingSort>
											</th>
											<th style="width: 5%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="LOG_TITLE">日志操作</page:pagingSort>
											</th>
											<th style="width: 49%">
												备注
											</th>											
											<th style="width: 3%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="USER_NAME">创建人</page:pagingSort>
											</th>
											<th style="width: 5%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="IP_ADDRESS">IP地址</page:pagingSort>
											</th>
											<th style="width: 5%">
												<page:pagingSort pagingInfo="${pagingInfo }" orderBy="CREATE_DATE">创建时间</page:pagingSort>
											</th>
										</tr>
										<c:forEach items="${pagingInfo.resultList}" var="item">
											<tr>

												<td>
													<c:if test="${item.TYPE eq 0}">
														法人
													</c:if>
													<c:if test="${item.TYPE eq 1}">
														自然人
													</c:if> 
												</td>
												<td>
													${item.CUST_NAME} &nbsp;
												</td>
												<td>
													${item.LEASE_CODE}&nbsp;
												</td>
												<td>
													${item.LOG_TYPE}&nbsp;
												</td>
												<td>
													${item.LOG_TITLE}&nbsp;
												</td>
												<td style="text-align: left;">
													<div style="white-space: pre-wrap; text-align: left;">${item.MEMO}</div>
												</td>												
												<td>
													${item.USER_NAME}&nbsp;
												</td>
												<td>
													${item.IP_ADDRESS}	
													&nbsp;
												</td>
												<td>
													${item.CREATE_DATE}	
													&nbsp;
												</td>
											</tr>
										</c:forEach>
										<tr>
											<th colspan="9">
												<page:pagingToolbar pagingInfo="${pagingInfo }"/>
											</th>
										</tr>
									
									</table> 
</div>
</div>
</div>
</td>
</tr>
</table>
</form>
</body>
</html>