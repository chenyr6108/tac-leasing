<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
		<script type="text/javascript" src="${ctx }/credit/js/creditCustomerCreate.js"></script>
<script type="text/javascript">
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
function showEntey(event){    
		//alert(event.keyCode);
        if(event.keyCode==13)
        {
                doSearch();   
                                              
        }
 } 

function createFiles(cust_id){
	location.href='${ctx }/servlet/defaultDispatcher?__action=activitiesLog.createFilesShow&cust_id='+cust_id;

}



 function chang()
    {
    	var logvalue=$("#caseSelect").val();
    	if(logvalue==-1)
    	{
    		$("#casesun option").remove();
    		return false;
    	}
    	var spit=logvalue.split(",");
    	var dataid=spit[0];
    	var code=spit[1];
    	document.getElementById("caseFather").value=dataid;
    	
    	
    	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=activitiesLog.getLogType&code=' + code,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		var logSunList= dataBack.logSunList;
		
		$("#casesun option").remove();
		for(var i=0;i<logSunList.length;i++)
		{
			$("<option value='"+logSunList[i].ACTLOG_ID+"'>"+logSunList[i].ACTLOG_NAME+"</option>").appendTo($("#casesun"));
		}
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
  }


</script>

	</head>
	<body>
	<form id="dispatcherForm" name="dispatcherForm" method="POST" action="${ctx}/servlet/defaultDispatcher">
		<input type="hidden" name="__action" id="__action" value="" />
		<input type="hidden" name="cust_id" id="cust_id" value="0" />
		<input type="hidden" name="cust_type" id="cust_type" value="-1" />
	</form>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=activitiesLog.query">
			<input type="hidden" name="__action" value="activitiesLog.query" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;活动日志管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
				<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr valign="center">
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center" >
				         <table>
			          <tr>
			            <td width="9%">起始日期:</td>
			            <td width="15%"> <input type="text" name="QSTART_DATE" style=" width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${QSTART_DATE }"></td>
			            <td width="12%">结束日期:</td>
			            <td width="15%" ><input type="text" name="QEND_DATE" id="dateend" style=" width: 80px; height: 18px;" readonly="readonly" value="${QEND_DATE }"></td>
			           	<td>客户经理:</td>
			            <td><input type="text" name="sorUserId" id="sorUserId" value="${sorUserId }"></td>
			            
			          </tr>
			          <tr>
			          	<td width="12%">公司代号：</td>
			            <td colspan="2"><select id="decp_id" name="decp_id">
							<option value="">
								-请选择公司代号-
							</option>
							<c:forEach items="${companyList}" var="item">					
								<option value="${item.DECP_ID}" <c:if test="${item.DECP_ID==decp_id}">selected="selected"</c:if>>${item.DECP_NAME_CN  }</option>								
							</c:forEach>
						</select></td>
						<td width="4%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地区：</td>
			            <td colspan="2"><select id="province_id" name="province_id"	onchange="getCitys();"  style="width:100px">
							<option selected="selected" value="">
								-请选择省份-
							</option>
							<c:forEach items="${provinces}" var="item">
								<option value="${item.ID }" <c:if test="${item.ID==province_id}">selected="selected"</c:if> >
									${item.NAME }
								</option>
							</c:forEach>
						</select>&nbsp;&nbsp;&nbsp;<select id="city_id" name="city_id" style="width:100px">
							<c:forEach items="${cityType }" var="item" varStatus="status"><option <c:if test="${item.ID==city_id}">selected="selected"</c:if> value="${item.ID }">${item.NAME }</option></c:forEach>
								
							
						</select></td>
			          </tr>
			          <tr>
			            <td width="10%">案件状况:</td>
			            <td colspan="5">
			            <input type="hidden" name="caseFather" id="caseFather"><select name="caseSelect" id="caseSelect" style="width:150px" onchange="chang()"><OPTION selected="selected" value="">--请选择--</OPTION><c:forEach items="${logTypeList }" var="item" varStatus="status"><option <c:if test="${item.DATA_ID==caseFather}">selected="selected"</c:if>  value="${item.DATA_ID },${item.CODE }">${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="casesun" id="casesun" style="width:100px"><c:forEach items="${casesunType }" var="item" varStatus="status"><option <c:if test="${item.ACTLOG_ID==casesun}">selected="selected"</c:if> value="${item.ACTLOG_ID }">${item.ACTLOG_NAME }</option></c:forEach></select>
			            </td>
			          </tr>
			          <tr>
			          	<td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" 
				          style=" width:395px;height:18px; font-size: 12px;">
			          </tr>
       			 </table>
       			</td>
		       <td width="100" class="ss_bigt" valign="center">
		      <a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
		         <td width="13" class="ss_bigth" valign="top">&nbsp;</td>
		      </tr>
		    </table> 
				         
	          		</div>
	          		
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						状态
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人类型
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						类别
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						创建时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						最后一次修改时间
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<a href="javascript:void(0)" onclick="initCreate('${ctx }')">添加</a>
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;" onClick="exactivitiesLog('contractTr${item.CUST_ID }','${item.CUST_ID }','manage');"><img src="${ctx }/images/u608.gif" title="">&nbsp;</td>
					<td style="text-align: center;">&nbsp;<c:if test="${item.CUST_TYPE eq 0}">自然人</c:if><c:if test="${item.CUST_TYPE eq 1}">法人</c:if></td>
					<td style="text-align: center;">&nbsp;${item.CUST_CODE }</td>
					<td style="text-align: center;">&nbsp;${item.CUST_NAME }</td>
					<td style="text-align: center;">&nbsp;<c:forEach items="${custLevel}" var="custLevel"><c:if test="${item.CUST_LEVEL eq custLevel.CODE}">${custLevel.FLAG }</c:if></c:forEach></td>
					<td style="text-align: center;">&nbsp;<fmt:formatDate  pattern="yyyy-MM-dd" value="${item.CREATE_TIME}"/></td>
					<td style="text-align: center;">&nbsp;<fmt:formatDate  pattern="yyyy-MM-dd" value="${item.MODIFY_TIME}"/></td>
					<td style="text-align: center;">&nbsp;<a href="javascript:void(0)" onClick="createFiles('${item.CUST_ID }')" >新建主档</a></td>
				</tr>
				<tr>
								<td align="center" colspan="11">
									<div id="contractTr${item.CUST_ID }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
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
	</body>
</html>