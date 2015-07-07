<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>供应商供货产品管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ctx}/product/supplierEquipment/js/suplEquipment.js"></script>
<script type="text/javascript">
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 }
showMsg = function(id) {	                                                                                                                                                     
	window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.getSuplEquipmentById&sueq_id="+id;
}
updateMsg = function(id) {
	window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.getSuplEquipmentUpdDetail&sueq_id="+id;
}
var equCount = 0;
//查看该供应商在设备库中提供的设备
			function isHaveSuplEqu(id){
				$.ajax({
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=suplEquipment.getCount&sueq_id=' + id,
					dataType:'json',
					async: false,
					success: function(dataBack){		
					equCount = dataBack.count;	
					},
					error:function(callback){
						alert("error!");
						return;
					}
				});
			}
deleteMsg = function(id) {
	if(checkCreditExist('SUEQ',id)){
		isHaveSuplEqu(id);
		if(equCount == 0) {
			if(confirm('您确定要删除此供应商提供的产品吗？')){
				window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.deleteSuplEquipmentById&sueq_id="+id;
			}else{
				return false;
			}
		}else{
			alert("该设备在设备表中有，不能删除！！");
			return false;
		}
	}
}
addMsg = function() {
	window.location.href="${ctx}/product/supplierEquipment/suplEquipmentAdd.jsp";
}
doSearch1=function(){
	var content= $("#content").val();
	    window.location.href="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.findAllSuplEquipment";
}
//检查是否关联到报告
	function checkCreditExist(type,id){
		var str = '' ;
		if(type == "SUEQ"){
			str = "供应商产品" ;
		} else if(type == "SUPPL"){
			str = "供应商" ;
		} else if(type == "TYPE"){
			str = "制造商" ;
		} else if(type == "PRODUCT"){
			str = "产品型号" ;
		} else if(type == "KIND"){
			str = "产品名称" ;
		} 
		var flag = true ;
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=suplEquipment.checkCreditExist&checkType="+type+"&ID="+id,
			dataType:"json",
			async: false,
			success:function(dataBack){
				if(dataBack.count == 1){
					alert("该"+str+"已关联案件不能进行操作！") ;
					flag = false ;
				} else if(dataBack.count == 2){
					if(!confirm("该"+str+"已关联案件是否继续操作？")){
						flag = false ;
					}
				}
			},
			error:function(error){
				alert("error") ;
			}
		});
		return flag ;
	}
</script>

</head>
<body> 

	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" name="searchForm" id="form1"  method="post" style="align:center">
		<input type="hidden" name="__action" value="suplEquipment.findAllSuplEquipment" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商产品</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="770" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="90">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table></div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td><input type="button" onclick="addMsg()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加"></td>
				<td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">供应商</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">供应设备</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
				<!--
				<th class="ui-state-default ui-th-ltr zc_grid_head">库存</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">二手设备</th>
				-->
				<th class="ui-state-default ui-th-ltr zc_grid_head">指导价</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">出厂价</th>
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">单位</th>
			<!--  	<th class="ui-state-default ui-th-ltr zc_grid_head">创建人</th>  -->
				<th class="ui-state-default ui-th-ltr zc_grid_head">使用年限</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>${status.count }</td>
					<td style="text-align: center;">${result.SUPPLIER_NAME } &nbsp;</td>
					<td style="text-align: center;">${result.PRODUCT_NAME } &nbsp;</td>
					<td style="text-align: center;">${result.KIND_NAME } &nbsp;</td>
					<!--
					<td style="text-align: center;">${result.STOCK }</td>
					<td style="text-align: center;"><c:if test="${result.SECOND_HAND eq 0}">否</c:if><c:if test="${result.SECOND_HAND eq 1}">是</c:if></td>
					-->
					<td style="text-align: right;"><c:if test="${result.GUIDANCE_PRICE gt 0 }"> <fmt:formatNumber value="${result.GUIDANCE_PRICE }" type="currency" /> </c:if> &nbsp;</td>
					<td style="text-align: right;"> <c:if test="${result.EX_FACTORY_PRICE gt 0 }"> <fmt:formatNumber value="${result.EX_FACTORY_PRICE }" type="currency" /> </c:if> &nbsp;</td>
					<td style="text-align: center;"><c:if test="${result.UNIT eq 0}">台</c:if><c:if test="${result.UNIT eq 1}">件</c:if><c:if test="${result.UNIT eq 2}">辆</c:if>  &nbsp;</td>
				<!-- <td style="text-align: center;">${result.CREATE_PERSON }</td>  -->
					<td style="text-align: center;"> <c:if test="${result.USEEXPIRE gt 0 }"> ${result.USEEXPIRE} </c:if> &nbsp;</td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="showMsg('${result.SUEQ_ID}')">查看</a> <a href="javascript:void(0)" onclick="updateMsg('${result.SUEQ_ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteMsg('${result.SUEQ_ID}')">删除</a>  &nbsp;</td>				
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