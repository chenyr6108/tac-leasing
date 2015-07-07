<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript">
   	var x = 0 ;
	function addCreditVisit(){
		var tab=document.getElementById("visitTable");
		var row=tab.insertRow(tab.rows.length );
		var cell=row.insertCell(0);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='center';
		cell.innerHTML='<input type=\"checkbox\" name=\"visitCheck\" id=\"visitCheck\">';
		cell=row.insertCell(1);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='center';
		cell.colSpan=2;
		cell.innerHTML='<input size=\"86\" type=\"text\" name=\"imagesName'+x+'\" id=\"imagesName\" >';
		cell=row.insertCell(2);
		cell.className = "ui-widget-content jqgrow ui-row-ltr";
		cell.align='left';	
		cell.colSpan=2;
		cell.innerHTML='<input class=\"ui-state-default ui-corner-all\" size=\"52\" type=\"file\" name=\"imagesVisit\" id=\"imagesVisit\"/>';
		x++
	}
	
	function deleteCreditVisit(){
		var check=document.getElementsByName("visitCheck");
		for(i=check.length-1;i>=0;i=i-1){
			if(check[i].checked==true){
				var tr=check[i].parentNode.parentNode;
				tr.parentNode.removeChild(tr);
			}
		}
	}
function deleteImage(ssupId,th){
		if(confirm("确定要删除该图片么？")){
			$.ajax({
				type:"post",
				url:"../servlet/defaultDispatcher",
				data:"__action=supplier.deleteSupplierImage&SSUP_ID="+ssupId ,
				dataType:"json",
				success:function(content){
					if(content.content == "1"){
						alert("删除成功") ;
						var tr=th.parentNode.parentNode;
						tr.parentNode.removeChild(tr);
					} else {
						alert("删除失败") ;
					}
				},
				error:function(error){
					alert("删除失败") ;
				}
			});
		}
	}
	 //提交更新资源表单时验证
 function update(){
 	 tabLength = document.getElementById("visitTable").rows.length ;
		if(tabLength == 3){
	   		if($("#imagesVisit").val() == null || $("#imagesVisit").val().trim() == ""){
	   			alert("图片不能为空!") ;
	   			$("#imagesVisit").focus();
	   			return false ;
	   		}
   			//判断是否是图片类型
			if(!checkImageType($("#imagesVisit"))){
				return false ;
			}
	   		if($("#imagesName").val() == null || $("#imagesName").val().trim() == ""){
	   			alert("图片标题不能为空!");
	   			$("#imagesName").focus();
	   			return false ;
	   		}
		}else if(tabLength > 3){
	   		for(var i=0;i<(tabLength-2);i++){
		   		if($("input[id='imagesVisit']").eq(i) == null || $("input[id='imagesVisit']").eq(i).val().trim() == ""){
		   			alert("图片不能为空!") ;
		   			$("input[id='imagesVisit']").eq(i).focus();
		   			return false ;
	   			}
	   			//判断是否是图片类型
	   			if(!checkImageType($("input[id='imagesVisit']").eq(i))){
					return false ;
				}
		   		if($("input[id='imagesName']").eq(i).val() == null || $("input[id='imagesName']").eq(i).val().trim() == ""){
		   			alert("图片标题不能为空!");
		   			$("input[id='imagesName']").eq(i).focus();
		   			return false ;
		   		}
	  	 	}
	  	 } else if(tabLength = 2){
			alert("请添加图片!") ;
			return false ;  	 
	  	 }
	  	 $("#createImageForm").submit();
	}
function checkImageType(image){
	var imageName = image.val().split("."); 
	var imageType = imageName[1].toLowerCase() ;
	// 2012/01/12 Yang Yun 新增PDF格式文件上传。
	if(imageType == "jpg" || imageType == "bmp" || imageType == "gif" || imageType == "png" || imageType == "jpeg" || imageType == "tif" || imageType == "pdf" || imageType == "tiff") {
		return true ;
	}else {
		alert(imageType + "不是图片类型请重新上传") ;
		image.val("") ;
		image.focus() ;
		return false ;
	}
 }
</script>
		<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=supplier.createSupplierImage"
			method="post" id="createImageForm" name="createImageForm" enctype="multipart/form-data">
		<%-- 2012/01/12 Yang Yun 上传图片完成后返回当前页面----------------------  --%>
		<input type="hidden" name="id" value="${supplier_id}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
	<table width="982" align="center">
				<tr>
					<td>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商资料</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
           	<div class="ui-state-default ui-jqgrid-hdiv ">		
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td>企业名称</td>
				<td colspan="4">${rs.NAME}&nbsp;</td>
			</tr>
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td>编号</td>
				<td colspan="4">${rs.CODE }&nbsp;</td>
			</tr>
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td>办事处</td>
				<td colspan="4">${rs.DECP_NAME_CN }&nbsp;</td>
			</tr>
			<tr id="18" class="ui-widget-content jqgrow ui-row-ltr">
				<td>企业性质</td>
				<td  colspan="4"><c:choose><c:when test="${rs.TYPE == 1}">厂商</c:when><c:when test="${rs.TYPE == 2 }">代理商</c:when><c:when test="${rs.TYPE == 3 }">其他供应商</c:when></c:choose></td>
			</tr>
			<tr id="18" class="ui-widget-content jqgrow ui-row-ltr">
				<td>供应商类型</td>
				<td colspan="4"><c:if test="${rs.SUPP_TYPE == 0 }">非大型供应商</c:if><c:if test="${rs.SUPP_TYPE == 1 }">大型供应商</c:if>&nbsp;</td> 
			</tr>
			<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
				<td>成立日期</td>
				<td  colspan="4"><fmt:formatDate value="${rs.FOUNDED_DATE}" pattern="yyyy-MM-dd" /> &nbsp;</td>
			</tr>
			<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
				<td width="3%" rowspan="8" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">企<br>业<br>基<br>本<br>信<br>息</div></td>
				<td width="10%">注册资本(万)</td>
				<td >${rs.REGISTERED_CAPITAL }&nbsp;&nbsp;&nbsp;<select disabled="disabled"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.REGISTERED_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
				<td width="10%">实收资本(万)</td>
				<td >${rs.INCOME_CAPITAL }&nbsp;&nbsp;&nbsp;<select disabled="disabled"><c:forEach items="${moneyType}" var="item"><option value="${item.CODE }" <c:if test="${item.CODE eq rs.INCOME_CAPITAL_MONEY_TYPE }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select>&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr id="6" class="ui-widget-content jqgrow ui-row-ltr">
				<td>营业执照注册号</td>
				<td>${rs.BUSINESS_LICENCE }&nbsp;</td>
				<td>组织机构代码号</td>
				<td>${rs.ORGANIZATION_CERTIFICATE }&nbsp;</td>
			</tr>
			<tr id="7" class="ui-widget-content jqgrow ui-row-ltr">
				<td>税务登记号</td>
				<td>${rs.TEX_CODE }&nbsp;</td>
				<td>有效期(年)</td>
				<td>${rs.VALIDITY_PERIOD }&nbsp;</td>
			</tr>
			<tr id="8" class="ui-widget-content jqgrow ui-row-ltr">
				<td>注册地址</td>
				<td>${rs.LICENCE_ADDRESS }&nbsp;</td>
				<td>办公地址</td>
				<td>${rs.WORK_ADDRESS }&nbsp;</td>
			</tr>
			<tr id="12" class="ui-widget-content jqgrow ui-row-ltr">
				<td>公司网址</td>
				<td>${rs.COMPANY_WEB }&nbsp;</td>
				<td>信用级别</td>
				<td><c:choose><c:when test="${rs.CREDIT_TYPE == 1 }">高</c:when><c:when test="${rs.CREDIT_TYPE == 2 }">中</c:when><c:when test="${rs.CREDIT_TYPE == 3 }">低</c:when></c:choose></td>
			</tr>
			<tr id="9" class="ui-widget-content jqgrow ui-row-ltr">
				<td>经营范围</td>
				<td  colspan="4">${rs.BUSINESS_SCOPE }&nbsp;</td>
			</tr>
			<tr id="18" class="ui-widget-content jqgrow ui-row-ltr">
				<td>回购金额额度(万)</td>
				<td colspan="4">${rs.BUYBACK_PRICE }&nbsp;</td> 
			</tr>
			<tr id="14" class="ui-widget-content jqgrow ui-row-ltr">
				<td>备注</td>
				<td colspan="4">${rs.MEMO }&nbsp;</td>
			</tr>
			
			
			<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
				<td width="3%" rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">法<br>人</div></td>
				<td>法定代表人</td>
				<td>${rs.COMPANY_CORPORATION }&nbsp;</td>
				<td>法人身份证号码</td>
				<td>${rs.CORPORATION_ID_CARD }&nbsp;</td>
			</tr>
			<tr id="5" class="ui-widget-content jqgrow ui-row-ltr">
				<td>法人联系方式</td>
				<td>${rs.CORPORATION_LINK }&nbsp;</td>
				<td>法人代表住址</td>
				<td>${rs.CORPORATION_ADDRESS }&nbsp;</td>
			</tr>
			
			<tr id="10" class="ui-widget-content jqgrow ui-row-ltr">
				<td width="3%" rowspan="3" class="ui-state-default ui-th-ltr zc_grid_head"><div align="center">联<br>系<br>人</div></td>
				<td>联系人</td>
				<td>${rs.LINKMAN_NAME }&nbsp;</td>
				<td>职务</td>
				<td>${rs.LINKMAN_JOB }&nbsp;</td>
			</tr>
			<tr id="18" class="ui-widget-content jqgrow ui-row-ltr">
				<td>办公电话</td>
				<td>${rs.LINKMAN_TELPHONE }&nbsp;</td>
				<td>Email</td>
				<td>${rs.LINKMAN_EMAIL }&nbsp;</td>
			</tr>
			<tr id="11" class="ui-widget-content jqgrow ui-row-ltr">
				<td>邮编</td>
				<td>${rs.LINKMAN_ZIP }&nbsp;</td>
				<td>手机</td>
				<td>${rs.LINKMAN_MOBILE }&nbsp;</td>
			</tr>
			
			
			<tr id="13" class="ui-widget-content jqgrow ui-row-ltr">
				<td  colspan="5"><table width="100%" id="bankTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head"><strong>开户银行</strong></td>
							</tr>
							<c:if test="${empty suplBankAccount}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
									<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
									<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME" style="width: 150px;" readonly="readonly"></td>
									<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT" style="width: 150px;" readonly="readonly"></td>
								</tr>
							</c:if>
							<c:if test="${not empty suplBankAccount}">
								<c:forEach items="${suplBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">基本账户</td>
											<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
											<td width="27%"  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_NAME" id="B_BANK_NAME"	style="width: 150px;" value="${item.BANK_NAME }" readonly="readonly"></td>
											<td width="11%"  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
											<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="B_BANK_ACCOUNT" id="B_BANK_ACCOUNT"	style="width: 150px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(suplBankAccount) >1}">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td  rowspan="${fn:length(suplBankAccount)}" id="bankTd" class="ui-widget-content jqgrow ui-row-ltr">其他账户</td>
								</tr>
							</c:if>
							<c:forEach items="${suplBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td  class="ui-widget-content jqgrow ui-row-ltr">开户银行：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_NAME" id="BANK_NAME" style="width: 150px;" value="${item.BANK_NAME }" readonly="readonly"></td>
										<td  class="ui-widget-content jqgrow ui-row-ltr">账号：</td>
										<td  class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" style="width: 150px;" value="${item.BANK_ACCOUNT }" readonly="readonly"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
			</tr>
			<!-- 
			<c:if test="${supplierImage != null &&  fn:length(supplierImage) > 0}">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head"><strong>供应商图片</strong></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;" colspan="5"><c:forEach items="${supplierImage}" var="item" varStatus="status"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=supplierUpload'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a><br/></c:forEach></td>	
				</tr>	
			</c:if>
			-->
	
			<input type="hidden" name="SUPPLIER_ID" value="${supplier_id}">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr"><table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="visitTable">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left" width="75.5%" colspan="3"><strong>上传图片</strong></td>
				<td class="ui-state-default ui-th-ltr zc_grid_head"  align="right" colspan="1">相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="javaScript:void(0);" onclick="addCreditVisit();">添加</a></td>
				<td class="ui-state-default ui-th-ltr zc_grid_head"><img src="${ctx }/images/u103.gif"><a href="javaScript:void(0);" onclick="deleteCreditVisit();">删除&nbsp;</a></td>
			</tr>
			<tr>
				<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head">
					<input type="checkbox" name="" id="visitChecks" onclick="getAllCellVisit() ;" >
				</th>
				<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
					图片名称
				</th>
				<th width="17%" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
					附件
				</th>
			</tr></table></td></tr>
		
		<c:if test="${supplierImage != null &&  fn:length(supplierImage) > 0}">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head"><strong>供应商图片</strong></td>
					<td colspan="1" class="ui-state-default ui-th-ltr zc_grid_head" align="center"><strong>操作</strong></td>
				</tr>
				<c:forEach items="${supplierImage}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;" colspan="4"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=supplierUpload'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a></td>	
				<td style="text-align: center;" colspan="1"><img src="${ctx }/images/u103.gif"><a href="javaScript:void(0);" onclick="deleteImage('${item.SSUP_ID}',this) ;">删除&nbsp;</a></td>
				</tr>
				</c:forEach>
			</c:if>
			<tr>
			<td colspan="5" align="center" class="ui-state-default ui-th-ltr zc_grid_head"><input type="button" class="ui-state-default ui-corner-all" value="上传" onClick="update()"></input><input type="reset" class="ui-state-default ui-corner-all" value="返回" onClick="javascript:history.go(-1);"></input></td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</td>
		</tr>
		</table>
		</form>
	