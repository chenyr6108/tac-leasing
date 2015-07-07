<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="100%">
						<table width="100%" id="bankTab1${status.index }" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>开户银行</strong>
								</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addBank(this);">添加</a>
								</td>
								<td width="9%" class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteBank(this);">删除</a>
								</td>
							</tr>
							
							<c:if test="${empty corpBankAccount}">
								<tr>
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
										基本账户
										<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
											style="width: 150px;">
									</td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
										开户银行：
									</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="B_BANK_NAME" id="B_BANK_NAME"
											style="width: 150px;">
									</td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">
										账号：
									</td>
									<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"
											style="width: 150px;">
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty corpBankAccount}">
								<c:forEach items="${corpBankAccount}" var="itemss">
									<c:if test="${itemss.STATE eq 0}">
										<tr>
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
												基本账户
												<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
													style="width: 150px;" value="${itemss.PCCBA_ID }">
											</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
												开户银行：
											</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr">
												<input type="text" name="B_BANK_NAME" id="B_BANK_NAME"
													style="width: 150px;" value="${itemss.BANK_NAME }">
											</td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">
												账号：
											</td>
											<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
												<input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"
													style="width: 150px;" value="${itemss.BANK_ACCOUNT }">
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(corpBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td rowspan="${fn:length(corpBankAccount)}" id="bankTd" style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${corpBankAccount}" var="itemss">
								<c:if test="${itemss.STATE eq 1}">
									<tr>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="checkbox" name="check_id" id="check_id">
											开户银行：
										</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="BANK_NAME" id="BANK_NAME"
												style="width: 150px;" value="${itemss.BANK_NAME }">
										</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">
											账号：
										</td>
										<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT"
												style="width: 150px;" value="${itemss.BANK_ACCOUNT }">
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab1${status.index }">
							<tr>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司股东及份额</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									相关操作：
									<img src="${ctx }/images/u100.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="addShareholders('shareholderTab1${status.index }');">添加</a>
								</td>
								<td width="19%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<img src="${ctx }/images/u103.gif">
									&nbsp;
									<a href="javascript:void(0)" onclick="deleteShareholder();">删除</a>
								</td>
							</tr>
							<tr>
								<td width="3%" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="checkbox4" id="checkbox4">
								</td>
								<td width="23%"  class="ui-widget-content jqgrow ui-row-ltr">
									股东名称
								</td>
								<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
									出资情况（千元）
								</td>
								<td width="18%"class="ui-widget-content jqgrow ui-row-ltr">
									出资方式
								</td>
								<td width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									股权比例
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									备注
								</td>
							</tr>
							<c:forEach items="${corpSharholder}" var="itemss">
								<tr class="ui-widget-content jqgrow ui-row-ltr"> 
									<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="checkbox" name="scheck_id" id="scheck_id0"></td>
									<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_NAME" id="HOLDER_NAME"
											style="width: 180px;" value="${itemss.HOLDER_NAME }"></td>
									<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_CAPITAL" id="HOLDER_CAPITAL${status.index }"
											style="width: 120px" value="${itemss.HOLDER_CAPITAL }"></td>
									<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_WAY" id="HOLDER_WAY"
											style="width: 140px;" value="${itemss.HOLDER_WAY }"></td>
									<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_RATE" id="HOLDER_RATE${status.index }"
											style="width: 40px;" value="${itemss.HOLDER_RATE }">%</td>
									<td  style="text-align: center" colspan="2"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="HOLDER_MOME" id="HOLDER_MOME"
											style="width: 200px;" value="${itemss.HOLDER_MOME }"></td>
								</tr>
							</c:forEach>
							
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												相关操作：
												<img src="../images/u100.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick="addProjectss('dddd${status.index }');">添加</a>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="../images/u103.gif">
												&nbsp;
												<a href="javascript:void(0)" onclick='deleteProjects();'>删除
													&nbsp; &nbsp;</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${corpProject}" var="itemss" varStatus="stat">
								<tr>
									<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type='checkbox' name='pcheck_id11'>
										项目名称：
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="PROJECT_NAMES" id="PROJECT_NAME"
											style="width: 200px;" value="${itemss.PROJECT_NAME }">
									</td>
								</tr>
								<tr>
									<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
										&nbsp;&nbsp;&nbsp; 起止时间：
										<input type="hidden" name="fforDelete"
											id="fforDelete${stat.count }">
									</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="PROJECT_DATE" id="PROJECT_DATE"
											style="width: 150px;" value="${itemss.PROJECT_DATE }">
									</td>
								</tr>
								<tr>
									<td width="19%" height="50" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
										&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
										<input type="hidden" name="forDelete"
											id="forDelete${stat.count }">
									</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr">
										<textarea name="PROJECT_CONTENT" id="PROJECT_CONTENT"
											style="width: 500px; height: 50px; font-size: 12px"
											class="txtk">${itemss.PROJECT_CONTENT }</textarea>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div id="dddd${status.index }"></div>
					</td>
				</tr>
			</table>