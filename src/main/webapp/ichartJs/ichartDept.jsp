<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	$(function() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=ichartCommand.getDeptListForIchart',
			dataType:'json',
			success:function(deptList) {
				$.each(deptList,function(index,value){
					$("#deptList").append("<INPUT TYPE='checkbox' NAME='ids' id='ids"+value.DECP_ID+"'value='"+value.DECP_ID+"' onclick='showLine();'>"+value.DECP_NAME_CN);
			});
			}
		});
	});
</script>
<span id="deptList">
</span>	   