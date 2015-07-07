<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>修改来款账户名称管理页</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/collection/js/remark.js"></script>
		<script type="text/javascript">

		$(function (){
			$("#dateBegin").datepicker($.datepicker.regional['zh-CN']);
			$("#dateEnd").datepicker($.datepicker.regional['zh-CN']);
		});
		function queryFinaIncome(){
			if($("#moneyEnd").val() != "" && parseInt($("#moneyBegin").val()) > parseInt($("#moneyEnd").val())){
				alert("金额范围不合法！");
				$("#moneyBegin").select();
				return;
			}
			$("#form1").submit() ;
		}
		//修改来款户名
		function updateOpposingName(count,fiinId){
			var name = $("#current_opposing"+count).val() ;
			if(name != null || name != ''){
				if(confirm("确定要修改么？")){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:{'__action':'decompose.updateOpposingUnit',
							'OPPOSING_UNIT':name ,
							'FIIN_ID': fiinId },
						dataType:'json',
						success: function(data){
							alert(data.content) ;
							location.href='../servlet/defaultDispatcher?__action=decompose.queryNotDecomposeFinaIncome&OPPOSING_UNIT='+name;
						},
						error:function(callback){
							alert("修改失败");
							return;
						}
					}) ;
				} else {
					$("#current_opposing"+count).val($("#pre_current_opposing"+count).val()) ;
				}
			}
		}
		//修改帐号
		function updateBANKNOName(count,fiinId){
			var name = $("#BANKNO"+count).val() ;
			if(name != null || name != ''){
				if(confirm("确定要修改么？")){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:{'__action':'decompose.updateBankNoUnit',
							'OPPOSING_BANKNO':name ,
							'FIIN_ID': fiinId },
						dataType:'json',
						success: function(data){
							alert(data.content) ;
							location.href='../servlet/defaultDispatcher?__action=decompose.queryNotDecomposeFinaIncome&OPPOSING_UNIT='+name;
						},
						error:function(callback){
							alert("修改失败");
							return;
						}
					}) ;
				} else {
					$("#BANKNO"+count).val($("#pre_current_VIRTUAL_CODE"+count).val()) ;
				}
			}
		}
		//修改虚拟帐号
		function updateVIRTUAL_CODE(count,fiinId){
			var name = $("#VIRTUAL_CODE"+count).val() ;
			if(name != null || name != ''){
				if(confirm("确定要修改么？")){
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:{'__action':'decompose.updateVIRTUAL_CODE',
							'VIRTUAL_CODE':name ,
							'FIIN_ID': fiinId },
						dataType:'json',
						success: function(data){
							alert(data.content) ;
							location.href='../servlet/defaultDispatcher?__action=decompose.queryNotDecomposeFinaIncome&OPPOSING_UNIT='+name;
						},
						error:function(callback){
							alert("修改失败");
							return;
						}
					}) ;
				} else {
					$("#VIRTUAL_CODE"+count).val($("#pre_current_BANKNO"+count).val()) ;
				}
			}
		}				
	</script>		
	</head>
	<body>
		<form action="../servlet/defaultDispatcher?__action=decompose.queryNotDecomposeFinaIncome" name="form1" id="form1" method="post">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;修改来款账户</span>
			</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="middle">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="OPPOSING_UNIT" id="OPPOSING_UNIT" value="${OPPOSING_UNIT}" 
				          style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          <tr>
				          <td>起始日期：</td>
				          <td><input type="text" name="dateBegin" id="dateBegin" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${dateBegin }"></td>
				          <td>结束日期：</td>
				          <td><input type="text" name="dateEnd" id="dateEnd" style=" width: 80px; height: 18px;" readonly="readonly"
								value="${dateEnd }"></td>
				          <td>来款金额范围：</td>
				          <td><input type="text" name="moneyBegin" value="${moneyBegin}" onkeyup="value=value.replace(/[^\d]/g,'')" id="moneyBegin" style=" width: 80px;" /> - 
				          <input type="text" name="moneyEnd"  value="${moneyEnd}" onkeyup="value=value.replace(/[^\d]/g,'')" id="moneyEnd" style=" width: 80px;" /></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="sub" id="sub" onclick="queryFinaIncome();"  class="blue_button" >搜 索</a></td>
				      </tr>
				    </table>
					</div>	
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1"> 
			<tr>
					<td align="right"><%@ include file="/common/pageControlTop.jsp"%></td>			
			</tr>
			
			</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</th>																
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>来款时间</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>对方户名</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>对方账号</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>虚拟账号</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>来款类型</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>来款金额</strong>
								</th>
								<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>交易附言</strong>
								</th>
							</tr>
						<c:forEach items="${dw.rs}" var="income" varStatus="status">
							<tr	class="ui-widget-content jqgrow ui-row-ltr">		
								<td style="text-align: center;" width="5%">${status.count }</td>		
								<td style="text-align: center;" width="5%"><fmt:formatDate value="${income.OPPOSING_DATE }"  pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;" width="25%"><input type="text" size="60" name="current_opposing" id="current_opposing${status.count }" value="${income.OPPOSING_UNIT }" onchange="updateOpposingName('${status.count  }','${income.FIIN_ID }');"/><input type="hidden" value="${income.OPPOSING_UNIT}" id="pre_current_opposing${status.count }">&nbsp;</td>
								<td style="text-align: center;" width="15%"><input type="text"  size="30" id="BANKNO${status.count }" value="${income.OPPOSING_BANKNO}" onchange="updateBANKNOName('${status.count  }','${income.FIIN_ID }');"/><input type="hidden" value="${income.OPPOSING_BANKNO}" id="pre_current_BANKNO${status.count }">&nbsp;&nbsp;</td>
								<td style="text-align: center;" width="20%"><input type="text"  size="30" id="VIRTUAL_CODE${status.count }" value="${income.VIRTUAL_CODE}" onchange="updateVIRTUAL_CODE('${status.count  }','${income.FIIN_ID }');"/><input type="hidden" value="${income.VIRTUAL_CODE}" id="pre_current_VIRTUAL_CODE${status.count }">&nbsp;&nbsp;</td>
								<td style="text-align: center;" width="10%">${income.OPPOSING_TYPE }&nbsp;</td>
								<td style="text-align: right;"  width="10%"><fmt:formatNumber value="${income.INCOME_MONEY}" type="currency"></fmt:formatNumber>&nbsp;</td>
								<td style="text-align: center;" width="10%">${income.OPPOSING_POSTSCRIPT }&nbsp;</td>
							</tr>
						</c:forEach>	
						</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td align="right" colspan="10"><%@ include file="/common/pageControl.jsp"%></td>
							</tr> 
						</table>
				</div>
				</div>
			</div>
		</div>		
		</form>
	</body>
</html>