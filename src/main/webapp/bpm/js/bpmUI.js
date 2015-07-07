$.bpmUI = function(divId, processId, userId,callback) {
	//$.post(url, data, callback, "json");
	$("#"+divId).load("../servlet/defaultDispatcher?__action=bpmCommand.getTaskUI&processId=" + processId + "&userId=" + ((userId==null)?'':userId) ,null,function() {
		$("#BPM_TASK_BUTTON_COMPLETE").click(function() {
			$("#BPM_TASK_TEXT_COMMENT").val("");
			$("#BPM_TASK_HIDDEN_RESULT").val("C");
			$("#BPM_TASK_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_BUTTON_ACCEPT").click(function() {
			$("#BPM_TASK_TEXT_COMMENT").val("");
			$("#BPM_TASK_HIDDEN_RESULT").val("A");
			$("#BPM_TASK_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_BUTTON_REJECT").click(function() {
			$("#BPM_TASK_TEXT_COMMENT").val("");
			$("#BPM_TASK_HIDDEN_RESULT").val("R");
			$("#BPM_TASK_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_BUTTON_PASS").click(function() {
			$("#BPM_TASK_TEXT_COMMENT").val("");
			$("#BPM_TASK_HIDDEN_RESULT").val("P");
			$("#BPM_TASK_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_BUTTON_IGNORE").click(function() {
			$("#BPM_TASK_TEXT_COMMENT").val("");
			$("#BPM_TASK_HIDDEN_RESULT").val("I");
			$("#BPM_TASK_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_BUTTON_TRANSFER").click(function() {
			$("#BPM_TASK_TRANSFER_DIV_DIALOG").dialog("open");
		});
		$("#BPM_TASK_DIV_DIALOG").dialog({ 
			autoOpen:false, 
			modal:true, 
			buttons:{ 
				'确定':function(){
					if($("#BPM_TASK_TEXT_COMMENT").val()=='') {
						alert('请输入意见!');
						return false;
					}
					$("#BPM_TASK_DIV_DIALOG").dialog("close");
					$.bpmSubmit(
						$("#BPM_TASK_HIDDEN_TASKID").val(),
						$("#BPM_TASK_HIDDEN_USERID").val(),
						$("#BPM_TASK_HIDDEN_RESULT").val(),
						$("#BPM_TASK_TEXT_COMMENT").val(),
						callback
					);
				}
			}
		});
		$("#BPM_TASK_TEXT_DELEGATE_LABEL").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "../servlet/defaultDispatcher",
                    dataType: "json",
                    data: {
                    	'__action' : 'bpmCommand.queryUser',
                        top: 10,
                        content: request.term
                    },
                    success: function(data) {
                    	response(data);
                    }
                });
            },
　　　　　　　　　 select: function(event, ui) {
	 			$("#BPM_TASK_TEXT_DELEGATE_VALUE").val( ui.item.value );
	 			$("#BPM_TASK_TEXT_DELEGATE_LABEL" ).val( ui.item.label );
	 			return false;
            },
            focus: function( event, ui ) {
            	$("#BPM_TASK_TEXT_DELEGATE_VALUE").val( ui.item.value );
            	$("#BPM_TASK_TEXT_DELEGATE_LABEL" ).val( ui.item.label );
            	return false;
            },
            minLength: 0, 
            autoFocus: false, 
            delay: 500 
        });
		$("#BPM_TASK_TRANSFER_DIV_DIALOG").dialog({ 
			autoOpen:false, 
			modal:true, 
			buttons:{ 
				'提交':function(){
					$("#BPM_TASK_TRANSFER_DIV_DIALOG").dialog("close");
					$.bpmDelegate(
						$("#BPM_TASK_HIDDEN_TASKID").val(),
						$("#BPM_TASK_TEXT_DELEGATE_VALUE").val(),
						callback
					);
				}
			}
		});
	});
};

$.bpmDeptUI = function(divId,companyCode,selectDeptId,completeDeptId) {
	//$.post(url, data, callback, "json");
	
	
	$("#"+divId).load("../servlet/defaultDispatcher?__action=bpmCommand.getAllDept&selectDepts="+selectDeptId+"&companyCode=" +companyCode + "&disabledDepts="+completeDeptId + "&random=" + Math.random(),null,function(){
		$(".connectedSortable").sortable({
		      connectWith: ".connectedSortable",
		      opacity: 0.6,
	  	      items: "li:not(.ui-state-disabled)"
	    }).disableSelection();
		
		$("#BPM_DEPTUI_SUBMIT").click(function(){
			var codesOb = $("#selectDept > li");
			
			var auditList = new Array();
			
			var codes = "";
			var showText = "";
			codesOb.each(function(i){
				auditList[auditList.length] = {
					deptId : $(this).attr('deptId'),
					userId : $(this).attr('userId')
				}

				codes = codes + "," + $(this).attr('id');
				showText = showText + " → " + $(this).html();
			});
			
			showText = showText + " → 结束";
			codes = codes.substring(1, codes.length);
			showText = showText.substring(3, showText.length);
			
			$("#BPM_DEPTUI_USERLIST").val(JSON.stringify(auditList));
			$("#BPM_DEPTUI_USERNAMELIST").html(showText);
			$("#BPM_DEPTUI_USERLIST").change();
			$("#deptDiv").dialog("close");
		});
	});
};

$.bpmSubmit = function(taskId, userId, result, comment,callback) {
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.commitTask',
			'taskId' : taskId,
			'userId' : userId,
			'result' : result,
			'comment' : comment
		},
		dataType:'json',
		success: function(dataBack)	{
			if (dataBack.result=='success' && callback != null) {
				callback();
			}
		}
	});
};

$.bpmDelegate = function(taskId, userId, callback) {
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.delegateTask',
			'taskId' : taskId,
			'userId' : userId
		},
		dataType:'json',
		success: function(dataBack)	{
			if (dataBack.result=='success' && callback != null) {
				callback();
			}
		}
	});
};


$.bpmTaskComplete = function(object, processId,callback) {
	//$.post(url, data, callback, "json");
	if(processId == null || processId =='') {
		return;
	}
	$(object).load("../servlet/defaultDispatcher?__action=bpmCommand.selectCompleteTask&processId=" + processId ,null,function() {
	});
};

$.bpmStatusName = function(object, processId,callback) {
	//$.post(url, data, callback, "json");
	if(processId == null || processId =='') {
		$(object).html('未提交');
		return;
	}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.getFlowStatusName',
			'processId' : processId
		},
		dataType:'json',
		scope : this,
		success: function(dataBack)	{
			if (dataBack.result=='success') {
				$(object).html(dataBack.flowStatusName);
			}
		}
	});
};

$.bpmCurrentChargeName = function(object, processId,callback) {
	//$.post(url, data, callback, "json");
	if(processId == null || processId =='') {
		return;
	}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.getCurrentChargeName',
			'processId' : processId
		},
		dataType:'json',
		scope : this,
		success: function(dataBack)	{
			if (dataBack.result=='success') {
				if(dataBack.currentDelegateName == null || dataBack.currentDelegateName == "") {
					$(object).html(dataBack.currentChargeName);
				} else {
					$(object).html(dataBack.currentChargeName + ' <font color=\"red\">('+ dataBack.currentDelegateName +' 代理)</font>');
				}
				
			}
		}
	});
};

$.bpmProcessStatus = function(object, processDefId,flowCode,callback) {
	//$.post(url, data, callback, "json");
	if(processDefId == null || processDefId =='') {
		return;
	}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.getFlowStatusByProcessDefId',
			'processDefId' : processDefId
		},
		dataType:'json',
		scope : this,
		success: function(dataBack)	{
			if (dataBack.result=='success') {
				$(object).append("<option value=''>--全部--</option>"); 
				for ( var i = 0; i < dataBack.flows.length; i++) {
					$(object).append("<option value='" + dataBack.flows[i].flowDefCode + "'>" + dataBack.flows[i].flowName + "</option>");
					if(flowCode!=null) {
						$(object).val(flowCode);
					}
				}
			}
		}
	});
};


$.bpmUpdateProcessData = function(object) {
	if(object == null || object.processId == null || object.dataDefId == null || object.value == null) {
		return;
	}
	
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.updateProcessData',
			'processId' : object.processId,
			'dataDefId' : object.dataDefId,
			'value' : object.value
		},
		dataType:'json',
		scope : ((object.scope != null)? object.scope : this),
		success: ((object.callback != null)? object.callback : function(){})
	});
};

$.bpmGetProcessData = function(object) {
	if(object == null || object.processId == null || object.dataDefId == null) {
		return;
	}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.getProcessData',
			'processId' : object.processId,
			'dataDefId' : object.dataDefId
		},
		dataType:'json',
		scope : ((object.scope != null)? object.scope : this),
		success: ((object.callback != null)? object.callback : function(){})
	});
};

$.bpmGetFlowStatus = function(object) {
	if(object == null || object.processId == null || object.flowDefId == null) {
		return;
	}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:{
			'__action':'bpmCommand.getFlowStatus',
			'processId' : object.processId,
			'flowDefId' : object.flowDefId
		},
		dataType:'json',
		scope : ((object.scope != null)? object.scope : this),
		success: ((object.callback != null)? object.callback : function(){})
	});
};