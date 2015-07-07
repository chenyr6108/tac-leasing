<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript" >

	$(function (){
		$(".DATE_SPI").datepicker($.datepicker.regional["zh-CN"]);
	});

	function subCheckPayLines(){
 		var form = document.checkPayForm;
 		if (positive(form.CHECK_MONEY, '支票金额')) {
            return false;
        }
 		if (form.DRAWER.value.trim()=="") {
   	 		alert("出票人不能为空！");
            return false;
        }
 		if (form.CHECKOUT_DATE.value.trim()=="") {
   	 		alert("出票日期不能为空！");
            return false;
        }
 		if (form.CHECK_NUM.value.trim()=="") {
   	 		alert("出票号码不能为空！");
            return false;
        }		
	 	
	    var CUST_NAME = document.getElementsByName("CUST_NAME");
	    var LEASE_CODE = document.getElementsByName("LEASE_CODE");
	    var START_PERIOD_NUM = document.getElementsByName("START_PERIOD_NUM");
	    var END_PERIOD_NUM = document.getElementsByName("END_PERIOD_NUM");
	    
	    if(CUST_NAME.length==0){
   	 		alert("请添加支票合同、期数");
            return false;
	    }
	    for (var i=0;i<CUST_NAME.length;i++){
	   	 	if (CUST_NAME[i].value.trim()=="") {
	   	 		alert("客户名称不能为空！");
	            return false;
	        }
	   	 	if (LEASE_CODE[i].value=="-1") {
	   	 		alert("请选择合同号！");
	            return false;
	        }
	   	 	if (START_PERIOD_NUM[i].value=="-1") {
	   	 		alert("请选择起始期数！");
	            return false;
	        }
	   	 	if (END_PERIOD_NUM[i].value=="-1") {
	   	 		alert("请选择结束期数！");
	            return false;
	        }
	   	 	if(parseInt(START_PERIOD_NUM[i].value)>parseInt(END_PERIOD_NUM[i].value)){
	   	 		alert("起始期数应小于结束期数！");
	            return false;
	   	 	}
	    } 
	    
	    if(form.check_ids.checked){
			document.getElementById("buttonAdd").disabled=true;
			$("#checkPayForm").submit();
	    }else{
   	 		alert("请先勾选确认！");
            return false;
	    }
	}
	
	function positive(field, name) {
		
		if(typeof(field) != "undefined"){
		    var value = field.value;
		    value = value.trim();
		    value = value.replace(/[-￥,]/g, '');
		    
		    if (value==""){
		    	value=0;
		    }

			if(value==0){
				 field.value = value; 
		    }else if (!checkNumber(value)) {
		        alert(name + '只能输入数字！');
		        field.focus();
		        return true;
		    } else if (checkNegative(value)) {
		        alert(name + '必须是一个正数！');
		        field.focus();
		        return true;
		    } else {
		        if (value.substring(0,2) != '0.') {
		            value = value.replace(/^0+/g, '');
		        }
		        field.value = value;
		        return false;
		    }
		}
		
	}
	function checkNegative(checkStr)
	{
	    var regex = /^\-\d+(\.\d+)?$/;

	    return regex.test(checkStr);
	}
	
	function checkNumber(checkStr)
	{
	    var regex = /^[\+\-]?\d+(\.\d+)?$/;

	    return regex.test(checkStr);
	}

	function addCustRentCheckInfoRow(){
		 var tid = document.getElementById("custRentInfo");

		 var row = tid.insertRow(tid.rows.length);

		 addCell(row,0,'CUST_NAME','text',null,'','30',null);	
		 addCell(row,1,'LEASE_CODE','select',null,'','',null);	
		 addCell(row,2,'START_PERIOD_NUM','select',null,'','',null);	
		 addCell(row,3,'END_PERIOD_NUM','select',null,'','',null);	
		 addCell(row,4,'','a',null,'','',null);
		 
		 if((tid.rows.length-1)>=2) {
			 $("#del"+(tid.rows.length-1)).html("");
		 }
	}	
	
	function addCell(row, index, name,type,cls,value,size,height){
		var sed = document.getElementById("custRentInfo").rows.length;
		 var html='';
		 if(type=='text'){
			 	html=html+"<input type='text' onblur='getCustRentLeaseCode(START_PERIOD_NUM"+sed+",END_PERIOD_NUM"+sed+",LEASE_CODE"+sed+",this.value,this);' id='"+name+sed+"' name='"+name+"'  size='"+size+"' value='"+value+"' ";
		 		html=html+"/>";
		 }
		 if(type=='select'&&name=='LEASE_CODE'){
		 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"'  onchange='loadLeaseTerm(START_PERIOD_NUM"+sed+",END_PERIOD_NUM"+sed+",this.value);'>";
		 	html=html+"<option value='-1'>--合同号--</option></select>";	
		 }
		 if(type=='select'&&name=='START_PERIOD_NUM'){
		 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' >"
		 	+"<option value='-1'>--期数--</option></select>";	
		 }
		 if(type=='select'&&name=='END_PERIOD_NUM'){
		 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"'>"
		 	+"<option value='-1'>--期数--</option></select>";	
		 }
		 
		 if(type=='a'){
		 	html=html+"<a href='javascript:void(0)' onclick='deleteRow.call(this)'><span id='del"+sed+"'><img src='../images/u103.gif'>删除</span></a>";
		 }
		 var cell = row.insertCell(index); 
		 cell.align='center';
		 if (height != null) {
	                cell.height = height;
	            }
		 cell.innerHTML =html;
		 row.appendChild(cell);
		 return;
	}
	
	 function deleteRow(){
		 var sed=document.getElementById("custRentInfo").rows.length;
	     if(sed>=3) {
	     	$("#del"+(sed-1)).html("<img src='../images/u103.gif'>删除");
	     }
	        var tr = this.parentNode.parentNode;
	        tr.parentNode.removeChild(tr); 
	        changeField('');
	 }
	
	 function getCustRentLeaseCode(sid1,sid2,id,value,e){
		if(value==""){
			alert("请KeyIn客户名称关键字");
			return false;
		}else{
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:{__action:'rentContract.getAllLeaseCodeByCustName',
					CUST_NAME:value},
				dataType:'json',
				success:function(dataBack){   
		   			var htm="<option value='-1'>--合同号--</option>";
		   			if(dataBack.lease_codes!=null){
			   			for(i=0;i<dataBack.lease_codes.length;i++){
			   				if(i==0){
			   					e.value=dataBack.lease_codes[i].CUST_NAME;
			   					$("#CUST_NAME_R").val(dataBack.lease_codes[i].CUST_NAME);
			   				}
			   				htm=htm+"<option value="+dataBack.lease_codes[i].CREDIT_ID+">"+dataBack.lease_codes[i].LEASE_CODE+"</option>";
			        	}
		        	}
		        	$(id).html(htm);
		        }   
			});
			
	  		var htm1="<option value='-1'>--期数--</option>";
	       	$(sid1).html(htm1);
	       	$(sid2).html(htm1);
		}
	 }
	 
	 function loadLeaseTerm(id1,id2,value){
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=rentContract.getLeaseTermByCreditID&CREDIT_ID='+value,
			dataType:'json',
			success:function(dataBack){   
	   			var htm="<option value='-1'>--期数--</option>";
	   			if(dataBack.lease_term!=null){
		   			for(i=1;i<=dataBack.lease_term;i++){
		   				htm=htm+"<option value="+i+">"+i+"</option>";
		        	}
	        	}
	        	$(id1).html(htm);
	        	$(id2).html(htm);
	        }   
		});
	}
</script>
</head>
<body>
		<form name="checkPayForm" id="checkPayForm" method="POST"  action="../servlet/defaultDispatcher?__action=rentContract.createRentCheckExam">
			<br>
			<table width="800" cellpadding="0" cellspacing="0" border="0"
				align="center">
				<tr>
					<td>
						<div
							class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
							style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;支票支付明细</span>
						</div>
						<div
							class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
							id="main">
							<div class="zc_grid_body jqgrowleft">
								<table cellspacing="0" cellpadding="0" border="0"
									class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
									<tr>
										<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票人</td>				
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票日期</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">支票号码</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">金额</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">备注</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">支票类别</td>											
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">业管确认</td>																						
									</tr>
									<input type="hidden" id="TYPE" name="TYPE" value="${TYPE }" />
									<input type="hidden" id="ID" name="ID" value="${rentCheckDetail.ID }" />
									<input type="hidden" id="CUST_NAME_R" name="CUST_NAME_R" value="${rentCheckDetail.CUST_NAME }" />
									<tr>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DRAWER" value="${rentCheckDetail.DRAWER}" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or item.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>							
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECKOUT_DATE" class="DATE_SPI" style=" width: 80px; height: 18px;" readonly="readonly" value="<c:choose><c:when test="${rentCheckDetail.CHECK_OUT_DATE eq '1900-01-01'}"></c:when><c:otherwise>${rentCheckDetail.CHECK_OUT_DATE}</c:otherwise></c:choose>" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_NUM" value="${rentCheckDetail.CHECK_NUM}" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_MONEY" value="${rentCheckDetail.CHECK_MONEY}" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><select name="MEMO" id="MEMO" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>
											<c:forEach items="${memoList}" var="item1">
														<option value="${item1.FLAG }" <c:if test="${item1.FLAG eq rentCheckDetail.MEMO}">selected="selected"</c:if>>
															${item1.FLAG }
														</option>
											</c:forEach></select>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><select name="CHECK_TYPE" id="CHECK_TYPE" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>
											<c:forEach items="${checkTypeList}" var="item1">
														<option value="${item1.CODE }" <c:if test="${item1.CODE eq rentCheckDetail.CHECK_TYPE}">selected="selected"</c:if>>
															${item1.FLAG }
														</option>
											</c:forEach></select>&nbsp;</td>											
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids" id="check_ids" value="${rentCheckDetail.ID}" style="width:100%;" <c:if test="${not empty rentCheckDetail.HW_CHECK_STATE and rentCheckDetail.HW_CHECK_STATE eq 1}">checked</c:if> <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>/></td>
									</tr>
									<tr>
										<td colspan="6">			
											<table id="custRentInfo" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"> 
												<tr>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">客户名称</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">合同号</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">对应还款期数(起始)</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">对应还款期数(结束)</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">操作&nbsp;&nbsp;&nbsp;&nbsp;
													<c:choose>
														<c:when test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">
														</c:when>
														<c:otherwise>
															<a href="javascript:void(0)" style="cursor: pointer;"
																	onclick="addCustRentCheckInfoRow();" style="font-size: 14px;"><img src="../images/u100.gif">&nbsp;添加客户合同期数</a>
														</c:otherwise>
													</c:choose>
											</td>
										</tr>
												
										<c:forEach items="${rentCheckLeaseCodeList}" var="item" varStatus="status">
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" id="CUST_NAME${ status.count }"	name="CUST_NAME" size="30" onblur="getCustRentLeaseCode(START_PERIOD_NUM${ status.count },END_PERIOD_NUM${ status.count },LEASE_CODE${ status.count },this.value,this);" value="${item.CUST_NAME }" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;<input type="hidden" id="CHECK_ID${ status.count }"	name="CHECK_ID_R" value="${item.CHECK_ID }"></td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="LEASE_CODE${ status.count }" name="LEASE_CODE" onchange="loadLeaseTerm(START_PERIOD_NUM${ status.count },END_PERIOD_NUM${ status.count },this.value);" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>
														<option value="${ item.CREDIT_ID }">
															${item.LEASE_CODE }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="START_PERIOD_NUM${ status.count }" name="START_PERIOD_NUM" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>
														<option value="${ item.CHECK_START }">
															${item.CHECK_START }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="END_PERIOD_NUM${ status.count }" name="END_PERIOD_NUM" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>>
														<option value="${ item.CHECK_END }">
															${item.CHECK_END }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
													<c:choose>
														<c:when test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">
														</c:when>
														<c:otherwise>
															<a href="#" onclick="deleteRow.call(this);"><span id="del${status.count+3 }" ><img src="../images/u103.gif">删除</span></a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>			
											</table>
											</td>
											</tr>
										<tr>
											<td colspan="6" align="center"
												class="ui-widget-content jqgrow ui-row-ltr"><input class="ui-state-default ui-corner-all" id="buttonAdd" type="button" value="保存数据" onclick="subCheckPayLines();" style="cursor: pointer;" <c:if test="${rentCheckDetail.FINANCE_CHECK_STATE eq 1 or rentCheckDetail.HW_CHECK_STATE eq 1}">disabled</c:if>/></td>
										</tr>
									
										
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>

</body>
</html>