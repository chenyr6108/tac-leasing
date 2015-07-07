<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>分解单冲红管理</title>
		 
	<script type="text/javascript" src="${ctx }/decompose/js/showincome.js"></script>
	<script type="text/javascript">	
		function findWriteBills(id){
        		$("#writebills" + id).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=checkDecompose.findWriteBills&fiin_id="+id);
       			 });
		}
	</script>
	</head>
	<body>
		
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="checkDecompose.queryCanWriteBackBills">

			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;分解单冲红管理</span>
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
				    <!--       
					<td colspan="5">
					&nbsp;
					</td>
					<td>
					&nbsp;
					</td>-->
					<td>查询状态：</td>
				          <td colspan="3"><select name="selecttype"  style=" width:200px;height:18px; font-size: 12px;"><option value="">--请选择--</option><option <c:if test="${selecttype==4 }">selected="selected"</c:if> value="4">未申请冲红</option><option <c:if test="${selecttype==3 }">selected="selected"</c:if> value="3">已申请整单冲红</option><option <c:if test="${selecttype==2 }">selected="selected"</c:if> value="2">已申请分项冲红</option><option <c:if test="${selecttype==1 }">selected="selected"</c:if> value="1">已审批（整单）</option><option <c:if test="${selecttype==0} ">selected="selected"</c:if> value="0">已审批（分项）</option></select>
				          </td> 
				          </tr> 
				          </tr> 

				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
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
					<td>&nbsp;</td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<!--<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong><img src="${ctx }/images/u620.gif"></strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款ID</strong>
			</th>-->
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
				<strong>来款类型</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>来款金额</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>交易附言</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>待分解来源</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>冲红申请</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>操作</strong>
			</th>
			<!--<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>冲红审批</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>冲红单制作</strong>
			</th>-->
		</tr>
		<c:forEach items="${dw.rs}" var="items" varStatus="status">
			<tr	class="ui-widget-content jqgrow ui-row-ltr">
				<!-- <td style="text-align: center;" onclick="findWriteBills('${items.FIIN_ID }')"><img src="${ctx }/images/u620.gif"></td>
				<td style="text-align: center;">${items.FIIN_ID }&nbsp;</td> -->
				<td style="text-align: center;"><fmt:formatDate value="${items.OPPOSING_DATE }" pattern="yyyy-MM-dd" />&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_UNIT }&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_BANKNO }&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_TYPE}&nbsp;</td>
				<td style="text-align: right;"><fmt:formatNumber value="${items.INCOME_MONEY }" type="currency"></fmt:formatNumber>&nbsp;</td>
				<td style="text-align: center;">${items.OPPOSING_POSTSCRIPT }&nbsp;</td>
				<td style="text-align: center;">${items.LEFT_ID }&nbsp;</td>
				<td style="text-align: center;"><c:if test="${items.RED_TYPE eq null}"><a href="#" onclick="judgeWriteBack('${items.FIIN_ID }');">整单冲红</a> <!--<a href="#" onclick="writeBacksome('${items.FIIN_ID }');">分项冲红</a>   --></c:if><c:if test="${items.RED_TYPE eq 3}">未审批（整单）</c:if><c:if test="${items.RED_TYPE eq 2}">未审批（分项）</c:if><c:if test="${items.RED_TYPE eq 1}">已审批（整单）</c:if><c:if test="${items.RED_TYPE eq 0}">已审批（分项）</c:if>&nbsp;</td>
				<td style="text-align: center;"><a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${items.FIIN_ID }">查看</a>&nbsp;</td>
				<!--<td style="text-align: center;"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=checkDecompose.selectWriteBillsForsee&select_income_id=${items.FIIN_ID }'">查看</a>&nbsp;</td>
				<td style="text-align: center;"><c:if test="${items.RED_TYPE ==3 }"><a href="#" onclick="writeBackAllPass('${items.FIIN_ID }');">整单冲红审批</a></c:if><c:if test="${items.RED_TYPE ==2 }"><a href="#" onclick="writeBackSomePass('${items.FIIN_ID }');">分项冲红审批</a></c:if>&nbsp;</td>
				<td style="text-align: center;"><c:if test="${items.RED_TYPE ==1 and items.FICB_TYPE ==0}"><a href="#" onclick="writeBackBillMakeAll('${items.FIIN_ID }','${items.FICB_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(整单)</a></c:if><c:if test="${items.RED_TYPE ==0 and items.FICB_TYPE ==0}"><a href="#" onclick="writeBackBillMakeSome('${items.FIIN_ID }','${items.FICB_ID }','${items.RECP_CODE }','${items.CUST_CODE }');">冲红单制作(分项)</a></c:if><c:if test="${items.FICB_TYPE ==2 }">冲红已完成&nbsp;</c:if><c:if test="${items.FICB_TYPE ==1 }">冲红数据&nbsp;</c:if>&nbsp;</td>
				 -->
			</tr>
			<tr>
				<td style="text-align: center;" colspan="9" align="center">
						<div id="writebills${items.FIIN_ID }" align="center"
							style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
						<img src="${ctx }/images/loading.gif">
						</div>
				</td>
			</tr>
		</c:forEach>
	</table>
			<%@ include file="/common/pageControl.jsp"%>
			
			</div>
				</div>
			</div>		
		</form>
		
		
			<div title="整单冲红申请原因" style="display: none" id="requirereasondiv" >

				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	         	 <div class="zc_grid_body jqgrowleft"  >	
						<div class="ui-state-default ui-jqgrid-hdiv " >
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="20%">申请原因</td>
								<td style="text-align:center"  width="80%"><textarea id="requirereson" name="requirereson" rows="5" cols="90"></textarea></td>
							</tr>
					</table>
					<center>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="judgeWriteBackSubmit()" value="申请"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="closeDialog('requirereasondiv');" value="取消"/>
					&nbsp;&nbsp;&nbsp;
					</center>
					<div style="text-align:center"  >以往记录</div>
					<div class="zc_grid_body jqgrowleft" id="historyss"></div>	
				</div>
				</div>
			</div>	
	
		</div>
		
		<div title="分项冲红申请原因" style="display: none" id="requirereasondiv2" >

				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	         	 <div class="zc_grid_body jqgrowleft" >	
						<div class="ui-state-default ui-jqgrid-hdiv " >
						<table id="data12" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							
							<tr id="data22"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="20%">申请原因</td>
								<td style="text-align:center"  width="80%"><textarea id="requirereson2" name="requirereson2" rows="5" cols="90"></textarea></td>
							</tr>
					</table>
					<center>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="writeBacksomeSubmit()" value="申请"/>
					&nbsp;&nbsp;&nbsp;
					<input class="ui-state-default ui-corner-all" type="button" onclick="closeDialog('requirereasondiv2');" value="取消"/>
					&nbsp;&nbsp;&nbsp;
					</center>
					<div style="text-align:center"  >以往记录</div>
					<div class="zc_grid_body jqgrowleft" id="historyss2"></div>	
				</div>
				</div>
			</div>	

		</div>
	</body>
</html>