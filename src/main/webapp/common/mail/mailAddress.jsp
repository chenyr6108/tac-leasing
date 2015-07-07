<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="width:10px;text-align:right;"><strong>邮件FROM:&nbsp;&nbsp;</strong></td><td style="background-color:#e8e8e8;text-align:left;">${mailSettingTo.emailFrom }</td>
				    </tr>
				    <tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="width:10px;text-align:right;"><strong>邮件TO:&nbsp;&nbsp;</strong></td><td style="background-color:#e8e8e8;text-align:left;">${mailSettingTo.emailTo }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="width:10px;text-align:right;"><strong>邮件CC:&nbsp;&nbsp;</strong></td><td style="background-color:#e8e8e8;text-align:left;">${mailSettingTo.emailCc }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="width:10px;text-align:right;"><strong>邮件BCC:&nbsp;&nbsp;</strong></td><td style="background-color:#e8e8e8;text-align:left;">${mailSettingTo.emailBcc }</td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:left;" width="100px" colspan="2"><strong>邮件内容:&nbsp;&nbsp;</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:left;" width="100px" colspan="2"><div>${mailSettingTo.emailContent }</div></td>
					</tr>
			</table>
		</div>
	</div>
</div>