<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>

<html>
  <head>
  <script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
    <title>回访</title>
<script type="text/javascript">
	function showVisitReviewRecord(id){
	location.href='../servlet/defaultDispatcher?__action=backVisit.queryVisitReviewRecordByLeaseCode&lease_code_List='+id;
}

function showViewVisitReviewRecord(id){
	location.href='../servlet/defaultDispatcher?__action=backVisit.viewListVisitReviewRecordByLeaseCode&lease_code_List='+id;
}

function showEditVisitReviewRecord(id){
	location.href='../servlet/defaultDispatcher?__action=backVisit.editListVisitReviewRecordByLeaseCode&lease_code_List='+id;
}

 function pdfFun(){
					  var chk_value =[];   
					  $('input[name="lease_code_List"]:checked').each(function(){   
					   chk_value.push($(this).val());
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择报告");
					  	return false;}	  
	  		$("#__action").val("visitViewToPdf.prePdf");
	  		$("#form1").submit();
	  		$("#__action").val("backVisit.queryAllBackVisit");
	  }
</script>
  </head>
  
  <body>
    <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="backVisit.queryAllBackVisit" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;回访</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
		          <div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t"  valign="top">
				        	
				         <table style="margin-left: 10px;">
				          <tr>
				          <td>承租人：</td>
				          <td><input type="text" name="cust_name" style="width:80px; height:18px;" id="cust_name" value="${cust_name }">
				          <td>
				          回访人员：</td>
				          <td><input type="text" name="" id="" style="width:80px; height:18px;">
							</td>
						</tr>
						<tr>
						<td>
						合同号：
						</td>
						<td>
							<input type="text" name="lease_code" id="lease_code" style="width:80px; height:18px;" value="${lease_code }">
						</td>
				          
				          <td>回访单号：</td>
				          <td colspan="5"><input type="text" name="" id="" style="width:80px; height:18px;">
				          </td>
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
						<td><input type="button" name="pdfbutton" onclick="pdfFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出回访记录"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							&nbsp;
						</th>
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							状态
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同编号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							承租人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							地区
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							城市
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							租金到期日
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>	
							<c:forEach items="${dw.rs}" var="backVisit" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><c:if test="${backVisit.STATE eq -1 }"><input type="checkbox" value="${backVisit.LEASE_CODE }"  name ="lease_code_List"  ></c:if><c:if test="${backVisit.STATE eq 0 }"><input type="checkbox" value="${backVisit.LEASE_CODE }"  name ="lease_code_List"  ></c:if><c:if test="${backVisit.STATE eq 1 }"><input type="checkbox" value="${backVisit.RECT_ID }"  name ="visitReport" disabled="disabled" ></c:if><c:if test="${backVisit.STATE eq 2 }"><input type="checkbox" value="${backVisit.RECT_ID }"  name ="visitReport" disabled="disabled" ></c:if><c:if test="${backVisit.STATE eq 3 }"><input type="checkbox" value="${backVisit.RECT_ID }"  name ="visitReport"  ></c:if><c:if test="${backVisit.STATE eq 4 }"><input type="checkbox" value="${backVisit.RECT_ID }"  name ="visitReport"  ></c:if>&nbsp;</td>
								<td style="text-align: center;"><c:if test="${backVisit.STATE eq -1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">异常在回访</a></c:if><c:if test="${backVisit.STATE eq 0 }">已回访</c:if><c:if test="${backVisit.STATE eq 1 }">未回访</c:if><c:if test="${backVisit.STATE eq 2 }">逾期</c:if><c:if test="${backVisit.STATE eq 3 }">逾期</c:if><c:if test="${backVisit.STATE eq 4 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">异常在回访</a></c:if>&nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onClick="exccc('contractTr${backVisit.RECT_ID }','${backVisit.RECT_ID }','manage');">${backVisit.LEASE_CODE }</a> &nbsp;</td>
								<td style="text-align: center;">${backVisit.CUST_NAME }&nbsp;</td>
								<td style="text-align: center;">${backVisit.PROVINCE }&nbsp;</td>
								<td style="text-align: center;">${backVisit.CITY }&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${backVisit.END_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;"><c:if test="${backVisit.STATE eq 0 }"><font color="#c0c0c0">已回访</font>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${backVisit.LEASE_CODE }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${backVisit.LEASE_CODE }');">查看</a></c:if><c:if test="${backVisit.STATE eq -1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">新建</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${backVisit.LEASE_CODE }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${backVisit.LEASE_CODE }');">查看</a></c:if><c:if test="${backVisit.STATE eq 3 }"><font color="#c0c0c0">已回访</font>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${backVisit.LEASE_CODE }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${backVisit.LEASE_CODE }');">查看</a></c:if><c:if test="${backVisit.STATE eq 4 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">新建</a>|<a href="javaScript:void(0);" onclick="showEditVisitReviewRecord('${backVisit.LEASE_CODE }');">编辑</a>|<a href="javaScript:void(0);" onclick="showViewVisitReviewRecord('${backVisit.LEASE_CODE }');">查看</a></c:if><c:if test="${backVisit.STATE eq 1 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">新建</a>| <font color="#c0c0c0">编辑</font>|<font color="#c0c0c0">查看</font></c:if><c:if test="${backVisit.STATE eq 2 }"><a href="javaScript:void(0);" onclick="showVisitReviewRecord('${backVisit.LEASE_CODE }');">新建</a>|<font color="#c0c0c0">编辑</font>|<font color="#c0c0c0">查看</font></c:if>&nbsp;</td>
							</tr>
							<tr>
								<td align="center" colspan="9">
									<div id="contractTr${backVisit.RECT_ID }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>				
		</form> 
  </body>
</html>
