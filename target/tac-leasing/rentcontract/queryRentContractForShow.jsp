<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>合同浏览</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
			$(function (){
				$("#EXPECTED_DATE").datepicker($.datepicker.regional['zh-CN']);
				var d=new Date();
				var vYear=d.getFullYear();
				var vMon=d.getMonth()+1;
				var vDay=d.getDate();
				if(vMon<10) {
					vMon="0"+vMon;
				}
				if(vDay<10) {
					vDay="0"+vDay;
				}
				$("#EXPECTED_DATE").val(vYear+"-"+vMon+"-"+vDay);
			});
			
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
					location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.invalidRentContract&RECT_ID='+id;
				}else{
					return false;
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
	  		$("#__action").val("rentContract.queryRentContractForShow");
	  }
	   function pdfFunAll(){
  		$("#__action").val("expContract.prePdfAll");
  		$("#form1").submit();
  		$("#__action").val("rentContract.queryRentContractForShow");
	  }
	   function rentContractExcel(){
	  	 var chk_value =[];   
					  $('input[name="credit_idxx"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择合同");
					  	return false;}	 
	  		$("#__action").val("rentContract.contractExcel");
	  		$("#form1").submit();
	  		$("#__action").val("rentContract.queryRentContractForShow");
	  }
	  function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
	 	function showEditPayMoneyReviewRecord(code,id,has_linkman) {
	 		if(has_linkman>=1){
	 			location.href='${ctx }/servlet/defaultDispatcher?__action=backMoney.payMoneyManagerByOne&isSalesDesk=Y&lease_code='+code+'&CREDIT_ID='+id;
	 		}else {
	 			alert("请先维护客户联系人！");
	 		}
	 	}
	 	
	 	function maintainExpectedDate(credit_id) {
	 		$("#expectedDate").dialog({
				modal:true,
				autoOpen:false,
				width:400
			});
	 		$("#EXPECTED_DATE_CREDIT_ID").val(credit_id);
			$("#expectedDate").dialog('open');
	 	}
	 	
	 	function saveExpectedDate() {
	 		if($("#EXPECTED_DATE_REMARK").val()=='') {
	 			alert("备注不能为空!");
	 			return;
	 		}
	 		$.ajax({
				  type:"post",
				  url:"${ctx }/servlet/defaultDispatcher",
				  data:"__action=rentContract.saveExpectedDate&CREDIT_ID="+$("#EXPECTED_DATE_CREDIT_ID").val()+"&EXPECTED_DATE="+$("#EXPECTED_DATE").val()+"&EXPECTED_DATE_REMARK="+$("#EXPECTED_DATE_REMARK").val(),
				  dataType:"json",
				  success:function(data) {
					  if(data) {
						  alert("更新成功!");
					  } else {
						  alert("更新失败!");
					  }
					  $("#expectedDate").dialog('close');
				  }
			 });
	 	}
	 	
	 	function rentFileUpload(id,CONTRACT_TYPE){
	 		
	 	    $("#rentfile").toggle(function(){
	 	        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFileForUpload&prcd_id=" + id + "&cardFlag=2&CONTRACT_TYPE="+CONTRACT_TYPE);
	 	        
	 			$("#rentfile").dialog({
	 			        modal: true,
	 			        autoOpen: false,
	 			        width: 950,
	 			        title:'合同资料上传'
	 			    });
	 			    $("#rentfile").dialog('open');        
	 	    });
	 	}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContract.queryRentContractForShow" />
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">已核准客户清单</c:if><c:if test="${isSalesDesk ne 'Y' }">合同浏览</c:if></span>
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
						<td>
					公司別：
					</td>
					<td>
					<select name="companyCode" style=" height: 18px;">
							<option value="">
								全部
							</option>
							<option value="1" <c:if test="${companyCode eq 1}">selected='selected'</c:if>>
								裕融
							</option>
							<option value="2" <c:if test="${companyCode eq 2}">selected='selected'</c:if>>
								裕国
							</option>
							</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          	 <td>车牌号：</td>
				          <td>
				          	<input type="text" name="CAR_NUMBER" value="${CAR_NUMBER}">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch()"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table style="width: 100%;">
						<tr >
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
										案件进度
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
										供货商
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
										<td style="text-align: center;"><input type="checkbox" value="${item.PRCD_ID }"  name ="credit_idxx"></td>
										<c:if test="${isSalesDesk ne 'Y' }">
											<td style="text-align: center;cursor: pointer;" onClick="expandForShow('pactAffix${item.PRCD_ID}','${item.PRCD_ID }','${item.RECT_ID }','manage','${item.STATUS }','${item.CONTRACT_TYPE }');" style="cursor: pointer;"><!-- 	[${item.PRCD_STATUS }|${item.RECT_STATUS }] --><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}"><img src="${ctx }/images/u604.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS == 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
										</c:if>
										<c:if test="${isSalesDesk eq 'Y' }">
											<td style="text-align: center;cursor: pointer;" onClick="expandForShow('pactAffix${item.PRCD_ID}','${item.PRCD_ID }','${item.RECT_ID }','manage','${item.STATUS }','${item.CONTRACT_TYPE }');" style="cursor: pointer;"><c:if test="${item.RECT_STATUS eq null}">未初审</c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}">已初审</c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}">正常结清</c:if><c:if test="${item.RECP_STATUS == 3}">提前结清</c:if><c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}">已复核</c:if></c:if><c:if test="${item.RECT_STATUS eq 2}">复核驳回</c:if></c:if><c:if test="${item.STATUS eq -1}">作废</c:if></td>
										</c:if>
										<!-- Add by Michael 2012 07-13 增加案件号 -->
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.AREA }</td>
										<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BRAND }&nbsp;</td>
										<td style="text-align: center;">&nbsp;<c:if test='${item.LESSOR_TIME!=null && item.LESSOR_TIME!="" &&item.LESSOR_TIME!="1900-01-01 00:00:00.0"}'><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;"><%@ include file="/rentcontract/taglibForShow.jsp"%></td>
									</tr>
									<tr>
										<th colspan="11" class="pact">
											<div id="pactAffix${item.PRCD_ID}" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</th>
									</tr>
								</c:forEach>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<c:if test="${isSalesDesk ne 'Y' }">
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
						</c:if>
				</div>
				</div>
				</div>
			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
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

		<!--  日志弹出层结束  -->
		
		<c:if test="${isSalesDesk eq 'Y' }">
			<div title="维护预计支付日" style="display: none" id="expectedDate">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          		<div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv "><input type="hidden" id="EXPECTED_DATE_CREDIT_ID"><br>
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
									<td style="text-align:right">预计支付日<font style="color:red;">*</font>&nbsp;</td>
									<td><input id="EXPECTED_DATE" name="EXPECTED_DATE" readonly="readonly" style="width: 120px"></td>
								</tr>
								<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
									<td style="text-align:right">备注<font style="color:red;">*</font>&nbsp;</td>
									<td><textarea id="EXPECTED_DATE_REMARK" name="EXPECTED_DATE_REMARK" cols="17" rows="5" style="width: 120px"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><br><input style="cursor: pointer;" type="button" value="保存" class="ui-state-default ui-corner-all" onclick="saveExpectedDate()"><input style="cursor: pointer;" type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="$('#expectedDate').dialog('close');"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</body>
</html>