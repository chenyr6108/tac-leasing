<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
function showEntey(event){    
	//alert(event.keyCode);
	if(event.keyCode==13)
	{
	        doSearch();   
	                                      
	}
} 
function updateContractHAB(hab,habBefore,actilogId){
	if(hab != null && hab != ''){
		if(confirm("确定要修改么？")){
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:{'__action':'contractCustomerHAB.update',
					'CONTRACT_HAB':hab ,
					'CONTRACT_HAB_BEFORE': habBefore ,
					'ACTILOG_ID':actilogId},
				dataType:'json',
				success: function(dataBack){
					var HAB = '' ;	
					switch(dataBack.HAB){
						case '1' : HAB = 'H' ;
						break ;
						case '2' : HAB = 'A' ;
						break ;
						case '3' : HAB = 'B' ;
						break ;
					}
					alert("HAB成功修改为"+HAB) ;
					//document.location.reload();
					location.href='../servlet/defaultDispatcher?__action=contractCustomerHAB.query';
				},
				error:function(callback){
					alert("修改失败");
					return;
				}
			}) ;
		}
	}
}
</script>

	</head>
	<body>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=contractCustomerHAB.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同客户HAB分级</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>HAB分级</td>
				          <td><select name="HABLevel">
								<option value="" >不限</option>
								<option value="1" <c:if test="${HABLevel eq 1}">selected="selected"</c:if>>H</option>
								<option value="2" <c:if test="${HABLevel eq 2}">selected="selected"</c:if>>A</option>
								<option value="3" <c:if test="${HABLevel eq 3}">selected="selected"</c:if>>B</option>
							</select>
				          <td>查询内容：</td>
				          <td><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						本次分级
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						前次分级
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						报告编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						客户编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						客户名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						供应商
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						租赁物概要
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						案件状况
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						首次拜访日
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						业务活动状态
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						业务输入人员
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						申请额度
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }</td>
					<td style="text-align: center;" width="5px"><select onchange="updateContractHAB(this.value,${item.CONTRACT_HAB == null ? 0 : item.CONTRACT_HAB},${item.ACTILOG_ID}) ;"><c:if test="${item.CONTRACT_HAB == null}"><option>未分级</option></c:if>
								<option value="1" <c:if test="${item.CONTRACT_HAB eq 1}">selected="selected"</c:if>>H</option>
								<option value="2" <c:if test="${item.CONTRACT_HAB eq 2}">selected="selected"</c:if>>A</option>
								<option value="3" <c:if test="${item.CONTRACT_HAB eq 3}">selected="selected"</c:if>>B</option></select></td>
					<td style="text-align: center;" id="CONTRACT_HAB_BEFORE${item.ACTILOG_ID}">${item.CONTRACT_HAB_BEFORE == 1?'H':item.CONTRACT_HAB_BEFORE == 2 ?'A':item.CONTRACT_HAB_BEFORE == 3 ? 'B' : '未分级' }</td>
					<td style="text-align: center;">${item.CREDIT_CODE }&nbsp;</td>
					<td style="text-align: center;">${item.CUST_CODE }&nbsp;</td>
					<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
					<td style="text-align: center;">${item.BRAND }&nbsp;</td>
					<td style="text-align: center;">${item.PRODUCTSABOUT }&nbsp;</td>
					<td style="text-align: center;">${item.CASESTATE }&nbsp;</td>
					<td style="text-align: center;">${item.FIRSTVISITDATE }&nbsp;</td>
					<td style="text-align: center;"><c:if test="${item.STATE==0 }">未结束</c:if><c:if test="${item.STATE==1 }">结束</c:if>&nbsp;</td>
					<td style="text-align: center;">${item.NAME }&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber value="${item.SQPRICE}" type="currency" />&nbsp;</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
			</div>
			</div>
</form>
	</body>
</html>