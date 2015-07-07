<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/common/js/money.js" ></script>

<html>
  <head>
  <script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
    <title>查询发送锁码Email</title>
<script type="text/javascript">

function cancelSendEmail(){
	  var chk_value =[];   
	  $('input[name="ids"]:checked').each(function(){   
	   chk_value.push($(this).val());   
	  });   
	  if(chk_value.length==0){
	  	alert("你还没有任何记录！");
	  	return false;
	  	}			
	$("#__action").val("emailAndSms.updateDailyLockSendInfo");
	$("#form1").submit();
}

function checkAll(e, itemName)
{
  var aa = document.getElementsByName(itemName);
  for (var i=0; i<aa.length; i++)
   aa[i].checked = e.checked;
}

function doSearch() {
	$("#form1").submit() ;
}
</script>
  </head>
  
  <body>
    <form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
    <input type="hidden" name="__action" id="__action" value="emailAndSms.queryDailyLockSendInfo" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;锁码邮件发送查询</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
		          <div style="margin: 6 0 6 0px;">
					<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">
				         <table style="margin-left: 10px;">
					      <tr>
				          <td>请输入查询条件：</td>
				          <td colspan="3"><input type="text" name="content" style="width:250px; height:18px;" id="content" value="${content }">
				          </td>
				          <td>锁码方式：<select name="LOCK_CODE"><option value=""></option><option value="1" <c:if test="${LOCK_CODE eq 1 }">selected</c:if>>间接</option><option value="3" <c:if test="${LOCK_CODE eq 3 }">selected</c:if>>直接</option></select></td>
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
						<td align="left"><input type="button" class="ui-state-default ui-corner-all" id="But" value="取消发送Email" name="But" onclick="cancelSendEmail();"></td>
						<td align="right"><page:pagingToolbarTop pagingInfo="${dw }"/></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="2%" class="ui-state-default ui-th-ltr zc_grid_head">
							<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');">
						</th>
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
							期数
						</th>						
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备维护人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备维护人Email
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备维护人手机
						</th>						
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							客户联系人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							客户联系人Email
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							客户联系人手机
						</th>	
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							发送状态
						</th>																		
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							创建时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							发送时间
						</th>						
					</tr>
					<tbody>	
							<c:forEach items="${dw.resultList}" var="emailAndSms" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><input type="checkbox" value="${emailAndSms.ID }"  name ="ids" id="ids"></td>
								<td style="text-align: center;">${status.count }&nbsp; </td>
								<td style="text-align: center;">${emailAndSms.LEASE_CODE } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.CUST_NAME } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.RECD_PERIOD } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.RENTER_NAME } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.RENTER_EMAIL } &nbsp;</td>
								<td style="text-align: center;">${emailAndSms.RENTER_PHONE } &nbsp;</td>
								<td style="text-align: center">${emailAndSms.LINK_NAME } &nbsp;</td>
								<td style="text-align: center">${emailAndSms.LINK_EMAIL } &nbsp;</td>
								<td style="text-align: center">${emailAndSms.LINK_MOBILE } &nbsp;</td>
								<td style="text-align: center"><c:if test="${emailAndSms.IS_SEND eq 0}">未发送</c:if><c:if test="${emailAndSms.IS_SEND eq 1}">已发送</c:if> &nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${emailAndSms.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/>&nbsp; </td>
								<td style="text-align: center;"><c:if test="${emailAndSms.IS_SEND eq 1}"><fmt:formatDate value="${emailAndSms.SENDTIME }" pattern="yyyy-MM-dd HH:mm"/></c:if>&nbsp; </td>
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
