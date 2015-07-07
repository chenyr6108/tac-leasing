// JavaScript Document
//------------------------------------------------------正确或者错误的字符串。
var rightHTML='<img src="../images/ytq.gif" alt="正确">';
var wrongHTML='<img src="../images/wtq.gif" alt="错误">';
//------------------------------------------------------常用的方法
//--通过id得到对象。
function by(id)
{
	return document.getElementById(id);
}
/*
//--通过id得到这个对象的节点。
//--到底能不能用啊？
function getNode(id)
{
	return document.XMLDocument.nodeFromID(id);
}
*/

//---放到这个后边一个span
function after(th,yesOrNo)
{
	//-----先看以前有没有 加入验证过，如果验证过，就已经有的(th.id+span)为id 的这个span
	//-----所以只要改变内容就行了。
	
	if(th!=null && th.id!=null && by(th.id+"span")!=null)
	{
		if(yesOrNo=='y')
		{
			by(th.id+"span").innerHTML=rightHTML;
		}
		else if(yesOrNo=='0')
		{
			by(th.id+"span").innerHTML="";
		}
		else
		{
			by(th.id+"span").innerHTML=wrongHTML;
		}
	}
	else
	{
		//------如果没有就需要添加一个新的span，并且命名是 th.id+span.
		
		var parent=th.parentNode;
		if(typeof th.parentNode == 'undefined')
		{
			console.error(th);
			alert("name="+th.name+"--id="+th.id+"--value="+th.value);
		}
		else
		{
			var next=th.nextSibling;
			var newSpan=document.createElement("span");
			if(th.id!=null && th.id!="")
			{
				newSpan.id=th.id+'span';
			}
			if(yesOrNo=='y')
			{
				newSpan.innerHTML=rightHTML;
			}
			else if(yesOrNo=='0')
			{
				newSpan.innerHTML="";
			}
			else
			{
				newSpan.innerHTML=wrongHTML;
			}
			parent.insertBefore(newSpan,next);
		}
	}
}
//--通过id得到数值。并且是处理过的，就是去掉了￥ 和，的数值。
function getValue(th)
{
	var value = "";
	if(th!=null)
	{
		value=th.value;
		while(value.indexOf(" ")!=-1)
		{
			value = value.replace(" ","");
		}		
		while(value.indexOf(",")!=-1)
		{
			value = value.replace(",","");
		}
		while(value.indexOf("￥")!=-1)
		{
			value = value.replace("￥","");
		}
		while(value.indexOf("，")!=-1)
		{
			value = value.replace("，","");
		}
		
		if(!valueIsDouble(value))
		{
			value=0;
		}
	}
	return value;
}
//---转换成财务形式的数字。
function toFinance(th,toTh)
{
	var value=getValue(th);
	if(value!=null && value!="")
	{
		var str="";
		var len=value.length;
		var d=value.indexOf('.');
		if(d!=-1)
		{
			for(var i=d-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((d-i)%3==0 && i > 0)
				{
					str=','+str;
				}
			}
			var sub=Math.round(new Number("0"+value.substr(d))*100)/100;
			
			if(sub == 0)
			{
				str=str+".00";
			}
			else if(sub.toString().substr(2).length == 1)
			{
				str=str+"."+sub.toString().substr(2)+"0";
			}
			else if(sub.toString().substr(2).length == 2)
			{
				str=str+"."+sub.toString().substr(2);
			}
			else
			{
				str=str+"."+sub.toString().substr(2,4);
			}
		}
		else
		{
			for(var i=len-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((len-i)%3==0 && i>0)
				{
					str=','+str;
				}
			}
			str=str+".00";
		}
		toTh.value=str;
	}
}
//--选中填写时候，选中内容。
function selectContent(th)
{
	th.select();
}
//***********************************************************
//----各种验证
//-------------------定义页面上做过的所有验证的记录,在提交时候可以再次验证。
//var allNotNull;
//var allNumber;
//var allDouble;
//************************************************************
//---验证非空，长度大于0.
function isNotNull(th)
{
	
	if(th!=null && th.value!=null && th.value.length>0)
	{
	 after(th,'y');
	 return true;
	}
	else
	{
	 after(th,'n');
	 return false;
	}
}
//-
function valueIsNotNull(th)
{
	if(th.value!=null && th.value.length > 0)
	{
	  after(th,'y');
	  return true;
	}
	else
	{
	  after(th,'n');
	  return false;
	}
}
//---验证数字，自然数。用于验证数量。大于0的整数。
function isNumber(th)
{
	var m=/^(\d){1,12}$/;
	var value = th.value;
	if(value==null||value==''){
	return true;
	}
	if(value.match(m))
	{
		after(th,'y');
		return true;
	}
	else
	{
		after(th,'n');
		return false
	}
}
function valueIsNumber(value)
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
//判断是不是Double,小数。大于0的小数。
function isDouble(th)
{
    var m=/^(\d)+(.){1}(\d)+$/;
    var value = document.getElementById(th.id).value.replace(/,/g, '');
	
	if(new Number(value)>=0&&(value.match(m)||isNumber(th)))
	{ 
		after(th,'y');
		return true;
	}
	else
	{
		after(th,'n');
		return false;
	}
}
function valueIsDouble(value)
{
	value=value+"";
    var m=/^(\d)+(.){1}(\d)+$/;
    value = value.replace(/,/g, '');	
	if(new Number(value)>=0&&(value.match(m)||valueIsNumber(value)))
	{
		return true;
	}
	else
	{
		return false;
	}
}
//--百分数
function isPercent(th)
{
	if(th!=null)
	{	
		var value = th.value;
		if(valueIsDouble(value) && new Number(value)>=0 && new Number(value) <=100)
		{
			after(th,'y');
			return true;
		}
		else
		{
			after(th,'n');
			return false;
		}
	}
	return false;
}
//--值是百分数
function valueIsPercent(value)
{
	if(valueIsDouble(value) && new Number(value)>=0 && new Number(value) <=100)
	{
		return true;
	}
	return false;
}
//--是年龄
function isAge(th)
{	
	if(th.value==null||th.value==''){
		return true;
	}
	if(parseInt(th.value) > 0 && parseInt(th.value)< 100)
	{
		after(th,'y');
		return true;
	}
	else
	{
		after(th,'n');
		return false;
	}
}
//--------------判断是不是手机
function mobileTels(th){
	var m1=/^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
	if(th.value==null||th.value==''){
		return true;
	}
	if(th.value.match(m1))
		{
			after(th,'y');
			return true;
		}
		else
		{
			th.focus();
			after(th,'n');
			return false;
		}

}
//判断是不是家庭电话或传真
function isPhone(th){
	var m = /^(0[0-9]{2,3}(\-)?)?([2-9]{1}[0-9]{6,7}){1}(\-[0-9]{1,4})?$/;
		if(th.value==''||th.value==null){
			return true;
		}
		if(th.value.match(m))
		{
			after(th,'y');
			return true;
		}
		else
		{
			th.focus(); 
			after(th,'n');
			return false;
		}
}
/*
function isPhone(id)
{
	var m=/^(\d){3,4}(-)?(\d){7,8}$/;
	var m2=/^(\d){7,8}$/;
	if(document.getElementById(id).value==''||document.getElementById(id).value==null){
		return true;
	}
	if(document.getElementById(id).value.match(m)||document.getElementById(id).value.match(m2))
	{
		document.getElementById(id+"1").innerHTML="<img src='.personnel/../images/ytq.gif'/>";
		return true;
	}
	else
	{
		document.getElementById(id).focus();
		if(document.getElementById(id+"1")!=null)
			document.getElementById(id+"1").innerHTML="<img src='.personnel/../images/wtq.gif'/>";
		return false;
	}
}

*/
//判断身份证

function isIdCard(th)
{	
	var m=/^(\d){15}$/;
	var m1=/^(\d){18}$/;
	var m2=/^(\d){17}[x|X]$/;
	var m3=/^(\d){17}[y|Y]$/;
	if(th.value==""||
	   th.value.match(m)||
	   th.value.match(m1)||
	   th.value.match(m2)||
	   th.value.match(m3))
	{
		after(th,'y');
		return true;
	}
	else
	{
		after(th,'n');
		return false;
	}
}
//--判断邮编，邮政编码
function isPostCode(th)
{
	if(th.value==''||th.value==null){
		return true;
	}
	if(th.value.length==6&&isNumber(th))
	{
		after(th,'y');
		return true;
	}
	else
	{ 
		th.focus(); 
		after(th,'n');
		return false;
	}
}
//判断是不是汉字
function isChinese(th)
{     
    var PatSWord=/^[\x00-\xff]+$/;     //匹配所有单字节长度的字符组成的字符串   
    var PatDWord=/[^\x00-\xff]+/g;   //匹配双字节长度的字符组成的字符串   
	
	if(th!=null && th.value!='' && !PatSWord.test(th.value))       
	{
		after(th,'y');
		return true;
	}
	else if(th!=null && th.value.length==0)
	{
		after(th,'0');
		return true;
	}
	else
	{
		after(th,'n');
		return false;
	}  
}
//-*************************************
//其他常用的方法
//----------------------------------------------------------
//去掉两边空格
function trim(str)
{
	if(str == null) return "" ;
	while( str.charAt(0)  == ' ' )
	{
		str = str.substring(1,str.length);
	}
	while( str.charAt(str.length-1)  == ' ' )
	{
		str = str.substring(0,str.length-1);
	}
	return str ;
}
//去掉空格
function lnOut(th)
{
	if(th!=null && th.value!=null)
	{
		th.value=trim(th.value);
		if(th.value.charAt(th.value.length-1) == '.')
		{
			th.value=th.value+"0";
		} 
	}
}
//进入页面的时候 显示出已经选中的按钮,给出一个数据值，再给出一个 radio组 的名字

function selectRadio(val,name)
{
	o=document.getElementsByName(name);
	for(var i=0;i<o.length;i++)
	{
		if(o[i].value==val)
		{
			o[i].checked=true;
		}
	}
}
function isAlike(thOne,thTwo)
{
	if(thOne.value!=null && thOne.value == thTwo.value)
	{
		after(thTwo,'y');
		return true;
	}
	else
	{
		after(thTwo,'n');
		return false;
	} 
}

//验证输入的是数字和字母
function numberAndLetters(id){
	var re=/^[0-9a-zA-Z]{6,20}$/;
	if(document.getElementById(id).value==null||document.getElementById(id).value==''){
		return true;
	}
	if(document.getElementById(id).value.match(re))
		{
			document.getElementById(id+"1").innerHTML = "<img src='../images/ytq.gif'/>";
			return true;
		}
		else
		{
			document.getElementById(id).focus();
			if(document.getElementById(id+"1")!=null)
				document.getElementById(id+"1").innerHTML = "<img src='../images/wtq.gif'/>";
			return false;
		}
}

function isEmail(th){
	if(th!=null && th.value!=null)
	{	 
		if(th.value.indexOf("@")!=-1&&th.value.indexOf("@")!=0){
			after(th,'y');
		}else{
			after(th,'n');
		}
	}else{
		after(th,'n');
	}

}
//-----这个方法引用了jquery 的 方法，以后有时间再写成单独的吧！
/*
function getNowTime()
{
	alert(11);
	$.getJSON('${ctx}/personnel/personnelUseAjaxAction!newTime.do',{},function(ja) {
           alert(ja.time);
           return ja.time;
        });
}
*/

function selectedTrueValue(id,value){
	sel=by(id);
	for(i=0;i<sel.options.length;i++){  
		if(sel.options[i].value==value){ 
			sel.options[i].selected='selected';
		}
	}
}