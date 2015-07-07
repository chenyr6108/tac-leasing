function checkIsExpiredByCreditId(creditId){
	alert(999);
	var url = "../servlet/defaultDispatcher";
	alert(url);
	var data = {"__action" : "businessSupport.getIsExpiredByCreditId",
				"credit_id" : creditId};
	$.getJSON(url, data, function (result){
		if(result){
			alert(111);
			return false;
		} else {
			alert(222);
		}
	});
}
function checkIsExpiredByCreditRuncode(creditRuncode){
	
}

function openNewTab(url,path,title){
	openTab({tabName:title,location:url+'/servlet/defaultDispatcher?__action='+path});			
}

//25行to function是业务人员综合页面button的script
//供应商维护清单
function supplier() {
	window.location.href="../servlet/defaultDispatcher?__action=supplier.findAllSupplier&isSalesDesk=Y";  
}

//客户维护清单
function customer() {
	window.location.href="../servlet/defaultDispatcher?__action=customer.query&isSalesDesk=Y";
}

//资料中客户清单
function dataOnGoing() {
	window.location.href="../servlet/defaultDispatcher?__action=creditReport.creditManage&isSalesDesk=Y";
}

//访厂客户清单
function access() {
	window.location.href="../servlet/defaultDispatcher?__action=visitCommand.visitReportManager&isSalesDesk=Y"; 
}

//审查中客户清单
function audit() {
	window.location.href="../servlet/defaultDispatcher?__action=riskAudit.riskAuditShow&isSalesDesk=Y&wind_state=1";
}

//已核准客户清单
function approve() {
	window.location.href="../servlet/defaultDispatcher?__action=rentContract.queryRentContractForShow&isSalesDesk=Y";
}

//待补文件清单
function pending() {
	window.location.href="../servlet/defaultDispatcher?__action=creditReport.getAllUnCompletedFileCompany&isSalesDesk=Y";
}

//延滞客户清单
function delay() {
	window.location.href="../servlet/defaultDispatcher?__action=dunTask.manage&isSalesDesk=Y";
}

//案件查询
function caseQuery() {
	window.location.href="../servlet/defaultDispatcher?__action=creditReport.caseQuery&isSalesDesk=Y";
}

function createDropDownList(map, thisEle){
	var temp = "";
	var div = $("<div>");
	var valueText = $("<input>");
	var searchButton = $("<button>▼</button>");
	if(thisEle.attr("id") == null){
		thisEle.attr("id", "ui_element_" + $("*").length);
	}
	if($("#" + thisEle.attr("id") + "_dropDownList_value").length == 0){
		var defaultData = {
				source: map,
				minLength: 0,
				search: function() {
					$(this).val($.trim($(this).val()));
				},
				select: function(event, ui){
					$(this).val(ui.item.label);
					$("#" + $(this).attr("id") + "_dropDownList_value").val(ui.item.value);
					return false;
				},
				focus: function(event, ui){
					$(this).val(ui.item.label);
					return false;
				},
				close: function(event, ui){
					var active = $(document.activeElement);
					if(active.attr("class") != searchButton.attr("class")
							&& active.attr("id") != thisEle.attr("id")){
	  					if($("#" + $(this).attr("id") + "_dropDownList_value").val() == ""){
							$(this).val("");
						}
	  					$(this).attr("title", $(this).val());
	  					$(this).trigger("afterSelect");
					}
				},
				open: function(){
					$(".ui-autocomplete").css("minWidth", parseInt(thisEle.css("width").replace("px", "")) + 20 - 5);
				}
			};
		div.addClass("drop-down-list");
		div.css("width", thisEle.css("width"));
		div.css("heigth", thisEle.css("heigth"));
		div.css("lineHeight", thisEle.css("heigth"));
		thisEle.css("width", parseInt(thisEle.css("width").replace("px", "")) - 20);
		thisEle.after(div);
		thisEle.appendTo(div);
		valueText.attr("type", "hidden");
		valueText.attr("name", thisEle.attr("name"));
		valueText.attr("id", thisEle.attr("id") + "_dropDownList_value");
		thisEle.attr("name", "_" + thisEle.attr("name"));
		thisEle.after(valueText);
		searchButton.css("height", thisEle.css("height"));
		//searchButton.css("height", "24px");
		searchButton.css("width", "20px");
		searchButton.css("padding", "0px");
		searchButton.css("text-align", "left");
		searchButton.css("border", 0);
		searchButton.addClass("ui-dropDownList-buttom");
		searchButton.attr("disabled", thisEle.attr("disabled"));
		searchButton.bind("click", function(){
			thisEle.val($.trim(temp));
			if($(".ui-autocomplete:visible").length == 0){
				thisEle.autocomplete("search", "");
			} else {
				thisEle.autocomplete("close");
			}
			thisEle.focus();
			return false;
		});
		thisEle.after(searchButton);
		//var data = $.extend(true, defaultData, dataList);
		thisEle
		.autocomplete(defaultData)
		.bind("input", function (){
			$("#" + $(this).attr("id") + "_dropDownList_value").val("");
			$(this).autocomplete("search", $.trim(thisEle.val()));
		})
		.bind("blur", function (){
			temp = $(this).val();
			if(temp != "" && $(this).getValue() == ""){
				$.each(map, function (i, e){
					if(map[i].label.indexOf(temp) != -1){
						thisEle.val(map[i].label);
						valueText.val(map[i].value);
						temp = map[i].label;
						thisEle.attr("title", map[i].label);
					}
				});
			} else {
				if($("#" + $(this).attr("id") + "_dropDownList_value").val() == ""){
					$(this).val("");
				}
			}
			
		});
	} else {
		thisEle.autocomplete({
			source: map
		});
	}
	var thisValue = thisEle.val();
	if(thisValue != ""){
		$.each(map, function (i, e){
			//alert(map[i].label);
			if(valueText.val() == ""){
				if(thisValue == map[i].value){
					thisEle.val(map[i].label);
					valueText.val(map[i].value);
					temp = map[i].label;
					thisEle.attr("title", map[i].label);
				} else if(thisValue == map[i].label){
					thisEle.val(map[i].label);
					valueText.val(map[i].value);
					temp = map[i].label;
					thisEle.attr("title", map[i].label);
				}
			}
		});
	}
}

$.fn.extend({
	dropDownList : function (dataList){
		var thisEle = $(this);
		if(dataList.__action == null){
			createDropDownList(dataList, thisEle);
			thisEle.trigger("afterLoad");
		} else {
			$.ajax({
	  			url : "../servlet/defaultDispatcher",
	  			data : dataList,
	  			dataType : "json",
	  			success : function (data){
	  				var map = $.map(data, function (item){
	  					return{
	  						label : item.display_name,
	  						value : item.option_value
	  					};
	  				});
	  				createDropDownList(map, thisEle);
	  				thisEle.trigger("afterLoad");
	  			}
	  		});
		}
	},
	getValue : function (){
		return $("#" + $(this).attr("id") + "_dropDownList_value").val();
	},
	setValue : function (value){
		if($("#" + $(this).attr("id") + "_dropDownList_value").length > 0){
			$("#" + $(this).attr("id") + "_dropDownList_value").val("");
		}
		return $(this);
	},
	cleanValue : function (){
		$(this).val("");
		if($("#" + $(this).attr("id") + "_dropDownList_value").length > 0){
			$("#" + $(this).attr("id") + "_dropDownList_value").val("");
		}
		return $(this);
	}
});

var all_user_map = null;
var valid_user_map = null;
var cust_map = null;
var all_guarantor_map = null;
var all_supl_name_map = null;

function userDropDownList(e){
	if($(e).attr("tagName") != undefined){
		if(valid_user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "employeeCommand.getAllEmpInfo"},
				dataType : "json",
				success : function (data){
					valid_user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$(e).dropDownList(valid_user_map);
				}
			});
		} else {
			$(e).dropDownList(valid_user_map);
		}
	}
}

function custDropDownList(e){
	if($(e).attr("tagName") != undefined){
		if(valid_user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "businessSupport.getAllCust"},
				dataType : "json",
				success : function (data){
					valid_user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$(e).dropDownList(valid_user_map);
				}
			});
		} else {
			$(e).dropDownList(valid_user_map);
		}
	}
}

function suplDropDownList(e){
	if($(e).attr("tagName") != undefined){
		if(all_supl_name_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "businessSupport.getAllSupl"},
				dataType : "json",
				success : function (data){
					all_supl_name_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$(e).dropDownList(all_supl_name_map);
				}
			});
		} else {
			$(e).dropDownList(all_supl_name_map);
		}
	}
}

function guarantorDropDownList(e){
	if($(e).attr("tagName") != undefined){
		if(all_guarantor_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "businessSupport.getAllGuarantor"},
				dataType : "json",
				success : function (data){
					all_guarantor_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$(e).dropDownList(all_guarantor_map);
				}
			});
		} else {
			$(e).dropDownList(all_guarantor_map);
		}
	}
}

function userDropDownListWithoutStatus(e){
	if($(e).attr("tagName") != undefined){
		if(all_user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "employeeCommand.getAllEmpWithoutStatus"},
				dataType : "json",
				success : function (data){
					all_user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$(e).dropDownList(all_user_map);
				}
			});
		} else {
			$(e).dropDownList(all_user_map);
		}
	}
}

function dataDictionaryDropDownList(e, type){
	if($(e).attr("tagName") != undefined){
		$(e).dropDownList({"__action" : "businessSupport.getDataDictionaryForSelect"
			, "type" : type});
	}
}

function saveDataSession(pageCode, credit_id, flag){
	var inputData = "";
	var selectData = "";
	$(".dataSession").find("input").each(function (){
		if($(this).attr("type") == "text" || $(this).attr("type") == "hidden"){
			inputData +=  ($(this).attr("id") + ":" + $(this).attr("name") + ":" + $(this).val() + "█");
		}
		if($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio"){
			if($(this).attr("checked")){
				inputData +=  ($(this).attr("id") + ":" + $(this).attr("name") + ":" + $(this).val() + "█");
			}
		}
	});
	
	$(".dataSession").find("select").each(function (){
		selectData +=  ($(this).attr("id") + ":" + $(this).attr("name") + ":" + $(this).val() + "█");
	});
	$(".dataSession").find("textarea").each(function (){
		selectData +=  ($(this).attr("id") + ":" + $(this).attr("name") + ":" + $(this).val() + "█");
	});
	var url = "../servlet/defaultDispatcher?__action=dataSessionCommand.saveDataSession";
	var param = {"pageCode" : pageCode, "inputData" : (inputData + selectData), "credit_id" : credit_id};
	$.post(url, param, function (data){
		if(flag){
			setTimeout("saveDataSession('" + pageCode + "', '" + credit_id + "', '" + flag + "')", 5 * 60 * 1000);
			//setTimeout("saveDataSession('" + pageCode + "', '" + credit_id + "', '" + flag + "')", 5 * 1000);
		}
	}, "json");
}

function getDataSession(pageCode, credit_id){
	var url = "../servlet/defaultDispatcher?__action=dataSessionCommand.getDataSession";
	var param = {"pageCode" : pageCode, "credit_id" : credit_id};
	var item = null;
	$.post(url, param, function (data){
		if(data == null || data.length <= 0){
			alert("没有保存的数据。");
		}
		$.each(data, function(i,e){
			if(e.ITEM_ID != null && e.ITEM_ID != ""){
				item = $("#" + e.ITEM_ID);
				loadSessionData(item, e);
			} else {
				item = $("input[name='" + e.ITEM_KEY + "']");
				if(item.length == 0){
					item = $("select[name='" + e.ITEM_KEY + "']");
				}
				if(item.length >= 0){
					item.each(function (){
						loadSessionData($(this), e);
					});
				}
			}
		});
	}, "json");
}

function loadSessionData(item, e){
	if(item.attr("type") == "text" || item.attr("type") == "hidden" || item.attr("tagName") == "textarea"){
		item.val(e.ITEM_VALUE);
	}
	if(item.attr("tagName") == "TEXTAREA"){
		item.val(e.ITEM_VALUE);
	}
	if(item.attr("type") == "checkbox" || item.attr("type") == "radio"){
		if(item.val() == e.ITEM_VALUE){
			item.attr("checked", true);
			item.trigger("click");
		} else {
			item.attr("checked", false);
		}
	}
}

