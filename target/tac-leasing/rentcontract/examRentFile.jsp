<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/multiSelectlib" prefix="mSelect"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>业管初审</title>
		<script src="${ctx }/rentcontract/js/json2.js" type="text/javascript"></script>
		<script src="${ctx }/rentcontract/js/selectCard.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		
		var ALLOW_CHANGE_FILETYPE = ${ ALLOW_CHANGE_FILETYPE };
		
		function formatCurrency(num) {
		    num = num.toString().replace(/\$|\,/g,'');
		    if(isNaN(num))
		    num = "0";
		    sign = (num == (num = Math.abs(num)));
		    num = Math.floor(num*100+0.50000000001);
		    cents = num%100;
		    num = Math.floor(num/100).toString();
		    if(cents<10)
		    cents = "0" + cents;
		    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		    num = num.substring(0,num.length-(4*i+3))+','+
		    num.substring(num.length-(4*i+3));
		    return '￥' + (((sign)?'':'-') + num + '.' + cents);
		}
		
		function checkItem(e, allName,issureName)
		{
			 var all = document.getElementsByName(allName)[0];
			  if(!e.checked) all.checked = false;
			  else
			  {
			    var aa = document.getElementsByName(e.name);
			    for (var i=0; i<aa.length; i++)
			     if(!aa[i].checked) return;
			    all.checked = true;
			  }
		}
			
		function subRentFile(){
			var cardFlag=$("#cardFlag").val();
			if (cardFlag==2){
				var invoiceData = new Array();
				$(".invoiceStatus").each(function(index){
					if($(this).attr("orginvalue")!=$(this).val()) {
						invoiceData[invoiceData.length] = {
							id : $(this).attr("id").substr(14),
							invoice_id : $(this).attr("invoiceId"),
							status : $(this).val()
						};
					}
				});
				$("#invoiceData").val(JSON.stringify(invoiceData));
				var fileData = new Array();
				$('input[id^="changeflag_"][value="true"]').each(function(index){
					var refi_id = $(this).attr("refi_id");
					var row_index = $(this).attr("row");
					var is_already_detail = $("select[changetag='rent_ids_"+refi_id+"']").val();
					var is_already = null;
					if (is_already_detail == 1 || is_already_detail == 2) {
						is_already = 1;
					} else {
						is_already = 0;
					}
					fileData[index] = {
						refd_id2 : $("input[name='refd_idC"+row_index+row_index+row_index+"']").val(),//ok
						refi_id2 : $("input[name='refi_idC"+row_index+row_index+row_index+"']").val(),//ok
						//file_count2 : $("input[name='FILE_COUNTC"+row_index+row_index+row_index+"']").val(),
						//copyfile_count2 : $("input[name='COPYFILE_COUNTC"+row_index+row_index+row_index+"']").val(),
						//COPYSIGN_COUNT2 : $("input[name='COPYSIGN_COUNTC"+row_index+row_index+row_index+"']").val(),
						RETURN_DATE : $("input[name='RETURN_DATE"+row_index+row_index+row_index+"']").val(),//ok
						prcd_id2 : $("#prcd_id").val(),//ok
						is_already : is_already,//ok
						is_already_detail : is_already_detail,
						FILE_TYPE : parseInt($("#cardFlag").val()) + 1,
						ISSURE_REASON : $('input[name="ISSURELIST'+row_index+row_index+row_index+'"]').val(),//ok
						memo2 : $('input[name="MEMOC'+row_index+row_index+row_index+'"]').val(),//ok
						FILE_NAME : $("input[name='file_nameC"+row_index+row_index+row_index+"']").val()//ok
					};
				});
				//add by Michael 2012-08-03 判断有文件没有勾选且没有选择问题类别的
				var aa = document.getElementsByName("rent_ids");
				var i=0;
				var strFlag="";
				$('input[id="issureListID"]').each(function(){
					if(aa[i].value==""){
						alert("有文件没有选择复核框！");
						strFlag="有文件没有选择复核框";
						return false;
					}
					if(aa[i].value!="1" && $(this).val()==""){
						alert("非正常收件请选择对应的问题类别！");
						strFlag="非正常收件请选择对应的问题类别";
						return false;
					}
					if(aa[i].value=="1" && $(this).val()!=""){
						alert("正常收件请去除对应的问题类别！");
						strFlag="正常收件请去除对应的问题类别";
						return false;
					}
					i=i+1;
				});
				if (strFlag!=""){
					return false;
				}
				var rent_ids="";
				$('input[name="rent_ids"]:checked').each(function(){   
					if (rent_ids!=""){
						rent_ids=rent_ids+","+$(this).val();
					}else{
						rent_ids=rent_ids+$(this).val();
					}
				});
				$("#fileData").val(JSON.stringify(fileData));
 				rentForm.checked_rent_ids.value=rent_ids;
			}
			
			if($("#HW_MEMO").val()==""){
				alert("请输入初审备注说明！");
				return false;
			}
			
			document.getElementById("buttonAdd").disabled=true;
			$("#rentForm").submit();						
		}
 		function rentLog1(){   
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  }  		
			$("#rentLog1").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog1").dialog('open');           
		}
 		function rentLog2(){ 
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  }  		  
			$("#rentLog2").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog2").dialog('open');           
		}	
 		function rentLog3(){  
				  var chk_value =[];   
				  $('input[name="ids"]:checked').each(function(){   
				   chk_value.push($(this).val());   
				  });
				  if(chk_value.length==0){
				  	alert("请选择提醒日志");
				  	return false;
				  } 		 
			$("#rentLog3").dialog({
			        modal: true,
			        autoOpen: false,
			        width: 300
			    });
			$("#rentLog3").dialog('open');           
		}				
		
		function InsertLog1(){	
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids1").val(fileValue);	
				document.formLog1.__action.value="rentFile.insertLog";	   
				$("#formLog1").submit();
			} 
		function InsertLog2(){	
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids2").val(fileValue);	
				document.formLog2.__action.value="rentFile.insertLog2";	   
				$("#formLog2").submit();
			}
		function InsertLog3(){
				  var fileValue="";		 
				  $('input[name="ids"]:checked').each(function(){   
				   fileValue+=$(this).val()+"@";  
				  });
				$("#ids3").val(fileValue);	
				document.formLog3.__action.value="rentFile.insertLog3";	   
				$("#formLog3").submit();
			}
			
		function expand(id,REFI_ID,PRCD_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=rentFile.queryFileUpMore&REFI_ID=" + REFI_ID+"&PRCD_ID="+PRCD_ID+"&id="+id);
	        });
		}	
		function expandVisitImage(id){
			$("#"+id).toggle() ;
		}	
		var t_flag = false;
		var i_flag = false;
		var invoice_money_total = 0.00;
		jQuery(document).ready(function()
				{
					invoice_money_total = parseFloat($("#invoiceTotalMoney").val());
					var changedSelect = $("select[changetag^='rent_ids_']");
					var reasonInput = $('input[name^="ISSURELIST"]');
					for (var i = 0; i < changedSelect.length; i ++) {
						if($(changedSelect[i]).val()=="1") {
							$(reasonInput[i]).val('');
							$(reasonInput[i]).hide();
						}
					}
					$("#toggleButton").click(function(){
						if(t_flag == true){
							t_flag = false;
							$(".toggle-row").hide();
							$(".td_toggle").attr('rowspan','1');
							$("#toggleButton").html('显示历史');
						} else {
							t_flag = true;
							$(".toggle-row").show();
							$(".td_toggle").each(function(){
								$(this).attr('rowspan',$(this).attr('originrowspan'));
							});
							$("#toggleButton").html('隐藏历史');
						}
						
					});
					$(".invoiceButton:first").click(function(){
						if(i_flag == true){
							i_flag = false;
							$(".invoiceRow").hide();
							$(".invoiceButton:first").attr('value','展开发票列表');
						} else {
							i_flag = true;
							$(".invoiceRow").show();
							$(".invoiceButton:first").attr('value','收起发票列表');
						}
						
					});
					$(".invoiceStatus").change(function(event){
						if($(this).val()=='1' || $(this).val()=='2') {
							$(this).css("color","green");
							if(ALLOW_CHANGE_FILETYPE==true && $(this).attr("invoice_type")=="0") {
								$("#" + $(this).attr("invoice_type_id") + "_changed").show();
							}
						} else {
							$(this).css("color","red");
							if(ALLOW_CHANGE_FILETYPE==true && $(this).attr("invoice_type")=="0") {
								$("#" + $(this).attr("invoice_type_id") + "_changed").hide();
							}
						}
						var invoice_money_recieve = 0.00;
						$(".invoiceStatus").each(function(event){
							if( ($(this).val()=='1' || $(this).val()=='2') 
								&& (ALLOW_CHANGE_FILETYPE==true || ALLOW_CHANGE_FILETYPE==false && $(this).attr("invoice_type")=='1') ) {
								invoice_money_recieve += Number($(this).attr("invoice_money"));
							}
						});
						$(".invoiceRecieveAmount").html(formatCurrency(invoice_money_recieve));
						$(".invoiceRemainAmount").html(formatCurrency(invoice_money_total-invoice_money_recieve));
						if(invoice_money_total-invoice_money_recieve < 0.01 && $(".rent_ids_invoice").val() != '1') {
							$(".invoiceRemainAmount").css("color","green");
							$("#fileDetail_invoice").css("color","green");
							$("#fileDetail_invoice").html("正常收件");
							$(".rent_ids_invoice").val('1');
							changeFlag($(".rent_ids_invoice").attr("changetag").substring(9),$(".rent_ids_invoice").attr("changesid").substring(9));
						}
						if(invoice_money_total-invoice_money_recieve >= 0.01 && $(".rent_ids_invoice").val() != '0') {
							$(".invoiceRemainAmount").css("color","red");
							$("#fileDetail_invoice").css("color","red");
							$("#fileDetail_invoice").html("缺件待补");
							$(".rent_ids_invoice").val('0');
							changeFlag($(".rent_ids_invoice").attr("changetag").substring(9),$(".rent_ids_invoice").attr("changesid").substring(9));
						}
					});
					$("select.rent_ids").change(function(event){
						if ( $(this).val()=='1' || $(this).val()=='2' ) {
							$(this).css('color','green');
						} else {
							$(this).css('color','red');
						}
					});
					$("#rent_ids_all").change(function(event){
						var newValue = $("#rent_ids_all").val();
						$(".rent_ids").each(function(){
							if($(this).val() != newValue) {
								$(this).val(newValue);
								changeFlag($(this).attr("changetag").substring(9),$(this).attr("changesid").substring(9));
							}
						});
					});
					$('input[name^="ISSURELIST"]').blur(function(event){
						var sid = $(this).attr("name").substring(10);
						var changetag = $("#ORIGINVALUE_" + $(this).attr("name")).attr("changetag").substring(12);
						setTimeout('changeFlag("'+changetag+'","'+sid+'")',500);
					});
				    //Click event of select div
				    $('.multiSelectDiv').click(function(e){
				    	
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=rentFile.getInfoTestList&code=',
							dataType:'json',
							async: false,
							success: function(dataBack){		
							var infoTestList= dataBack.infoTestList;
							$(this).items=infoTestList;
							},
							error:function(callback){
								alert("error!");
								return;
							}
						});
				    	
				    	var text = $(this).find('input[type=text]');
				    	var hidden = $(this).find('input[type=hidden]');
				    	var target = $(e.target); 	
				    	//If target is text
				    	if(target.attr('type') == text.attr('type'))
				    	{
				    	    //Hide other div
				    	    $('.multiSelectDiv').find('div').each(function(){
					    	    $(this).animate({opacity: 'hide'}, 300);
					    	});
				    	    
					    	var div = $(this).find('div');
					    	var offSet = text.offset();
					    	var left = offSet.left-50;
					    	var top = offSet.top;
					    	if(div.is(":visible"))
					    	{
					    	    div.animate({opacity: 'hide'}, 300);
					    	}
					    	else
					    	{
					    	   //div.css({ position:"absolute","top":e.pageY,"left":e.pageX}).animate({opacity:'show'}, 300);
					    		div.animate({opacity:'show'}, 300);
					    	}
				    	}
				    	//If target is checkbox
				    	else if(target.attr('type') == 'checkbox')
				    	{
				    	    var textVal = '';
				    	    var hiddenVal = '';
				    	    var selectDivObj = $(this);
				    	    var curCheckboxCount = 0;
				            var selectedCheckboxCount = 0;
				    	    //Get value by selected checkbox
					    	$(this).find('input[type=checkbox][class!=selectAll]').each(function(){
					    	    
					    		if($(this).is(':checked'))
					    		{
					    		    textVal += $(this).parent().parent().find('span').text() + ',';
					    		    hiddenVal += $(this).val() + ',';
					    		    selectedCheckboxCount++;
					    		}
					    		//When exist checkbox not select,set 'select all' to not select 
					    		else
					    		{
					    		    selectDivObj.find('input[type=checkbox][class=selectAll]').attr('checked','');
					    		}
					    		curCheckboxCount++;
					    	});
					    	
					    	if(curCheckboxCount>0 && selectedCheckboxCount>0 && curCheckboxCount==selectedCheckboxCount)
					        {
					           selectDivObj.find('input[type=checkbox][class=selectAll]').attr('checked','true');
					        }
					    	
					    	text.val(textVal.substring(0,textVal.length-1));
					    	hidden.val(hiddenVal.substring(0,hiddenVal.length-1));
				    	}
				    	//If target is clearImg, clear text,hidden,and checkbox value
				    	else if($(this).find('img').length>0  && target.attr('name') == 'clearImg')
				    	{
				    	    text.val('');
					    	hidden.val('');
					    	$(this).find('input[type=checkbox]').each(function(){
						       if($(this).is(":checked"))
						       {
						    	 $(this).attr("checked",'');
						       }
					    	});
				    	}
				    	//If target is selectImg, show select
				    	else if($(this).find('img').length>0  && target.attr('name') == 'selectImg')
				    	{
				    	    text.click();
				    	}
				    });
				    
				    //Hide div when user click other area
				    $('html').click(function(e){
				    	//If not multi select div area, return 
				    	if($(e.target).isChildAndSelfOf (".multiSelectDiv"))
				    	{
				    	    return;
				    	}
				    	else
				    	{
					    	$('.multiSelectDiv').find('div').each(function(){
					    	    $(this).animate({opacity: 'hide'}, 300);
					    	});
				    	}
				    }); 
				    
				    //Select all items
				    $('.selectAll').click(function(e){
				        var all = $(this);
				        all.parent().parent().parent().find('input[type=checkbox]').each(function(){
				           if(all.is(":checked"))
				           {
				               $(this).attr("checked",'true');
				           }
				           else
				           {
				               $(this).attr("checked",'');
				           }
				        });
				    });   
				    
				    //Check current elements 
				    jQuery.fn.isChildAndSelfOf = function(b){ 
				        return (this.closest(b).length > 0); 
				    };
				    //On init
				    initMultiSelect();
								    
				});

				//Init select
				function initMultiSelect()
				{
				   $('.multiSelectDiv').each(function(){
				       var hiddenVal = $(this).find('input[type=hidden]').val();
				       var textVal = '';
				       var curCheckboxCount = 0;
				       var selectedCheckboxCount = 0;
				       var selectDivObj = $(this);
				       //Select checkBox and set up input value after do query
				       if(hiddenVal != '')
				       {
					       $(this).find('input[type=checkbox][class!=selectAll]').each(function(){
					    		if(hiddenVal.indexOf($(this).val()) != -1)
					    		{
					    		    $(this).attr('checked',true);
					    		    textVal += $(this).parent().parent().find('span').text() + ',';
					    		    selectedCheckboxCount ++;
					    		}
					    		curCheckboxCount ++;
					       });
					       //$(this).find('input[type=text]').val(textVal.substring(0,textVal.length-1));
					       //If checkbox count of current select is equals selected checkbox count,checked 'select all' 
					       if(curCheckboxCount>0 && selectedCheckboxCount>0 && curCheckboxCount==selectedCheckboxCount)
					       {
					           selectDivObj.find('input[type=checkbox][class=selectAll]').attr('checked','true');
					       }
				       }
				       
				       //Set up the width of the select div
				       var textWidth = 0;
				       var img1Width = 0;
				       var img2Width = 0;
				       
				       var textObj = $(this).find('input[type=text]');
				       textWidth = textObj.width();
				       
				       var img1Obj = $(this).find('img');
				       var tempImgObj = new Image(); 
				       tempImgObj.src = img1Obj.attr( 'src');
				       img1Width = tempImgObj.width;
				       
				       var img2Obj = img1Obj.next('img');
				       tempImgObj.src = img2Obj.attr( 'src');
				       img2Width = tempImgObj.width;
				       
				       $(this).width(textWidth + img1Width + img2Width + 10);
				   });
				}
			function changeReturnDate(e){
				date = new Date();
				str = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
				var strDate=str;
				e.value=str;
			}
			function changeFlag(id,sid){
				var changedSelect = $("select[changetag='rent_ids_"+id+"']");
				var memoInput = $("input[changetag='rent_memo_"+id+"']");
				var reasonInput = $('input[name="ISSURELIST'+sid+'"]');
				var originreasonInput = $('#ORIGINVALUE_ISSURELIST'+sid);
				if(changedSelect.val() == '1') {
					reasonInput.val('');
					reasonInput.hide();
				} else {
					reasonInput.show();
				}
				if(changedSelect.val() == changedSelect.attr("orginvalue") && memoInput.val() == memoInput.attr("orginvalue") && originreasonInput.val() == reasonInput.val()) {
					$("#changeflag_"+id).val("false");
					$("#flag_"+id).hide();
				} else {
					$("#changeflag_"+id).val("true");
					$("#flag_"+id).show();
				}
			}
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 900px">
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 900px">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
			<form action="../servlet/defaultDispatcher" name=rentForm" id="rentForm" method="post" enctype="multipart/form-data">	
			 <input type="hidden" name="CONTRACT_TYPE" id="CONTRACT_TYPE"  value="${CONTRACT_TYPE}"/>
			<input type="hidden" id="__action" name="__action" value="rentFile.uploadAllForHW" /> 	
			<input type="hidden" name="prcd_id" id="prcd_id" value="${prcd_id}"/>
			<input type="hidden" name="name" id="name" value=""/>
			<input type="hidden" name="FSS_ID" id="FSS_ID" value="${FSS_ID }"/>
			<input type="hidden" name="path" id="path" value=""/>	
			<input type="hidden" name="cardFlag" id="cardFlag" value="${cardFlag}"/>
			<input type="hidden" id="type" name="type" value="all" />
			<input type="hidden" id="fileData" name="fileData" value=""/>
			<input type="hidden" id="invoiceData" name="invoiceData" value=""/>
			<input type="hidden" id="invoiceTotalMoney" name="invoiceTotalMoney" value="${invoiceTotal.TOTAL_MONEY }">		
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
				<TR class="ui-widget-content jqgrow ui-row-ltr">
					<TD style="text-align: center;" width="25%">客户名称</TD>
					<TD style="text-align: center;" width="25%">${infor.CUST_NAME}&nbsp;</TD>
					<TD style="text-align: center;" width="25%">联系方式</TD>
					<TD style="text-align: center;" width="25%">&nbsp;<c:if test="${infor.CUST_TYPE eq 0}">${infor.NATU_MOBILE}</c:if><c:if test="${infor.CUST_TYPE eq 1}">${infor.CORP_HS_LINK_MODE}</c:if></TD>
				</TR>
				<TR class="ui-widget-content jqgrow ui-row-ltr">
					<TD style="text-align: center;" width="25%">资料编号</TD>
					<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
					<TD style="text-align: center;" width="25%">合同编号</TD>
					<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
				</TR>								
			</table>	

						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						       <tr class="ui-jqgrid-labels">
									<td style="text-align: center;" colspan="5">&nbsp;</td>							
									<td style="text-align: center;" colspan="4">
										<input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
										<c:if test="${saveFlag}">
											<a href="#" name="toggleButton" id="toggleButton" class="blue_button">显示历史</a>
											<a href="#" name="buttonAdd" id="buttonAdd" onclick="subRentFile();"  class="blue_button">保存数据</a>
										</c:if>
									</td>	
								</tr>	
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:4%;">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">实征份数</th> 
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">业务行政备注</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">复核<br>
										<select id="rent_ids_all" style="display: none;">
											<option value = "">-空-</option>
											<option value = "1">正常收件</option>
											<option value = "2">瑕疵收件</option>
											<option value = "3">缺正本待补</option>
											<option value = "0">缺件待补</option>
										</select>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">缺件问题类别</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:25%;">业管备注</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">录入时间</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:1%;">√</th>
								</tr>
								<c:forEach items="${insorupd}" var="item" varStatus="status" >
									<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
									<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
									<input type="hidden" name="file_nameC${status.count }${status.count }${status.count }" id="file_name3" value="${item.FILE_NAME}"/>
									<c:if test="${fn:length(item.LOG) ne 0}">
										<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
											<td originrowspan="${fn:length(item.LOG)+1}" class="td_toggle" width="4%">${status.count }</td>
											<td originrowspan="${fn:length(item.LOG)+1}" class="td_toggle" width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}
												<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>
													<input type="button" class="invoiceButton" value="展开发票列表"/>
												</c:if>
											</td>
											<td originrowspan="${fn:length(item.LOG)+1}" class="td_toggle" width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
											<td originrowspan="${fn:length(item.LOG)+1}" class="td_toggle" width="5%">${item.COPYSIGN_COUNT}&nbsp;</td> 
											<td originrowspan="${fn:length(item.LOG)+1}" class="td_toggle" width="15%">${item.SALES_MEMO}&nbsp;</td> 
											<td width="5%">
												<select  id="rent_ids" name="rent_ids" orginValue="${item.IS_ALREADY_DETAIL}" changetag="rent_ids_${item.REFI_ID}" changesid="rent_ids_${status.count }${status.count }${status.count }" class="rent_ids 
													<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>rent_ids_invoice</c:if>
													" onchange="changeFlag('${item.REFI_ID}','${status.count }${status.count }${status.count }')"
													style="
													<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>display: none;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 1 || item.IS_ALREADY_DETAIL eq 2 }'>color: green;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 3 || item.IS_ALREADY_DETAIL eq 0 }'>color : red;</c:if>
													">
													<option value = "" disabled="disabled" <c:if test="${item.IS_ALREADY_DETAIL eq null}">selected="selected"</c:if>>-空-</option>
													<optgroup style="color: black;" label="非待补">
														<option value = "1" style="color: green;" <c:if test="${item.IS_ALREADY_DETAIL eq 1}">selected="selected"</c:if> >正常收件</option>
														<option value = "2" style="color: green;" <c:if test="${item.IS_ALREADY_DETAIL eq 2}">selected="selected"</c:if> >瑕疵收件</option>
													</optgroup>
													<optgroup style="color: black;" label="待补">
														<option value = "3" style="color: red;" <c:if test="${item.IS_ALREADY_DETAIL eq 3}">selected="selected"</c:if> >缺正本待补</option>
														<option value = "0" style="color: red;" <c:if test="${item.IS_ALREADY_DETAIL eq 0}">selected="selected"</c:if> >缺件待补</option>
													</optgroup>
												</select>
												<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>
													&nbsp;<span id="fileDetail_invoice" style="
													<c:if test='${ item.IS_ALREADY_DETAIL eq 1 || item.IS_ALREADY_DETAIL eq 2 }'>color: green;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 3 || item.IS_ALREADY_DETAIL eq 0 }'>color : red;</c:if>
													">
													<c:if test="${item.IS_ALREADY_DETAIL eq 1}">正常收件</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 2}">瑕疵收件</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 3}">缺正本待补</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 0}">缺件待补</c:if>
													&nbsp;
													</span>
												</c:if>
											</td>
											<td width="20%">
												<input type="hidden" id="ORIGINVALUE_ISSURELIST${status.count }${status.count }${status.count }" changetag="rent_reason_${item.REFI_ID}" value="${item.ISSURE_REASON }" />
												<mSelect:multiSelect nameParams="ISSURELIST${status.count }${status.count }${status.count }" items="${issureTypeList }"curIdVal="con.unitName" idParams="con.unitName" hasAllSelector="false" strInputValue="${item.ISSURE_REASON }"/>
											</td> 
											<td width="25%"><input type="text" orginvalue="${item.MEMO}" changetag="rent_memo_${item.REFI_ID}" onchange="changeFlag('${item.REFI_ID}','${status.count }${status.count }${status.count }')" name="MEMOC${status.count }${status.count }${status.count }" value="${item.MEMO}" id="MEMO3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;"></td>
											<td width="5%"><input type="text" name="RETURN_DATE${status.count }${status.count }${status.count }" <c:choose><c:when test="${item.RETURN_DATE eq '1900-01-01'}"></c:when><c:otherwise>value="${item.RETURN_DATE }"</c:otherwise></c:choose> id="RETURN_DATE3" onchange="changeReturnDate(this);" size="10"/>&nbsp;</td>
											<td width="1%"><input type="hidden" id="changeflag_${item.REFI_ID}" value="false" refi_id="${item.REFI_ID}" row="${status.count}"><div id="flag_${item.REFI_ID}" style="display: none;">√</div></td>
										</tr>
										<c:forEach items="${item.LOG}" var="logItem" varStatus="logStatus" >
											<tr id="cz001" class="toggle-row ui-widget-content jqgrow ui-row-ltr" style="display: none;">
												<td width="5%">&nbsp;
													<c:if test="${logItem.IS_ALREADY_DETAIL eq 1}">正常收件</c:if>
													<c:if test="${logItem.IS_ALREADY_DETAIL eq 2}">瑕疵收件</c:if>
													<c:if test="${logItem.IS_ALREADY_DETAIL eq 3}">缺正本待补</c:if>
													<c:if test="${logItem.IS_ALREADY_DETAIL eq 0}">缺件待补</c:if>
												</td>
												<td width="20%">${logItem.ISSURE_REASON }&nbsp;</td>
												<td width="25%">${logItem.MEMO}&nbsp;</td>
												<td width="5%">${logItem.RETURN_DATE }&nbsp;</td>
												<td width="1%">&nbsp;</td>
											</tr>
										</c:forEach>
										<tr id="tr_pactAffix3${item.REFI_ID}" style="display: none;">
											<td style="text-align: center;" colspan="9" align="center">
												<div id="pactAffix3${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
													<img src="${ctx }/images/loading.gif">
												</div>
											</td>
										</tr>
									</c:if>
									<c:if test="${fn:length(item.LOG) eq 0}">
										<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
											<td width="4%" onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
											<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}
												<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>
													<input type="button" class="invoiceButton" value="展开发票列表"/>
												</c:if>
											</td>
											<td width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
											<td width="5%">${item.COPYSIGN_COUNT}&nbsp;</td> 
											<td width="15%">${item.SALES_MEMO}&nbsp;</td> 
											<td width="5%">
												<select id="rent_ids" name="rent_ids" orginvalue="${item.IS_ALREADY}" changetag="rent_ids_${item.REFI_ID}" changesid="rent_ids_${status.count }${status.count }${status.count }" class="rent_ids 
													<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>rent_ids_invoice</c:if>
													" onchange="changeFlag('${item.REFI_ID}','${status.count }${status.count }${status.count }')"
													style="
													<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>display: none;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 1 || item.IS_ALREADY_DETAIL eq 2 }'>color: green;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 3 || item.IS_ALREADY_DETAIL eq 0 }'>color : red;</c:if>
													">
													<option value = "" disabled="disabled" <c:if test="${item.IS_ALREADY_DETAIL eq null}">selected="selected"</c:if>>-空-</option>
													<optgroup style="color: black;" label="非待补">
														<option value = "1" style="color: green;" <c:if test="${item.IS_ALREADY_DETAIL eq 1}">selected="selected"</c:if> >正常收件</option>
														<option value = "2" style="color: green;" <c:if test="${item.IS_ALREADY_DETAIL eq 2}">selected="selected"</c:if> >瑕疵收件</option>
													</optgroup>
													<optgroup style="color: black;" label="待补">
														<option value = "3" style="color: red;" <c:if test="${item.IS_ALREADY_DETAIL eq 3}">selected="selected"</c:if> >缺正本待补</option>
														<option value = "0" style="color: red;" <c:if test="${item.IS_ALREADY_DETAIL eq 0}">selected="selected"</c:if> >缺件待补</option>
													</optgroup>
												</select>
												<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>
													&nbsp;<span id="fileDetail_invoice" style="
													<c:if test='${ item.IS_ALREADY_DETAIL eq 1 || item.IS_ALREADY_DETAIL eq 2 }'>color: green;</c:if>
													<c:if test='${ item.IS_ALREADY_DETAIL eq 3 || item.IS_ALREADY_DETAIL eq 0 }'>color : red;</c:if>
													">
													<c:if test="${item.IS_ALREADY_DETAIL eq 1}">正常收件</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 2}">瑕疵收件</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 3}">缺正本待补</c:if>
													<c:if test="${item.IS_ALREADY_DETAIL eq 0}">缺件待补</c:if>
													&nbsp;
													</span>
												</c:if>
											</td>
											<td width="20%">
												<input type="hidden" id="ORIGINVALUE_ISSURELIST${status.count }${status.count }${status.count }" changetag="rent_reason_${item.REFI_ID}" value="${item.ISSURE_REASON }" />
												<mSelect:multiSelect nameParams="ISSURELIST${status.count }${status.count }${status.count }" items="${issureTypeList }" curIdVal="con.unitName" idParams="con.unitName" hasAllSelector="false" strInputValue="${item.ISSURE_REASON }"/>
											</td> 
											<td width="25%"><input type="text" orginvalue="${item.MEMO}" changetag="rent_memo_${item.REFI_ID}" onchange="changeFlag('${item.REFI_ID}','${status.count }${status.count }${status.count }')" name="MEMOC${status.count }${status.count }${status.count }" value="${item.MEMO}" id="MEMO3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;"></td>
											<td width="5%"><input type="text" name="RETURN_DATE${status.count }${status.count }${status.count }" <c:choose><c:when test="${item.RETURN_DATE eq '1900-01-01'}"></c:when><c:otherwise>value="${item.RETURN_DATE }"</c:otherwise></c:choose> id="RETURN_DATE3" onchange="changeReturnDate(this);" size="10"/>&nbsp;</td>
											<td width="1%"><input type="hidden" id="changeflag_${item.REFI_ID}" value="false" refi_id="${item.REFI_ID}" row="${status.count}"><div id="flag_${item.REFI_ID}" style="display: none;">√</div></td>
										</tr>
									</c:if>
									<c:if test='${ item.FILE_TYPE==1 && fn:length(invoices)>0 }'>
										<tr class="invoiceRow_del" style="display: none;">
										<td colspan="10">
											<table class="panel_table">
												<thead>
												<tr>
													<th style="text-align: center;" rowspan="2">
														合同总价(A)
													</th>
													<th style="text-align: center;" colspan="4">
														发票原件
													</th>
													<th style="text-align: center;" colspan="2">
														发票复印件
													</th>
													<th style="text-align: center;" rowspan="2">
														剩余金额(A-B)
													</th>
												</tr>
												<tr>
													<th style="text-align: center;">
														已收件数量
													</th>
													<th style="text-align: center;">
														已收件金额(B)
													</th>
													<th style="text-align: center;">
														未收件数量
													</th>
													<th style="text-align: center;">
														未收件金额
													</th>
													<th style="text-align: center;">
														数量
													</th>
													<th style="text-align: center;">
														金额(C)
													</th>
												</tr>
												</thead>
												<tbody>
													<tr>
														<td><fmt:formatNumber type="currency" value="${invoiceTotal.TOTAL_MONEY }"/>&nbsp;</td>
														<td>${invoiceTotal.INVOICE_COUNT1_1 }&nbsp;</td>
														<td><fmt:formatNumber type="currency" value="${invoiceTotal.INVOICE_MONEY1_1 }"/>&nbsp;</td>
														<td>${invoiceTotal.INVOICE_COUNT1_0 }&nbsp;</td>
														<td><fmt:formatNumber type="currency" value="${invoiceTotal.INVOICE_MONEY1_0 }"/>&nbsp;</td>
														<td>${invoiceTotal.INVOICE_COUNT }&nbsp;</td>	
													 	<td><fmt:formatNumber type="currency" value="${invoiceTotal.INVOICE_MONEY }"/>&nbsp;</td> 
													 	<td><fmt:formatNumber type="currency" value="${invoiceTotal.REMANENT_MONEY}"/>&nbsp;</td> 
													</tr>							
												</tbody>
											</table>
										</td>
										</tr>
										<tr class="invoiceRow" style="display: none;">
										<td colspan="10">
											<table class="panel_table">
												<thead>
												<tr>
													<th colspan="3">合同总价(A)<br>
														<span><fmt:formatNumber type="currency" value="${invoiceTotal.TOTAL_MONEY }"/></span>
													</th>
													<th colspan="3">剩余金额(A-B)<br>
														<span class="invoiceRemainAmount" 
															<c:if test="${invoiceTotal.REMANENT_MONEY lt 0.01}">style="color: green;"</c:if>
															<c:if test="${invoiceTotal.REMANENT_MONEY ge 0.01}">style="color: red;"</c:if>
														>
														<fmt:formatNumber type="currency" value="${invoiceTotal.REMANENT_MONEY}"/></span>								
													</th>
													<th colspan="3">原件收件金额(B)<br>
														<span class="invoiceRecieveAmount"><fmt:formatNumber type="currency" value="${invoiceTotal.INVOICE_MONEY1_1 }"/></span>
													</th>
												</tr>
												<tr>
													<th width="">序号</th>
													<th width="">发票号</th>
													<th width="">出票人</th>
													<th width="">金额</th>
													<th width="100">发票类型</th>
													<th width="">备注</th>
													<th width="">状态</th>
													<th width="">操作时间</th>
													<th width="">操作人</th>
												</tr>
												</thead>
												<tbody>
													<c:forEach items="${invoices}" var="item" varStatus="i">
													<tr>
														<td style='text-align: center;'>${i.count}&nbsp;</td>
														<td style='text-align: center;'>${item.INVOICE_CODE}&nbsp;</td>
														<td style='text-align: center;'>${item.DRAWER}&nbsp;</td>
														<td style='text-align: center;'><fmt:formatNumber type="currency" value="${item.INVOICE_MONEY }"/>&nbsp;</td>
														<td id = "invoiceType_${item.ID}"
															<c:if test="${item.INVOICE_TYPE eq 1}">style="text-align: center;"</c:if>
															<c:if test="${item.INVOICE_TYPE eq 0}">style="color: red;text-align: center;"</c:if>
														>
														${item.INVOICE_TYPE_DESC}&nbsp;<span id="invoiceType_${item.ID}_changed" style="display: none;"><font color="black">-></font>&nbsp;<font color="green">原件</font></span> </td>
														<td style='text-align: center;'>${item.MEMO}&nbsp;</td>
														<td style='text-align: center;'>
															<select id="invoiceStatus_${item.ID}" class="invoiceStatus" orginValue="${item.STATUS}" invoiceId="${item.INVOICE_ID}"
																<c:if test="${item.STATUS eq 2 || item.STATUS eq 1}">style="color: green;"</c:if>
																<c:if test="${item.STATUS eq 3 || item.STATUS eq 0 }">style="color: red;"</c:if>
																invoice_money="${item.INVOICE_MONEY }" invoice_type="${item.INVOICE_TYPE}" invoice_type_id="invoiceType_${item.ID}"
															 >
																<option value="2" style="color: green;" <c:if test="${item.STATUS eq 2 }">selected="selected"</c:if>>收件</option>
																<option value="1" style="color: green;" <c:if test="${item.STATUS eq 1 }">selected="selected"</c:if>>借出</option>
																<option value="3" style="color: red;" <c:if test="${item.STATUS eq 3 }">selected="selected"</c:if>>退件</option>
																<option value="0" style="color:red;" <c:if test="${item.STATUS eq 0 }">selected="selected"</c:if>>在途</option>
															</select>
														</td>
														<td style='text-align: center;'><fmt:formatDate value="${item.MODIFY_DATE }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
														<td style='text-align: center;'>${item.MODIFY_BY }&nbsp;</td>
													</tr>
													</c:forEach>
												</tbody>
												</table>
											</td>
										</tr>
									</c:if>	
								</c:forEach>
								<input name="checked_rent_ids" type="hidden"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="5%" onclick="expandVisitImage('visitImage');" style="cursor: pointer;">${fn:length(insorupd) +1}</td>
									<td width="15%">回访信息资料</td>
									<td width="5%">${fn:length(visitImage)}</td>
									<td width="5%">&nbsp;</td>
									<td width="15%">&nbsp;</td>
									<td width="5%">&nbsp;</td>	
									<td width="20%">&nbsp;</td>
									<td width="25%">&nbsp;</td>
									<td width="5%">&nbsp;</td>
								</tr>
								<tr>
									<td style="text-align: center;" colspan="9" align="center">
										<div id="visitImage" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
												<c:forEach items="${visitImage}" var="item" varStatus="status">	
														<tr id="imageUp${status.count }" class="ui-widget-content jqgrow ui-row-ltr">	
															<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=backVisitImage'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a></td>
														</tr>		
												</c:forEach>		
											</table>	
										</div>
									</td>
								</tr>
								<tr  class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;" colspan="2">业管备注说明：<font color="red">*</font></td>
									<td style="text-align: left;" colspan="7"><textarea name="HW_MEMO" id="HW_MEMO" rows="7" cols="5" style="width:80%;">${rentFileSenderState.HW_MEMO}</textarea></td>						
								</tr>				
								<tr class="ui-jqgrid-labels">
									<td style="text-align: center;" colspan="5">&nbsp;</td>	
									<td style="text-align: center;" colspan="4"><c:if test="${saveFlag}"><a href="#" name="buttonAdd" id="buttonAdd" onclick="subRentFile();"  class="blue_button">保存数据</a></c:if></td>							
								</tr>															
						</table>
					</form>
					</div>									
				</div>
			</div>	
		</div>	
	</body>
</html>