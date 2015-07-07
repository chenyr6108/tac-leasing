<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<title>供应商管理</title>
	</head>
	<script type="text/javascript" src="${ctx }/supplier/js/supplier.js"></script>
	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	<script type="text/javascript"> 
	
	$(function(){
		$("#Record_LINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	});
	
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
	
	//网页内按下回车触发 搜索按钮 
	document.onkeydown=showEntey;
	        function showEntey(event){    
	        if(event.keyCode==13)
	        {
	        	doSearch();                              
	        }
	 }  
	// flag 控制页面跳转向查看或修改页面  
	showMsg = function(id) {
		window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.findSupplierById&flag=1&id="+id ;
	};
	updateMsg = function(id,name) {
			window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.findSupplierById&SUPLNAME="+name+"&flag=2&id="+id+"&isSalesDesk="+$("#isSalesDesk").val();
	};
	report = function(id,name) {
		window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplierReports.getSupplierReports&SUPLNAME="+name+"&id="+id+"&supplier_id="+id+"&showFlag=1" ;
	};
		var suplEquCount = 0;
		//查看该供应商在设备库中提供的设备
					function isHaveSuplEqu(id){
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=suplEquipment.getCountBySupplierId&supplier_id=' + id,
							dataType:'json',
							async: false,
							success: function(dataBack){		
							suplEquCount = dataBack.count;	
							},
							error:function(callback){
								alert("error!");
								return;
							}
						});
					}
	deleteMsg = function(id) {
		if(checkCreditExist('SUPPL',id)){      
			isHaveSuplEqu(id);
			if(suplEquCount == 0) {
				if(confirm('您确定要删除此供应商吗？')){
					window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.deleteSupplierById&id="+id+"&isSalesDesk="+$("#isSalesDesk").val();
				}else{
					return false;
				}
			}else{
				alert("该供应商提供了设备，需删除设备库中相应设备，才能删除供应商！！");
				return false;
			}
		}
	}
	addSupplier = function() {
		window.location.href="${pageContext.request.contextPath}/product/supplier/supplierAdd.jsp?isSalesDesk="+$("#isSalesDesk").val();
	}
	function checkCreditExist(type,id){
		var str = '' ;
		if(type == "SUEQ"){
			str = "供应商产品" ;
		} else if(type == "SUPPL"){
			str = "供应商" ;
		} else if(type == "TYPE"){
			str = "制造商" ;
		} else if(type == "PRODUCT"){
			str = "产品型号" ;
		} else if(type == "KIND"){
			str = "产品名称" ;
		} 
		var flag = true ;
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=suplEquipment.checkCreditExist&checkType="+type+"&ID="+id,
			dataType:"json",
			async: false,
			success:function(dataBack){
				if(dataBack.count == 1){
					alert("该"+str+"已关联案件不能进行操作！") ;
					flag = false ;
				} else if(dataBack.count == 2){
					if(!confirm("该"+str+"已关联案件是否继续操作？")){
						flag = false ;
					}
				}
			},
			error:function(error){
				alert("error") ;
			}
		});
		return flag ;
	}
	
	function updateMaintainUserId(flag,supplier_id) {
		var time=flag;
		var USER_ID=0;
		if(flag==1) {
			USER_ID=$("#FIRST_MAINTAIN_USER_ID"+supplier_id).val();
		} else if(flag==2) {
			USER_ID=$("#SECOND_MAINTAIN_USER_ID"+supplier_id).val();
		}
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=supplier.updateMaintainUserId&flag="+flag+"&supplier_id="+supplier_id+"&USER_ID="+USER_ID,
			dataType:"json",
			async: false,
			success:function(dataBack){
				if(dataBack) {
					alert("第"+time+"维护人更新成功!");
				} else {
					alert("第"+time+"维护人更新失败!");
				}
			}
		});
	}
	
	$(document).ready(function(){
		
        var content1 = {
            tipInfo: "<H5>更新供应商第一维护人</H5>"
        };
        var content2 = {
                tipInfo: "<H5>更新供应商第二维护人</H5>"
            };
        $("input[name=updateMaintain1]").showTip(content1);
        $("input[name=updateMaintain2]").showTip(content2);  

    });
	
	function closeAddSupplLinkRecord(){
		$('#AddSupplLinkRecord').dialog('close');
	}
	
	function showDivAddSupplRecord(id){
		var suppl_id = id;
		$("#suppl_id").val(suppl_id);
		$('#AddSupplLinkRecord').dialog({
			modal:true,
			autoOpen: false	,
			width:660,
		});
		$('#AddSupplLinkRecord').dialog('open');
		
	}
	
	//添加联系记录
	function submitAddSupplLinkRecord() {
		
		//验证时间大小
		if(parseInt($("#TO_HOUR").val())<parseInt($("#FROM_HOUR").val())) {
			alert("开始时间应该小于结束时间!");
			return;
		} else if(parseInt($("#TO_HOUR").val())==parseInt($("#FROM_HOUR").val())) {
			if(parseInt($("#FROM_MIN").val())!=0) {
				alert("开始时间应该小于结束时间!");
				return;
			} else {
				if(parseInt($("#TO_MIN").val())==0) {
					alert("开始时间应该小于结束时间!");
					return;
				}
			}
		}
		
		var suppl_id = $.trim($("#suppl_id").val());
		var Record_LINK_PRINCIPAL = $.trim($("#Record_LINK_PRINCIPAL").val());
		var Record_LINK_THEME = $.trim($("#Record_LINK_THEME").val());
		var Record_LINK_DETAILS = $.trim($("#Record_LINK_DETAILS").val());
		var Record_LINK_DATE = $.trim($("#Record_LINK_DATE").val());
		var Record_LINK_MAN = $.trim($("#Record_LINK_MAN").val());
		var SELLOPPORTUNITY = $.trim($("#Record_SELLOPPORTUNITY").val());
		var Record_LINK_TYPE = $.trim($("#Record_LINK_TYPE").val());
		var Record_LINK_MEMO = $.trim($("#Record_LINK_MEMO").val());
		
	/*	if (Record_LINK_PRINCIPAL == ''){
			alert("请输入联系记录的负责人！");
			return ;
		}
		if (Record_LINK_THEME == ''){
			alert("请输入联系记录的主题！");
			return ;
		}
		if (Record_LINK_DATE == ''){
			alert("请输入联系记录的日期！");
			return ;
		}*/
		if (Record_LINK_DETAILS == ''){
			alert("请输入联系记录的内容！");
			return ;
		}
		
		var FROM_TIME=$("#FROM_HOUR").val()+":"+$("#FROM_MIN").val();
		var TO_TIME=$("#TO_HOUR").val()+":"+$("#TO_MIN").val();
		
		var param = {"suppl_id":suppl_id,
			"LINK_PRINCIPAL":Record_LINK_PRINCIPAL,"LINK_THEME":Record_LINK_THEME,
			"LINK_DETAILS":Record_LINK_DETAILS,"LINK_DATE":Record_LINK_DATE,
			"LINK_MEMO":Record_LINK_MEMO,"TYPE":Record_LINK_TYPE,"SELLOPPORTUNITY":SELLOPPORTUNITY,"CULM_ID":Record_LINK_MAN,
			"INTENT":$("#INTENT").val(),"IMPORTANT_RECORD":$("#IMPORTANT_RECORD").val(),"FROM_TIME":FROM_TIME,"TO_TIME":TO_TIME,		
			"__action":"supplier.createSupplLinkRecord"
		};
		
		$("#divAddSupplLinkman").css("z-index",0);
		
		$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack){
				 alert("新建成功!");
				 $('#AddSupplLinkRecord').dialog('close');
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				
				$('#AddSupplLinkRecord').dialog('close');
				return ;
			}
		
		});
	}
	
	function addRow() {
		
		var param = {"suppl_id":$("#SUPPLIER_ID").val(),"__action":"supplier.getAreaMaintenance"};
		
		$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack) {
				var tableName=document.getElementById("dataTable");
				var row=tableName.insertRow(tableName.rows.length);
				//var sed=tableName.rows.length;
				
				cell=row.insertCell(0); 
				cell.align='center'; 
				cell.className='ui-widget-content jqgrow ui-row-ltr';
				var deptOption="";
				for(var i=0;i<databack.deptList.length;i++) {
					deptOption=deptOption+"<option value='"+databack.deptList[i].deptId+"'>"+databack.deptList[i].deptName+"</option>";
				}
				cell.innerHTML="<select name='DEPT_ID'>"+deptOption+"</select>";
				cell=row.insertCell(1); 
				cell.align='center'; 
				cell.className='ui-widget-content jqgrow ui-row-ltr';
				var userList="";
				for(var i=0;i<databack.employeeList.length;i++) {
					userList=userList+"<option value='"+databack.employeeList[i].EMPLOYEEID+"'>"+databack.employeeList[i].NAME+"</option>";
				}
				cell.innerHTML="<select name='FIRST_MAINTAIN_USER_ID'>"+userList+"</select>";
				cell=row.insertCell(2);
				cell.align='center'; 
				cell.className='ui-widget-content jqgrow ui-row-ltr';
				cell.innerHTML="<select name='SECOND_MAINTAIN_USER_ID'>"+userList+"</select>";
				
				cell=row.insertCell(3); 
				cell.align='center'; 
				cell.className='ui-widget-content jqgrow ui-row-ltr';
				cell.innerHTML='<input type=\"button\" onclick=\"delRow.call(this)\" class=\"ui-state-default ui-corner-all\" style=\"cursor: pointer;\" value=\"删除\">';
				row.appendChild(cell);
			}, error:function(callback) {
				alert("网络错误，请稍后重试或联系系统管理员！");
				$('#maintenanceDiv').dialog('close');
				return;
			}
		});
	}
	
	function delRow() {
        var tr=this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
	}
	
	function showProgressbar(){
		$("#progressbar").dialog({
			closeOnEscape : false,
			open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
			modal : true,
			resizable : false,
			draggable : false,
			title : "数据加载中... ..."
		});
	}
	
	function closeProgressbar(){
		$("#progressbar").dialog("close");
	}
	
	function showDivMaintenance(id,name) {
		showProgressbar();
		var param={"suppl_id":id,"__action":"supplier.getAreaMaintenance"};
		$("#SUPPLIER_ID").val(id);
		var SUPL_NAME=name;
		
		$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack) {
				$('#maintenanceDiv').dialog('open');
				var trs=document.getElementsByName("DEPT_ID");
				var deleteRows=document.getElementById("dataTable").rows.length;
				for(var i=trs.length-1;i>=0;i--) {
					$("#dataTable").find("tr").eq(i+2).remove();
				}
				
				$('#SUPPLIER_NAME').html("<b>供应商名称</b>：<font style='font-style: normal;'>"+SUPL_NAME+"</font>");
				if(databack.resultList.length!=0) {
					
					for(var i=0;i<databack.resultList.length;i++) {
						
						var tableName=document.getElementById("dataTable");
						var row=tableName.insertRow(tableName.rows.length);
						cell=row.insertCell(0); 
						cell.align='center'; 
						cell.className='ui-widget-content jqgrow ui-row-ltr';
						var deptOption="";
						
						//加入地区别
						for(var j=0;j<databack.deptList.length;j++) {
							if(databack.resultList[i].DEPT_ID==databack.deptList[j].deptId) {
								deptOption=deptOption+"<option value='"+databack.deptList[j].deptId+"' selected='selected'>"+databack.deptList[j].deptName+"</option>";
							} else {
								deptOption=deptOption+"<option value='"+databack.deptList[j].deptId+"'>"+databack.deptList[j].deptName+"</option>";
							}
						}
						cell.innerHTML="<select name='DEPT_ID'>"+deptOption+"</select>";
						
						//加入第一维护人
						cell=row.insertCell(1); 
						cell.align='center'; 
						cell.className='ui-widget-content jqgrow ui-row-ltr';
						var firstOption="";
						
						for(var j=0;j<databack.employeeList.length;j++) {
							if(databack.resultList[i].FIRST_MAINTAIN_USER_ID==databack.employeeList[j].EMPLOYEEID) {
								firstOption=firstOption+"<option value='"+databack.employeeList[j].EMPLOYEEID+"' selected='selected'>"+databack.employeeList[j].NAME+"</option>";
							} else {
								firstOption=firstOption+"<option value='"+databack.employeeList[j].EMPLOYEEID+"'>"+databack.employeeList[j].NAME+"</option>";
							}
						}
						cell.innerHTML="<select name='FIRST_MAINTAIN_USER_ID'>"+firstOption+"</select>";
						
						//加入第二维护人
						cell=row.insertCell(2); 
						cell.align='center'; 
						cell.className='ui-widget-content jqgrow ui-row-ltr';
						var secondOption="";
						
						for(var j=0;j<databack.employeeList.length;j++) {
							if(databack.resultList[i].SECOND_MAINTAIN_USER_ID==databack.employeeList[j].EMPLOYEEID) {
								secondOption=secondOption+"<option value='"+databack.employeeList[j].EMPLOYEEID+"' selected='selected'>"+databack.employeeList[j].NAME+"</option>";
							} else {
								secondOption=secondOption+"<option value='"+databack.employeeList[j].EMPLOYEEID+"'>"+databack.employeeList[j].NAME+"</option>";
							}
						}
						cell.innerHTML="<select name='SECOND_MAINTAIN_USER_ID'>"+secondOption+"</select>";
						
						cell=row.insertCell(3); 
						cell.align='center'; 
						cell.className='ui-widget-content jqgrow ui-row-ltr';
						cell.innerHTML='<input type=\"button\" onclick=\"delRow.call(this)\" class=\"ui-state-default ui-corner-all\" style=\"cursor: pointer;\" value=\"删除\">';
						
						row.appendChild(cell);
					}
				}
				closeProgressbar();
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				$('#maintenanceDiv').dialog('close');
				return ;
			}
		
		});
		$('#maintenanceDiv').dialog({
			modal:true,
			autoOpen: false	,
			width:660,
		}); 
	}
	
	function updateMaintenance() {
		var deptIds="";
		var firstIds="";
		var secondIds="";
		for(var i=0;i<$('select[name=DEPT_ID]').length;i++) {
			deptIds=deptIds+$('select[name=DEPT_ID]').eq(i).val()+",";
			firstIds=firstIds+$('select[name=FIRST_MAINTAIN_USER_ID]').eq(i).val()+",";
			secondIds=secondIds+$('select[name=SECOND_MAINTAIN_USER_ID]').eq(i).val()+",";
		}
		if($('select[name=DEPT_ID]').length==0) {
			alert("没有数据保存！");
			return;
		}
		if(confirm("确定保存？")) {
			var param = {"suppl_id":$("#SUPPLIER_ID").val(),"__action":"supplier.updateAreaMaintenance",
						 "DEPT_ID":deptIds,
						 "FIRST_MAINTAIN_USER_ID":firstIds,
						 "SECOND_MAINTAIN_USER_ID":secondIds};
			$.ajax({
				type:"POST",
				data:param,
				url:"../servlet/defaultDispatcher",
				dataType:"json",
				success:function(databack) {
					alert("更新成功！");
					$('#maintenanceDiv').dialog('close');
				},
				error:function(callback){
					alert("网络错误，请稍后重试或联系系统管理员！");
					$('#maintenanceDiv').dialog('close');
					return ;
				}
			
			});
		}
	}
	
	function doThisSearch(){
		var re = /^\d+$/;
		if ($("#searchMonth").val() != "" && !$("#searchMonth").val().match(re)) {
			alert("月数只能是整数。");
			return;
		}
		$("#form1").submit();
	}
	
	$(function (){
		$("#searchMonth").bind("input", function (){
			var re = /^\d+$/;
			if ($(this).val() != "" && !$(this).val().match(re)) {
				$(this).attr("className", "panel_text_error");
			} else {
				$(this).attr("className", "panel_text");
			}
		});
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		var re = /^\d+$/;
		if ($("#searchMonth").val() != "" && !$("#searchMonth").val().match(re)) {
			$("#searchMonth").attr("className", "panel_text_error");
		} else {
			$("#searchMonth").attr("className", "panel_text");
		}
	});
	
</script>
	<body>
		<div id="progressbar" style="display: none; vertical-align: middle; text-align: center; padding-top: 45px;">
			<img src="${ctx }/images/loading.gif">
		</div>
		<form id="form1" method="POST" action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" value="supplier.findAllSupplier" />
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;<c:if test="${isSalesDesk eq 'Y' }">供应商维护清单</c:if><c:if test="${isSalesDesk ne 'Y' }">供应商管理</c:if></span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
				      <tr>
				        <td>
				          	供应商型别：<select id="SUPP_TYPE" name="SUPP_TYPE" class="panel_select">
				          		<option value="">所有</option>
				          		<option value="0" <c:if test="${SUPP_TYPE eq '0' }">selected="selected"</c:if>>非大型供应商</option>
				          		<option value="1" <c:if test="${SUPP_TYPE eq '1' }">selected="selected"</c:if>>大型供应商</option>
				          	</select>
				          &nbsp;&nbsp;区域：<select id="LICENCE_ADDRESS" name="LICENCE_ADDRESS" class="panel_select"><option value="">所有</option><c:forEach var="item" items="${areaList }"><option value="${item.CODE }" <c:if test="${item.CODE eq LICENCE_ADDRESS }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>
				          &nbsp;&nbsp;评级：<select id="SUPP_LEVEL" name="SUPP_LEVEL" class="panel_select">
				          						<option value="">所有</option>
				          						<option value="A" <c:if test="${SUPP_LEVEL eq 'A' }">selected="selected"</c:if>>A</option>
				          						<option value="2A" <c:if test="${SUPP_LEVEL eq '2A' }">selected="selected"</c:if>>2A</option>
				          						<option value="3A" <c:if test="${SUPP_LEVEL eq '3A' }">selected="selected"</c:if>>3A</option>
				          						<option value="4A" <c:if test="${SUPP_LEVEL eq '4A' }">selected="selected"</c:if>>4A</option>
				          						<option value="5A" <c:if test="${SUPP_LEVEL eq '5A' }">selected="selected"</c:if>>5A</option>
				          				   </select>
						办事处： <select  name="deptId" style="width:150px" class="panel_select">
									<option value="">--所有办事处--</option>
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.DECP_ID}"
											<c:if test="${dept.DECP_ID eq deptId}">selected='selected'</c:if>>${dept.DECP_NAME_CN}</option>
									</c:forEach>
								</select>				        
				        </td>
				      </tr>
				      <tr>
				      	<td>
				      		供应商名称：<input type="text" id="searchValue" name="searchValue" value="${searchValue }" class="panel_text" style="width:150px;">
				      		&nbsp;&nbsp;
				      		<input type="text" name="searchMonth" id="searchMonth" value="${searchMonth }" class="panel_text" style="width: 30px;"/>月内未有往来记录
				      	</td>
				      </tr>
				    </table>
				 </td>
				 		<td style="width:50px;" class="ss_bigt" valign="middle">
							<a href="#" name="search" id="search" onclick="doThisSearch();"  class="blue_button">搜 索</a>
						</td>
						<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
				 </tr></table>
				 </div>
				    <c:if test="${isSalesDesk eq 'Y' }">
		          		<br>
		          		<div style="text-align: center">
						&nbsp;&nbsp;<input type="button" value="供应商维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer;color:gray"  disabled="disabled">
						&nbsp;&nbsp;<input type="button" value="客户维护清单" class="ui-state-default ui-corner-all" style="cursor:pointer" onclick="customer()">
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
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><c:if test="${add==true}"><input type="button" onclick="addSupplier()" style="padding: 2px 10px;cursor: pointer;" class="ui-state-default ui-corner-all" value="添加"></c:if></td>
					<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th>
						附件
					</th>
					<th>
						供应商名称
					</th>
					<th>
						评级
					</th>
					<th>
						联系人
					</th>
					<th>
						联系电话
					</th>
					<th>
						办事处
					</th>
					<th>
						开户行
					</th>
					<th>
						银行账号
					</th>
					<c:if test="${display==true}">
					<th>
						操作
					</th>
					</c:if>
				</tr>
			<tbody>
				<c:forEach items="${dw.resultList}" var="result" varStatus="status">
					<tr>
						<td style="text-align: center;"><c:if test="${result.ATTACH eq 'Y' }"><img src="${ctx }/images/attach.jpg" title="已有附件上传"></c:if>&nbsp;</td>
						<td style="text-align: center;">${result.NAME}&nbsp;</td>
						<td style="text-align: center;">${result.SUPP_LEVEL}&nbsp;</td>
						<td style="text-align: center;">${result.LINKMAN_NAME }&nbsp;</td>
						<td style="text-align: center;">${result.LINKMAN_MOBILE }&nbsp;</td>
						<td style="text-align: center;">${result.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${result.OPEN_ACCOUNT_BANK }&nbsp;</td>
						<td style="text-align: center;">${result.BANK_ACCOUNT }&nbsp;</td>
						<c:if test="${display==true}">
							<td style="text-align: center;">
								<c:if test="${view==true}"><a href="javascript:void(0)" onclick="report('${result.ID}','${result.NAME}')">查看</a></c:if>
								<c:if test="${modify==true}"><a href="javascript:void(0)" onclick="updateMsg('${result.ID}','${result.NAME}')">修改</a></c:if>
								<c:if test="${delete==true}"><a href="javascript:void(0)" onclick="deleteMsg('${result.ID}')">删除</a></c:if>
								<c:if test="${info==true}"><a href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.showSupplierImage&id=${result.ID}">资料</a></c:if>
								<c:if test="${isSalesDesk eq 'Y'}"><a href="javascript:void(0)" onclick="showDivAddSupplRecord('${result.ID}');">添加联系记录</a></c:if>
								<c:if test="${isSalesDesk ne 'Y' }"><a href="javascript:void(0)" onclick="showDivMaintenance('${result.ID}','${result.NAME }')">维护地区别</a></c:if>
							</td>
					    </c:if>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
				</div>
			</div>
		</form>
		<div id="maintenanceDiv" style="display: none" title="维护地区别">
			<form action="#" method="post" id="maintenanceDivForm">
				<input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="background-color: #FFFFFF">
				    <div class="zc_grid_body jqgrowleft" style="background-color: #FFFFFF">
						<div style="background-color: #FFFFFF;">
						<input value="添加" class="ui-state-default ui-corner-all" type="button" style="cursor: pointer;" onclick="addRow()">
						&nbsp;&nbsp;&nbsp;
							<table id="dataTable">
								<tr>
									<td colspan="4" id="SUPPLIER_NAME">
										
									</td>
								</tr>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 150px;text-align: center;">
										办事处
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 200px;text-align: center;">第一维护人</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 200px;text-align: center;">第二维护人</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 80px;text-align: center;">操作</td>
								</tr>
							</table>
							<div style="text-align: center;"><input type="button" value="保存" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="updateMaintenance()">&nbsp;&nbsp;<input type="button" value="关闭" class="ui-state-default ui-corner-all"  onclick="javascript:$('#maintenanceDiv').dialog('close');" style="cursor: pointer;"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
<c:if test="${isSalesDesk eq 'Y' }">		
		<div id="AddSupplLinkRecord" style="display: none" title="添加联系记录">
	<form action="#" method="post" id="divAddSupplLinkRecordForm">
	<input type="hidden" name="suppl_id" id="suppl_id">
	<input type="hidden" name="Record_LINK_CUSTOMER" id="Record_LINK_CUSTOMER" size="30" value="${rs.NAME}" readonly="readonly">
	<select  id="Record_LINK_MAN" style="display: none;"></select>
	<select name="TYPE" id="Record_LINK_TYPE" style="display: none;"><option value="0">供应商巡视</option><option value="1">日常沟通</option></select>
	<input type="hidden" name="SELLOPPORTUNITY" id="Record_SELLOPPORTUNITY"size="30">
	<textarea name="LINK_MEMO" id="Record_LINK_MEMO"  cols="80" rows="3" style="display: none;"></textarea>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>负责人</td>
						<td><input type="text" name="LINK_PRINCIPAL" id="Record_LINK_PRINCIPAL" value="${s_employeeName }" readonly="readonly"></td>
						<td>日期</td>
						<td><input type="text" name="LINK_DATE" readonly="readonly" id="Record_LINK_DATE" value="${date }"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>开始时间</td>
						<td><input type="hidden" name="Record_LINK_THEME" id="Record_LINK_THEME" size="65" /><select id="FROM_HOUR" class="tb_return_t" style="width:40px;" name="FROM_HOUR">
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
				</tr >
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
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="submitAddSupplLinkRecord()" style="cursor: pointer;">
							<input type="button" value="取消" class="ui-state-default ui-corner-all"  onclick="closeAddSupplLinkRecord()" style="cursor: pointer;">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkRecordst" style="cursor: pointer;">
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
</c:if>
	</body>
</html>