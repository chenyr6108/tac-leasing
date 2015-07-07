<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>付款管理</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
			//弹出日志的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			function invalidRentContract(id) { 
				if(confirm('确认作废？')){
					location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.invalidRentContract&RECT_ID='+id;
				}else{
					return false;
				}
			}
		function selectAll(e) {
		  var checkBox = document.getElementsByName("id|credit");
		  for (var i=0; i<checkBox.length; i++)
			  checkBox[i].checked = e.checked;
		}
		
	  
	 	function showEditPayMoneyReviewRecord(code,id,lease_code,FSS_ID)
	 	{
	 		//判断有没有过期
	 		var url = "../servlet/defaultDispatcher";
	 		var data = {"__action" : "businessSupport.getIsExpiredByCreditId", "credit_id" : id};
	 		$.getJSON(url, data, function (result){
	 			if(result){
	 				location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.payMoneyManagerByOne&FSS_ID='+FSS_ID+'&payMoneyId='+code+'&CREDIT_ID='+id+"&LEASE_CODE="+lease_code;
	 			} else {
	 				alert("案件已过期,操作失败。");
	 			}
	 		});
	 	}
	 	function showEditPayMoney(code,id,lease_code)
	 	{
	 		location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.payMoneyManagerByOneShow&payMoneyId='+code+'&CREDIT_ID='+id+"&LEASE_CODE="+lease_code;
	 	}
	  
	 	function batchPass() {
	 		var len=document.getElementsByName("id|credit");
	 		var longth=0;
	 		for(var i=0;i<len.length;i++) {
	 			if(len[i].checked==true) {
	 				longth=longth+1;
	 			}
	 		}
	 		if(longth==0) {
	 			alert("至少选择1项!");
	 			return false;
	 		}
	 		if(confirm("确认要批量通过选中的合同么?")) {
		 		$("#__action").val("payMoney.batchPass");
		 		$("#form1").submit();
	 		}
	 	}
	 	
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="payMoney.queryPayMoney" />
			<input type="hidden" name="s_employeeId" id="s_employeeId" value="${s_employeeId }" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="99%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>实际支付日起始日期：</td>
				          <td>
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          实际支付日结束日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					    </td>
					    <td>拨款类别：</td>
				          <td><select id="BACKSTATE" name="BACKSTATE" style="border: #03515d solid 1px;">
								<option value="0" <c:if test="${BACKSTATE eq 0 }">selected='selected'</c:if>>设备款</option>
								<option value="1" <c:if test="${BACKSTATE eq 1 }">selected='selected'</c:if>>保证金拨款</option>
								<option value="2" <c:if test="${BACKSTATE eq 2 }">selected='selected'</c:if>>奖金拨款</option>
								<option value="3" <c:if test="${BACKSTATE eq 3 }">selected='selected'</c:if>>保险费</option>
								<option value="4" <c:if test="${BACKSTATE eq 4 }">selected='selected'</c:if>>法务费用</option>
								<option value="5" <c:if test="${BACKSTATE eq 5 }">selected='selected'</c:if>>退款</option>
								<option value="9" <c:if test="${BACKSTATE eq 9 }">selected='selected'</c:if>>手续费</option>
								<option value="10" <c:if test="${BACKSTATE eq 10 }">selected='selected'</c:if>>佣金</option>
							</select>
					      </td>
					    <td>拨款状态：</td>
				          <td><select id="PLAYDETIL_STATE" name="PLAYDETIL_STATE" style="border: #03515d solid 1px;">
								<option value="">全部</option>
								<option value="1" <c:if test="${PLAYDETIL_STATE eq 1 }">selected='selected'</c:if>>未审批</option>
								<option value="3" <c:if test="${PLAYDETIL_STATE eq 3 }">selected='selected'</c:if>>通过</option>
							</select>
					      </td>
					      <td>是否首拨款：</td>
					      <td>
					      	<select id="PAY_ORDER" name="PAY_ORDER">
					      		<option value="0" <c:if test="${PAY_ORDER eq 0 }">selected='selected'</c:if>>全部</option>
					      		<option value="1" <c:if test="${PAY_ORDER eq 1 }">selected='selected'</c:if>>首拨</option>
					      		<option value="2" <c:if test="${PAY_ORDER eq 2 }">selected='selected'</c:if>>非首拨</option>
					      	</select>
					      </td>
					      	<td>
							公司別：
							</td>
							<td>
							<select name="companyCode" style=" height: 18px;">
									<option value="" >
										全部
									</option>
									<option value="1" <c:if test="${companyCode eq 1}">selected='selected'</c:if>>
										裕融
									</option>
									<option value="2" <c:if test="${companyCode eq 2}">selected='selected'</c:if>>
										裕国
									</option>
									</select>
							</td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="8"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          <td>&nbsp;</td>
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
						<td><input type="button" value="批量通过" class="ui-state-default ui-corner-all" onclick="batchPass()"></td>
						<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<input type="checkbox" NAME="all" id="all" onClick="selectAll(this)">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE">案件号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME">客户名称</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="AREA">区域</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="CLERK_NAME">办事处主管</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="SENSOR_NAME">客户经理</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="BRAND">收款人</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_MONEY">付款金额</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="BACKSTATE">拨款类别</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="LESSOR_TIME">签订时间</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="EXPECTEDDATE">预计支付日</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort pagingInfo="${dw }" orderBy="PAY_DATE">实际支付日</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">	
									<tr class="ui-widget-content jqgrow ui-row-ltr">
									    <td style="text-align: center;"><c:if test="${item.STATE==1 }"><input type="checkbox" value="${item.ID }=${item.CREDIT_ID}=${item.BACKSTATE }=${item.LEASE_CODE }=${item.CUST_NAME }=common"  name="id|credit"></c:if>&nbsp;</td>
										<td style="text-align: center;"><c:if test="${item.STATE==1 }"><img src="${ctx }/images/u608.gif" title="未审批"></c:if><c:if test="${item.STATE==3 }"><img src="${ctx }/images/u611.gif" title="通过"></c:if><c:if test="${item.STATE==4 }"><img src="${ctx }/images/u622.gif" title="驳回"></c:if></td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.AREA }&nbsp;</td>
										<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;">${item.BRAND }&nbsp;</td>
										<td style="text-align: right"><fmt:formatNumber type="currency" value="${item.PAY_MONEY }" />&nbsp;</td>
										<td style="text-align: right"><c:if test="${item.BACKSTATE==0 }">设备款</c:if><c:if test="${item.BACKSTATE==1 }">保证金拨款</c:if><c:if test="${item.BACKSTATE==2 }">奖金拨款</c:if><c:if test="${item.BACKSTATE==3 }">保险费</c:if><c:if test="${item.BACKSTATE==4 }">法务费用</c:if>&nbsp;</td>
										<td style="text-align: center;">&nbsp;<c:if test="${item.LESSOR_TIME !='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;">&nbsp;<c:if test="${item.EXPECTEDDATE !='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${item.EXPECTEDDATE }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;">&nbsp;<c:if test="${item.PAY_DATE !='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;"><c:if test="${item.STATE==1 and auditPayMoney}"><a href="javaScript:void(0);" onclick="showEditPayMoneyReviewRecord('${item.ID }','${item.CREDIT_ID }','${item.LEASE_CODE }','${item.FSS_ID }');">审批</a>&nbsp;</c:if><c:if test="${item.STATE==3 }"><a href="javaScript:void(0);" onclick="showEditPayMoney('${item.ID }','${item.CREDIT_ID }','${item.LEASE_CODE }');">查看(通过)</a></c:if><c:if test="${item.STATE==4 }"><a href="javaScript:void(0);" onclick="showEditPayMoney('${item.ID }','${item.CREDIT_ID }','${item.LEASE_CODE }');">查看(驳回)</a></c:if></td>
									</tr>
									<tr>
								<td align="center" colspan="9">
									<div id="contractTr${item.CREDIT_ID }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>
							</tr>
								</c:forEach>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber type="currency" value="${TOTAL }"/>&nbsp;
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
									</th>
								</tr>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">
										未审批
										<img src="${ctx }/images/u611.gif">
										通过
										<img src="${ctx }/images/u622.gif">
										驳回&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			
		</form>
			
				<!--  日志弹出层开始   -->
			<!-- 弹出用函数 接收参数 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志" style="display: none" id="showBusinessLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="${ctx }/servlet/defaultDispatcher?__action=business.showBusinessLog">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号</td>
								<td style="text-align:center"  width="6%">编号</td>
								<td style="text-align:center"  width="6%">日志对象</td>
								<td style="text-align:center"  width="4%">日志操作</td>
								<td style="text-align:center"  width="6%">创建人</td>
								<td style="text-align:center"  width="6%">创建时间</td>
								<td style="text-align:center"  width="15%">备注</td>
							</tr>
					</table>
					<center>
					共<span id="barNum"></span>条,共<span id="total"></span>页
					当前第<span id="pageNum" ></span>页
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="firstPage()" value="首页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="prevPage()" value="上一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="nextPage()" value="下一页"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="lastPage()" value="尾页"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					到第<input size="3" type="text" id="assign"/>页<input class="ui-state-default ui-corner-all" type="button" value="跳转" onclick="assignPage()"/>
					</center>
				</div>
				</div>
			</div>	
		</form>
		</div>

			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>	
		<!--  日志弹出层结束  -->
	</body>
</html>