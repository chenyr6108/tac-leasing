<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>律师函</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">
	/* $(function (){
		$("#datebegin").datepicker($.datepicker.regional["zh-CN"]);
	}); */
	function submitserach() {
		var startrange = $("#startrange").val();
		var endrange = $("#endrange").val();
		if ((!endrange == "") || (!endrange == null)) {
			if (!checkInteger(endrange)) {
				alert("逾期天数查询请输入整数!");
				$("#endrange").focus();
				return false;
			}
		}
		if ((!startrange == "") || (!startrange == null)) {
			if (!checkInteger(startrange)) {
				alert("逾期天数查询请输入整数!");
				$("#startrange").focus();
				return false;
			}
		}
		$("#__currentPage").val("1");
		$("#form1").submit();
	}

	function checkInteger(checkStr) {
		var regex = /^[\+\-]?[\d]+$/;

		return regex.test(checkStr);
	}
	//查看担保人
	function expand(rectId){
        $("#letter"+rectId).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=dunTask.getNatureByCustId&rectId="+rectId);
        });
	}
	function getLetter(rectId){
		$('#button_'+rectId).attr('disabled',true);
		var dun_date=$("#datebegin").val();
		if(confirm("是否生成律师函，并发送寄发申请?")){
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=dunTaskLawCommand.getLawLetter&RECTID=' + rectId+'&dun_date='+dun_date,
				dataType:'json',
				async: false,
				success: function(result){		
					alert("已生成。");
				},
				error:function(result){
					alert("error!");
					return false;
				}
			});
		   }
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" id="__action" name="__action" value="dunTask.getLetterList" /> 
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp律师函</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px;">
								<tr>
									<td>查询日期：</td>
									<td><input type="text" name="dun_date" style="width: 80px; height: 18px;" readonly="readonly" id="datebegin" value="${dun_date }">
									<td>逾期天数：</td>
									<td><input type="text" name="startrange" id="startrange" style="width: 40px; height: 18px;" value="${startrange }">~
										<input type="text" name="endrange" id="endrange" style="width: 40px; height: 18px;" value="${endrange}"></td>
								</tr>
								<tr>
									<td>查询内容：</td>
									<td colspan="3"><input type="text" name="content" value="${content }" style="width: 240px; height: 18px; font-size: 12px;"></td>
									<td>业务员：</td>
									<td><input type="text" name="NAME" id="NAME" style="width: 100px; height: 18px;" value="${NAME }"></td>
								</tr>
							</table>

						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="searchs" id="searchs" onclick="submitserach();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div class="zc_grid_body ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr>
							<td align="right" colspan="14" style="text-align: center; background-color: #C5DBEC;" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbarTop pagingInfo="${pagingInfo }" /></td>
						</tr>
					</thead>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<thead>
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">合同号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="100">承租人</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">业务员</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">主管</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">供应商名称</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">供应商责任</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">逾期天数 </th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">担保人 </th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" width="50">操作 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagingInfo.resultList}" var="letter" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">&nbsp;${letter.leaseCode}</td>
								<td style="text-align: center;">&nbsp;${letter.custName}</td>
								<td style="text-align: center;">&nbsp;${letter.name}</td>
								<td style="text-align: center;">&nbsp;${letter.upName}</td>
								<td style="text-align: center;">&nbsp;${letter.brand}</td>
								<td style="text-align: center;">&nbsp;${letter.suplTrue}</td>
								<td style="text-align: center;">&nbsp;${letter.dunDay}</td>
								<td style="text-align: center;">&nbsp;
									<input type="button" name="addbutton" onclick="expand('${letter.rectId}');" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="查看">
								</td>
								<td style="text-align: center;">&nbsp;
									<input type="button" name="addbutton" onclick="getLetter('${letter.rectId}');" id="button_${letter.rectId}" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="生成">
								</td>
							</tr>
								<tr>
								<td style="text-align:center;" colspan="10" align="center">
								<div id="letter${letter.rectId}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:50%"></div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td align="right" colspan="14" style="text-align: center; background-color: #C5DBEC;" class="ui-state-default ui-jqgrid-hdiv "><page:pagingToolbar pagingInfo="${pagingInfo }"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>