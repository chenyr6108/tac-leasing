
//折线图
function lineBasic(div,data,labels,val) {
	new iChart.LineBasic2D({
		
		render : div, // 渲染目标
		data : data,// 数据源
		width : 1024, // 图表宽度
		height : 300, // 图表高度
		animation : true,
		dunration_animation_dunration : 200,// 动画
		background_color:'#EEEEFF',
		border:{
			enable:true,
			color:'black',
			width:1,
			radius:10
			},
		title : {
			font:'微软雅黑',
			text : val[0].title,
			fontsize : 28,
			color : 'black'
		},
		sub_option : {
			limit_y : true,
			label : false,
			hollow:false,
			hollow_inside:false, 
			//smooth : true,\\平滑曲线
			point_size : 10
		},
		coordinate : {
			width : 1024,
			height : 400,
			grid_color : '#cccccc',
			axis : {
				color : '#cccccc',
				width : [ 0, 0, 2, 2 ]
			// 例如:(上-右-下-左).(默认为1)
			},
			grids : {
				vertical : {
					way : 'share_alike',
					value : 11
				// 网格
				}
			},
			// 刻度的配置项
			scale : [ {
				position : 'left',
				label : {
					color : 'black',
					fontsize : 11
				},
				scale_color : '#9f9f9f',
				listeners : {
					parseText : function(t, x, y) {
						// 自定义左侧坐标系刻度文本的格式。
						if(val[0].yIsFormat){
							var moy = formatCurrency(t, false);
							return {
								text : moy
							}
						}else{
							return {
								text : t
							}
						}
						
					}
				}
			}, {
				position : 'bottom',
				label : {
					color : 'black',
					fontsize : 11
				},
				labels : labels
			} ]
		},
		// 十字线的配置
		crosshair : {
			enable : true,
			line_color : '#62bce9'
		},
		tip : {
			enable : true,
			listeners : {
				// tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
				parseText : function(tip, name, value, text, i) {
					if(val[0].tipIsFormat){
						var moy = formatCurrency(value, true);
						return name + val[0].childTitle + moy;
					}else{
						return name + val[0].childTitle + value;
					}
					
				}
			}
		},
		// 上、右 图例说明
		legend : {
			sign_size : 15, // 图例中小图标的大小(默认为10)
			enable : true,
			row : 1,// 设置在一行上显示，与column配合使用
			column : 'max', // 图例的列数。(默认为1) 如果设置为'max',则其依赖配置项row
			valign : 'top',
			sign : 'bar',
			background_color : null,// 设置透明背景
			offsetx : -100,// 设置x轴偏移，满足位置需要
			offsety : -10,// 设置x轴偏移，满足位置需要
			border : true,
			fontsize : 15
		}
	}).draw();
}

// 格式化
function formatCurrency(num, key) {
	num = num.toString().replace(/\$|\,/g, '');
	if (isNaN(num))
		num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num * 100 + 0.50000000001);
	cents = num % 100;
	num = Math.floor(num / 100).toString();
	if (cents < 10)
		cents = "0" + cents;
	for ( var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
		num = num.substring(0, num.length - (4 * i + 3)) + ','
				+ num.substring(num.length - (4 * i + 3));
	if (key) {
		return (((sign) ? '' : '-') + num + '.' + cents);
	} else {
		return (((sign) ? '' : '-') + num);
	}
}