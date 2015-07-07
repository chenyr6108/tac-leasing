<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>客户经理转移</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	<script type="text/javascript">	
	   function changeMore(){
		   $("#search_content").val($("#content").val());
					  var chk_value =[];   
					  $('input[name="credit_idxx"]:checked').each(function(){   
					   chk_value.push($(this).val());   
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择报告");
					  	return false;}	  
					  $("#credit_idmore").val(chk_value);
	  		$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=ChangeSenson.querySenson',
					dataType:'json',
					async: false,
					success: function(dataBack){
		   			var htm="<option value='-1'>--请选择--</option>";
		   			if(dataBack.sensonList!=null){
			   			for(i=0;i<dataBack.sensonList.length;i++){
			   				htm=htm+"<option value="+dataBack.sensonList[i].ID+">"+dataBack.sensonList[i].NAME+"</option>";
			        	}
		        	}
		        	$(sensor).html(htm);
					},
					error:function(callback){
								alert("error!");
								return;
							}
						});
				$('#change').dialog({
					modal:true,
					autoOpen: false
					
				});
				$('#change').dialog('open');
	  }
	  
	  function changeByLot(){
					
	  		$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=ChangeSenson.querySensonOn',
					dataType:'json',
					async: false,
					success: function(dataBack){

		   			var htm="<option value='-1'>--请选择--</option>";
		   			if(dataBack.sensonList!=null){
			   			for(i=0;i<dataBack.sensonList.length;i++){
			   				htm=htm+"<option value="+dataBack.sensonList[i].ID+">"+dataBack.sensonList[i].NAME+"</option>";
			        	}
		        	}
		        	$(sensor1).html(htm);
					},
					error:function(callback){
								alert("error!");
								return;
							}
						});
			$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=ChangeSenson.querySenson',
					dataType:'json',
					async: false,
					success: function(dataBack){

		   			var htm="<option value='-1'>--请选择--</option>";
		   			if(dataBack.sensonList!=null){
			   			for(i=0;i<dataBack.sensonList.length;i++){
			   				htm=htm+"<option value="+dataBack.sensonList[i].ID+">"+dataBack.sensonList[i].NAME+"</option>";
			        	}
		        	}
		        	$(sensor2).html(htm);
					},
					error:function(callback){
								alert("error!");
								return;
							}
						});
						
				$('#changeByLot').dialog({
					modal:true,
					autoOpen: false
					
				});
				$('#changeByLot').dialog('open');
	  }
	  
	  function addTypeDivl(id,sensorid,custcode){
	  			document.getElementById('credit_id10').value=id;
	  			document.getElementById('sensorIdForisOver').value=sensorid;
	  			document.getElementById('cust_code').value=custcode;
	  			$("#search_content").val($("#content").val());
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=ChangeSenson.querySenson&sensorid=' + sensorid,
					dataType:'json',
					async: false,
					success: function(dataBack){

		   			var htm="<option value='-1'>--请选择--</option>";
		   			if(dataBack.sensonList!=null){
			   			for(i=0;i<dataBack.sensonList.length;i++){
			   				htm=htm+"<option value="+dataBack.sensonList[i].ID+">"+dataBack.sensonList[i].NAME+"</option>";
			        	}
		        	}
		        	$(sensor).html(htm);
					},
					error:function(callback){
								alert("error!");
								return;
							}
						});
				$('#change').dialog({
					modal:true,
					autoOpen: false
					
				});
				$('#change').dialog('open');
			}
	</script>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="ChangeSenson.queryReport">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" id="commit_flag" name="commit_flag">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户经理转移</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期：</td>
				          <td>
				          <input type="text" name="start_date" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${start_date }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="end_date" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${end_date }">
					</td>
					<td>
					类型：
					</td>
					<td>
					<c:set var="type11" value=""></c:set>
					<c:set var="type12" value=""></c:set>
					<c:set var="type0" value=""></c:set>
					<c:set var="type1" value=""></c:set>
					<c:set var="type2" value=""></c:set>
					<c:set var="type3" value=""></c:set>
					<c:if test="${credit_type eq -1}">
						<c:set var="type11" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq -2}">
						<c:set var="type12" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 0}">
						<c:set var="type0" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 1}">
						<c:set var="type1" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 2}">
						<c:set var="type2" value="selected='selected'"></c:set>
					</c:if>
					<c:if test="${credit_type eq 3}">
						<c:set var="type3" value="selected='selected'"></c:set>
					</c:if>					
					<select name="credit_type" style=" height: 18px;">
						<option value="-2"${type12}>
							全部
						</option>
						<option value="0"${type0}>
							调查中
						</option>
						<option value="3"${type3}>
							提交主管
						</option>
						<option value="1"${type1}>
							主管通过
						</option>
						<option value="2"${type2}>
							主管驳回
						</option>
						<option value="-1"${type11}>
							项目撤销
						</option>
					</select>
					</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" id="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td>
						<input type="button" name="but" onclick="changeMore();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="多条转移">
						<c:if test="${manageRole }">
							<input type="button" name="but" onclick="changeByLot();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="批量转移">
						</c:if>
					</td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						&nbsp;
					</th>
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>案件号 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同编号 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>区域 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处主管 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户经理 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>风控纪要 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>生成时间 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;"><input type="checkbox" value="${item.ID },${item.SENSOR_ID },${item.CUST_CODE }"  name ="credit_idxx" id="credit_idxx" ></td>
						<td style="text-align: center;" onClick="expandCorp('${item.ID}')"><c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="主管驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="主管通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if></td>
						<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a> | <a href="javascript:void(0);" onclick="addTypeDivl('${item.ID }','${item.SENSOR_ID }','${item.CUST_CODE }')" >转移</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="9" align="center">
						<div id="pactCorp${item.ID}" align="center"
						style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
						<img src="${ctx }/images/loading.gif">
						</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>
			<table class="STYLE2" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u608.gif">
							调查中
							<img src="${ctx }/images/u611.gif">
							提交主管
							<img src="${ctx }/images/u614.gif">
							主管驳回
							<img src="${ctx }/images/u622.gif">
							主管通过
							<img src="${ctx }/images/u617.gif">
							项目撤销&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
			</div>
				</div>
			</div>		
		</form>
			<div id="change" style="display: none;" title="客户经理转移">
				<form action="${ctx}/servlet/defaultDispatcher?__action=ChangeSenson.changeSensor" method="post" id="addForm" name="addForm">
					<input type="hidden" name ="search_content" id="search_content" />
					<input type="hidden" name ="credit_id10" id="credit_id10"  />
					<input type="hidden" name ="credit_idmore" id="credit_idmore"  />
					<input type="hidden" name ="sensorIdForisOver" id="sensorIdForisOver"  />
					<input type="hidden" name ="cust_code" id="cust_code"  />
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				         <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
							<td width="15%">客户经理</td>
							<td><select name="sensor" id="sensor">
									<option value="-2">--请选择--</option>
								</select></td>
						</tr>
						<tr>
							<td colspan="2">
							<center>
								<input type="submit" value="转移" class="ui-state-default ui-corner-all" /><input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(change);"/>
							</center>
							</td>
						</tr>
					</table>
					</div>
					</div>
					</div>
				</form>
			</div>
			<div id="changeByLot" style="display: none;" title="客户经理批量转移">
				<form action="${ctx}/servlet/defaultDispatcher?__action=ChangeSenson.changeSensorByLot" method="post" id="addForm" name="addForm">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
				         <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table2">
						<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
							<td width="15%">原客户经理</td>
							<td><select name="sensor1" id="sensor1">
									<option value="-2">--请选择--</option>
								</select></td>
						</tr>
						<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
							<td width="15%">客户经理</td>
							<td><select name="sensor2" id="sensor2">
									<option value="-2">--请选择--</option>
								</select></td>
						</tr>
						<tr>
							<td colspan="2">
							<center>
								<input type="submit" value="转移" class="ui-state-default ui-corner-all" /><input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(changeByLot);"/>
							</center>
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