<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
    <title>保单管理</title>
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

	//查看保单
	function showInsuList(id){
		
		window.location.href="../servlet/defaultDispatcher?__action=insure.showInsuList&INCU_ID="+id;
	}
	//修改保单
	function updateInsuList(id){
	
		window.location.href="../servlet/defaultDispatcher?__action=insure.updateInsuListPre&INCU_ID="+id;
	}
	
	
	function insuFun(){
					  var chk_value =[];
					  $('input[name="incu_id"]:checked').each(function(){
					   chk_value.push($(this).val());
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择请款保单");
					  	return false;}	  
	  			$("#__action").val("insuranceList.getInsurPayList");
	  			$("#form1").submit();
	  			$("#__action").val("insuranceList.getInsurePayMoney");
	  		}
  </script>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="insuranceList.getInsurePayMoney" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险费请款管理</span>
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
						      <td>拨款状态：</td>
					          <td><select name="payState" style="width:150px;"><option value="0" <c:if test="${payState eq '0' }">selected="selected"</c:if> >未拨款</option><option value="1" <c:if test="${payState eq '1' }">selected="selected"</c:if>>拨款中</option><option value="3" <c:if test="${payState eq '3' }">selected="selected"</c:if>>驳回</option><option value="2" <c:if test="${payState eq '2' }">selected="selected"</c:if>>拨款成功</option></select></td>
					          <td>保险公司：</td>
					          <td><select name="complayId"><c:forEach items="${complayList }" var="item" ><option value="${item.INCP_ID }" <c:if test="${item.INCP_ID==complayId }">selected="selected"</c:if> >${item.INCP_NAME }</option></c:forEach></select></td>
					          <td>公司别：</td>
					          <td>
					          	<select name="companyCode">
					          		<option value="1" <c:if test="${companyCode eq '1' }">selected="selected"</c:if>>裕融</option>
					          		<option value="2" <c:if test="${companyCode eq '2' }">selected="selected"</c:if>>裕国</option>
					          	</select>
					          </td>
				          </tr>
				          <tr>
					          <td>大保单号：</td>
					          <td><input type="text" name="group_code" value="${group_code }" style="width:150px;"/></td>
					          <td>查询内容：</td>
					          <td colspan="3"><input type="text" name="content" value="${content }" style="width:295px; height:20px;">
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
					<td><input type="button" name="pdfbutton" onclick="insuFun();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="申请付款"></td>
						<td><%@ include file="/common/pageControlTopFor100.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							<input type="checkbox" id="All" onclick="selectAll()">&nbsp;
						</th>						
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							大保单号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保单号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险开始日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							保险终止日期
						</th>
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							总保费</th>
			           <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							缴费凭证号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							公司别
						</th>
					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'><c:if test="${item.INCUPAYSTATE==0 }"><input type="checkbox" value="${item.INCU_ID }"  name ="incu_id" ><input type="hidden" name="insu_price${item.INCU_ID }" value="${item.INSU_PRICE }"><input type="hidden" name="insu_name${item.INCU_ID }" value="${item.INCP_ID }"><input type="hidden" name="insu_bankname${item.INCU_ID }" value="${item.INCP_NAME }"></c:if><c:if test="${item.INCUPAYSTATE==1 }"><input type="checkbox" value="${item.INCU_ID }"  name ="incu_id" disabled="disabled" ></c:if></td>
						<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.GROUP_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCU_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_START_DATE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'> ${item.INSU_END_DATE}&nbsp;</td>
					 	<td style='text-align: right;height: 25px;'><fmt:formatNumber type="currency" value="${item.INSU_PRICE eq null ? 0 :item.INSU_PRICE }" />&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.CHARGE_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>
							<c:if test="${companyCode eq '1' }">裕融</c:if>
					        <c:if test="${companyCode eq '2' }">裕国</c:if>
						&nbsp;</td>
					</tr>
					</c:forEach>         
				</tbody>
			</table>
				<%@ include file="/common/pageControlFor100.jsp"%>
			
			</div>
			</div>
			</div>
		</form>		
	</body>
</html>		