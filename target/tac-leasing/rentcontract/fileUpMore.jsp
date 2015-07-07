<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>资料管理</title>
		<script type="text/javascript">
			//作废文件
			function invalidRentFileUp(trid,TRFU_ID,id,REFI_ID,PRCD_ID){			
				if(confirm('确认作废该条记录？')){		
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=rentFile.invalidRentFileUp&TRFU_ID='+TRFU_ID,
						dataType:'json',
						async: false,
						success: function(dataBack){
							$("tr[id="+trid+"]").remove();
						},
						error:function(callback){
							alert("error!");
							return;
						}
					});	
				}else{
					return false;
				}			
			}							
		</script>
	</head>
	<body>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
			<c:forEach items="${logFileUpList}" var="item" varStatus="status">	
					<tr id="fileup${status.count }" class="ui-widget-content jqgrow ui-row-ltr">						
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.download&name=${item.FILE_FILENAME }&path=${item.PATH }'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.FILE_FILENAME}" name="showRentFile"></a></td>
						<!-- delete by ZhangYizhou on 2014-06-19 begin -->
						<!-- IT201406075 : 去除合同资料相关页面的资料删除按键 -->
						
						<td style="text-align: center;"> <c:if test="${deleteRentFile==true}"><a href="javaScript:void(0)" onclick="invalidRentFileUp('fileup${status.count }','${item.TRFU_ID }','${id}','${REFI_ID }','${PRCD_ID}')"><input type="button" class="ui-state-default ui-corner-all" id="deleteRentFile" value="删除${item.FILE_FILENAME}" name="deleteRentFile"></a></c:if>&nbsp;</td>	
					
						<!-- delete by ZhangYizhou on 2014-06-19 end -->
					</tr>		
			</c:forEach>		
		</table>	
	</body>
</html>	
