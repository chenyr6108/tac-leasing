$(function(){
	$("#tabs-assets .tabs-assets-tab").tabs();
 
	loadPie = function(){
		chart1 = new FusionCharts("charts/Pie3D.swf", "ChartId", "99%", "99%", "0", "0");
		chart1.setDataURL("data/wujifenlei_zong_jine.xml");
		chart1.render("fusionCharts");
		chart = new FusionCharts("charts/MSLine.swf", "ChartId", "99%", "250", "0", "0");
		chart.setDataURL("data/wujifenlei100.xml");
		chart.render("fusionCharts2");
		chart = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "250", "0", "0");
		chart.setDataURL("data2/wujifenlei00.xml");
		chart.render("fusionCharts3");
		chart = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "250", "0", "0");
		chart.setDataURL("data3/wujifenlei00.xml");
		chart.render("fusionChartshengxiang");
	};
	loadColumn = function(){
		chart1 = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "99%", "0", "0");
		chart1.setDataURL("data/incomingdivison.xml");		   
		chart1.render("fusionCharts");
	};
	loadPie();
	$("#tabs-assets-lnk-view1").click(loadPie);
	$("#tabs-assets-lnk-view2").click(loadColumn);
	$.get('menu-content.html', function(data){ // grab content from another page
		$('#flyout').menu({ content: data ,crumbDefaultText: '请选择一个项目：',topLinkText:"融资租赁公司",maxHeight:230,backLink: false});
	});

	fgMenuClick = function(obj){
		var lnk = $(obj);
		var sideMap = $("#sideMap").empty();
		$("<span>").css({float:"left","margin-top":"3px"}).addClass("ui-icon").addClass("ui-icon-triangle-1-e").html(" ").appendTo(sideMap);
		var selectedNode = $("<a>").html(lnk.text())
			.attr("class","fg-button ui-widget ui-state-default ui-corner-all")
			.attr("href","javascript:void(0);").css({float:"left"})
			.appendTo(sideMap);
		
		lnk.parents(".positionHelper ul").each(function(){
			var prev = $(this).prev("a");
			if(prev.size()){
				selectedNode = $("<span>").css({float:"left","margin-top":"3px"}).addClass("ui-icon").addClass("ui-icon-triangle-1-e").html(" ").insertBefore(selectedNode);
				selectedNode = $("<a>").css({float:"left"}).html(prev.text())
					.attr("class","fg-button ui-widget ui-state-default ui-corner-all")
					.attr("href","javascript:void(0);")
					.insertBefore(selectedNode);
			}
		});
		
	};
});

$(function(){
	$("#tabs-project .tab-detial").tabs();
	$("#tabs-project .tabs-project-list tr.line").click(function(){
		$(this).siblings(".detial").hide();
		$(this).next().show();
	});
	
	$("#tabs-project .tabs-project-list tr.detial:first").show();

	$(".tabs-project-lnk-analysis").click(function(){
		$("<div>")
		.append($("<iframe>").addClass("analysis").attr("src","R-2-2.html"))
		.dialog({
			title:"趋势分析",
			width:900,
			height:400,
			open:function(){
				$("<div>").html(
									'<div align=\"center\" style=\"float:left;width:100%;height: 99%;margin: 1% 0 0 1%;\">'
									+'					 <div id=\"tabs-core\" style=\"float: left; width: 97%;;margin: 1%;\">'
									+'				<ul>'
									+'					<li><a href=\"#tabs-1\">对比图</a></li>  '
									+'					<li><a href=\"#tabs-2\">线性图</a></li> '
									+'				</ul>'
									+'				<div id=\"tabs-1\"> ' 
									+'					 <div id=\"fusionChartsR22x\"></div>'
									+'				</div> '
									+'				<div id=\"tabs-2\"> '
									+'				 五级分类 <input type=\"radio\" name=\"fenlei\" value=\"1\" onchange=\"changeFeiLei()\"> 正常'
									+'					 <input type=\"radio\" value=\"2\" name=\"fenlei\"  onchange=\"changeFeiLei()\"> 关注'
									+'					 <input type=\"radio\" value=\"3\" name=\"fenlei\"   onchange=\"changeFeiLei()\"> 次级'
									+'					 <input type=\"radio\" value=\"4\"  name=\"fenlei\"  onchange=\"changeFeiLei()\"> 可疑'
									+'					 <input type=\"radio\" value=\"5\" name=\"fenlei\"   onchange=\"changeFeiLei()\"> 损失'
									+'					  <div id=\"fusionChartsR22d\">'
									+'				</div>'
									+'			</div>'
									+'				</div> '
									+'			</div>');
				$("<div>").addClass("zoomFrameBgIframe").appendTo("body").show();
				 chart1 = new FusionCharts("charts/MSLine.swf", "ChartId", "99%", "250", "0", "0");
			chart1.setDataURL("data/wujifenlei101.xml");
			chart1.render("fusionChartsR22x"); 
			chart1 = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "250", "0", "0");
			chart1.setDataURL("data2/wujifenlei01.xml");
			chart1.render("fusionChartsR22d"); 
			},
			close:function(){
				$(".zoomFrameBgIframe").remove();
			}
		});
	});
});

function changeFeiLei(){
		var v1=0;
		fenlei=document.getElementsByName("fenlei");
		for(i=0;i<fenlei.length;i++){
			if(fenlei[i].checked==true){
				v1=fenlei[i].value;
			}
		}
		var v2=0;
		bili=document.getElementsByName("bili");
		for(i=0;i<bili.length;i++){
			if(bili[i].checked==true){
				v2=bili[i].value;
			}
		} 
		var v3=0;
		division=document.getElementsByName("division");
		for(i=0;i<division.length;i++){
			if(division[i].checked==true){
				v3=division[i].value;
			}
		} 
	    chart = new FusionCharts("charts/MSLine.swf", "ChartId", "99%", "250", "0", "0");
	  //chart.setDataURL("data/wujifenlei100.xml");  
		chart.setDataURL("data/wujifenlei"+v1+v2+v3+".xml");
		chart.render("fusionCharts2"); 
		chart = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "250", "0", "0");
		//chart.setDataURL("data2/wujifenlei00.xml");
		//chart.setDataURL("data2/wujifenlei"+v2+v3+".xml");
		chart.render("fusionCharts3");
		chart = new FusionCharts("charts/StackedColumn3D.swf", "ChartId", "99%", "250", "0", "0");
		chart.setDataURL("data3/wujifenlei0"+v2+".xml");
		chart.render("fusionChartshengxiang");
}

function changeTotal(){
		var v2=0;
		bili=document.getElementsByName("bili");
		for(i=0;i<bili.length;i++){
			if(bili[i].checked==true){
				v2=bili[i].value;
			}
		} 
		if(v2==1){
			chart1 = new FusionCharts("charts/Pie3D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("data/wujifenlei_zong_geshu.xml");
			chart1.render("fusionCharts");
		}else{
			chart1 = new FusionCharts("charts/Pie3D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("data/wujifenlei_zong_jine.xml");
			chart1.render("fusionCharts");
		}
}

function changeBili2(){
	var v2=0;
		bili=document.getElementsByName("bili2");
		for(i=0;i<bili.length;i++){
			if(bili[i].checked==true){
				v2=bili[i].value;
			}
		} 
		if(v2==1){
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/gongchengqizhong1.xml");
			chart1.render("fusionCharts1"); 
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/jianzhuqizhong1.xml");
			chart1.render("fusionCharts22");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/hunningtu1.xml");
			chart1.render("fusionCharts33");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/shanghai1.xml");
			chart1.render("fusionCharts4");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/tufang1.xml");
			chart1.render("fusionCharts5");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/zhuanche1.xml");
			chart1.render("fusionCharts6");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/luji1.xml");
			chart1.render("fusionCharts7");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/huanwei1.xml");
			chart1.render("fusionCharts8");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/jiamengchang1.xml");
			chart1.render("fusionCharts9");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/xiaofang1.xml");
			chart1.render("fusionCharts10");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/zaizhizaozhongxin1.xml");
			chart1.render("fusionCharts11");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/huataizhonggong1.xml");
			chart1.render("fusionCharts12");
		}else{
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/gongchengqizhong.xml");
			chart1.render("fusionCharts1"); 
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/jianzhuqizhong.xml");
			chart1.render("fusionCharts22");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/hunningtu.xml");
			chart1.render("fusionCharts33");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/shanghai.xml");
			chart1.render("fusionCharts4");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/tufang.xml");
			chart1.render("fusionCharts5");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/zhuanche.xml");
			chart1.render("fusionCharts6");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/luji.xml");
			chart1.render("fusionCharts7");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/huanwei.xml");
			chart1.render("fusionCharts8");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/jiamengchang.xml");
			chart1.render("fusionCharts9");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/xiaofang.xml");
			chart1.render("fusionCharts10");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/zaizhizaozhongxin.xml");
			chart1.render("fusionCharts11");
			chart1 = new FusionCharts("charts/Pie2D.swf", "ChartId", "99%", "99%", "0", "0");
			chart1.setDataURL("division/data/huataizhonggong.xml");
			chart1.render("fusionCharts12");
		}
}


function changeDivision(){
		var v1=0;
		bili=document.getElementsByName("bili2");
		for(i=0;i<bili.length;i++){
			if(bili[i].checked==true){
				v1=bili[i].value;
			}
		} 
		var v2=0;
		bili=document.getElementsByName("division2");
		for(i=0;i<bili.length;i++){
			if(bili[i].checked==true){
				v2=bili[i].value;
			}
		} 
		window.open("R-2-2.html","_blank");
}
 
 

function changeDivision3(){ 
		window.open("R-3-3.html","_blank");
}

