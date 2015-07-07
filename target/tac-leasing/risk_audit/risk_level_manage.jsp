<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>评审设置</title>
		<script src="${ctx }/risk_audit/js/risk_level.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action"  value="riskLevel.queryRiskLevAllInfo" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评审设置</span>
		   	</div>

			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="addDiv();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加评审级别"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							级别
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							评审金额下限
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							评审金额上限
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							归户授信下限
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							归户授信上限
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							备注
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
						<c:forEach items="${dw.rs}" var="riskLevel" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.RANK } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.LEVEL_PRICE_LOW } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.LEVEL_PRICE_UPPER } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.GRANT_PRICE_LOW } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.GRANT_PRICE_UPPER } &nbsp;</td>
								<td style="text-align: center;">${riskLevel.REMARK } &nbsp;</td>
								<td style="text-align: center;"><a href="javascript:void(0)" onclick="showDiv('${riskLevel.PRRL_ID}')">查看</a> <a href="javascript:void(0)" onclick="updateDiv('${riskLevel.PRRL_ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteRiskLevel('${riskLevel.PRRL_ID}')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>					
		</form> 
		
	<div id="addRiskLevel" style="display: none;" title="评审级别添加">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=riskLevel.createRiskLevel" method="post" id="addForm" name="addForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>级别</td>
			<td><input type="text" name="RANK" id="RANK"  /></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额下限</td>
			<td><input type="text" name="LEVEL_PRICE_LOW" id="LEVEL_PRICE_LOW"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额上限</td>
			<td><input type="text" name="LEVEL_PRICE_UPPER" id="LEVEL_PRICE_UPPER"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>归户授信下限</td>
			<td><input type="text" name="GRANT_PRICE_LOW" id="GRANT_PRICE_LOW"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>归户授信上限</td>
			<td><input type="text" name="GRANT_PRICE_UPPER" id="GRANT_PRICE_UPPER"  /></td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注</td>
			<td><input type="text" name="REMARK" id="REMARK"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="增加" onclick="add()"></input>
				  <input type="button" class="ui-state-default ui-corner-all" onclick="closeDialog(addRiskLevel);" value="关闭">
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</form>
	</div>
	

	<div id="showRiskLevel" style="display: none;" title="评审级别查看">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>级别</td>
			<td><span id="sRANK"></span></td>
		</tr>		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>评审金额下限</td>
			<td><span id="sLEVEL_PRICE_LOW"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>评审金额上限</td>
			<td><span id="sLEVEL_PRICE_UPPER"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>授信金额下限</td>
			<td><span id="sGRANT_PRICE_LOW"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>授信金额上限</td>
			<td><span id="sGRANT_PRICE_UPPER"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注</td>
			<td><span id="sREMARK"></span></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>


		<div id="updateRiskLevel" style="display: none;" title="评审级别修改">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=riskLevel.updateRiskLevel" method="post" id="updateForm" name="updateForm">
	<input type="hidden" name="PRRL_ID" id="PRRL_ID"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>级别</td>
			<td><input type="text" name="RANK" id="updateRANK" /></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额下限</td>
			<td><input type="text" name="LEVEL_PRICE_LOW" id="updateLEVEL_PRICE_LOW"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额上限</td>
			<td><input type="text" name="LEVEL_PRICE_UPPER" id="updateLEVEL_PRICE_UPPER"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额下限</td>
			<td><input type="text" name="GRANT_PRICE_LOW" id="updateGRANT_PRICE_LOW"  /></td>	
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">	
			<td>评审金额上限</td>
			<td><input type="text" name="GRANT_PRICE_UPPER" id="updateGRANT_PRICE_UPPER"  /></td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注</td>
			<td><input type="text" name="REMARK" id="updateREMARK" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="修改" onclick="update()"></input>
			   <input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(updateRiskLevel);"/>
			</center>
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