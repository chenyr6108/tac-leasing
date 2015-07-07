
function MRound(m, n) {
    return Math.round(m * Math.pow(10, n)) / Math.pow(10, n);
}

var formatCurrency = function(value) {
    if (MRound(value, 6) == 0) {
        return "0.00";
    }

    var v = '' + value;
    v = v.replace(/[￥,]/g, '');
    var s = '';
    if (v.indexOf(".") != -1) {
        var index = v.indexOf(".");
        s = v.substring(index);
        if (s.length > 3) {
            var num = parseInt(s.substring(1, 3), 10);
            if (parseInt(s.substring(3, 4), 10) > 4) {
                num++; // 四舍五入
            }
            s = "." + num;
        } else if (s.length == 2) {
            s += '0';
        }
        v = v.substring(0, index);
    } else {
        s = '.00';
    }
    var len = v.length;

    while (len > 3) {
        s = ',' + v.substring(len - 3) + s;
        v = v.substring(0, len - 3);
        len -= 3;
    }
    s = v + s;

    return s;
}

function setFormatCurrency(field) {
    field.value = formatCurrency(field.value);
}

function parseCurrency(value) {
    value = value.trim();
    //if (/^￥?(\d{1,3},)*\d{1,3}\.\d{1,2}/.test(value)) {
        value = value.replace(/[￥,]/g, '');
    //}
    return parseFloat(value, 10);
}

//made by yaosansi 2005-12-02
//For more visit http://www.yaosansi.com
// Trim() , Ltrim() , RTrim()
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};

String.prototype.ltrim = function() {
    return this.replace(/(^\s*)/g, "");
};

String.prototype.rtrim = function() {
    return this.replace(/(\s*$)/g, "");
};

// 未填写，或，全是空白
function blank(field, name) {
    var value = field.value;
    value = value.trim();

    if (checkBlank(value)) {
        alert(name + '不能为空！');
        field.focus();
        return true;
    } else {
        field.value = value;
        return false;
    }
}

// 正数
function positive(field, name) {
	if(typeof(field) != "undefined"){
	    var value = field.value;
	    value = value.trim();
	    //if (/^￥?(\d{1,3},)*\d{1,3}\.\d{1,2}/.test(value)) {
	    //    value = value.replace(/[￥,]/g, '');
	    //}
	    value = value.replace(/[-￥,]/g, '');
		if(value==0){
			 field.value = value; 
	    }else if (!checkNumber(value)) {
	        alert(name + '只能输入数字！');
	        field.focus();
	        return true;
	    } else if (checkNegative(value)) {
	        alert(name + '必须是一个正数！');
	        field.focus();
	        return true;
	    } else {
	        if (value.substring(0,2) != '0.') {
	            value = value.replace(/^0+/g, '');
	        }
	        field.value = value;
	        return false;
	    }
	}
}

// 正整数
function integer(field, name) {
    var value = field.value;
    value = value.trim();
    //if (/^￥?(\d{1,3},)*\d{1,3}\.\d{1,2}/.test(value)) {
    //    value = value.replace(/[￥,]/g, '');
    //}
    value = value.replace(/[-￥,]/g, '');

    if (!checkInteger(value)) {
        alert(name + '只能输入整数！');
        field.focus();
        return true;
    } else if (checkNegative(value)) {
        alert(name + '必须是一个正数！');
        field.focus();
        return true;
    } else {
        if (value.substring(0,2) != '0.') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        return false;
    }
}

 
//--值是百分数
function valueIsNotPercent(field, name)
{
	var value = field.value; 
	if(valueIsDouble(value) && new Number(value)>=0 && new Number(value) <=100)
	{
		return false;
	}else{
		alert(name + '必须是一个百分数！');
		field.focus();
		return true;
	}
	alert(value);
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

// 大于或等于1的正整数
function largerThanOne(field, name) {
    var value = field.value;
    value = value.trim();
    //if (/^￥?(\d{1,3},)*\d{1,3}\.\d{1,2}/.test(value)) {
    //    value = value.replace(/[￥,]/g, '');
    //}
    value = value.replace(/[-￥,]/g, '');

    if (!checkInteger(value)) {
        alert(name + '只能输入整数！');
        field.focus();
        return true;
    } else if (checkNegative(value)) {
        alert(name + '必须是一个正数！');
        field.focus();
        return true;
    } else if (parseInt(value, 10) < 1) {
        alert(name + '必须大于或者等于1');
        field.focus();
        return true;
    } else {
        if (value.substring(0,2) != '0.') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        return false;
    }
}


// 电话
function phone(field, name) {
    var value = field.value;
    value = value.trim();

    if (!checkPhone(value)) {
        alert(name + '必须是电话');
        field.focus();
        return true;
    } else {
        field.value = value;
        return false;
    }
}

// 电话
function mobile(field, name) {
    var value = field.value;
    value = value.trim();

    if (!checkPhone(value)) {
        alert(name + '必须是手机号');
        field.focus();
        return true;
    } else {
        field.value = value;
        return false;
    }
}

// 日期
function date(field, name) {
    var value = field.value;
    value = value.trim();

    if (!checkDateStr(value)) {
        alert(name + '必须是日期');
        field.focus();
        return true;
    } else {
        field.value = value;
        return false;
    }
}


// 正数，叹号形式
function positiveMark(field, ignoreFormatCurrency) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[-￥,]/g, '');

    if (!checkNumber(value)) {
        //document.getElementById(field.name + "_mark").innerHTML = '<span style="color:red"><img src="../images/wtq.gif">只能输入数字！</span>';
        document.getElementById(field.name + "_mark").innerHTML = '<span style="color:red"><img src="../images/wtq.gif"></span>';
        field.focus();
        return false;
    } else if (checkNegative(value)) {
        //document.getElementById(field.name + "_mark").innerHTML = '<span style="color:red"><img src="../images/wtq.gif">必须是一个正数！</span>';
        document.getElementById(field.name + "_mark").innerHTML = '<span style="color:red"><img src="../images/wtq.gif"></span>';
        field.focus();
        return false;
    } else {
        document.getElementById(field.name + "_mark").innerHTML = '<img src="../images/ytq.gif">';
        if (value.substring(0,2) != '0.') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        if (!ignoreFormatCurrency) {
            setFormatCurrency(field);
        }
        return true;
    }
}




//函数名称：checkBlank
//功能介绍：检查是否为空白字符串
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：不能为空，不能全是全角或半角空格
// 2008-10-08 14:35
// Lingo
function checkBlank(checkStr) {
    var regex = /^[ 　]*$/;
    return regex.test(checkStr);
}

//函数名：checkEmail
//功能介绍：检查是否为合法的Email Address
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：不能以.或@或/开头和结尾，不能包含1个以上@，形如*@(*.)*
// 2006-01-02 16:14
// Lingo
function checkEmail(checkStr)
{
    var regex = /^[\w\-]+\@[\w\-]+(\.)[\w\-]+$/;

    return regex.test(checkStr);
}


//函数名：checkDate
//功能介绍：检查是否为合法日期
//参数说明：要检查的字符串年、月、日
//返 回 值：false:不是  true:是
// 2006-01-02 12:48
// Lingo
function checkDate(yearStr, monthStr, dayStr)
{
    var regex = /^\d+$/;
    if ( !regex.test(yearStr) ||
        !regex.test(monthStr) ||
        !regex.test(dayStr) )
    {
        return false;
    }

    var testday = new Date();
    testday.setFullYear(yearStr, monthStr-1, dayStr);
    var tmpy = testday.getFullYear();
    var tmpm = testday.getMonth() + 1;
    var tmpd = testday.getDate();
    if (tmpy == yearStr && tmpm == monthStr && tmpd == dayStr)
    {
        return true;
    }
    else
    {
        return false;
    }
}


//函数名：checkDateStr
//功能介绍：检查是否为合法日期
//参数说明：要检查的字符串YYYY-MM-DD
//返 回 值：false:不是  true:是
// 2006-01-02 13:02
// Lingo
function checkDateStr(checkStr)
{
    var tmpy = "";
    var tmpm = "";
    var tmpd = "";
    var checkCode = 0;

    for (i=0; i<checkStr.length ;i++)
    {
        ch = checkStr.charAt(i);
        if (ch == '-') checkCode++;
        if (checkCode > 2) return(false);
        else if (checkCode == 0 && ch != '-') tmpy += ch;
        else if (checkCode == 1 && ch != '-') tmpm += ch;
        else if (checkCode == 2 && ch != '-') tmpd += ch;
    }
    if (checkNumber(tmpy) && tmpy.length == 2)
    {
        if (tmpy > 70) tmpy = "19" + tmpy;
        else tmpy = "20" + tmpy;
    }
    return checkDate(tmpy, tmpm, tmpd);
}


//函 数 名：checkFloat
//功能介绍：检查是否为小数
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:14
// Lingo
function checkFloat(checkStr)
{
    var regex = /^[\+\-]?[\d]+[\.][\d]+$/;

    return regex.test(checkStr);
}

//函 数 名：checkInteger
//功能介绍：检查是否为数字
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:19
// Lingo
function checkInteger(checkStr)
{
    var regex = /^[\+\-]?[\d]+$/;

    return regex.test(checkStr);
}


//函 数 名：checkLength
//功能介绍：检查字符串的长度
//参数说明：要检查的字符串
//返 回 值：字节长度值
// 2006-01-02 13:22
// Lingo
function checkLength(checkStr)
{
    var n = 0;
    for(i=0; i<checkStr.length; i++)
    {
        chcode = checkStr.charCodeAt(i);
        if (chcode >=0  && chcode <= 255)
        {
            n++;
        }
        else
        {
            n += 2;
        }
    }
    return(n);
}


//函 数 名：checkName
//功能介绍：检查是否符合名称要求
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：不能是这些字符。0123456789`~!@#$%^&*()_-+=|\{}[];:,<>?/"
// 2006-01-02 13:22
// Lingo
function checkName(checkStr)
{
    var regex = /[^\d`~!\@#\$%\^&\*\(\)_\-\+=\|\\\{\}\[\];:,<>\?\/\"]/;
    return regex.test(checkStr);
}


//函 数 名：checkNegative
//功能介绍：检查是否为负数
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:37
// Lingo
function checkNegative(checkStr)
{
    var regex = /^\-\d+(\.\d+)?$/;

    return regex.test(checkStr);
}


//函 数 名：checkNoString
//功能介绍：检查是否含非法字符
//参数说明：要检查的字符串，合法的字符串集合
//返 回 值：false:不是  true:是
// 2006-01-02 13:39
// Lingo
function checkNoString(checkStr, forbidStr)
{
    var allValid = false;
    if (typeof(checkStr) != "string" || typeof(forbidStr) != "string") return false ;

    for (i = 0; i < checkStr.length; i++)
    {
        ch = checkStr.charAt(i);
        if (forbidStr.indexOf(ch) >= 0)
        {
            allValid = true;
            break;
        }
    }
    return allValid ;
}


//函 数 名：checkNumber
//功能介绍：检查是否为数字
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:08
// Lingo
function checkNumber(checkStr)
{
    var regex = /^[\+\-]?\d+(\.\d+)?$/;

    return regex.test(checkStr);
}


//函 数 名：checkPassword
//功能介绍：检查是否符合密码要求
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 13:42
// Lingo
function checkPassword(checkStr)
{
    var regex = /^[\w\-\.]+$/;

    return regex.test(checkStr);
}


//函 数 名：checkPhone
//功能介绍：检查是否为电话号码
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：(0315)-1234567,(010)-12345678,12345678901
// 2006-01-02 13:45
// Lingo
function checkPhone(checkStr)
{
    //var checkOK = "0123456789-()# ,;:";
    var regex = /^((\(\d{3,4}\)\-)?\d{7,8})$|^\d{11}$/;
    return regex.test(checkStr);
}


//函 数 名：checkMobile
//功能介绍：检查是否为手机号
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：13088888888 15088888888 1808888888
// 2010-07-02 13:45
// wjw
function checkMobile(checkStr){
	var regex = /^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
	return regex.test(checkStr);
}


//函 数 名：checkquot
//功能介绍：检查是否含有引号（单引号和/或双引号）
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 15:41
// Lingo
function checkQuot(checkStr)
{
    var allValid = false;
    for (i = 0; i < checkStr.length; i++)
    {
        ch = checkStr.charAt(i);
        if (ch == "'" || ch == '"')
        {
            allValid = true;
            break;
        }
    }
    return(allValid);
}


//函 数 名：checkSafe
//功能介绍：检查是否含有&;`'\"|*?~<>^()[]{}$\n\r
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 15:52
// Lingo
function checkSafe(checkStr)
{
    //var str = '\r';
    var regex = /[^&;`\'\\\"\|\*\?~<>\^\(\)\[\]\{\}\$\n\r]/;

    return regex.test(checkStr);
}


//函 数 名：checkSpace
//功能介绍：检查是否含有全角或半角空格
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
// 2006-01-02 15:54
// Lingo
function checkSpace(checkStr)
{
    var regex = /[ 　]/;
    return regex.test(checkStr);
}


//函 数 名：checkString
//功能介绍：检查是否全部合法
//参数说明：要检查的字符串，合法的字符串集合
//返 回 值：false:不是  true:是
// 2006-01-02 12:52
// Lingo
function checkString(checkStr, checkOK)
{
    var allValid = true;
    if (typeof(checkStr) != "string" || typeof(checkOK) != "string")
    {
        return false;
    }

    for (i = 0; i < checkStr.length; i++)
    {
        ch = checkStr.charAt(i);
        if (checkOK.indexOf(ch) == -1)
        {
            allValid = false;
            break;
        }
    }
    return allValid;
}


//函数名：checkUrl
//功能介绍：检查是否为合法的url
//参数说明：要检查的字符串
//返 回 值：false:不是  true:是
//校验规则：不能以.或@或/开头和结尾，不能包含1个以上@，形如*@(*.)*
// 2006-01-02 16:14
// Lingo
function checkUrl(checkStr)
{
    var regex = /^(http:\/\/)?[\w\-]+(\.[\w\-]+)*(:\d{0,5})?(\/?[\w\-]+[\.\w\-]*)*(\/)?$/;

    return regex.test(checkStr);
}


//函 数 名：trimStr
//功能介绍：删除两端的空格符号（全角和／或半角）
//参数说明：要处理的字符串
//返 回 值：处理后的字符串
// 2006-01-02 15:57
// Lingo
function trimStr(w)
{
    while (w.length>0 && (w.substr(0,1)==' ' || w.substr(0,1)=='　')) w=w.substr(1);
    while (w.length>0 && (w.substr(w.length-1)==' ' || w.substr(w.length-1)=='　')) w=w.substr(0,w.length-1);
    return w;
}


//函 数 名：trimForm
//功能介绍：对表单内所有text类型做trimStr操作
//参数说明：要处理的表单名
//返 回 值：false:失败  true:成功
// 2006-01-02 16:01
// Lingo
function trimForm(theForm)
{
    if (typeof(theForm) != "object") return false;

    //alert(theForm.elements.length);

    for (var i=0; i<theForm.elements.length; i++)
    {
        var e = theForm.elements[i];

        if (e.type == 'text')
        {
            e.value = trimStr(e.value);
        }
    }
    return true;
}


