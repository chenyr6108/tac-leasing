 function updateDunFine_rate(value){ 
						var derateFineDunFine=$('#derateFineDunFine').val();
						if(derateFineDunFine!=""&&derateFineDunFine!=null){
							derateFineDunFine=parseFloat(derateFineDunFine);
							value=parseFloat(value);
						}
						$("input[name='dunFine']").val(derateFineDunFine*value/100);
						check1();
					} 
					
					
					
function updateDunFineRate_rate(value){ 
						var derateFineDunFineRate=$('#derateFineDunFineRate').val();
						if(derateFineDunFineRate!=""&&derateFineDunFineRate!=null){
							derateFineDunFineRate=parseFloat(derateFineDunFineRate);
							value=parseFloat(value);
						}
						$("input[name='dunFineRate']").val(derateFineDunFineRate*value/100);
						check1();
					} 
					
					
					
					
					
function updateDunFine(value){ 
						var derateFineDunFine=$('#derateFineDunFine').val();
						if(derateFineDunFine!=""&&derateFineDunFine!=null){
							derateFineDunFine=parseFloat(derateFineDunFine);
							value=parseFloat(value);
						}
						$("input[name='dunFine_rate']").val(Math.round(value*10000/derateFineDunFine)*0.01);
					check1();
					} 
function updateDunFineRate(value){ 
						var derateFineDunFineRate=$('#derateFineDunFineRate').val();
						if(derateFineDunFineRate!=""&&derateFineDunFineRate!=null){
							derateFineDunFineRate=parseFloat(derateFineDunFineRate);
							value=parseFloat(value);
						}
						$("input[name='dunFineRate_rate']").val(Math.round(value*10000/derateFineDunFineRate)*0.01);
					check1();
					}
					
					
function check1(){
	
valueIsNotPercent(document.form1.dunFine_rate,'罚金比例')
valueIsNotPercent(document.form1.dunFineRate_rate,'罚息比例')

}					
					
//--值是百分数
function valueIsNotPercent(field, name)
{
	var value = field.value; 
	if(valueIsDouble(value) && new Number(value)>=0 && new Number(value) <=100)
	{
		return true;
	}else{
		alert(name + '必须是一个百分数！');
		field.focus();
		return  false;
	}
}
function valueIsDouble(value)
{
	value=value+"";
    var m=/^(\d)+(.){1}(\d)+$/;
    value = value.replace(/,/g, '');	
	if(new Number(value)>=0&&(value.match(m)||valueIsNumberx(value)))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function valueIsNumberx(value)
{
	var m=/^(\d)+$/;
	value = value.replace(/,/g, '');
    if(value.match(m) && new Number(value) >= 0)
    {
		return true;
	}
	else
	{
		return false;
	}
}



//撤销
function repeal(id){
	var mes = "您确定要撤销本申请么 ？"
	if(confirm(mes)){
		
	window.location.href="../servlet/defaultDispatcher?__action=dunTask.repealDerate&dufd_id="+id;
	}
}
								
								
function checkForsub(){
	
	if((valueIsNotPercent(document.form1.dunFine_rate,'罚金比例') & valueIsNotPercent(document.form1.dunFineRate_rate,'罚息比例'))){
		
		$("#form1").submit();
		
	}else{
		
	}
	
	
}								
