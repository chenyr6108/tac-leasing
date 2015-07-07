//改变得分和内容
function changvalue(id){
        var checkValue=$("#point"+id).val();
        $("#fen"+id).val(checkValue);
        var checkText=$("#point"+id).find("option:selected").text();
        $("#fencontext"+id).val($.trim(checkText));     
}
//验证得分是否合法，并提交
function inserttopoint(){	
	document.form2.__action.value="riskAudit.inserttopoint";
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
function changeTotal(type_code,id){
       // var checkValue=$("#point"+id).val()+$("#x_sum"+type_code).val();
       // $("#x_sum"+type_code).val(checkValue);
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
       		//alert($(this).val());
       		if($(this).val()!=''){
       			sum=sum+parseFloat($(this).val());
       		}
       });
       $("#s_sum").val(sum);
       
       
}
//改变小计和总计 (重车)
function changeTotal1(type_code,id){
       // var checkValue=$("#point"+id).val()+$("#x_sum"+type_code).val();
       // $("#x_sum"+type_code).val(checkValue);
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
       		//alert($(this).val());
       		if($(this).val()!=''){
       			sum=sum+parseFloat($(this).val());
       		}
       });
       $("#s_sum").val(sum);
       
       
}
$(function(){
	$("input[name='x_sum']").each(function(){
		$(this).parent().attr('style','background :#d9effb')
	})
	
})
