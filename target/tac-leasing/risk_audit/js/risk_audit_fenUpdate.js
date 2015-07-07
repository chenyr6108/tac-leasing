function changeValue(points_id,id){
		//改变得分
        var checkValue=$("#point"+id).val();
        $("#fen"+id).val(checkValue);
        //改变得分内容
        var checkText=$("#point"+id).find("option:selected").text();
        $("#fencontext"+id).val($.trim(checkText));       
}

//验证得分是否合法，并提交
function updatetopoint(){	
	document.form2.__action.value="riskAuditUpdate.inserttopoint";
	if($("#createType").val()==2){
		$("input[name='prc_id']").val($("#createPrc_id").val());
	}
    var fenshu=$("#fenshu").val();
    for(var i=1;i<=fenshu;i++){
    	if($("#fen"+i).val()== "请选择得分" || $("#fen"+i).val()==-1){
    		alert("请选择分数,第"+i+"个");  
    		return;
    	}
    }
	$("#form2").submit();
}
//改变小计和总计
function changeTotal(type_code){
       var sum=0;
       $("tr[name='"+type_code+"']").each(function(){
       		var value=$(this).children(":eq(6)").children(":eq(0)").val();
       		if(value!='请选择得分'){
       			sum=sum+parseFloat(value);
       		} 
       });
       $("#x_sum"+type_code).val(sum);
       sum=0;
       $("input[name='x_sum']").each(function(){
       		if($(this).val()!=''){
       			sum=sum+parseFloat($(this).val());
       		}
       });
       $("#s_sum").val(sum);     
}

//改变小计和总计(重车)
function changeTotal1(type_code){
       var sum=0;
       $("tr[name='"+type_code+"']").each(function(){
       		var value=$(this).children(":eq(4)").children(":eq(0)").val();
       		if(value!='请选择得分'){
       			sum=sum+parseFloat(value);
       		} 
       });
       $("#x_sum"+type_code).val(sum);
       sum=0;
       $("input[name='x_sum']").each(function(){
       		if($(this).val()!=''){
       			sum=sum+parseFloat($(this).val());
       		}
       });
       $("#s_sum").val(sum);     
}