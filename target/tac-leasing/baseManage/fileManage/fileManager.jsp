<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/fileManage/js/fileManage.js"></script>
		<title>资料管理</title>
	</head>
	<script type="text/javascript">
		//改变为合同资料时，显示合同类型
		function changeContractType(){
			var row=document.getElementById("ContractTypeId");
			var checkText=$("#file_type").find("option:selected").text(); 
				if(checkText.trim()=='合同资料'){
					var cell=row.insertCell(4);
					cell.id='addContractType' ;
					cell.innerHTML='合同资料';
					cell=row.insertCell(5);
					cell.id='addContractType1' ;
					cell.innerHTML='<select name=\"file_contract_type\"  id=\"file_contract_type\">'
									+'<option value=\"1\">一般合同</option>'
									+'<option value=\"2\">委托合同</option>'
									+'<option value=\"3\">回租合同</option>'
									+'<option value=\"4\">重车合同</option>'
									+'<option value=\"5\">重车回租合同</option>'
									+'<option value=\"6\">新品回租合同</option>'
									+'<option value=\"7\">乘用车回租合同</option>'
									+'<option value=\"8\">直接租赁合同</option>'
									+'<option value=\"9\">乘用车租赁合同</option>'
									+'<option value=\"10\">设备售后回租合同</option>'
									+'<option value=\"11\">新车回租合同</option>'
									+'<option value=\"13\">二手车回租合同</option>'
									+'<option value=\"14\">原车回租合同</option>'
									+'<option value=\"15\">二手车委贷合同</option>'
									+'</select>';
				}else{
					$("#addContractType").remove();
					$("#addContractType1").remove();
				}
		}
	</script>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="fileService.queryAllFile" /> 
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;资料管理</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="750" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr >
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="300" class="ss_t">&nbsp;&nbsp;
				          <table  style="margin-left: 10px;">
				          <input type="text" name="content" value="${content }" style="width:295px; height:18px;"></td>	   
				          <tr id="ContractTypeId">    
					<td>
					文件类型：
					</td>
					<td>
							<c:set var="type0" value=""></c:set>
							<c:set var="type1" value=""></c:set>
							<c:set var="type2" value=""></c:set>
							<c:set var="type3" value=""></c:set>
							<c:set var="type4" value=""></c:set>
							<c:set var="type5" value=""></c:set>
							<c:set var="type6" value=""></c:set>
							<c:if test="${file_type eq 0}">
							<c:set var="type0" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${file_type eq 1}">
							<c:set var="type1" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${file_type eq 2}">
							<c:set var="type2" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${file_type eq 3}">
							<c:set var="type3" value="selected='selected'"></c:set>
							</c:if>	
							<c:if test="${file_type eq 4}">
							<c:set var="type4" value="selected='selected'"></c:set>
							</c:if>	
							<c:if test="${file_type eq 5}">
							<c:set var="type5" value="selected='selected'"></c:set>
							</c:if>	
							<c:if test="${file_type eq 6}">
							<c:set var="type6" value="selected='selected'"></c:set>
							</c:if>							
							<select id="file_type" name="file_type" style="border: #03515d solid 1px;" onchange="changeContractType() ;">
								<option value="0"${ type0}>
								全部
								</option>
								<option value="1"${ type1}>
								承租人资料
								</option>
								<option value="2"${ type2}>
								担保人资料
								</option>
								<option value="3"${ type3}>
								合同资料
								</option>
								<option value="4"${ type4}>
								设备结清资料
								</option>
								<option value="5"${ type5}>
								重车结清资料
								</option>
								<option value="6"${ type6}>
								寄件资料文件
								</option>																
							</select>
					</td>
					<td>
					必填项：
					</td>
					<td>
							<c:set var="type00" value=""></c:set>
							<c:set var="type11" value=""></c:set>
							<c:set var="type22" value=""></c:set>
							<c:if test="${state eq -1}">
							<c:set var="type00" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${state eq 0}">
							<c:set var="type11" value="selected='selected'"></c:set>
							</c:if>
							<c:if test="${state eq 1}">
							<c:set var="type22" value="selected='selected'"></c:set>
							</c:if>						
							<select name="state" style="border: #03515d solid 1px;">
								<option value="-1"${ type00}>
								全部
								</option>
								<option value="0"${ type11}>
								否
								</option>
								<option value="1"${ type22}>
								是
								</option>							
							</select>
					</td>	
					<c:if test="${file_contract_type != null && file_contract_type != ''}">
						<td id="addContractType">
						合同资料：
						</td >
						<td id="addContractType1">
							<select name="file_contract_type"  id="file_contract_type">
								<option value="1" ${file_contract_type == 1 ? 'selected="selected"' : ""}>一般合同</option>
								<option value="2" ${file_contract_type == 2 ? 'selected="selected"' : ""}>委托合同</option>
								<option value="3" ${file_contract_type == 3 ? 'selected="selected"' : ""}>回租合同</option>
								<option value="4" ${file_contract_type == 4 ? 'selected="selected"' : ""}>重车合同</option>
								<option value="5" ${file_contract_type == 5 ? 'selected="selected"' : ""}>重车回租合同</option>
								<option value="6" ${file_contract_type == 6 ? 'selected="selected"' : ""}>新品回租合同</option>
								<option value="7" ${file_contract_type == 7 ? 'selected="selected"' : ""}>乘用车回租合同</option>
								<option value="8" ${file_contract_type == 8 ? 'selected="selected"' : ""}>直接租赁合同</option>
								<option value="9" ${file_contract_type == 9 ? 'selected="selected"' : ""}>乘用车租赁合同</option>
								<option value="10" ${file_contract_type == 10 ? 'selected="selected"' : ""}>设备售后回租合同</option>
								<option value="11" ${file_contract_type == 11 ? 'selected="selected"' : ""}>新车回租合同</option>
								
								<option value="13" ${file_contract_type == 13 ? 'selected="selected"' : ""}>二手车回租合同</option>
								<option value="14" ${file_contract_type == 14 ? 'selected="selected"' : ""}>原车回租合同</option>
								<option value="15" ${file_contract_type == 15 ? 'selected="selected"' : ""}>二手车委贷合同</option>
							</select>
						</td>
					</c:if>
					</tr>   
					</table>				          
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="addFile();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加资料"></td>
						<td><br><%@ include file="/common/pageControlTop.jsp"%><br></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							序号
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							资料名称
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							资料类型
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							应征份数
						</th>	
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							合同类型
						</th>	
						<c:if test="${file_type eq 3}">
							<th class="ui-state-default ui-th-ltr zc_grid_head">
								合同资料类型
							</th>
						</c:if>										
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							必填项
						</th>						
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							级别
						</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head">
							操作
						</th>
					</tr>
					<tbody>
						<c:forEach items="${dw.rs}" var="fileInfor" varStatus="status">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }&nbsp;</td>
								<td style="text-align: center;">${fileInfor.FILE_NAME }&nbsp;</td>
								<td style="text-align: center;"><c:if test="${fileInfor.FILE_TYPE eq 1}">承租人资料</c:if><c:if test="${fileInfor.FILE_TYPE eq 2}">担保人资料</c:if><c:if test="${fileInfor.FILE_TYPE eq 3}">合同资料</c:if><c:if test="${fileInfor.FILE_TYPE eq 4}">设备结清资料</c:if><c:if test="${fileInfor.FILE_TYPE eq 5}">重车结清资料</c:if><c:if test="${fileInfor.FILE_TYPE eq 6}">寄件资料文件</c:if>&nbsp;</td>
								<td style="text-align: center;">${fileInfor.WANT_COUNT}&nbsp;</td>
								<td style="text-align: center;"><c:choose>
								<c:when test="${fileInfor.FILE_TYPE eq 3}">
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 1}">一般合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 2}">委托合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 3}">回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 4}">重车合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 5}">重车回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 6}">新品回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 7}">乘用车回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 8}">直接租赁合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 9}">乘用车租赁合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 10}">设备售后回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 11}">新车回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 13}">二手车回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 14}">原车回租合同</c:if>
								<c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 15}">二手车委贷合同</c:if>
								</c:when></c:choose>&nbsp;</td>
								<c:if test="${file_type eq 3}">
									<td style="text-align: center;">${fileInfor.CONTRACT_FILE_TYPE}&nbsp;</td>
								</c:if>
								<td style="text-align: center;"><c:if test="${fileInfor.STATE eq 0}">否</c:if><c:if test="${fileInfor.STATE eq 1}">是</c:if></td>
								<td style="text-align: center;">${fileInfor.LEVEL_NUM }&nbsp;</td>
								<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showFile(${fileInfor.REFI_ID});">查看</a> <a href="javaScript:void(0);" onclick="preUpdateFile(${fileInfor.REFI_ID});">更新</a> <a href="javaScript:void(0);" onclick="invalidFile(${fileInfor.REFI_ID});">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
				</div>
				</div>
			</div>				
		</form> 	
	</body>
</html>