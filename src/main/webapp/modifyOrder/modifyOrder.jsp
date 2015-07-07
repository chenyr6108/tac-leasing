<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
		<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/creditCustomerCreate.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		
<title>更改单</title>
<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	//提交申请
	var x = 1;
	function addOrder(){
		var classOrder =$("#classList").val();
		//alert(classOrder);
		 if(classOrder==null || classOrder==''){
	            alert("更改单的分类为必选项的，请核对选择。");
	            return false;
	        }
		 var upperUser=$("#upperUser").val();
		 //alert(upperUser);
		 if(upperUser==null || upperUser==''){
	            alert("出错了，请联系资讯课，你upperUser为空！");
	            return false;
	        }
		
		var val=$('input:radio[name="IS_PAY"]:checked').val();
		 //alert(val);
        if(val==null){
            alert("请选择是否拨款");
            return false;
        }
        var valL=$('input:radio[name="IS_LEASE_CODE"]:checked').val();
        if(valL==null){
            alert("请选择是否保留合同号");
            return false;
        }
        var codeVar=$("#LEASE_CODE_ID").val();
        if(codeVar.length>0){
	        if(codeVar.length != 14){
	        	alert("请输入正确的合同号,或者删除空格。");
	            return false;
	        }
        }
        // 附件
        for(var i=0;i<x;i++){
	        if(!checkImageType(i)){
				return false ;
			}
        }
		$("#form1").submit();
	}
	//修改申请
	function updateMOrder(){
       var codeVar=$("#LEASE_CODE_ID").val();
       if(codeVar.length>0){
	        if(codeVar.length < 14 ){
	        	alert("请输入正确的合同号");
	            return false;
	        }
       }
       // 附件
       for(var i=0;i<x;i++){
	        if(!checkImageType(i)){
				return false ;
			}
       }
		 $("#__action").val("modifyOrderCommand.takeOrder");
		  $("#form1").submit();
		  $("#__action").val("modifyOrderCommand.addOrder");
	}
	//添加更多附件
	
	function addMoreFile(){
		 var tab=document.getElementById("modifyOrderTable");
		 //第几行
		var row=tab.insertRow(2);
		var cell=row.insertCell(0);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='center';
		cell.colSpan=4;
		cell.innerHTML='';
		cell=row.insertCell(1);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='left';
		cell.colSpan=4;
		cell.innerHTML='<input type="file" id=\"fileImage'+x+'\" name="fileImage" style="height: 100%"/>';
		x++ ;
	}
	//验证图片
	function checkImageType(i){
		var imageName = $("#fileImage"+i).val().split("."); 
		if(imageName !=""){
			var imageType = imageName[1].toLowerCase() ;
			if(imageType == "jpg" || imageType == "pdf" || imageType == "png"|| imageType == "tif") {
				return true ;
			}else {
				alert(imageType + "类型不符合请重新上传") ;
				image.val("") ;
				image.focus() ;
				return false ;
			}
		}else{
			return true;
		}
	}
	//
	 function showOrderList(){
		 location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.queryModifyOrderList";
	 }
</script>
</head>
<body>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;新增更改单</span>
			</div>
			<br>
			<div><input type="button" value="返回更改单列表" onclick="showOrderList();" style="height: 30px"/></div>
	<center>
		
		<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
			<input type="hidden" id="__action" name="__action" value="modifyOrderCommand.addOrder">
			
			
			<br>
			<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center" >
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
							<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;更改单</span>
						</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
							<div class="zc_grid_body jqgrowleft">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr >
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="modifyOrderTable">
												<tr>
													<td colspan="1" width="10%" style="text-align: right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">分类：</td>
													<td colspan="7" width="90%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">
													<select id="classList" name="ORDER_CLASS">
														<option value="">请选择</option>
														<c:forEach items="${classList}" var="list">
															<c:choose>
																<c:when test="${orderOne.ORDER_CLASS  eq list.CODE}"><option value="${ list.CODE}" selected="selected">${ list.FLAG}</option></c:when>
															<c:otherwise>
																<option value="${ list.CODE}">${ list.FLAG}</option>
															</c:otherwise>
															</c:choose>
														</c:forEach>
																			
													</select><strong style="color: red">*（依规定，除表列类型之外不得采用更改单）</strong></td>
												</tr>
												<tr id="orderTr">
													<td width="10%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">申请人：<input type="hidden" name="MODIFY_ID" value="${orderOne.MODIFY_ID}"/><input type="hidden" id="upperUser" value="${userLogin.UPPERUSER}"/></td>
													<td colspan="2" width="10%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">${orderOne.APPLY_NAME}${userLogin.NAME}</td> 
													<td width="25%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">添加附件(限制JPG、PDF、PNG、TIF格式,文件大小限2M以下)：</td>
													<td colspan="4" width="10%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="file" id="fileImage0" name="fileImage" style="height: 100%" /><img src="${ctx }/images/u100.gif">&nbsp;<a href="javaScript:void(0);" onclick="addMoreFile();">添加更多附件</a></td> 
												</tr>
												<tr>
													<td width="10%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">承租人名称：</td>
													<td  colspan="2"width="20%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CUST_NAME" id="cust_name" style="width: 100%" value="${orderOne.CUST_NAME }"/></td>
													<td  width="10%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">是否拨款：</td>
													<td colspan="4" width="60%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY" value="0" <c:if test='${orderOne.IS_PAY eq 0}'>checked="checked"</c:if>/><span>未拨款</span><input type="radio" name="IS_PAY" value="1" <c:if test='${orderOne.IS_PAY eq 1}'>checked="checked"</c:if>/><span>已拨款</span><strong style="color: red">*</strong></td>
												</tr>
												<tr>
													<td width="10%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">合同号：</td>
													<td colspan="2"width="20%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="LEASE_CODE" style="width: 100%" value="${orderOne.LEASE_CODE}" id="LEASE_CODE_ID"/></td>
													<td width="10%" style="text-align:right; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr">是否保留合同号：</td>
													<td colspan="4" width="60%" style="text-align: left; height: 30px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_LEASE_CODE" value="1" <c:if test='${orderOne.IS_LEASE_CODE eq 1}'>checked="checked"</c:if>/><span>保留合同号</span> <input type="radio" name="IS_LEASE_CODE" value="0" <c:if test='${orderOne.IS_LEASE_CODE eq 0}'>checked="checked"</c:if>/><span>不保留合同号</span><strong style="color: red">*</strong></td>
												</tr>
												<tr>
													<td colspan="1" width="10%" style="text-align: right; height: 100px;" class="ui-widget-content jqgrow ui-row-ltr">需求内容：</td>
													<td colspan="7" width="90%" style="text-align: left; height: 100px;" class="ui-widget-content jqgrow ui-row-ltr"><textarea rows="5" cols="100" name="INTRODUCTION">${orderOne.INTRODUCTION}</textarea></td>
												</tr>
												<c:if test="${not empty fileList }">
													<c:forEach items="${fileList}" var="img" varStatus="index" >
													<tr>
														<td colspan="8" width="90%" style="text-align: left; height: 5px;" class="ui-widget-content jqgrow ui-row-ltr"><div>附件：${img.IMAGE_NAME }&nbsp;&nbsp;&nbsp;&nbsp;<a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateFile&fileId=${img.MOIMG_ID}&MODIFY_ID=${orderOne.MODIFY_ID}'"><img src="/tacleasing/images/u103.gif">删除</a></div></td>
													</tr>
													</c:forEach>
												</c:if>
												<tr>
													<c:if test="${empty orderOne.MODIFY_ID }">
														<td colspan="8" width="90%" style="text-align: center; height: 40px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="提交申请" style="height: 30px;width: 90px" onclick="addOrder();"/></td>
													</c:if>
													<c:if test="${not empty orderOne.MODIFY_ID }">
														<td colspan="8" width="90%" style="text-align: center; height: 40px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="button" value="修改申请" style="height: 30px;width: 90px" onclick="updateMOrder();"/></td>
													</c:if>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>