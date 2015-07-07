//是否为空校验
function isEmpty(s) {
	var lll = trim(s);
	if (lll == null || lll.length == 0)
		return true;
	else
		return false;
}

// 删除字符串左边的空格
function ltrim(str) {
	if (str.length == 0)
		return (str);
	else {
		var idx = 0;
		while (str.charAt(idx).search(/\s/) == 0)
			idx++;
		return (str.substr(idx));
	}
}

// 删除字符串右边的空格
function rtrim(str) {
	if (str.length == 0)
		return (str);
	else {
		var idx = str.length - 1;
		while (str.charAt(idx).search(/\s/) == 0)
			idx--;
		return (str.substring(0, idx + 1));
	}
}

// 删除字符串左右两边的空格
function trim(str) {
	return (rtrim(ltrim(str)));
}

/* 日期相比较 */
function compareDate(date1, date2) {
	if (trim(date1) == trim(date2))
		return 0;
	if (trim(date1) > trim(date2))
		return 1;
	if (trim(date1) < trim(date2))
		return -1;
}

// 校验是否是Email
function isEmail(eml) {
	if (trim(eml) != '') {
		var re = new RegExp("@[\\w]+(\\.[\\w]+)+$");
		return (re.test(eml));
	} else
		return (true);
}

// 是否是电话号
function isTel(tel) {
	var charcode;
	for ( var i = 0; i < tel.length; i++) {
		charcode = tel.charCodeAt(i);
		if (charcode < 48 && charcode != 45 || charcode > 57)
			return false;
	}
	return true;
}

// 校验是否是实数
function isnumber(num) {
	var re = new RegExp("^-?[\\d]*\\.?[\\d]*$");
	if (re.test(num))
		return (!isNaN(parseFloat(num)));
	else
		return (false);
}

// 校验是否是整数
function isinteger(num) {
	var re = new RegExp("^-?[\\d]*$");
	if (re.test(num))
		return (!isNaN(parseInt(num)));
	else
		return (false);
}
// 验证字符的长度
function checkTextLen(textId) {
	var len = 0;
	var checkField = document.getElementById(textId);
	var inputstring = checkField.value;
	var string_length = inputstring.length;
	if (string_length == 0) {
		return 0;
	}
	for ( var i = 0; i < string_length; i++) {
		if (inputstring.charAt(i).charCodeAt() > 255)
			len += 2;
		else
			len += 1;
	}
	return len;
}
function checkTextLength(textId, length, msg) {
	var textObj = document.getElementById(textId);
	if (checkTextLen(textId) > length / 1) {
		alert("[" + msg + "]" + "长度最大为" + length + "位," + "请重新输入!注意：一个汉字占2位");
		textObj.focus();
		return false;
	} else {
		return true;
	}
}
// 下面验证不含有非法的字符，中文，英文，数字都是合法的。
function isValidString(textId, errMsg) {
	szStr = document.getElementById(textId).value;
	voidChar = "'\"><`~!@#$%^&\(\)（）！￥……？?“”‘’*";
	for (i = 0; i < voidChar.length; i++) {
		aChar = voidChar.substring(i, i + 1);
		if (szStr.indexOf(aChar) > -1) {
			alert(errMsg);
			return false;
		}
	}
	return true;
}
// 下面验证只可以输入字母，数字，下划线
function isEnglish(textId, errMsg) {
	s = document.getElementById(textId).value;
	// 下面的正则表达式限制的长度在6到20之间
	// var patrn=/^(\w){6,20}$/;
	var patrn = /^(\w)*$/;
	if (!patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}

// 下面验证只允许中文
function isChinese(textId, errMsg) {
	s = document.getElementById(textId).value;
	var patrn = /[^\u4E00-\u9FA5]/g;
	if (patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}

// 下面验证只允许数字
function isNumber(textId, errMsg) {
	s = document.getElementById(textId).value;
	// 下面的正则表达式限制的长度在6到20之间
	// var patrn=/^(\d){6,20}$/;
	var patrn = /^(\d)*$/;
	if (!patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}
