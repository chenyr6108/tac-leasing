<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/customer/js/custLinkRecord.js" type="text/javascript"></script>

<script>
	function getImportanceRecord() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=customer.getImportanceRecord&shortName='+$("#INTENT").val(),
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
</script>	
<form id="" name="" method="POST"
	action="#">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title" id="CustLinkRecord1">
		<thead>
		<tr class="ui-jqgrid-labels"> 
				<th colspan="8" align="right" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right">
					操作：<a href="javascript:void(0)" onclick="showDivAddCustLinkRecord();">添加</a>
				</th>
			</tr>
			<tr>
				<td style="width:4%;text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td  style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					日期
				</td>
				<td  style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					开始时间
				</td >
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					结束时间
				</td>
				<td style="width:7%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					负责人
				</td>
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					目的
				</td>
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					重点记录
				</td>
				<td style="  text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					内容
				</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${custLinkRecord}" var="item" varStatus="status">
				<tr id="LinkRecord_${item.CULR_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center">${status.count }<input type="hidden" name="count" value="${status.count }"></td>
					<td style="text-align: center">${item.LINK_DATE }&nbsp;</td>
					<td style="text-align: center">${item.FROM_TIME }&nbsp;</td>
					<td style="text-align: center">${item.TO_TIME }&nbsp;</td>
					<td style="text-align: center">${item.LINK_PRINCIPAL }&nbsp;</td>
					<td style="text-align: center">${item.INTENTDESCR }&nbsp;</td>
					<td style="text-align: center">${item.IMPORTANTDESCR }&nbsp;</td>
					<td style="text-align: center">${item.LINK_DETAILS }&nbsp;</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="AddCustLinkRecord" style="display: none" title="添加联系记录">
	<form action="#" method="post" id="divAddCustLinkRecordForm">
	<input type="hidden" name="Record_LINK_CUSTOMER" id="Record_LINK_CUSTOMER" size="30" value="${cust.CUST_NAME }" readonly="readonly">
	<input type="hidden" name="SELLOPPORTUNITY" id="Record_SELLOPPORTUNITY"size="30">
	<select name="TYPE" id="Record_LINK_TYPE" style="display: none"><option value="0">客户巡视</option><option value="1">日常沟通</option></select>
	<input type="hidden" name="Record_LINK_THEME" id="Record_LINK_THEME" size="65" />
	<select  id="Record_LINK_MAN" style="display: none"></select>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 40px;">负责人</td>
						<td style="width: 80px;"><input type="text" name="LINK_PRINCIPAL" id="Record_LINK_PRINCIPAL" readonly="readonly" value="${s_employeeName }"></td>
						<td style="width: 40px;">日期</td>
						<td style="width: 80px;"><input type="text" name="LINK_DATE" readonly="readonly" id="Record_LINK_DATE" value="${date }"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>开始时间</td>
					<td><select id="FROM_HOUR" class="tb_return_t" style="width:40px;" name="FROM_HOUR">
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
						</select>:<select id="FROM_MIN" class="tb_return_t" style="width:40px;" name="FROM_MIN">
						<option value="0">00</option>
						<option value="30">30</option></select></td>
					<td>结束时间</td>
					<td><select id="TO_HOUR" class="tb_return_t" style="width:40px;" name="TO_HOUR">
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
						<option selected="selected" value="23">23</option>
						</select>:<select id="TO_MIN" class="tb_return_t" style="width:40px;" name="TO_MIN">
						<option value="0">00</option>
						<option selected="selected" value="30">30</option>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>目的</td>
						<td><select id="INTENT" name="INTENT" onchange="getImportanceRecord()">
									<c:forEach items="${intentList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
						<td>重点记录</td>
						<td><select id="IMPORTANT_RECORD" name="IMPORTANT_RECORD">
									<c:forEach items="${importRecordList }" var="item">
										<option value="${item.CODE }">${item.FLAG }</option>
									</c:forEach>
							</select>
						</td>
				</tr>
				<!-- <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td></td>
						<td>联系人</td>
						<td></td>
				</tr> -->
				<!-- <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>类型</td>
						<td></td>
						<td>销售机会</td>
						<td></td>
				</tr> -->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td colspan="3"><textarea name="LINK_DETAILS" id="Record_LINK_DETAILS" cols="80" rows="3"></textarea></td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td><!-- 备注 --></td>
						<td colspan="3" style="display: none"><textarea name="LINK_MEMO" id="Record_LINK_MEMO"  cols="80" rows="3"></textarea></td>
				</tr>
							</table>
							<center>
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="submitAddCustLinkRecord()">
							<input type="button" value="取消" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkRecord()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkRecordst" >
							<br>
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
