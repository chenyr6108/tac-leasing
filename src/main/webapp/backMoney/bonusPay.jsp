<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
  	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
    <title>奖金请款</title>
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
					  $('input[name="TYPE_NUMBER"]:checked').each(function(){
					   chk_value.push($(this).val());
					  });   
					  if(chk_value.length==0){
					  	alert("你还没有选择请款");
					  	return false;}	  
	  			$("#__action").val("backMoney.getBonusPayList");
	  			$("#form1").submit();
	  			$("#__action").val("backMoney.queryRentContractBackMoneyByBonus");
	  		}
  </script>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="backMoney.queryRentContractBackMoneyByBonus" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;奖金请款</span>
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
				          <td colspan="2"><select name="payState"><option value="0" <c:if test="${payState eq '0' }">selected="selected"</c:if> >未拨款</option><option value="1" <c:if test="${payState eq '1' }">selected="selected"</c:if>>拨款中</option><option value="3" <c:if test="${payState eq '3' }">selected="selected"</c:if>>驳回</option><option value="2" <c:if test="${payState eq '2' }">selected="selected"</c:if>>拨款成功</option></select></td>
				          <td>查询时间：</td>
				          <td colspan="4"><input type="text" name="update" id="datebegin" value="${update }" style="width:150px; height:20px;">
				          </td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="7"><input type="text" name="content" value="${content }" style="width:395px; height:20px;">
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
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							&nbsp;
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							合同编号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							姓名
						</th>
						<c:forEach items="${bonus }" var="bonus">
							<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
								${bonus.BONUS_NAME }
							</th>
						</c:forEach>
						
						
					</tr>
					<tbody>
					<c:forEach items="${bonusList }" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'><input type="checkbox" value="${item.TYPE_NUMBER }"  name ="TYPE_NUMBER" > <input type="hidden" name="bonus_name${item.TYPE_NUMBER }" value="${item.BONUS_NAME }"></td>
						<td style='text-align: center;height: 25px;'>${status.count}</td>
						<td style='text-align: center;height: 25px;'>${item.CONTRACT_CODE }</td>
						<td style='text-align: center;height: 25px;'>${item.BONUS_NAME }</td>
						<c:forEach items="${bonus }" var="bonus">
							 <c:set var="number" value="0"></c:set>
							<c:forEach items="${item.typeList }" var="typeList">
								<c:choose>
									<c:when test="${typeList.typeName eq bonus.BONUS_NAME}"><td style='text-align:right;height: 25px;'><fmt:formatNumber type="currency" value="${typeList.typeUpMoney eq null ? 0 :typeList.typeUpMoney }" /></td> <c:set var="number" value="1"></c:set></c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${number==0 }"><td style='text-align: right;height: 25px;'><fmt:formatNumber type="currency" value="0" /></td></c:if>
							
						</c:forEach>
					</tr>
					</c:forEach>         
				</tbody>
			</table>
				<%@ include file="/common/pageControl.jsp"%>
			
			</div>
			</div>
			</div>
		</form>		
	</body>
</html>		