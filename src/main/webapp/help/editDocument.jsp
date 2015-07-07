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


</script>
<title>系统帮助文档</title>
</head>
<body>
	<div id="menu_container" style="height:90%; width:98%;float: left;margin-top:2px;overflow: scroll;">
	<form action="saveHelpDocument" id="helpForm">
		<script id="editor" type="text/plain" style="width:100%;height:590px;" name="content">
				${content}
		</script>
		<input type="hidden" id="second_id" name="second_id" value="${second_id}"/>
	</form>
	</div>
	
	
</body>
<script type="text/javascript">

    //实例化编辑器
    var ue = UE.getEditor('editor');

</script>
</html>