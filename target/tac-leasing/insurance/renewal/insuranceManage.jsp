<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
    <title>续保提醒</title>
  </head>
  <script type="text/javascript">
  $(function (){
		$("#INSU_START_DATE").datepicker($.datepicker.regional['zh-CN']);
		$("#INSU_END_DATE").datepicker($.datepicker.regional['zh-CN']);
	});
	function equipcover(equipId,prcdId,custName,producttype){
	 	window.location.href="../servlet/defaultDispatcher?__action=insurance.getInsuranceCreatePre&eqmt_id="+equipId+"&credit_id="+prcdId+"&CUST_NAME="+custName+"&PRODUCT_TYPE="+producttype;
	}
	//全选
	function selectAll(){
		var tof=$('#All').get(0).checked ;
		$(':checkbox').attr('checked',tof );
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
		$("#__action").val("insure.queryAll");	
	}
	//查看保单
	function showInsuList(id){
		
		window.location.href="../servlet/defaultDispatcher?__action=insure.showInsuList&INCU_ID="+id;
	}
	//录入保单
	/* function enterInsuList(){
	   var selNum=$("input[eqmt]:checked").length;
	    if(selNum==0){
	       alert("必须选择设备");
	       return;
		}
		  $("#__action").val("insure.enterInsuList");
			$("#form1").submit();
	} */
	function enterInsuList(incu_id){
		$("#__action").val("insure.renewalInsuList");
		$("#incu_id").val(incu_id);
		$("#form1").submit();
	}
	
	function getInsuListByExcel(e){
		$(e).attr("disabled", "disabled");
		var insu_id = "";
		$("input[name='cbox']:checked").each(function(){
			insu_id += ($(this).val() + ",");
		});
		if(insu_id == ""){
			alert("必须选择设备");
			return;
		}
		window.parent.callBirt("birtReport/insurancesList.rptdesign", "xls", {"insu_id" : insu_id.substring(0, insu_id.length - 1)});
		$(e).attr("disabled", false);
	}
  </script>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="renewal.queryAll" />
			<input type="hidden" id="incu_id" name="incu_id" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;续保提醒</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;"> 
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
						<td width="439" class="ss_t">&nbsp;保单到期日期:<input type="text" name="INSU_START_DATE" id="INSU_START_DATE" value="${INSU_START_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>
				  		&nbsp;—&nbsp;<input type="text" name="INSU_END_DATE" id="INSU_END_DATE" value="${INSU_END_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>
						&nbsp;&nbsp;保险公司:<select name="INCP_ID" id="INCP_ID" style="height: 18px;width: 140px;">
						<option value="0">全部</option>
			          	<c:forEach items="${insuCompany}" var="item">
			          		<option value="${item.INCP_ID}" <c:if test="${item.INCP_ID eq INCP_ID}">selected="selected"</c:if>>${item.INCP_NAME}</option>
			          	</c:forEach>
						</select>
				          <br/>&nbsp;查询内容&nbsp;&nbsp;<input type="text" name="content" value="${content }" style="width:395px; height:18px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="outputEX();" value="导出设备"/></td>
						<%-- <td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="enterInsuList()"  value="录入保单"/></td> --%>
						<td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getInsuListByExcel(this);"  value="导出投保单"/></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							<input type="checkbox" id="All" onclick="selectAll()">
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							状态
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							客户
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							合同号
						</th>
						<%--  --%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单号
						</th>
						<%--  --%>
						<%-- <th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							设备名称
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							设备型号
						</th> --%>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							合同到期时间
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保单到期时间
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
						<%--
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							车架号/车辆识别号</th>
			           <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							机动车登记号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							整机编号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							车辆牌照号
						</th>
						--%><%-- <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" >
							设备存放场所
						</th> --%>

					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<%-- <td style='text-align: center;height: 25px;'><input type="checkbox" name="cbox" value="${item.RECD_ID }" eqmt="1"/></td> --%>
						<td style='text-align: center;height: 25px;'><input type="checkbox" name="cbox" value="${item.INCU_ID }" eqmt="1"/></td>
                       	<td style='text-align: center;height: 25px;'>${status.count}</td>
						<%-- <td style='text-align: center;height: 25px;'><c:choose><c:when test="${empty item.OUTPUT_STATUS}">&nbsp;</c:when><c:otherwise>${item.OUTPUT_STATUS }</c:otherwise></c:choose>&nbsp;</td> --%>
						<!--  -->
						<td style='text-align: center;height: 25px;'>${item.OUTPUT_STATUS}&nbsp;</td>
						<!--  -->
						<td style='text-align: center;height: 25px;'><a href="javaScript:void(0)" onclick="window.parent.openTab({tabName:'客户信息浏览',location:'${ctx }/servlet/defaultDispatcher?__action=customer.readCust&cust_id=${item.CUST_ID }&cust_type=${item.CUST_TYPE }&showFlag=0'});">${item.CUST_NAME }</a>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LEASE_CODE }&nbsp;</td>	
						<!--  -->
						<td style='text-align: center;height: 25px;'>${item.INCU_CODE }&nbsp;</td>	
						<!--  -->
						<%-- <td style='text-align: center;height: 25px;'>${item.THING_NAME }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.MODEL_SPEC} &nbsp;</td> --%>
						<td style='text-align: center;height: 25px;'>${fn:substring(item.PAY_DATE,0,10)} &nbsp;</td>
						<td style='text-align: center;height: 25px;'>${fn:substring(item.INSU_END_DATE,0,10)} &nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME} &nbsp;</td>
						<!--  -->
						<td style='text-align: center;height: 25px;'><a href="javascript:void(0)" onclick="showInsuList('${item.INCU_ID }');">查看</a> | <a href="javascript:void(0)" onclick="enterInsuList('${item.INCU_ID }');">续保</a></td>
						<!--  -->
					 	<%--<td style='text-align: center;height: 25px;'>${item.FRAME_CODE }&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.REGISTRATION_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.THING_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LICENSE_NO }&nbsp;</td>
					   --%><%-- <td style='text-align: center;height: 25px;'>${item.EQUPMENT_ADDRESS }&nbsp;</td> --%>
					</tr>
					</c:forEach>         

						<%--
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							状态
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							客户
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							设备名称
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							发动机号码
						</th>
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							车架号/车辆识别号</th>
			           <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							机动车登记号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							整机编号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							车辆牌照号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" >
							车辆所在地
						</th>

					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'><input type="checkbox" name="cbox" value="${item.RECD_ID }" eqmt="1"/></td>
                       	<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'>${item.OUTPUT_STATUS }</td>
						<td style='text-align: center;height: 25px;'><a href="javaScript:void(0)" onclick="window.parent.openTab({tabName:'客户信息浏览',location:'${ctx }/servlet/defaultDispatcher?__action=customer.readCust&cust_id=${item.CUST_ID }&cust_type=${item.CUST_TYPE }&showFlag=0'});">${item.CUST_NAME }</a>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.THING_NAME }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.ENGINE_CODE} &nbsp;</td>
					 	<td style='text-align: center;height: 25px;'>${item.FRAME_CODE }&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.REGISTRATION_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.THING_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LICENSE_NO }&nbsp;</td>
					   <td style='text-align: center;height: 25px;'>${item.EQUPMENT_ADDRESS }&nbsp;</td>
					</tr>
					</c:forEach>         
				--%></tbody>
			</table>
				<%@ include file="/common/pageControl.jsp"%>
			</div>
			</div>
			</div>
		</form>		
	</body>
</html>		