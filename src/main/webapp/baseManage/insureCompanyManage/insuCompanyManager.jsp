<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insuCompany.js"></script>
		<title>保险公司管理</title>
		<%@ include file="/common/import.jsp"%>
		<script type="text/javascript">
					//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    

        if(event.keyCode==13)
        {									
               doSearch();                          
        }
 } 
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="insuCompany.queryCompanyAllInfo" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险公司</span>
		  	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			  <div class="zc_grid_body jqgrowleft">
				<div><table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				   </div>
			<div class="ui-state-default ui-jqgrid-hdiv ">	
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr ><td><input type="button" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=insuCompany.getMotorFlagInfo'" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加保险公司"></td>
					<td>
						<page:pagingToolbarTop pagingInfo="${dw }"/>
					</td></tr></table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序列号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">保险公司名称</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">保险公司简称</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">保险公司编号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">联系人</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">联系电话</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th></tr>
				<tbody>
					<c:forEach items="${dw.resultList}" var="company" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;"> ${status.count }&nbsp;</td>
							<td style="text-align: center;">${company.INCP_NAME }&nbsp;</td>
							<td style="text-align: center;">${company.SHORT_NAME }&nbsp;</td>
							<td style="text-align: center;">${company.INCP_CODE }&nbsp;</td>
							<td style="text-align: center;">${company.INCP_LINKMAN}&nbsp;</td>
							<td style="text-align: center;">${company.INCP_LINKTEL }&nbsp;</td>
							<td style="text-align: center;">
								<a href="javaScript:void(0);" onclick="showCompany(${company.INCP_ID });">查看</a>
								<c:if test="${insuCompany_edit }">
									<a href="javaScript:void(0);" onclick="preUpdateCompany(${company.INCP_ID });">修改</a> 
									<a href="javaScript:void(0);" onclick="deleteCompany(${company.INCP_ID });">删除</a>
								</c:if>
							</td>
						</tr></c:forEach>
				</tbody>
			</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
	</div>
	</div>
    </form> 
	</body>
</html>