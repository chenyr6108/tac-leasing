<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>支付表管理</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="collectionManage.queryChangePayDatePaylist" />   		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;修改起租日、首期支付日</span>
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
				          <td><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${QEND_DATE }">
					</td>
					<td>
					状态：
					</td>
					<td>
					<select name="QSELECT_STATUS" style=" height: 18px;">
							<option value="-1" <c:if test="${QSELECT_STATUS eq -1}">selected='selected'</c:if>>
								全部
							</option>
							<option value="0" <c:if test="${QSELECT_STATUS eq 0}">selected='selected'</c:if>>
								正常
							</option>
							<option value="1" <c:if test="${QSELECT_STATUS eq 1}">selected='selected'</c:if>>
								正常结清
							</option>
							<!-- <option value="2" <c:if test="${QSELECT_STATUS eq 2}">selected='selected'</c:if>>
								转法务
							</option>-->
							<option value="3" <c:if test="${QSELECT_STATUS eq 3}">selected='selected'</c:if>>
								提前结清
							</option>
							<option value="4" <c:if test="${QSELECT_STATUS eq 4}">selected='selected'</c:if>>
								回购
							</option>
							<option value="5" <c:if test="${QSELECT_STATUS eq 5}">selected='selected'</c:if>>
								结清确认待分解
							</option>
							</select>
					</td>	
					<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
					<td>结清起始日期：</td>
				          <td>
				          <input type="text" name="JQSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
										id="JQSTART_DATE" value="${JQSTART_DATE }"></td>
				         
				          </tr></c:if>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          <c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
				           <td>
				          结清结束日期：</td>
				          <td><input type="text" name="JQEND_DATE" id="JQEND_DATE" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${JQEND_DATE }">
					</td></c:if>		
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
			<tr>
					<td>
					&nbsp;
					</td>
					<td align="right"><%@ include file="/common/pageControlTop.jsp"%></td>			
			</tr>
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									状态
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									支付表号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户名称
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									版本号
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									客户经理
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									办事处主管
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									创建日期
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									起租日期
								</th>
								<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									结清日期
								</th>
								</c:if>
								<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
							</tr>
						<c:forEach items="${dw.rs}" var="item" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>		
								<td style="text-align: center;"><c:if test="${item.RECP_STATUS eq 0}"><img src="${ctx }/images/u608.gif" title="正常"></c:if><c:if test="${item.RECP_STATUS eq 1}"><img src="${ctx }/images/u622.gif" title="正常结清"></c:if><!--<c:if test="${item.RECP_STATUS eq 2}"><img src="${ctx }/images/u617.gif" title="转法务"></c:if>--><c:if test="${item.RECP_STATUS eq 3}"><img src="${ctx }/images/u611.gif" title="提前结清"></c:if><c:if test="${item.RECP_STATUS eq 4}"><img src="${ctx }/images/u614.gif" title="回购"></c:if><c:if test="${item.RECP_STATUS eq 5}"><img src="${ctx }/images/u620.gif" title="结清确认待分解"></c:if></td>
								<td style="text-align: center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">${item.RECP_CODE}</a></td>
								<td style="text-align: center;">${item.CUST_NAME }</td>
								<td style="text-align: center;">${item.VERSION_CODE }</td>
								<td style="text-align: center;">${item.SENSORNAME }</td>
								<td style="text-align: center;">${item.CLERKNAME }</td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.CREATE_TIME }" /></td>
								<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.FIRST_PAYDATE }" /></td>
								<c:if test="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3}">
								<td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.JQDATE }" />&nbsp;</td>
								</c:if>                       
								<td style="text-align: left"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=handlePaylistService.initSetPayDate&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">设定起租日</a>&nbsp;|&nbsp;<!-- <a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=handlePaylistService.initChangePaylist&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">变更</a>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=handlePaylistService.initImportPaylist&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'">导入</a>&nbsp;|&nbsp;<a href="javascript:void(0)" onclick="showRemarkLog('${item.RECP_ID }')" >备注</a> --></td>
							</tr>
						</c:forEach>
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td>
							&nbsp;
							</td>
							<td align="right" colspan="10"><%@ include file="/common/pageControl.jsp"%></td>
						</tr>
						<tr>
							<td align="right" colspan="${QSELECT_STATUS == 1 || QSELECT_STATUS == 3 ? 12 : 11}" style="height:24px; text-align:right;background-color: #C5DBEC; " class="ui-state-default ui-jqgrid-hdiv ">
								<img src="${ctx }/images/u608.gif">&nbsp;正常&nbsp;&nbsp;<img src="${ctx }/images/u622.gif">&nbsp;正常结清&nbsp;&nbsp;<!--<img src="${ctx }/images/u617.gif">&nbsp;转法务&nbsp;&nbsp;--><img src="${ctx }/images/u611.gif">&nbsp;提前结清&nbsp;&nbsp;<img src="${ctx }/images/u614.gif">&nbsp;回购&nbsp;&nbsp;<img src="${ctx }/images/u620.gif">&nbsp;结清确认待分解&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
					<!--  备注弹出层    showRemarkLog(RECP_ID) -->
					<div id="remarkBlog" title="支付表备注" style="display:none" >
						<table id ="remarkLog1"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<input type="hidden" id="RECPID"  >
							<tr> <td   class="ui-state-default ui-th-ltr zc_grid_head" style="height: 24px">支付表备注</td> </tr>
							<tr ><td>
									<table id="remark1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									
									</table>
								</td>
							</tr>
							<tr> <td   class="ui-state-default ui-th-ltr zc_grid_head" style="height: 22px">添加备注</td> </tr>
							<tr> <td   >
								<textarea  id="remarkContent"
											style="width: 500px; height: 50px; font-size: 12px"
											class="txtk"></textarea>
							</td> </tr>
							<tr> <td   class="ui-state-default ui-th-ltr zc_grid_head" style="height: 24px">异常情况备注</td> </tr>
							<tr ></tr>
							<tr ><td>
									<table id="unusual" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
									
									</table>
								</td>
							</tr>
							<tr> <td   class="ui-state-default ui-th-ltr zc_grid_head" style="height: 23px"> 添加异常情况备注</td> </tr>
							<tr> <td   >
								<textarea  id="unusualContent"
											style="width: 500px; height: 50px; font-size: 12px"
											class="txtk"></textarea>
							</td> </tr>
						</table>						
						<center>
						<input type="button"  class="ui-state-default ui-corner-all"  onclick="saveContent()" value="确定" >
						<input type="button"   class="ui-state-default ui-corner-all" value="取消" onclick="cancel()" >
						</center>
					</div>
					<!--  备注弹出层  结束  -->
				</div>
				</div>
			</div>
		</div>		
		</form>
	</body>
</html>