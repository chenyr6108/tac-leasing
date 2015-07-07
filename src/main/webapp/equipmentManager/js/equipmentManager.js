// 查看
function showEquipment(recd_id){
	window.location.href = "../servlet/defaultDispatcher?__action=equipmentManager.showEquipment&recd_id="+recd_id;
}
// 巡视
function preUpdateEquipment(recd_id){
	window.location.href = "../servlet/defaultDispatcher?__action=equipmentManager.preUpdateEquipment&recd_id="+recd_id;
}
// 保存
function submitEqup(){
	if(!checkTourLoginfo()){			// 巡视记录明细
		return false;
	}
	if(!checkEquipmentMaintainLog()){	// 设备维护记录
		return false;
	}
	// checkTourLoginfo();					
	// checkEquipmentMaintainLog();			
	
	$("#form1").submit();
}
// 添加一行（巡视记录明细）
function addTab1(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=equipmentManager.getDictionaryList',
		dataType:'json',
		success:function(dataBack){
			var htmq='';
			for(i=0;i<dataBack.touchObjList.length;i++){
				htmq = htmq+"<option value='"+dataBack.touchObjList[i].CODE+"'>"+dataBack.touchObjList[i].FLAG+"</option>"
			}
			var html = "<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
					   "<td style='text-align: center;'><select name='TOUCH_OBJ'>"+htmq+"</select></td>"+
					   "<td style='text-align: center;'><input type='text' name='TARGET_PLACE' value=''></td>"+
					   "<td style='text-align: center;'><select name='BUSINESS_ISOPEN'><option value='0'>是</option><option value='1'>否</option></select></td>"+
					   "<td style='text-align: center;'><select name='TARGET_SEE'><option value='0'>是</option><option value='1'>否</option></select></td>"+
					   "<td style='text-align: center;'><input type='text' name='ASPECT_TARGET' value=''></td>"+
					   "<td style='text-align: center;'><select name='TARGET_OPERATE'><option value='0'>是</option><option value='1'>否</option></select></td>"+
					   "<td style='text-align: center;'><input type='text' name='USE_RATE' value=''></td>"+
					   "<td style='text-align: center;'><input type='text' name='TOURLOGINFO_REMARK' value=''></td>"+
					   "<td style='text-align: center;'><select name='PROGRAM_OVER'><option value='0'>是</option><option value='1'>否</option></select></td>"+
					   "<td style='text-align: center;'><input type='text' name='VISIT_USER' value=''></td>"+
					   "<td style='text-align: center;'><input type='text' name='VISIT_DATE' value='' readonly='readonly'></td>"+
					   "<td style='text-align: center;'><input type='hidden' name='TRTL_ID' value='aa'>"+
					   "<a href='javascript:void(0);' onclick='delTr(this);'><img src='../images/u103.gif'>删除</a></td>"+
					   "</tr>";
			$("#tab1").append(html);
			$("input[name^='VISIT_DATE']").datepicker($.datepicker.regional['zh-CN']);
		}
	});
}
// 添加一行（设备维护记录）
function addTab2(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=equipmentManager.getDictionaryList',
		dataType:'json',
		success:function(dataBack){
			var htmq='';
			for(i=0;i<dataBack.safetyStatusList.length;i++){
				htmq = htmq+"<option value='"+dataBack.safetyStatusList[i].CODE+"'>"+dataBack.safetyStatusList[i].FLAG+"</option>"
			}
			var hmcl='';
			for(i=0;i<dataBack.safetyStatusList.length;i++){
				hmcl = hmcl+"<option value='"+dataBack.maintainClassList[i].CODE+"'>"+dataBack.maintainClassList[i].FLAG+"</option>"
			}
			var html = "<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
					   "<td style='text-align: center;'><input type='text' name='LEASE_CODE' value=''></td>"+
					   "<td style='text-align: center;'><input type='text' name='RECP_CODE' value=''></td>"+
					   "<td style='text-align: center;'><input type='text' name='EQUIPMENT_NAME' value=''></td>"+
					   "<td style='text-align: center;'><select name='EQUIPMENT_OPERATE'><option value='0'>是</option><option value='1'>否</option></select></td>"+
					   "<td style='text-align: center;'><select name='SAFETY_STATUS'>"+htmq+"</select></td>"+
					   "<td style='text-align: center;'><input type='text' name='LAST_DATE' value='' readonly='readonly'></td>"+
					   "<td style='text-align: center;'><select name='MAINTAIN_CLASS'>"+hmcl+"</select></td>"+
					   "<td style='text-align: center;'><input type='text' name='MAINTAIN_REMARK' value=''></td>"+
					   "<td style='text-align: center;'><input type='hidden' name='EMML_ID' value='bb'>"+
					   "<a href='javascript:void(0);' onclick='delTr(this);'><img src='../images/u103.gif'>删除</a></td>"+
					   "</tr>";
			$("#tab2").append(html);
			$("input[name^='LAST_DATE']").datepicker($.datepicker.regional['zh-CN']);
		}
	});
}
// 删除一行
function delTr(th){
	if(confirm('确认删除？')){
		// var s1 = $(th).parent().parent();
		// var ppji_id = s1.children().eq(0).children().val();
		// var url="../servlet/defaultDispatcher?__action=pointsItems.delItemsManage&ppji_id="+ppji_id;
		// $.getJSON(url);
		$(th).parent().parent().remove();
	}
}
// 验证(巡视记录明细)
function checkTourLoginfo(){
	var flag = true;
	var TOUCH_OBJS = document.getElementsByName("TOUCH_OBJ");
	var TARGET_PLACES = document.getElementsByName("TARGET_PLACE");
	var ASPECT_TARGETS = document.getElementsByName("ASPECT_TARGET");
	var USE_RATES = document.getElementsByName("USE_RATE");
	var TOURLOGINFO_REMARKS = document.getElementsByName("TOURLOGINFO_REMARK");
	var VISIT_USERS = document.getElementsByName("VISIT_USER");
	var VISIT_DATES = document.getElementsByName("VISIT_DATE");
	for(var i=0;i<TOUCH_OBJS.length;i++){
		if(checkBlank(trimStr(TARGET_PLACES[i].value))){
			alert("标的物存放地点不能为空");
			TARGET_PLACES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(ASPECT_TARGETS[i].value))){
			alert("标的物的外观不能为空");
			ASPECT_TARGETS[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(USE_RATES[i].value))){
			alert("机器使用率不能为空");
			USE_RATES[i].focus();
			flag = false;
			break;
		} else if(!checkNumber(trimStr(USE_RATES[i].value))){
			alert("机器使用率请输入正确数字！");
			USE_RATES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(TOURLOGINFO_REMARKS[i].value))){
			alert("补充说明不能为空");
			TOURLOGINFO_REMARKS[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(VISIT_USERS[i].value))){
			alert("回访人员不能为空");
			VISIT_USERS[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(VISIT_DATES[i].value))){
			alert("回访日期不能为空");
			VISIT_DATES[i].focus();
			flag = false;
			break;
		}
	}
	return flag;
}
// 验证(设备维护记录)
function checkEquipmentMaintainLog(){
	var flag = true;
	var EQUIPMENT_OPERATES = document.getElementsByName("EQUIPMENT_OPERATE");
	var LEASE_CODES = document.getElementsByName("LEASE_CODE");
	var RECP_CODES = document.getElementsByName("RECP_CODE");
	var EQUIPMENT_NAMES = document.getElementsByName("EQUIPMENT_NAME");
	var LAST_DATES = document.getElementsByName("LAST_DATE");
	var MAINTAIN_REMARKS = document.getElementsByName("MAINTAIN_REMARK");
	for(var i=0;i<EQUIPMENT_OPERATES.length;i++){
		if(checkBlank(trimStr(LEASE_CODES[i].value))){
			alert("合同号不能为空");
			LEASE_CODES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(RECP_CODES[i].value))){
			alert("支付表号不能为空");
			RECP_CODES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(EQUIPMENT_NAMES[i].value))){
			alert("设备名称不能为空");
			EQUIPMENT_NAMES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(LAST_DATES[i].value))){
			alert("最后一次保养时间不能为空");
			LAST_DATES[i].focus();
			flag = false;
			break;
		}
		if(checkBlank(trimStr(MAINTAIN_REMARKS[i].value))){
			alert("维护情况说明不能为空");
			MAINTAIN_REMARKS[i].focus();
			flag = false;
			break;
		}
	}
	return flag;
}
