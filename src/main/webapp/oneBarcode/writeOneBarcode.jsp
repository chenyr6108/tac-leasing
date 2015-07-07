<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<title>writeOneBarcode</title>
<script type="text/javascript">
		$(function(){
			 $("#ticketId").focus()
			 
		})


 function addOneBarcode(event) {
			 if(event.keyCode==13){
					var ticketId = $("#ticketId").val() ;
					if(ticketId == null || ticketId ==''){
						alert("条形码不能为空") ;
						$("#ticketId").focus();
						return false ;
					}	
					var expressId = $("#expressId").val() ;
					if(expressId == null || expressId ==''){
						alert("条形码不能为空") ;
						$("#expressId").focus();
						return false ;
					}
					var expressNameId = $("#expressNameId").val() ;
					$(function(){
						$.ajax({
							type:'post',
							url:'../servlet/defaultDispatcher',
							data:'__action=oneBarcodeCommand.addOneBarcode&TICKET_ID='+ticketId+'&EXPRESS_ID='+expressId+'&EXPRESS_NAME_ID='+expressNameId,
							dataType:'json',
							success: function(data){
								if(data.isSuccess){
									showmsg("录入成功",1);
									$("#expressId").val("");
									$("#ticketId").val("");
									document.getElementById("custName").innerHTML="";
									 $("#ticketId").focus();
									 
								}
							}
						}); 
					} );
					 $("#ticketId").focus();
			 }
} 
 //自动跳转
 function checkInput(event,y){
	 
	 if(event.keyCode==13){
		 //扫描器最后自动补一位非数字，需js处理去掉
		 if(y.length > 0){
			 y = y.substring(0,y.length-1);
		 }
		 $(function(){
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=oneBarcodeCommand.getCustNameByOneCode&TICKET_ID='+y,
					dataType:'json',
					success: function(data){
						document.getElementById("custName").innerHTML=data.custNameMap.CUST_NAME;
						$("#expressId").val("");
					}
				}); 
			} );
		 $("#expressId").focus();
		//var ticketId= $("#ticketId").val();
		//var str = ticketId.substring(0,19);
		$("#ticketId").val(y);
		$("#expressId").focus();
	 }
 }
 
 
 var closetime;
 function showmsg(msg,showtime)
 {
    var md=document.getElementById("msgdiv");
    md.innerHTML ="&nbsp;"+msg+"&nbsp;";
    md.visibility = "visible";
   if(closetime)window.clearTimeout(closetime);
    closetime=setTimeout(hiddenmsg,showtime*1000);    
 }
 function hiddenmsg()
 {
     var md=document.getElementById("msgdiv");
     md.innerHTML = "";
     md.visibility = "hidden";
 }
 
 function showOneBarcodeList(){
	 location.href="../servlet/defaultDispatcher?__action=oneBarcodeCommand.queryOneBarcodeList";
 }
	function upExcel(){
		var ru = $("#recompose_upload").val().split(".");
		var typeName = ru[1];
			if ("xls"!=typeName){
				alert("只能上传excel文件"+typeName);
	      		return false;
			}
		$("#formUp").submit();
	}		
</script>
</head>
<body>
<br>
<div style="margin-left: 10px">
<input type="button" name="addbutton" onclick="showOneBarcodeList();" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="返回条形码列表">
</div>

<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 700px;">
	<form id="form2" name="form2" action="../servlet/defaultDispatcher"	method="post">
	<input type="hidden" name="__action" id="__action" value="oneBarcodeCommand.addOneBarcode">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 700px">
		<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head"> <strong>请录入条形码：</strong><font color="red"></font></th>
		<tr>  
			<td style="text-align: right;width: 250px;" ><font color="red">收据/发票</font>条形码:</td>
			<td style="text-align: left;width: 250px;"> <input type="text" style="width: 250;height: 30;"  id="ticketId" name="ticketId" onkeyup="checkInput(event,this.value)"/> </td>
			<td style="text-align: left;width: 200px;"><font color="red" ><span id="custName"></span></font></td>
		</tr>
		<tr><td colspan="2" ></td> </tr>
		<tr>  
			<td style="text-align: right ;width: 250px;"><br><font color="red">快递单</font>条形码:</td>
			<td colspan="2" style="text-align: left;width: 450px;"><br><input type="text" style="width: 250;height: 30;"id="expressId" name="expressId" onkeyup="addOneBarcode(event);"/></td>
		</tr>
		<tr><td colspan="2" ></td> </tr>
		<tr>  
			<td style="text-align: right ;width: 250px;"><br><font color="red">快递单</font>公司:</td>
			<td colspan="2" style="text-align: left;width: 450px;"><br>
			<select id="expressNameId" name="expressNameId">
			     	<c:forEach items="${expressList}" var="list">
							<option value="${list.CODE}">${ list.FLAG}</option>
					</c:forEach>
			</select>
			</td>
		</tr>
	</table>
</form>
</div>
<div id="msgdiv" style="color: blue;margin-left: 320px"></div>

	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 700px;height: 50px;margin-top: 30px">
		<form id="formUp" name="formUp" action="../servlet/defaultDispatcher"	method="post" enctype="multipart/form-data">
			<input type="hidden" name="__action" id="__action" value="oneBarcodeCommand.upOneCodeExcel">
			<input type="hidden" id="type" name="type" value="excel" />
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 700px">
					<th  colspan="2" class="ui-state-default ui-th-ltr zc_grid_head"> <strong>上传Excel文档：</strong><font color="red"></font></th>
					<tr  class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;width: 250px;">Excel文件:</td>
						<td style="text-align: left;width: 450px;">
						<input  size="80" type="file" name="recompose_upload" id="recompose_upload"/>
						<input class="ui-state-default ui-corner-all" type="button" value="上传" onclick="upExcel();"/>
						</td>
					</tr>	
					<tr  class="ui-widget-content jqgrow ui-row-ltr">
						<td  colspan="2" style="text-align: left;">
							<h1>Excel格式说明：</h1>
							<div>快递公司名称对应的标识为：
								<c:forEach items="${expressList}" var="list">
									${ list.FLAG}-${list.CODE};
								</c:forEach>
							</div><br>
							<div>收据/发票条形码:需要扫描器输入，如需手动输入，请在输入完成后最后多加一位任意字母<br>（如：条形码为05062012080887-1-1，则手动输入时输入05062012080887-1-1q,然后按回车）</div>
						</td>
					</tr>
					<tr  class="ui-widget-content jqgrow ui-row-ltr">
						<td  colspan="2" style="text-align: left;">
							<a href="${pageContext.request.contextPath}/downloads/oneCodeExcelTemplate.xls ">下载Excel模板</a>	
						</td>
					</tr>		
			</table>
		</form>
	</div>
</body>
</html>