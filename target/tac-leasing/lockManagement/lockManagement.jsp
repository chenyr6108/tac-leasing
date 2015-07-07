<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/lockManagement/js/lockManagement.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<title>锁码管理</title>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("input[name^='unlock_da']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name^='lock_date']").datepicker($.datepicker.regional['zh-CN']);
			});
			
			function sel1(obj)
			{
				if(obj.checked)
				{   
					var num=obj.value;
					var number=num.split(",");
					document.all.itemLockId.value=number[0];
					document.all.itempaydate.value=number[1];
					document.all.itemstatuscount.value=number[2];
					var checkbox=document.getElementsByName("checkboxOne");
					for(i=0;i<checkbox.length;i++)
					{
						var numbercheck=checkbox[i].value.split(",")[2];
						if(numbercheck==document.all.itemstatuscount.value)
						{
							checkbox[i].checked=true;
						}
						else
						{
							checkbox[i].checked=false;
						}
						
					}
				}
			}

			function upLoadLockCodePassword(rect_id,recp_id,eqmt_id,period_num){
				document.uploadForm.RECP_ID.value=recp_id;
				document.uploadForm.EQMT_ID.value=eqmt_id;
				document.uploadForm.PERIOD_NUM.value=period_num;
				document.uploadForm.RECT_ID.value=rect_id;
				$("#upLoad").dialog({
					modal:true,
					autoOpen: false,
					width: 400
				});
				$("#upLoad").dialog('open');
			}			
			function funUploadFile(){
				alert("确定要上传！");
				$("#uploadForm").submit();
			}	
			
			function deleteImg(rect_id,recp_id,eqmt_id,file_id){
				if(confirm("确定要删除吗？")){
					 $.ajax({
					        type: 'post',
					        url: '../servlet/defaultDispatcher',
					        data: '__action=lockManagement.deleteLockCodePasswordFile&RECT_ID=' +
					        rect_id +
					        '&EQMT_ID=' +
					        eqmt_id +
					        '&RECP_ID=' +
					        recp_id +
					        '&ID=' +
					        file_id,
					        dataType: 'json',
					        success: function(dataBack){
					        	alert("修改成功!");
					        	location.href='../servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id='+rect_id+"&eqmt_id="+eqmt_id+"&recp_id="+recp_id;
					        }
					    }); 
				}
			}
			
		</script>
		<script type="text/javascript">
		function checkThingNumber(number){
		    var eqmt_id=$("#eqmt_id").val();
			var value = $(number).val() ;
			if(value.trim() != ""){
				$.ajax({
						type:"get",
						url:"../servlet/defaultDispatcher",
						data:"__action=lockManagement.checkProductNumber&THING_NUMBER="+value+"&eqmt_id="+eqmt_id,
						dataType:"json",
						success:function(json){
							if(json.count!=0){
								alert("产品机号已存在");
								$(number).val("") ;
							//	$(number).focus() ;
							}
							else{
							//	alert("产品机号可以使用！");
							}
						},
						error:function(){
							alert('验证发生错误!');
						}
			     }); 
			 }
		}
		
		function sendLockCode(recdId, eqmtId){
			var rect_id = $("#rect_id1").val();
			var eqmt_id = $("#eqmt_id1").val();
			var recp_id = $("#recp_id1").val();
			if(confirm("确定要发送吗？")){
				$.getJSON("../servlet/defaultDispatcher", 
						{__action : "lockManagement.sendLockCodeByManual",
						"recdId" : recdId,
						"eqmtId" : eqmtId},
						function (data){
							alert(data.msg);
							location.href='../servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id='+rect_id+"&eqmt_id="+eqmt_id+"&recp_id="+recp_id;
						}, 'json');
			}
		}
</script>  
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="employeeid" id="employeeid" value="1">
			<input type="hidden" id="__action" name="__action" value="lockManagement.doSomething" />
			<input type="hidden" name="rent_detail_id" id="thisrentdetailid" value="${rentRecpMap.RECD_ID }" />
			<input type="hidden" name="leaseCode" id="thisleaseCode" value="${rentRecpMap.LEASE_CODE }"/>
			<input type="hidden" name="rect_id1" id="rect_id1" value="${rect_id1 }">
			<input type="hidden" name="eqmt_id1" id="eqmt_id1" value="${eqmt_id1 }">
			<input type="hidden" name="recp_id1" id="recp_id1" value="${recp_id1 }">
			<c:set var="lockType" value="间接"></c:set>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;锁码管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td width="10%">合同号</td>
						<td width="40%">${rentRecpMap.LEASE_CODE }&nbsp;</td>
						<td width="10%">支付表号</td>
						<td>${rentRecpMap.RECP_CODE }&nbsp;</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>租赁期数</td>
						<td>${rentRecpMap.LEASE_PERIOD }&nbsp;</td>
						<td>租赁周期</td>
						<td><c:if test="${rentRecpMap.LEASE_TERM == 1}">1个月</c:if><c:if test="${rentRecpMap.LEASE_TERM == 3}">1季度</c:if><c:if test="${rentRecpMap.LEASE_TERM == 6}">半年</c:if><c:if test="${rentRecpMap.LEASE_TERM == 12}">1年</c:if>&nbsp;</td>
					</tr>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">锁码时间</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" id="first" style="width:80px; height:18px;border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;" readonly="readonly">
							<input type="text" style="width:150px; height:18px;" readonly="readonly" id="datebegin" onclick="onRes();">
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
					<!-- <tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" colspan="3">
							<font color="red">/*锁码时间与支付时间的差数为以下每月的支付时间加上差数*/差数为：<input type="text" id="count" style="width:80px; height:18px;border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;" readonly="readonly" value="0">天</font> 
						</td>
					</tr>
					 -->
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th style="text-align: left;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="8">
							设备
						</th>
					</tr>
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							产品名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							规格型号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							留购价
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							含税单价
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							单价
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							数量
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							单位
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合计
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							机号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							锁码方式
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							设备维护人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							手机号码
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							EMAIL
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							备注
						</th>
					</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<input type="hidden" name="eqmt_id" id="eqmt_id" value="${eqmtMap.EQMT_ID }">
							<td style="text-align: center;">${eqmtMap.THING_NAME }</td>
							<td style="text-align: center;">${eqmtMap.MODEL_SPEC }</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${eqmtMap.STAYBUY_PRICE }"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${eqmtMap.SHUI_PRICE }"/>&nbsp;</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${eqmtMap.UNIT_PRICE }"/>&nbsp;</td>
							<td style="text-align: center;">${eqmtMap.AMOUNT }</td>
							<td style="text-align: center;">${eqmtMap.UNIT }</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${eqmtMap.SUM_PRICE }"/>&nbsp;</td>
							<td style="text-align: center;"><input type="text" name="THING_NUMBER" id="THING_NUMBER" value="${eqmtMap.THING_NUMBER }" onblur="checkThingNumber(this) ;"/></td>
							<td style="text-align: center;"><select name="lock_code" id="LOCK_CODE">
								<c:forEach items="${lockList}" var="items">
									<c:choose>
										<c:when test="${items.CODE eq rentRecpMap.LOCK_CODE}">
											<option value="${items.CODE }" selected="selected">${items.FLAG }</option>
											<c:set var="lockType" value="${items.FLAG }"></c:set>
										</c:when>
										<c:otherwise>
											<option value="${items.CODE }">${items.FLAG }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>&nbsp;</td>
							<td style="text-align: center;"><input type="text" name="renter_name" id="renter_name" value="${eqmtMap.RENTER_NAME }" /></td>
							<td style="text-align: center;"><input type="text" name="renter_phone" id="renter_phone" value="${eqmtMap.RENTER_PHONE }" onBlur="mobileTels(this)" /></td>
							<td style="text-align: center;"><input type="text" name="renter_email" id="renter_email" value="${eqmtMap.RENTER_EMAIL }"  onBlur="isEmail(this)" /></td>
							<td style="text-align: center;">${eqmtMap.MEMO }&nbsp;</td>
						</tr>
				</table>
				<table>
				<tr>
				<td><!-- <input type="button" onclick="sendLock();" class="ui-state-default ui-corner-all" value="发送锁码" size="20"/> -->
				<input type="hidden" id="itemLockId" name="itemLockId"><input type="hidden" id="itempaydate" name="itempaydate"><input type="hidden" id="itemstatuscount" name="itemstatuscount">
				</td>
				</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table1">
					<tr>
						<th class="ui-state-default ui-th-ltr zc_grid_head">&nbsp;</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">期次</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">支付时间</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">本期余额</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">实际收款日</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">锁码时间</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">密码</th>
					<!-- 	<th class="ui-state-default ui-th-ltr zc_grid_head">是否解锁</th> -->
						<th class="ui-state-default ui-th-ltr zc_grid_head">是否手动发送</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">解锁日期</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">提醒日</th>
						<!-- <th class="ui-state-default ui-th-ltr zc_grid_head">发送方式</th> -->
						<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">附件</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">手动发送</th>
					</tr>
					<c:forEach items="${queryAllList}" var="item" varStatus="status">
					<c:choose>
						<c:when test="${item.TODAY == 0 and item.ISNUM == 0}">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">&nbsp;&nbsp;<input type="checkbox" name="checkboxOne" id="checkboxOne" onClick="sel1(this)" value="${item.LOCK_ID },${item.PAY_DATE },${status.count }">&nbsp;&nbsp;</td>
								<td style="text-align: center;">${status.count }</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></td>
								<td style="text-align: center;"><c:if test="${empty item.LAST_PRICE}">0.00</c:if><c:if test="${not empty item.LAST_PRICE}"><fmt:formatNumber type="currency" value="${item.LAST_PRICE }"/></c:if></td>
								<td style="text-align: center;"><fmt:formatDate value="${item.CHECK_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.LOCK_DATES }" pattern="yyyy-MM-dd"/></td>
								<td width="15%" style="text-align: center;">${item.PASS }</td>
								<%-- <td style="text-align: center;"><c:if test="${item.ISNUM == 0}">是</c:if><c:if test="${item.ISNUM == 1}">否</c:if></td> --%>
								<td style="text-align: center;"><c:if test="${item.IS_ARTIFICIAL == 0}">是</c:if><c:if test="${item.IS_ARTIFICIAL == 1}">否</c:if></td>
								<td style="text-align: center;"><fmt:formatDate value="${item.UNLOCK_DATES }" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${item.REMIN_DAY }" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<%-- <td style="text-align: center;"><c:if test="${item.SEND_WAY == 1}">自动</c:if><c:if test="${item.SEND_WAY == 0}">手动</c:if></td> --%>
								<td style="text-align: center;">${item.REMARK }&nbsp;<a href="javascript:void(0);" onclick="upLoadLockCodePassword(${recp_id1},${eqmt_id1},${item.PERIOD_NUM })">[上传附件]</a><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.download&name=${item.FILE_NAME }&path=${item.PATH }'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.FILE_NAME}" name="showRentFile"></a></td>
								<td style="text-align: center;"><input type="button" style="height: 25px;" value="手动发送" onclick="sendLockCode('${item.RECD_ID}', '${eqmtMap.EQMT_ID }');"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="today" value="${item.TODAY }">
							<input type="hidden" name="rent_id" id="${status.count }collrent_id" value="${item.RECD_ID }">
							<input type="hidden" name="period_num" id="${status.count }period_num" value="${item.PERIOD_NUM }">
							<input type="hidden" name="recp_id" id="${status.count }recp_id" value="${item.RECP_ID }">
							<tr >
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;&nbsp;<input type="checkbox"  name="checkboxOne" id="checkboxOne" onClick="sel1(this)" value="${item.LOCK_ID },${item.PAY_DATE },${status.count }">&nbsp;&nbsp;</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									${status.count }<input type="hidden" name="lock_id" value="${item.LOCK_ID }">
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="hidden" name="payDate" value="<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/>">
									<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/>
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<c:if test="${empty item.LAST_PRICE}">0.00</c:if><c:if test="${not empty item.LAST_PRICE}"><fmt:formatNumber type="currency" value="${item.LAST_PRICE }"/></c:if>
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatDate value="${item.CHECK_DATE }" pattern="yyyy-MM-dd"/>&nbsp;
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="lock_date" id="${status.count }lock_date" style="width:80px; height:18px;" readonly="readonly" value="<fmt:formatDate value="${item.LOCK_DATES }" pattern="yyyy-MM-dd"/>" onchange="paydateToReminday(this);">
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="passwords" id="${status.count }passwords" value="${item.PASS }" >
									
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<select name="IS_ARTIFICIAL" id="${status.count }IS_ARTIFICIAL">
										<option value="1" <c:if test="${item.IS_ARTIFICIAL eq 1 }">selected="selected"</c:if>>否</option>
										<option value="0" <c:if test="${item.IS_ARTIFICIAL eq 0 }">selected="selected"</c:if>>是</option>
									</select>
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<c:choose>
										<c:when test="${item.UNLOCK_DATES eq null}">
											<input type="text" name="unlock_date" id="${status.count }unlock_date" style="width:80px; height:18px;" readonly="readonly" value="">
										</c:when>
										<c:otherwise>
											<input type="text" name="unlock_date" id="${status.count }unlock_date" style="width:80px; height:18px;" readonly="readonly" value="<fmt:formatDate value="${item.UNLOCK_DATES }" pattern="yyyy-MM-dd"/>">
										</c:otherwise>
									</c:choose>
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="remin_day" style="width:80px; height:18px;border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;" readonly="readonly" value="<fmt:formatDate value='${item.REMIN_DAY }' pattern='yyyy-MM-dd'/>">
								</td>
								<input name="send_way" id="${status.count }send_way" type="hidden" value="${item.SEND_WAY}"/>
		<%-- 						<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<select name="send_way" id="${status.count }send_way">
									<c:choose>
											<c:when test="${lockType eq '直接'}">
												<c:choose>
													<c:when test="${item.SEND_WAY eq null or item.SEND_WAY eq 1 }">
														<option value="1" selected="selected">自动</option>
														<option value="0" >手动</option>
													</c:when>
													<c:otherwise>
														<option value="1" >自动</option>
														<option value="0" selected="selected">手动</option>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${lockType eq '间接'}">
												<c:choose>
													<c:when test="${item.SEND_WAY eq null or item.SEND_WAY eq 1 }">
														<option value="0" selected="selected">手动</option>
														<option value="1" >自动</option>
													</c:when>
													<c:otherwise>
														<option value="0" >手动</option>
														<option value="1" selected="selected">自动</option>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${item.SEND_WAY eq null or item.SEND_WAY eq 1 }">
														<option value="0" selected="selected">手动</option>
														<option value="1" >自动</option>
													</c:when>
													<c:otherwise>
														<option value="0" >手动</option>
														<option value="1" selected="selected">自动</option>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
									</c:choose>
										
									</select>
								</td> --%>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="remark" id="${status.count }remark" value="${item.REMARK }" size="30">
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<c:choose><c:when test="${empty item.FILE_NAME}"><a href="javascript:void(0);" onclick="upLoadLockCodePassword(${rect_id1 },${recp_id1},${eqmt_id1},${item.PERIOD_NUM })">[上传附件]</a></c:when><c:otherwise><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.download&name=${item.FILE_NAME }&path=${item.PATH }'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.FILE_NAME}" name="showRentFile"></a>&nbsp;|&nbsp;	<img src="${ctx }/images/u103.gif"	style="cursor: pointer;" title="删除" onclick="deleteImg(${rect_id1 },${recp_id1},${eqmt_id1},${item.FILE_ID});"/></c:otherwise></c:choose>
								</td>
								<td style="text-align: center;" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="button" style="height: 25px;" value="手动发送" onclick="sendLockCode('${item.RECD_ID}', '${eqmtMap.EQMT_ID }');"/>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</table>
				<center>
					<input type="button" value="提 交" onclick="doSubmit();" class="ui-state-default ui-corner-all">
					<input type="reset" value="重 置" class="ui-state-default ui-corner-all">
				</center>
				</div>
				</div>
				</div>
		</form>
		
<!------------弹出层:增加上传附档功能------------>
<div style="display: none;" id="upLoad" title="您当前的位置:锁码管理-上传附档">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">请选择要上传文件</TD>
					</TR>			
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%">&nbsp;<input class="ui-state-default ui-corner-all" size="30" type="file" name="upLoadFile" id="upLoadFile"/></TD>
						<input name="RECP_ID" type="hidden"/>
						<input name="PERIOD_NUM" type="hidden"/>
						<input name="EQMT_ID" type="hidden"/>
						<input name="RECT_ID" type="hidden"/>	
						<input type="hidden" id="__action" name="__action" value="lockManagement.uploadAll" />					
					</TR>
					<TR class="ui-widget-content jqgrow ui-row-ltr">
						<TD style="text-align: center;" width="50%"><input type="button" id="subUpload" value="确&nbsp;定" onclick="funUploadFile()" class="ui-state-default ui-corner-all" ></TD>
					</TR>						
				</table>
				</form>
			</div>
		</div>
	</div>
</div>		
	</body>
</html>