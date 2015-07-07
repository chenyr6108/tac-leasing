<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>支票录入管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			function checkPayCreate(ID,CUST_NAME,TYPE){
			    $("#checkPay").toggle(function(){
			        $("#checkPay").load("../servlet/defaultDispatcher?__action=rentContract.initRentCheckNew&TYPE="+TYPE+"&ID="+ID );
			        
					$("#checkPay").dialog({
					        modal: true,
					        autoOpen: false,
					        width: 840
					    });
					    $("#checkPay").dialog('open');  
						
			    });
			}
			
			function expandForShow(pid,id){
		        $("#" + pid).toggle(function(){
		            $(this).load("../servlet/defaultDispatcher?__action=rentContract.queryCheckPayDetailLog&ID=" + id );
		        });
			}
			
			function createNewRentCheckDetail(){
				location.href="../servlet/defaultDispatcher?__action=rentContract.initKeyInRentCheckDetail";
			}
			
			function checkAll(e, itemName)
			{
			  var aa = document.getElementsByName(itemName);
			  for (var i=0; i<aa.length; i++)
			   aa[i].checked = e.checked;
			}
			
			function batchHWExam(){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
		    	$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'rentContract.batchHWExam',
						ids:strIDS},
					dataType:'json',
					success:function(dataBack){
						alert("批量业管确认成功！");
						location.href="../servlet/defaultDispatcher?__action=rentContract.queryRentCheckManageDetailForKeyIn";
			        }   
				});
			}
			function batchFinanceExam(){
				  var chk_value =[]; 
				  var strIDS="";
				  $('input[name="ids2"]:checked').each(function(){   
				   	chk_value.push($(this).val());   
				  });   
				  if(chk_value.length==0){
				  	alert("你还没有选择支票！");
				  	return false;
				  }
			      for (var i=0; i<chk_value.length; i++){
			    	  if(i==0){
			    		  strIDS=chk_value[i];
			    	  }else{
			    		  strIDS=strIDS+","+chk_value[i];
			    	  }
				  }
				  
		    	$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:{__action:'rentContract.batchFinanceExam',
						ids:strIDS},
					dataType:'json',
					success:function(dataBack){
						alert("批量财务确认成功！");
						location.href="../servlet/defaultDispatcher?__action=rentContract.queryRentCheckManageDetailForKeyIn";
			        }   
				});
			}			
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentCheckManageDetailForKeyIn" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支票录入管理</span>
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
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:25px; font-size: 12px;">
				          </td>
				          <td>
							公司别：
							<select name="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
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
						<td><a href="#" name="createNewRentCheckDetail" id="createNewRentCheckDetail" onclick="createNewRentCheckDetail();"  class="blue_button">添加支票</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${hwExam}"><a href="#" name="batchHWExam" id="batchHWExam" onclick="batchHWExam();"  class="blue_button">业管确认</a></c:if>&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${financeExam }"><a href="#" name="batchFinanceExam" id="batchFinanceExam" onclick="batchFinanceExam();"  class="blue_button">财务确认</a></c:if>
						</td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<c:if test="${hwExam}"><INPUT TYPE="checkbox" NAME="all" id="all" onclick="checkAll(this,'ids');"></c:if>&nbsp;业管选择
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<c:if test="${financeExam}"><INPUT TYPE="checkbox" NAME="all2" id="all2" onclick="checkAll(this,'ids2');"></c:if>&nbsp;财务选择
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										出票人
									</th>								
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支票号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										出票日期
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										支票金额
									</th>									
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;"><c:if test="${hwExam}"><c:if test="${empty item.HW_CHECK_STATE and empty item.FINANCE_CHECK_STATE }"><INPUT TYPE="checkbox" NAME="ids" value="${item.ID}" onclick="checkItem(this,'all')"></c:if></c:if>&nbsp;</td>
										<td style="text-align: center;"><c:if test="${financeExam}"><c:if test="${ empty item.FINANCE_CHECK_STATE }"><INPUT TYPE="checkbox" NAME="ids2" value="${item.ID}" onclick="checkItem(this,'all2')"></c:if></c:if>&nbsp;</td>
										<td style="text-align: center;cursor: pointer;" onClick="expandForShow('pactAffix${item.ID}','${item.ID}')"><a>${item.CUST_NAME }</a>&nbsp;</td>
										<td style="text-align: center;">${item.DRAWER }&nbsp;</td>
										<td style="text-align: center;">${item.CHECK_NUM }</td>
										<td style="text-align: center;">${item.CHECK_OUT_DATE }&nbsp;</td>
										<td style="text-align: center;">${item.CHECK_MONEY }&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:void(0)" onclick="checkPayCreate('${item.ID }','${item.CUST_NAME }','SHOW');">查看支票明细</a>&nbsp;|&nbsp;<c:choose><c:when test="${salesKeyin}"><a href="javascript:void(0)" onclick="checkPayCreate('${item.ID }','${item.CUST_NAME }','SALES');">录入支票明细</a></c:when><c:otherwise>录入支票明细</c:otherwise></c:choose>&nbsp;|&nbsp;<c:choose><c:when test="${hwExam}"><a href="javascript:void(0)" onclick="checkPayCreate('${item.ID }','${item.CUST_NAME }','HW');">业管确认</a></c:when><c:otherwise>业管确认</c:otherwise></c:choose>&nbsp;|&nbsp;<c:choose><c:when test="${ financeExam }"><a href="javascript:void(0)" onclick="checkPayCreate('${item.ID }','${item.CUST_NAME }','FINANCE');">财务确认</a></c:when><c:otherwise>财务确认</c:otherwise></c:choose></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="8" align="left">
											<div id="pactAffix${item.ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 40%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
		</form>
			<div id="checkPay" align="center" title="支票录入管理" style="display: none; width: 900px">
				<img src="${ctx }/images/loading.gif">
			</div>	
	</body>
</html>