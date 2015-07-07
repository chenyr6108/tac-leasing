<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>审查处统计</title>
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">		
		function doSearch1(aid,aname){
		   $("#aid").val(aid);
		    $("#aname").val(aname);
		    var id=aid;
		    var name=aname;
	        $("#form1").submit();
           }
           function doSearchaaa(){
             var adate=$("#datebegin").val();
             var type = $("#type").val() ;
            	window.location.href='${ctx }/servlet/defaultDispatcher?__action=officeTable.queryCompanys&QSTART_DATE='+adate+'&type='+type;
           }
           function reportExcel()
			{
			 var adate=$("#datebegin").val();
            	window.location.href='${ctx }/servlet/defaultDispatcher?__action=officeTable.exportAllCompanysTable&QSTART_DATE='+adate;
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="officeTable.queryCompanyTables" />
			<input type="hidden" name="aid" id="aid" value="" />
			<input type="hidden" name="aname" id="aname" value="" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;审查处统计</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				 <tr>
				      <td width="16">&nbsp;</td>
				      <td width="60" class="ss_o"></td>
				      <td width="60%" class="ss_t" valign="top">
					        <table style="margin-left: 10px;">
					        <tr>
					        <td>日期：</td>
					        <td><input type="text"   name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE}"></td>
					        <td>
							<td> 统计单位类型：</td>
						    <td><select  name="type" ID="type" >
						    	<option value="1" <c:if test="${type eq 1}">selected='selected'</c:if>>年</option>
								<option value="0" <c:if test="${type eq 0}">selected='selected'</c:if>>月</option>
								</select> </td>
			                </tr>
			                </table>
				      </td>
				      <td width="55" class="ss_th" valign="top">&nbsp;</td>
				      <td width="20%"><a href="#" name="search" id="search" onclick="doSearchaaa();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          </div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
				   <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr><td><input type="button"  onclick="reportExcel()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="导出统计表">
					</td></tr>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<thead>
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head">办事处别</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">当日<br/>进件</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>进件</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">当日<br/>已访厂</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>已访厂</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>未访厂</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>核准</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">已附<br/>条件</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">审批<br/>婉拒</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>未审批</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>完成率</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">累计<br/>核准率</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${companyList}" var="item" varStatus="status">													
								<tr class="ui-widget-content jqgrow ui-row-ltr"> 
								    <td><a href="#" id="depcid" onclick="doSearch1(${item.DECP_ID },'${item.DECP_NAME_CN }');">${item.DECP_NAME_CN }&nbsp;</a></td>
									<td style="text-align: center;">${item.TODAYMEMO }&nbsp;</td>
									<td style="text-align: center;">${item.MEMO }&nbsp;</td>
									<td style="text-align: center;">${item.TODAYVISIT }&nbsp;</td>
									<td style="text-align: center;">${item.VISIT }&nbsp;</td>
									<td style="text-align: center;">${item.NOVISIT }&nbsp;</td>
									<td style="text-align: center;">${item.WINDONE }&nbsp;</td>
									<td style="text-align: center;">${item.WINDCONDITION }&nbsp;</td>
									<td style="text-align: center;">${item.WINDNOT }&nbsp;</td>
									<td style="text-align: center;">${item.NOAPPROVE}&nbsp;</td>
									<td style="text-align: center;">${item.COMPLETIONRATE*100}%&nbsp;</td>
									<td style="text-align: center;">${item.WINDONERATE*100 }%&nbsp;</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
				</div>
			
		</form>
			<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-43</p>
	<script>
	$(function () {
			var d=new Date();
		    var sec=d.getSeconds();
		    var min=d.getMinutes();
		    var hour=d.getHours();
		    if(sec<10) {
		    	sec="0"+sec;
		    }
		    if(min<10) {
		    	min="0"+min;
		    }
		    if(hour<10) {
		    	hour="0"+hour;
		    }
		    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
		});
	</script>
		
		
			
	</body>
</html>
