<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>保单</title>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		//subNotice 提交
		function subNotice (){
			if(positive($("#zong")[0],"保险总金额")){
				return false;
			}
			if(positive($("#he")[0],"总保险费")){
				return false;
			}
		$("#addform").submit();
		}
		//格式化小数
		$(function (){
			  jQuery.each($("input[name='zhi']"), function() {
			    var zhi=Number($(this).val()).toFixed(2);
					this.value=zhi;
				 var zz= $(this).parent().next().next().next().children().eq(0);
				 zz.val(Number(zz.val()).toFixed(2));
			    });
		});
		//计算
		function jisuan(obj){
			//验证
			if(isNaN(obj.value)){
				alert('此处必须输入数字');
				obj.value='';
			}
			//赋值
			var feilv=$("#INSU_RATE").val();
			var xishu=$("#COEFFICIENT").val();
		$("input[name='feilv']").val(feilv);
		$("input[name='xishu']").val(xishu);
		//计算保费，并且汇总
		var he=0;
		var zong=0;
	    jQuery.each($("input[name='zhi']"), function() {
		    var zhi=Number($(this).val());
		     zong +=zhi;
		    var fei=$(this).parent().next().children().eq(0).val();
		    var ji=Math.round(zhi*Number(fei)/10)/100;
		    $(this).parent().next().next().next().children().eq(0).val(ji);
	//    he +=ji;
	    });
	    jQuery.each($("input[name='baofei']"), function() {
		    var baofei=Number($(this).val());
		    he +=baofei;
	    });
		$("#he").val(he);	    
		$("#zong").val(zong);	   
		}
		//获得公司信息
    	 	function getInsuranceType(producttype){
    	 	var incp_id=$("#INCP_ID").val();
    	 		$.ajax({
					type: "POST",
					url: "../servlet/defaultDispatcher",
					data: "__action=insure.getInsuPolicyType&incp_id="+incp_id,
					dataType: "json",
					success: function(data){
					var company=data.insuCompany;	
					$("#incp_add").val(company.INCP_ADDRESS);
					$("#incp_phone").val(company.INCP_LINKTEL);
				
				}})
    	 	}
    	 	//对设备选择的处理
    	 	function jiancha(obj){
    	 	var dazhi=0;
    	 	var xiaozhi=0;
    	 		if(obj.checked){
    	 				var feilv=$("#INSU_RATE").val();
			var xishu=$("#COEFFICIENT").val();
		$("input[name='feilv']").val(feilv);
		$("input[name='xishu']").val(xishu);
		//计算保费，并且汇总
		var he=0;
		var zong=0;
			    jQuery.each($("input[name='zhi']"), function() {
			    var zhi=Number($(this).val());
			     zong +=zhi;
			    var fei=$(this).parent().next().children().eq(0).val();
			    var ji=Math.round(zhi*Number(fei)/10)/100;
			    $(this).parent().next().next().next().children().eq(0).val(ji);
			    he +=ji;
			    });
			$("#he").val(he);	    
			$("#zong").val(zong);	   
    	 		}else{
    	 		dazhi=$(obj).parent().next().children().eq(0).val();
    	 		xiaozhi=$(obj).parent().next().next().next().next().children().eq(0).val();
    	 		var he=$("#he").val();	    
		        var zong=$("#zong").val();
		        zong=Number(zong)-Number(dazhi);
		        he=Number(he)-Number(xiaozhi);
		        		$("#he").val(he);	    
						$("#zong").val(zong);
    	 		}
    	 	}
		</script>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin2").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin3").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin4").datepicker($.datepicker.regional['zh-CN']);
				$("#datebegin5").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="insure.updateInsuList">
			<input type="hidden" name="INCU_ID" value="${insuList.INCU_ID }">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改保单</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险信息</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="width: 10%; text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险公司</th>
					<td style="width: 40%;"></td>
					<th style="width: 10%; text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">费率(%)</th>
					<td style="width: 40%;">0%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保单号</th>
					<td colspan="3"><input type="text" name="INCU_CODE" id="INCU_CODE" value="${insuList.INCU_CODE}" style="width: 200px;" ></td>
				</tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">商业险投保期限</th>
					<td colspan="3">开始时间： 00：00时起，至 结束时间：24：00时止</td>
	
			    </tr>
			    <tr class="ui-widget-content jqgrow ui-row-ltr">
					<th rowspan="2" style="text-align: left;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">异常状态</th>
					<td colspan="3"><select style="width: 180px;">
						<option value="">无</option>
						<option value="1">待补机号</option>
						<option value="2">待补地址</option>
						<option value="3">保单错误待修改</option>
					</select></td>
					
			   	</tr>
			   	<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="3"><textarea rows="2"  cols='140' name="REMARK" id="REMARK"  >${insuList.REMARK}</textarea></td>
			   	</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="13" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">保险项目及保险金额</td>
				</tr>
				<tr >
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险金额</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">费率（‰）</th>
					<th style="text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险费</th>
					
				
				</tr>
				<c:forEach items="${eqmtType}" var="deepMap" varStatus="status">
					<tr>					
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.THING_NAME }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><input type="text" name="zhi" value="${deepMap.UNIT_PRICE }" onKeyUp="jisuan(this)" />&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><input type="text" name="feilv" value="${insuList.INSU_RATE}" readonly/></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><input type="text" name="baofei" value="${insuList.INSU_RATE*deepMap.UNIT_PRICE /1000}" readonly/>&nbsp;</td>
					</tr>
				</c:forEach>
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保险总金额</th>
					<td style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><input name="INSU_PRICE_TOTAL" value="${insuList.INSU_PRICE_TOTAL }"id="zong"/></td>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">总保险费</th>
					<td style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head"><input name="INSU_PRICE" value="${insuList.INSU_PRICE }" id="he"/></td>
				
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr >
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">投保确认时间：<input type="text" value="${insuList.AFFIRM_INSU_DATE }" name="AFFIRM_INSU_DATE" id="datebegin3"  /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">缴费确认时间：<input type="text" value="${insuList.AFFIRM_SEIZE_DATE }" name="AFFIRM_SEIZE_DATE" id="datebegin4"  /></th>
					<th style="text-align: center;height:26px;width:120px;" class="ui-state-default ui-th-ltr zc_grid_head">保单打印时间：<input type="text" value="${insuList.PRINT_INSU_DATE }" name="PRINT_INSU_DATE" id="datebegin5"   /></th>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="height:26px;">设备信息</td>
				</tr>
				<tr>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备名称</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备型号</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备厂商</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">设备单价</th>
					<th style="width:15%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">机号</th>
					<th style="width:25%; text-align: center;height:26px;" class="ui-state-default ui-th-ltr zc_grid_head">保险物所在地址</th>
				</tr>
				<c:forEach items="${eqmtType}" var="deepMap" varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.THING_NAME }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.MODEL_SPEC }&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.BRAND}&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.BRAND}&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;">${deepMap.BRAND}&nbsp;</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;height:24px;"><fmt:formatNumber type="currency" value="${deepMap.UNIT_PRICE }" ></fmt:formatNumber>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<center>
				<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="subNotice();" value="保   存" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
