var radio1="";
var radio2="";
var flag="";
var color="";
var isNY="";
function showUpdateDiv() {
		if($("#creditSpecial").val()=="") {
			return;
		}
		
		var row1="";var row2="";var row3="";var row4="";var row5="";var row6="";
		var row7="";var row8="";var row9="";var row10="";var row11="";var row12="";
		var row13="";var row14="";var row15="";var row16="";var row17="";var row18="";
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditSpecialCommand.queryCreditSpecialGroupMap&creditSpecialCode='+$("#creditSpecial").val(),
			dataType:'json',
			success: function(data) {
				var resultList=data.speccialMapList;
				var brandNames=data.brandNames;
				var suplNames=data.suplNames;
				var suplIds=data.suplIds;
				var provinceList=data.provinceList;
				var areaLimitIds=data.areaLimitIds;
				var areaLimitNames=data.areaLimitNames;
				var table=$("#updateTable");//获得加行的表
				table.html("");//初始化清空表中的内容
				
				$("#startDate").html("专案启始日期："+resultList[0].startDateDescr);
				$("#endDate").html("专案结束日期："+resultList[0].endDateDescr);
				
				for(var i=0;i<resultList.length;i++) {
					if(resultList[i].propertyCode=='LEASE_PRODUCTION_NAME') {//租赁物名称
						commonMethod(resultList,i,1);
						row1='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物名称：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PRODUCTION_NAME" id="LEASE_PRODUCTION_NAME" value="'+resultList[i].value1+'" '+flag+'"></td></tr>';
					} else if(resultList[i].propertyCode=='LEASE_PRODUCTION_BRAND') {//租赁物品牌
				    	commonMethod(resultList,i,2);
				    	var brandInfo="";
				    	if(brandNames==""&&brandNames==null&&brandNames.length==0) {
				    		brandInfo='<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND0" '+flag+'">&nbsp;&nbsp;<img id="newImg" src="../images/add.gif" alt="新增" style="cursor: pointer;"">';
				    	} else {
				    		for(var j=0;j<brandNames.length;j++) {
				    			if(j==0) {
				    				brandInfo='<input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" value="'+brandNames[j]+'"'+flag+'">&nbsp;&nbsp;<img id="newImg" src="../images/add.gif" alt="新增" style="cursor: pointer;"">';
				    			} else {
				    				brandInfo=brandInfo+'<br id="bbr'+j+'"><input name="LEASE_PRODUCTION_BRAND" id="LEASE_PRODUCTION_BRAND'+j+'" value="'+brandNames[j]+'"'+flag+'>&nbsp;&nbsp;<img id="delImg'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;">';
				    			}
				    		}
				    	}
						row2='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物品牌：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr" id="brandTd">'+brandInfo+'</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PRODUCTION_IS_LOCK') {//租赁物是否锁码
				    	commonMethod(resultList,i,3);
				    	if(resultList[i].value1=='锁码'||resultList[i].value1=='') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'" checked="checked">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不锁码') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'" checked="checked">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row3='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否锁码：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="锁码"'+flag+'">锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不锁码"'+flag+'">不锁码&nbsp;<input type="radio" name="LEASE_PRODUCTION_IS_LOCK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='LEASE_PRODUCTION_HAS_PLEDGE') {//租赁物是否设定抵押权
				    	commonMethod(resultList,i,4);
				    	if(resultList[i].value1=='设定'||resultList[i].value1=='') {
				    		row4='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否设定抵押权：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="设定"'+flag+'" checked="checked">&nbsp;不设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不设定"'+flag+'"></td></tr>';
				    	} else if(resultList[i].value1=='不设定') {
				    		row4='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁物是否设定抵押权：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="设定"'+flag+'">&nbsp;不设定<input type="radio" name="LEASE_PRODUCTION_HAS_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不设定"'+flag+'" checked="checked"></td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='SUPPLIER_NAME') {//供应商名称
				    	commonMethod(resultList,i,5);
				    	var supplierInfo="";
				    	if(suplNames==""&&suplNames==null&&suplNames.length==0) {
				    		supplierInfo='<input name="SUPPLIER_NAME" id="SUPPLIER_NAME0"'+flag+'"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID0">&nbsp;&nbsp;<img id="addImg" src="../images/add.gif" alt="新增" style="cursor: pointer;">';
				    	} else {
				    		for(var j=0;j<suplNames.length;j++) {
				    			if(j==0) {
				    				supplierInfo='<input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" value="'+suplNames[j]+'"'+flag+'"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'" value="'+suplIds[j]+'">&nbsp;&nbsp;<img id="addImg" src="../images/add.gif" alt="新增" style="cursor: pointer;">';
				    			} else {
				    				supplierInfo=supplierInfo+'<br id="br'+j+'"><input name="SUPPLIER_NAME" id="SUPPLIER_NAME'+j+'" value="'+suplNames[j]+'"'+flag+'"><input type="hidden" name="SUPPLIER_ID" id="SUPPLIER_ID'+j+'" value="'+suplIds[j]+'">&nbsp;&nbsp;<img id="img'+j+'" src="../images/del.gif" alt="删除" style="cursor: pointer;">';
				    			}
				    		}
				    	}
				    	row5='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商名称：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr" id="supplierTd">'+supplierInfo+'</td></tr>';
				    } else if(resultList[i].propertyCode=='SUPPLIER_LEVEL_LIMIT') {//供应商级别限制
				    	commonMethod(resultList,i,6);
				    	var a="";var a2="";var a3="";var a4="";var a5="";
				    	if(resultList[i].value1=='1') {
				    		a="selected='selected'";
				    	} else if(resultList[i].value1=='2') {
				    		a2="selected='selected'";
				    	} else if(resultList[i].value1=='3') {
				    		a3="selected='selected'";
				    	} else if(resultList[i].value1=='4') {
				    		a4="selected='selected'";
				    	} else if(resultList[i].value1=='5') {
				    		a5="selected='selected'";
				    	}
				    	row6='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商级别(含或以上)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><select name="SUPPLIER_LEVEL_LIMIT" id="SUPPLIER_LEVEL_LIMIT"'+flag+'"><option value="1" '+a+'>A</option><option value="2" '+a2+'>2A</option><option value="3" '+a3+'>3A</option><option value="4" '+a4+'>4A</option><option value="5" '+a5+'>5A</option></select></td></tr>';
				    } else if(resultList[i].propertyCode=='PAY_WAY') {//付款方式
				    	commonMethod(resultList,i,7);
				    	if(resultList[i].value1=='网银汇款'||resultList[i].value1=='') {
				    		row7='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">付款方式：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="PAY_WAY" '+flag+'" value="网银汇款" checked="checked" style="cursor:pointer;vertical-align: middle;">网银汇款&nbsp;<input type="radio" name="PAY_WAY" '+flag+'" value="支票付款" style="cursor:pointer;vertical-align: middle;">支票付款<input name="PAY_DAY" id="PAY_DAY" value="'+resultList[i].value2+'" disabled="disabled" style="width:40px;display:none;"></td></tr>';
				    	} else {
				    		row7='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">付款方式：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="PAY_WAY" '+flag+'" value="网银汇款" style="cursor:pointer;vertical-align: middle;">网银汇款&nbsp;<input type="radio" name="PAY_WAY" '+flag+'" value="支票付款" checked="checked" style="cursor:pointer;vertical-align: middle;">支票付款<input name="PAY_DAY" id="PAY_DAY" value="'+resultList[i].value2+'" style="width:40px;display:none;"></td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='IS_PAY_BEFORE') {//是否交机前拨款
				    	commonMethod(resultList,i,8);
				    	if(resultList[i].value1=='交机前拨款'||resultList[i].value1=='') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'" checked="checked">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='交机后拨款') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'" checked="checked">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row8='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">是否交机前拨款：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机前拨款"'+flag+'">交机前拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="交机后拨款"'+flag+'">交机后拨款&nbsp;<input type="radio" name="IS_PAY_BEFORE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } else if(resultList[i].propertyCode=='SUPPLIER_UNION_PLEDGE') {//供应商连保
				    	commonMethod(resultList,i,9);
				    	if(resultList[i].value1=='全面连保'||resultList[i].value1=='') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'" checked="checked">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='全面回购') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'" checked="checked">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row9='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商保证：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面连保"'+flag+'">全面连保&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="全面回购"'+flag+'">全面回购&nbsp;<input type="radio" name="SUPPLIER_UNION_PLEDGE" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    } /*else if(resultList[i].propertyCode=='SUPPLIER_BUY_BACK') {//供应商回购
				    	commonMethod(resultList,i,10);
				    	if(resultList[i].value1=='回购'||resultList[i].value1=='') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'" checked="checked">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不回购') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'" checked="checked">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'">不限制</td></tr>';
				    	} else if(resultList[i].value1=='不限制') {
				    		row10='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">供应商回购：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="回购"'+flag+'">回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不回购"'+flag+'">不回购&nbsp;<input type="radio" name="SUPPLIER_BUY_BACK" style="cursor:pointer;vertical-align: middle;" value="不限制"'+flag+'" checked="checked">不限制</td></tr>';
				    	}
				    }*/ else if(resultList[i].propertyCode=='TOTAL_MONEY') {//专案总承做金额
				    	commonMethod(resultList,i,11);
				    	row11='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">专案总承做金额上限(不含)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="TOTAL_MONEY" id="TOTAL_MONEY" value="'+resultList[i].value1+'"'+flag+'">元</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PERIOD') {//租赁期数
				    	commonMethod(resultList,i,12);
				    	var fromPeriod=resultList[i].value1;
				    	if(fromPeriod==''||fromPeriod==null) {
				    		fromPeriod=12;
				    	}
				    	row12='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁期数：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PERIOD" id="LEASE_PERIOD_1" value="'+fromPeriod+'"'+flag+'" style="width:40px;">月~<input name="LEASE_PERIOD" id="LEASE_PERIOD_2" value="'+resultList[i].value2+'"'+flag+'" style="width:40px;">月</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_TR') {//租赁TR
				    	commonMethod(resultList,i,13);
				    	row13='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁TR：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_TR" id="LEASE_TR_1" value="'+resultList[i].value1+'"'+flag+'" style="width:40px;">%~<input name="LEASE_TR" id="LEASE_TR_2" value="'+resultList[i].value2+'"'+flag+'" style="width:40px;">%</td></tr>';
				    } else if(resultList[i].propertyCode=='LEASE_PERCENT') {//租赁成数
				    	commonMethod(resultList,i,14);
				    	row14='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">租赁成数上限(不含)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="LEASE_PERCENT" id="LEASE_PERCENT" value="'+resultList[i].value1+'"'+flag+'" style="width:40px;">%</td></tr>';
				    } else if(resultList[i].propertyCode=='SINGLE_MONEY') {//单案金额
				    	commonMethod(resultList,i,15);
				    	row15='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">单案金额上限(不含)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="SINGLE_MONEY" id="SINGLE_MONEY" value="'+resultList[i].value1+'"'+flag+'" style="width:40px;">万元</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_MONEY_TOPLIMIT') {//承租人归户金额上限
				    	commonMethod(resultList,i,16);
				    	row16='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">承租人归户金额上限(不含)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="CUSTOMER_MONEY_TOPLIMIT" id="CUSTOMER_MONEY_TOPLIMIT" value="'+resultList[i].value1+'"'+flag+'" style="width:40px;">万元</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_REGISTER_PERIOD') {//承租人成立年限
				    	commonMethod(resultList,i,17);
				    	row17='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">承租人成立年限(含或以上)：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="CUSTOMER_REGISTER_PERIOD" id="CUSTOMER_REGISTER_PERIOD" value="'+resultList[i].value1+'"'+flag+'" style="width:40px;">月</td></tr>';
				    } else if(resultList[i].propertyCode=='CUSTOMER_AREA_LIMIT') {
				    	commonMethod(resultList,i,18);
				    	var option="";//省
				    	var optoin1="";//市
				    	var option2="";//区
				    	if(resultList[i].value1!=null&&resultList[i].value1!="") {
				    		optoin1="<option value='"+areaLimitIds[1]+"' selected='selected'>"+areaLimitNames[1]+"</option>";
				    		optoin2="<option value='"+areaLimitIds[2]+"' selected='selected'>"+areaLimitNames[2]+"</option>";
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
				    	row18='<tr><td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">'+isNY+'</td><td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">不承做地区：</td><td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><select name="CUSTOMER_AREA_LIMIT" id="province_id" '+flag+'" style="width:80px;">'+option+'</select><select name="CUSTOMER_AREA_LIMIT" id="city_id" '+flag+'" style="width:80px;">'+optoin1+'</select><select name="CUSTOMER_AREA_LIMIT" id="area_id" '+flag+'" style="width:80px;">'+optoin2+'</select></td></tr>';
				    }
					
				//for循环结束
				}
				//table加入行  row4租赁物抵押权废除
				table.append('<tr><td style="text-align:center;" class="ui-state-default ui-th-ltr zc_grid_head">是否限制</td><td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;">限制内容</td>').
				append(row1).append(row2).append(row3).append(row4).append(row5).append(row6).append(row7).append(row8).append(row9).append(row10).append(row11).append(row12).append(row13).append(row14).append(row15).append(row16).append(row17).append(row18);
				//css使所有radio居中
				$("input[type=radio]").css("margin-top","-2px");
			}
		});
		$("#updateDiv").dialog({modal:true, autoOpen:false, width:500, position:['center',40], hide:'slide', show:'slide'});
		$("#updateDiv").dialog("open");
}


function commonMethod(resultList,i,num) {
	if(resultList[i].checkValue=='Y') {
		isNY="是";
		flag="disabled=disabled";
		radio1='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" checked="checked" value="Y" disabled="disabled">';
		radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" value="N" disabled="disabled">';
		color="style='color:black '";
		if(resultList[i].isNeed=='Y') {
			color="style='color:gray '";
			radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" disabled="disabled" value="N" onclick="disCol('+num+')">';
		}
	} else {
		isNY="否";
		flag="disabled=disabled";
		radio1='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" value="Y" disabled="disabled">';
		radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" checked="checked" value="N" disabled="disabled">';
		color="style='color:black '";
		if(resultList[i].isNeed=='Y') {
			color="style='color:gray '";
			radio2='<input type="radio" name="row'+num+'" style="cursor:pointer;vertical-align: middle;" disabled="disabled" value="N" onclick="disCol('+num+')">';
		}
	}
}
