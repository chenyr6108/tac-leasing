<%@ page language="java" pageEncoding="UTF-8"%>
			<table align="center"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
				<tr>
					<td align="left" colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
						<strong>保险费</strong>
					</td>
					<td align="left" colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
					相关操作：
						<img src="${ctx }/images/u100.gif">
						&nbsp;
						<a href="javascript:void(0)" style="cursor: pointer;"
							onclick="addInsureItem();">添加</a>
					</td>
				</tr>
				<tr>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险项目
					</th>
					<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险期间
					</th>
					<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险费率
					</th>
					<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
						保险费用
					</th>
					<th width="27%" class="ui-state-default ui-th-ltr zc_grid_head">
						备注
					</th>
					<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<c:set value="0" var="insureTotal"></c:set>
				<c:forEach items="${insuresList}" var="item" varStatus="status">
					<tr>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<select id="INSURE_ITEM${status.count }" name="INSURE_ITEM">
								<option value="-1">
									-请选择-
								</option>
								<c:forEach items="${insureTypeList }" var="insureTypeList">
									<option value="${insureTypeList.INIC_ID }"
										<c:if test="${insureTypeList.INIC_ID eq item.INSURE_ITEM }">selected="selected"</c:if>>
										${insureTypeList.INTP_NAME }
									</option>
								</c:forEach>
							</select>
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="START_DATE${status.count }" name="START_DATE_"
								size="11" value="${item.START_DATE }" />
							到
							<input id="END_DATE${status.count }" name="END_DATE" size="11"
								value="${item.END_DATE }" />
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_RATE${status.count }" name="INSURE_RATE"
								size="4" value="${item.INSURE_RATE }">
							%
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_PRICE${status.count }" name="INSURE_PRICE" onchange="changeInsurePrice();"
								size="15"  value="<fmt:formatNumber value="${item.INSURE_PRICE }" pattern="#,##0.00"/>" style="text-align: right">
							<c:set var="insureTotal" value="${insureTotal+item.INSURE_PRICE }"></c:set>	
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<input id="INSURE_MEMO${status.count }" name="INSURE_MEMO"
								size="25" value="${item.MEMO }">
						</td>
						<td align="center" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
							<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteRow2.call(this)">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="left" colspan="4" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						合计（大写）：<span id="insureTotalBig"></span>
					<script type="text/javascript">document.getElementById('insureTotalBig').innerHTML=atoc(${insureTotal});</script>
					</td>
					<td align="left" colspan="2" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
						（小写：￥）<input type="text" id="TOTAL_INSURE" readonly="readonly" value="<fmt:formatNumber value="${insureTotal}" pattern="#,##0.00"/>" style="text-align: right">
					</td>
				</tr>

			</table>