<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag });
				$("#payDate").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='settleDate']").datepicker($.datepicker.regional['zh-CN']);
			});
			
			function selectCard(cardFlag) {
				$("#cardFlag").val(cardFlag);
				$("#form1").submit();
			}
			
			//生成凭证
			function generateVoucher(id) {
				if($("#settleDate"+id).val()=="") {
					alert("请选择传票日期!");
					$("#settleDate"+id).focus();
					return;
				}
				if(!confirm("确认抛转?")) {
					return;
				}
				$.ajax({//验证是否已经生成凭证
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=kingDeerCommand.checkResult&id='+id,
					dataType:'json',
					success:function(flag) {
						if(flag) {
							alert("此数据已经生成凭证,系统将为你刷新页面!");
							$("#form1").submit();
						} else {
							$.ajax({//生成凭证
								type:"post",
								url:'../servlet/defaultDispatcher',
								data:'__action=kingDeerCommand.generateVoucherForPayment&id='+id+'&settleDate='+$("#settleDate"+id).val()+'&cardFlag='+$("#cardFlag").val()+'&contractType=-1',
								dataType:'json',
								success:function(outputMap) {
									if(outputMap.errorMsg!="") {
										alert(outputMap.errorMsg);
									} else {
										alert("抛转成功!");
										$("#form1").submit();
									}
								}
							});
						}
					}
				});
			}
			
			function selAllForCar() {//全选框for乘用车
				if($("input[name='chkAll']").attr("checked")) {
					$("input[type='checkbox'][name='batchVoucherForCar']").each(function () {
						if(!$(this).attr("disabled")) {
							$(this).attr("checked",true);
						}
					});
				} else {
					$("input[type='checkbox'][name='batchVoucherForCar']").each(function () {
						$(this).attr("checked",false);
					});
				}
			}
			
			function batchAddForCar() {
				var flag=true;
				var ids="";
				$("input[type='checkbox'][name='batchVoucherForCar']").each(function () {
					if($(this).attr("checked")) {
						flag=false;
						if(ids=="") {
							ids=$(this).val();
						} else {
							ids=ids+"-"+$(this).val();
						}
					}
				});
				if(flag) {
					alert("至少选择1条数据!");
					return;
				}
				$.ajax({//批量添加
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=kingDeerCommand.batchAdd&ids='+ids+'&payDate='+$("#payDate").val()+'&cardFlag='+$("#cardFlag").val(),
					dataType:'json',
					success:function(outputMap) {
						alert(outputMap.msg);
						$("#form1").submit();
					}
				});
			}
			
			function batchQueryForCar() {//批量处理for乘用车
				$("#batchQueryDetail").toggle(
				function() {
					$("#batchQueryDetail").load("../servlet/defaultDispatcher?__action=kingDeerCommand.paymentBatchQuery&flag=CAR");
				});
				$('#batchQueryDetail').dialog({
					closeOnEscape:false,
					modal:true,
					autoOpen:false,
					height:800,
					width:1024,
					resizable:false,
					title:"批量抛转",
					close:function() {
						$("#form1").submit();
					}
				});	
				$('#batchQueryDetail').dialog('open');
			}
			
			function delBatchId(batchFlag,id) {
				$.ajax({//删除某条批量的数据
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=kingDeerCommand.delBatchId&id='+id+'&flag='+batchFlag,
					dataType:'json',
					success:function(outputMap) {
						$('#tr'+id).remove();
						if($('#batchQueryDetail').find("table").find("tr").length==2) {
							$('#batchQueryDetail').dialog('close');
						}
					}
				});
			}
			
			function batchDel() {
				if(!confirm("确认全部清除?")) {
					return;
				}
				$.ajax({//删除所有的批量数据
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=kingDeerCommand.delBatchIds',
					dataType:'json',
					success:function(data) {
						alert("清除成功!");
						$("#form1").submit();
					}
				});
			}
			//批量生成凭证,从session查找数据源
			function batchGenerateVoucher() {
				$.ajax({//批量生成凭证
					type:"post",
					url:'../servlet/defaultDispatcher',
					data:'__action=kingDeerCommand.batchGenerateVoucherForPayment&flag='+$("#flag").val()+'&settleDate='+$("input[name='batchSettleDate']").val(),
					dataType:'json',
					success:function(outputMap) {
						alert(outputMap.msg);
						$("#form1").submit();
					}
				});
			}
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="tabs">
			<ul>
				<li style="width: 110px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0)">乘用车拨款</a></li>
				<li style="width: 110px;text-align: center;"><a href="#tabs-2" onclick="selectCard(1)">设备拨款</a></li>
				<li style="width: 110px;text-align: center;"><a href="#tabs-3" onclick="selectCard(2)">商用车拨款</a></li>
			</ul>
			<form name="form1" id="form1" action="${ctx}/servlet/defaultDispatcher" method="post">
				<input type="hidden" id="cardFlag" name="cardFlag" value="${cardFlag }"/>
				<input type="hidden" id="__action" name="__action" value="${__action }"/>
				<br>	    
					<table width="800" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				        <td width="54" class="ss_bigo">&nbsp;</td>
				        <td width="600" class="ss_bigt" valign="center">
				         <table>
				         	<tr>
				         		<td style="text-align: right;">
				         			拨款日：
				         		</td>
				         		<td>
				         			<input readonly="readonly" id="payDate" name="payDate" value="${payDate }" style="width: 80px;">
				         		</td>
				         		<td>
				         			租赁方式：
				         		</td>
				         		<td>
				         			<select id="contractType" name="contractType">
				         				<option value="-1">--所有--</option>
				         				<c:if test="${cardFlag==0 }">
				         					<option value="8" <c:if test="${contractType eq '8' }">selected="selected"</c:if>>新车委贷</option>
				         					<option value="14" <c:if test="${contractType eq '14' }">selected="selected"</c:if>>二手车委贷</option>
				         					<option value="10" <c:if test="${contractType eq '10' }">selected="selected"</c:if>>新车回租</option>
				         					<option value="12" <c:if test="${contractType eq '12' }">selected="selected"</c:if>>二手车回租</option>
				         					<option value="13" <c:if test="${contractType eq '13' }">selected="selected"</c:if>>原车回租</option>
				         				</c:if>
				         				<c:if test="${cardFlag==1 }">
				         					<option value="7" <c:if test="${contractType eq '7' }">selected="selected"</c:if>>直接租赁</option>
				         					<option value="9" <c:if test="${contractType eq '9' }">selected="selected"</c:if>>设备售后回租</option>
				         				</c:if>
				         				<c:if test="${cardFlag==2 }">
				         					<option value="4" <c:if test="${contractType eq '4' }">selected="selected"</c:if>>商用车回租</option>
				         					<option value="11" <c:if test="${contractType eq '11' }">selected="selected"</c:if>>商用车售后回租</option>
				         				</c:if>
				         			</select>
				         		</td>
				         	</tr>
				         	<tr>
			         			<td style="text-align: right;">公司别：</td>
				         		<td>
				         			<select id="companyCode" name="companyCode" style="width: 80px;">
				         				<option value="1" <c:if test="${companyCode == 1 }">selected="selected"</c:if>>
				         					裕融
				         				</option>
				         				<option value="2" <c:if test="${companyCode == 2 }">selected="selected"</c:if>>
				         					裕国
				         				</option>
				         			</select>
			         			</td>
			         			<td>查询内容：</td>
			         			<td><input id="content" name="content" value="${content }" style="width:263px;"></td>
				         	</tr>
		       			 </table>
       					</td>
			            <td width="100" class="ss_bigt">
			       		 <a href="javaScript:void(0)" id="search" onclick="doSearch()" class="blue_button">搜 索</a>
				        </td>
		         	    <td width="13" class="ss_bigth" valign="top">&nbsp;
		         	    </td>
				      </tr>
				     </table>
		    	 <br>
		    	 <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<div class="zc_grid_body" style="background: white">
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td style="border-right: 0">
									<c:if test="${cardFlag == 0 }"><!-- 乘用车类型 -->
										<input type="button" class="panel_button" value="批量添加" onclick="batchAddForCar()">
										<c:if test="${not empty batchIds }">
											<input type="button" class="panel_button" value="批量抛转...(${fn:length(batchIds)})" onclick="batchQueryForCar()">
										</c:if>
										<c:if test="${empty batchIds }">
											<input type="button" class="panel_button" value="批量抛转..." disabled="disabled">
										</c:if>
									</c:if>
									<c:if test="${cardFlag == 1 }"><!-- 设备类型 -->
									
									</c:if>
									<c:if test="${cardFlag == 2 }"><!-- 商用车类型 -->
									
									</c:if>
									<c:if test="${not empty batchIds }">
										<input type="button" class="panel_button" value="批量清除(${fn:length(batchIds)})" onclick="batchDel()">
									</c:if>
									<c:if test="${empty batchIds }">
										<input type="button" class="panel_button" value="批量清除" disabled="disabled">
									</c:if>
								</td>
								<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
							</tr>
						</table>
							<div id="tabs-1">
								<%@ include file="/kingDeer/payment/car.jsp"%>
							</div>
							<div id="tabs-2">
								<%@ include file="/kingDeer/payment/equ.jsp"%>
							</div>
							<div id="tabs-3">
								<%@ include file="/kingDeer/payment/motor.jsp"%>
							</div>
						<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
							<tr>
								<td><page:pagingToolbar pagingInfo="${dw }"/></td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</form>
			<div id="batchQueryDetail" style="display: none;">
				<img src="${ctx }/images/loading.gif">
			</div>
		</div>
	</body>
</html>