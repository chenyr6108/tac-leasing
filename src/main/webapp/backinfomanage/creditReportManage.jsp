<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查管理</title>
		 
	<script type="text/javascript" src="${ctx }/credit/js/creditScheme.js"></script>
	<script type="text/javascript" src="${ctx }/credit/js/creditLog.js"></script>
	<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
	<script type="text/javascript">	
	function creditfile(id,contract_type) {
		window.location.href="../servlet/defaultDispatcher?__action=backinfo.queryRentFile&prcd_id="+id+"&contract_type="+contract_type;
	  }	
	function exportWaitFileSheet(){
	    start_date=$("#datebegin").val();
	    end_date=$("#dateend").val();
	   // credit_type=$("#credit_type").val();
	    RENTSTAUTS=$("#RENTSTAUTS").val();
	     QSELECT_STATUS=$("#QSELECT_STATUS").val();
	    content=$("#content").val();
		window.location.href="../servlet/defaultDispatcher?__action=exportContractPdf.queryRentFile&start_date="+start_date+"&end_date="+end_date+"&RENTSTAUTS="+RENTSTAUTS+"&content="+content+"&QSELECT_STATUS="+QSELECT_STATUS;
	}
	</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="backinfo.creditManage">
			<input type="hidden" id="credit_id" name="credit_id">	
			<input type="hidden" id="commit_flag" name="commit_flag">	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;回件管理</span>
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
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" id="QSELECT_STATUS" style=" height: 18px;">
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
					   <select name="RENTSTAUTS" id="RENTSTAUTS" style=" height: 18px;">
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
					<!--  <td>
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
					<select name="credit_type" id="credit_type" style=" height: 18px;">
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
					</td>-->
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
					<td><input type="button" onclick="exportWaitFileSheet();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="待补文件表统计"/></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>状态 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>资信类型 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>案件号</strong>
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
					<!--  <th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>风控纪要 </strong>
					</th>-->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>生成时间 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作 </strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					    <td style="text-align: center;" onClick="exReportRentFile('contractTr${item.ID}','${item.ID}','${item.CONTRACT_TYPE}','manage','0');" style="cursor: pointer;"><c:if test="${item.RECT_STATUS eq null}"><img src="${ctx }/images/u608.gif" title="未初审"></c:if><c:if test="${item.STATUS eq 0}"><c:if test="${item.RECT_STATUS eq 0}"><img src="${ctx }/images/u622.gif" title="已初审"></c:if><c:if test="${item.RECT_STATUS eq 1}"><img src="${ctx }/images/u611.gif" title="已复核"></c:if><c:if test="${item.RECT_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="复核驳回"></c:if></c:if><c:if test="${item.STATUS eq -1}"><img src="${ctx }/images/u620.gif" title="作废"></c:if></td>
				 <!--  <td style="text-align: center;" onClick="exReportRentFile('contractTr${item.ID}','${item.ID}','${item.CONTRACT_TYPE}','manage','0');"><c:if test="${item.STATE eq 0}"><img src="${ctx }/images/u608.gif" title="调查中"></c:if><c:if test="${item.STATE eq 3}"><img src="${ctx }/images/u611.gif" title="提交主管"></c:if><c:if test="${item.STATE eq 2}"><img src="${ctx }/images/u614.gif" title="主管驳回"></c:if><c:if test="${item.STATE eq 1}"><img src="${ctx }/images/u622.gif" title="主管通过"></c:if><c:if test="${item.STATE eq -1}"><img src="${ctx }/images/u617.gif" title="项目撤销"></c:if></td>
					--><td style="text-align: center;">${item.TYPE }&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.PROVINCE }&nbsp;</td>
						<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
						<!--  <td style="text-align: center;">&nbsp;<c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">已提交</a></c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">无条件通过</a></c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过附条件</a></c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.watchRiskControlMemo&credit_id=${item.ID }'">不通过</a></c:if></td>
						--><td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
						<td style="text-align: center;"><a href="javaScript:void(0)"	onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a>| <a href="javascript:void(0)" onclick="creditfile('${item.ID}','${item.CONTRACT_TYPE}');">资料</a></td>
					</tr>
					<tr>
								<td align="center" colspan="10">
									<div id="contractTr${item.ID }" align="center"
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
										<img src="${ctx }/images/u608.gif">&nbsp;未初审&nbsp;&nbsp;
										<img src="${ctx }/images/u622.gif">&nbsp;已初审&nbsp;&nbsp;
										<img src="${ctx }/images/u611.gif">&nbsp;已复核&nbsp;&nbsp;
										<img src="${ctx }/images/u617.gif">&nbsp;复核驳回&nbsp;&nbsp;
										<img src="${ctx }/images/u620.gif">&nbsp;作废&nbsp;&nbsp;
						</td>
						<!--  <td align="right">
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
						</td> -->
					</tr>
				</tbody>
			</table>
			</div>
				</div>
			</div>		
		</form>
			<div id="creditfile" align="center" title="资料管理" style="display: none; text-align:center; width: 840px">
				<img src="${ctx }/images/loading.gif">
			</div>			
	</body>
</html>