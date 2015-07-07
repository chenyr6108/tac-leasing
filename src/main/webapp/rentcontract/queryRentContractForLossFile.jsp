<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>合同补件</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		
		function rentfileForLoss(id,CONTRACT_TYPE,forShow){
		    $("#rentfile").toggle(function(){
		        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFileForLoss&prcd_id=" + id + "&cardFlag=2&CONTRACT_TYPE="+CONTRACT_TYPE + "&forShow=" + forShow);
		        
				$("#rentfile").dialog({
				        modal: true,
				        autoOpen: false,
				        width: 1030
				    });
				    $("#rentfile").dialog('open');        
		    });
		}
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			function invalidRentContract(id) { 
				if(confirm('确认作废？')){
					$.post('../servlet/defaultDispatcher',
							{__action : 'rentContract.validateInvaliRent',rect_id : id},
						function (dataBack){
							if(dataBack.resultCount == '0'){
								alert("该合同有销账，不能作废！");
							} else {
								location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.invalidRentContract&RECT_ID='+id;
							}
					}, 'json');
				}else{
					return false;
				}
			}
		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		function checkItem(e, allName)
		{
		  var all = document.getElementsByName(allName)[0];
		  if(!e.checked) all.checked = false;
		  else
		  {
		    var aa = document.getElementsByName(e.name);
		    for (var i=0; i<aa.length; i++)
		     if(!aa[i].checked) return;
		    all.checked = true;
		  }
		}			
			//导出合同
	 function pdfFun(){
		var chk_value =[];   
		$('input[name="credit_idxx"]:checked').each(function(){   
		 chk_value.push($(this).val());   
		});   
		if(chk_value.length==0){
			alert("你还没有选择合同");
			return false;}	 
  		$("#__action").val("expContract.prePdf");
  		$("#form1").submit();
  		$("#__action").val("rentContract.queryRentContractForLossFile");
	  }
	 function pdfFunAll(){
  		$("#__action").val("expContract.prePdfAll");
  		$("#form1").submit();
  		$("#__action").val("rentContract.queryRentContractForLossFile");
	  }
	  function rentContractExcel(){
	  /*
	  	 var chk_value =[];   
					  $('input[name="credit_idxx"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择合同");
					  	return false;}	
	*/				  	 
	  		$("#__action").val("rentContract.contractExcel");
	  		$("#form1").submit();
	  		$("#__action").val("rentContract.queryRentContractForLossFile");
	  }
	  function creditpdf(){
	  		var chk_value =[];   
			$('input[name="credit_idxx"]:checked').each(function(){   
				 chk_value.push($(this).val());   
			});   
			if(chk_value.length==0){
				alert("你还没有选择合同");
			return false;}	 
	  		$("#__action").val("exportCreditPdfs.prePdf");
	  		$("#form1").submit();
	  		$("#__action").val("rentContract.queryRentContractForLossFile");
	  	//window.location.href='${ctx }/servlet/defaultDispatcher?__action=exportCreditPdfs.expBeginCustPdfs&rect_id=7';
	  }
	  function leaseholdpdf(){
	  		var chk_value =[];   
			$('input[name="credit_idxx"]:checked').each(function(){   
				 chk_value.push($(this).val());   
			});   
			if(chk_value.length==0){
				alert("你还没有选择合同");
			return false;}	 
	  		$("#__action").val("exporLleaseHoldPdf.prePdf");
	  		$("#form1").submit();
	  		$("#__action").val("exporLleaseHoldPdf.expLeaseHoldPdfs");
	  		
	  	//window.location.href='${ctx }/servlet/defaultDispatcher?__action=exporLleaseHoldPdf.expLeaseHoldPdfs&credit_id=243';
	  }
	  
	  
	  
function commitCredits(PRCD_ID,s_employeeId) { 

	//检查该案件是否是专案,如果是专案,检查专案有效期,在有效期范围外,灰掉提交按钮 add by ShenQi
	$.ajax({
		type: 'post',
		url: "${ctx }/servlet/defaultDispatcher",
		dataType: 'json',
		data: '__action=creditReport.checkDatePeriod&credit_id='+PRCD_ID,
		success: function(data) {
			if(data.flag) {
				alert("当前日期不在专案有效期内");
			} else {
				//判断有没有过期
				var url = "../servlet/defaultDispatcher";
				var data = {"__action" : "businessSupport.getIsExpiredByCreditId", "credit_id" : PRCD_ID};
				$.getJSON(url, data, function (result){
					if(result){
						doCommitCredits(PRCD_ID,s_employeeId);
					} else {
						alert("案件已过期,操作失败。");
					}
				});
			}
		}
	});
}

//add by Michael 2012 11-16 合同初审卡文审有没有keyin 待补状况
function doCommitCredits(PRCD_ID,s_employeeId){
	// Add by Michael 2012 08-14 初审前检核合同文件是否有录入
	$.ajax({
	type:'post',
	url:'../servlet/defaultDispatcher',
	data:'__action=rentFile.getRentContractFileList&credit_id='+PRCD_ID,
	dataType:'json',
	success: function(dataBack){ 
		if(dataBack.rentContractFileList.length!=0){
		
			location.href="${ctx }/servlet/defaultDispatcher?__action=rentContract.initCreate&PRCD_ID="+PRCD_ID+"&s_employeeId="+s_employeeId;
		}else{
			alert("初审前请先检核并Keyin合同文件状态！");	
		}
	}
});
}

/* function doCommitCredits(PRCD_ID,s_employeeId){
	var unUp="";
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReport.getunUpContract&credit_id='+PRCD_ID,
		dataType:'json',
		success: function(dataBack){ 
		if(dataBack.unUpList.length==0){
				/*
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditReport.getLastGrantPrice&credit_id='+PRCD_ID,
					dataType:'json',
					success: function(dataBack){ 
						if(dataBack.alertInfo=="success"){
							location.href="${ctx }/servlet/defaultDispatcher?__action=rentContract.initCreate&PRCD_ID="+PRCD_ID+"&s_employeeId="+s_employeeId;
						}else{
							alert(dataBack.alertInfo);	
						}
					}
				});
				*/
				// Add by Michael 2012 08-14 初审前检核合同文件是否有录入
/* 				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=rentFile.getRentContractFileList&credit_id='+PRCD_ID,
					dataType:'json',
					success: function(dataBack){ 
						if(dataBack.rentContractFileList.length!=0){
							location.href="${ctx }/servlet/defaultDispatcher?__action=rentContract.initCreate&PRCD_ID="+PRCD_ID+"&s_employeeId="+s_employeeId;
						}else{
							alert("初审前请先检核并Keyin合同文件状态！");	
						}
					}
				});
				
		}else{
				for(i=0;i<dataBack.unUpList.length;i++){ 
				 	unUp=unUp+dataBack.unUpList[i].FILE_TYPE+":"+dataBack.unUpList[i].FILE_NAME+"\n";
				}
				unUp=unUp+"没有上传！"
				alert(unUp);		
			}
		}
	});
		
} */
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentContractForLossFile" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同补件</span>
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
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
						<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-2" <c:if test="${QSELECT_STATUS eq -2}">selected='selected'</c:if>>
								全部
							</option>
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								未文审
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								已文审
							</option>
							<option value="3" <c:if test="${QSELECT_STATUS eq 3}">selected='selected'</c:if>>
								未还款
							</option>
							<option value="4" <c:if test="${QSELECT_STATUS eq 4}">selected='selected'</c:if>>
								已还款
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								已复核
							</option>
							<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								复核驳回
							</option>
						</select>
					</td>
					<td>
					合同类型：
					</td>
					<td>
					<select name="RENTSTAUTS" style=" height: 18px;">
							<option value="-3" <c:if test="${RENTSTAUTS eq -3}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${RENTSTAUTS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="-1" <c:if test="${RENTSTAUTS eq -1}">selected='selected'</c:if>>
								作废
							</option>
							</select>
					</td>
					<td>
					结清状态：
					</td>
					<td>
					<select name="RECP_STATUS" style=" height: 18px;">
							<option value="">
								全部
							</option>
							<option value="1" <c:if test="${RECP_STATUS eq 1}">selected='selected'</c:if>>
								正常结清
							</option>
							<option value="3" <c:if test="${RECP_STATUS eq 3}">selected='selected'</c:if>>
								提前结清
							</option>
							</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td><input type="text" id="QSEARCH_VALUE" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          <td>补件人：</td>
				          <td>
				          <select id="SELF_DISPATCH" name="SELF_DISPATCH">
					          <option value="false">全部</option>
					          
					          <option value="true" <c:if test='${SELF_DISPATCH eq "true"}'>selected="selected"</c:if>>自己</option>				          
				          </select>
				          </td>
				          <td>只查询待补：</td>
				          <td>
				          <select id="LOSS_ONLY" name="LOSS_ONLY">
					          <option value="false" <c:if test='${LOSS_ONLY eq "false"}'>selected="selected"</c:if>>否</option>
					          <option value="true" <c:if test='${LOSS_ONLY eq "true"}'>selected="selected"</c:if>>是</option>				          
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
					<table style="width: 100%;">
						<tr>
							<td>
								<c:if test="${QSELECT_STATUS >= 0 || RECP_STATUS ==1 || RECP_STATUS == 3 }">
									<input type="button" name="pdfbutton" onclick="rentContractExcel();" class="panel_button" value="导出合同资料（EXL）">
								</c:if>
							</td>
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table class="grid_table">
								<tr>
								<th width="2%">
										<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'credit_idxx');">
									</th>
									<th>
										状态
									</th>
									<th>
										<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${dw}">案件号</page:pagingSort>
									</th>
									<th>
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${dw}">合同编号</page:pagingSort>
									</th>
									<th>
										客户名称
									</th>
									<th>
										区域
									</th>
									<th>
										区域办事处
									</th>
									<th>
										客户经理
									</th>
									<th>
										补件人
									</th>
									<th>
										供货商
									</th>
									<th>
										核准日
									</th>
									<th>
										签订时间
									</th>
									<th>
										操作
									</th>
								</tr>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr>
										<td style="text-align: center;"><input type="checkbox" value="${item.PRCD_ID }"  name ="credit_idxx"><input type="hidden" name="contract_type" value="${item.CONTRACT_TYPE }"></td>
										<td style="text-align: center;cursor: pointer;" onClick="expand('pactAffix${item.PRCD_ID}','${item.PRCD_ID }','${item.RECT_ID }','manage','${item.STATUS }','${item.CONTRACT_TYPE }');" style="cursor: pointer;">
										<!-- 	[${item.PRCD_STATUS }|${item.RECT_STATUS }] -->
										<c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if>
										<c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审">
										</c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}"><img src="${ctx }/images/u604.gif" title="正常结清"></c:if>
										<c:if test="${item.RECP_STATUS == 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if>
										<c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if>
										</c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if>
										<c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
										<!-- Add by Michael 2012 07-13 增加案件号 -->
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.AREA }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DISPATCH_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BRAND }&nbsp;</td>
										<td style="text-align: center;">&nbsp;<fmt:formatDate value="${item.WIND_RESULT_DATE }" pattern="yyyy-MM-dd"/></td>
										<td style="text-align: center;">&nbsp;<c:if test='${item.LESSOR_TIME!=null && item.LESSOR_TIME!="" &&item.LESSOR_TIME!="1900-01-01 00:00:00.0"}'><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;">
											<c:if test="${item.TRFS_STATE ne 9 && item.RECT_STATUS eq null}">
												<a href="javascript:void(0)" onclick="alert('该合同尚未业管收件文审,请先转至该画面操作!!');" style="color: #bbbbbb;">补件</a>
											</c:if>
											<c:if test="${item.TRFS_STATE eq 9 || item.RECT_STATUS ne null}">
												<a href="javascript:void(0)" onclick="rentfileForLoss('${item.PRCD_ID }','${item.CONTRACT_TYPE+1 }');">补件</a>
											</c:if>
										</td>
									</tr>
									<tr>
										<th class="pact" colspan="12">
											<div id="pactAffix${item.PRCD_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
										<img src="${ctx }/images/u604.gif">&nbsp;正常结清&nbsp;&nbsp;
										<img src="${ctx }/images/u614.gif">&nbsp;提前结清&nbsp;&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
			
				<!--  日志弹出层开始   -->
			<!-- 弹出用函数 接收参数 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志" style="display: none" id="showBusinessLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=business.showBusinessLog">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号</td>
								<td style="text-align:center"  width="6%">编号</td>
								<td style="text-align:center"  width="6%">日志对象</td>
								<td style="text-align:center"  width="4%">日志操作</td>
								<td style="text-align:center"  width="6%">创建人</td>
								<td style="text-align:center"  width="6%">创建时间</td>
								<td style="text-align:center"  width="15%">备注</td>
							</tr>
					</table>
					<center>
					共<span id="barNum"></span>条,共<span id="total"></span>页
					当前第<span id="pageNum" ></span>页
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
					</center>
				</div>
				</div>
			</div>	
		</form>
		</div>

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
	</body>
</html>