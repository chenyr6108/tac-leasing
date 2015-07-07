<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/checkdecompose.js"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
		</script>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin2").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend2").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
		<title>分解单管理--分解确认</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<div id="tabs">
			<ul>
				<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">已提交</a></li>
				<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">已确认</a></li>
				<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">已撤销</a></li>
				<li style="width: 100px;text-align: center;"><a href="#tabs-4" onclick="selectCard(3)">全部</a></li>
			</ul>
		<form name="checkform" id="form1" action="../servlet/defaultDispatcher" method="post">
			<!--<input type="hidden" name="__action" id="__action" value="checkDecompose.showCheckDecomposeInfo">-->
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" />
			<input type="hidden" id="__action" name="__action" value="${__action }" />
			<table width="900" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
		      <tr valign="center">
		        <td width="54" class="ss_bigo"></td>
		        <td width="650" class="ss_bigt" valign="center" align="right"><table width="95%" border="0" cellspacing="0" cellpadding="0" class="ss_wenzi">
		          <table><tr>
		            <td width="10%">来款户名：</td>
		            <td width="15%"><input type="text" name="search_opposingunit" id="search_opposingunit" value="${search_opposingunit }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="15%">来款 起始日期：</td>
		            <td width="15%"><input type="text" value="${search_beginopposingdate}"	name="search_beginopposingdate" id="datebegin" readonly="readonly" style="width:80px; height:18px;" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="9%">结束日期:</td>
		            <td width="17%" ><input type="text" value="${search_endopposingdate}" name="search_endopposingdate" id="dateend" readonly="readonly" style="width:80px; height:18px;" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		          </tr>
		          <tr>
		            <td width="10%">分解单编号：</td>
		            <td width="15%"><input type="text" name="search_fiin_id" id="search_fiin_id" value="${search_fiin_id }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="15%">来款 起始金额：</td>
		            <td width="15%"><input type="text" name="search_beginincomemoney" id="search_beginincomemoney" value="${search_beginincomemoney }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="9%">结束金额：</td>
		            <td width="17%" ><input type="text" name="search_endincomemoney" id="search_endincomemoney" value="${search_endincomemoney }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		          </tr>
		          <tr>
		            <td width="10%">分解制单人：</td>
		            <td width="15%"><input type="text" name="search_decomposename" id="search_decomposename" value="${search_decomposename }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="15%">制单 起始日期：</td>
		            <td width="15%"><input type="text" name="search_begindecomposedate"	id="datebegin2" readonly="readonly" value="${search_begindecomposedate }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		            <td width="9%">结束日期：</td>
		            <td width="17%" ><input type="text" name="search_enddecomposedate" id="dateend2" readonly="readonly" value="${search_enddecomposedate }" onKeyPress="if (event.keyCode == 13) { searchcheck() }"></td>
		          </tr>
		         
		        </table></td>
		        <td width="100" class="ss_bigt" valign="center">
		        <a href="javaScript:void(0)" name="search" id="search" onclick="searchcheck();" class="blue_button">搜 索</a>
		        </td>
		        <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
		      </tr>
		    </table>
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<div class="ui-state-default ui-jqgrid-hdiv">
				<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr >
					<td><input name="input5" class="ui-state-default ui-corner-all" type="button" value="自动确认所有已提交来款"	onClick="autoAllIncome();"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
			<div id="tabs-1">
				<%@ include file="/decompose/showCheck_submit.jsp"%>
			</div>
			<div id="tabs-2">
				<%@ include file="/decompose/showCheck_confirmation.jsp"%>
			</div>
			<div id="tabs-3">
				<%@ include file="/decompose/showCheck_backout.jsp"%>
			</div>
			<div id="tabs-4">
				<%@ include file="/decompose/showCheck_all.jsp"%>
			</div>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr >
					<td><input name="input5" class="ui-state-default ui-corner-all" type="button" value="自动确认所有已提交来款"	onClick="autoAllIncome();"></td>
					<td><%@ include file="/common/pageControl.jsp"%></td>
				</tr>
			</table>
			<table class="STYLE2" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td align="right">
							<img src="${ctx }/images/u617.gif">
							已撤销
							<img src="${ctx }/images/u608.gif" alt="">
							已提交
							<img src="${ctx }/images/u611.gif" alt="">
							已确认
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			</div>
		</div>
		</form>
		</div>
	</body>
</html>
