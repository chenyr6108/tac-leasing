<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/moneyRate/js/moneyRate.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<title>方案配置</title>
		<script type="text/javascript">
			$(function(){
				$("input[name='start_date']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='end_date']").datepicker($.datepicker.regional['zh-CN']);
				$("#create_end_date").datepicker($.datepicker.regional['zh-CN']);
			}) ;
			function changeStartDate(id,startDate){
				var start_date = $("#"+startDate).val() ;
				if(start_date == null || start_date == ""){
					alert("起始时间不能为空") ;
					return  false;
				}
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=moneyRate.updateMoneyRateStartOREndDate&id=' + id + '&start_date=' + start_date,
					dataType:'json',
					async: false,
					success: function(dataBack){		
						location.href='../servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE='+TAX_PLAN_CODE;
					},
					error:function(callback){
						alert("error!");
						return false;
					}
				});
			}
			function changeEndDate(id,endDate){
				var end_date = $("#"+endDate).val() ;
				if(end_date == null || end_date == ""){
					alert("结束时间不能为空") ;
					return  false;
				}
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=moneyRate.updateMoneyRateStartOREndDate&id=' + id + '&end_date=' + end_date,
					dataType:'json',
					async: false,
					success: function(dataBack){		
						location.href='../servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE='+TAX_PLAN_CODE;
					},
					error:function(callback){
						alert("error!");
						return false;
					}
				});
			}
			function createRate(){
				var filedName = $("#create_filed_name").val() ;
				var showName = $("#create_show_name").val() ;
				var rateValue = $("#create_rate_value").val() ;
				var remark = $("#create_remark").val() ;
				var startDate = $("#create_start_date").val() ;
				var endDate = $("#create_end_date").val() ;
				var TAX_PLAN_CODE=$("#TAX_PLAN_CODE").val() ;
				if(filedName == null || filedName==""){
					alert("名称不能为空") ;
					return  false;
				}
				if(showName == null || showName==""){
					alert("显示名称不能为空") ;
					return ;
				}
				if(rateValue == null || rateValue==""){
					alert("利率值不能为空!");
					return false;
				} else if(!valueIsDouble(rateValue)){
					alert("利率值不是正确数字!");
					return false;
				}
				if(startDate == null || startDate==""){
					alert("起始时间不能为空") ;
					return false;
				}
				if(endDate == null || endDate==""){
					alert("结束时间不能为空") ;
					return false;
				}
				var start = new Date(startDate) ;
				var end = new Date(endDate) ;
				if(end - start < 0){
					alert("结束时间不能在起始时间之前!") ;
					return false ;
				}
				if(confirm("确定要增加吗？")){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=moneyRate.createRateConfig&filed_name='+filedName+'&show_name='+showName+'&rate_value='+rateValue+'&remark='+remark+'&start_date='+startDate +'&end_date='+endDate+'&TAX_PLAN_CODE='+TAX_PLAN_CODE,
						dataType:'json',
						async: false,
						success: function(dataBack){		
							alert("添加成功！") ;
							location.href='../servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE='+TAX_PLAN_CODE;
						},
						error:function(callback){
							alert("error!");
							return false;
						}
					});
				} else {
					$("#create_filed_name").val('') ;
					$("#create_show_name").val('') ;
					$("#create_rate_value").val('') ;
					$("#create_remark").val('') ;
					$("#create_start_date").val('') ;
				}
			}
			function valueIsDouble(value){
				value=value+"";
			    var m=/^(\d)+(.){1}(\d)+$/;
			    value = value.replace(/,/g, '');	
				if(new Number(value)>=0&&(value.match(m)||valueIsNumberx(value)))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			function deleteRateConfig(id,filedName){
				if(id == null || id==""){
					alert("ID为空") ;
					return false;
				}
				if(filedName == null || filedName==""){
					alert("名称不能为空") ;
					return false;
				}
				$.ajax({
					type:'post' ,
					url:'../servlet/defaultDispatcher',
					data:'__action=moneyRate.queryFiledNameCount&filed_name='+filedName,
					dataType:'json',
					async: false,
					success: function(dataBack){		
						if(dataBack.count > 1){
							if(confirm("确定要删除么？")){
								$.ajax({
									type:'post' ,
									url:'../servlet/defaultDispatcher',
									data:'__action=moneyRate.deleteRateConfig&id='+id,
									dataType:'json',
									async: false,
									success: function(dataBack){
										location.href='../servlet/defaultDispatcher?__action=moneyRate.getShow&TAX_PLAN_CODE='+TAX_PLAN_CODE;		
									},
									error:function(callback){
										alert("error!");
										return false;
									}
								});
							}
						} else {
							alert(filedName+"只有一个不能删除！") ;
						}
					},
					error:function(callback){
						alert("error!");
						return false;
					}
				});
			}
		</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="employee.getEmployees" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;方案配置</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							显示名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							利率值
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							起始时间
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							结束时间
						</th >
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							备注
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<c:forEach items="${moneyRateList}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count }<input type="hidden" id="rate_value${status.count }" value="<fmt:formatNumber value="${item.RATE_VALUE }" pattern="#.#####"/>"></td>
							<td style="text-align: center;">${item.FILED_NAME }</td>
							<td style="text-align: center;">${item.SHOW_NAME }</td>
							<td style="text-align: center;"><input type="text" value="<fmt:formatNumber value="${item.RATE_VALUE }" pattern="#.#####"/>" onchange="changeValue('${item.ID }','${item.FILED_NAME }','${item.SHOW_NAME }','${item.RATE_VALUE }',this,'rate_value${status.count }','${TAX_PLAN_CODE }');" size="5">%</td>
							<td style="text-align: center;"><input type="text" readonly="readonly" name="start_date" id="start_date${status.count}" value="${item.START_DATE }" onchange="changeStartDate('${item.ID }','start_date${status.count}','${TAX_PLAN_CODE }');" size="12" ></td>	
							<td style="text-align: center;"><input type="text" readonly="readonly" name="end_date" id="end_date${status.count}" value="${item.END_DATE }" onchange="changeEndDate('${item.ID }','end_date${status.count}','${TAX_PLAN_CODE }');" size="12" ></td>	
							<td style="text-align: center;"><input type="text" value="${item.REMARK }" onchange="changeRemark(${item.ID },this);" size="40"></td>
							<td style="text-align: center;"><input class="ui-state-default ui-corner-all" type="button" value="删除" onclick="deleteRateConfig('${item.ID}','${item.FILED_NAME}','${TAX_PLAN_CODE }')"/></td>
						</tr>
					</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">增加</td>
						<td style="text-align: center;"><input type="text" readonly="readonly" name="create_filed_name" id="create_filed_name"/></td>
						<td style="text-align: center;"><SELECT name="create_show_name" id="create_show_name">
									<option onclick="$('#create_filed_name').val('')">名称</option>
						<c:forEach var="showNames" items="${showNamesList}" ><option value="${showNames.SHOW_NAME}" onclick="$('#create_filed_name').val('${showNames.FILED_NAME}'); $('#create_start_date').val('${showNames.END_DATE }');">${showNames.SHOW_NAME}</option></c:forEach></SELECT></td>
						<td style="text-align: center;"><input type="text" name="create_rate_value" id="create_rate_value" size="5">%</td>
						<td style="text-align: center;"><input type="text" readonly="readonly" name="create_start_date" id="create_start_date"  size="12" ></td>
						<td style="text-align: center;"><input type="text" readonly="readonly" name="create_end_date" id="create_end_date" size="12" ></td>
						<td style="text-align: center;"><input type="text" name="create_remark" id="create_remark" size="40"></td>
						<td style="text-align: center;"><input type="hidden" name="TAX_PLAN_CODE" id="TAX_PLAN_CODE" value="${TAX_PLAN_CODE }"></td>
						<td style="text-align: center;"><input class="ui-state-default ui-corner-all" type="button" value="增加" onclick="createRate();"/></td>
					</tr>
				</table>
				<table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
							备注
						</th>
						<c:forEach items="${moneyRateLog}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count }&nbsp;</td>
							<td style="text-align: center;">${item.NAME }&nbsp;</td>
							<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
							<td style="text-align: center;" colspan="4">${item.MEMO }&nbsp;</td>
							</tr>
					</c:forEach>
				</table>
				</div>
				</div>
				</div>
		</form>
	</body>
</html>
