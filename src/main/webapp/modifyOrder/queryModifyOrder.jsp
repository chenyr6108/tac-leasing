<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>更改单列表</title>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">


	$(function (){
		$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
		$("#dateend").datepicker($.datepicker.regional["zh-CN"]);
	});
	
	
	function doQuery() {
		$("#form1").submit();
	}
	//查看
	function expand(iddiv,modifyId){
        $("#"+iddiv).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=modifyOrderCommand.getOrderByMid&MODIFY_ID="+modifyId);
        });
	}
	
	//添加页面
	function addOrder(state){
		$.post("../servlet/defaultDispatcher?__action=modifyOrderCommand.getUncheckedCount",function(data){
			if(state != 1){
				if(data > 0){
					$("#dialogContent").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前还有" 
											+ data 
											+ "张更改单等待您验收，在验收完成之前，您不能再申请新的更改单！<br/>"
											+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您可以点击“查看详细”查看相关更改单,进行「验收」操作。<br/>"
											+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如有疑问，请致电资讯部！");
					$("#dialog").dialog({
						modal: true,
						buttons: {
					        '确定': function() {
					          	$(this).dialog("close");
					        },
							'查看详细':function(){
								$("#qSelectStatus").val(4);
								$("#datebegin").val("");
								$("#dateend").val("");
								$("#DECP_ID").val("");
								$("#selectAlter").val("");
								$("#QSEARCH_VALUE").val("${s_employeeName}");
								doQuery();
								$(this).dialog("close");
							}
						}	
					});
					return false;
				}
			}
			location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.modifyOrder";
		});
	}
	//修改
	function updateModifyOrder(modifyId){
		location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.updateModifyOrder&&MODIFY_ID="+modifyId;
	}
	//通过、驳回1
	function orderPass(status, modifyId,type){
			$("#status_"+modifyId).val(status);
			$("#type_"+modifyId).val(type);
			$("#modifyId_"+modifyId).val(modifyId);
			$("#authForm_div_"+modifyId).dialog({modal:true, autoOpen:false, width:500});
			$(".remember").remove();
			$("#authForm_div_"+modifyId +"> form").append("<input type='hidden' class='remember' name='__pageSize' value='"+${pageSize}+"'>");
		    $("#authForm_div_"+modifyId +"> form").append("<input type='hidden' class='remember' name='__currentPage' value='"+${page}+"'>");
		    $("#authForm_div_"+modifyId +"> form").append("<input type='hidden' class='remember' name='QSELECT_STATUS' value='"+$("#qSelectStatus").val()+"'>");
		    $("#authForm_div_"+modifyId +"> form").append("<input type='hidden' class='remember' name='QSTART_DATE' value='"+$("#datebegin").val()+"'>");
		    $("#authForm_div_"+modifyId+"> form").append("<input type='hidden' class='remember' name='QEND_DATE' value='"+$("#dateend").val()+"'>");
			$("#authForm_div_"+modifyId).dialog("open");
			$("#save_"+modifyId).click(function() { 
				$("#save_"+modifyId).attr('disabled',true);
				$("#remarkForm_"+modifyId).submit();
			});
		
	}
	//弹出处理订单层
	function alterOrder(mid) {
		$("#MODIFY_ID_"+mid).val(mid);
		openLogandsee('showAlterOrder_'+mid);
	}
	//打开弹出层
	function openLogandsee(divName) {
		$("#" + divName).dialog({
			//modal : true,
			autoOpen : false,
			width : 600
		});
		//记录页面参数
		$(".remember").remove();
		$("#" + divName +"> form").append("<input type='hidden' class='remember' name='__pageSize' value='"+${pageSize}+"'>");
	    $("#" + divName +"> form").append("<input type='hidden' class='remember' name='__currentPage' value='"+${page}+"'>");
	    $("#" + divName +"> form").append("<input type='hidden' class='remember' name='QSELECT_STATUS' value='"+$("#qSelectStatus").val()+"'>");
	    $("#" + divName +"> form").append("<input type='hidden' class='remember' name='QSTART_DATE' value='"+$("#datebegin").val()+"'>");
	    $("#" + divName +"> form").append("<input type='hidden' class='remember' name='QEND_DATE' value='"+$("#dateend").val()+"'>");
		$("#" + divName).dialog('open');
		
	}
	//提交处理表单
	function updateAlterOrder(mid){
		$("#showAlterOrderform_"+mid).submit();
	}
	//验证更改单
	function yzOrder(mid) {
		$("#MODIFY_ID_YZ_"+mid).val(mid);
		openLogandsee('showAlterOrder_YZ_'+mid);
	}
	//验证提交
	function updateAlterOrderYZ(mid){
		$("#showAlterOrderform_YZ_"+mid).submit();
	}
	//转移
	function moveOrderAlter(mid){
		$("#moveOrderAlter_"+mid).val(mid); 
		openLogandsee('moveOrderAlterDiv_'+mid);
	}
	//转移提交
	function moveOrderAlterBut(mid){
		$("#moveOrderAlterform_"+mid).submit();
	}
	//查看日志
	function showOrderLog(mid){
		location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.showOrderLog&&MODIFY_ID="+mid;
	}
	//作废
	function deleteModifyOrder(mid){
		if(confirm("确定要将更改单撤销吗？")){
			$("#MODIFY_ID_DELETE_"+mid).val(mid); 
			openLogandsee('deleteModifyOrder_'+mid);
		}
	}
	//作废提交
	function deleteModifyOrderSubmit(mid){
		var textDel=$("#REMARK_DELETE_"+mid).val();
		 if(textDel.length>0){
				$("#deleteModifyOrderform_"+mid).submit();
	        }else{
				alert("请填写撤案原因！");
	        }
	}
	 //不处理
	
	function updateNoCl(mid){
		$("#updateNoCl_"+mid).val(mid); 
		openLogandsee('updateNoClDiv_'+mid);
	}
	//不处理
	function updateNoClBut(mid){
		$("#updateNoClform_"+mid).submit();
	}
	//导出excel
	function nowOrderExcel(obj){ 
			//alert(1111);
			$(obj).attr("disabled", "disabled");
			var QSTART_DATE = "";
			QSTART_DATE= document.getElementById("datebegin").value;
			var QEND_DATE = "";
			QEND_DATE= document.getElementById("dateend").value;
			var QSelectStatus="";
			QSelectStatus= document.getElementById("qSelectStatus").value;
			var QSEARCH_VALUE="";
			QSEARCH_VALUE= document.getElementById("QSEARCH_VALUE").value;
			var DECP_ID="";
			DECP_ID= document.getElementById("DECP_ID").value;
			//alert(QSTART_DATE+QEND_DATE+QSelectStatus+QSEARCH_VALUE+DECP_ID);
			var EMPLOYEEID="";
			EMPLOYEEID= document.getElementById("EMPLOYEEID").value;
			window.parent.callBirt("birtReport/exportModifyOrderExcel/modifyOrderExcel.rptdesign","xls", {"EMPLOYEEID":EMPLOYEEID,"DECP_ID":DECP_ID,"START_DATE":QSTART_DATE,"END_DATE":QEND_DATE,"SELECT_STATUS":QSelectStatus,"SEARCH_VALUE":encodeURI(QSEARCH_VALUE)});
			//$(obj).attr("disabled", false);
		}
	 
	  
</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="modifyOrderCommand.queryModifyOrderList">
		<input type="hidden" name="EMPLOYEEID" id="EMPLOYEEID" value="${EMPLOYEEID}">
		
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;"><span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;更改单</span></div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				         <td width="8">&nbsp;</td>
				         <td width="60" class="ss_o"></td>
				         <td width="60%" class="ss_t" valign="top">
						 <table style="margin-left: 10px;">
				         <tr>
				        	  <td>起始日期：</td>
				              <td> <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }"> </td>
				              <td>结束日期：</td>
				              <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }"></td>
							  <td>状态： </td>
							<td>
							<select name="QSELECT_STATUS" style=" height: 18px;" id="qSelectStatus">
									<option value="-1" <c:if test="${QSELECT_STATUS eq '-1'}">selected='selected'</c:if>> 请选择 </option>
									<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>> 未审核</option>
									<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>已审核未处理 </option>
									<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>驳回 </option>
									<option value="3" <c:if test="${QSELECT_STATUS eq 3}">selected='selected'</c:if>>已处理未审核 </option>
									<option value="4" <c:if test="${QSELECT_STATUS eq 4}">selected='selected'</c:if>>已处理已审核 </option>
									<option value="6" <c:if test="${QSELECT_STATUS eq 6}">selected='selected'</c:if>>已验收未审核 </option>
									<option value="7" <c:if test="${QSELECT_STATUS eq 7}">selected='selected'</c:if>>已完成 </option>
									<option value="9" <c:if test="${QSELECT_STATUS eq 9}">selected='selected'</c:if>>已撤案 </option>
									<option value="10" <c:if test="${QSELECT_STATUS eq 10 || empty QSELECT_STATUS}">selected='selected'</c:if>>未完成 </option>
							</select>
							</td>
								<td>
									办事处：
									<select id="DECP_ID" name="DECP_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="office" items="${officeList}">
											<option value="${office.DECP_ID }" <c:if test="${office.DECP_ID eq DECP_ID }">selected="selected"</c:if>>
												${office.DECP_NAME_CN }
											</option>
										</c:forEach>
									</select>
								</td> 
							  <td>处理人员： </td>
							<td>
								<select name="SELECT_ALTER" style=" height: 18px;" id="selectAlter">
									<option value="" <c:if test="${SELECT_ALTER eq ''}">selected='selected'</c:if>> 请选择 </option>
									<option value="111" <c:if test="${SELECT_ALTER eq '111'}">selected='selected'</c:if>> 胡天书 </option>
									<option value="161" <c:if test="${SELECT_ALTER eq '161'}">selected='selected'</c:if>> 沈祺</option>
									<option value="145" <c:if test="${SELECT_ALTER eq '145'}">selected='selected'</c:if>> 杨赟 </option>
									<option value="231" <c:if test="${SELECT_ALTER eq '231'}">selected='selected'</c:if>> 张波 </option>
									<option value="276 " <c:if test="${SELECT_ALTER eq '276'}">selected='selected'</c:if>> 徐伟 </option>
										<option value="331 " <c:if test="${SELECT_ALTER eq '331'}">selected='selected'</c:if>>杨浏 </option>
								</select>
							</td>
				     	 </tr>
				          <tr>
					          <td>查询内容：</td>
					          	<td colspan="5"><input type="text" id="QSEARCH_VALUE" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" style=" width:395px;height:18px; font-size: 12px;">
					          </td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
					</div>	
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<br>
			<div>
				<input type="button" name="addbutton" onclick="addOrder();" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="新增更改单">
				<input type="button" name="pdfbutton" onclick="nowOrderExcel(this);" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="导出当前更改单">
			</div>
			<page:pagingToolbarTop pagingInfo="${dw }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>当前状态</strong>
					</th>
					
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>更改单编号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>申请人</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>承租人名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>申请时间</strong>
					</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							<strong>处理人员</strong>
						</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作</strong>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="order" varStatus="index">
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;"><c:if test="${order.ORDER_TYPE==0}"><c:if test="${order.ORDER_STATUS==0}">未审核</c:if><c:if test="${order.ORDER_STATUS==1}">已审核未处理</c:if><c:if test="${order.ORDER_STATUS==2}">驳回</c:if></c:if><c:if test="${order.ORDER_TYPE==1}"><c:if test="${order.ORDER_STATUS==0}">已处理未审核</c:if><c:if test="${order.ORDER_STATUS==1}">已处理已审核</c:if><c:if test="${order.ORDER_STATUS==2}">处理驳回</c:if></c:if><c:if test="${order.ORDER_TYPE==2}"><c:if test="${order.ORDER_STATUS==0}">已验收未审核</c:if><c:if test="${order.ORDER_STATUS==1 && order.STATUS !=2}">已完成</c:if><c:if test="${order.STATUS==2}">已撤案</c:if><c:if test="${order.ORDER_STATUS==2}">验收驳回</c:if></c:if></td>
						<td style="text-align: center;">${order.MODIFY_ORDER_CODE}&nbsp;</td>
						<td style="text-align: center;">${order.APPLY_NAME }&nbsp;</td>
						<td style="text-align: center;">${order.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${order.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${order.LEASE_CODE}&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" type="both" value="${order.CREATE_TIME}"/>&nbsp;</td>
						<td style="text-align: center;">${order.ALTER_NAME}&nbsp;</td>
						<td style="text-align: center;"><a href="javascript:void(0);" onclick="expand('order${order.MODIFY_ID}',${order.MODIFY_ID})" >查看</a>&nbsp;|&nbsp;
						<c:if test="${order.ORDER_TYPE==0}">
							<c:if test="${order.ORDER_STATUS==0 || order.ORDER_STATUS==2}">
									<a href="javascript:void(0);" onclick="updateModifyOrder('${order.MODIFY_ID}')" >修改</a>&nbsp;|&nbsp;
							</c:if>
						</c:if>
						<c:if test="${order.ORDER_TYPE==0}">
							<c:if test="${order.ORDER_STATUS==0}">
								<c:if test="${pass}">
									<a href="javascript:void(0);" onclick="orderPass('1','${order.MODIFY_ID}','${order.ORDER_TYPE}');">通过</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${order.ORDER_TYPE==0}">
							<c:if test="${order.ORDER_STATUS==0}">
								<c:if test="${nopass}">
									<a href="javascript:void(0);"onclick="orderPass('2','${order.MODIFY_ID}','${order.ORDER_TYPE}');">驳回</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${s_employeeId eq 100 }">
							<c:if test="${order.ORDER_TYPE==1}">
								<c:if test="${order.ORDER_STATUS==0}">
									<c:if test="${clpass}">
										<a href="javascript:void(0);" onclick="orderPass('1','${order.MODIFY_ID}','${order.ORDER_TYPE}');">处理通过</a>&nbsp;|&nbsp;
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${s_employeeId eq 100 }">
							<c:if test="${order.ORDER_TYPE==1}">
								<c:if test="${order.ORDER_STATUS==0}">
									<c:if test="${clnopass}">
										<a href="javascript:void(0);"onclick="orderPass('2','${order.MODIFY_ID}','${order.ORDER_TYPE}');">处理驳回</a>&nbsp;|&nbsp;
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${order.ORDER_TYPE==2}">
							<c:if test="${order.ORDER_STATUS==0}">
								<c:if test="${yspass}">
									<a href="javascript:void(0);" onclick="orderPass('1','${order.MODIFY_ID}','${order.ORDER_TYPE}');">验收通过</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${order.ORDER_TYPE==2}">
							<c:if test="${order.ORDER_STATUS==0}">
								<c:if test="${ysnopass}">
									<a href="javascript:void(0);"onclick="orderPass('2','${order.MODIFY_ID}','${order.ORDER_TYPE}');">验收驳回</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${ not empty order.ALTER_USER_ID &&order.ALTER_USER_ID eq s_employeeId }">
							<c:if test="${order.ORDER_TYPE==0}">
								<c:if test="${order.ORDER_STATUS==1}">
									<a href="javascript:void(0);"onclick="alterOrder('${order.MODIFY_ID}')">处理</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${ not empty order.ALTER_USER_ID &&order.ALTER_USER_ID eq s_employeeId }">
							<c:if test="${order.ORDER_TYPE==0}">
								<c:if test="${order.ORDER_STATUS==1}">
									<a href="javascript:void(0);"onclick="updateNoCl('${order.MODIFY_ID}')">不处理</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${order.APPLY_ID eq s_employeeId }">
							<c:if test="${order.ORDER_TYPE==1}">
								<c:if test="${order.ORDER_STATUS==1}">
									<a href="javascript:void(0);"onclick="yzOrder('${order.MODIFY_ID}');">验收</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${order.ORDER_TYPE==0}">
							<c:if test="${order.ORDER_STATUS==1}">
								<c:if test="${move}">
									<a href="javascript:void(0);"onclick="moveOrderAlter('${order.MODIFY_ID}');">转移</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</c:if>
						<a href="javascript:void(0);"onclick="showOrderLog('${order.MODIFY_ID}');">日志</a>&nbsp;|&nbsp;
							<c:if test="${order.ORDER_TYPE==0}">
								<c:if test="${order.ORDER_STATUS==2}">
									<a href="javascript:void(0);" onclick="deleteModifyOrder('${order.MODIFY_ID}')">撤案</a>&nbsp;|&nbsp;
								</c:if>
							</c:if>
						</td>
					</tr>
					<tr>
					<td style="text-align:center;" colspan="10" align="center">
					<div id="order${order.MODIFY_ID }" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%"></div>
					</td>
					</tr>
				</c:forEach>
				
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>
			</div>
		</div>
	</form>
		<c:forEach items="${dw.resultList}" var="order" varStatus="index">
	<div style="display:none;" id="authForm_div_${order.MODIFY_ID}" title="请输入意见">
		<form action="../servlet/defaultDispatcher" id="remarkForm_${order.MODIFY_ID}" name="remarkForm_${order.MODIFY_ID}" method="post">
			<input type="hidden" name="__action" value="modifyOrderCommand.takeOrder">
			<input type="hidden" name="ORDER_TYPE" id="type_${order.MODIFY_ID}">
			<input type="hidden" name="ORDER_STATUS" id="status_${order.MODIFY_ID}">
			<input type="hidden" name="MODIFY_ID" id="modifyId_${order.MODIFY_ID}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td style="text-align: center;"><strong>意见：<br/></strong><font color="red" size="-2">(非必填)</font></td>
								<td><textarea name="REMARK" cols="55" rows="5"></textarea></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="2"  style="text-align: center;">
									<input type="button" value="确定" id="save_${order.MODIFY_ID}"  class="ui-state-default ui-corner-all" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
				<c:forEach items="${dw.resultList}" var="order" varStatus="index">
									<div title="处理单" style="display: none" id="showAlterOrder_${order.MODIFY_ID}">
									<form id="showAlterOrderform_${order.MODIFY_ID}" name="showAlterOrderform_${order.MODIFY_ID}" method="POST"
										action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateAlterOrder">
										<input type="hidden" id="MODIFY_ID_${order.MODIFY_ID}" name="MODIFY_ID" />
										<div
											class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
											<div class="zc_grid_body jqgrowleft">
												<div class="ui-state-default ui-jqgrid-hdiv ">
													<table cellspacing="0" cellpadding="0" border="0"
														class="ui-jqgrid-htable zc_grid_title">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td style="text-align: center" width="10%">处理情形:</td>
															<td style="text-align: center; height: 150px;" width="90%"><textarea name="REMARK_CL" cols="55" rows="5"></textarea></td>
														</tr>
														<tr class="ui-widget-content jqgrow ui-row-ltr">
																<td style="text-align: center" width="10%">工时（人时）:</td>
																<td style="text-align: center; height: 30px;" width="90%"><input style="width: 90%; height: 100%" name="WORK_HOURS" /></td>
															</tr>
													<tr class="ui-widget-content jqgrow ui-row-ltr">
														<td colspan="2" style="text-align: center; height: 30px;"
															width="100%"><input type="button" value="提交" onclick="updateAlterOrder('${order.MODIFY_ID}');"/></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</form>
							</div>
				</c:forEach>
				<c:forEach items="${dw.resultList}" var="order" varStatus="index">
									<div title="处理单" style="display: none" id="showAlterOrder_YZ_${order.MODIFY_ID}">
									<form id="showAlterOrderform_YZ_${order.MODIFY_ID}" name="showAlterOrderform_YZ_${order.MODIFY_ID}" method="POST"
										action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateAlterOrderYZ">
										<input  type="hidden" id="MODIFY_ID_YZ_${order.MODIFY_ID}" name="MODIFY_ID" />
										<div
											class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
											<div class="zc_grid_body jqgrowleft">
												<div class="ui-state-default ui-jqgrid-hdiv ">
													<table cellspacing="0" cellpadding="0" border="0"
														class="ui-jqgrid-htable zc_grid_title">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td style="text-align: center" width="10%">验证情形:</td>
															<td style="text-align: center; height: 150px;" width="90%"><textarea name="REMARK_YZ" cols="55" rows="5"></textarea></td>
														</tr>
													<tr class="ui-widget-content jqgrow ui-row-ltr">
														<td colspan="2" style="text-align: center; height: 30px;"
															width="100%"><input type="button" value="提交" onclick="updateAlterOrderYZ('${order.MODIFY_ID}');"/></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</form>
							</div>
				</c:forEach>
				
				<c:forEach items="${dw.resultList}" var="order" varStatus="index">
									<div title="转移" style="display: none" id="moveOrderAlterDiv_${order.MODIFY_ID}">
									<form id="moveOrderAlterform_${order.MODIFY_ID}" name="moveOrderAlterform_${order.MODIFY_ID}" method="POST"
										action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateAlterUserId">
										<input  type="hidden" id="moveOrderAlter_${order.MODIFY_ID}" name="MODIFY_ID" />
										<div
											class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
											<div class="zc_grid_body jqgrowleft">
												<div class="ui-state-default ui-jqgrid-hdiv ">
													<table cellspacing="0" cellpadding="0" border="0"
														class="ui-jqgrid-htable zc_grid_title">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td style="text-align: center" width="10%">请选择处理人员:</td>
															<td style="text-align: center; height: 40px;" width="90%"><select id="ALTER_USER_ID" name="ALTER_USER_ID" style="width: 150px"><option>请选择</option>
																	<c:forEach items="${alterList}" var="alter">
																		<option value="${alter.USER_ID}">${alter.NAME}</option>
																	</c:forEach>
																</select></td>
														</tr>
													<tr class="ui-widget-content jqgrow ui-row-ltr">
														<td colspan="2" style="text-align: center; height: 30px;" width="100%"><input type="button" value="提交" onclick="moveOrderAlterBut('${order.MODIFY_ID}');"/></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</form>
							</div>
				</c:forEach>
				<c:forEach items="${dw.resultList}" var="order" varStatus="index">
						<div style="display:none;" id="deleteModifyOrder_${order.MODIFY_ID}" title="请输入原因">
							<form id="deleteModifyOrderform_${order.MODIFY_ID}" name="deleteModifyOrderform_${order.MODIFY_ID}" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.deleteModifyOrder">
								<input  type="hidden" id="MODIFY_ID_DELETE_${order.MODIFY_ID}" name="MODIFY_ID" />
								<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
							          <div class="zc_grid_body jqgrowleft">
										<div class="ui-widget-content jqgrow ui-row-ltr ">
											<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-state-default ui-jqgrid-hdiv">
													<td style="text-align: center;"><strong>撤案原因:<br/></strong><font color="red" size="-2">(必填)</font></td>
													<td><textarea id="REMARK_DELETE_${order.MODIFY_ID}" name="REMARK_DELETE" cols="55" rows="5"></textarea></td>
												</tr>
												<tr class="ui-state-default ui-jqgrid-hdiv">
													<td colspan="2"  style="text-align: center;">
													<input type="button" value="提交" onclick="deleteModifyOrderSubmit('${order.MODIFY_ID}');"/>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
						</form>
					</div>
			</c:forEach>
			
			<c:forEach items="${dw.resultList}" var="order" varStatus="index">
						<div style="display:none;" id="updateNoClDiv_${order.MODIFY_ID}" title="请输入原因">
							<form id="updateNoClform_${order.MODIFY_ID}" name="updateNoClform_${order.MODIFY_ID}" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.updateNoCl">
								<input  type="hidden" id="updateNoCl_${order.MODIFY_ID}" name="MODIFY_ID" />
								<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
							          <div class="zc_grid_body jqgrowleft">
										<div class="ui-widget-content jqgrow ui-row-ltr ">
											<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr class="ui-state-default ui-jqgrid-hdiv">
													<td style="text-align: center;"><strong>不予处理原因:<br/></strong><font color="red" size="-2">(必填)</font></td>
													<td><textarea id="REMARK_NoCL_${order.MODIFY_ID}" name="REMARK_NoCL" cols="55" rows="5"></textarea></td>
												</tr>
												<tr class="ui-state-default ui-jqgrid-hdiv">
													<td colspan="2"  style="text-align: center;">
													<input type="button" value="提交" onclick="updateNoClBut('${order.MODIFY_ID}');"/>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
						</form>
					</div>
			</c:forEach>
	<div id="dialog" title="提示"><p id="dialogContent"></p></div>
</body>