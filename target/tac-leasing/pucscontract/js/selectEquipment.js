$selectEquipment = {
	allOrNot : function (obj) {
					$("input[name='RECD_ID']").attr("checked",obj.checked);
				},
	submitVilidate : function () {
			var boxs = $("input[name='RECD_ID']:checked")
			if (boxs.length == 0 ){
				alert("请选择设备！");
				return ;
			} else {
				var flag = $(boxs[0]).attr("id");
				for (var i=0;i<boxs.length;i++) {
					tempType = $(boxs[i]).attr("id")
					if (flag != tempType){
						alert("请选择同一供货商的设备！");
						return ;
					} 
				}
				$("input[name='SUPL_ID']").val(flag);
				$("#form1").submit();
			}
		}
};