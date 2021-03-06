<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看回访记录</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );


function changeTr(resul)
{
	if(resul==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

</script>
<body >
	<input type="hidden" name="id" value="${employee.ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看回访记录</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<c:forEach items="${backVisit }" var="backVisit">
		<c:if test="${isDone ne '1'  }">
		
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<%-- <td>合同编号：</td>
			<td  colspan="2"><input type="hidden" name="RECT_ID" id="RECT_ID" value="${backVisit.RECT_ID }" readonly="readonly"/><input type="text" style="height:25px" name="rect_code" id="rect_code" value="${backVisit.LEASE_CODE }" readonly="readonly"/></td> --%>
			<td> 承租人：</td>
			<td  colspan="2"><input type="text" size="35" style="height:25px" id="cust_name" name="cust_name" value="${backVisit.CUST_NAME }" readonly="readonly">    </td>
			<%-- <td> 租金到期日：</td>
			<td><input type="text" style="height:25px" value="<fmt:formatDate value="${backVisit.END_DATE }" pattern="yyyy-MM-dd"/>&nbsp;" size="10" id="end_date" name="end_date" readonly="readonly"> </td> --%>
		</tr>
<%-- 		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>支付表号：</td>
			<td><input type="text" size="35" value="${backVisit.RECP_CODE }" size="10" style="height:25px" id="prcpcode" name="prcpcode" readonly="readonly"></td>	
			<td> 制造商：</td>
			<td><input type="text" size="35" value="${backVisit.THING_KIND }" size="10" id="thingkind" style="height:25px" name="thingkind" readonly="readonly"></td>
			<td> 产品名称：</td>
			<td><input type="text" size="35" value="${backVisit.THING_NAME }" size="10" id="thingname" name="thingname" style="height:25px" readonly="readonly"></td>
			<td> 型   号：</td>
			<td><input type="hidden"  name="recd_id" id="recd_id" value="${backVisit.RECD_ID }"><input type="text" size="20" value="${backVisit.MODEL_SPEC }" style="height:25px" size="10" id="modelspec" name="modelspec" readonly="readonly"></td>
		</tr> --%>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>区域：</td>
			<td><input type="text" value="${backVisit.PROVINCE }" size="10" style="height:25px" id="province" name="province" readonly="readonly"></td>	
			<td> 城市：</td>
			<td><input type="text" value="${backVisit.CITY }" size="10" id="city" style="height:25px" name="city" readonly="readonly"></td>
			<%-- <td> 预访日期：</td>
			<td colspan="3"><input type="text" value="${backVisit.READY_VISIT_DATE}" size="20" id="visitOldDate" name="ready_visit_date" style="height:25px" readonly="readonly"></td> --%>
			
		</tr>
		</c:if>
<c:set var="isDone" value="1" scope="page"></c:set>
		</c:forEach>
		<c:forEach items="${backVisit }" var="backVisit" varStatus="status">
		<tr>
			<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" ><b>第${status.count }次回访记录</b></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 回访人员：</td>
			<td><input type="hidden" name="create_id" id="create_id" value="${backVisit.NAME }"><input type="text" value="${backVisit.NAME }" style="height:25px" size="10" id="visit_user_name" name="visit_user_name" readonly="readonly"></td>
			<td>回访日期：</td>
			<td><input type="text" style="height:25px" name="visitNewDate" readonly="readonly" id="visitNewDate" value="${backVisit.VISIT_DATE }"/></td>
			<td>接触对象： </td>
			<td><input type="text" style="height:25px" readonly="readonly" name="visit_conperson" id="visit_conperson"  value="${backVisit.VISIT_CONPERSON }"/></td>
			<td>是否营业： <input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.IS_BUSINESS eq 0 }'>是</c:if><c:if test='${backVisit.IS_BUSINESS eq 1 }'>否</c:if>"></td>
			<td>是否见标的物： <input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.IS_PRODUCTS eq 0 }'>是</c:if><c:if test='${backVisit.IS_PRODUCTS eq 1 }'>否</c:if>"></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr" style="display:">
			<td>标的物外观： </td>
			<td><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.PROD_DEGREE eq 0 }'>正常</c:if><c:if test='${backVisit.PROD_DEGREE eq 1 }'>破损</c:if>"></td>
			<td>是否正常运行： </td>
			<td><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.IS_RUN eq 0 }'>是</c:if><c:if test='${backVisit.IS_RUN eq 1 }'>否</c:if>"></td>
			<td>机器运行率： </td>
			<td><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.PROD_DEGREE_DETAILED eq 0 }'>正常</c:if><c:if test='${backVisit.PROD_DEGREE_DETAILED eq 1 }'>良好</c:if><c:if test='${backVisit.PROD_DEGREE_DETAILED eq 2 }'>差</c:if>"></td>
			<td>回访结果： </td>
			<td><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.VISIT_RESULTS eq 0 }'>正常</c:if><c:if test='${backVisit.VISIT_RESULTS eq 1 }'>异常</c:if>"></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr" style="display:">
			<td>回访原因： </td>
			<td colspan="7"><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.VISIT_RESON eq -1 }'>逾期25天</c:if><c:if test='${backVisit.VISIT_RESON eq 0 }'>异常提前回访</c:if><c:if test='${backVisit.VISIT_RESON eq 1 }'>再访回访</c:if><c:if test='${backVisit.VISIT_RESON eq 2 }'>正常回访</c:if><c:if test='${backVisit.VISIT_RESON eq 3 }'>其他回访</c:if>"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" <c:if test='${backVisit.VISIT_RESULTS eq 0 }'>style="display:none"</c:if><c:if test='${backVisit.VISIT_RESULTS eq 1 }'>style="display:"</c:if> id="trDis">
			<td>是否在回访： </td>
			<%--2011/12/9 Yang Yun 修改 备注/建议 栏为文本域 and 新增 显示图片 start --%>
			<td colspan="7"><input  type="text" style="height:25px" readonly="readonly" value="<c:if test='${backVisit.IS_BACKVISIT eq 0 }'>是</c:if><c:if test='${backVisit.IS_BACKVISIT eq 1 }'>否</c:if>"></td>
			<%--
			<td>备注/建议： </td>
			<td colspan="6"><input type="text" style="height:25px" name="visit_note" id="visit_note" size="70px" value="${backVisit.VISIT_NOTE }" readonly="readonly"></td>
			 --%>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">备注/建议： </td>
			<td colspan="7"><textarea rows="4" cols="170" id="visit_note" readonly="readonly">${backVisit.VISIT_NOTE }</textarea></td>
		</tr>
		<c:if test="${backVisit.imgList != null }">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>图片</td>
			<td colspan="7"><table align="left" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">图片名称</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">附件名</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">查看</th>
				</tr>
				<c:forEach items="${backVisit.imgList }" var="img" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>${index.count}</td>
						<td>${img.TITLE}</td>
						<td>${img.IMAGE_NAME }</td>
						<td><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${img.IMAGE_NAME }&path=${img.PATH }&bootPath=backVisitImage'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看" name="showRentFile"></a></td>
					</tr>
				</c:forEach>
				</table>
			</td>
			</tr>
		</c:if>
		<%--2011/12/9 Yang Yun 修改 备注/建议 栏为文本域 end --%>
		</c:forEach>
		<tr>
			<td colspan="8"><div align="center"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</body>
</html>