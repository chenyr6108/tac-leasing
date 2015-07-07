$(function(){

	var iframeContainer = $("#iframe_container"),
		tabContainer$tabs = $("#tab_container .tabs"),
		tempTabId = 0,tabHistroy="=",currTab;
	
	function openTab(config){
		config = typeof config=="string"?{location:config}:config;
		
		var flag=true;
	       
		//比对已打开tab的title，如已打开 则切换至原先的tab，否则新开tab。
       tabContainer$tabs.find("table.btnTab").each(function() {
           if(config.tabName=="租金分解(新)"||config.tabName=="分解确认(新)") {
        	   if($(this).attr("title")==config.tabName&&employeeId!=161) {
        		   flag=false;
        	   }
           }
       });
       if(flag) {
			var c = $.extend({
				tabId:"tab",
				width:"100px",
				tabName:"",
				tabDesc:undefined,
				noClose:false,
				content:"",
				location:"",
				side:"workspace"
			},config);
			
			tabContainer$tabs.find("table.btnTab").each(function(){
				if($(this).data("tabId")==c.tabId){
					c.tabId = c.tabId+(tempTabId++);
				}
			});
			
			var content = c.location?$("<iframe>").attr("frameBorder",0).attr("border",0).attr("name",c.tabId).attr("src",c.location+(c.location.indexOf("?")==-1?"?":"&")+new Date().getTime()+"&__second_id="+c.second_id):c.content;
			
			var tab = $("<table>")
				.attr("cellpadding",0)
				.attr("cellspacing",0)
				.data("side",c.side)
				.data("tabId",c.tabId)
				.data("content",content)
				.data("location",c.location)
				.addClass("btnTab")
				.css("width",c.width)
				.attr("title",c.tabDesc||c.tabName)
				.append($("<tbody>").append($("<tr>")
					.append($("<td>").attr("class","td1"))
					.append($("<td>").attr("class","tdDis").append($("<nobr>").html("<font style='font-family: 微软雅黑;font-size: 13px;'>"+c.tabName+"</font>")))
					.append(c.noClose?$("<td>").attr("class","tdClose"):$("<td>").attr("class","tdClose").attr("title","关闭").append($("<a>").click(function(){closeTab($(this).parents("table.btnTab"));})))
					.append($("<td>").attr("class","td4"))
				)
			).click(function(){
				switchTab($(this));
				setSecondIdInSession(c.second_id);
			});
			tabContainer$tabs.append(tab);
			iframeContainer.append(content);
			switchTab(tab);
       }
	}
	function setSecondIdInSession(second_id){

		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher?__action=helpCommand.setSecondInSession&__second_id='+second_id,
			dataType:'json'});	
	}
	function switchTab(c){
		//如果参数为字符串，通过tabId查找选项卡对象
		c = findTab(c);
		//反选择非当前选中的选项卡
		c.siblings().removeClass("on").each(function(){
			$(this).data("content").hide();
		});
		//选择当前选中的选项卡
		c.addClass("on").data("content").show();
		//注册选项卡历史
		regTabHistory(c);
		//更新选项卡上下文菜单
		updateTabContext(c);
		//更新动态菜单
//		this.updateFrameMenu(c);
		//记住当前打开的选项卡
		currTab=c;
	}
	
	function findTab(c){
		if(typeof c == "object")return c;
		var b = null;
		tabContainer$tabs.find("table.btnTab").each(function(){
			if($(this).data("tabId")==c){
				b=$(this);
			}
		});
		return b;
	}
	
	function closeTab(c){
		c = findTab(c);
		unRegTabHistory(c);
		c.data("content").remove();
		c.remove();
		switchTab(getLastTabId());
	}
	
	function getLastTabId(){
		var tabIds = tabHistroy.split("=");
		return tabIds[tabIds.length-2];
	}

	/**
	 * 注册选项卡点击历史
	 * @param tab:当前选中的选项卡
	 */
	function regTabHistory(tab){
		//只记录workspace面板的选项卡历史
		if(tab&&tab.data("side")=="workspace"){
			var tabId = tab.data("tabId");
			tabHistroy = tabHistroy.replace(new RegExp("="+tabId.replace(/\$/g,"\\$")+"="),'=');
			tabHistroy+=(tabId+"=");
		}
	}
	
	function unRegTabHistory(tab){
		//只记录workspace面板的选项卡历史
		if(tab&&tab.data("side")=="workspace"){
			var tabId = tab.data("tabId");
			tabHistroy = tabHistroy.replace(new RegExp("="+tabId.replace(/\$/g,"\\$")+"="),'=');
		}
	}

	function updateTabContext(tab){
		//遍历所有的选项卡面板
		var showCount = Math.floor(tabContainer$tabs.width()/100);
		var size = tabContainer$tabs.find(".btnTab").size();
		if(showCount>=size){
			//如果选项卡面板可容纳的选项卡数量大于当前选项卡数量 隐藏选项卡上下文菜单按钮
			tabContainer$tabs.next().hide();
		}else{
			//否则 显示选项卡上下文菜单按钮
			tabContainer$tabs.next().show();
			
			var tabs = tabContainer$tabs.find(".btnTab");
			//如果当前选中的选项卡在可显示的范围以外
			//将当前选项卡移动到可显示范围最后
			for(var i=showCount;i<size;i+=1){
				var tab_ = $(tabs.get(i));
				if(tab_.data("tabId")==tab.data("tabId")){
					tab_.insertBefore(tabs.get(showCount-1));
				}
			}
			tabs = tabContainer$tabs.find(".btnTab");
			//清空并获得当前选项卡上下文菜单面板
			var context = tabContainer$tabs.next().find("ul").empty();
			//遍历在可显示范围以外的选项卡，并创建一个上下文菜单项
			//加入到上下文菜单面板中
			for(var i=showCount;i<size;i+=1){
				var hideTab = $(tabs.get(i));
				var li = $("<li></li>")
					.attr("title",hideTab.attr("title"))
					.html(hideTab.find("nobr").html())
					.data("tab",hideTab)
					.addClass("ui-state-default")
					.addClass("ui-corner-all")
					.click(function(){
						var _this = $(this);
						switchTab(_this.data("tab"));
					}).hover(
						function(){$(this).addClass("ui-state-hover");},
						function(){$(this).removeClass("ui-state-hover");}
					);
				//将选项卡对应的上下文菜单项赋值给选项卡自己
				//用于选项卡更新时同时更新上下文菜单项
				hideTab.data("contextTab",li);
				context.append(li);
			}
		}
	}
	function refreshTab(tab){
		tab = tab||currTab;
		tab.data("content").contents().each(function(){
			this.location=this.location.href.split("#")[0]+(this.location.href.indexOf("?")==-1?"?":"&")+new Date().getTime();
		});
	}
	$.autoWindows(function(){
		updateTabContext(currTab);
	});

	tabContainer$tabs.sortable({
		items: 'table:gt(0)',
		handle :'td',
		opacity :0.6
	}).disableSelection()
	.contextMenu('tab_context_menu',{
		onContextMenu: function(e){
			var t = $(e.target).parents(".btnTab");
			t.parents(".tabs").data("clickTab",t);
			return $(e.target).is(".btnTab *")||$(e.target).is(".btnTab");
		},onShowMenu: function(e, menu) {
			var t = $(e.target).parents(".btnTab");
			if(t.find(".tdClose > a").size()==0){
				menu.find("#tab_context_menu_close").hide();
				menu.find("#tab_context_menu_close_all").hide();
			}
			if(!t.is(".on")){
				menu.find("#tab_context_menu_refresh").hide();
			}
			if(t.find(".tdClose > a").size()!=0) {//如果是非桌面的tab,不显示返回桌面菜单 add by ShenQi
				menu.find("#tab_context_menu_back_desk").hide();
			}
	        return menu;
		},bindings:{
			tab_context_menu_refresh:function(t){
				refreshTab();
			},
			tab_context_menu_close:function(t){
				closeTab($(t).data("clickTab"));
			},
			tab_context_menu_close_all:function(t){
				$(t).find(".btnTab:gt(0)").each(function(){
					closeTab($(this));
				});
			},
			tab_context_menu_close_other:function(t){
				var tab = $(t).data("clickTab");
				$(t).find(".btnTab:gt(0)").each(function(){
					if(tab.data("tabId")!=$(this).data("tabId"))
						closeTab($(this));
				});
			},
			tab_context_menu_back_desk:function(t){//返回业务员桌面菜单选项 add by ShenQi
				var tab = $(t).data("clickTab");
				tab.data("content").contents().each(function(){
					this.location="../servlet/defaultDispatcher?__action=creditReport.creditManage&isSalesDesk=Y&"+new Date().getTime();
				});
			}
		}
	});
	window.openTab = openTab;
	
	if($("#userJob").val()==1) {
		//如果是业务,跳转业务综合页面 add by ShenQi
		openTab({tabName:"我的桌面",location:"../servlet/defaultDispatcher?__action=creditReport.creditManage&isSalesDesk=Y",noClose:true});
	} else if($("#userJob").val()==8) {
		openTab({tabName:"我的桌面",location:"../frame/desktop.jsp",noClose:true});
		//openTab({tabName:"业务桌面",location:"../servlet/defaultDispatcher?__action=creditReport.creditManage&isSalesDesk=Y",noClose:true});
	} else {
		openTab({tabName:"我的桌面",location:"../frame/desktop.jsp",noClose:true});
	}
//	openTab({tabName:"Google",location:"http://www.g.cn"});
});