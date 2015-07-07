

/**
 * calculate md5.
 *
 * @param id the password field's id
 * @param form the dom of form ,or, the id of the form ,or, the name of form
 * @param occur if true we use form, if false we use ajax
 */
function CalcuMD5(id, form, occur) {
    //var formDateType = true;
    var iphost = null;
    var totleStr = "CHIANABEIJINGXINSANYOURUANJIANZHONGLIANXINXINGFILSOFT20081127XSY";

    var pwd = document.getElementById(id).value;
    pwd = pwd.toUpperCase();
    pwd = pwd.replace(/0/g,'~').replace(/1/g, '$').replace(/2/g, '!').replace(/3/g,'@').replace(/4/g,':').
              replace(/5/g,']').replace(/6/g,'[').replace(/7/g,'{').replace(/8/g,'}').replace(/9/g,'`');

    totleStr = totleStr.substring(0, totleStr.length - pwd.length);
    pwd = totleStr + pwd;
    pwd = MD5(pwd);
    if (occur) {
        document.getElementById(id).value = pwd;
        form.submit();
    } else {
        return pwd;
    }
}

