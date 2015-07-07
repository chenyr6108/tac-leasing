$(document).ready(function() {
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id=1",
				dataType:"json",
				success:function(json){
				var arraylist = json;
				var htmls = "";
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='frist' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#fristLeval").append(htmls);
				},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
		});
	openAreas = function() {	
			//在调用时一定要保证这个区域是空的因为在下面的点击时这个值会被赋值 ，然后一直不变
			
			$("#area").val("");
			new PopupLayer({trigger:"#ele1",popupBlk:"#blk1",closeBtn:"#close1"});
	}
	/**在所有的区域下面单击时*/
	allAreaOneClick = function(){
		$(".frist").bind("click",function(e){
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
			var subValue = $(this).attr("value");
			$("#secondTitle").text($(this).text()+":");
			$("#area").val("");
			//当在区域列表上单击时应该弹出下面的一个层的区域 下面的回调用于第二块区域的构造
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id="+subValue,
				dataType:"json",
				success:function(json){
				$("#secondLeval").empty();
				var arraylist = json;
				var htmls = "";
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='second' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#secondLeval").append(htmls);
				},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
			
			new PopupLayer({trigger:"#fristLeval",popupBlk:"#blk2",closeBtn:"#close2",useFx:true});
			
		});
	}
	/**在所有的区域下面双击时*/
	allAreaDbClick = function(){
			$(".frist").bind("dblclick",function(){
			var areaText = $(this).text();
			$("#areaId").attr("value",$(this).attr("value"));
			$("#area").val(areaText);
			$("#blk1").css("display","none");
			$("#blk2").css("display","none");
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
		});
	}

	sub1AreaDbClick=function(){
		$(".second").bind("dblclick",function(){
			$("#areaId").attr("value",$(this).attr("value"));
			var areaText = $(this).text();
			$("#area").val(areaText);
			$("#blk1").css("display","none");
			$("#blk2").css("display","none");
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
		});
	}
	
	/**第二块下面单击时的操作*/
	sub1AreaOneClick=function(){
		$(".second").bind("click",function(e){
			var sub1Value = $(this).attr("value");
			$("#thridTitle").text($(this).text());
			$("#area").val("");
			//当在区域列表上单击时应该弹出下面的一个层的区域 下面的回调用于第二块区域的构造
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id="+sub1Value,
				dataType:"json",
				success:function(json){
				$("#thridLeavl").empty();
				var arraylist = json;
				var htmls = "";
				if (json.length<=0) {
					$("#blk3").css("display","none");
				} else {
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='thrid' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#thridLeavl").append(htmls);
				}},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
			
			new PopupLayer({trigger:"#secondLeval",popupBlk:"#blk3",closeBtn:"#close3",popupLayerClass:"t3"});
			
		});
	}

	/**单击第三个层的操作*/
	sub2AreaOneClick = function(){
		$(".thrid").bind("click",function(e){
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
			var sub2Value = $(this).attr("value");
			
			$("#fourthTitle").text($(this).text());
			$("#area").val("");
			//当在区域列表上单击时应该弹出下面的一个层的区域 下面的回调用于第四块区域的构造
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id="+sub2Value,
				dataType:"json",
				success:function(json){
				$("#fourthLeavl").empty();
				var arraylist = json;
				var htmls = "";
				if (json.length<=0) {
					$("#blk4").css("display","none");
				} else {
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='fourth' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#fourthLeavl").append(htmls);
				}},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
			
			new PopupLayer({trigger:"#thridLeavl",popupBlk:"#blk4",closeBtn:"#close4",popupLayerClass:"t4"});
			
		});
	}
	
	/**双击第三个层的操作*/
	sub2AreaDbClick = function(){
		$(".thrid").bind("dblclick",function(){
			$("#areaId").attr("value",$(this).attr("value"));
			var areaText = $(this).text();
			$("#area").val(areaText);
			$("#blk1").css("display","none");
			$("#blk2").css("display","none");
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
		});
	}


	/**单击第四个层的操作*/
	sub3AreaOneClick = function(){
		$(".fourth").bind("click",function(e){
			$("#blk6").css("display","none");
			var sub3Value = $(this).attr("value");
			$("#blk6").css("display","none");
			$("#fifthTitle").text($(this).text());
			$("#area").val("");
			//当在区域列表上单击时应该弹出下面的一个层的区域 下面的回调用于第四块区域的构造
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id="+sub3Value,
				dataType:"json",
				success:function(json){
				$("#fifthLeavl").empty();
				var arraylist = json;
				var htmls = "";
				if (json.length<=0) {
					$("#blk5").css("display","none");
				} else {
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='fifth' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#fifthLeavl").append(htmls);
				}},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
			
			new PopupLayer({trigger:"#fourthLeavl",popupBlk:"#blk5",closeBtn:"#close5",popupLayerClass:"t4"});
			
		});
	}
	
	/**双击第四个层的操作*/
	sub3AreaDbClick = function(){
		$(".fourth").bind("dblclick",function(){
			$("#areaId").attr("value",$(this).attr("value"));
			var areaText = $(this).text();
			$("#area").val(areaText);
			$("#blk1").css("display","none");
			$("#blk2").css("display","none");
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
		});
	}

	/**单击第五个层的操作*/
	sub4AreaOneClick = function(){
		$(".fifth").bind("click",function(){
			var sub4Value = $(this).attr("value");
			
			$("#sixthTitle").text($(this).text());
			$("#area").val("");
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=area.getSubArea&id="+sub4Value,
				dataType:"json",
				success:function(json){
				$("#sixthLeavl").empty();
				var arraylist = json;
				var htmls = "";
				if (json.length<=0) {
					$("#blk6").css("display","none");
				} else {
					for( var i=0;i<arraylist.length;i++){
						htmls = htmls+"<li class='sixth' value='"+arraylist[i].ID+"'><a href='#'>"+arraylist[i].NAME+"</a></li>";
					}
					$("#sixthLeavl").append(htmls);
				}},
				error:function(){
					alert("服务器发生 错误,请稍后再试....");
				}
			     });
			
			new PopupLayer({trigger:"#fifthLeavl",popupBlk:"#blk6",closeBtn:"#close6",popupLayerClass:"t4"});
			
		});
		
	}

	/**双击第五个层的操作*/
	sub4AreaDbClick = function(){
		$(".fifth").bind("dblclick",function(){
			$("#areaId").attr("value",$(this).attr("value"));
			var areaText = $(this).text();
			$("#area").val(areaText);
			$("#blk1").css("display","none");
			$("#blk2").css("display","none");
			$("#blk3").css("display","none");
			$("#blk4").css("display","none");
			$("#blk5").css("display","none");
			$("#blk6").css("display","none");
		});
	}

	closeAllDiv = function(){
		$("#blk2").css("display","none");
		$("#blk3").css("display","none");
		$("#blk4").css("display","none");
		$("#blk5").css("display","none");
		$("#blk6").css("display","none");
	}