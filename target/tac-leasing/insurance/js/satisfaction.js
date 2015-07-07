 	  		// 查看
			function showSatisfaction(id){
			  	window.location.href="../servlet/defaultDispatcher?__action=satisfaction.getSatisfaction&INSF_ID="+id;
			}
			//修改
		   function updateSatisfaction(id,incu_id){
			  	window.location.href="../servlet/defaultDispatcher?__action=satisfaction.updateSatisfaction&INSF_ID="+id+"&INCU_ID="+incu_id;
			}
			//删除
			function delSatisfaction(id){
			if(confirm('确认删除？')){
			  	window.location.href="../servlet/defaultDispatcher?__action=satisfaction.delSatisfaction&INSF_ID="+id;
			}
			}
			//时间
			$(function (){
				$("#DANG_DATE").datepicker($.datepicker.regional['zh-CN']);
			    $("#INSF_DATE").datepicker($.datepicker.regional['zh-CN']);
			});
			//展开层
			function showSatisTrack(code){
			$("#showSatisTrack" + code).toggle(function () {
				$(this).load("../servlet/defaultDispatcher?__action=satisfaction.trackById&INSF_ID=" + code);
			});
			}
