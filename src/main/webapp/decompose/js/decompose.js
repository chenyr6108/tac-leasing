//手动分解前检测
function handDecompose() {
	var item_nums = $("input[name='item_num']");
	var flag = false; 
	var i = 0;
	for (i = 0; i < item_nums.length; i++) {
		flag = flag || item_nums[i].checked;
	}
	if (flag == false) {
		alert("\u8bf7\u81f3\u5c11\u9009\u62e9\u4e00\u6761\u5206\u89e3\u9009\u9879\uff01");
		return false;
	} else {
		var recp_ids = $("input[name='recp_id']");
		var recp_id = "";
		var recp_codes = $("input[name='recp_code']");
		var recp_code = "";
		var pay_dates = $("input[name='pay_date']");
		var pay_date = "";
		var ficb_items = $("input[name='ficb_item']");
		var ficb_item = "";
		var should_prices = $("input[name='should_price']");
		var should_price = "";
		var recd_periods = $("input[name='recd_period']");
		var recd_period = "";
		var recd_types = $("input[name='recd_type']");
		var recd_type = "";
		var item_orders = $("input[name='item_order']");
		var item_order = "";
		var item_counts = $("input[name='item_count']");
		var item_count = "";
		var tax_plan_codes= $("input[name='select_tax_plan_code']");
		var tax_plan_code="";
		
		var item_supl_codes=$("select[name='SUPL_CODE']");
		var item_supl_code="";
		
		var temp_money = 0;
		var i = 0;
		
		for (i; i < item_counts.length; i++) {

			if(item_nums[i].checked){
				if(item_nums[i].checked && item_supl_codes[i].value==''){
					alert("请选择来款供应商！");
					return false;
				}
			}
		}
		
		var income_money = $("#income_money").val();

		for (i = 0; i < item_counts.length; i++) {

			if (item_nums[i].checked) {
				recp_id = recp_id + recp_ids[i].value + ",";
				recp_code = recp_code + recp_codes[i].value + ",";
				pay_date = pay_date + pay_dates[i].value + ",";
				ficb_item = ficb_item + ficb_items[i].value + ",";
				should_price = should_price + should_prices[i].value + ",";
				recd_period = recd_period + recd_periods[i].value + ",";
				recd_type = recd_type + recd_types[i].value + ",";
				item_order = item_order + item_orders[i].value + ",";
				item_count = item_count + item_counts[i].value + ",";
				tax_plan_code= tax_plan_code + tax_plan_codes[i].value + ",";
				
				item_supl_code = item_supl_code +item_supl_codes[i].value + ",";
			}

		}
		$("#select_recp_id").val(recp_id);
		$("#select_recp_code").val(recp_code);
		$("#select_pay_date").val(pay_date);
		$("#select_ficb_item").val(ficb_item);
		$("#select_should_price").val(should_price);
		$("#select_recd_period").val(recd_period);
		$("#select_recd_type").val(recd_type);
		$("#select_item_order").val(item_order);
		$("#select_item_count").val(item_count);
		$("#tax_plan_code").val(tax_plan_code);
		
		$("#select_supl_code").val(item_supl_code);
		
		$("#decompose").submit();
	}
}
//复选框全选/全不选
function checkall() {
	var item_num_all = $("input[name='item_num_all']");
	var item_nums = $("input[name='item_num']");
	var should_prices = $("input[name='should_price']");
	var waitmoney_should_price=$("#waitmoney_should_price").val();
	var price = 0;
	if (item_num_all[0].checked) {
		for (i = 0; i < item_nums.length; i++) {				
			
			if(parseInt(waitmoney_should_price)>0&&i==item_nums.length-1){
				item_nums[item_nums.length-1].checked = false;
				//price = parseFloat(price) + parseFloat(should_prices[i].value);
			}else{
				item_nums[i].checked = true;
				price = parseFloat(price) + parseFloat(should_prices[i].value);
			}
		}

		var fina_price = formatCurrency(price);
		$("#select_price").html("\uffe5" + fina_price);
	} else {
		for (i = 0; i < item_nums.length; i++) {
			item_nums[i].checked = false;
		}
		price = 0;
		var fina_price = formatCurrency(price);
		$("#select_price").html("\uffe5" + fina_price);
	}
}
//点击复选框则计算金额合计
function sumSelectPrice() {
	var item_nums = $("input[name='item_num']");
	var should_prices = $("input[name='should_price']");
	var price = 0;
	for (i = 0; i < item_nums.length; i++) {
		if (item_nums[i].checked == true) {
			//modify by Michael 2012 09-18   修正金额计算精度丢失Bug
			price = (parseFloat(price) + parseFloat(should_prices[i].value)).toFixed(2);
		}
	}
	var fina_price = formatCurrency(price);
	$("#select_price").html("\uffe5" + fina_price);
}
// 自动生成分解单 
function autoDecompose() {
	var ficb_items = $("input[name='ficb_item']");
	var ficb_item = "";
	var should_prices = $("input[name='should_price']");
	var should_price = "";
	var item_counts = $("input[name='item_count']");
	var item_count = "";
	var temp_money = 0;
	var i = 0;
	for (i; i < item_counts.length; i++) {
		if ((ficb_items[i].value) == "\u7f5a\u91d1" || (ficb_items[i].value) == "\u903e\u671f\u5229\u606f") {
			temp_money = parseFloat(temp_money) + parseFloat(should_prices[i].value);
		}
	}
	var income_money = $("#income_money").val();
	if (parseFloat(income_money) < parseFloat(temp_money)) {
		alert("\u6765\u6b3e\u91d1\u989d\u5c0f\u4e8e\u7f5a\u91d1\u548c\u903e\u671f\u5229\u606f\u603b\u8ba1\uff0c\u4e0d\u4e88\u5206\u89e3\uff01");
		return false;
	} else {
		var cust_code = $("#cust_code").val();
		var fiin_id = $("#select_income_id").val();
		var recp_code = $("#recp_code").val();
		var settle_flag = $("#settle_flag").val();
		var opposing_date = $("#opposing_date").val();
		var ficb_flag = $("#ficb_flag").val();
		window.location.href = "../servlet/defaultDispatcher?__action=decompose.autoDecompose&cust_code=" + cust_code + "&select_income_id=" + fiin_id + "&recp_code=" + recp_code + "&settle_flag=" + settle_flag + "&opposing_date=" + opposing_date + "&ficb_flag=" + ficb_flag;
	}
}
function verifyNumber(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        // setFormatCurrency(field);
    } else {
        field.value = 0;
    }
    return field.value;
}
function changeField(field) {
 	var bcamount=verifyNumber(field);
 	$("#bocamount").val(bcamount);
 	sumSelectPrice();
}

