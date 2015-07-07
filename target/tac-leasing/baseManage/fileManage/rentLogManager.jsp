<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/fileManage/js/fileManage.js"></script>
		<script type="text/javascript" src="${ctx }/baseManage/fileManage/js/fileNotCommit.js"></script>
		<title>提醒日志管理</title>
		<script type="text/javascript">
			$(function (){
				$("#start_date").datepicker($.datepicker.regional['zh-CN']);
				$("#end_date").datepicker($.datepicker.regional['zh-CN']);
				$("#create_startdate").datepicker($.datepicker.regional['zh-CN']);
				$("#create_enddate").datepicker($.datepicker.regional['zh-CN']);
			});
			
		function expand(id,TRFL_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=fileService.queryLogMore&TRFL_ID=" + TRFL_ID);
	        });
		}			
		</script>	
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">	
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="fileService.queryRentLog" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;提醒日志管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
				<div>
	          	<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr valign="center">
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="300" class="ss_bigt" valign="center" >
				         <table>
				          <tr>
				          	 <td width="6%">&nbsp;</td>
				            <td width="12%">提醒起始日期:</td>
				            <td width="10%"><input type="text" value="${start_date}" name="start_date" id="start_date" readonly="readonly" style="width:80px; height:18px;"></td>
				            <td width="12%">提醒结束日期:</td>
				            <td width="15%" ><input type="text" value="${end_date}" name="end_date" id="end_date" readonly="readonly" style="width:80px; height:18px;"></td>
				           
				          </tr>
				          <tr>
				          	 <td width="6%">&nbsp;</td>
				            <td width="12%">创建起始日期:</td>
				            <td width="10%"><input type="text" value="${create_startdate}" name="create_startdate" id="create_startdate" readonly="readonly" style="width:80px; height:18px;"></td>
				            <td width="12%">创建结束日期:</td>
				            <td width="15%" ><input type="text" value="${create_enddate}" name="create_enddate" id="create_enddate" readonly="readonly" style="width:80px; height:18px;"></td>
				          </tr>
				          <tr>
				          	<td width="6%">&nbsp;</td>
				            <td width="12%">查询内容:</td>
				            <td colspan="3">
				            <input type="text" name="content" id="content" value="${content }" style="width: 400px"
																	onKeyPress="if (event.keyCode == 13) { doSearch() }">
			            	</td>
			          </tr>
       			 </table>
       			</td>
		       <td width="100" class="ss_bigt" valign="center">
		       <a href="javaScript:void(0)" name="search" id="search" onclick="doSearch();" class="blue_button">搜 索</a></td>
		         <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
		      </tr>
		    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr>
						<td><input type="button" name="but" onclick="showDiv()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="所有日志提醒资料"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
							承租人姓名
						</th>
						<th width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
							提醒时间
						</th>
						<th width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
							备注
						</th>						
						<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
							创建人
						</th>
						<th width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
							创建时间
						</th>
						<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
							结束人
						</th>												
						<th width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>						
					</tr>
					<tbody>
						<c:forEach items="${dw.rs}" var="logInfor" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;" onclick="expand('pactAffix${logInfor.TRFL_ID}','${logInfor.TRFL_ID}');" style="cursor: pointer;">${status.count }&nbsp;</td>
								<td style="text-align: center;">${logInfor.CUST_NAME}&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${logInfor.END_DATE}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;">${logInfor.RTFL_MEMO}&nbsp;</td>								
								<td style="text-align: center;">${logInfor.NAME}&nbsp;</td>
								<td style="text-align: center;"><fmt:formatDate value="${logInfor.CREATE__DATE}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								<td style="text-align: center;">${logInfor.MODIFY_NAME}&nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onclick="invalidRentLog('${logInfor.TRFL_ID}');">结束</a></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="7" align="center">
									<div id="pactAffix${logInfor.TRFL_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
										<img src="${ctx }/images/loading.gif">
									</div>
								</td>											
							</tr>							
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>				
		</form> 	
		
		<!-- 弹出日志提醒资料未层 PRJT_ID 	<input type="button" value="日志" onclick="showBusinessLog('1233','');" />  -->
			<div title="日志提醒" style="display: none" id="showfileLog" >
		<form id="businessLog"  name="businessLog" method="POST"  action="../servlet/defaultDispatcher?__action=fileService.queryFile">
			<input type="hidden" id ="logRecordid" /><input type="hidden" id="fuse"/>
			
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
	          <div class="zc_grid_body jqgrowleft">	
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table id="data1" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr id="data2"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								<td style="text-align:center"  width="4%">序号<br><br></td>
								<td style="text-align:center"  width="6%">承租人<br><br></td>
								<td style="text-align:center"  width="6%">资料<br><br></td>
								
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
		<!-- 日志提醒资料未层 -->
	</body>
</html>