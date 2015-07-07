<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="page" uri="/pagingtarglib" %>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
    <title>保险管理</title>
  </head>
  <script type="text/javascript">
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
	       alert("必须选择设备");
	       return;
		}
		   $("#__action").val("exportInsuExcel.exportEqmtList");
			$("#form1").submit();
			$("#__action").val("insure.queryAll");	
	}
	//录入保单
	function enterInsuList(){
	   var selNum=$("input[eqmt]:checked").length;
	    if(selNum==0){
	       alert("必须选择设备");
	       return;
		}
		  $("#__action").val("insure.enterInsuList");
			$("#form1").submit();
	}
	
	/* function getInsuListByExcel(e){
		$(e).attr("disabled", "disabled");
		var recd_id = "";
		$("input[name='cbox']:checked").each(function(){
			recd_id += ($(this).val() + ",");
		});
		if(recd_id == ""){
			alert("必须选择设备");
			$(e).attr("disabled", false);
			return;
		}
		window.parent.callBirt("birtReport/insurancesList.rptdesign", "xls", {"recd_id" : recd_id.substring(0, recd_id.length - 1)});
		$(e).attr("disabled", false);
	} */
	
	function getInsuListByExcel(e){
		$(e).attr("disabled", "disabled");
		var recd_id = "";
		$("input[name='cbox']:checked").each(function(){
			recd_id += ($(this).val() + ",");
		});
		if(recd_id == ""){
			alert("必须选择设备");
			$(e).attr("disabled", false);
			return;
		}
		window.parent.callBirt("birtReport/insuReport/insuranceExcelForEmail.rptdesign", "xls", {"rect_id" : "'1313', '1314'", "decp_name" : encodeURI("人保")});
		$(e).attr("disabled", false);
	}
  </script>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="insure.queryAll" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;"> 
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <%--2011/12/12 Yang Yun Add "拨款状态" search field. Start--%>
				        <%--
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        --%>
				        <td width="500" class="ss_t">
				        	<table style="margin-left: 10px; height: 40px;">
				        	<tr height="20">
				        		<td>拨款状态:</td>
				        		<td>
				        			<select name="pay_state" style="width:80px;">
				        				<option value="">全部</option>
				        				<option value="Y" <c:if test="${'Y' eq pay_state }">selected</c:if>>已拨款</option>
				        				<option value="N" <c:if test="${'N' eq pay_state }">selected</c:if>>未拨款</option>
				        			</select>
				        		</td>
				        		<td>保险公司:</td>
				        		<td><select name="insu_company" style="width:260px; height:20px;">
				        			<option value="">--请选择--</option>
						          	<c:forEach items="${insuCompany}" var="item">
						          		<option value="${item.INCP_ID}" <c:if test="${item.INCP_ID eq insu_company }">selected</c:if>>${item.INCP_NAME}</option>
						          	</c:forEach>
				        		</select></td>
				        	</tr>
				        	<tr height="20">
				        		<td>是否导出:</td>
				        		<td>
				        			<select name="output_status" style="width:80px;">
				        				<option value="">全部</option>
				        				<option value="已导出" <c:if test="${'已导出' eq output_status }">selected</c:if>>已导出</option>
				        				<option value="未导出" <c:if test="${'未导出' eq output_status }">selected</c:if>>未导出</option>
				        			</select>
				        		</td>
				        		<td>查询内容:</td>
				        		<td><input type="text" name="content" value="${content }" style="width:260px; height:20px;"></td>
				        	</tr>
				        </table></td>
				        <%--2011/12/12 Yang Yun Add "拨款状态" search field. End--%>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<!-- <td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="outputEX();" value="导出设备"/></td> -->
						<td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="enterInsuList()"  value="录入保单"/></td>
						<td><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getInsuListByExcel(this);"  value="导出投保单"/></td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
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
							<page:pagingSort pagingInfo="${dw }" orderBy="OUTPUT_STATUS">状态</page:pagingSort>
						</th>
						<%--2011/12/12 Yang Yun Add "拨款状态" display field. Start --%>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="PAY_STATE">拨款状态</page:pagingSort>
						</th>
						<%--2011/12/12 Yang Yun Add "拨款状态" display field. End --%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户</page:pagingSort>
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同号</page:pagingSort>
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="INCP_NAME">保险公司</page:pagingSort>
						</th>
						<%--2011/12/23 Yang Yun 新增拨款日期字段。Start --%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="PAY_DATE">拨款日期</page:pagingSort>
						</th>
						<%--2011/12/23 Yang Yun 新增拨款日期字段。End --%>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="THING_NAME">设备名称</page:pagingSort>
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="MODEL_SPEC">设备型号</page:pagingSort>
						</th><%--
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
						--%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							<page:pagingSort pagingInfo="${dw }" orderBy="THING_NUMBER">机号</page:pagingSort>
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" >
							设备存放场所
						</th>

					</tr>
					<tbody>
					<c:forEach items="${dw.resultList}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">

						<td style='text-align: center;height: 25px;'><input type="checkbox" name="cbox" value="${item.RECD_ID }" eqmt="1"/></td>
                       	<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'><c:choose><c:when test="${empty item.OUTPUT_STATUS}">&nbsp;</c:when><c:otherwise>${item.OUTPUT_STATUS }</c:otherwise></c:choose></td>
						<%--2011/12/12 Yang Yun Add "拨款状态" display field. Start --%>
						<td style='text-align: center;height: 25px;'><c:if test="${'Y' eq item.PAY_STATE }">已拨款</c:if><c:if test="${'N' eq item.PAY_STATE }">未拨款</c:if>&nbsp;</td>
						<%--2011/12/12 Yang Yun Add "拨款状态" display field. End --%>
						<td style='text-align: center;height: 25px;'><a href="javaScript:void(0)" onclick="window.parent.openTab({tabName:'客户信息浏览',location:'${ctx }/servlet/defaultDispatcher?__action=customer.readCust&cust_id=${item.CUST_ID }&cust_type=${item.CUST_TYPE }&showFlag=0'});">${item.CUST_NAME }</a>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LEASE_CODE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>	
						<%--2011/12/23 Yang Yun 新增拨款日期字段。Start --%>
						<td style='text-align: center;height: 25px;'>${item.PAY_DATE }&nbsp;</td>	
						<%--2011/12/23 Yang Yun 新增拨款日期字段。End --%>
						<td style='text-align: center;height: 25px;'>${item.THING_NAME }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.MODEL_SPEC} &nbsp;</td>
					 	<%--<td style='text-align: center;height: 25px;'>${item.FRAME_CODE }&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.REGISTRATION_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.THING_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LICENSE_NO }&nbsp;</td>
					   --%>
					   <td style='text-align: center;height: 25px;'>${item.THING_NUMBER} &nbsp;</td>
					   <td style='text-align: center;height: 25px;'>${item.EQUPMENT_ADDRESS }&nbsp;</td>
					</tr>
					</c:forEach>         
				</tbody>
			</table>
				<page:pagingToolbar pagingInfo="${dw }"/>
			
			</div>
			</div>
			</div>
		</form>		
	</body>
</html>		