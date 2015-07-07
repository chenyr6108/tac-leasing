<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>合同设备修改浏览</title>
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

	  function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="rentContractEquiMDF.queryCarRentContractForShow" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;补充重车资讯</span>
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
				          <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="datebegin" value="${QSTART_DATE }"></td>
				          <td>
				          结束日期：</td>
				          <td>
				          <input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-2" <c:if test="${QSELECT_STATUS eq -2}">selected='selected'</c:if>>
								全部
							</option>
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								未初审
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								已初审
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								已复核
							</option>
							<option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								复核驳回
							</option>
							</select>
					</td>
					<td>
					合同类型：
					</td>
					<td>
					<select name="RENTSTAUTS" style=" height: 18px;">
							<option value="-3" <c:if test="${RENTSTAUTS eq -3}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${RENTSTAUTS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="-1" <c:if test="${RENTSTAUTS eq -1}">selected='selected'</c:if>>
								作废
							</option>
							</select>
					</td>
					<td>
					结清状态：
					</td>
					<td>
					<select name="RECP_STATUS" style=" height: 18px;">
							<option value="">
								全部
							</option>
							<option value="1" <c:if test="${RECP_STATUS eq 1}">selected='selected'</c:if>>
								正常结清
							</option>
							<option value="3" <c:if test="${RECP_STATUS eq 3}">selected='selected'</c:if>>
								提前结清
							</option>
							</select>
					</td>
				          </tr>
				          <tr>
				          <td>车牌号：</td>
				          <td>
				          	<input type="text" name="CAR_NUMBER" value="${CAR_NUMBER}">
				          </td>
				          <td>查询内容：</td>
				          <td colspan="3"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
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
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" >
										<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'credit_idxx');">
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										合同编号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										区域办事处
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户经理
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										供货商
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										签订时间
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;" ><input type="checkbox" value="${item.PRCD_ID }"  name ="credit_idxx"></td>
										<td style="text-align: center;" style="cursor: pointer;"><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><c:if test="${item.RECP_STATUS == 1}"><img src="${ctx }/images/u604.gif" title="正常结清"></c:if><c:if test="${item.RECP_STATUS == 3}"><img src="${ctx }/images/u614.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS != 3 && item.RECP_STATUS != 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
										<td style="text-align: center;" >${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;" >${item.CUST_NAME }</td>
										<td style="text-align: center;" >${item.AREA }</td>
										<td style="text-align: center;" >${item.DECP_NAME_CN }&nbsp;</td>
										<td style="text-align: center;" >${item.SENSOR_NAME }&nbsp;</td>
										<td style="text-align: center;" >${item.BRAND }&nbsp;</td>
										<td style="text-align: center;" >&nbsp;<c:if test='${item.LESSOR_TIME!=null && item.LESSOR_TIME!="" &&item.LESSOR_TIME!="1900-01-01 00:00:00.0"}'><fmt:formatDate value="${item.LESSOR_TIME }" pattern="yyyy-MM-dd"/></c:if></td>
										<td style="text-align: center;"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContractEquiMDF.initCarRentUpdate&RECT_ID=${item.RECT_ID }&PRCD_ID=${item.PRCD_ID }'">修改</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
						<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="right">
										<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
										<img src="${ctx }/images/u604.gif">&nbsp;正常结清&nbsp;&nbsp;
										<img src="${ctx }/images/u614.gif">&nbsp;提前结清&nbsp;&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
				</div>
				</div>
				</div>
			<div id="rentfile" align="center" title="资料管理" style="display: none; width: 840px">
				<img src="${ctx }/images/loading.gif">
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

		<!--  日志弹出层结束  -->
	</body>
</html>