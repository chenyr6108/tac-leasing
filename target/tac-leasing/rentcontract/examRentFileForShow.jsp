<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/multiSelectlib" prefix="mSelect"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>业管初审</title>
		<script src="${ctx }/rentcontract/js/selectCard.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			
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
				//add by Michael 2012-08-03 判断有文件没有勾选且没有选择问题类别的
				var aa = document.getElementsByName("rent_ids");
				var i=0;
				var strFlag="";
				$('input[id="issureListID"]').each(function(){
					if(!aa[i].checked && $(this).val()==""){
						alert("有文件没有勾选复核框且没有选择问题类别！");
						strFlag="有文件没有勾选复核框且没有选择问题类别";
						return false;
					}else if(aa[i].checked && $(this).val()!=""){
						alert("复核框已勾选请去除对应的问题类别！");
						strFlag="复核框已勾选请去除对应的问题类别";
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
		
		jQuery(document).ready(function()
				{
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
									<td style="text-align: center;" colspan="4"><input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/><c:if test="${saveFlag}"><a href="#" name="buttonAdd" id="buttonAdd" onclick="subRentFile();"  class="blue_button">保存数据</a></c:if></td>	
								</tr>	
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">应征份数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">实征份数</th> 
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">业务行政备注</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">复核</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:20%;">缺件问题类别</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:25%;">业管备注</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">录入时间</th>
								</tr>
								<c:forEach items="${insorupd}" var="item" varStatus="status" >
									<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
									<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
									<input type="hidden" name="file_nameC${status.count }${status.count }${status.count }" id="file_name3" value="${item.FILE_NAME}"/>
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td width="5%">${status.count }</td>
									<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
									<td width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
									<td width="5%">${item.COPYSIGN_COUNT}&nbsp;</td> 
									<td width="15%">${item.SALES_MEMO}&nbsp;</td> 
									<td width="5%">
										<c:if test="${item.IS_ALREADY eq 1}">正常收件</c:if>
										<c:if test="${item.IS_ALREADY eq 2}">瑕疵收件</c:if>
										<c:if test="${item.IS_ALREADY eq 3}">缺正本待补</c:if>
										<c:if test="${item.IS_ALREADY eq 0}">缺件待补</c:if>
										<c:if test="${item.IS_ALREADY eq null}">空</c:if>
										<!-- 
										<INPUT TYPE="checkbox" NAME="rent_ids" id="rent_ids" value="${item.REFI_ID}" style="width:100%;" <c:if test="${not empty item.IS_ALREADY and item.IS_ALREADY eq 1}">checked</c:if> disabled>
										 -->
									</td>
									<td width="20%">${item.ISSURE_REASON }&nbsp;</td> 
									<td width="25%"><input type="text" name="MEMOC${status.count }${status.count }${status.count }" value="${item.MEMO}" id="MEMO3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;"></td>
									<td width="5%"><input type="text" name="RETURN_DATE${status.count }${status.count }${status.count }" <c:choose><c:when test="${item.RETURN_DATE eq '1900-01-01'}">value=""</c:when><c:otherwise>value="${item.RETURN_DATE }"</c:otherwise></c:choose> id="RETURN_DATE3" onchange="changeReturnDate(this);" size="10"/>&nbsp;</td>
								</tr>								
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