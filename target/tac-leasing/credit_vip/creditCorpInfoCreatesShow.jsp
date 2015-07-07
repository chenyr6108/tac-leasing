<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="100%">
						<table width="100%" id="bankTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" height="26">开户银行</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp; 
								</td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp; 
								</td>
							</tr>
							<c:if test="${empty corpBankAccount}">
								<tr>
									<td width="13%"      class="ui-widget-content jqgrow ui-row-ltr">
										基本账户
									</td>
									<td width="10%"      class="ui-widget-content jqgrow ui-row-ltr">
										开户银行：
									</td>
									<td width="27%"      class="ui-widget-content jqgrow ui-row-ltr"> 
									&nbsp;
									</td>
									<td width="11%"      class="ui-widget-content jqgrow ui-row-ltr">
										账号：
									</td>
									<td colspan="3"       class="ui-widget-content jqgrow ui-row-ltr" >
									&nbsp;
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty corpBankAccount}">
								<c:forEach items="${corpBankAccount}" var="itemss">
									<c:if test="${itemss.STATE eq 0}">
										<tr>
											<td width="13%" class="ui-widget-content jqgrow ui-row-ltr">
												基本账户
												<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
													style="width: 150px;" value="${itemss.PCCBA_ID }">
											</td>
											<td width="10%" class="ui-widget-content jqgrow ui-row-ltr">
												开户银行：
											</td>
											<td width="27%" class="ui-widget-content jqgrow ui-row-ltr">
												 ${itemss.BANK_NAME } 
											</td>
											<td width="11%" class="ui-widget-content jqgrow ui-row-ltr">
												账号：
											</td>
											<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
												 ${itemss.BANK_ACCOUNT } 
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(corpBankAccount) >1}">
								<tr>
									<td rowspan="${fn:length(corpBankAccount)}" class="ui-widget-content jqgrow ui-row-ltr">
										其他账户
									</td>
								</tr>
							</c:if>
							<c:forEach items="${corpBankAccount}" var="itemss">
								<c:if test="${itemss.STATE eq 1}">
									<tr>
										<td class="ui-widget-content jqgrow ui-row-ltr">
											 开户银行：
										</td>
										<td   class="ui-widget-content jqgrow ui-row-ltr">
											 ${itemss.BANK_NAME } 
										</td>
										<td      class="ui-widget-content jqgrow ui-row-ltr">
											账号：
										</td>
										<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
											 ${itemss.BANK_ACCOUNT } 
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" height="26" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司股东及份额</strong>
								</td>
								<td width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
									 &nbsp; 
								</td>
								<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="3%" class="ui-widget-content jqgrow ui-row-ltr">
									
								</td>
								<td width="23%" class="ui-widget-content jqgrow ui-row-ltr">
									股东名称：
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									出资情况（千元）：
								</td>
								<td width="18%" class="ui-widget-content jqgrow ui-row-ltr">
									出资方式：
								</td>
								<td width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									股权比例：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									备注：
								</td>
							</tr>
							<c:forEach items="${corpSharholder}" var="itemss">
								<tr>
									<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.HOLDER_NAME } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.HOLDER_CAPITAL } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.HOLDER_WAY } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.HOLDER_RATE }% &nbsp;
									</td>
									<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.HOLDER_MOME } &nbsp;
									</td> 
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" >
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td   class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp; 
											</td>
											<td    class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp; 
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${corpProject}" var="itemss">
								<tr>
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head">
										项目名称：
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.PROJECT_NAME } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head">
										  起止时间： 
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${itemss.PROJECT_DATE } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" height="50" class="ui-state-default ui-th-ltr zc_grid_head">
										&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
										 
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										 ${itemss.PROJECT_CONTENT } &nbsp;
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>