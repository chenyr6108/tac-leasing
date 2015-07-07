
var openFlag = true;
function add(s){
    var tem;
    tem = document.getElementById(s);
    tem.style.display = "block";
}

function addClos(s){

    var closFlag = false;
    var tem;
    tem = document.getElementById(s);
    if (openFlag) {
        tem.style.display = "block";
        openFlag = false;
        
    }
    else {
        tem.style.display = "none";
        openFlag = true;
    }
    
}

function clos(s){
    var tem;
    tem = document.getElementById(s);
    tem.style.display = "none";
}

function expand(id, prcd_id, rect_id, type,status,contract_type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=rentContract.managePact&PRCD_ID=" + prcd_id + "&RECT_ID=" + rect_id+ "&status=" + status +"&contract_type="+contract_type);
            //$(this).load("../rentcontract/pact.jsp");
        });
    }
    else 
        if (type == 'affix') {
            $("#" + id).toggle(function(){
                $(this).load(ctx + URL);
            });
        }
}

function expandForShow(id, prcd_id, rect_id, type,status,contract_type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=rentContract.managePactForShow&PRCD_ID=" + prcd_id + "&RECT_ID=" + rect_id+ "&status=" + status+"&contract_type="+contract_type);
            //$(this).load("../rentcontract/pact.jsp");
        });
    }
    else 
        if (type == 'affix') {
            $("#" + id).toggle(function(){
                $(this).load(ctx + URL);
            });
        }
}

//查看锁码信息中的支付表
function expandForShowByPlay(id, prcd_id, rect_id, type,status){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=rentContract.managePactForShowByPay&PRCD_ID=" + prcd_id + "&RECT_ID=" + rect_id+ "&status=" + status);
            //$(this).load("../rentcontract/pact.jsp");
        });
    }
    else 
        if (type == 'affix') {
            $("#" + id).toggle(function(){
                $(this).load(ctx + URL);
            });
        }
}

//查看更多备注信息
function ex(id, prcd_id, rect_id, type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=memocontract.Pact&PRCD_ID=" + prcd_id + "&RECT_ID=" + rect_id);
        });
    }
    
}

//查看更多备注信息
function exccc(id,cid,type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=backVisit.queryAllContractByLeaseCode&lease_code_List=" + cid);
        });
    }
    
}


//拨款查看更多付款信息
function exBankMoney(id,CREDIT_ID,type,num){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=backMoney.payMoneyByRect_ID&CREDIT_ID=" + CREDIT_ID+"&NUM="+num);
        });
    }
    
}

//拨款查询保险费下的保单
function exBankMoneyInsurJoin(id,code,type)
{
	 if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=backMoney.payInsuranceJoin&Id=" + code);
        });
    }
}

//拨款查询保险费下的保单
function exMoneyBonusJoin(id,code,type)
{
	 if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=backMoney.payBonusJoin&Id=" + code);
        });
    }
}

//查询所有已上传资料
function exReportRentFile(id,prcd_id,contract_type,type,num){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=backinfo.queryRentFileAll&prcd_id=" + prcd_id+"&contract_type="+contract_type);
        });
    }
    
}

//活动日志查看更多主档信息
function exactivitiesLog(id,custid,type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=activitiesLog.activitiesLogByCustId&cust_id=" + custid);
        });
    }
    
}

//活动日志查看更多主档明细
function exactivitiesLogDetil(id,actilogid,type){
    if (type == 'manage') {
        $("#" + id).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=activitiesLog.activitiesLogByLog&actilog=" + actilogid);
        });
    }
    
}


//ajax添加备注信息
function inserttoremarke(prcd_id, rect_id,contract_type){
    var txt = new RegExp("[ ,\\`,\\~,\\!,\\@,\#,\\$,\\%,\\^,\\+,\\*,\\&,\\\\,\\/,\\?,\\|,\\:,\\<,\\>,\\{,\\},\\(,\\),\\',\\[,\\],\\;,\\=,\"]");
    var nei = $("#cont" + prcd_id).val();
    if (nei == "") {
        alert("请输入备注信息");
        return false;
    }
    
    if (txt.test(nei)) {
        alert("不能输入以下字符:\n , ` ~ ! @ # $ % ^ + & * \\ / ? | : . < > {} () [] \" ");
        return false;
    }
    var cont = $("#cont" + prcd_id).val();
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=memocontract.inserttoremark&cont=' +
        cont +
        '&PRCD_ID=' +
        prcd_id +
        '&RECT_ID' +
        rect_id,
        dataType: 'json',
        success: function(dataBack){
            $("#pactAffix" + prcd_id).load("../servlet/defaultDispatcher?__action=rentContract.managePact&PRCD_ID=" + prcd_id + "&RECT_ID=" + rect_id+"&contract_type="+contract_type);
            
        }
    });
}



$(function(){
    $("#datebegin").datepicker($.datepicker.regional['zh-CN']);
});

$(function(){
    $.datepicker.regional['zh-CN'] = {
        clearText: '清除',
        clearStatus: '清除已选日期',
        closeText: '关闭',
        closeStatus: '不改变当前选择',
        prevText: '&lt;上月',
        prevStatus: '显示上月',
        nextText: '下月&gt;',
        nextStatus: '显示下月',
        currentText: '今天',
        currentStatus: '显示本月',
        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
        monthNamesShort: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
        monthStatus: '选择月份',
        yearStatus: '选择年份',
        weekHeader: '周',
        weekStatus: '年内周次',
        dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
        dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
        dayStatus: '设置 DD 为一周起始',
        dateStatus: '选择 m月 d日, DD',
        dateFormat: 'yy-mm-dd',
        firstDay: 1,
        initStatus: '请选择日期',
        isRTL: false,
        changeMonth: true,
        changeYear: true
    };
    $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
    $("#dateend").datepicker();
});




function rentfile(id,CONTRACT_TYPE,forShow,TRFS_STATE,RECT_STATUS){
    $("#rentfile").toggle(function(){
        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFile&prcd_id=" + id + "&cardFlag=0&CONTRACT_TYPE="+CONTRACT_TYPE + "&forShow=" + forShow + "&TRFS_STATE=" + TRFS_STATE + "&RECT_STATUS=" + RECT_STATUS);
        
		$("#rentfile").dialog({
		        modal: true,
		        autoOpen: false,
		        width: 900
		    });
		    $("#rentfile").dialog('open');        
    });
}

function postManage(id,CONTRACT_TYPE){
    $("#rentfile").toggle(function(){
        $("#rentfile").load("../servlet/defaultDispatcher?__action=rentContract.queryRentPostFile&cardFlag=2&prcd_id=" + id + "&CONTRACT_TYPE="+CONTRACT_TYPE + "&QSEARCH_VALUE="+$("#QSEARCH_VALUE").val());
        
		$("#rentfile").dialog({
		        modal: true,
		        autoOpen: false,
		        width: 900
		    });
		$("#rentfile").dialog('open');        
    });
}
//功能介绍：检查是否为数字
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:08
// Lingo
function cheumber(checkStr)
{
    var regex = /^[\+\-]?\d+(\.\d+)?$/;

    return regex.test(checkStr);
}




function assignPage(){
    var num = $.trim($("#assign").val());
	if (num == null || num == '') {
		return;
	}
	else {
	 var flag =cheumber(num);
	
	if (flag) {
			var tol = $("#total").text();
			if (num <= 1) {
				firstPage();
			}
			if (tol <= num) {
				lastPage();
			}
			
			showLog($("#logRecordid").val(), num);
		}
	}
}


function firstPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    
    showLog($("#logRecordid").val(),$("#fuse").val(), 0)
    
}

function prevPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    var num = $("#pageNum").text();
    showLog($("#logRecordid").val(),$("#fuse").val(), (num - 1));
}

function lastPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return
    }
    showLog($("#logRecordid").val(),$("#fuse").val(), $("#total").text());
}

function nextPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return
    }
    var mun = $("#pageNum").text()
    showLog($("#logRecordid").val(), $("#fuse").val(),(mun-1+2 ));
}

function showBusinessLog(prjt,prcd){
   
   if(prcd==null||prcd==''){
   		showLog(prjt,1, 0);
		
   }
   if(prjt==null||prjt==''){
   
   		showLog(1,prcd, 0);
   } 
	showLog(prjt,prcd, 0);
}

//日志的弹出层js   select t.credit_id,t.contract_id from t_sys_businesslog t where  contract_id='521' and credit_id is not null 
function showLog(id,prcd, pageNum){
    $("#logRecordid").val("");
	$("#fuse").val("");
    $("#logRecordid").val(id);
	$("#fuse").val(prcd);
    
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=businessLog.showBusinessLog&PRJT_ID=' + id + '&pageNum=' + pageNum+'&PRCD_ID='+prcd,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            var pageNum = json.count.pageNum;
            var total = json.count.total;
            var barNum = json.count.barNum;
            $("#pageNum").empty();
            $("#total").empty();
            $("#barNum").empty();
            $("#pageNum").append(pageNum);
            $("#total").append(total);
            $("#barNum").append(barNum);
            var log = json.log
            
            for (var i = 0; i < log.length; i++) {
                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center'>" +(i+1) + "</td><td style='text-align:center'>" + log[i].LOG_CODE + " &nbsp;</td><td style='text-align:center'>" + log[i].LOG_TYPE + " &nbsp;</td><td style='text-align:center'>" + log[i].LOG_TITLE + " &nbsp;</td><td style='text-align:center'>" + log[i].USER_NAME + " &nbsp;</td><td style='text-align:center'>" + log[i].CREATE_DATE + "&nbsp;</td><td style='text-align:left'>" + log[i].MEMO + " &nbsp;</td></tr>");
                
            }
            openAddInsureType('showBusinessLog');
        }
        
    })
    
}
// 导出确认函
function pdfRentConfirmation(){
	var checkValue = $('input[name="credit_idxx"]:checked');
	if(checkValue.length<1 || checkValue.length>1){
		alert("请选择一份合同");
		return false;
	}else{
		var contract_type = $(checkValue[0]).parent().find("input[name='contract_type']").val();
		if(contract_type==0){ 				// 一般租赁确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.includeLeases&PRCD_ID="+$(checkValue[0]).val();
		}else if(contract_type==1){			// 委托购买确认函
			window.location.href="../servlet/defaultDispatcher?__action=rentContract.consignmentFinancialLeasing&PRCD_ID="+$(checkValue[0]).val();
		}
	}
}


