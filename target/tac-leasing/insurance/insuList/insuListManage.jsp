<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
    <title>保单管理</title>
  </head>
  <script type="text/javascript">
  	$(function (){
  		$("#start_date_from").datepicker($.datepicker.regional['zh-CN']);
  		$("#start_date_to").datepicker($.datepicker.regional['zh-CN']);
  		$("#end_date_from").datepicker($.datepicker.regional['zh-CN']);
  		$("#end_date_to").datepicker($.datepicker.regional['zh-CN']);
  		/* var dataList = new Array();
  		var option = null;
  		$.ajax({
  			url : "../servlet/defaultDispatcher",
  			data : {
  				"__action" : "insuranceCommand.getCompany"
  			},
  			dataType : "json",
  			success : function (data){
  				$.each(data, function (i){
  					option = new Object();
  					option.label = data[i].SHORT_NAME;
  					option.value = data[i].INCP_ID;
  					dataList.push(option);
  				});
  				$("#incp_id").dropDownList({
  					source: dataList
  				}); */
  				/* $("#incp_id")
  				.bind("input", function (){
  					$("#incp_id").autocomplete("search", $.trim($("#incp_id").val()));
  				})
  				.bind("keypress", function (e){
  					if(e.keyCode == 8 || e.keyCode == 0){
  						$("#incp_id").autocomplete("search", $.trim($("#incp_id").val()));
  					}
  				})
  				.autocomplete({
  					source: dataList,
					minLength: 0,
					search: function() {
						$("#incp_id").val($.trim($("#incp_id").val()));
					}
  				}); */
  			/* }
  		}); */
  	});
  
	function equipcover(equipId,prcdId,custName,producttype){
	 	window.location.href="../servlet/defaultDispatcher?__action=insurance.getInsuranceCreatePre&eqmt_id="+equipId+"&credit_id="+prcdId+"&CUST_NAME="+custName+"&PRODUCT_TYPE="+producttype;
	}

	//查看保单
	function showInsuList(id){
		
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.showInsurance&insuId="+id + "&action_model=show";
	}
	//修改保单
	function updateInsuList(id){
	
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.showInsurance&insuId="+id + "&action_model=update";
	}
	<%--2011/12/12 Yang Yun Add "作废保单", "添加理赔" and "退保" function. Start--%>
	//作废保单
	function invaildInsuList(id){
		if(confirm('你确定作废该保单')){
			window.location.href="../servlet/defaultDispatcher?__action=insure.delInsuList&INCU_ID="+id;
		}	
	}
	// 添加理赔
	function addItem(id, insu_code){
	  	//window.location.href="../servlet/defaultDispatcher?__action=satisfaction.CreatePre&INCU_ID="+id;
		$("#eqmtSelectWin").dialog({modal:true, autoOpen:false, width:500});
		$("#insu_id").val(id);
		$("#insu_code").val(insu_code);
		$("#eqmtSelectWin").dialog("open");
	}
	//退保
	function surrenderInsuList(id){
		if(confirm('你确定要退保吗？')){
			window.location.href="../servlet/defaultDispatcher?__action=surrender.surrenderInsuListPre&INCU_ID="+id;
		}
	}
	//导出
	function outputEX(){
		var selNum=$("input[eqmt]:checked").length;
		if(selNum==0){
		alert("必须至少选择一个保单！");
		return;
		}
		$("#__action").val("exportInsuExcel.exportEqmtListForInsuId");
		$("#form1").submit();
		$("#__action").val("insuranceList.queryAll");	
	}
	//全选
	function selectAll(){
		var tof=$('#All').get(0).checked ;
		$(':checkbox').attr('checked',tof );
	}
	
	function testInsurance(){
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.testInsurance";
	}
	
	function testRenewalInsurance(){
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.testRenewalInsurance";
	}
	
	function testWaitingForSurrender(){
		window.location.href="../servlet/defaultDispatcher?__action=insuranceCommand.testWaitingForSurrender";
	}
	
	function testStartInsurance(){
		$("#lease_code_Win").dialog({modal:true, autoOpen:false, width:500});
		$("#lease_code_Win").dialog("open");
	}
	
	function changeData(e, insuId, data){
		$(e).html("<input type='text' name='newData' class='" + insuId + "' value='" + data + "' onblur='doChangeData(this);'/>");
	}
	
	function doChangeData(e){
		if(confirm("确定要保存吗？")){
			var url = "../servlet/defaultDispatcher";
			var param = {
					"__action" : "insuranceCommand.changeData",
					"insuId" : $(e).attr("className"),
					"newData" : $(e).val()
			};
			$.getJSON(url, param, function (data){
				if(data){
					$(e).parent().html($(e).val());
				}
			});
		}
	}
	<%--2011/12/12 Yang Yun Add "作废保单", "添加理赔" and "退保" function. Start--%>
  </script>
	
<body>
<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
<input type="hidden" id="__action" name="__action"  value="insuranceCommand.getAllInsu" />
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保单管理</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div>
		<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
		        <td style="width:54px;" class="ss_bigo">&nbsp;</td>
		        <td style="width:600px;" class="ss_bigt">
					<table style="margin-left: 10px;">
				        	
				        	<tr>
				        		<td>保险开始日期：从</td>
				        		<td>
				        			<input type="text" name="start_date_from" id="start_date_from" value="${start_date_from }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td align="center">~</td>
				        		<td>
				        			<input type="text" name="start_date_to" id="start_date_to" value="${start_date_to }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td>保险终止日期：从</td>
				        		<td>
				        			<input type="text" name="end_date_from" id="end_date_from" value="${end_date_from }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        		<td align="center">~</td>
				        		<td>
				        			<input type="text" name="end_date_to" id="end_date_to" value="${end_date_to }" readonly="readonly" style="width:100px; height:20px;"/>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>保险公司:</td>
				        		<td>
				        			<%-- <input name="incp_id" id="incp_id" style="width:100px; height:20px;"> --%>
				        			<select name="incp_id" style="width:100px; height:20px;">
				        				<option value="">请选择</option>
				        				<c:forEach items="${company}" var="item" > 
				        					<option value="${item.INCP_ID }" <c:if test="${item.INCP_ID eq incp_id }">selected</c:if>>
				        						${item.SHORT_NAME }
				        					</option>
				        				</c:forEach>
				        			</select>
				        		</td>
				        		<td>保单状态:</td>
				        		<td>
				        			<select name="insu_status" style="width:100px; height:20px;">
				        				<option value="">全部</option>
				        				<option value="0" <c:if test="${insu_status eq '0' }">selected</c:if>>待投保</option>
				        				<option value="10" <c:if test="${insu_status eq '10' }">selected</c:if>>待录入</option>
				        				<option value="20" <c:if test="${insu_status eq '20' }">selected</c:if>>正常</option>
				        				<option value="30" <c:if test="${insu_status eq '30' }">selected</c:if>>终止</option>
				        				<option value="40" <c:if test="${insu_status eq '40' }">selected</c:if>>结清待退保</option>
				        				<option value="50" <c:if test="${insu_status eq '50' }">selected</c:if>>退保</option>
				        			</select>
				        		</td>
				        		<td>异常状态:</td>
				        		<td>
				        			<select name="exception_status" style="width:100px; height:20px;">
				        				<option value="">全部</option>
				        				<option value="Y" <c:if test="${exception_status eq 'Y' }">selected</c:if>>有异常</option>
				        				<option value="N" <c:if test="${exception_status eq 'N' }">selected</c:if>>无异常</option>
				        				<option value="T" <c:if test="${exception_status eq 'T' }">selected</c:if>>待补机号</option>
				        				<c:forEach items="${listType}" var="t">
				        					<option value="${t.code }" <c:if test="${exception_status eq t.code }">selected</c:if>>${t.flag }</option>
				        				</c:forEach>
				        			</select>
				        		</td>
				        		<td>状态:</td>
				        		<td>
				        			<select name="status" style="width:100px; height:20px;">
				        				<option value="">全部</option>
				        				<option value="0" <c:if test="${status eq '0' }">selected</c:if>>正常</option>
				        				<option value="1" <c:if test="${status eq '1' }">selected</c:if>>作废</option>
				        			</select>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>查询内容:</td>
				        		<td colspan="5">
				        			<input type="text" name="content" value="${content }" style="width:260px; height:20px;">
				        		</td>
				        		<td>是否续保:</td>
				        		<td>
				        			<select name="isRenewal" style="width:100px; height:20px;">
				        				<option value="">全部</option>
				        				<option value="0" <c:if test="${isRenewal eq '0' }">selected</c:if>>是</option>
				        				<option value="1" <c:if test="${isRenewal eq '1' }">selected</c:if>>否</option>
				        			</select>
				        		</td>
				        	</tr>
				        </table>
		 		</td>
				<td style="width:50px;" class="ss_bigt" valign="middle">
					<a href="javaScript:void(0)" id="search_but" onclick="$('#form1').submit();" class="blue_button">搜 索</a>
				</td>
				<td style="width:13px;" class="ss_bigth" valign="top">&nbsp;</td>
			</tr>
		</table>
	</div>
	<br/>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr>
						<!-- <td>
							<input type="button" value="模拟保险入口" onclick="testStartInsurance();" style="width: 100px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟投保" onclick="testInsurance();" style="width: 80px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟续保" onclick="testRenewalInsurance();" style="width: 80px; height: 25px;"/>&nbsp;&nbsp;
							<input type="button" value="模拟结清待退保" onclick="testWaitingForSurrender();" style="width: 100px; height: 25px;"/>
						</td> -->
						<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
					</tr>
				</table>
				<table class="grid_table">
					<tr>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStatus">保单<br>状态</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="creditRuncode">案件号</page:pagingSort>
						</th>	
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="custName">客户名称</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="leaseCode">合同号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="incpName">保险公司</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="groupCode">大保单编号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuCode">保单号</page:pagingSort>
						</th>
						<!--  -->
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="parentInsuCode">续保前<br>保单号</page:pagingSort>
						</th>
						<!--  -->
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuStartDate">开始日期</page:pagingSort>
						</th>
						<th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuEndDate">终止日期</page:pagingSort>
						</th>
     				    <th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="insuPrice">总保费</page:pagingSort>
						</th>
			           <th style="text-align: center;">
							<page:pagingSort pagingInfo="${pagingInfo }" orderBy="chargeCode">缴费凭证号</page:pagingSort>
						</th>
						<th style="text-align: center;">
							特别说明
						</th>
						<th style="text-align: center;">
							操作人
						</th>
						<th style="text-align: center;" >
							操作
						</th>

					</tr>
					<tbody>
					<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">
					<tr id="trForColor" 
						<c:if test="${item.exceptionStatus > 0 }">style="color: red"</c:if>>
					    <td style='text-align: center;height: 25px;'><c:choose><c:when 
					    	test="${item.status eq 1}"><img src="${ctx }/images/u617.gif" alt="作废"></c:when><c:otherwise><c:choose><c:when 
						    	test="${item.insuStatus eq 0 }"><img src="${ctx }/images/u608.gif" alt="待投保"></c:when><c:when 
						    	test="${item.insuStatus eq 10 }"><img src="${ctx }/images/u622.gif" alt="待录入"></c:when><c:when 
					    		test="${item.insuStatus eq 20 }"><img src="${ctx }/images/u611.gif" alt="正常"></c:when><c:when 
					    		test="${item.insuStatus eq 30 }"><img src="${ctx }/images/u614.gif" alt="终止"></c:when><c:when 
					    		test="${item.insuStatus eq 40 }"><img src="${ctx }/images/u620.gif" alt="结清待退保"></c:when><c:when 
					    		test="${item.insuStatus eq 50 }"><img src="${ctx }/images/u604.gif" alt="退保"></c:when><c:otherwise
						></c:otherwise></c:choose></c:otherwise></c:choose>&nbsp;</td>
					    <td style='text-align: center;'>${item.creditRuncode}&nbsp;</td>
						<td style='text-align: center;'>${item.custName}&nbsp;</td>
						<td style='text-align: center;'>${item.leaseCode}&nbsp;</td>
						<td style='text-align: center;'>${item.incpName }&nbsp;</td>
						<td style='text-align: center;'>${item.groupCode }&nbsp;</td>
						<td style='text-align: center;'>${item.insuCode }&nbsp;</td>
						<td style='text-align: center;'>${item.parentInsuCode }&nbsp;</td>
						<td style='text-align: center;'><fmt:formatDate value="${item.insuStartDate }" pattern="yyyy-MM-dd"/>&nbsp;</td>	
						<td id="333" style='text-align: center;' ondblclick="changeData(this, '${item.insuId }', '<fmt:formatDate value="${item.insuEndDate}" pattern="yyyy-MM-dd"/>');"><fmt:formatDate value="${item.insuEndDate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
					 	<td style='text-align: center;'><fmt:formatNumber value="${item.insuPrice }" type="currency"/>&nbsp;</td> 
						<td style='text-align: center;'>${item.chargeCode }&nbsp;</td>
						<td style='text-align: center;'><c:if test="${item.exceptionStatus > 0 }">${item.remark }</c:if>&nbsp;</td>
						<td style='text-align: center;'>${item.modify_by }&nbsp;</td>
					   	<td style='text-align: center;'>
					   		<a href="javascript:void(0)" onclick="showInsuList('${item.insuId }');">查看</a>
							   	<c:if test="${update}">	
							   		<c:if test="${item.status==0}">
							   			&nbsp;||&nbsp; <a href="javascript:void(0)" onclick="updateInsuList('${item.insuId }');">修改</a>
								    </c:if> 
								</c:if>
						 		<c:if test="${repeal}">	
						   				&nbsp;||&nbsp;<a href="javascript:void(0)" onclick="invaildInsuList('${item.insuId }');">作废</a>
						   		</c:if>
						   	    	<c:if test="${item.status==0}"> 
								 		<c:if test="${pay}">   		
											&nbsp;||&nbsp;<a href="javascript:void(0)" onclick="addItem('${item.insuId}', '${item.insuCode }');">理赔</a>
							 			</c:if>
							 			 <c:if test="${quit}"> 
							 		 		&nbsp;||&nbsp;<a href="javascript:void(0)" onclick="surrenderInsuList('${item.insuId }');">退保</a>
							 		 	 </c:if> 
						   		    </c:if>
					   	</td>
					</tr>
					</c:forEach>
					<tr>
						<th colspan="9">&nbsp;</th>
						<th>合计：</th>
						<th><fmt:formatNumber value="${totalInsuPrice }" type="currency"/></th>
						<th colspan="4">&nbsp;</th>
					</tr>       
				</tbody>
			</table>
				<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td align="right">
								<img src="${ctx }/images/u608.gif">
								待投保&nbsp;
								<img src="${ctx }/images/u622.gif">
								待录入&nbsp;	
								<img src="${ctx }/images/u611.gif">
								正常&nbsp;
								<img src="${ctx }/images/u614.gif" >
								终止&nbsp;
								<img src="${ctx }/images/u620.gif" >
								结清待退保&nbsp;
								<img src="${ctx }/images/u604.gif">
								退保&nbsp;
								<img src="${ctx }/images/u617.gif">
								作废&nbsp;
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			</div>
		</form>
		<div style="display:none;" id="eqmtSelectWin" title="请填写设备名称">
			<form action="../servlet/defaultDispatcher" method="post" id="winForm">
			<input type="hidden" name="__action" value="insuranceCommand.addClaimInfo"/>
			<input type="hidden" name="insu_id" id="insu_id"/>
			<input type="hidden" name="insu_code" id="insu_code"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		    	<div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;"><strong>设备名称：</strong></td>
								<td><input type="text" name="eqmt_name" style="border: solid 1px #9B6CA0; width: 200px; height: 25px;"/> </td>
							</tr>
							<tr>
								<td colspan="2">
									<font color="red">*设备名称可填写多个，也可不填，在理赔管理中可以维护。</font>
								</td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2" id="button_flag" style="text-align: center;">
									<input type="button" value="提&nbsp;交" onclick="$('#eqmtSelectWin').dialog('close');$('#winForm').submit();" class="ui-state-default ui-corner-all">
									<input type="button" value="关&nbsp;闭" onclick="$('#eqmtSelectWin').dialog('close');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			</form>
		</div>
		
		<div style="display:none;" id="lease_code_Win" title="请填写合同号">
			<form action="../servlet/defaultDispatcher" method="post" id="startForm">
			<input type="hidden" name="__action" value="insuranceCommand.testStartInsurance"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		    	<div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;"><strong>合同号：</strong></td>
								<td><input type="text" name="lease_code" style="border: solid 1px #9B6CA0; width: 200px; height: 25px;"/> </td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*合同号千万不能填错。</font></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2" id="button_flag" style="text-align: center;">
									<input type="button" value="提&nbsp;交" onclick="$('#lease_code_Win').dialog('close');$('#startForm').submit();" class="ui-state-default ui-corner-all">
									<input type="button" value="关&nbsp;闭" onclick="$('#lease_code_Win').dialog('close');" class="ui-state-default ui-corner-all">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			</form>
		</div>
	</body>
</html>		