<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
//网页内按下回车触发 搜索按钮 
	$(function(){
		$("#Record_LINK_DATE").datepicker($.datepicker.regional['zh-CN']);
		userDropDownList($("#newName"));
	});
document.onkeydown=showEntey;
function showEntey(event){    
		//alert(event.keyCode);
        if(event.keyCode==13)
        {
                doSearch();   
                                              
        }
 } 

showCust = function (cust_id,cust_type){
	$("#__action").val("customer.readCust");
	$("#cust_id").val(cust_id);
	$("#cust_type").val(cust_type);
	$("#dispatcherForm").submit();

}
updateCust = function (cust_id,cust_type){
	$("#__action").val("customer.updateCust");
	$("#cust_id").val(cust_id);
	$("#cust_type").val(cust_type);
	$("#dispatcherForm").submit();

}

function updateTypeDiv(id){
	if(checkCreditExist('TYPE',id)){
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=productType.getProductTypeById&id="+id,
			dataType:"json",
			success:function(dataBack){
			    $("#id").val(dataBack.productType.ID);	
			    $("#Manufacturer").val(dataBack.productType.MANUFACTURER);						
			    $("#name").val(dataBack.productType.NAME);						
			    $("#memo").val(dataBack.productType.MEMO);						
				$('#updateProductType').dialog({
					modal:true,
					autoOpen: false							
				});
				$('#updateProductType').dialog('open');
			},
		});	
	}
}

//Modify by Michael 删除此承租人时，要检查是否有关联合同，有关联合同不允许删除
deleteCust = function (cust_id){
	var msg = "您确定要删除此承租人吗？";
	if (confirm(msg)){
		if (checkCustContractExist(cust_id)){
			$("#__action").val("customer.deleteCust");
			$("#cust_id").val(cust_id);
			$("#dispatcherForm").submit();
		}
	}
}

function checkCustContractExist(cust_id){
	var flag = true ;
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher",
		data:"__action=customer.checkCustContractExist&cust_id="+cust_id,
		dataType:"json",
		async: false,
		success:function(dataBack){
			if(dataBack.count == 1){
				alert("该客户有联案件不能进行操作，如有疑问请洽资讯人员！") ;
				flag = false ;
			} 
		},
		error:function(error){
			alert("error") ;
		}
	});
	return flag ;
}

//客户成本差异
//custDifferentToExcel = function(cust_id,cust_name){
//	$("#__action").val("differentReport.customerExpDifferentToExcel");
//	$("#cust_id").val(cust_id);
//	$("#cust_name").val(cust_name);
//$("#dispatcherForm").submit();
//}
initCreate = function (ctx){
	window.location.href=ctx+"/servlet/defaultDispatcher?__action=customer.initCreate&isSalesDesk="+$("#isSalesDesk").val();
}

function showRecord(cust_id) {
	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=customer.getIntentAndImportRecord&isSalesDesk='+$("#isSalesDesk").val(),
		dataType:'json',
		success:function(dataBack) {
		 	$('#IMPORTANT_RECORD option').each(function() {  
	            $(this).remove();  
		 	});
	 		$('#INTENT option').each(function() {  
	         	$(this).remove();  
		 	});
			for(var i=0;i<dataBack.intentList.length;i++) {
				$("#INTENT").get(0).options.add(new Option(dataBack.intentList[i].FLAG,dataBack.intentList[i].CODE)); 
			}
			for(var i=0;i<dataBack.importRecordList.length;i++) {
				$("#IMPORTANT_RECORD").get(0).options.add(new Option(dataBack.importRecordList[i].FLAG,dataBack.importRecordList[i].CODE)); 
			}
			$("#Record_LINK_DATE").val(dataBack.date);
		}
	});
	$("#cust_id").val(cust_id);
	showDialogbyName('AddCustLinkRecord');
}

	 function showDialogbyName(divName) {
		
		$('#'+divName).dialog({
			modal:true,
			autoOpen: false	,
			width:660,
		});
		$('#'+divName).dialog('open');	
	 }
 
	function getImportanceRecord() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=customer.getImportanceRecord&shortName='+$("#INTENT").val(),
			dataType:'json',
			success:function(dataBack){ 
				 $('#IMPORTANT_RECORD option').each(function() {  
				     if($(this).val() != '-1') {  
				         $(this).remove();  
				     }  
				 });
				for(var i=0;i<dataBack.length;i++) {
					$("#IMPORTANT_RECORD").get(0).options.add(new Option(dataBack[i].FLAG,dataBack[i].CODE)); 
				}
			}
		});
	}
	
	function saveCustomerRecord() {
		var custId=$("#cust_id").val();
		var Record_LINK_PRINCIPAL = $.trim($("#Record_LINK_PRINCIPAL").val());
		var Record_LINK_DETAILS = $.trim($("#Record_LINK_DETAILS").val());
		var Record_LINK_DATE = $.trim($("#Record_LINK_DATE").val());
		var FROM_TIME=$("#FROM_HOUR").val()+":"+$("#FROM_MIN").val();
		var TO_TIME=$("#TO_HOUR").val()+":"+$("#TO_MIN").val();
		
		var param = {"CUST_ID":custId,
				"LINK_PRINCIPAL":Record_LINK_PRINCIPAL,"LINK_THEME":" ",
				"LINK_DETAILS":Record_LINK_DETAILS,"LINK_DATE":Record_LINK_DATE,
				"LINK_MEMO":" ","TYPE":"0","SELLOPPORTUNITY":" ","CULM_ID":"0",
				"INTENT":$("#INTENT").val(),"IMPORTANT_RECORD":$("#IMPORTANT_RECORD").val(),"FROM_TIME":FROM_TIME,"TO_TIME":TO_TIME,
				"__action":"customerlink.createCustLinkRecord"
			};
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:param,
			dataType:'json',
			success:function(dataBack){ 
				 alert("保存成功!");
				 $('#AddCustLinkRecord').dialog('close');
				 $('#Record_LINK_DETAILS').val('');
			}
		});
	}
	
	function custShift(cust_id){
		$("#cust_id_shift").val(cust_id);
		$("#custShiftDiv").dialog({
			modal:true,
			autoOpen: false
			
		});
		$("#custShiftDiv").dialog("open");
	}
	
	function exportExcel(){
		location.href="${ctx}/servlet/defaultDispatcher?__action=customer.exportCustomerInfo";
	}
</script>

	</head>
	<body>
	<form id="dispatcherForm" name="dispatcherForm" method="POST" action="${ctx}/servlet/defaultDispatcher">
		<input type="hidden" name="__action" id="__action" value="" />
		<input type="hidden" name="cust_id" id="cust_id" value="0" />
		<input type="hidden" name="cust_type" id="cust_type" value="-1" />
		<input type="hidden" name="isSalesDesk" value="${isSalesDesk }" />
		<!--客户成本差异<input type="hidden" name="cust_name" id="cust_name" value=""/> -->
	</form>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=customer.query">
			<input type="hidden" name="__action" value="customer.query" />
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">客户维护清单</c:if><c:if test="${isSalesDesk ne 'Y' }">客户信息</c:if></span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td><!-- 承租人类型 --></td>
				          <%-- <select name="cust_type">
								<option value="" >不限</option>
								<option value="0" <c:if test="${cust_type eq 0}">selected="selected"</c:if>>自然人</option>
								<option value="1" <c:if test="${cust_type eq 1}">selected="selected"</c:if>>法人</option>
							</select> --%>
							<td>
							公司别：
							<select name="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
							</td>
				          <td>查询内容：</td>
				          <td><input type="text" name="searchValue" value="${searchValue }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		<c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="supplier()">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray" disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="资料中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="dataOnGoing()">
						&nbsp;&nbsp;<input type="button" value="访厂客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="access()">
						&nbsp;&nbsp;<input type="button" value="审查中客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="audit()">
						&nbsp;&nbsp;<input type="button" value="已核准客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="approve()">
						&nbsp;&nbsp;<input type="button" value="待补文件清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="pending()">
						&nbsp;&nbsp;<input type="button" value="延滞客户清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="delay()">
		          		&nbsp;&nbsp;<input type="button" value="案件查询" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="caseQuery()">
		          		</div>
		          		<br>
	          		</c:if>
			<div class="ui-state-default ui-jqgrid-hdiv "><%--
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
		--%>
		<!-- 屏蔽导出客户信息功能 -->
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td>&nbsp;&nbsp;<c:if test="${add == true }"><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="initCreate('${ctx}');"  value="添加"/></c:if></td><td><!-- <input type="button" value="导出客户信息" class="ui-state-default ui-corner-all" onclick="exportExcel()"/> --></td><td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>

		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人类型
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人名称
					</th>
					<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
						类别
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						虚拟帐号
					</th>
					<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">
						创建时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						最后一次修改时间
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						主要联系人
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						联系人手机
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						邮寄地址
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						创建人
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<%-- <a href="javascript:void(0)" onclick="initCreate('${ctx }')">添加</a> --%>
						操作
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }</td>
					<%-- <td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0}">自然人</c:if><c:if test="${item.CUST_TYPE eq 1}">法人</c:if></td> --%>
					<td style="text-align: center;">${item.CUST_CODE }</td>
					<td style="text-align: center;">${item.CUST_NAME }</td>
					<%-- <td style="text-align: center;"><c:forEach items="${custLevel}" var="level"><c:if test="${item.CUST_LEVEL eq level.CODE}">${level.FLAG}</c:if></c:forEach></td> --%>
					<td style="text-align: center;">${item.VIRTUAL_CODE }&nbsp;</td>
					<%-- <td style="text-align: center;"><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${item.CREATE_TIME}"/></td>
					<td style="text-align: center;"><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${item.MODIFY_TIME}"/></td> --%>
					<td style="text-align: center;">${item.LINK_NAME }&nbsp;</td>
					<td style="text-align: center;">${item.LINK_MOBILE }&nbsp;</td>
					<td style="text-align: center;">${item.LINK_WORK_ADDRESS }&nbsp;</td>
					<td style="text-align: center;">${item.NAME }</td>
					<td style="text-align: center;">
						<a href="javascript:void(0)" onclick="showCust('${item.CUST_ID }','${item.CUST_TYPE }');">查看</a>
						<c:if test="${modify == true }">&nbsp;
							<a href="javascript:void(0)" onclick="updateCust('${item.CUST_ID }','${item.CUST_TYPE }');">修改</a>
						</c:if>
						<c:if test="${addContractMan == true }">&nbsp;
							<a href="javascript:void(0)" onclick="showRecord('${item.CUST_ID }')">添加联系记录</a>
						</c:if>
						<c:if test="${custShift}">&nbsp;
							<a href="javascript:void(0)" onclick="custShift('${item.CUST_ID }')">转移</a>
						</c:if>
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
<div id="custShiftDiv" style="display: none;" title="客户转移">
	<form action="${ctx}/servlet/defaultDispatcher?__action=customer.custShift" method="post" id="custShiftForm" name="custShiftForm">
		<input type="hidden" name ="cust_id" id="cust_id_shift"  />
		<table class="panel_table">
			<tr>
				<th width="30%">客户经理</th>
				<td>
					<input type="text" class="panel_text" style="width: 200px;" name="newName" id="newName"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="转移" class="ui-state-default ui-corner-all" />
				</th>
			</tr>
		</table>
	</form>
</div>
<div id="AddCustLinkRecord" style="display: none" title="添加联系记录">
	<form action="#" method="post" id="divAddCustLinkRecordForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 40px;">负责人</td>
						<td style="width: 80px;"><input type="text" name="LINK_PRINCIPAL" id="Record_LINK_PRINCIPAL" readonly="readonly" value="${s_employeeName }"></td>
						<td style="width: 40px;">日期</td>
						<td style="width: 80px;"><input type="text" name="LINK_DATE" readonly="readonly" id="Record_LINK_DATE" value="${date }"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>开始时间</td>
					<td><select id="FROM_HOUR" class="tb_return_t" style="width:40px;" name="FROM_HOUR">
						<option value="7">07</option>
						<option value="8">08</option>
						<option value="9">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						</select>:<select id="FROM_MIN" class="tb_return_t" style="width:40px;" name="FROM_MIN">
						<option value="0">00</option>
						<option value="30">30</option></select></td>
					<td>结束时间</td>
					<td><select id="TO_HOUR" class="tb_return_t" style="width:40px;" name="TO_HOUR">
						<option value="7">07</option>
						<option value="8">08</option>
						<option value="9">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option selected="selected" value="23">23</option>
						</select>:<select id="TO_MIN" class="tb_return_t" style="width:40px;" name="TO_MIN">
						<option value="0">00</option>
						<option selected="selected" value="30">30</option>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>目的</td>
						<td><select id="INTENT" name="INTENT" onchange="getImportanceRecord()">
									<c:forEach items="${intentList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
						<td>重点记录</td>
						<td><select id="IMPORTANT_RECORD" name="IMPORTANT_RECORD">
									<c:forEach items="${importRecordList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td colspan="3"><textarea name="LINK_DETAILS" id="Record_LINK_DETAILS" cols="80" rows="3"></textarea></td>
			    </tr>
							</table>
							<center>
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="saveCustomerRecord()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkRecordst" >
							<br>
							</center>
							</div>
							</div>
							</div>
	</form>
</div>

	</body>
</html>