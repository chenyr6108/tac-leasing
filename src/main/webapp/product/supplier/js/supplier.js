
addSupplierDetail = function(){
    var tname = $.trim($(":input[name='name']").val());
    if (tname.length <2) {
        alert("è¯·å¡«åä¼ä¸åç§°ï¼")
        return false;
    }
    var tcode = $.trim($(":input[name='code']").val());
    if (tcode.length == 0) {
        alert("è¯·å¡«åç¼å·ï¼")
        return false;
    }
    var tfd = $.trim($(":input[name='Founded_date']").val());
    if (tfd.length <4) {
        alert("è¯·å¡«åæç«æ¥æï¼")
        return false;
    }
    
    var trc = $.trim($(":input[name='Registered_capital']").val());
    if (trc.length == 0) {
        alert("è¯·å¡«åæ³¨åèµæ¬ï¼")
        return false;
    }
    var tic = $.trim($(":input[name='Income_capital']").val());
    if (tic.length == 0) {
        alert("è¯·å¡«åå®æ¶èµæ¬ï¼")
        return false;
    }
    
    var tcc = $.trim($(":input[name='Company_Corporation']").val());
    if (tcc.length <2) {
        alert("è¯·å¡«åæ³å®ä»£è¡¨äººï¼")
        return false;
    }
    
    var tcic = $.trim($(":input[name='Corporation_id_card']").val());
    if (tcic.length < 6) {
        alert("è¯·å¡«åæ³å®ä»£è¡¨äººä»½è¯å·ç ï¼")
        return false;
    }
    
    var tcl = $.trim($(":input[name='Corporation_link']").val());
    if (tcl.length == 0) {
        alert("è¯·å¡«åæ³äººèç³»æ¹å¼ï¼")
        return false;
    }
    
    var tbl = $.trim($(":input[name='Business_licence']").val());
    if (tbl.length == 0) {
        alert("è¯·å¡«åè¥ä¸æ§ç§æ³¨åå·ï¼")
        return false;
    }
    
    
    
    var toc = $.trim($(":input[name='Organization_certificate']").val());
    if (toc.length == 0) {
        alert("è¯·å¡«åç»ç»æºæä»£ç å·ï¼")
        return false;
    }
    
    
    
    
    var ttc = $.trim($(":input[name='Tex_code']").val());
    if (ttc.length < 4) {
        alert("è¯·å¡«åç¨å¡ç»è®°å·ï¼")
        return false;
    }
    
    
    var tvp = $.trim($(":input[name='Validity_Period']").val());
    if (tvp.length == 0) {
        alert("è¯·å¡«åæææ(å¹´)ï¼")
        return false;
    }
    
    
    var tnlmn = $.trim($(":input[name='Linkman_name']").val());
    if (tnlmn.length <2) {
        alert("è¯·å¡«åèç³»äººï¼")
        return false;
    }
    var toab = $.trim($(":input[name='Open_account_bank']").val());
    if (toab.length < 4) {
        alert("è¯·å¡«åå¼æ·è¡ï¼")
        return false;
    }
    
    var tba = $.trim($(":input[name='Bank_account']").val());
    if (tba.length < 10) {
        alert("è¯·å¡«åé¶è¡è´¦å·ï¼")
        return false;
    }
    
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.createSupplier");
    $("#addForm").submit();
    
};

update = function(id){
    var tname = $.trim($(":input[name='name']").val());
    if (tname.length <2) {
        alert("è¯·å¡«åä¼ä¸åç§°ï¼")
        return false;
    }
    var tcode = $.trim($(":input[name='code']").val());
    if (tcode.length == 0) {
        alert("è¯·å¡«åç¼å·ï¼")
        return false;
    }
    var tfd = $.trim($(":input[name='Founded_date']").val());
    if (tfd.length == 0) {
        alert("è¯·å¡«åæç«æ¥æï¼")
        return false;
    }
    
    var trc = $.trim($(":input[name='Registered_capital']").val());
    if (trc.length == 0) {
        alert("è¯·å¡«åæ³¨åèµæ¬ï¼")
        return false;
    }
    var tic = $.trim($(":input[name='Income_capital']").val());
    if (tic.length == 0) {
        alert("è¯·å¡«åå®æ¶èµæ¬ï¼")
        return false;
    }
    
    var tcc = $.trim($(":input[name='Company_Corporation']").val());
    if (tcc.length <2) {
        alert("è¯·å¡«åæ³å®ä»£è¡¨äººï¼")
        return false;
    }
    
    var tcic = $.trim($(":input[name='Corporation_id_card']").val());
    if (tcic.length < 6) {
        alert("è¯·å¡«åæ³å®ä»£è¡¨äººä»½è¯å·ç ï¼")
        return false;
    }
    
    var tcl = $.trim($(":input[name='Corporation_link']").val());
    if (tcl.length == 0) {
        alert("è¯·å¡«åæ³äººèç³»æ¹å¼ï¼")
        return false;
    }
    
    var tbl = $.trim($(":input[name='Business_licence']").val());
    if (tbl.length == 0) {
        alert("è¯·å¡«åè¥ä¸æ§ç§æ³¨åå·ï¼")
        return false;
    }
    
    
    
    var toc = $.trim($(":input[name='Organization_certificate']").val());
    if (toc.length == 0) {
        alert("è¯·å¡«åç»ç»æºæä»£ç å·ï¼")
        return false;
    }
    
    
    
    
    var ttc = $.trim($(":input[name='Tex_code']").val());
    if (ttc.length < 4) {
        alert("è¯·å¡«åç¨å¡ç»è®°å·ï¼")
        return false;
    }
    
    
    var tvp = $.trim($(":input[name='Validity_Period']").val());
    if (tvp.length == 0) {
        alert("è¯·å¡«åæææ(å¹´)ï¼")
        return false;
    }
    
    
    var tnlmn = $.trim($(":input[name='Linkman_name']").val());
    if (tnlmn.length == 0) {
        alert("è¯·å¡«åèç³»äººï¼")
        return false;
    }
    var toab = $.trim($(":input[name='Open_account_bank']").val());
    if (toab.length < 4) {
        alert("è¯·å¡«åå¼æ·è¡ï¼")
        return false;
    }
    
    var tba = $.trim($(":input[name='Bank_account']").val());
    if (tba.length < 10) {
        alert("è¯·å¡«åé¶è¡è´¦å·ï¼")
        return false;
    }
    
    
    $("#updateForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.updateSupplier");
    $("#supplier_id").val(id);
    $("#updateForm").submit();
    
}
