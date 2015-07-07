<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>法人担保查看</title>
	</head>
	<body>
<!-- 法人 --> 
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;法人担保查看</span>
   	</div>		
	<c:forEach items="${corpList}" var="item" varStatus="status">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-jqgrid-labels">
				<td width="3%" rowspan="11" class="ui-state-default ui-th-ltr zc_grid_head">
					法
					<br />
					人
					<br />
					基
					<br />
					本
					<br />
					信
					<br />
					息
				</td>
				<td width="13%" rowspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
					单位名称
				</td>
				<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
					中文：
				</td>
				<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" >
					${item.CORP_NAME_CN } &nbsp;
				</td>
				<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
					职工人数：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.EMPLOYEE_COUNT }  &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td  class="ui-widget-content jqgrow ui-row-ltr">
					英文：
				</td>
				<td  class="ui-widget-content jqgrow ui-row-ltr">
					${item.CORP_NAME_EN } &nbsp;
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					企业类型：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				${item.CORP_TYPE}&nbsp;
				<!-- 
					 <c:forEach items="${corpTypeList}" var="itemss">
						<c:if test="${itemss.CODE eq item.CORP_TYPE}">${itemss.FLAG }</c:if> 
					</c:forEach>
					 -->
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					营业执照注册号：
				</td>
				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
					${item.BUSINESS_LICENCE_CODE } &nbsp;
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					营业期限：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.BUSINESS_TIME_LIMIT } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td  class="ui-widget-content jqgrow ui-row-ltr">
					组织机构代码证号：
				</td>
				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
					${item.ORGANIZATION_CODE_CERTIFICATE } &nbsp;
				</td>
				<td  class="ui-widget-content jqgrow ui-row-ltr">
					年检情况：
				</td>
				<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
					${item.ROAD_WORTHINESS_INSPECTION } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td    class="ui-widget-content jqgrow ui-row-ltr">
					税务登记号：
				</td>
				<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.TAX_REGISTRATION_NUMBER } &nbsp;
				</td>
				<td    class="ui-widget-content jqgrow ui-row-ltr">
					成立日期：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
					<fmt:formatDate value="${item.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>
				 &nbsp;</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td    class="ui-widget-content jqgrow ui-row-ltr">
					注册资本(千元)：
				</td>
				<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.REGISTERED_CAPITAL } &nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					实收资本(千元)：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.CONTRIBUTED_CAPITAL } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td class="ui-widget-content jqgrow ui-row-ltr">
					公司注册地址：
				</td>
				<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.REGISTERED_OFFICE_ADDRESS } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					经营范围：
				</td>
				<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.MANAGING_SCOPE } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td class="ui-widget-content jqgrow ui-row-ltr">
					公司电话：
				</td>
				<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.TELEPHONE } &nbsp;
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					传真：
				</td>
				<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
					${item.FAX } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td class="ui-widget-content jqgrow ui-row-ltr">
					网址：
				</td>
				<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
					${item.URL } &nbsp;
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					邮编：
				</td>
				<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.POSTCODE } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td height="80" class="ui-widget-content jqgrow ui-row-ltr">
					备注：
				</td>
				<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
					<pre>${item.MEMO} &nbsp;</pre>
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
					法
					<br />
					人
					<br />
					代
					<br />
					表
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					法定代表人：
				</td>
				<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_PERSON } &nbsp;
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr">
					法人身份证号码：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_ID_CARD } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					办公电话：
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_TELEPHONE } &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					邮编：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_POSTCODE } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					常住地址：
				</td>
				<td colspan="6"    class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_HOME_ADDRESS } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					手机号码：
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_MOBILE_NUMBER1 } &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					手机号码2：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LEGAL_MOBILE_NUMBER2 } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td rowspan="5"  class="ui-state-default ui-th-ltr zc_grid_head">
					联
					<br />
					系
					<br />
					人
					<br />
					信
					<br />
					息
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					联系人姓名 
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_MAN } &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					联系人身份证号：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_ID_CARD } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					办公电话：
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_TELEPHONE } &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					职务：
				</td>
				<td width="15%"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_JOB } &nbsp;
				</td>
				<td width="6%"     class="ui-widget-content jqgrow ui-row-ltr">
					邮编：
				</td>
				<td width="21%"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_POSTCODE } &nbsp;
				</td>
			</tr> 
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					邮寄地址：
				</td>
				<td colspan="6"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_MAILING_ADDRESS } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					手机号码：
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_MOBILE_NUMBER1 } &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					手机号码2：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
				${item.LINK_MOBILE_NUMBER2 } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					EMAIL:
				</td>
				<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_EMAIL }  &nbsp;
				</td>
				<td     class="ui-widget-content jqgrow ui-row-ltr">
					MSN：
				</td>
				<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
					${item.LINK_MSN } &nbsp;
				</td>
			</tr>
			<tr class="ui-jqgrid-labels">
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					其
					<br />
					他
					<br />
					信
					<br />
					息
				</td>
				<td colspan="7"   class="ui-widget-content jqgrow ui-row-ltr">
					<pre>${item.OTHER_INFO} &nbsp;</pre>
				</td>
			</tr>
		</table>
		<c:forEach items="${list}" var="items" varStatus="statu">
			<c:if test="${status.index == statu.index}">
				<c:set var="corpBankAccount" value="${items.bankAccountList}"></c:set>
				<c:set var="corpSharholder" value="${items.shareholderList}"></c:set>
				<c:set var="corpProject" value="${items.projectList}"></c:set>
				<c:set var="creditPriorProject" value="${items.creditPriorProject}"></c:set>
				<c:set var="v1" value="${items.v1}"></c:set>
				<c:set var="v2" value="${items.v2}"></c:set>
				<c:set var="v3" value="${items.v3}"></c:set>
				<c:set var="v4" value="${items.v4}"></c:set>
				<c:set var="v5" value="${items.v5}"></c:set>
				<%@ include file="creditCorpInfoCreatesShow.jsp"%>
				<%@ include file="creditPriorRecordsCreatesShow.jsp"%>
			</c:if>
		</c:forEach>
	</c:forEach>
	</div>
	</div>
	</div>
	<div align="center">
		<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
	</div>	
	</body>
</html>		