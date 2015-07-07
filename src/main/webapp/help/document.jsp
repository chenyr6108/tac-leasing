<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/style.css"></link>
<!--[if IE 7]><link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/ie7.css"></link><![endif]-->
<script type="text/javascript" src="../resources/jquery/plugins/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="../resources/jquery/plugins/bean.jquery.auto-windows.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
<link type="text/css" rel="stylesheet" href="../frame/style/style.css"></link>
<link type="text/css" rel="stylesheet" href="../frame/style/tab-button.css"></link>
<link type="text/css" rel="stylesheet" href="../frame/style/menu.css"></link>
<script type="text/javascript" src="../frame/script/script.js"></script>
<script type="text/javascript" src="../frame/script/tab-manager.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/help/js/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx }/help/js/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${ctx }/help/js/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	function submitHelpForm(){
		var second_id =  $("#second_id").val();
		if(second_id==""){
			alert("请先选择要绑定的菜单！");
			return;
		}
		var  params = $("#helpForm").serialize();
		$.ajax({
			type:'post',
			url:'${ctx}/servlet/defaultDispatcher?__action=helpCommand.saveHelpDocument',
			data:params,
			dataType:'json',
			success:function(dataBack){ 
				if(dataBack){
					alert("保存成功！");
				}			
			}
		});	
	}
	function selectMenu(second_id){

		$("#second_id").val(second_id);
		$.ajax({
			type:'post',
			url:'${ctx}/servlet/defaultDispatcher?__action=helpCommand.getHelpDocumentByParams&second_id='+second_id,
			dataType:'json',
			success:function(dataBack){ 
				if(dataBack.content!=null){
					ue.setContent(dataBack.content);
				}else{
					ue.setContent("");
				}
				
			}
		});	
	}

</script>
<title>帮助文档</title>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;帮助文档</span>
  	</div>
	<div style="height:90%; width:20%;float: left;">
		<div id="page_menu" style="height:580px; width:230px; margin-top:2px; padding:4px 2px;" class="ui-state-default">
			<div id="menu_container" style="height:100%; max-height:590px; width:98%;">
				<c:forEach items="${allMenuList}" var="item">
					<div>
						<div class="item type">
							<span class="collapsed"></span><b style="font-family:微软雅黑;font-size:12px;font-weight:bold;">${item.first_name }</b>
						</div>
						<div class="childs">
							<c:forEach items="${item.secondMenuView}" var="item2">
								<c:if test="${item2.second_level_num != '-1'}">
									<div class="item" style="font-family:微软雅黑;font-size:12px; font-weight:normal;" onclick="selectMenu(${item2.second_id })">${item2.second_name }</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="menu_container" style="height:90%; width:75%;float: left;margin-top:2px;overflow: scroll;">
	<form action="saveHelpDocument" id="helpForm">
		<script id="editor" type="text/plain" style="width:100%;height:590px;" name="content">
				
		</script>
		<input type="hidden" id="second_id" name="second_id" />
	</form>
	</div>
	
	
</body>
<script type="text/javascript">

    //实例化编辑器
    var ue = UE.getEditor('editor');

</script>
</html>