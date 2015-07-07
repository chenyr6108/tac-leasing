<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建回访记录</title>
<style>
.upload_box{width:800px; margin:1em auto;}
.upload_main{border-width:1px 1px 2px; border-style:solid; border-color:#ccc #ccc #ddd; background-color:#fbfbfb;}
.upload_choose{padding:1em;}
.upload_drag_area{display:inline-block; width:60%; padding:4em 0; margin-left:.5em; border:1px dashed #ddd;color:#999; text-align:center; vertical-align:middle;}
.upload_drag_hover{border-color:#069; box-shadow:inset 2px 2px 4px rgba(0, 0, 0, .5); color:#333;}
.upload_preview{border-top:1px solid #bbb; border-bottom:1px solid #bbb; background-color:#fff; overflow:hidden; _zoom:1;}
.upload_append_list{height:100px; padding:0 1em; float:left; position:relative;}
.upload_delete{margin-left:2em;}
.upload_image{max-height:50px; padding:5px;}
.upload_submit{padding-top:1em; padding-left:1em;}
.upload_submit_btn{display:none; height:32px; font-size:14px;}
.upload_progress{display:none; padding:5px; border-radius:10px; color:#fff; background-color:rgba(0,0,0,.6); position:absolute; left:25px; top:45px;}
</style>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />

<script type="text/javascript">
	//-------------------------------------------------------------------------------------
	$(function(){
			$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
			$("#visitOldDate").datepicker($.datepicker.regional["zh-CN"]);
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=employee.getEmployeeForVistNew',
				dataType:'json',
				success: initAutoCompleteBack
			}); 
		} );
	
	var optionsBack = {
			minChars : 1,
			max : 2000,
			mustMatch: true,
			matchContains: true,
			formatItem : function(row, i, max) {
				var rs = row.NAME;
				if (row.MOBILE != null && row.MOBILE.length > 0) {
					rs += "【" + row.MOBILE + "】";
				}
				return rs;
			},
			formatMatch : function(row, i, max) {
				return row.id + " " + row.NAME;
			},
			formatResult : function(row) {
				return row.NAME;
			}
		};
	function initAutoCompleteBack(data) { 
		dataList = data.employeeList; 
		$("#clerk_name").autocomplete(dataList, optionsBack);
		$("#clerk_name").result(function(event, data, formatted) {
					if(data!=null){
						$("#clerk_mobile").val(data.MOBILE);
						$("#clerk_id").val(data.ID); 
					}
					
				}); 	
	}
    function addVisit()
    {
    var form = document.addForm;
    var tname = $.trim($(":input[name='visit_conperson']").val());
    if (tname.length <1) {
        alert("请填写接触对象！");
        return false;
    }
    var tdate = $.trim($(":input[name='visitNewDate']").val());
    if (tdate.length <1) {
        alert("请填写回访时间！");
        return false;
    }
    var tdate = $.trim($(":input[name='clerk_name']").val());
    if (tdate.length <1) {
        alert("请选择回访人员！");
        return false;
    }
	
    tabLength = document.getElementById("visitTable").rows.length ;
    /*2011/12/8 杨赟 修改 “备注/建议” 栏为文本域 begin*/
	//if(tabLength == 10){
	if(tabLength == 11){
	/*2011/12/8 杨赟 修改 “备注/建议” 栏为文本域 end*/
   		/*if(blank($("#imagesVisit")[0],"图片名称") || blank(	[0],"上传图片")){
   			return false ;
   		}*/
   		if($("#imagesVisit").val() == null || $("#imagesVisit").val().trim() == ""){
   			alert("图片不能为空!") ;
   			$("#imagesVisit").focus();
   			return false ;
   		}
   		//判断是否是图片类型
		if(!checkImageType($("#imagesVisit"))){
			return false ;
		}
   		if($("#imagesName").val() == null || $("#imagesName").val().trim() == ""){
   			alert("图片标题不能为空!");
   			$("#imagesName").focus();
   			return false ;
   		}
   		
   		if($("#STATECON").val() == null || $("#STATECON").val().trim() == ""){
   			alert("回访原因不能为空!");
   			$("#STATECON").focus();
   			return false ;
   		}
   		$("#STATECON_TEXT").val($.trim($("#STATECON").find("option:selected").text()));
   		$("#visit_results_text").val($.trim($("#visit_results").find("option:selected").text()));
   		
   	/*2011/12/8 杨赟 修改 “备注/建议” 栏为文本域 begin*/
   	//}else if(tabLength > 10){
   		//for(var i=0;i<(tabLength-9);i++){
	}else if(tabLength > 11){
   		for(var i=0;i<(tabLength-10);i++){
   	/*2011/12/8 杨赟 修改 “备注/建议” 栏为文本域 end*/   			
	   		if($("input[id='imagesVisit']").eq(i) == null || $("input[id='imagesVisit']").eq(i).val().trim() == ""){
	   			alert("图片不能为空!") ;
	   			$("input[id='imagesVisit']").eq(i).focus();
	   			return false ;
   			}
   			//判断是否是图片类型
   			if(!checkImageType($("input[id='imagesVisit']").eq(i))){
				return false ;
			}
	   		if($("input[id='imagesName']").eq(i).val() == null || $("input[id='imagesName']").eq(i).val().trim() == ""){
	   			alert("图片标题不能为空!");
	   			$("input[id='imagesName']").eq(i).focus();
	   			return false ;
	   		}
	   	}
	}
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backVisit.createVisitManagerNew");
    $("#addForm").submit();
    
}

function checkImageType(image){
//	var imageName = image.val() ;
//	var imageType = imageName.substring(imageName.lastIndexOf('.')+1,imageName.lenth).toLowerCase(); 
	var imageName = image.val().split("."); 
	var imageType = imageName[1].toLowerCase() ;
	
	if(imageType == "jpg" || imageType == "bmp" || imageType == "gif" || imageType == "png" || imageType == "jpeg" || imageType == "tif") {
		return true ;
	}else {
		alert(imageType + "不是图片类型请重新上传") ;
		image.val("") ;
		image.focus() ;
		return false ;
	}
}

function changeDiv()
{
	 var form = document.addForm;
    var tname = $.trim($(":input[name='visit_results']").val());
    if(tname==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function changeTr(resul)
{
	if(resul==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}
var x = 0 ;
function addCreditVisit(){
	var tab=document.getElementById("visitTable");
	var row=tab.insertRow(tab.rows.length -1);
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"checkbox\" name=\"visitCheck\" id=\"visitCheck\">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.colSpan=4;
	cell.innerHTML='<input size=\"104\" type=\"text\" name=\"imagesName'+x+'\" id=\"imagesName\" >';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='left';	
	cell.colSpan=3;
	cell.innerHTML='<input class=\"ui-state-default ui-corner-all\" size=\"52\" type=\"file\" name=\"imagesVisit\" id=\"imagesVisit\"/>';
	x++
}

function deleteCreditVisit(){
	var check=document.getElementsByName("visitCheck");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var tr=check[i].parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}

function getAllCellVisit(){
	var checkalls=document.getElementById("visitChecks");
	var checks=document.getElementsByName("visitCheck");
	for(i=checks.length-1;i>=0;i=i-1){
		if(checkalls.checked==true){	
			checks[i].checked=true;	
		}else if(checkalls.checked==false){
			checks[i].checked=false;
		}
	}
}

</script>
<body   onload="changeTr('${backVisit.VISIT_RESULTS }')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backVisit.createVisitManagerNew" method="post" id="addForm" name="addForm" enctype="multipart/form-data">
	<input type="hidden" name="CUST_CODE" id="CUST_CODE" value="${backVisit.CUST_CODE }">
	<input type="hidden" name="id" value="${employee.ID }">
	<input type="hidden" name="RECP_ID" id="RECP_ID" value="${backVisit.RECP_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新建回访记录(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="visitTable">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td><!-- 合同编号： -->&nbsp;</td>
			<td  colspan="2">&nbsp;<input type="hidden" name="RECT_ID" id="RECT_ID" value="${backVisit.RECT_ID }" readonly="readonly"/><input type="hidden" style="height:25px" name="rect_code" id="rect_code" value="${backVisit.LEASE_CODE }" readonly="readonly"/></td>
			<td> 承租人：</td>
			<td  colspan="2"><input type="text" size="35" style="height:25px" id="cust_name" name="cust_name" value="${backVisit.CUST_NAME }" readonly="readonly">    </td>
			<td> <!-- 租金到期日： -->&nbsp;</td>
			<td>&nbsp;<input type="hidden" style="height:25px" value="<fmt:formatDate value="${backVisit.END_DATE }" pattern="yyyy-MM-dd"/>&nbsp;" size="10" id="end_date" name="end_date" readonly="readonly"> </td>
		</tr>
<%-- 		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>支付表号：</td>
			<td><input type="text" size="35" value="${backVisit.RECP_CODE }" size="10" style="height:25px" id="prcpcode" name="prcpcode" readonly="readonly"></td>	
			<td> 制造商：</td>
			<td><input type="text" size="35" value="${backVisit.THING_KIND }" size="10" id="thingkind" style="height:25px" name="thingkind" readonly="readonly"></td>
			<td> 产品名称：</td>
			<td><input type="text" size="35" value="${backVisit.THING_NAME }" size="10" id="thingname" name="thingname" style="height:25px" readonly="readonly"></td>
			<td> 型   号：</td>
			<td><input type="hidden" name="RECD_ID" id="RECD_ID" value="${backVisit.RECD_ID }"><input type="text" size="20" value="${backVisit.MODEL_SPEC }" style="height:25px" size="10" id="modelspec" name="modelspec" readonly="readonly"></td>
		
		</tr> --%>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>区域：</td>
			<td><input type="text" value="${backVisit.PROVINCE }" size="10" style="height:25px" id="province" name="province" readonly="readonly"></td>	
			<td> 城市：</td>
			<td><input type="text" value="${backVisit.CITY }" size="10" id="city" style="height:25px" name="city" readonly="readonly"></td>
			<td> 再访日期：</td>
			<td><input type="text" value="" size="10" id="visitOldDate" name="ready_visit_date" style="height:25px" readonly="readonly"></td>
			<td> 回访人员：</td>
			<td>
			<input type="text" id="clerk_name" name="clerk_name" size="20" onchange="$('#clerk_name').val('');" autocomplete="off" class="ac_input">
			 <input type="hidden" id="clerk_id" name="clerk_id" value="">
			</td>
		
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>回访日期： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="visitNewDate" id="datebegin" value=""/></td>
			<td>是否营业： </td>
			<td><select name="is_business" id="is_business"><option value="0">是</option><option value="1">否</option></select></td>
			<td>接触对象： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="visit_conperson" id="visit_conperson"  /></td>
			<td>是否见标的物： </td>
			<td><select name="is_products" id="is_products"><option value="0">是</option><option value="1">否</option></select></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>标的物外观： </td>
			<td><select name="prod_degree" id="prod_degree"><option value="0">正常</option><option value="1">破损</option></select></td>
			<td>是否正常运行： </td>
			<td><select name="is_run" id="is_run"><option value="0">是</option><option value="1">否</option></select></td>
			<td>机器运行率： </td>
			<td><select name="prod_degree_detailed" id="prod_degree_detailed"><option value="0">正常</option><option value="1">良好</option><option value="2">差</option></select></td>
			<td>回访结果： </td>
			<td><select name="visit_results" id="visit_results" onchange="changeDiv()">
			<option value="0">正常</option><option value="1">异常</option>
			<option value="2">已停业</option><option value="3">其他</option>
			</select></td>
		</tr>
		<tr id="5" class="ui-widget-content jqgrow ui-row-ltr">
			<td>回访原因：<font color='red'>*</font> </td>
			<td><select id="STATECON" name="STATECON">
          	<option value="">--请选择--</option>
          	<option value="-1">逾期25天</option>
          	<option value="0">异常提前回访</option>
          	<option value="1">再访回访</option>
          	<option value="2">正常回访</option>
          	<option value="3">其他回访</option></select></td>
			<td colspan="6">&nbsp;<input type="hidden" style="height:25px" name="visit_results_text" id="visit_results_text" value=""/><input type="hidden" style="height:25px" name="STATECON_TEXT" id="STATECON_TEXT" value=""/></td>
		</tr>		
		<tr class="ui-widget-content jqgrow ui-row-ltr" id="trDis">
			<td colspan="1">是否在回访： </td>
			<td colspan="7"><select name="is_backVisit" id="is_backVisit"><option value="0">是</option><option value="1">否</option></select></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="1">备注/建议： </td>
			<td colspan="7"><textarea rows="8" cols="170" name="visit_note" id="visit_note"></textarea></td>
		</tr>
		<%-- <tr >
			<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left" width="75.5%" colspan="5">
		        <strong>上传图片<font color="red">(注：图片大小不能超过1M(1024K))</font></strong>
		  	</td>
			<td class="ui-state-default ui-th-ltr zc_grid_head"  align="right" colspan="2">
					相关操作：
				<img src="${ctx }/images/u100.gif">
				&nbsp;
				<a href="javaScript:void(0);" onclick="addCreditVisit();">添加</a>
			</td>
			<td class="ui-state-default ui-th-ltr zc_grid_head">
				<img src="${ctx }/images/u103.gif">
				&nbsp;
				<a href="javaScript:void(0);" onclick="deleteCreditVisit();">删除&nbsp;</a> 
			</td>
		</tr> --%>
		<tr>
			<td colspan="8">
			 <strong>上传图片<font color="red">(注：单张图片大小不能超过2M,可多选)</font></strong>
    		   <div id="body" class="light">
			    	<div id="content" class="show">
			            <div class="demo">
			                    <div class="upload_box">
			                        <div class="upload_main">
			                            <div class="upload_choose">
			                                <input id="fileImage" type="file" size="30" name="fileselect[]" multiple />
			                                <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
			                            </div>
			                            <div id="preview" class="upload_preview"></div>
			                        </div>
			                        <div id="uploadInf" class="upload_inf"></div>
			                    </div>
			            </div>
			        </div>       
			    </div>
    		</td>	
		</tr>
		<tr>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="addVisit()"></input></div></td>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
<script src="${ctx }/common/js/ZXXFILE.js"></script>
<script>
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: $("#fileSubmit").get(0),
	url: $("#uploadForm").attr("action"),
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			if (file.type.indexOf("image") == 0 || (!file.type && /\.(?:jpg|png|gif)$/.test(file.name) /* for IE10 */)) {
				if (file.size >= 2048000) {
					alert('您这张"'+ file.name +'"图片大小过大，应小于2048000k');	
				} else {
					arrFiles.push(file);	
				}			
			} else {
				alert('文件"' + file.name + '"不是图片。');	
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		var html = '', i = 0;
		$("#preview").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader()
				reader.onload = function(e) {
					html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>' + file.name + '</strong>'+ 
						'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
						'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'+ 
						'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
					'</div>';
					
					i++;
					funAppendImage();
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview").html(html);
				if (html) {
					//删除方法
					$(".upload_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
						return false;	
					});
				}
			}
		};
		funAppendImage();		
	},
	onDelete: function(file) {
		$("#uploadList_" + file.index).fadeOut();
	}
	
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();
</script>
</html>
