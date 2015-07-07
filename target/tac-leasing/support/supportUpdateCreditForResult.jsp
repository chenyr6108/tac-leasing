<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>风控修改结果</title>
		<script type="text/javascript">
			function supportUpdateCredit(prc_id,id){ 
					if(confirm('您确定要修改此风控吗？')){
						//location.href='../servlet/defaultDispatcher?__action=supportRiskDelete.supportUpdateCredit&prc_id='+prc_id+'&id='+id;
						$.ajax({
							type:'post',
							url:'../servlet/defaultDispatcher',
							data:'__action=supportRiskDelete.supportUpdateCreditAjax&prc_id='+prc_id+'&id='+id,
							dataType:'json',
							success:function(dataBack){ 
								var alertinfo = dataBack.updateresult;
								alert(alertinfo);
								location.href='../servlet/defaultDispatcher?__action=supportRiskDelete.updateCreditForResult';
								//location.reload();
							}
						});		
					}else{
						return false;
					}		   				
			}
			function creditfile(id) {
				$("#creditfile").toggle(
						function() {
							$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReport.queryRentFile&prcd_id="+id+"&cardFlag=0");
						});	
				$('#creditfile').dialog({
					modal:true,
					autoOpen: false,
					width: 800
				});	
				$('#creditfile').dialog('open');
			}
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" id="__action" value="supportRiskDelete.updateCreditForResult">
			<input type="hidden" id="credit_id" name="credit_id">
			<input type="hidden" id="prc_node" name="prc_node"  value="${prc_node}">		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;风控修改结果</span>
		   	</div>	   				
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
		   	<div style="margin: 6 0 6 0px;">
	          	<table width="70%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
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
	          		
				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>编号 </strong>
								</th>								
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
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
									<strong>融资额 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>提交风控时间 </strong>
								</th>																	
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>资信调查报告 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" >
									<strong>风控会议纪要 </strong>
								</th>								
							</tr>
							<c:forEach items="${dw.rs}" var="item">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">${item.PRC_HAO }&nbsp;</td>
									<td style="text-align: center;"><c:if test="${item.CUST_TYPE eq 0 }">自然人</c:if><c:if test="${item.CUST_TYPE eq 1 }">法人</c:if></td>
									<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.CLERK_NAME }&nbsp;</td>
									<td style="text-align: center;">${item.SENSOR_NAME }&nbsp;</td>
									<td style="text-align:right">&nbsp;<fmt:formatNumber type="currency" value="${item.LEASE_RZE }" />&nbsp;</td>
									<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td style="text-align: center;"><a href="javaScript:void(0)"
											onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">查看</a> | <a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForUpdate&credit_id=${item.ID }'">修改</a> | <a href="javascript:void(0)" onclick="creditfile('${item.ID }');">资料</a></td>
									<td style="text-align: center;"><a href="javaScript:void(0)"
											onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditSee.selectRiskAuditForSee_zulin&credit_id=${item.ID }&prc_id=${item.PRC_ID }'">查看 </a><a href="javaScript:void(0)" onclick="supportUpdateCredit('${item.PRC_ID }','${item.ID}')">修改</a></td>									
								</tr>
							</c:forEach>
							</table>
							<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>					
		</form>	
		<div id="creditfile" align="center" title="资料管理" style="display: none;  text-align:center; width:840px">
				<img src="${ctx }/images/loading.gif">
		</div>
	</body>
</html>