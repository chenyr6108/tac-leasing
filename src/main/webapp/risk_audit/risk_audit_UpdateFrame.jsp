<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>现场调查报告审核</title> 
			<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css"> 
		<script type="text/javascript"> 
		
		
    function selectTag(cnt){ 
    	if(cnt==0){
    		loadEquipmentTypes();
    	}
		// 操作标签 
		var tag = document.getElementById("tags").getElementsByTagName("li"); 
		var taglength = tag.length; 
		for(i=0; i<taglength; i++){ 
			tag[i].className = ""; //初始化样式
		} 
		document.getElementById("linka"+cnt).parentNode.className = "hover"; //选中标签的样式 
		// 操作内容 
		for(i=0; j=document.getElementById("tagContent"+i); i++){ 
		  j.style.display = "none";  // 所有标签对应的内容都隐藏
		} 
		document.getElementById("tagContent"+cnt).style.display = "block"; //选中的标签对应的内容显示出来
		
		
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${showFlag});
			});
    } 
    </script>

	</head>
	<body onload="selectTag(${showFlag })">
	<c:if test="${not empty errList }">
		<script type="text/javascript">
			alert("${errList }");
		</script>
	</c:if>
	<input type="hidden" name="typeOfContract" id="typeOfContract" value="${typeOfContract}"></input>
	<input type="hidden" name="prc_id" value="${windIdeaMap.PRC_ID}">
	
		<table width="95%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="center">
			<tbody>
			
			<tr>
				<td >
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   					<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告审核</span>
   						</div>
			
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           		<div class="zc_grid_body jqgrowleft">
        		<div class="ui-state-default ui-jqgrid-hdiv ">
			
					<div  >
						<div  id="tabs">
							<ul id="tags">
								<li style="width: 100px;text-align: center;" >
									<a href="javascript:void(0)" id="linka0"
										onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditUpdate.selectRiskAuditForUpdate_zulin&credit_id=${credit_id}&prc_id=${windIdeaMap.PRC_ID}'">现场调查报告</a>			
								</li>
								<c:choose>
									<c:when test="${typeOfContract eq '3'}">
									    <li style="width: 100px;text-align: center;" >
											<a href="javascript:void(0)"  id="linka1"
												onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditUpdate.selectRiskAuditForUpdate_fen&credit_id=${credit_id}&prc_id=${windIdeaMap.PRC_ID}&typeOfContract=${typeOfContract}'">信用评分表</a>
										</li>
									</c:when>
									<c:otherwise>
										<li style="width: 100px;text-align: center;" >
											<a href="javascript:void(0)"  id="linka1"
												onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=riskAuditUpdate.selectRiskAuditForUpdate_fen&credit_id=${credit_id}&prc_id=${windIdeaMap.PRC_ID}'">测评记分表</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<div id="tagContent" >
							<div class="tagContent" id="tagContent0">
								<jsp:include page="risk_audit_zulinUpdate.jsp"></jsp:include> 
								<br/>
							</div>
							<div class="tagContent" id="tagContent1">
							    <c:choose>
									<c:when test="${typeOfContract eq '3'}">
									    <jsp:include page="risk_autit_fenUpdate_zhongChen.jsp"></jsp:include>
									</c:when>
									<c:otherwise>
										<jsp:include page="risk_autit_fenUpdate.jsp"></jsp:include>
									</c:otherwise>
								</c:choose>
								<br/>
							</div>
						</div>
					</div>
					</div>
</div>
</div>
				</td>
				
			</tr>
			</tbody>		
		</table> 

	</body>
</html>
