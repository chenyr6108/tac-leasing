<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客户拜访计划</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">

	$(function (){
		$("#DATE").datepicker($.datepicker.regional['zh-CN']);
	});	
	
	function enableHoliday() {
		$("input[name='FULL_DAY']").attr("disabled",false);
		
		//if($("#FULL_DAY").attr("checked")) {
			$("#EMPOLDER_WAY").attr("disabled",true);
			$("#OBJECT").attr("disabled",true);
			$("#INTENT").attr("disabled",true);
			$("#province_id").attr("disabled",true);
			$("#city_id").attr("disabled",true);
			$("#area_id").attr("disabled",true);
			$("#FROM_HOUR").attr("disabled",true);
			$("#FROM_MIN").attr("disabled",true);
			$("#TO_HOUR").attr("disabled",true);
			$("#TO_MIN").attr("disabled",true);
			$("input[name='WITH_SUPERVISOR']").attr("disabled",true);
			$("#IMPORTANT_RECORD").attr("disabled",true);
			$("#REMARK").attr("disabled",true);
			
			$("#HOLIDAY_FROM_HOUR_PART").attr("disabled",false);
			$("#HOLIDAY_FROM_MIN_PART").attr("disabled",false);
			$("#HOLIDAY_TO_HOUR_PART").attr("disabled",false);
			$("#HOLIDAY_TO_MIN_PART").attr("disabled",false);
			
			$("input[name='COLLEAGUE']").attr("disabled",true);
			$("#EMPLOYEE").attr("disabled",true);
			/*}  else {
			if($("#HOLIDAY_FROM_HOUR_PART").val()==8&&$("#HOLIDAY_TO_HOUR_PART").val()==17&&$("#HOLIDAY_TO_MIN_PART").val()==30) {
				$("#EMPOLDER_WAY").attr("disabled",true);
				$("#OBJECT").attr("disabled",true);
				$("#INTENT").attr("disabled",true);
				$("#province_id").attr("disabled",true);
				$("#city_id").attr("disabled",true);
				$("#area_id").attr("disabled",true);
				$("#FROM_HOUR").attr("disabled",true);
				$("#FROM_MIN").attr("disabled",true);
				$("#TO_HOUR").attr("disabled",true);
				$("#TO_MIN").attr("disabled",true);
				$("input[name='WITH_SUPERVISOR']").attr("disabled",true);
				$("#CONTENT").attr("disabled",true);
			} else {
				$("#EMPOLDER_WAY").attr("disabled",false);
				$("#OBJECT").attr("disabled",false);
				$("#INTENT").attr("disabled",false);
				$("#province_id").attr("disabled",false);
				$("#city_id").attr("disabled",false);
				$("#area_id").attr("disabled",false);
				$("#FROM_HOUR").attr("disabled",false);
				$("#FROM_MIN").attr("disabled",false);
				$("#TO_HOUR").attr("disabled",false);
				$("#TO_MIN").attr("disabled",false);
				$("input[name='WITH_SUPERVISOR']").attr("disabled",false);
				$("#CONTENT").attr("disabled",false);
			}
		} */
	}
	
	function disableHoliday() {
		$("input[name='FULL_DAY']").attr("disabled",true);
		
		$("#EMPOLDER_WAY").attr("disabled",false);
		$("#OBJECT").attr("disabled",false);
		$("#INTENT").attr("disabled",false);
		$("#province_id").attr("disabled",false);
		$("#city_id").attr("disabled",false);
		$("#area_id").attr("disabled",false);
		$("#FROM_HOUR").attr("disabled",false);
		$("#FROM_MIN").attr("disabled",false);
		$("#TO_HOUR").attr("disabled",false);
		$("#TO_MIN").attr("disabled",false);
		$("input[name='WITH_SUPERVISOR']").attr("disabled",false);
		$("#IMPORTANT_RECORD").attr("disabled",false);
		$("#REMARK").attr("disabled",false);
		
		$("#HOLIDAY_FROM_HOUR_PART").attr("disabled",true);
		$("#HOLIDAY_FROM_MIN_PART").attr("disabled",true);
		$("#HOLIDAY_TO_HOUR_PART").attr("disabled",true);
		$("#HOLIDAY_TO_MIN_PART").attr("disabled",true);
		
		$("input[name='COLLEAGUE']").attr("disabled",false);
		
		if($("#COLLEAGUE_N").attr("checked")) {
			$("#EMPLOYEE").attr("disabled",true);
		}
		if($("#COLLEAGUE_Y").attr("checked")) {
			$("#EMPLOYEE").attr("disabled",false);
		}
	}
	
	//暂时不用了
	function checkHour() {
		
		if($("#HOLIDAY_FROM_HOUR_PART").val()==8&&$("#HOLIDAY_TO_HOUR_PART").val()==17&&$("#HOLIDAY_TO_MIN_PART").val()==30) {
			$("#EMPOLDER_WAY").attr("disabled",true);
			$("#OBJECT").attr("disabled",true);
			$("#INTENT").attr("disabled",true);
			$("#province_id").attr("disabled",true);
			$("#city_id").attr("disabled",true);
			$("#area_id").attr("disabled",true);
			$("#FROM_HOUR").attr("disabled",true);
			$("#FROM_MIN").attr("disabled",true);
			$("#TO_HOUR").attr("disabled",true);
			$("#TO_MIN").attr("disabled",true);
			$("input[name='WITH_SUPERVISOR']").attr("disabled",true);
			$("#CONTENT").attr("disabled",true);
		} else {
			$("#EMPOLDER_WAY").attr("disabled",false);
			$("#OBJECT").attr("disabled",false);
			$("#INTENT").attr("disabled",false);
			$("#province_id").attr("disabled",false);
			$("#city_id").attr("disabled",false);
			$("#area_id").attr("disabled",false);
			$("#FROM_HOUR").attr("disabled",false);
			$("#FROM_MIN").attr("disabled",false);
			$("#TO_HOUR").attr("disabled",false);
			$("#TO_MIN").attr("disabled",false);
			$("input[name='WITH_SUPERVISOR']").attr("disabled",false);
			$("#CONTENT").attr("disabled",false);
		}
	}
	
	//切换全天假和非全天假 暂时不用了
	function changeHoliday() {
		if($("#FULL_DAY").attr("checked")) {
			$("#EMPOLDER_WAY").attr("disabled",true);
			$("#OBJECT").attr("disabled",true);
			$("#INTENT").attr("disabled",true);
			$("#province_id").attr("disabled",true);
			$("#city_id").attr("disabled",true);
			$("#area_id").attr("disabled",true);
			$("#FROM_HOUR").attr("disabled",true);
			$("#FROM_MIN").attr("disabled",true);
			$("#TO_HOUR").attr("disabled",true);
			$("#TO_MIN").attr("disabled",true);
			$("input[name='WITH_SUPERVISOR']").attr("disabled",true);
			$("#CONTENT").attr("disabled",true);
			
			$("#HOLIDAY_FROM_HOUR_FULL").attr("disabled",false);
			$("#HOLIDAY_FROM_MIN_FULL").attr("disabled",false);
			$("#HOLIDAY_TO_HOUR_FULL").attr("disabled",false);
			$("#HOLIDAY_TO_MIN_FULL").attr("disabled",false);
			
			$("#HOLIDAY_FROM_HOUR_PART").attr("disabled",true);
			$("#HOLIDAY_FROM_MIN_PART").attr("disabled",true);
			$("#HOLIDAY_TO_HOUR_PART").attr("disabled",true);
			$("#HOLIDAY_TO_MIN_PART").attr("disabled",true);
		} else {
			$("#EMPOLDER_WAY").attr("disabled",false);
			$("#OBJECT").attr("disabled",false);
			$("#INTENT").attr("disabled",false);
			$("#province_id").attr("disabled",false);
			$("#city_id").attr("disabled",false);
			$("#area_id").attr("disabled",false);
			$("#FROM_HOUR").attr("disabled",false);
			$("#FROM_MIN").attr("disabled",false);
			$("#TO_HOUR").attr("disabled",false);
			$("#TO_MIN").attr("disabled",false);
			$("input[name='WITH_SUPERVISOR']").attr("disabled",false);
			$("#CONTENT").attr("disabled",false);
			
			$("#HOLIDAY_FROM_HOUR_FULL").attr("disabled",true);
			$("#HOLIDAY_FROM_MIN_FULL").attr("disabled",true);
			$("#HOLIDAY_TO_HOUR_FULL").attr("disabled",true);
			$("#HOLIDAY_TO_MIN_FULL").attr("disabled",true);
			
			$("#HOLIDAY_FROM_HOUR_PART").attr("disabled",false);
			$("#HOLIDAY_FROM_MIN_PART").attr("disabled",false);
			$("#HOLIDAY_TO_HOUR_PART").attr("disabled",false);
			$("#HOLIDAY_TO_MIN_PART").attr("disabled",false);
		}
	}
	
	//初始化省份
	getCitys = function() {
		provinceId=$("#province_id").val();
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
			dataType:'json',
			success:function(dataBack) { 
				 $('#city_id option').each(function() {  
				     if($(this).val() != '-1'){  
				         $(this).remove();  
				     }  
				 });
				for(i=0;i<dataBack.citys.length;i++) {
					$("#city_id").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
				}
			}
		});
		
		 $('#area_id option').each(function() {  
		       $(this).remove();  
			 
		 });
		 $("#area_id").get(0).options.add(new Option("-请选择区-",-1));
	}

	function getArea() {
		cityId=$("#city_id").val();
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
			dataType:'json',
			success:function(dataBack){ 
				 $('#area_id option').each(function() {  
				     if($(this).val() != '-1') {  
				         $(this).remove();  
				     }  
				 });
				for(var i=0;i<dataBack.area.length;i++) {
					$("#area_id").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
				}
			}
		});
	}
	
	function getImportanceRecord() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=customerVisitCommand.getImportanceRecord&shortName='+$("#INTENT").val(),
			dataType:'json',
			success:function(dataBack){ 
				 $('#IMPORTANT_RECORD option').each(function() {  
				     if($(this).val() != '-1') {  
				         $(this).remove();  
				     }  
				 });
				for(var i=0;i<dataBack.length;i++) {
					$("#IMPORTANT_RECORD").get(0).options.add(new Option(dataBack[i].FLAG,dataBack[i].CODE)); 
				}
			}
		});
	}
	
	function submitCustVisit() {
		if($("#YES_HOLIDAY").attr("checked")==false) {
			if($("#DATE").val()=='') {
				alert("请选择时间!");
				$("#DATE").focus();
				return;
			}
			if($("#OBJECT").val().trim()=='') {
				alert("请输入对象!");
				$("#OBJECT").focus();
				return;
			}
		} else {
			if($("#DATE").val()=='') {
				alert("请选择时间!");
				$("#DATE").focus();
				return;
			}
			/* if($("#FULL_DAY").attr("checked")) {
				
			} else {
				if($("#HOLIDAY_FROM_HOUR_PART").val()==8&&$("#HOLIDAY_TO_HOUR_PART").val()==17&&$("#HOLIDAY_TO_MIN_PART").val()==30) {
					
				} else {
					if($("#DATE").val()=='') {
						alert("请选择时间!");
						$("#DATE").focus();
						return;
					}
					if($("#OBJECT").val().trim()=='') {
						alert("请输入对象!");
						$("#OBJECT").focus();
						return;
					}
				}
			} */
		}
		//验证时间大小
		if(parseInt($("#TO_HOUR").val())<parseInt($("#FROM_HOUR").val())) {
			alert("拜访开始时间应该小于结束时间!");
			return;
		} else if(parseInt($("#TO_HOUR").val())==parseInt($("#FROM_HOUR").val())) {
			if(parseInt($("#FROM_MIN").val())!=0) {
				alert("拜访开始时间应该小于结束时间!");
				return;
			} else {
				if(parseInt($("#TO_MIN").val())==0) {
					alert("拜访开始时间应该小于结束时间!");
					return;
				}
			}
		}
		$("#button").attr("disabled",true);
		$("#form").submit();
	}
	
	function isColleague(param) {
		if(param=='Y') {
			$("#EMPLOYEE").attr("disabled",false);
		} else if(param=='N') {
			$("#EMPLOYEE").attr("disabled",true);
		}
	}
</script>
</head>
<body>
<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="customerVisitCommand.add">
		<input type="hidden" name="RESULT" id="RESULT" value="${RESULT }">
		
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;">
			<span class="ui-jqgrid-title" style="line-height:30px;font-size:15px;">&nbsp;&nbsp;新增拜访记录</span>
</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="text-align: center;"> 
				<table cellspacing="1" cellpadding="3" border="0" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" width="100%">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right"><strong>业务人员：</strong></td>
						<td colspan="3">${NAME }</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>日期：</strong><font color="red">*</font></td>
						<td colspan="3"><input type="text" id="DATE" name="DATE" class="tb_return" value="${DATE }" style="text-align: left;" readonly="readonly"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						是否请假:
						<input type="radio" name="HOLIDAY" checked="checked" onclick="disableHoliday()" value="N" id="NO_HOLIDAY">否
						<input type="radio" name="HOLIDAY" onclick="enableHoliday()" value="Y" id="YES_HOLIDAY">是&nbsp;
									<select class="tb_return_t" id="HOLIDAY_FROM_HOUR_PART" name="HOLIDAY_FROM_HOUR_PART" style="width:40px;" disabled="disabled">
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
									</select>:
									<select class="tb_return_t" id="HOLIDAY_FROM_MIN_PART" name="HOLIDAY_FROM_MIN_PART" style="width:40px;" disabled="disabled">
										<option value="0">00</option>
										<option value="30" selected="selected">30</option>
									</select>至
								    <select class="tb_return_t" id="HOLIDAY_TO_HOUR_PART" name="HOLIDAY_TO_HOUR_PART" style="width:40px;" disabled="disabled">
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17" selected="selected">17</option>
									</select>:
									<select class="tb_return_t" id="HOLIDAY_TO_MIN_PART" name="HOLIDAY_TO_MIN_PART" style="width:40px;" disabled="disabled">
										<option value="0">00</option>
										<option value="30" selected="selected">30</option>
									</select>
						</td>
						<!-- <td>
						<table>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td>
									<input type="radio" name="FULL_DAY" value="Y" disabled="disabled" checked="checked" id="FULL_DAY">全天假&nbsp;&nbsp;&nbsp;&nbsp;
								<select class="tb_return_t" id="HOLIDAY_FROM_HOUR_FULL" name="HOLIDAY_FROM_HOUR_FULL" style="width:40px;" disabled="disabled">
									<option value="8">08</option>
								</select>:
								<select class="tb_return_t" id="HOLIDAY_FROM_MIN_FULL" name="HOLIDAY_FROM_MIN_FULL" style="width:40px;" disabled="disabled">
									<option value="30">30</option>
								</select>至
							    <select class="tb_return_t" id="HOLIDAY_TO_HOUR_FULL" name="HOLIDAY_TO_HOUR_FULL" style="width:40px;" disabled="disabled">
									<option value="17">17</option>
								</select>:
								<select class="tb_return_t" id="HOLIDAY_TO_MIN_FULL" name="HOLIDAY_TO_MIN_FULL" style="width:40px;" disabled="disabled">
									<option value="30">30</option>
								</select>
								</td>
							</tr>
							<tr class="ui-state-default ui-jqgrid-hdiv">
								<td>
									<input type="radio" name="FULL_DAY" value="N" disabled="disabled" id="PART_DAY">非全天假
									<select class="tb_return_t" id="HOLIDAY_FROM_HOUR_PART" name="HOLIDAY_FROM_HOUR_PART" style="width:40px;" disabled="disabled">
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
									</select>:
									<select class="tb_return_t" id="HOLIDAY_FROM_MIN_PART" name="HOLIDAY_FROM_MIN_PART" style="width:40px;" disabled="disabled">
										<option value="0">00</option>
										<option value="30" selected="selected">30</option>
									</select>至
								    <select class="tb_return_t" id="HOLIDAY_TO_HOUR_PART" name="HOLIDAY_TO_HOUR_PART" style="width:40px;" disabled="disabled">
										<option value="8">08</option>
										<option value="9">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17" selected="selected">17</option>
									</select>:
									<select class="tb_return_t" id="HOLIDAY_TO_MIN_PART" name="HOLIDAY_TO_MIN_PART" style="width:40px;" disabled="disabled">
										<option value="0">00</option>
										<option value="30" selected="selected">30</option>
									</select>
								</td>
							</tr>
						</table>
						</td> -->
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>对象：</strong><font color="red">*</font></td>
						<td colspan="3">
						<input type="text" id="OBJECT" name="OBJECT" class="tb_return" value="${OBJECT }" style="text-align: left;width: 300px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>开拓方式：</strong><font color="red">*</font></td>
						<td colspan="3">
							<select class="tb_return_t" id="EMPOLDER_WAY" name="EMPOLDER_WAY">
									<c:forEach items="${empolderWayList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>						
							</select>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>拜访地点：</strong><font color="#EAF4FD">*</font></td>
						<td colspan="3">
							<select id="province_id" name="province_id" onchange="getCitys();">
								<option value="-1" selected="selected">-请选择省份-</option>
								<c:forEach items="${provinces}" var="item"><option value="${item.ID }">${item.NAME }</option></c:forEach>
							</select>
							<select id="city_id" name="city_id"  onchange="getArea();">
								<option value="-1" selected="selected">-请选择市区-</option>
							</select>
							<select id="area_id" name="area_id">
								<option value="-1" selected="selected">
									-请选择区-
								</option>
							</select>
						&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>目的：</strong><font color="red">*</font></td>
						<td style="width:100px;">
							<select class="tb_return_t" id="INTENT" name="INTENT" onchange="getImportanceRecord()">
									<c:forEach items="${intentList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
						<td align="right" style="width:80px;"><strong>重点记录：</strong><font color="red">*</font></td>
						<td>
							<select class="tb_return_t" id="IMPORTANT_RECORD" name="IMPORTANT_RECORD">
									<c:forEach items="${importRecordList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>拜访时段：</strong><font color="red">*</font></td>
						<td align="left" colspan="3">
						<select class="tb_return_t" id="FROM_HOUR" name="FROM_HOUR" style="width:40px;">
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select>:
						<select class="tb_return_t" id="FROM_MIN" name="FROM_MIN" style="width:40px;">
							<option value="0">00</option>
							<option value="30">30</option>
						</select>至
					    <select class="tb_return_t" id="TO_HOUR" name="TO_HOUR" style="width:40px;">
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23" selected="selected">23</option>
						</select>:
						<select class="tb_return_t" id="TO_MIN" name="TO_MIN" style="width:40px;">
							<option value="0">00</option>
							<option value="30" selected="selected">30</option>
						</select>
						</td>						
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>主管陪同：</strong><font color="red">*</font></td>
						<td colspan="3"><input type="radio" value="N" checked="checked" name="WITH_SUPERVISOR">否<input type="radio" value="Y" name="WITH_SUPERVISOR">是&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right">是否委托同仁：<font color="red">*</font></td><td style="width:100px;"><input type="radio" value="N" checked="checked" name="COLLEAGUE" onclick="isColleague('N')" id="COLLEAGUE_N">否<input type="radio" value="Y" name="COLLEAGUE" onclick="isColleague('Y')"  id="COLLEAGUE_Y">是&nbsp;</td>
						<td align="right" style="width:80px;">人员：<font color="#EAF4FD">*</font></td>
						<td>
							<select class="tb_return_t" id="EMPLOYEE" name="EMPLOYEE" disabled="disabled">
									<c:forEach items="${employeeList }" var="item">
										<option value="${item.employeeId }">${item.name }</option>
									</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="right" style="width:100px;"><strong>备注：</strong><font color="#EAF4FD">*</font><br><br><br><br></td>
						<td colspan="3"><textarea rows="10" cols="110" id="REMARK" name="REMARK"></textarea>&nbsp;</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td align="center" colspan="4">
							<input type="button" value="保存" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="submitCustVisit()" id="button">
						</td>
					</tr>
				</table>
	</div>
</form>
<script type="text/javascript">
	if($("#RESULT").val()=='Y') {
		alert("新增成功!");
	} else if($("#RESULT").val()=='N') {
		alert("新增失败!");
	}
</script>
</body>