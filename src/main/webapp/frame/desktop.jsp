<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${ctx }/frame/script/desktop.js"></script>
		<script type="text/javascript" src="${ctx }/frame/script/FusionCharts.js"></script>
		<link type="text/css" href="${ctx }/resources/jquery/themes/base/ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx }/frame/style/desk.css" rel="stylesheet"/>
		
		<style type="text/css">
			table {font-family: 微软雅黑; }
			div {font-family: 微软雅黑; }
			span {font-family: 微软雅黑; }
			input {font-family: 微软雅黑; }
			font {font-family: 微软雅黑; }
		</style>
		
		<script type="text/javascript">
			setTimeout('myrefresh()',600000);//600000=10分钟 add by ShenQi
			function myrefresh() {//总经理董事长登录进来需要每10分钟刷新桌面 
					var emplId=<%=request.getSession().getAttribute("s_employeeId")%>;
					if(emplId==25||emplId==188||emplId==64||emplId==24||emplId==96||emplId==10
							||emplId==100||emplId==65||emplId==8||emplId==44||emplId==102||emplId==46||emplId==238||emplId==229) {
						window.location.reload();
					} else {
						
					}
				}
			
		$(function() {
			$(".column").sortable({
				connectWith: '.column', //要拖动层的列
				opacity: 0.4,			//模糊效果值
				revert: true,
				cursor: 'pointer',
				stop: saveLayout		//拖动完成后,回调函数.这里就可以通过AJAX把层的顺序保存在数据库里面
			});
			$(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header")
					.addClass("ui-widget-header ui-corner-all")
					.prepend('<span class="ui-icon ui-icon-closethick" title=\"点击删除导航\"></span>')
					.end()
				.find(".portlet-content");
	
			$(".portlet-header .ui-icon").click(function() {
				$(this).toggleClass("ui-icon-minusthick");
				$(this).parents(".portlet:first").find(".portlet-content").toggle();
			});
			$(".column").disableSelection();
			
			//保存模块排序并写入数据库
			function saveLayout(){
				var result = "";
				$.each($(".column"), function(m) {
					result += $(this).attr('id') + ":";
					$.each($(this).children(".portlet"), function(d) {
						var portlet_id = $(this).attr('id');
						if(portlet_id==""){
							portlet_id="no";
						}
						
						result += portlet_id + ":";
					});
					result += "-";
				});
				//alert(result);   // 测试
				var url= "../servlet/defaultDispatcher?__action=show.updateDask&result="+result;
				$.getJSON(url,callback);
				function callback(date){
					//alert(date.msg);
				}
			}
			// 删除一个层
			$(".portlet-header .ui-icon").click(function() {
	            var this_box=$(this).parent().parent().closest("div").remove();
	            var url= "../servlet/defaultDispatcher?__action=show.deleteDiv&name="+$(this).attr('id');
				$.getJSON(url,callback);
				function callback(date){
					alert(date.msg);
				}
  			});
			
		});
		</script>
	</head>
	<body>
		<div>
			<input type="button" value="模块添加" onclick="openAddDiv();" class="ui-state-default ui-corner-all" style="cursor: pointer;">
		</div>
		<div class="column" id="column_1" style="font-family: 微软雅黑;cursor: pointer;">
			
		</div>
		<div class="column" id="column_2" style="font-family: 微软雅黑;cursor: pointer;">
			
		</div>
		
		<div id="addDeskDiv" style="display: none;" title="模块添加">
			<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post" >
				<input type="hidden" name="__action" value="show.addDiv">
			   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		        <div class="zc_grid_body jqgrowleft">
		        <div class="ui-state-default ui-jqgrid-hdiv ">	
		        	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table1">
					</table>
		        	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table2">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
						</tr>
					</table>
					<div align="center">
						<input type="button" value="添加" onclick="addDiv();" class="ui-state-default ui-corner-all">
						<input type="button" value="关闭" onclick="closeDialog(addDeskDiv);" class="ui-state-default ui-corner-all">
					</div>
				</div>
				</div>
			</form>
		</div>
	</body>
</html>