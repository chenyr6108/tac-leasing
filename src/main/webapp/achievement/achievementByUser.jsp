<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工业绩进度</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="员工业绩进度">

<script type="text/javascript">
		function fontStyle1(param1,param2,param3,param4) {
			document.getElementsByName("USER_LINK"+param4)[param3].style.color=param1;
			document.getElementsByName("USER_LINK"+param4)[param3].style.fontWeight=param2;
		}
		
		function achievementDetail(param) {
	        $("#user"+param).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=achievement.achievementDetail&EMP_ID="+param+"&DATE="+$("#DATE").val());
	        });
		}
		
		function achievementDetailAll() {
			var loop=document.getElementsByName("EMP_ID");
			for(var i=0;i<loop.length;i++) {
				if(loop[i].value!=-1) {
					achievementDetail(loop[i].value);
				}
			}
			
		}
</script>
</head>
	<body>
			<table cellspacing="0" cellpadding="0" border="0">
				<tr><td colspan="4" style="text-align:left;"><input type="button" value="展开所有" class="ui-state-default ui-corner-all" onclick="achievementDetailAll()" style="cursor:pointer;"><br><br></td></tr>
				<tr >
					<td style="background-color:#e8e8e8;text-align:center;width:100px;" align="center">
						<strong>序号</strong>
					</td>
					<td style="background-color:#e8e8e8;text-align:center;width:400px;" align="center">
						<strong>业务员(点击获得详细)</strong>
					</td>
					<td style="background-color:#e8e8e8;text-align:center;width:400px;" align="center">
						<strong>月目标金额(单位K)</strong>
					</td>
					<td style="background-color:#e8e8e8;text-align:center;width:300px;" align="center">
						<strong>款项笔数</strong>
					</td>
				</tr>
				<c:forEach items="${resultList}" var="item" varStatus="statusUser">
					<input type="hidden" name="EMP_ID" value="${item.EMP_ID }">
					<c:if test="${item.EMP_ID!=-1 }">
					<c:set var="MONTH_TARGET_TOTAL" value="${item.MONTH_TARGET+MONTH_TARGET_TOTAL }"/>
					<c:set var="CUST_COUNT_TOTAL" value="${item.CUST_COUNT+CUST_COUNT_TOTAL }"/>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
						${statusUser.count }
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:400px;">
						<a href="#" style="text-decoration:none;color:#222222;" onclick="achievementDetail(${item.EMP_ID })"
					 onMouseOver="fontStyle1('#2E6E9E','bold',${statusUser.count-1},${item.DEPT_ID });" onMouseOut="fontStyle1('#222222','normal',${statusUser.count-1},${item.DEPT_ID });" name="USER_LINK${item.DEPT_ID }">${item.EMP_NAME }</a>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:400px;">
						<fmt:formatNumber value="${item.MONTH_TARGET }" type="currency" pattern="#,##0"/>
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:300px;">
						${item.CUST_COUNT }
					</td>
				</tr>
					</c:if>
				<tr>
					<td style="text-align:center;" colspan="2" align="center">
						<div id="dept${item.DEPT_ID}" align="center" 
						style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
							<img src="${ctx }/images/loading.gif">
						</div>
					</td>
				</tr>
				<tr>
				<td style="text-align:center;" colspan="4" align="center">
					<div id="user${item.EMP_ID}" align="center" 
					style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
						<img src="${ctx }/images/loading.gif">
					</div>
				</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						总计
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:400px;">
						
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:400px;">
						<fmt:formatNumber value="${MONTH_TARGET_TOTAL }" type="currency" pattern="#,##0"/>
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:300px;">
						${CUST_COUNT_TOTAL }
					</td>
				</tr>
			</table>
	</body>
</html>