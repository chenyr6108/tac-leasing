<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 法人 --> 
<script type="text/javascript">
		function showFile(num){
			var dis = $("#file_show_" + num).css("display");
			if(dis == "none"){
				$("#file_show_" + num).css("display", "block");
			}
			if(dis == "block"){
				$("#file_show_" + num).css("display", "none");
			}
		}
		
		function downloadImg(img_path, img_name){
    		$("#img_action").val("creditPriorRecordsVip.downloadImg");
    		$("#img_path").val(img_path);
    		$("#img_name").val(img_name);
    		$("#imgForm").submit();
    	}
</script>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
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
					${item.CORP_TYPE }&nbsp;
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
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq item.FLAGPERMIT}">${items.FLAG }</c:when>
						</c:choose>
					</c:forEach>
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
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq item.LINKFLAGPERMIT}">${items.FLAG }</c:when>
						</c:choose>
					</c:forEach>
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
		
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<!-- 财务报表文件  -->
		<tr class="ui-jqgrid-labels">
			<th colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left;">
				<strong>财务报表</strong>
			</th>
		</tr>
		<c:forEach items="${item.fileList }" var="file" varStatus="index">
			<tr class="ui-jqgrid-labels" id="file_tr_${index.count }">
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
					附件${index.count }：
					<a href="javascript:void(0);" onclick="showFile('${index.count }');">${file.FILE_NAME_STR}</a>
					&nbsp;&nbsp;
					<a href="javascript:void(0);" onclick="downloadImg('${fn:replace(file.FILE_PATH, '\\', '/')}', '${file.FILE_NAME_STR}');">
						<img src="${ctx }/images/attach.jpg" title="下载"/>下载</a>
					&nbsp;
					<%-- <a href="javascript:void(0);" onclick="deleteImg('${file.ID}', '${index.count }');">
						<img src="${ctx }/images/u103.gif" title="删除" />删除</a> --%>
				</td>
			</tr>
			<tr class="ui-jqgrid-labels" id="file_show_${index.count }" style="display: none;">
				<c:choose>
					<c:when test="${file.FILE_TYPE eq 'jpg' or file.FILE_TYPE eq 'jpeg' or file.FILE_TYPE eq 'gif' or file.FILE_TYPE eq 'png' }">
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							<div style="text-align: center; max-width: 600px;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
								<img src="${ctx }/showImg?file_name=${file.FILE_PATH}" alt="财报" style="max-width: 800px;">
							</div>
						</td>
					</c:when>
					<c:otherwise>
						<th align="center" class="ui-widget-content jqgrow ui-row-ltr" style="width: 100%; text-align: center;">
							<br/>
								<font color="red">无预览。</font>
							<br/>
						</th>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
		
		<c:forEach items="${list}" var="items" varStatus="statu">
			<c:if test="${status.index == statu.index}">
				<c:set var="corpBankAccount" value="${items.bankAccountList}"></c:set>
				<c:set var="corpSharholder" value="${items.shareholderList}"></c:set>
				<c:set var="corpProject" value="${items.projectList}"></c:set>
				<c:set var="creditPriorProject" value="${items.creditPriorProject}"></c:set>
		<!-- 	<c:set var="v1" value="${items.v1}"></c:set>
				<c:set var="v2" value="${items.v2}"></c:set>
				<c:set var="v3" value="${items.v3}"></c:set>
				<c:set var="v4" value="${items.v4}"></c:set>
				<c:set var="v5" value="${items.v5}"></c:set>   baiman -  财务信息-->
				<%@ include file="creditCorpInfoCreatesShow.jsp"%>
			 	<%-- <%@ include file="creditPriorRecordsCreatesShow.jsp"%> --%>
			</c:if>
		</c:forEach>
	</c:forEach>
	</div>
	</div>
	</div>