//�Ƿ�Ϊ��У��
function isEmpty(s) {
	var lll = trim(s);
	if (lll == null || lll.length == 0)
		return true;
	else
		return false;
}

// ɾ���ַ�����ߵĿո�
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

// ɾ���ַ����ұߵĿո�
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

// ɾ���ַ����������ߵĿո�
function trim(str) {
	return (rtrim(ltrim(str)));
}

/* ������Ƚ� */
function compareDate(date1, date2) {
	if (trim(date1) == trim(date2))
		return 0;
	if (trim(date1) > trim(date2))
		return 1;
	if (trim(date1) < trim(date2))
		return -1;
}

// У���Ƿ���Email
function isEmail(eml) {
	if (trim(eml) != '') {
		var re = new RegExp("@[\\w]+(\\.[\\w]+)+$");
		return (re.test(eml));
	} else
		return (true);
}

// �Ƿ��ǵ绰��
function isTel(tel) {
	var charcode;
	for ( var i = 0; i < tel.length; i++) {
		charcode = tel.charCodeAt(i);
		if (charcode < 48 && charcode != 45 || charcode > 57)
			return false;
	}
	return true;
}

// У���Ƿ���ʵ��
function isnumber(num) {
	var re = new RegExp("^-?[\\d]*\\.?[\\d]*$");
	if (re.test(num))
		return (!isNaN(parseFloat(num)));
	else
		return (false);
}

// У���Ƿ�������
function isinteger(num) {
	var re = new RegExp("^-?[\\d]*$");
	if (re.test(num))
		return (!isNaN(parseInt(num)));
	else
		return (false);
}
// ��֤�ַ��ĳ���
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
		alert("[" + msg + "]" + "�������Ϊ" + length + "λ," + "����������!ע�⣺һ������ռ2λ");
		textObj.focus();
		return false;
	} else {
		return true;
	}
}
// ������֤�����зǷ����ַ������ģ�Ӣ�ģ����ֶ��ǺϷ��ġ�
function isValidString(textId, errMsg) {
	szStr = document.getElementById(textId).value;
	voidChar = "'\"><`~!@#$%^&\(\)��������������?��������*";
	for (i = 0; i < voidChar.length; i++) {
		aChar = voidChar.substring(i, i + 1);
		if (szStr.indexOf(aChar) > -1) {
			alert(errMsg);
			return false;
		}
	}
	return true;
}
// ������ֻ֤����������ĸ�����֣��»���
function isEnglish(textId, errMsg) {
	s = document.getElementById(textId).value;
	// �����������ʽ���Ƶĳ�����6��20֮��
	// var patrn=/^(\w){6,20}$/;
	var patrn = /^(\w)*$/;
	if (!patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}

// ������ֻ֤��������
function isChinese(textId, errMsg) {
	s = document.getElementById(textId).value;
	var patrn = /[^\u4E00-\u9FA5]/g;
	if (patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}

// ������ֻ֤��������
function isNumber(textId, errMsg) {
	s = document.getElementById(textId).value;
	// �����������ʽ���Ƶĳ�����6��20֮��
	// var patrn=/^(\d){6,20}$/;
	var patrn = /^(\d)*$/;
	if (!patrn.exec(s)) {
		alert(errMsg);
		return false
	}
	return true
}
