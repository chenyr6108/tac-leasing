<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script>
	function approveOrReject(id,code,type) {
		var descr="";
		if(code==1) {
			descr="通过";
		} else {
			descr="驳回";
		}
		if(!confirm("确认"+descr+"?")) {
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'rentFinanceCommand.approveOrRejectFund',id:id,code:code,type:type},
			dataType:'json',
			success:function(flag) { 
				alert("操作完成!");
				$("#form1").submit();
			}
		});
	}
	
	function exportFundDetail(id,companyCode){
		if(companyCode==1){
			window.parent.callBirt("birtReport/financeReport/exportFundReturnDetail.rptdesign","pdf",{"detail_id":id});
		}else{
			window.parent.callBirt("birtReport/financeReport/exportFundReturnDetailForYuGuo.rptdesign","pdf",{"detail_id":id});
		}
		
		
	}
	
</script>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
		<div class="zc_grid_body">
			<table class="panel_table">
				<tr>
					<th>
						序号
					</th>
					<th>
						认退类型
					</th>
					<th>
						认退状态
					</th>
					<th>
						认退原因
					</th>
					<th>
						认退金额
					</th>
					<th>
						申请人
					</th>
					<th>
						申请时间
					</th>
					<th>
						确认人
					</th>
					<th>
						确认时间
					</th>
					<th>
						操作
					</th>
				</tr>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td style="text-align: center;"> 
							${index.count }
						</td>
						<td style="text-align: center;"> 
							<c:if test="${item.TYPE eq 'CLAIM' }">认领款</c:if>
							<c:if test="${item.TYPE eq 'REFUND' }">退款</c:if>
						</td>
						<td style="text-align: center;"> 
							<c:if test="${item.STATE eq 0 }">待确认</c:if>
							<c:if test="${item.STATE eq 1 }">通过</c:if>
							<c:if test="${item.STATE eq -1 }">驳回</c:if>
						</td>
						<td style="text-align: center;"> 
							${item.REASON }
						</td>
						<td style="text-align: right;"> 
							<fmt:formatNumber type="currency" value="${item.AMOUNT }"/>
						</td>
						<td style="text-align: center;"> 
							${item.CREATE_BY }
						</td>
						<td style="text-align: center;"> 
							<fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td style="text-align: center;"> 
							${item.AUTH_BY }&nbsp;
						</td>
						<td style="text-align: center;"> 
							<fmt:formatDate value="${item.AUTH_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;
						</td>
						<td style="text-align: center;">
							<c:if test="${item.TYPE eq 'REFUND' }">
								<a href="javascript:void(0);" onclick="exportFundDetail('${item.ID}',${item.company_code});">[打印退款单]</a>
							</c:if>
							<c:if test="${APPROVE eq 'Y' }">
								<c:if test="${item.STATE ne 0 }">[通过]</c:if><c:if test="${item.STATE eq 0 }"><a href="javascript:void(0)" onclick="approveOrReject('${item.ID}',1,'${item.TYPE }')">[通过]</a></c:if>&nbsp;
							</c:if>
							<c:if test="${REJECT eq 'Y' }">
								<c:if test="${item.STATE ne 0 }">[驳回]</c:if><c:if test="${item.STATE eq 0 }"><a href="javascript:void(0)" onclick="approveOrReject('${item.ID}',-1,'${item.TYPE }')">[驳回]</a></c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>