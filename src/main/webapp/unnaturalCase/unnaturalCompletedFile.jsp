<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>案件拨款后待补文件</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	<script type="text/javascript">	
	
	$(document).ready(function(){
		
		//comment by ZhangYizhou on 2014-06-13 Begin
		//note : 暂时不需要该tooltip效果
		/*
        var content = {
            tipInfo: "<H5>查询内容包括:</H5><H5>案件号,合同号,客户名称,供应商名称</H5>"
        };
        $("#CONTENT").showTip(content);
        */
        //comment by ZhangYizhou on 2014-06-13 End

    });

	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="unnaturalCaseCommand.queryUncompletedFileCase">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;案件拨款后待补文件(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;01:00:00)</span>
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
				          <!-- add by ZhangYizhou on 2014-06-13 Begin  -->
				          <!-- NOTE：增加拨款方式查询条件  -->
				          <td colspan="1">查询内容：&nbsp;<input type="text" id="CONTENT" name="CONTENT" value="${content }" style="width:200px;height:18px; font-size: 12px;" onfocus="showDescr()"></td>
				          <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;拨款方式 ：&nbsp;
				              <select id="TYPE" name="TYPE">
				                  <option value="">--全部--</option>
				                  <option value="交机前拨款" 
				                  	  <c:if test="${TYPE eq '交机前拨款' }">selected="selected"</c:if> >交机前拨款</option>
				                  <option value="交机后拨款"
				                      <c:if test="${TYPE eq '交机后拨款 ' }">selected="selected"</c:if> >交机后拨款 </option>
				              </select>
				          </td>
				          <!-- add by ZhangYizhou on 2014-06-13 End  -->
				          <!-- comment by ZhangYizhou on 2014-06-13 Begin  -->
				          <!--
				          <td colspan="3">查询内容：&nbsp;<input type="text" id="CONTENT" name="CONTENT" value="${content }" style="width:200px;height:18px; font-size: 12px;" onfocus="showDescr()"></td>
				          -->
				          <!-- comment by ZhangYizhou on 2014-06-13 End  -->
				          </tr>
				          <tr>
				          	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
									<select id="DATE" name="DATE">
										<c:forEach var="item" items="${dateList}">
											<option value="${item.DATE }" 
												<c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">selected="selected"</c:if></c:when>
														  <c:otherwise><c:if test="${item.DATE eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>${item.DATE }
											</option>
										</c:forEach>
									</select>
							</td>
							<td>
									&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								办事处：
									<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="item" items="${deptList}">
											<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${item.DEPT_NAME }
											</option>
										</c:forEach>
									</select>
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
					<div class="ui-state-default ui-jqgrid-hdiv ">
					<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>序号</strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="creditRunCode" pagingInfo="${pagingInfo }"><strong>案件号 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="leaseCode" pagingInfo="${pagingInfo }"><strong>合同号 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="custName" pagingInfo="${pagingInfo }"><strong>客户名称 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="fileName" pagingInfo="${pagingInfo }"><strong>待补文件名称</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="suplName" pagingInfo="${pagingInfo }"><strong>供应商</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="financeDate" pagingInfo="${pagingInfo }"><strong>拨款日</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="shouldFinishDate" pagingInfo="${pagingInfo }"><strong>应补回日</strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="delayDay" pagingInfo="${pagingInfo }"><strong>延迟天数 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="issueReason" pagingInfo="${pagingInfo }"><strong>待补原因 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="type" pagingInfo="${pagingInfo }"><strong>拨款方式 </strong></page:pagingSort>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<page:pagingSort orderBy="fileRemark" pagingInfo="${pagingInfo }"><strong>备注 </strong></page:pagingSort>
								</th>
							</tr>
							<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${index.count }&nbsp;</td>  
									<td style="text-align: center;">${item.creditRunCode }&nbsp;</td> 
									<td style="text-align: center;">${item.leaseCode }&nbsp;</td>
									<td style="text-align: center;">${item.custName }&nbsp;</td>
									<td style="text-align: center;">${item.fileName }&nbsp;</td>
									<td style="text-align: center;">${item.name }&nbsp;</td>
									<td style="text-align: center;">${item.suplName }&nbsp;</td>
									<td style="text-align: center;">${item.financeDate }&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${item.shouldFinishDate eq '1900-01-01'}"></c:when><c:otherwise>${item.shouldFinishDate }</c:otherwise></c:choose>&nbsp;</td>
									<td style="text-align: center;"><c:choose><c:when test="${item.delayDay eq '-1'}"></c:when><c:otherwise>${item.delayDay }</c:otherwise></c:choose>&nbsp;</td>
									<td style="text-align: center;">${item.issueReason }&nbsp;</td>
									<td style="text-align: center;">${item.type }&nbsp;</td>
									<td style="text-align: left;">${item.fileRemark }&nbsp;</td>
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