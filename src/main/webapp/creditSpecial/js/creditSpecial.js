var radio1="";
var radio2="";
var flag="";
var color="";
function showUpdateDiv(startDateDescr,endDateDescr,creditSpecialCode) {
		$("#id").val(creditSpecialCode);
		$("#startDate").val(startDateDescr);
		$("#endDate").val(endDateDescr);
		var row1="";var row2="";var row3="";var row4="";var row5="";var row6="";
		var row7="";var row8="";var row9="";var row10="";var row11="";var row12="";
		var row13="";var row14="";var row15="";var row16="";var row17="";var row18="";
		var row19="";var row20="";var row21="";
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditSpecialCommand.queryCreditSpecialGroupMap&creditSpecialCode='+creditSpecialCode,
			dataType:'json',
			success: function(data) {
				var resultList=data.speccialMapList;
				var brandNames=data.brandNames;
				var suplNames=data.suplNames;
				var suplIds=data.suplIds;
				var provinceList=data.provinceList;
				var officeList =data.officeList;
				var areaLimitIds=data.areaLimitIds;
				var areaLimitNames=data.areaLimitNames;
				var table=$("#updateTable");//获得加行的表
				table.html("");//初始化清空表中的内容
				for(var i=0;i<resultList.length;i++) {
					
					if(resultList[i].propertyCode=='LEASE_PRODUCTION_NAME') {//租赁物名称
						commonMethod(resultList,i,1);
						row1='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物名称：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PRODUCTION_NAME" id="LEASE_PRODUCTION_NAME" value="'+resultList[i].value1+'"'+flag+'" onchange="empty2()"></td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PRODUCTION_BRAND') {//租赁物品牌
				    	commonMethod(resultList,i,2);
				    	var brandInfo="";
				    	if(brandNames==""&&brandNames==null&&brandNames.length==0) {
				    		brandInfo='<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND0" '+flag+'" onchange="empty3(0)">&nbsp;&nbsp;<img id="newImg" src="../images/add.gif" alt="新增" style="cursor: pointer;" onclick="addBrand()">';
				    	} else {
				    		for(var j=0;j<brandNames.length;j++) {
				    			if(j==0) {
				    				brandInfo='<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" value="'+brandNames[j]+'"'+flag+'" onchange="empty3('+j+')">&nbsp;&nbsp;<img id="newImg" src="../images/add.gif" alt="新增" style="cursor: pointer;" onclick="addBrand()">';
				    			} else {
				    				brandInfo=brandInfo+'<br id="bbr'+j+'"><input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" value="'+brandNames[j]+'"'+flag+' onchange="empty3('+j+')">&nbsp;&nbsp;<img id="delImg'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delBrand('+j+')">';
				    			}
				    		}
				    	}
						row2='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物品牌：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr" id="brandTd">'+brandInfo+'</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PRODUCTION_IS_LOCK') {//租赁物是否锁码
				    	commonMethod(resultList,i,3);
				    	if(resultList[i].value1=='锁码'||resultList[i].value1=='') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'" checked="checked">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不锁码') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'" checked="checked">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='LEASE_PRODUCTION_HAS_PLEDGE') {//租赁物是否设定抵押权
				    	commonMethod(resultList,i,4);
				    	if(resultList[i].value1=='设定'||resultList[i].value1=='') {
				    		row4='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否设定抵押权：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="设定"'+flag+'" checked="checked">&nbsp;不设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不设定"'+flag+'"></td></tr>';
				    	} else if(resultList[i].value1=='不设定') {
				    		row4='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否设定抵押权：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="设定"'+flag+'">&nbsp;不设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不设定"'+flag+'" checked="checked"></td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='SUPPLIER_NAME') {//供应商名称
				    	commonMethod(resultList,i,5);
				    	var supplierInfo="";
				    	if(suplNames==""&&suplNames==null&&suplNames.length==0) {
				    		supplierInfo='<input name="SUPPLIER_NAME" id="SUPPLIER_NAME0"'+flag+'" onchange="empty(0)"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID0">&nbsp;&nbsp;<img id="addImg" src="../images/add.gif" alt="新增" style="cursor: pointer;" onclick="addSupplier()">';
				    	} else {
				    		for(var j=0;j<suplNames.length;j++) {
				    			if(j==0) {
				    				supplierInfo='<input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" value="'+suplNames[j]+'"'+flag+'" onchange="empty('+j+')"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'" value="'+suplIds[j]+'">&nbsp;&nbsp;<img id="addImg" src="../images/add.gif" alt="新增" style="cursor: pointer;" onclick="addSupplier()">';
				    			} else {
				    				supplierInfo=supplierInfo+'<br id="br'+j+'"><input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" value="'+suplNames[j]+'"'+flag+'" onchange="empty('+j+')"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'" value="'+suplIds[j]+'">&nbsp;&nbsp;<img id="img'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delSupplier('+j+')">';
				    			}
				    		}
				    	}
				    	row5='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商名称：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr" id="supplierTd">'+supplierInfo+'</td></tr>';
				    } else if(resultList[i].propertyCode=='SUPPLIER_LEVEL_LIMIT') {//供应商级别限制
				    	commonMethod(resultList,i,6);
				    	var a="";var a2="";var a3="";var a4="";var a5="";
				    	if(resultList[i].value1=='1') {//1A
				    		a="selected='selected'";
				    	} else if(resultList[i].value1=='2') {//2A
				    		a2="selected='selected'";
				    	} else if(resultList[i].value1=='3') {//...
				    		a3="selected='selected'";
				    	} else if(resultList[i].value1=='4') {
				    		a4="selected='selected'";
				    	} else if(resultList[i].value1=='5') {
				    		a5="selected='selected'";
				    	}
				    	row6='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商级别：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><select name="SUPPLIER_LEVEL_LIMIT" id="SUPPLIER_LEVEL_LIMIT"'+flag+'"><option value="1" '+a+'>A</option><option value="2" '+a2+'>2A</option><option value="3" '+a3+'>3A</option><option value="4" '+a4+'>4A</option><option value="5" '+a5+'>5A</option></select></td></tr>';
				    } else if(resultList[i].propertyCode=='PAY_WAY') {//付款方式
				    	commonMethod(resultList,i,7);
				    	if(resultList[i].value1=='网银汇款'||resultList[i].value1=='') {
				    		row7='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">付款方式：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="PAY_WAY" '+flag+'" value="网银汇款" checked="checked" onclick="disInput()" style="cursor:pointer;vertical-align: middle;">网银汇款&nbsp;<input type="radio" name="PAY_WAY" '+flag+'" value="支票付款" onclick="enInput()" style="cursor:pointer;vertical-align: middle;">支票付款<input name="PAY_DAY" id="PAY_DAY" value="'+resultList[i].value2+'" disabled="disabled" style="width:40px;display:none;" onkeyup="limitNum(\'PAY_DAY\')"></td></tr>';
				    	} else {
				    		row7='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">付款方式：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="PAY_WAY" '+flag+'" value="网银汇款" onclick="disInput()" style="cursor:pointer;vertical-align: middle;">网银汇款&nbsp;<input type="radio" name="PAY_WAY" '+flag+'" value="支票付款" checked="checked" onclick="enInput()" style="cursor:pointer;vertical-align: middle;">支票付款<input name="PAY_DAY" id="PAY_DAY" value="'+resultList[i].value2+'" style="width:40px;display:none;" onkeyup="limitNum(\'PAY_DAY\')"></td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='IS_PAY_BEFORE') {//是否交机前拨款
				    	commonMethod(resultList,i,8);
				    	if(resultList[i].value1=='交机前拨款'||resultList[i].value1=='') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'" checked="checked">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='交机后拨款') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'" checked="checked">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='SUPPLIER_UNION_PLEDGE') {//供应商连保
				    	commonMethod(resultList,i,9);
				    	if(resultList[i].value1=='全面连保'||resultList[i].value1=='') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'" checked="checked">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='全面回购') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'" checked="checked">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } /*else if(resultList[i].propertyCode=='SUPPLIER_BUY_BACK') {//供应商回购
				    	commonMethod(resultList,i,10);
				    	if(resultList[i].value1=='回购'||resultList[i].value1=='') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'" checked="checked">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不回购') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'" checked="checked">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    }*/ else if(resultList[i].propertyCode=='TOTAL_MONEY') {//专案总承做金额
				    	commonMethod(resultList,i,11);
				    	row11='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">专案总承做金额：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="TOTAL_MONEY" id="TOTAL_MONEY" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitNum(\'TOTAL_MONEY\')">元</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PERIOD') {//租赁期数
				    	commonMethod(resultList,i,12);
				    	var fromPeriod=resultList[i].value1;
				    	if(fromPeriod==''||fromPeriod==null) {
				    		fromPeriod=12;
				    	}
				    	row12='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁期数：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PERIOD" id="LEASE_PERIOD_1" value="'+fromPeriod+'"'+flag+'" onkeyup="limitNum(\'LEASE_PERIOD_1\')" style="width:40px;">月~<input name="LEASE_PERIOD" id="LEASE_PERIOD_2" value="'+resultList[i].value2+'"'+flag+'" onkeyup="limitNum(\'LEASE_PERIOD_2\')" style="width:40px;">月</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_TR') {//租赁TR
				    	commonMethod(resultList,i,13);
				    	row13='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁TR：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_TR" id="LEASE_TR_1" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitFloat(\'LEASE_TR_1\')" style="width:40px;">%~<input name="LEASE_TR" id="LEASE_TR_2" value="'+resultList[i].value2+'"'+flag+'" onkeyup="limitFloat(\'LEASE_TR_2\')" style="width:40px;">%</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PERCENT') {//租赁成数
				    	commonMethod(resultList,i,14);
				    	row14='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁成数：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PERCENT" id="LEASE_PERCENT" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitFloat(\'LEASE_PERCENT\')" onchange="limitPercent(\'LEASE_PERCENT\')" style="width:40px;">%</td></tr>';
				    } else if(resultList[i].propertyCode=='SINGLE_MONEY') {//单案金额
				    	commonMethod(resultList,i,15);
				    	row15='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">单案金额：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="MIN_SINGLE_MONEY" id="MIN_SINGLE_MONEY" value="'+resultList[i].value2+'"'+flag+'" onkeyup="limitFloat(\'MIN_SINGLE_MONEY\')" onchange="limitMoney(\'MIN_SINGLE_MONEY\')" style="width:40px;">万元~<input name="SINGLE_MONEY" id="SINGLE_MONEY" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitFloat(\'SINGLE_MONEY\')" onchange="limitMoney(\'SINGLE_MONEY\')" style="width:40px;">万元</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_MONEY_TOPLIMIT') {//承租人归户金额上限
				    	commonMethod(resultList,i,16);
				    	row16='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">承租人归户金额上限：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="CUSTOMER_MONEY_TOPLIMIT" id="CUSTOMER_MONEY_TOPLIMIT" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitFloat(\'CUSTOMER_MONEY_TOPLIMIT\')" style="width:40px;">万元</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_REGISTER_PERIOD') {//承租人成立年限
				    	commonMethod(resultList,i,17);
				    	row17='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">承租人成立年限：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="CUSTOMER_REGISTER_PERIOD" id="CUSTOMER_REGISTER_PERIOD" value="'+resultList[i].value1+'"'+flag+'" onkeyup="limitNum(\'CUSTOMER_REGISTER_PERIOD\')" style="width:40px;">月</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_AREA_LIMIT') {
				    	commonMethod(resultList,i,18);
				    	var option="";//省
				    	var optoin1="";//市
				    	var option2="";//区
				    	if(resultList[i].value1!=null&&resultList[i].value1!="") {
				    		optoin1="<option value='"+areaLimitIds[1]+","+areaLimitNames[1]+"' selected='selected'>"+areaLimitNames[1]+"</option>";
				    		optoin2="<option value='"+areaLimitIds[2]+","+areaLimitNames[2]+"' selected='selected'>"+areaLimitNames[2]+"</option>";
				    		for(var j=0;j<provinceList.length;j++) {
				    			if(areaLimitIds[0]==provinceList[j].ID) {//areaLimitIds[0]是省的ID
				    				option=option+"<option value='"+provinceList[j].ID+","+provinceList[j].NAME+"' selected='selected'>"+provinceList[j].NAME+"</option>";
				    			} else {
				    				option=option+"<option value='"+provinceList[j].ID+","+provinceList[j].NAME+"'>"+provinceList[j].NAME+"</option>";
					    		}
					    	}
				    	} else {
				    		optoin1="<option value='-1,不限制'>不限制</option>";
				    		optoin2="<option value='-1,不限制'>不限制</option>";
				    		for(var j=0;j<provinceList.length;j++) {
					    		option=option+"<option value='"+provinceList[j].ID+","+provinceList[j].NAME+"'>"+provinceList[j].NAME+"</option>";
					    	}
				    	}
				    	row18='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">不承做地区：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><select name="CUSTOMER_AREA_LIMIT" id="province_id" '+flag+'" onchange="getCitys();" style="width:80px;">'+option+'</select><select name="CUSTOMER_AREA_LIMIT" id="city_id" '+flag+'" onchange="getArea();" style="width:80px;">'+optoin1+'</select><select name="CUSTOMER_AREA_LIMIT" id="area_id" '+flag+'" style="width:80px;">'+optoin2+'</select></td></tr>';
				    } else if(resultList[i].propertyCode=='VISITATION') {//访厂要求
				    	commonMethod(resultList,i,19);
				    	var o2Selected = null;
				    	if(resultList[i].value1 == "N"){
				    		o2Selected = "selected=\"selected\"";  
				    	}
				    	var element = "<select name=\"VISITATION\" " + flag + "><option value=\"Y\">需要</option><option value=\"N\" " + o2Selected + ">不需要</option></select>";
				    	row19='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">审查访厂要求：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">' + element + '</td></tr>';
				    }else if(resultList[i].propertyCode=='PRODUCT_RATE'){//新增产品占比限制
				    	commonMethod(resultList,i,20);
				    	var level= resultList[i].value1.split(",");
				    	var rate= resultList[i].value2.split(",");  

				    	var html = '<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">主要产品占比限制1：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">';
				    	var leves = new Array(6);
				    	leves[0] = 'A';
				    	leves[1] = 'AA';
				    	leves[2] = 'AAA';
				    	leves[3] = 'B';
				    	leves[4] = 'BB';
				    	leves[5] = 'BBB';
				    	for(var x=0;x<level.length;x++){
				    		if(x==0){
						    	var levelOptions ='级别:<select name="PRODUCT_LEVEL" id="PRODUCT_LEVEL" '+flag+' >';
						    	
						    	if(!level[x]||level[x]==''){
						    		levelOptions +="<option value=\"\" selected=\"selected\">--请选择--</option>";
						    	}else{
						    		levelOptions +="<option value=\"\">--请选择--</option>";
						    	}
						    	for(var j=0;j<leves.length;j++){
						    		if(level[x]==leves[j]){
						    			levelOptions +="<option value=\""+leves[j]+"\" selected=\"selected\">"+leves[j]+"</option>";
						    		}else{
						    			levelOptions +="<option value=\""+leves[j]+"\">"+leves[j]+"</option>";
						    		}
						    	}
						    	levelOptions +='</select>占比：<input name="PRODUCT_RATE" id="PRODUCT_RATE" value="'+rate[x]+'"'+flag+'" onkeyup="limitFloat(\'PRODUCT_RATE\')" style="width:40px;">% <img  src="../images/add.gif" alt="新增" style="cursor: pointer;" onclick="addProductRateRow()"><br id="productRateRow">';
						    	html+=levelOptions;
				    		}else{ 
				    			var pid= new Date().getTime();
				    			var levelOptions ='<p id="p_'+pid+'">级别:<select name="PRODUCT_LEVEL" '+flag+' >';;
				    			
				    			if(!level[x]||level[x]==''){
						    		levelOptions +="<option value=\"\" selected=\"selected\">--请选择--</option>";
						    	}else{
						    		levelOptions +="<option value=\"\">--请选择--</option>";
						    	}
						    	for(var j=0;j<leves.length;j++){
						    		if(level[x]==leves[j]){
						    			levelOptions +="<option value=\""+leves[j]+"\" selected=\"selected\">"+leves[j]+"</option>";
						    		}else{
						    			levelOptions +="<option value=\""+leves[j]+"\">"+leves[j]+"</option>";
						    		}
						    	}
				    			levelOptions += '</select>占比：<input name="PRODUCT_RATE" id="PRODUCT_RATE'+pid+'" value="'+rate[x]+'"'+flag+'" onkeyup="limitFloat(\'PRODUCT_RATE'+pid+'\')" style="width:40px;">% <img  src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="deleteProductRateRow(\''+pid+'\')"></p>';				    			
				    			html+=levelOptions;
				    		}
				    	}
				    	html+='</td></tr>';
				    	row20=html;
				    }else if(resultList[i].propertyCode=='BELONGDEPT') {
				    	commonMethod(resultList,i,21);
				    	var html = '<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+radio1+'是&nbsp;&nbsp;'+radio2+'<font '+color+'>否</font></td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">承做区域：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">';
				    	var deptInfo="";
				    	var isAll= resultList[i].value1;
				    	var deptList= resultList[i].value2.split(","); 
				    	//全国
				    	if(isAll==""|| isAll==null || isAll=="Y") {
				    		deptInfo='<input type="radio" name="IS_ALL" style="cursor:pointer;vertical-align: middle;" value="Y"  checked="checked" onclick="allDept()";>全国&nbsp;<input type="radio" name="IS_ALL" style="cursor:pointer;vertical-align: middle;" value="N" onclick="noAllDept();" >地区 &nbsp; &nbsp;';
				    		deptInfo+='</br>';
				    		for(var j=1;j<officeList.length;j++){
					    			deptInfo +="<input type='checkbox' name='officeInput' value='"+officeList[j-1].DECP_ID+"' disabled='disabled'/>"+officeList[j-1].DECP_NAME_CN+"&nbsp;";
					    			if(j%3==0){
					    				deptInfo+="</br>";
					    			}
				    		}
				    		
				        //区域
				    	} else{
				    		deptInfo='<input type="radio" name="IS_ALL" style="cursor:pointer;vertical-align: middle;" value="Y" onclick="allDept()"; >全国&nbsp;<input type="radio" name="IS_ALL" checked="checked" style="cursor:pointer;vertical-align: middle;" value="N" onclick="noAllDept();" >地区 &nbsp; ';
				    		deptInfo+='</br>';
				    		
				    		for(var j=1;j<officeList.length;j++){
				    		 var checked=false;
				    			for(var x=0;x<deptList.length;x++){
				    				if(officeList[j-1].DECP_ID==deptList[x]){
				    					checked=true;
				    				}
				    			}
				    			if(checked){
				    				deptInfo +="<input type='checkbox' name='officeInput' value='"+officeList[j-1].DECP_ID+"' checked='checked'/>"+officeList[j-1].DECP_NAME_CN+"&nbsp;";
				    			}else {
				    				deptInfo +="<input type='checkbox' name='officeInput' value='"+officeList[j-1].DECP_ID+"'/>"+officeList[j-1].DECP_NAME_CN+"&nbsp;";
				    			}
				    			if(j%3==0){
					    				deptInfo+="</br>";
					    		}
				    		}
				    	}
				    	row21=html+deptInfo+'</td></tr>';
				    }
				//for循环结束
				}
				
				//table加入行  row4租赁物抵押权废除
				row4="<tr style='displayed:none'></tr>";
				row10="<tr style='displayed:none'></tr>";
				table.append(row1).append(row2).append(row3).append(row4).append(row5).append(row6).append(row7).append(row8).append(row9).append(row10).append(row11).append(row12).append(row13).append(row14).append(row15).append(row16).append(row17).append(row18).append(row19).append(row20).append(row21);
				
				//css使所有radio居中
				$("input[type=radio]").css("margin-top","-2px");
				
				//获得租赁物名称
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditSpecialCommand.getMaintaninceType',
					dataType:'json',
					success: function(dataList) {
						var options = {
										minChars : 1,
										max : 25,
										mustMatch: false,
										width:260,
										matchContains: true,
										formatItem : function(row, i, max) {
											return row.CODE;
										},
										formatMatch : function(row, i, max) {
											return row.CODE + " " + row.FLAG;
										},
										formatResult : function(row) {
											return row.CODE;
										}
									   };
						
						$("#LEASE_PRODUCTION_NAME").autocomplete(dataList,options);
						$("#LEASE_PRODUCTION_NAME").result(function(event,data,formatted) {
							//do nothing
						});
					}
				});
				
				//获得租赁物厂牌
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=creditSpecialCommand.getBrandList',
					dataType:'json',
					success: function(dataList) {
						var options = {
										minChars : 1,
										max : 25,
										mustMatch: false,
										width:260,
										matchContains: true,
										formatItem : function(row, i, max) {
											return row.THING_KIND;
										},
										formatMatch : function(row, i, max) {
											return row.THING_KIND + " " + row.THING_KIND;
										},
										formatResult : function(row) {
											return row.THING_KIND;
										}
									   };
						if($("input[name=LEASE_PRODUCTION_BRAND]").length==1) {
							$("#LEASE_PRODUCTION_BRAND0").autocomplete(dataList,options);
							$("#LEASE_PRODUCTION_BRAND0").result(function(event,data,formatted) {
								//do nothing
							});
						} else {
							for(var i=0;i<$("input[name=LEASE_PRODUCTION_BRAND]").length;i++) {
								$("#LEASE_PRODUCTION_BRAND"+i).autocomplete(dataList,options);
								$("#LEASE_PRODUCTION_BRAND"+i).result(function(event,data,formatted) {
									//do nothing
								});
							}
						}
					}
				});
				
				//供应商名称栏位获得数据
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=supplierGroupCommand.getSuplList',
					dataType:'json',
					success: function(dataList) {
					
						var options = {
										minChars : 1,
										max : 25,
										mustMatch: false,
										width:260,
										matchContains: true,
										formatItem : function(row, i, max) {
											return row.suplName;
										},
										formatMatch : function(row, i, max) {
											return row.suplId + " " + row.suplName;
										},
										formatResult : function(row) {
											return row.suplName;
										}
									   };
						
						if($("input[name=SUPPLIER_ID]").length==1) {
							$("#SUPPLIER_NAME0").autocomplete(dataList,options);
							$("#SUPPLIER_NAME0").result(function(event,data,formatted) {
								$("#SUPPLIER_ID0").val(data.suplId);
							});
						} else {
							for(var j=0;j<$("input[name=SUPPLIER_ID]").length;j++) {
								$("#SUPPLIER_NAME"+j).autocomplete(dataList,options);
								autoResult(j);
								/*$("#SUPPLIER_NAME"+j).result(function(event,data,formatted) {
									$("#SUPPLIER_ID"+j).val(data.suplId);
								});*/
							}
						}
					}
				});
				
				for(var i=0;i<table.find("tr").length;i++) {//初始化控制灰掉的控件
					if(table.find("tr").eq(i).find("td").eq(0).find("input").eq(1).attr("checked")) {
						table.find("tr").eq(i).find("td").eq(1).css("color","gray");
						table.find("tr").eq(i).find("td").eq(2).css("color","gray");
						if(i==1) {//如果租赁物品牌radio=否 初始化废除添加的js
							$("#newImg").attr("onclick","");
							$("#newImg").unbind();
						} else if(i==4) {//如果供应商名称radio=否 初始化废除添加的js
							$("#addImg").attr("onclick","");
							$("#addImg").unbind();
						} 
					}
				}
			}
		});
		
		$("#updateDiv").dialog({modal:true, autoOpen:false, width:500, position:['center',40], hide:'slide', show:'slide'});
		$("#updateDiv").dialog("open");
}

function autoResult(j) {
	if(j<=$("input[name=SUPPLIER_ID]").length) {
		$("#SUPPLIER_NAME"+j).result(function(event,data,formatted) {
			$("#SUPPLIER_ID"+j).val(data.suplId);
			j++;
			autoResult(j);
		});
	}
}

function addBrand() {
	var j=$("input[name=LEASE_PRODUCTION_BRAND]").length;
	
	$("#brandTd").append("<br id='bbr"+j+"'>").append('<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" onchange="empty3('+j+')">&nbsp;&nbsp;<img id="delImg'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delBrand('+j+')">');

	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditSpecialCommand.getBrandList',
		dataType:'json',
		success: function(dataList) {
			var options = {
							minChars : 1,
							max : 25,
							mustMatch: false,
							width:260,
							matchContains: true,
							formatItem : function(row, i, max) {
								return row.THING_KIND;
							},
							formatMatch : function(row, i, max) {
								return row.THING_KIND + " " + row.THING_KIND;
							},
							formatResult : function(row) {
								return row.THING_KIND;
							}
						   };
				$("#LEASE_PRODUCTION_BRAND"+j).autocomplete(dataList,options);
				$("#LEASE_PRODUCTION_BRAND"+j).result(function(event,data,formatted) {
					//do nothing
				});
		}
	});
}

function delBrand(j) {
	$("#bbr"+j).remove();
	$("#LEASE_PRODUCTION_BRAND"+j).remove();
	$("#delImg"+j).remove();
}

function addSupplier() {
	var j=$("input[name=SUPPLIER_NAME]").length;
	
	$("#supplierTd").append("<br id='br"+j+"'>").append('<input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" onchange="empty('+j+')"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'">&nbsp;&nbsp;<img id="img'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delSupplier('+j+')">');

	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supplierGroupCommand.getSuplList',
		dataType:'json',
		success: function(dataList) {
		
			var options = {
							minChars : 1,
							max : 25,
							mustMatch: false,
							width:260,
							matchContains: true,
							formatItem : function(row, i, max) {
								return row.suplName;
							},
							formatMatch : function(row, i, max) {
								return row.suplId + " " + row.suplName;
							},
							formatResult : function(row) {
								return row.suplName;
							}
						   };
			
			$("#SUPPLIER_NAME"+j).autocomplete(dataList,options);
			autoResult(j);
			/*$("#SUPPLIER_NAME"+j).result(function(event,data,formatted) {
				$("#SUPPLIER_ID"+j).val(data.suplId);
			});*/
		}
	});
}

var addB = function () {
var j=$("input[name=LEASE_PRODUCTION_BRAND]").length;
	
	$("#brandTd").append("<br id='bbr"+j+"'>").append('<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" onchange="empty3('+j+')">&nbsp;&nbsp;<img id="delImg'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delBrand('+j+')">');

	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditSpecialCommand.getBrandList',
		dataType:'json',
		success: function(dataList) {
			var options = {
							minChars : 1,
							max : 25,
							mustMatch: false,
							width:260,
							matchContains: true,
							formatItem : function(row, i, max) {
								return row.THING_KIND;
							},
							formatMatch : function(row, i, max) {
								return row.THING_KIND + " " + row.THING_KIND;
							},
							formatResult : function(row) {
								return row.THING_KIND;
							}
						   };
				$("#LEASE_PRODUCTION_BRAND"+j).autocomplete(dataList,options);
				$("#LEASE_PRODUCTION_BRAND"+j).result(function(event,data,formatted) {
					//do nothing
				});
		}
	});
};

var addS = function () {
	var j=$("input[name=SUPPLIER_NAME]").length;
	
	$("#supplierTd").append("<br id='br"+j+"'>").append('<input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" onchange="empty('+j+')"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'">&nbsp;&nbsp;<img id="img'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;" onclick="delSupplier('+j+')">');

	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supplierGroupCommand.getSuplList',
		dataType:'json',
		success: function(dataList) {
		
			var options = {
							minChars : 1,
							max : 25,
							mustMatch: false,
							width:260,
							matchContains: true,
							formatItem : function(row, i, max) {
								return row.suplName;
							},
							formatMatch : function(row, i, max) {
								return row.suplId + " " + row.suplName;
							},
							formatResult : function(row) {
								return row.suplName;
							}
						   };
			
			$("#SUPPLIER_NAME"+j).autocomplete(dataList,options);
			autoResult(j);
			/*$("#SUPPLIER_NAME"+j).result(function(event,data,formatted) {
				$("#SUPPLIER_ID"+j).val(data.suplId);
			});*/
		}
	});
};

function delSupplier(j) {
	$("#br"+j).remove();
	$("#SUPPLIER_NAME"+j).remove();
	$("#SUPPLIER_ID"+j).remove();
	$("#img"+j).remove();
}

function empty(i) {//如果不选择autocomplete的内容,直接修改供应商栏位则清空供应商信息
	$("#SUPPLIER_NAME"+i).val('');
	$("#SUPPLIER_ID"+i).val('');
}

function empty3(i) {//如果不选择autocomplete的内容,直接修改供应商栏位则清空供应商信息
	$("#LEASE_PRODUCTION_BRAND"+i).val('');
}

function empty2() {
	$("#LEASE_PRODUCTION_NAME").val("");
}

function enInput() {//付款方式中如果选择支票,付款天数
	$("input[name=PAY_DAY]").attr("disabled","");
}
function disInput() {
	$("input[name=PAY_DAY]").attr("disabled","disabled");
}

/*限制
/*支票付款输入栏位
/*专案承做总金额 栏位
/*只能输入数字*/
function limitNum(id) {
	$("#"+id).val($("#"+id).val().replace(/[^\d]/g,''));
	if(parseInt($("#"+id).val())==0) {
		$("#"+id).val('');
	}
}

function limitFloat(id) {
	$("#"+id).val($("#"+id).val().replace(/[^(\d|\.)]/g,''));
	if(parseInt($("#"+id).val())==0) {
		$("#"+id).val('');
	}
	if($("#"+id).val().substring(0,1)=='.') {
		$("#"+id).val('');
	}
}

function limitPercent(id) {
	if(parseFloat($("#"+id).val())<40||parseFloat($("#"+id).val())>100) {
		$("#"+id).val('');
	}
}

function limitMoney(id) {
	if(parseFloat($("#"+id).val())<20||parseFloat($("#"+id).val())>300) {
		$("#"+id).val('');
	}
}

function commonMethod(resultList,i,num) {
	if(resultList[i].checkValue=='Y') {
		flag="";
		radio1='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" checked="checked" value="Y" onclick="enCol('+num+')">';
		radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" value="N" onclick="disCol('+num+')">';
		color="style='color:black '";
		if(resultList[i].isNeed=='Y') {
			color="style='color:gray '";
			radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" disabled="disabled" value="N" onclick="disCol('+num+')">';
		}
	} else {
		flag="disabled=disabled";
		radio1='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" value="Y" onclick="enCol('+num+')">';
		radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" checked="checked" value="N" onclick="disCol('+num+')">';
		color="style='color:black '";
		if(resultList[i].isNeed=='Y') {
			color="style='color:gray '";
			radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" disabled="disabled" value="N" onclick="disCol('+num+')">';
		}
	}
}


function enCol(num) {//点选是或者否radio控制后面td内容的样式等
	if(num==1) {
		$("#LEASE_PRODUCTION_NAME").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==2) {
		$("input[name=LEASE_PRODUCTION_BRAND]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
		$("#newImg").bind("click",addB);
	} else if(num==3) {
		$("input[name=LEASE_PRODUCTION_IS_LOCK]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==4) {
		$("input[name=LEASE_PRODUCTION_HAS_PLEDGE]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==5) {
		$("input[name=SUPPLIER_NAME]").attr("disabled","");
		$("input[name=SUPPLIER_ID]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
		$("#addImg").bind("click",addS);
	} else if(num==6) {
		$("select[name=SUPPLIER_LEVEL_LIMIT]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==7) {
		$("input[name=PAY_WAY]").attr("disabled","");
		if($("input[name=PAY_WAY]").eq(0).attr("checked")==false) {
			$("input[name=PAY_DAY]").attr("disabled","");
		}
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==8) {
		$("input[name=IS_PAY_BEFORE]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==9) {
		$("input[name=SUPPLIER_UNION_PLEDGE]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==10) {
		$("input[name=SUPPLIER_BUY_BACK]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==11) {
		$("input[name=TOTAL_MONEY]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==12) {
		$("input[name=LEASE_PERIOD]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==13) {
		$("input[name=LEASE_TR]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==14) {
		$("input[name=LEASE_PERCENT]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==15) {
		$("input[name=SINGLE_MONEY]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==16) {
		$("input[name=CUSTOMER_MONEY_TOPLIMIT]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==17) {
		$("input[name=CUSTOMER_REGISTER_PERIOD]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==18) {
		$("select[name=CUSTOMER_AREA_LIMIT]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	} else if(num==19) {
		$("select[name='VISITATION']").attr("disabled",false);
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
	}else if(num==20){
		$("select[name=PRODUCT_LEVEL]").attr("disabled",false);
		$("input[name=PRODUCT_RATE]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
		
	}else if(num==21){
		$(":radio[name=IS_ALL][value='Y']").attr("checked","true");
		$("input[name=IS_ALL]").attr("disabled","");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","black");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","black");
		
	}
	
}

function disCol(num) {
	if(num==1) {
		$("#LEASE_PRODUCTION_NAME").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==2) {
		$("input[name=LEASE_PRODUCTION_BRAND]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
		$("#newImg").attr("onclick","");
		$("#newImg").unbind();
	} else if(num==3) {
		$("input[name=LEASE_PRODUCTION_IS_LOCK]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==4) {
		$("input[name=LEASE_PRODUCTION_HAS_PLEDGE]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==5) {
		$("input[name=SUPPLIER_NAME]").attr("disabled","disabled");
		$("input[name=SUPPLIER_ID]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
		$("#addImg").attr("onclick","");
		$("#addImg").unbind();
	} else if(num==6) {
		$("select[name=SUPPLIER_LEVEL_LIMIT]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==7) {
		$("input[name=PAY_WAY]").attr("disabled","disabled");
		$("input[name=PAY_DAY]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==8) {
		$("input[name=IS_PAY_BEFORE]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==9) {
		$("input[name=SUPPLIER_UNION_PLEDGE]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==10) {
		$("input[name=SUPPLIER_BUY_BACK]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==11) {
		$("input[name=TOTAL_MONEY]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==12) {
		$("input[name=LEASE_PERIOD]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==13) {
		$("input[name=LEASE_TR]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==14) {
		$("input[name=LEASE_PERCENT]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==15) {
		$("input[name=SINGLE_MONEY]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==16) {
		$("input[name=CUSTOMER_MONEY_TOPLIMIT]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==17) {
		$("input[name=CUSTOMER_REGISTER_PERIOD]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==18) {
		$("select[name=CUSTOMER_AREA_LIMIT]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	} else if(num==19) {
		$("select[name='VISITATION']").attr("disabled",true);
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	}else if(num==20){
		$("select[name=PRODUCT_LEVEL]").attr("disabled",true);
		$("input[name=PRODUCT_RATE]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	}else if(num==21){
		$("input[name=IS_ALL]").attr("disabled","disabled");
		$("input[name=officeInput]").attr("disabled","disabled");
		$("#updateTable tr").eq(num-1).find('td').eq(1).css("color","gray");
		$("#updateTable tr").eq(num-1).find('td').eq(2).css("color","gray");
	}
}

function getCitys() {
	provinceId=$("#province_id").val().split(",")[0];
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
			dataType:'json',
			success:function(dataBack) { 
				 $('#city_id option').each(function() {  
					 if($(this).val()!='-1'){
				        $(this).remove();  
					 }
				 });
				 $('#area_id option').each(function() {  
				     if($(this).val()!='-1'){  
				        $(this).remove();  
				     }  
				 });
				 $("#city_id").get(0).options.add(new Option("不限制","-1,不限制"));
				 $("#area_id").get(0).options.add(new Option("不限制","-1,不限制"));
				 for(var i=0;i<dataBack.citys.length;i++) {
					 $("#city_id").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID+","+dataBack.citys[i].NAME));
				 }
			}
	});
}
function getArea() {
	cityId=$("#city_id").val().split(",")[0];
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
			dataType:'json',
			success:function(dataBack) { 
				 $('#area_id option').each(function() {  
				       $(this).remove();  
				 });
				 if(dataBack.area.length==0) {
					 $("#area_id").get(0).options.add(new Option("不限制","-1,不限制"));
				 }
				 for(var i=0;i<dataBack.area.length;i++) {
					 $("#area_id").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID+","+dataBack.area[i].NAME));
				 }
			}
	});
}
function addProductRateRow(){	
	var leves = new Array(6);
	leves[0] = 'A';
	leves[1] = 'AA';
	leves[2] = 'AAA';
	leves[3] = 'B';
	leves[4] = 'BB';
	leves[5] = 'BBB';
	var id = new Date().getTime();
	var levelOptions ="<p id=\"p_"+ id +"\">级别:<select name=\"PRODUCT_LEVEL\">";
	levelOptions +="<option value=\"\" selected=\"selected\">--请选择--</option>";

	for(var j=0;j<leves.length;j++){
		levelOptions +="<option value=\""+leves[j]+"\">"+leves[j]+"</option>";
	}
	levelOptions += "</select>占比：<input id=\"PRODUCT_RATE_"+id+"\" name=\"PRODUCT_RATE\" onkeyup=\"limitFloat(\'PRODUCT_RATE_"+id+"\')\" style=\"width:40px;\">%";
	levelOptions += "<img src=\"../images/del.gif\" alt=\"删除\" style=\"cursor: pointer;\" onclick=\"deleteProductRateRow('"+id+"')\"></p>";
	$("#productRateRow").after(levelOptions);
}

function deleteProductRateRow(id){
	$("#p_"+id).remove();	
}
//全国
function allDept(){
	//$("select[name=officeList]").attr("disabled",true);
	$("input[name=officeInput]").attr("disabled","disabled");
	// document.getElementById("showDecpList").innerHTML="";
}
//区域
function noAllDept(){
	$("input[name=officeInput]").attr("disabled","");
	//$("select[name=officeList]").attr("disabled",false);
	
}

