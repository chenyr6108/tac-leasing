<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>供应商往来函</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">	
		  $(function (){
				$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
			});
			function findContractInfos(id){
				var start_date=document.form1.START_DATE.value;
				var end_date=document.form1.END_DATE.value;
        		$("#contractinfo" + id).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=supplier.findContractInfoBySupplierId&end_date="+end_date+"&start_date="+start_date+"&supplierid="+id);
       			 });
			}	
    		function doSearcha(){
    			$("#__currentPage").val("1");
    			form1.submit();
    		}
			function showSupplierBussinessMemo(supplier_id){
				document.supplierBussinessMemo.supplier_id.value=supplier_id;
				document.supplierBussinessMemo.START_DATE.value=document.form1.START_DATE.value;
				document.supplierBussinessMemo.END_DATE.value=document.form1.END_DATE.value;
				document.supplierBussinessMemo.memo.value="";
				$.ajax({
					type:"POST",
					data: '__action=supplier.querySupplierBusinessMemo&supplier_id='+supplier_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						document.supplierBussinessMemo.memo.value=databack.writeBackDetails.MEMO;
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
				$("#showSupplierBussinessMemo").dialog({
					modal:true,
					autoOpen: false,
					width: 450
				});
				$("#showSupplierBussinessMemo").dialog('open');
			}
			
			function createSupplierBussinessMemo(){
				var supplier_id= document.supplierBussinessMemo.supplier_id.value;
				var memo= document.supplierBussinessMemo.memo.value;
				$.ajax({
					type:"POST",
					data: '__action=supplier.createSupplierBusinessMemo&memo='+memo+'&supplier_id='+supplier_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						alert(databack.writeBackDetails.strReturn);
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
				$("#showSupplierBussinessMemo").dialog('close');
			}
			//Birt 导出供应商往来函 
			function exportSupplierBusiness(supplier_id,supplier_name){
				var start_date=document.form1.START_DATE.value;
				var end_date=document.form1.END_DATE.value;
				window.parent.callBirt("birtReport/exportSupplierBusinessLetter/supplierBusinessLetter.rptdesign","pdf",{"start_date":start_date,"end_date":end_date,"supplier_id":supplier_id,"supplier_name":encodeURI(supplier_name)});
			}
		</script>		
	</head>
	<body>
		<form id="form1" name="form1" method="POST"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="supplier.findSupplierByFinanceDate" />
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
	          <div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				           <tr>
				          <td colspan="6">起始日期:<input type="text" name="START_DATE" id="START_DATE" value="${START_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>
				  		&nbsp;结束日期&nbsp;<input type="text" name="END_DATE" id="END_DATE" value="${END_DATE }" style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly>&nbsp;查询内容：<input type="text" name="searchValue" value="${searchValue }" 
				          style=" width:200px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearcha();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>

				<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr >
							<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head" align="left">
										供应商名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" align="left">
										操作
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" align="left">
										导出往来函
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dw.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: left;"><a href="#" onclick="findContractInfos('${item.ID }')">${item.NAME }&nbsp;</td>
										<td style="text-align: left;"><a href="javascript:void(0);" onclick="showSupplierBussinessMemo('${item.ID }')">输入备注说明</a></td>
										<td><a href="#"  onclick="exportSupplierBusiness('${item.ID }','${item.NAME }')">导出往来函</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="9" align="center">
											<div id="contractinfo${item.ID }" align="center"
												style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
												<img src="${ctx }/images/loading.gif">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${dw }"/>
				</div>
				</div>
				</div>
			
		</form>
		
		<!------------弹出层:添加供应商往来函备注信息------------>
<div style="display: none;" id="showSupplierBussinessMemo" title="您当前的位置:添加供应商往来函备注信息">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="supplierBussinessMemo" id="supplierBussinessMemo" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action" value="supplier.createSupplierBusinessMemo" />
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showSupplierBussinessMemoTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">备注说明:</td>
						<td style="text-align: left;"><textarea rows="15" cols="5" name="memo" style="width:100%;"></textarea></td>
						<input name="supplier_id" size="30" type="hidden" />
						<input type="hidden" name="START_DATE" id="START_DATE">
						<input type="hidden" name="END_DATE" id="END_DATE" >
						
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="2"><input type="button" id="subUpload" value="确&nbsp;定" onclick="createSupplierBussinessMemo()" class="ui-state-default ui-corner-all" ></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>		
	</body>
</html>