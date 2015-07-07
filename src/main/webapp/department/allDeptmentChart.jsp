<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="/common/taglibs.jsp" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>部门结构图</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
		<script type="text/javascript" src="${ctx }/department/js/orgChart/ECOTree.js"></script>
		<link type="text/css" rel="stylesheet" href="${ctx }/department/js/orgChart/ECOTree.css" />
		<xml:namespace ns="urn:schemas-microsoft-com:vml" prefix="v"/>
		<style>v\:*{ behavior:url(#default#VML);}</style> 
		<style>
			.copy {
				font-family : "Verdana";				
				font-size : 10px;
				color : #CCCCCC;
			}	
		</style>	
		<script>
			var myTree = null;
			
			function CreateTree() {
				myTree = new ECOTree('myTree','myTreeContainer');	
				myTree.config.colorStyle = ECOTree.CS_LEVEL;
				myTree.config.nodeFill = ECOTree.NF_FLAT;
				myTree.config.useTarget = false;
				myTree.config.selectMode = ECOTree.SL_NONE;
				myTree.config.defaultNodeWidth = 75;
				myTree.config.defaultNodeHeight = 40;
				myTree.config.iSubtreeSeparation = 40;
				myTree.config.iSiblingSeparation = 45;
				myTree.config.iLevelSeparation = 50;
				
				 <c:forEach items="${departmentList}" var="department">
						<c:choose>
							<c:when test="${department.LEVEL == 1}">
								myTree.add(${department.R },-1,'${department.DEPT_NAME}');								
							</c:when>
							<c:when test="${department.LEVEL == 2}">
								<c:forEach items="${departmentList}" var="department2">
									<c:choose>
										<c:when test="${department.PARENT_ID == department2.ID}">
											myTree.add(${department.R },${department2.R },'${department.DEPT_NAME }');
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:when test="${department.LEVEL == 3}">
								<c:forEach items="${departmentList}" var="department3">
									<c:choose>
										<c:when test="${department.PARENT_ID == department3.ID}">
											myTree.add(${department.R },${department3.R },'${department.DEPT_NAME }');
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:when test="${department.LEVEL == 4}">
								<c:forEach items="${departmentList}" var="department4">
									<c:choose>
										<c:when test="${department.PARENT_ID == department4.ID}">
											myTree.add(${department.R },${department4.R },'${department.DEPT_NAME }');
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:when test="${department.LEVEL == 5}">
								<c:forEach items="${departmentList}" var="department5">
									<c:choose>
										<c:when test="${department.PARENT_ID == department5.ID}">
											myTree.add(${department.R },${department5.R },'${department.DEPT_NAME }');
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:forEach>	
				myTree.UpdateTree();
			}			
		</script>	
	</head>   
	<body onload="CreateTree();">
	<center>
			<div id="myTreeContainer" style="text-align:center">
			</div>
	</center>
	</body>
</html>
