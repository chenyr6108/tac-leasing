<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>帐户管理</title>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script>
		<script src="${ctx }/permission/js/selectCard.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
		</script>
		<script type="text/javascript">
			$(function() { 
				$("#selectall1").click(function() { 
					if ($(this).attr("checked") == true) { 						// 全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids1']").each(function() { 
					   $(this).attr("checked", true); 
					  }); 
					} else { 													// 取消全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids1']").each(function() { 
					   $(this).attr("checked", false); 
					  }); 
					} 
				}); 
				$("#selectall2").click(function() { 
					if ($(this).attr("checked") == true) { 						// 全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids2']").each(function() { 
					   $(this).attr("checked", true); 
					  }); 
					} else { 													// 取消全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids2']").each(function() { 
					   $(this).attr("checked", false); 
					  }); 
					} 
				}); 
				$("#selectall3").click(function() { 
					if ($(this).attr("checked") == true) { 						// 全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids3']").each(function() { 
					   $(this).attr("checked", true); 
					  }); 
					} else { 													// 取消全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids3']").each(function() { 
					   $(this).attr("checked", false); 
					  }); 
					} 
				}); 
				$("#selectall4").click(function() { 
					if ($(this).attr("checked") == true) { 						// 全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids4']").each(function() { 
					   $(this).attr("checked", true); 
					  }); 
					} else { 													// 取消全选 
					   //$(":checkbox").each( function() { 						//可以对.net服务器控件有效 
					   $("input[name='ids4']").each(function() { 
					   $(this).attr("checked", false); 
					  }); 
					} 
				}); 
			}); 
			function doSubmits(){
				var s = $("input[@name='ids1'][checked]");
				if(s.length>0){
					$("#form1").submit();
				} else {
					return alert("对不起，您未选取，请至少选择一项");
				}
				var s = $("input[@name='ids2'][checked]");
				if(s.length>0){
					$("#form1").submit();
				} else {
					return alert("对不起，您未选取，请至少选择一项");
				}
				var s = $("input[@name='ids3'][checked]");
				if(s.length>0){
					$("#form1").submit();
				} else {
					return alert("对不起，您未选取，请至少选择一项");
				}
				var s = $("input[@name='ids4'][checked]");
				if(s.length>0){
					$("#form1").submit();
				} else {
					return alert("对不起，您未选取，请至少选择一项");
				}
				
			}
		</script>
	</head>
	<body>
	
	<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">已包含资源</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">未包含资源</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">已包含用户</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-4" onclick="selectCard(3)">未包含用户</a></li>
		</ul>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="${__action }" />
			<input type="hidden" id="id" name="id" value="${role.ID }" />
			<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }" /><br>
			<div>
				<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="doSubmits();" value="${msg }" class="ui-state-default ui-corner-all"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
		<div id="tabs-1">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%"><input type="checkbox" id="selectall1"></th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">资源类型</th>
									<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">层次</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="20%">资源名称</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="50%">资源地址</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">操作</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;"><input type="checkbox" name="ids1" value="${item.ID }"></td>
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">&nbsp;<c:choose><c:when test="${item.PARENT_ID eq 0}">一级菜单</c:when><c:otherwise>二级菜单</c:otherwise></c:choose></td>
									<td style="text-align: center;">${item.LEVEL_NUM }&nbsp;</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.LAYOUT }&nbsp;</td>	
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="invalidResource(${item.ID });">删除</a></td>
								</tr>
								</c:forEach>				
							</tbody>
						</table>
						
		</div>
	<!-- endone -->
		<div id="tabs-2">	
		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%"><input type="checkbox" id="selectall2"></th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="5%">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">资源类型</th>
									<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">层次</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="20%">资源名称</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="50%">资源地址</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">操作</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;"><input type="checkbox" name="ids2" value="${item.ID }"></td>
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">&nbsp;<c:choose><c:when test="${item.PARENT_ID eq 0}">一级菜单</c:when><c:otherwise>二级菜单</c:otherwise></c:choose></td>
									<td style="text-align: center;">${item.LEVEL_NUM }&nbsp;</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.LAYOUT }&nbsp;</td>	
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="validResource(${item.ID });">添加</a></td>
								</tr>
								</c:forEach>	
							</tbody>
						</table>
						
		</div>
	<!-- endone -->
		<div id="tabs-3">	
		
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%"><input type="checkbox" id="selectall3"></th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="12%">用户名</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="17%">姓 名</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="30%">所在部门</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="19%">职位</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">操作</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;"><input type="checkbox" name="ids3" value="${item.ID }"></td>
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.CODE }</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.DEPT_NAME }&nbsp;</td>	
									<td style="text-align: center;"><c:forEach items="${jobList}" var="items" varStatus="status"><c:if test="${item.JOB eq items.CODE}">${items.FLAG}</c:if></c:forEach>&nbsp;</td>	
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="invalidUser2Role(${item.ID });">删除</a></td>
								</tr>
								</c:forEach>	
							</tbody>
						</table>
						
	</div>
	<!-- endone -->
	<div id="tabs-4">	
	
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%"><input type="checkbox" id="selectall4"></th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="8%">编 号</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="12%">用户名</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="17%">姓 名</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="30%">所在部门</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="19%">职位</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="10%">操作</th>
								</tr>
							</thead>
							<tbody id="tbodyUnselected">
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;"><input type="checkbox" name="ids4" value="${item.ID }"></td>
									<td style="text-align: center;">${status.count }&nbsp;</td>
									<td style="text-align: center;">${item.CODE }</td>
									<td style="text-align: center;">${item.NAME }&nbsp;</td>
									<td style="text-align: center;">${item.DEPT_NAME }&nbsp;</td>	
									<td style="text-align: center;"><c:forEach items="${jobList}" var="items" varStatus="status"><c:if test="${item.JOB eq items.CODE}">${items.FLAG}</c:if></c:forEach>&nbsp;</td>	
									<td style="text-align: center;"><a href="javaScript:void(0)" onclick="validUser2Role(${item.ID });">添加</a></td>
								</tr>
								</c:forEach>	
							</tbody>
						</table>
					</div>
				<%@ include file="/common/pageControl.jsp"%>
					</div>
				</div>
			</div>		
		</form>
</div>
	</body>
</html>