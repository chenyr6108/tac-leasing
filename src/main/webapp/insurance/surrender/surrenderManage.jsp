<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
    <title>退保管理</title>
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

	//查看退保
	function surrenderShow(id){
		window.location.href="../servlet/defaultDispatcher?__action=surrender.surrenderShow&ID="+id;
	}
    //修改退保
	function surrenderUpdate(id){
		window.location.href="../servlet/defaultDispatcher?__action=surrender.surrenderUpdatePre&ID="+id;
	}
	//删除退保
	function surrenderDel(id){
		if(confirm('你确定要删除该退保信息吗？')){
		window.location.href="../servlet/defaultDispatcher?__action=surrender.surrenderDel&ID="+id;
		}
	}
	//添加
	function surrenderInsuList(id){
	if(confirm('你确定要退保吗？')){
		window.location.href="../servlet/defaultDispatcher?__action=surrender.surrenderInsuListPre&INCU_ID="+id;
		}
	}
    //查看保单
    function showInsuList(id){
			window.location.href="../servlet/defaultDispatcher?__action=insure.showInsuList&INCU_ID="+id;
    }
  </script>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="surrender.queryAll" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;退保管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;"> 
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;保险公司:<select name="INCP" value="${INCP }" style="width:180px; height:18px;"><option value="">请选择</option> <c:forEach items="${company}" var="item" > <option value="${item.INCP_ID }" <c:if test="${item.INCP_ID==INCP }">selected</c:if>>${item.INCP_NAME }</option></c:forEach></select>&nbsp;
				          <br/>&nbsp;&nbsp;查询内容:<input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="">
					<tr class="ui-jqgrid-labels">
				
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							状态
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							合同号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保险公司
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
							合同终止日期
						</th>
     				    <th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							总保费</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							客户名称
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							退保时间
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							退保金额
						</th>
						<%--2011/12/8 Yang Yun --> Add "维护人" field start--%>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head" width="25%">
							维护人
						</th>
						<%--Add "维护人" field end --%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head" >
							操作
						</th>

					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr" id="trForColor">
						<td style='text-align: center;height: 25px;'><c:if test="${item.STATUS==0}">未退保</c:if><c:if test="${item.STATUS==-1}">已退保</c:if></td>
						<td style='text-align: center;height: 25px;'>${item.RECT_CODE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'><a href="javascript:void(0)" onclick="showInsuList('${item.INCU_ID }');">${item.INCU_CODE }</a>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INSU_START_DATE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.INSU_END_DATE} &nbsp;</td>
						<td style='text-align: center;height: 25px;'>${fn:substring(item.PAY_DATE,0,10)} &nbsp;&nbsp;</td>
					 	<td style='text-align: center;height: 25px;'><fmt:formatNumber value="${item.INSU_PRICE }" type="currency"/>&nbsp;</td> 
						<td style='text-align: center;height: 25px;'>${item.CUST_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.SURRENDER_DATE }&nbsp;</td>
						<td style='text-align: center;height: 25px;'><fmt:formatNumber value="${item.SURRENDER_PRICE }" type="currency"/>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.MODIFY_ID }&nbsp;</td>
					    <td style='text-align: center;height: 25px;'><a href="javascript:void(0)" onclick="surrenderShow('${item.INCU_ID }');">查看退保</a>||<a href="javascript:void(0)" onclick="surrenderUpdate('${item.INCU_ID }');">修改退保</a><%--||<a href="javascript:void(0)" onclick="surrenderDel('${item.INCU_ID }');">删除退保</a> --%></td>
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