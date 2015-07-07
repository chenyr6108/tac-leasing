<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>标的物分类维护</title>
<script type="text/javascript">


	
	
	function modifyBigItem(item){
		$("#old_type1").val(item);	
		$("#new_type1").val(item);		
		$("#modifyBigItem").dialog({modal:true, autoOpen:false, width:400, height:150});
		$("#modifyBigItem").dialog("open");

	}
	
	function saveBigItem(){
		var type = $("#new_type1").val();
		if(type==""){
			alert("大项不能为空");
			return;
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:$("#bigItemForm").serialize(),
			dataType:'json',
			success: function(data) {
				if(data){
					alert("保存成功");
					$("#modifyBigItem").dialog("close");
					location.href = "../servlet/defaultDispatcher?__action=commonCommand.getProductTypeItems";
				}else{
					alert("保存失败");
				}
				
			}
		});
	}
	
	function modifySmallItem(type1,type2,level,index){
		$("#type1").val(type1);
		$("#old_type2").val(type2);
		$("#new_type2").val(type2);
		$("#index").val(index);
		$("#productLevel").find("option").each(function(){
			var value = $(this).val();
			if(value==level){
				$(this).attr("selected","selected");
			}else{
				$(this).removeAttr("selected");
			}
		});
		
		$("#modifySmallItem").dialog({modal:true, autoOpen:false, width:400, height:200});
		$("#modifySmallItem").dialog("open");
	}
	
	function saveSmallItem(){
		var type = $("#new_type2").val();
		var code = $("#type1").val();
		var index = $("#index").val();
		var level = $("#productLevel").val();
		if(type==""){
			alert("小项不能为空");
			return;
		}
		if(level==""){
			alert("级别不能为空");
			return;
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:$("#smallItemForm").serialize(),
			dataType:'json',
			async:false,
			success: function(data) {
				if(data){
					alert("保存成功");	
					$("#modifySmallItem").dialog("close");
				}else{
					alert("保存失败");
				}
				
			}
		});
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=productKind.getProductType2&TYPE1='+code,
			dataType:'json',
			success: function(data) {
				$("#tbody_item_"+index+" tr").each(function() {
					$(this).remove();
				});
				var html = "";
				for(var i=0;i<data.length;i++){
					html += "<tr>";
					html += "<td style=\"text-align: center;\">" +(i+1) +"</td>";
					html += "<td style=\"text-align: center;\">" +data[i].CODE +"</td>";
					html += "<td style=\"text-align: center;\">" +data[i].PRODUCT_LEVEL +"</td>";
					html += "<td style=\"text-align: center;\" ><a href=\"javascript:void(0)\" onclick=\"modifySmallItem('"+code+"','"+data[i].CODE+"','"+data[i].PRODUCT_LEVEL+"',"+index+")\">修改 </a></td>";
					html += "</tr>";
				}
				$("#tbody_item_"+index).append(html);
			}
		});	
	}
	
	function showSmallItems(code,index){
		var isshow = $("#tr_item_"+index).attr("isShow");
		if(isshow=='n'){
			$("#tr_item_"+index).attr("isShow",'y');
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=productKind.getProductType2&TYPE1='+code,
				dataType:'json',
				success: function(data) {
					$("#tbody_item_"+index+" tr").each(function() {
						$(this).remove();
					});
					var html = "";
					for(var i=0;i<data.length;i++){
						html += "<tr>";
						html += "<td style=\"text-align: center;\">" +(i+1) +"</td>";
						html += "<td style=\"text-align: center;\">" +data[i].CODE +"</td>";
						html += "<td style=\"text-align: center;\">" +data[i].PRODUCT_LEVEL +"</td>";
						html += "<td style=\"text-align: center;\" ><a href=\"javascript:void(0)\" onclick=\"modifySmallItem('"+code+"','"+data[i].CODE+"','"+data[i].PRODUCT_LEVEL+"',"+index+")\">修改 </a></td>";
						html += "</tr>";
					}
					$("#tbody_item_"+index).append(html);
					$("#tr_item_"+index).css("display","");
				}
			});	
		}else{
			$("#tr_item_"+index).attr("isShow",'n');
			$("#tr_item_"+index).css("display","none");			
		}
	}
</script>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width:800px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;标的物分类大小项维护</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width:800px">
	    <div class="zc_grid_body jqgrowleft">
			 <div class="ui-state-default ui-jqgrid-hdiv">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:800px">
					<tr>
						<td style="text-align: center;width:50px" class="ui-state-default ui-th-ltr zc_grid_head">序号</td>
						<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">大项</td>
						<td style="text-align: center;width:100px" class="ui-state-default ui-th-ltr zc_grid_head">操作</td>
					</tr>
					<c:forEach items="${list }" var="item" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr"  style="cursor: pointer;">
							<td style="text-align: center" >${index.count }</td>
							<td style="text-align: center" onclick="showSmallItems('${item.CODE }',${index.count })" >${item.CODE }</td>
							<td style="text-align: center"><a href="javascript:void(0)" onclick="modifyBigItem('${item.CODE }')">修改</a> </td>
						</tr>
						<tr  style="display:none" id="tr_item_${index.count }" isShow="n">
							<td colspan="3">
								<div  style="width:700px;margin-top: 10px;margin-left: 20px">
								    <div class="zc_grid_body jqgrowleft">
										<div class="ui-state-default ui-jqgrid-hdiv">
										<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table" style="width:700px">
											<tr>
												<td style="text-align: center;width:50px" class="ui-state-default ui-th-ltr zc_grid_head">序号</td>
												<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">小项</td>
												<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">级别</td>
												<td style="text-align: center;width:100px" class="ui-state-default ui-th-ltr zc_grid_head">操作</td>
											</tr>	
											<tbody id="tbody_item_${index.count }">
											
											</tbody>									
										</table>
										<br>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
	   </div>
	</div>


	<div id="modifyBigItem" style="display: none;" title="大项">
		<form action="" method="post" id="bigItemForm">
		<input name="__action" value="commonCommand.updateBigItem" type="hidden"/>
		<input name="old_type1" id="old_type1" value="" type="hidden"/>
		<input name="index" id="index" value="" type="hidden"/>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    	<div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="5" cellpadding="10" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:300px;margin: 0 auto">
						<tr>
							<td style="text-align: left;">大项：</td>
							<td style="text-align: left;">
								<input name="new_type1" id="new_type1"  type="text"/>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="saveBigItem()" style="cursor:pointer;"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</form>
	</div>
	<div id="modifySmallItem" style="display: none;" title="小项">
		<form action="" method="post" id="smallItemForm">
		<input name="__action" value="commonCommand.updateSmallItem" type="hidden"/>
		<input name="type1" id="type1" value="" type="hidden"/>
		<input name="old_type2" id="old_type2" value="" type="hidden"/>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	    	<div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="5" cellpadding="10" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:300px;margin: 0 auto">
						<tr>
							<td style="text-align: left;">小项：</td>
							<td style="text-align: left;">
								<input name="new_type2" id="new_type2" type="text"/>						
							</td>
						</tr>
						<tr>
							<td>级别：</td>
							<td>
							<select id="productLevel" name="productLevel">
								<option value="">-请选择-</option>
								<option value="A">A</option>
								<option value="AA">AA</option>
								<option value="AAA">AAA</option>
								<option value="B">B</option>
								<option value="BB">BB</option>
								<option value="BBB">BBB</option>
							</select>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="saveSmallItem()" style="cursor:pointer;"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>
<!--导数据使用 add by ShenQi 请误删除 <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
   <div class="zc_grid_body jqgrowleft">
		<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form action="../servlet/defaultDispatcher?__action=commonCommand.uploadExcel" method="post" enctype="multipart/form-data">
			<input type="hidden" name="type" value="excel">
				<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td align="left" class="ui-widget-content jqgrow ui-row-ltr"><b>上传附件</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="file" id="excel" name="excel" class="ui-state-default ui-corner-all"></td>
					</tr>
					<tr>
						<td colspan="2" id="button_flag" style="text-align:center;">
						<br>
							<input type="submit" value="保&nbsp;存" class="ui-state-default ui-corner-all" style="cursor:pointer;">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div> -->