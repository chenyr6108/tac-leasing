<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>担保人贡献度</title>
		<script type="text/javascript" src="${ctx }/product/supplierContribute/js/supplierContribute.js"></script>
		<script type="text/javascript">	
			function findContractInfos(id,name,code,type){
        		$("#contractinfos" + id).toggle(function(){
           		 $(this).load("../servlet/defaultDispatcher?__action=supplierContribute.findContractInfoByDanbaorenId&type="+type+"&name="+name+"&code="+code);
       			 });
			}		
    		function doSearch(){
    			form1.submit();
    		}
		</script>	
	</head>
	
	<body>
		<form id="form1" method="POST" action="${ctx}/servlet/defaultDispatcher" onsubmit="formtValue();">
			<input type="hidden" name="__action" value="supplierContribute.findAllGuarantorContribute" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;担保人贡献度</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr width="755">
				      <td width="5">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;
				          保证人：<input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:95px; height:20px;">&nbsp;组织机构代码/身份证：<input type="text" id="code" name="code" value="${code }" style="width:100px; height:20px;">&nbsp;排名区间：<input type="text" id="ranklow" name="ranklow" value="${ranklow }" style="width:50px; height:20px;">-<input type="text" id="rankup" name="rankup" value="${rankup }" style="width:50px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table></div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						贡献度排名
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						担保人名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						组织机构代码/身份证
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同笔数
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						实际剩余本金
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						授信总额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						授信余额
					</th>
				</tr>
			<tbody>
				<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${item.RANKING}</td>
						<td style="text-align: center;"><a href="#" onclick="findContractInfos('${status.count}','${item.NAME}','${item.IDENTYCODE}','${item.DIFFREENT }')">${item.NAME}</a>&nbsp;</td>
						<td style="text-align: center;">${item.IDENTYCODE}&nbsp;</td>
						<td style="text-align: center;">${item.COUNTS}&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.SUMLASTPRICE}' type='currency'/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.GRANT_PRICE}' type='currency'/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value='${item.LAST_PRICE}' type='currency'/>&nbsp;</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="6" align="center">
								<div id="contractinfos${status.count }" align="center"
										style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
								</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
		</form>
	</body>
</html>