<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/idCard.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/common/js/fillInHint.js"></script>
		<script type="text/javascript"
			src="${ctx}/common/js/jquery.autocomplete.js"></script>
		<script type="text/javascript"
			src="${ctx }/project/js/projectCreate.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/jquery.autocomplete.css" />
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css">
		<title>项目添加</title>
		<script type="text/javascript">
			var idCardMap;
			IdCard.onReady(function() { 
				idCardMap = { 
					idCard: new IdCard('cust_idcard')
				};
			});
			function validateIdCard(){ 
			       var couldSubmit = true;
			       for (var i = 0; i < arguments.length; i++) {
			              var id = arguments[i];
			              if( idCardMap[id].isValid ){
			                 IdCard.$(id+'1').innerHTML =  "<img src='../images/ytq.gif'/>";
							 return couldSubmit;
			              }else{
			                  IdCard.$(id+'1').innerHTML =  "<img src='../images/wtq.gif'/>";
							  couldSubmit = false;
			              }
			      }
			} 
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" name="__action" value="projectManage.add">
			<div style="margin:  1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新建项目</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td width="12%">承租人类型：</td>
								<td width="40%"><input checked="checked" type="radio" name="cust_type" id="cust_type1" value="1" onchange="changeType(1);">&nbsp;法人&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="cust_type" id="cust_type0"  value="0" onchange="changeType(0);">&nbsp;自然人&nbsp;</td>
								<td width="10%">申请类型：</td>
					<td width="38%"><select name="type">
							<c:forEach items="${projectTypes}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人：</td>
					<td colspan="3"><input type="text" name="cust_name" id="cust_name" style="width: 200px"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td id="custDiv0" style="display: none;">身份证号码:</td>
					<td id="custDiv1" style="display: none;"><input type="hidden" name="cust_idcard" id="cust_idcard"><span id="cust_idcard1"></span></td>
					<td id="custDiv2">组织结构代码证:</td>
					<td id="custDiv3"><input type="text" name="corp_oragnization_code" id="corp_oragnization_code" style="width: 200px"></td>
					<td>办事处主管：</td>
					<td><input type="text" name="clerk_name" id="clerk_name" style="width: 200px"><input type="hidden" name="clerk_id" id="clerk_id"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>公司代号:	</td>
					<td><select id="decp_id" name="decp_id">
							<c:forEach items="${companyList}" var="item">
								<option value="${item.DECP_ID }">
									${item.DECP_NAME_CN }
								</option>
							</c:forEach>
						</select></td>
					<td>办事处主管电话：</td>
					<td><input type="text" name="clerk_mobile" id="clerk_mobile" style="width: 200px"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>承租人地区:</td>
					<td colspan="1"><select id="province_id" name="province_id"	onchange="getCitys();">
							<option value="-1" selected="selected">
								-请选择省份-
							</option>
							<c:forEach items="${provinces}" var="item">
								<option value="${item.ID }">
									${item.NAME }
								</option>
							</c:forEach>
						</select><select id="city_id" name="city_id">
							<option value="-1" selected="selected">
								-请选择市区-
							</option>
						</select></td>
						<td>租赁方式:</td>
					<td colspan="1"><select id="contract_type" name="contract_type"> 
							<c:forEach items="${contractType}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>客户来源：</td>
					<td colspan="3"><select id="customer_come" name="customer_come"> 
							<c:forEach items="${customerCome}" var="item">
								<option value="${item.CODE }">
									${item.FLAG }
								</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr class="ui-jqgrid-labels" align="center">
					<td colspan="4"><input type="button" name="saveBut" id="saveBut" value="保  存" onclick="addProject();"	class="ui-state-default ui-corner-all">	<input type="reset" name="resetBut" id="resetBut" value="重  置" class="ui-state-default ui-corner-all"></td>
				</tr>
			</table>
		</div>
		</div>
		</div>
		</div>
		</form>
		
	</body>
</html>