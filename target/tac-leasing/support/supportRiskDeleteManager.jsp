<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>现场调查审核</title>
		<script type="text/javascript" src="${ctx }/support/js/manage.js"></script>	
	</head>
	<body>
	
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" id="__action" value="supportRiskDelete.riskAuditAfter">
			<input type="hidden" id="credit_id" name="credit_id">
			<input type="hidden" id="prc_node" name="prc_node"  value="${PRC_NODE}">
			
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评审删除</span>
		   	</div> 
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="50%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>    
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>		   	  	
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" >
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv " style="overflow:auto">			
						<table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1" style="width: 100%">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>编号 </strong>
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head" nowrap='nowrap'>
									<strong>承租人类型 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>承租人 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>办事处主管 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>客户经理 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>提交风控时间 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>一级意见 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>二级意见 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>三级意见 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>结果 </strong>
								</th>																																
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>资信调查报告 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>操作</strong>
								</th>								
							</tr>
							<c:forEach items="${dw.rs}" var="item">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${item.PRC_HAO }&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if>&nbsp;</td>
									<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>								
									<td style="text-align: center;">${item.ONE_CONTEXT }&nbsp;</td>		
									<td style="text-align: center;">${item.TWO_CONTEXT}&nbsp;</td>		
									<td style="text-align: center;">${item.THREE_CONTEXT }&nbsp;</td>																	
									<td style="text-align: center;"><c:choose><c:when test="${item.STATE eq 0}">否</c:when><c:otherwise>是</c:otherwise></c:choose>&nbsp;</td>												
									<td style="text-align: center;"><a href="javaScript:void(0)"
											onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a> | <a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a> | <a href="javascript:void(0)" onclick="creditfile('${item.ID }');">资料</a></td>
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="supportRiskDelete(${item.PRC_ID })">删除</a></td>								
								</tr>
							</c:forEach>
							</table>
							<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>			
								
		</form>
				<div id="creditfile" align="center" title="资料管理" style="display: none; width:840px; text-align:center;">
				<img src="${ctx }/images/loading.gif">
			</div>		
	</body>
</html>