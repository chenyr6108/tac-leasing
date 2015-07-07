<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>   
  	<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
  	<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
  	<script type="text/javascript" src="${ctx }/insurance/js/satisfaction.js"></script>	
    <title>理赔管理</title>
    <script type="text/javascript">
    
    	$(function (){
    		$("#DANG_DATE_WIN").datepicker($.datepicker.regional['zh-CN']);
			$("#INSF_DATE_WIN").datepicker($.datepicker.regional['zh-CN']);
			$("#CHARGE_DATE_WIN").datepicker($.datepicker.regional['zh-CN']);
    	});
    
    	function showSatisfactionWin(insf_id, incu_code, isUpdate){
    		var url = "../servlet/defaultDispatcher";
    		var param = {"__action" : "satisfaction.getSatisfaction", "INSF_ID" : insf_id};
    		$.post(url, param, function (data){
    			$("#eqmt_name").val(data.satisfaction.EQMT_ID);
    			$("#DANG_DATE_WIN").val(data.satisfaction.DANG_DATE);
    			$("#INSF_DATE_WIN").val(data.satisfaction.INSF_DATE);
    			$("#INSF_MONEY_WIN").val(data.satisfaction.INSF_MONEY);
    			$("#CHARGE_DATE_WIN").val(data.satisfaction.CHARGE_DATE);
    			$("#CHARGE_MONEY_WIN").val(data.satisfaction.CHARGE_MONEY);
    			$("#REMARK_WIN").val(data.satisfaction.REMARK);
    			$("#INSF_ID_WIN").val(data.satisfaction.INSF_ID);
    			$("#insu_code").val(incu_code);
    			if(isUpdate){
    				$("#infoTable :input").each(function (){
    					$(this).attr("disabled", false);
    				});
    				$("#satisfactionSubBut").show();
    				$("#subBut").show();
    			} else {
    				$("#infoTable :input[type != 'button']").each(function (){
    					$(this).attr("disabled", true);
    				});
    				$("#satisfactionSubBut").hide();
    				$("#subBut").hide();
    			}
    			$("#satisfactionWin").dialog({modal:true, autoOpen:false, width:650});
        		$("#satisfactionWin").dialog("open");
    		}, "json");
    	}
    	function subNotice() {
			if(positive($("#INSF_MONEY_WIN")[0],'金额')){
				return false;
			}
			if(positive($("#CHARGE_MONEY_WIN")[0],'金额')){
				return false;
			}
			$("#action_win").val("satisfaction.modifySatisfaction");
			$("#satisfactionWinForm").submit();
		}
    	
    	function doSubmitInfo(){
			if($("#INSF_ID_WIN").val() == ''){
    			alert("数据过期，请刷新。");
    			return false;
    		}
    		if($("#eqmt_name").val() == ''){
    			alert("请填写设备名称。");
    			return false;
    		}
    		if($("#DANG_DATE_WIN").val() == ''){
    			alert("请填写出险日期。");
    			return false;
    		}
    		if($("#INSF_DATE_WIN").val() == ''){
    			alert("请填写理赔日期。");
    			return false;
    		}
    		if($("#INSF_MONEY_WIN").val() == ''){
    			alert("请填写理赔金额。");
    			return false;
    		}
    		if($("#CHARGE_DATE_WIN").val() == ''){
    			alert("请填写定损日期。");
    			return false;
    		}
    		if($("#CHARGE_MONEY_WIN").val() == ''){
    			alert("请填写定损金额。");
    			return false;
    		}
    		if(positive($("#INSF_MONEY_WIN")[0],'金额')){
				return false;
			}
			if(positive($("#CHARGE_MONEY_WIN")[0],'金额')){
				return false;
			}
			$('#satisfactionWin').dialog('close');
			$("#action_win").val("satisfaction.submitSatisfaction");
			$("#satisfactionWinForm").submit();
    	}
    </script>
  </head>
	<body>
		<form action="../servlet/defaultDispatcher"  name="form1"  id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="satisfaction.queryAll" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;理赔管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;"> 
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				  		&nbsp;理赔日期:<input type="text" name="INSF_DATE" id="INSF_DATE" value="${INSF_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>&nbsp;出险日期:<input type="text" name="DANG_DATE" id="DANG_DATE" value="${DANG_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>
				          	<br/>&nbsp;&nbsp;&nbsp;&nbsp;查询内容:<input type="text" name="content" value="${content }" style="width:395px; height:18px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><%-- 2011/12/12 Yang Yun Merger to "保单管理"
						<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="javascript:window.location.href='../servlet/defaultDispatcher?__action=satisfaction.insuManage'" value="添加理赔记录"/>
						--%></td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>			
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th style="text-align: center;height:26px; width: 4%" class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							客户
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							合同号
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head" width="25%">
							设备
						</th>
						<%--2011/12/8 Yang Yun Delete 保险人
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head" width="25%">
							保险人
						</th>
						 --%>
						 <th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head" width="25%">
							保险公司
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							保单号 
						</th>
						<!-- <th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							出险日期 
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							定损日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							定损金额
						</th>
						<th style="text-align: center;height:26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
							理赔日期
						</th>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							理赔金额
						</th> -->
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							创建时间
						</th>
						<%--Add "维护人" field start--%>
						<th style="text-align: center;height:26px; width: 8%"  class="ui-state-default ui-th-ltr zc_grid_head">
							维护人
						</th>
						<%--Add "维护人" field end --%>
						<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
					<c:forEach items="${dw.resultList}" var="item" varStatus="status">
					<tr  class="ui-widget-content jqgrow ui-row-ltr">
						<td style='text-align: center;height: 25px;'>${status.count }&nbsp;</td>
						<td style='text-align: center;height: 25px;'><a href="javaScript:void(0)" onclick="window.parent.openTab({tabName:'客户信息浏览',location:'${ctx }/servlet/defaultDispatcher?__action=customer.readCust&cust_id=${item.CUST_ID }&cust_type=${item.CUST_TYPE }&showFlag=0'});">${item.CUST_NAME }</a>&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.LEASE_CODE }&nbsp;</td>	
						<td style='text-align: center;height: 25px;'>${item.EQMT_ID }&nbsp;</td>
						<%--2011/12/8 Yang Yun Delete 保险人
						<td style='text-align: center;height: 25px;'>${item.INSU_NAME }&nbsp;</td>
						--%>
						<td style='text-align: center;height: 25px;'>${item.INCP_NAME }&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${item.INCU_CODE} &nbsp;</td>
						<%-- <td style='text-align: center;height: 25px;'>${fn:substring(item.DANG_DATE,0,10)}&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${fn:substring(item.INSF_DATE,0,10)}&nbsp;</td>
						<td style='text-align: center;height: 25px;'><fmt:formatNumber value="${item.INSF_MONEY }" type="currency" />&nbsp;</td>
						<td style='text-align: center;height: 25px;'>${fn:substring(item.CHARGE_DATE,0,10)}&nbsp;</td>
						<td style='text-align: center;height: 25px;'><fmt:formatNumber value="${item.CHARGE_MONEY }" type="currency" />&nbsp;</td> --%>
						<td style='text-align: center;height: 25px;'>${item.CREATE_DATE}&nbsp;</td>
						<%--2011/12/8 Yang Yun Add "维护人" field start--%>
						<td style='text-align: center;height: 25px;'>${item.MODIFY_ID }&nbsp;</td>
						<%--Add "维护人" field end--%>
						<td style='text-align: center;height: 25px;'><a href="javascript:void(0)" onclick="showSatisfactionWin('${item.INSF_ID}', '', false);" >查看</a><c:if test="${item.STATUS eq '0' }"><c:if test="${satisfaction_edit }"><a href="javascript:void(0)" onclick="showSatisfactionWin('${item.INSF_ID}', '${item.INCU_CODE}', true);" >|修改</a><a href="javascript:void(0)" onclick="delSatisfaction('${item.INSF_ID}');" >|作废</a></c:if></c:if><a href="javascript:void(0)" onclick="showSatisTrack('${item.INSF_ID}');" >|跟踪</a></td>
					</tr>
					<tr>
						<td align="center" colspan="10">
							<div id="showSatisTrack${item.INSF_ID }" align="center" style="display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</td>
					</tr>
					</c:forEach>         
				</tbody>
			</table> 
				<page:pagingToolbar pagingInfo="${dw }"/>
			</div>
			</div>
			</div>
		</form>	
		
		<div style="display:none;" id="satisfactionWin" title="理赔信息">
			<form action="../servlet/defaultDispatcher" method="post" id="satisfactionWinForm">
			<input type="hidden" name="__action" id="action_win" value="satisfaction.modifySatisfaction"/>
			<input type="hidden" name="INSF_ID" id="INSF_ID_WIN" />
			<input type="hidden" name="insu_code" id="insu_code"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		    	<div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="infoTable">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: left;height:24px;width:25%;" class="ui-state-default ui-th-ltr zc_grid_head">设备：&nbsp;</th>
								<td style="text-align: left;height:24px;width:25%;"><input type="text" name="eqmt_name" id="eqmt_name"/>&nbsp;</td>
								<th style="text-align: left;height:24px;width:25%;" class="ui-state-default ui-th-ltr zc_grid_head">出险日期：</th>
								<td style="text-align: left;height:24px;width:25%;"><input onfocus="this.value=''"  type="text" name="DANG_DATE" id="DANG_DATE_WIN" readonly="readonly"/>&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: left;height:24px;" class="ui-state-default ui-th-ltr zc_grid_head">定损日期：</th>
								<td style="text-align: left;height:24px;"><input onfocus="this.value=''"  type="text" name="CHARGE_DATE" id="CHARGE_DATE_WIN" readonly="readonly"/>&nbsp;</td>
								<th style="text-align: left;height:24px;" class="ui-state-default ui-th-ltr zc_grid_head">定损金额：</th>
								<td style="text-align: left;height:24px;"><input type="text" name="CHARGE_MONEY" id="CHARGE_MONEY_WIN" />&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: left;height:24px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔日期：</th>
								<td style="text-align: left;height:24px;"><input onfocus="this.value=''"  type="text" name="INSF_DATE" id="INSF_DATE_WIN" readonly="readonly"/>&nbsp;</td>
								<th style="text-align: left;height:24px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔金额：</th>
								<td style="text-align: left;height:24px;"><input type="text" name="INSF_MONEY" id="INSF_MONEY_WIN" />&nbsp;</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: left;height:24px;" class="ui-state-default ui-th-ltr zc_grid_head">备注：</th>
								<td style="text-align: left;height:24px;" colspan="3"><textarea rows="3" cols="60" name="REMARK" id="REMARK_WIN"></textarea></td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td colspan="4" id="button_flag" style="text-align: center;">
									<input type="button" value="保&nbsp;存" id="satisfactionSubBut" onclick="$('#satisfactionWin').dialog('close');subNotice();" class="ui-state-default ui-corner-all">
									<input type="button" value="提&nbsp;交" id="subBut" onclick="doSubmitInfo();" class="ui-state-default ui-corner-all">
									<input type="button" value="关&nbsp;闭" onclick="$('#satisfactionWin').dialog('close');" class="ui-state-default ui-corner-all">
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