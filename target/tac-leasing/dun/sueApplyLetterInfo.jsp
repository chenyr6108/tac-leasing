<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibsNew.jsp"%>
<%@ page import="java.util.Date"%>
<link rel="stylesheet" href="${ctx}/dun/js/selectize/selectize.default.css">
<script src="${ctx}/dun/js/selectize/selectize.js"></script>
<script type="text/javascript">
	//var $j = jQuery.noConflict(true);
	var sueId = '${sueMap.ID}';
	$(function(){
		var text = '${sueMap.REASONS }';
		$('#input-tags').val(text);
		if(text.length > 0){
			var reasons = text.split('；');
			text = '';
			for(var i = 0; i < reasons.length; i++){
				text = text + (i + 1) + '、' + reasons[i] + '；<br/>';
			}
		}
		var opType = '${opType}';
		$('#styleReasons' + opType + sueId).html(text);
		
	    initSelectize();
	    $('select.selectized,input.selectized').each(function() {
			var $input = $(this);
			var update = function(e) { 
				$('#reasons' + sueId).val($input.val());
			};
			$(this).on('change', update);
			update();
		});
	});
	
	function initSelectize(){
		/* var $select =  */
		var options = [];
		var reasons = '${sueReasonList}';
		var reasonOptions = reasons.split('；');
		for(var i = 0; i < reasonOptions.length; i++){
			options.push({
		        title: reasonOptions[i]
		    });
		}
		$('#input-tags').selectize({
		    plugins: ['remove_button','drag_drop'],
		    delimiter: '；',
		    persist: false,
		    //create: false,
		    valueField: 'title',
		    labelField: 'title',
		    options: options,
		    create: function(input) {
		        return {
		        	title: input
		        };
		    }
		});
		//调整下拉选项的显示
		$('.selectize-control').css('position','static');
		/* var selectize = $select[0].selectize;
		selectize.lock(); */
	}
	
	function appSue(o){
		o.disabled='disabled';
		var date = $('#datebegin').val();
		var startrange = $('#startrange').val();
		var endrange = $('#endrange').val();
		var content = $('#content').val();
		var name = $('#NAME').val();
		var sueId = '${sueMap.ID}';
		var reasons = $('#reasons' + sueId).val();
		window.location = "../servlet/defaultDispatcher?__action=litigationCommand.applySue&dun_date="+date
				+"&applyUserId="+$('#applyUserId').val()
				+"&sueRectId="+$('#sueRectId').val()
				+"&sueId="+sueId
				+"&reasons="+reasons
				+"&startrange="+startrange+"&endrange="+endrange
				+"&content=" + content + "&name=" + name;
	}
	function approval(o, type, state, sueId){
		if(state==4) {//总经理审核通过
			if(type=="approvalPass") {
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=invoiceManagementCommand.checkDuplicate&RECP_ID='+$("#RECP_ID").val()+"&FLAG=STOP",
					dataType:'json',
					success: function(flag)	{
						if(flag) {
							//如果已经停开则不做停开发票操作
							//但是要做原来的逻辑
							//做原来的逻辑
							o.disabled='disabled';
							var sueId = '${sueMap.ID}';
							var suggest = $('#suggest' + sueId).val().trim();
							if(suggest==''){
								alert('请填写审核意见!');
								$('#suggest' + sueId).focus();
								o.disabled='';
								return false;
							}
							var status = 1;
							if(type=="approvalReject"){
								//审核结果（1通过，0驳回）
								status = 0;
							}
							window.location = "../servlet/defaultDispatcher?__action=litigationCommand.approvalSue&state="+state+"&sueId="+sueId+"&suggest="+suggest+"&status="+status;
							//做原来的逻辑
						} else {
							//如果未停开则插入停开发票表
							$.ajax({
								type:"post",
								url:'../servlet/defaultDispatcher',
								data:'__action=invoiceManagementCommand.stopInvoiceProcess&RECP_ID='+$("#RECP_ID").val()+"&remark=总经理审批通过之起诉申请单",
								dataType:'json',
								success: function(flag)	{
									if(flag) {
									//做原来的逻辑
									o.disabled='disabled';
									var sueId = '${sueMap.ID}';
									var suggest = $('#suggest' + sueId).val().trim();
									if(suggest==''){
										alert('请填写审核意见!');
										$('#suggest' + sueId).focus();
										o.disabled='';
										return false;
									}
									var status = 1;
									if(type=="approvalReject"){
										//审核结果（1通过，0驳回）
										status = 0;
									}
									window.location = "../servlet/defaultDispatcher?__action=litigationCommand.approvalSue&state="+state+"&sueId="+sueId+"&suggest="+suggest+"&status="+status;
									//做原来的逻辑
									}
								}	
							});
						}
					}	
				});
			} else {
				//做原来的逻辑
				o.disabled='disabled';
				var sueId = '${sueMap.ID}';
				var suggest = $('#suggest' + sueId).val().trim();
				if(suggest==''){
					alert('请填写审核意见!');
					$('#suggest' + sueId).focus();
					o.disabled='';
					return false;
				}
				var status = 1;
				if(type=="approvalReject"){
					//审核结果（1通过，0驳回）
					status = 0;
				}
				window.location = "../servlet/defaultDispatcher?__action=litigationCommand.approvalSue&state="+state+"&sueId="+sueId+"&suggest="+suggest+"&status="+status;
				//做原来的逻辑
			}
		} else {
			o.disabled='disabled';
			var sueId = '${sueMap.ID}';
			var suggest = $('#suggest' + sueId).val().trim();
			if(suggest==''){
				alert('请填写审核意见!');
				$('#suggest' + sueId).focus();
				o.disabled='';
				return false;
			}
			var status = 1;
			if(type=="approvalReject"){
				//审核结果（1通过，0驳回）
				status = 0;
			}
			window.location = "../servlet/defaultDispatcher?__action=litigationCommand.approvalSue&state="+state+"&sueId="+sueId+"&suggest="+suggest+"&status="+status;
		}
	}
</script>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<input id="applyUserId" type="hidden" value="${s_employeeId}" />
		<input id="sueRectId" type="hidden" value="${sue_rect_id}" />
		<input id="sueId${sueMap.ID}" type="hidden" value="${sueMap.ID}" />
		<input id="RECP_ID" type="hidden" value="${recpId }" />
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="50%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
					<td colspan="6" style="text-align:center; font-size:20px; font-weight:bold;">案件起诉申请单&nbsp;</td>
				</tr>
				<c:if test="${!(sueMap.CREATE_DATE == null && opType=='show')}">
					<tr class="ui-state-default ui-th-ltr zc_grid_head"> 
						<td colspan="6" style="text-align: right;">申请日期：
							<c:if test="${sueMap.CREATE_DATE == null}">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${nowDate}"/>&nbsp;&nbsp;
							</c:if>
							<c:if test="${sueMap.CREATE_DATE != null}">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sueMap.CREATE_DATE}"/>&nbsp;&nbsp;
							</c:if>
						</td>
					</tr>
				</c:if>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
					<td style="background-color: #e8e8e8;text-align:center;">
						<strong>合同编号</strong>
					</td>
					<td colspan="2" style="background-color: #e8e8e8;text-align:center;">
						<strong>承租人</strong>
					</td >
					<td style="background-color: #e8e8e8;text-align:center;">
						<strong>承办区域</strong>
					</td>
					<td colspan="2" style="background-color: #e8e8e8;text-align:center;">
						<strong>承办人员</strong>
					</td >
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align:center;">${mapContent.LEASE_CODE }</td>
					<td style="text-align:center;" colspan="2">${mapContent.CUST_NAME }</td>
					<td style="text-align:center;">${mapContent.DECP_NAME_CN }</td>
					<td style="text-align:center;" colspan="2">${mapContent.NAME }</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>管辖法院</strong>
					</td>
					<td style="text-align:center;" colspan="5">${mapContent.court }</td >
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>目标物名称</strong>
					</td>
					<td style="background-color: #e8e8e8; text-align:center;" colspan="2">
						<strong>厂牌</strong>
					</td >
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>机型</strong>
					</td >
					<td style="background-color: #e8e8e8; text-align:center;" colspan="2">
						<strong>机号</strong>
					</td >
				</tr>
				<c:forEach items="${mapSueq }" var="thing">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align:center;">${thing.THING_NAME }</td>
						<td style="text-align:center;" colspan="2">${thing.THING_KIND }</td>
						<td style="text-align:center;">${thing.MODEL_SPEC }</td>
						<td style="text-align:center;" colspan="2">${(thing.THING_NUMBER==null||thing.THING_NUMBER eq '')?"/":thing.THING_NUMBER }</td>
					</tr>
				</c:forEach>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align:center;">本金余额：<br/><fmt:formatNumber value="${settleMap.SUM_OWN_PRICE}" pattern="#,##0.00"/>&nbsp;元</td>
					<td style="text-align:center;" colspan="2">承办期数：${unPayPrice.LEASE_PERIOD }&nbsp;期</td>
					<td style="text-align:center;">已缴期数：${mapContent.PERIOD_NUM }&nbsp;期</td>
					<td style="text-align:center;" colspan="2">欠缴天数：${mapContent.DUN_DAY }&nbsp;天</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align:center;">未缴总租金：<br/><fmt:formatNumber value="${unPayPrice.UNPAY_PRICE==null?0:unPayPrice.UNPAY_PRICE }" pattern="#,##0.00"/>&nbsp;元</td>
					<td style="text-align:center;">违约金：<fmt:formatNumber value="${mapDunFine.fine==null?0:mapDunFine.fine }" pattern="#,##0.00"/>&nbsp;元</td>
					<td style="text-align:center;" colspan="2">供应商连保：
						${suplTrue=="连保"?"是":"否" }
					</td>
					<td style="text-align:center;" colspan="2">
						法务费用：<fmt:formatNumber value="${settleMap.TOTAL_LAWYFEE}" pattern="#,##0.00"/>&nbsp;元<br/>
						诉讼费约<fmt:formatNumber value="${settleMap.suePrice}" pattern="#,##0.00"/>&nbsp;元
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>请求总额</strong>
					</td>
					<td style="text-align:center;" colspan="5"><fmt:formatNumber value="${settleMap.total}" pattern="#,##0.00"/>&nbsp;元</td >
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>回访日期</strong>
					</td>
					<td style="text-align:center;" colspan="2">${backVisit==null?"/":backVisit.VISIT_DATE }</td >
					<td style="background-color: #e8e8e8; text-align:center;">
						<strong>厂内营运状况</strong>
					</td >
					<td style="text-align:center;" colspan="2">&nbsp;
						<c:if test='${backVisit != null }'>
							<c:if test='${backVisit.PROD_DEGREE_DETAILED eq 0 }'>佳</c:if>
							<c:if test='${backVisit.PROD_DEGREE_DETAILED eq 1 }'>可</c:if>
							<c:if test='${backVisit.PROD_DEGREE_DETAILED eq 2 }'>差</c:if>
						</c:if>
						<c:if test='${backVisit == null }'>/</c:if>
					</td >
				</tr>
				<c:if test="${sueMap.STATE!=null || opType=='apply' || opType=='approvalPass' || opType=='approvalReject'}">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td colspan="6" style="white-space: normal;">
							<strong>申请起诉理由：</strong><br/>
								<c:if test="${opType=='show' || opType=='approvalPass' || opType=='approvalReject' }">
									<div id="styleReasons${opType}${sueMap.ID }"></div>
								</c:if>
								<c:if test="${opType=='apply' }">
									<input id="reasons${sueMap.ID}" type="hidden"/>
									<input type="text" id="input-tags" class="input-tags demo-default" value="">
								</c:if>
							<br/>
							依据诉讼SOP申请立案起诉，呈请核示！
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8; text-align:center;">
							<strong>申请部门主管</strong>
						</td>
						<td style="text-align:center; width:180px;">${sueMap.SECOND_UP_USER_NAME==null?"&nbsp;":sueMap.SECOND_UP_USER_NAME }</td>
						<td style="background-color: #e8e8e8; text-align:center;">
							<strong>申请单位主管</strong>
						</td>
						<td style="text-align:center; width:110px;">${sueMap.FIRST_UP_USER_NAME==null?"&nbsp;":sueMap.FIRST_UP_USER_NAME }</td>
						<td style="background-color: #e8e8e8; text-align:center;">
							<strong>申请人</strong>
						</td>
						<td style="text-align:center; width:100px;">&nbsp;${sueMap==null?s_employeeName:sueMap.APPLY_USER_NAME }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8; text-align:center;">
							<strong>总经理</strong>
						</td>
						<td style="text-align:center;" colspan="5">${sueMap.GENERAL_MANAGER_NAME==null?"&nbsp;":sueMap.GENERAL_MANAGER_NAME }</td>
					</tr>
				</c:if>
				<c:if test="${sueMap.STATE!=null && (sueMap.STATE != 2 || opType=='approvalPass' || opType=='approvalReject') }">
					<tr class="ui-widget-content jqgrow ui-row-ltr"><td colspan="6">&nbsp;</td></tr>
					<tr class="ui-state-default ui-th-ltr zc_grid_head">
						<td style="text-align:center;" colspan="6">
							<strong>审核信息</strong>
						</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td rowspan="2" style="background-color: #e8e8e8; text-align:center;">
							<strong>单位主管审核意见</strong>
						</td>
						<c:if test="${opType=='show' || ((opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE != 2)}">
							<td style="text-align:left;" colspan="5">
								<span style="white-space:normal;">${sueMap.FIRST_UP_USER_MSG }</span>
							</td>
						</c:if>
						<c:if test="${(opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE == 2 }">
							<td style="text-align:left;" colspan="5">
								<textarea id="suggest${sueMap.ID}" rows="4" style="width:100%"></textarea>
							</td>
						</c:if>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align:right;" colspan="5">
							审核意见：${(sueMap.FIRST_UP_USER_STATUS==1||opType=='approvalPass')?"通过":(sueMap.FIRST_UP_USER_STATUS==0||opType=='approvalReject')?"驳回":"" }&nbsp;&nbsp;
							签字：${sueMap.FIRST_UP_USER_NAME==null?s_employeeName:sueMap.FIRST_UP_USER_NAME }&nbsp;&nbsp;
							时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sueMap.FIRST_UP_USER_DATE}"/>
						</td>
					</tr>
					<c:if test="${(sueMap.STATE > 2 && (opType=='approvalPass' || opType=='approvalReject')) || (sueMap.STATE > 3 && opType=='show') || (sueMap.STATE==1 && sueMap.FIRST_UP_USER_STATUS==1)}">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td rowspan="2" style="background-color: #e8e8e8; text-align:center;">
								<strong>部门主管审核意见</strong>
							</td>
							<c:if test="${opType=='show' || ((opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE > 3)}">
								<td style="text-align:left;" colspan="5">
									<span style="white-space:normal;">${sueMap.SECOND_UP_USER_MSG }</span>
								</td>
							</c:if>
							<c:if test="${(opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE == 3 }">
								<td style="text-align:left;" colspan="5">
									<textarea id="suggest${sueMap.ID}" rows="4" style="width:100%"></textarea>
								</td>
							</c:if>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align:right;" colspan="5">
								审核意见：${(sueMap.SECOND_UP_USER_STATUS==1||opType=='approvalPass')?"通过":(sueMap.SECOND_UP_USER_STATUS==0||opType=='approvalReject')?"驳回":"" }&nbsp;&nbsp;
								签字：${sueMap.SECOND_UP_USER_NAME==null?s_employeeName:sueMap.SECOND_UP_USER_NAME }&nbsp;&nbsp;
								时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sueMap.SECOND_UP_USER_DATE}"/>
							</td>
						</tr>
					</c:if>
					<c:if test="${(sueMap.STATE > 3 && (opType=='approvalPass' || opType=='approvalReject')) || (sueMap.STATE > 4 && opType=='show') || (sueMap.STATE==1 && sueMap.SECOND_UP_USER_STATUS==1)}">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td rowspan="2" style="background-color: #e8e8e8; text-align:center;">
								<strong>总经理审核意见</strong>
							</td>
							<c:if test="${opType=='show' || ((opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE > 4)}">
								<td style="text-align:left;" colspan="5">
									<span style="white-space:normal;">${sueMap.GENERAL_MANAGER_MSG }</span>
								</td>
							</c:if>
							<c:if test="${(opType=='approvalPass' || opType=='approvalReject') && sueMap.STATE == 4 }">
								<td style="text-align:left;" colspan="5">
									<textarea id="suggest${sueMap.ID}" rows="4" style="width:100%"></textarea>
								</td>
							</c:if>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align:right;" colspan="5">
								审核意见：${(sueMap.GENERAL_MANAGER_STATUS==1||opType=='approvalPass')?"通过":(sueMap.GENERAL_MANAGER_STATUS==0||opType=='approvalReject')?"驳回":"" }&nbsp;&nbsp;
								签字：${sueMap.GENERAL_MANAGER_NAME==null?s_employeeName:sueMap.GENERAL_MANAGER_NAME }&nbsp;&nbsp;
								时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sueMap.GENERAL_MANAGER_DATE}"/>
							</td>
						</tr>
					</c:if>
				</c:if>
				<c:if test="${opType=='apply' }">
					<tr>
						<td colspan="6" align="center">
							<input type="button" onclick="appSue(this);" style="padding:0 10px; margin:4px 0;" class="ui-state-default ui-corner-all" value="生成案件起诉申请单" />
						</td>
					</tr>
				</c:if>
				<c:if test="${opType=='approvalPass' }">
					<tr>
						<td colspan="6" align="center">
							<input type="button" onclick="approval(this,'approvalPass','${sueMap.STATE}','${sueMap.ID}');" style="padding:0 10px; margin:4px 0;" class="ui-state-default ui-corner-all" value="通过" />
						</td>
					</tr>
				</c:if>
				<c:if test="${opType=='approvalReject' }">
					<tr>
						<td colspan="6" align="center">
							<input type="button" onclick="approval(this,'approvalReject','${sueMap.STATE}','${sueMap.ID}');" style="padding:0 10px; margin:4px 0;" class="ui-state-default ui-corner-all" value="驳回" />
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</div>
