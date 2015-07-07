function addPointsItems(){
	form=document.addPointsItemsForm;
	if(blank(form.POINTS_NAME,'项目名称')
	   ||positive(form.STANDARD_SCORE,'标准分')){
	   	return false;
	   }
	 form.submit();  
}

function preUpdatePointsItems(id){
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=pointsItems.getPointsItemsById&POINTS_ID='+id,
		dataType:'json',
		success: function(dataBack){ 
			form=document.updatePointsItemsForm; 
			form.POINTS_NAME.value=dataBack.pointsItemsMap.POINTS_NAME; 
			form.TYPE_CODE.value=dataBack.pointsItemsMap.TYPE_CODE;
			form.STANDARD_SCORE.value=dataBack.pointsItemsMap.STANDARD_SCORE;
			form.MEMO.value=dataBack.pointsItemsMap.MEMO;
			form.POINTS_ID.value=dataBack.pointsItemsMap.POINTS_ID;
		}
	});
	//POPUP.pw('updatePointsItemsDiv');
	$('#updatePointsItemsDiv').dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$('#updatePointsItemsDiv').dialog('open'); 
}
//弹出添加角色的层
function openAddPointsItems(){
	$('#addPointsItemsDiv').dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$('#addPointsItemsDiv').dialog('open');
}
// 关闭窗口
function closeDialog(msg){
	$(msg).dialog('close');
}
function updatePointsItems(){
	form=document.updatePointsItemsForm;
	if(blank(form.POINTS_NAME,'项目名称')
	   ||positive(form.STANDARD_SCORE,'标准分')){
	   	return false;
	   }
	 form.submit();  
}
	
function configurationPointItems(id,name){
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=pointsItems.getSubItemsByPointsId&POINTS_ID='+id,
		dataType:'json',
		success: function(dataBack){ 
			 var str='<tr class="ui-widget-content jqgrow ui-row-ltr">'
					+'<td width="25%">'  
					+	'<strong>项目名称：</strong> '
					+'</td>'
					+'<td colspan="2"> '
					+	'<span id="showPointItemsName_span"></span>'
					+'</td>'
					+'</tr>'
					+'<tr class="ui-widget-content jqgrow ui-row-ltr">'
					+	'<td width="50%" align="center">'
					+		'<strong>内容</strong> '
					+	'</td>'
					+	'<td width="35%" align="center"> ' 
					+		'<strong>分数</strong> '
					+	'</td>'  
					+	'<td width="15%" align="center">'  
					+		'<a href="javaScript:void(0);" onclick="addSubItems();">添加</a>'
					+	'</td> '
					+'</tr>' ;
					for(i=0;i<dataBack.list.length;i++){
						str=str + '<tr class="ui-widget-content jqgrow ui-row-ltr">'
								+'<td  align="center">  '
								+'<input name="SUBITEM_ID" type="hidden" value="'+dataBack.list[i].SUBITEM_ID+'">'
								+'<input name="SUBITEM_CONTENT" type="text" style="width: 200px" value="'+dataBack.list[i].SUBITEM_CONTENT+'"/>'
								+'</td>'  
								+'<td  align="center">  '
								+'<input name="SUBITEM_POINT" type="text" style="width: 50px" value="'+dataBack.list[i].SUBITEM_POINT+'"/>'
								+'</td>' 
								+'<td  align="center"> ' 
								+'<a href="javaScript:void(0);" onclick="deleteSubItems(this,'+dataBack.list[i].SUBITEM_ID+');">删除</a>'
								+'</td> '
								+'</tr>' ; 
					}							
												 
					str=str+'<tr>'
					+'<td colspan="3" align="center">  '
					+'<input type="button" name="saveBut" id="saveBut"'
					+'value="保  存" onclick="configurationSubItems();"'
					+'class="ui-state-default ui-corner-all"> '
					+'<input type="reset" name="resetBut" id="resetBut"'
					+'value="重  置" class="ui-state-default ui-corner-all"> '
					+'<input type="button" value="关 闭" name="but"'
					+'onclick="closeDialog(configurationpointsItemsDiv);" class="ui-state-default ui-corner-all"> '	
					+'</td>'
					+'</tr>'
					tab=document.getElementById("configurationTab");
					tab.innerHTML=str;
					form=document.configurationPointsItemsForm;
					document.getElementById("showPointItemsName_span").innerHTML=name; 
					form.POINTS_ID.value=id;
		}
	});
	//POPUP.pw('configurationpointsItemsDiv');
	$('#configurationpointsItemsDiv').dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$('#configurationpointsItemsDiv').dialog('open');
}

function addSubItems(){
	tab=document.getElementById("configurationTab");
	var row=tab.insertRow(tab.rows.length-1);
	var cell1=row.insertCell(0);
	cell1.className='ui-widget-content jqgrow ui-row-ltr';
	cell1.align='center';
	cell1.height='26px';
	cell1.innerHTML='<input name="SUBITEM_ID" type="hidden"><input name="SUBITEM_CONTENT" type="text" style="width: 200px"/>';
	var cell2=row.insertCell(1);
	cell2.className='ui-widget-content jqgrow ui-row-ltr';
	cell2.align='center';
	cell2.innerHTML='<input name="SUBITEM_POINT" type="text" style="width: 50px"/>';
	var cell3=row.insertCell(2);
	cell3.className='ui-widget-content jqgrow ui-row-ltr';
	cell3.align='center';
	cell3.innerHTML='<a href="javaScript:void(0);" onclick="deleteSubItems(this,null);">删除</a>';
}

function configurationSubItems(){
	form=document.configurationPointsItemsForm;
	tab=document.getElementById("configurationTab").rows.length;
	if(tab<=3){
		alert('请添加项目！');
		return false;
	}
	if(tab==4){
		SUBITEM_ID=form.SUBITEM_ID;
		SUBITEM_CONTENT=form.SUBITEM_CONTENT;
		SUBITEM_POINT=form.SUBITEM_POINT;
		if(blank(SUBITEM_CONTENT,'项目内容')||positive(SUBITEM_POINT,'项目分数')){
			return false;
		}
	}
	if(tab>4){
		SUBITEM_ID=form.SUBITEM_ID;
		SUBITEM_CONTENT=form.SUBITEM_CONTENT;
		SUBITEM_POINT=form.SUBITEM_POINT;
		for(i=0;i<SUBITEM_ID.length;i++){
			if(blank(SUBITEM_CONTENT[i],'项目内容')||positive(SUBITEM_POINT[i],'项目分数')){
				return false;
			}
		}
	}
	configurationPointsItemsForm.submit();
}

function deleteSubItems(a,id){
	if(id==null){
		 var tr=a.parentNode.parentNode;
		  tr.parentNode.removeChild(tr); 
	}else{
		if(confirm('确认删除？')){
			var tr=a.parentNode.parentNode;
		  	tr.parentNode.removeChild(tr); 	
		  	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=pointsItems.deleteSubItems&SUBITEM_ID='+id
		});
		}
	}
}