<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<title>费用设定</title>
		<script type="text/javascript">


			function createRate(){
				var filedName = $("#create_filed_name").val() ;
				var showName = $("#create_show_name").val() ;

				if(filedName == null || filedName==""){
					alert("名称不能为空") ;
					return  false;
				}
				if(showName == null || showName==""){
					alert("显示名称不能为空") ;
					return ;
				}
				
//				var item = $(":is_leaserze_cost:checked"); 
//			      var len=item.length; 
//			      if(len==0){ 
//			    	  alert("请选择是否算入概算成本") ;
//		            return ;
//			      } 	
				
				$("#form").submit();
				
			}
			
			function valueIsDouble(value){
				value=value+"";
			    var m=/^(\d)+(.){1}(\d)+$/;
			    value = value.replace(/,/g, '');	
				if(new Number(value)>=0&&(value.match(m)||valueIsNumberx(value)))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			function deleteFeeConfig(id,filedName){
				if(id == null || id==""){
					alert("ID为空") ;
					return false;
				}
				if(filedName == null || filedName==""){
					alert("名称不能为空") ;
					return false;
				}
				if(confirm("确定要删除么？")){
					$.ajax({
						type:'post' ,
						url:'../servlet/defaultDispatcher',
						data:'__action=moneyRate.deleteFeeConfig&id='+id,
						dataType:'json',
						async: false,
						success: function(dataBack){
							location.href='../servlet/defaultDispatcher?__action=moneyRate.queryFeeAll';		
						},
						error:function(callback){
							alert("error!");
							return false;
						}
					});
				}				
			}
		</script>
	</head>
	<body >
		<form name="form" id="form" method="post" action="../servlet/defaultDispatcher?__action=moneyRate.createFeeConfig" >
		
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;费用设定</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							显示名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							是否算入概算成本
						</th>					
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<c:forEach items="${feeList}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">&nbsp;${status.count }</td>
							<td style="text-align: center;">&nbsp;${item.CREATE_FILED_NAME }</td>
							<td style="text-align: center;">&nbsp;${item.CREATE_SHOW_NAME }</td>
							<td style="text-align: center;">&nbsp;<c:if test="${not empty item.IS_LEASERZE_COST}"><c:choose><c:when test="${item.IS_LEASERZE_COST eq 1}">是</c:when><c:otherwise>否</c:otherwise></c:choose></c:if></td>
							<td style="text-align: center;"><input class="ui-state-default ui-corner-all" type="button" value="删除" onclick="deleteFeeConfig('${item.ID}','${item.CREATE_FILED_NAME}')"/>&nbsp;</td>
						</tr>
					</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">增加</td>
						<td style="text-align: center;"><input type="text" name="create_filed_name" id="create_filed_name"/></td>
						<td style="text-align: center;"><input type="text" name="create_show_name" id="create_show_name"/></td>
						<td style="text-align: center;">是否计入TR收入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="is_leaserze_cost" id="is_leaserze_cost" value="1" checked="checked" >&nbsp;&nbsp;是 &nbsp;&nbsp;<input type="radio" name="is_leaserze_cost" id="is_leaserze_cost" value="0">&nbsp;&nbsp;否&nbsp;&nbsp;</td>
						<td style="text-align: center;"><input class="ui-state-default ui-corner-all" type="button" value="增加" onclick="createRate();"/></td>
					</tr>
					</table>
					<table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作人
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作时间
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
							备注
						</th>
						<c:forEach items="${feeSetLog}" var="item" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count }&nbsp;</td>
							<td style="text-align: center;">${item.NAME }&nbsp;</td>
							<td style="text-align: center;">${item.CREATE_DATE }&nbsp;</td>
							<td style="text-align: center;" colspan="4">${item.MEMO }&nbsp;</td>
						</tr>
						</c:forEach>
				</table>				
</div>
</div>
</div>
</form>
</body>
</html>