<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script>

	function jumpToPageBottom() {
		if(isNaN(parseInt($("#goToPageBottom").val()))) {
			$("#goToPageBottom").val('');
			return;
		}
		if($("#goToPageBottom").val()==0||parseInt($("#goToPageBottom").val())>parseInt($("#pageCount").val())) {
			return;
		}
		$("#currentPage").val($("#goToPageBottom").val());
		$("#form").submit();
	}
	
</script>

	<c:if test="${pageTotalSize eq '0'}">
			<table border="0" width="100%" class="STYLE1" width="100%" >
		    	<tr>
		    		<td align="right">
		    		<input type="hidden" id="currentPage" name="currentPage" value="${currentPage }">
		    		<input type="hidden" id="pageSize" name="pageSize" value="${pageSize }">
		    		<input type="hidden" id="pageTotalSize" name="pageTotalSize" value="${pageTotalSize }">
		    		<input type="hidden" id="pageCount" name="pageCount" value="${pageCount }">
		    			<font color="#c0c0c0">每页显示</font>
					    <a href="javascript:void(0)" style="color:#c0c0c0;text-decoration:none">10</a>	
						<a href="javascript:void(0)" style="color:#c0c0c0;text-decoration:none">20</a>	
						<a href="javascript:void(0)" style="color:#c0c0c0;text-decoration:none">50</a>
					   &nbsp;&nbsp;<font color="#c0c0c0">共0条</font>
					   <a href='javascript:void(0)' style="color:#c0c0c0;text-decoration:none">首页</a>
					   <a href='javascript:void(0)' style="color:#c0c0c0;text-decoration:none">上一页</a>
					   <a href='javascript:void(0)' style="color:#c0c0c0;text-decoration:none">下一页</a>
					   <a href='javascript:void(0)' style="color:#c0c0c0;text-decoration:none">尾页</a> 
					  <font color="#c0c0c0">到第</font>
						<input type="text" size="3" id="goToPageTop" name="goToPage" disabled="disabled">
					   <font color="#c0c0c0">页</font>
						<input type="button" value="跳转"
							class="ui-state-default ui-corner-all" disabled="disabled" style="color:#c0c0c0;">
		    		</td>
		    	</tr>
		    </table>
	</c:if>
	<c:if test="${pageTotalSize ne '0'}">
		    <table border="0" width="100%" class="STYLE1" width="100%" >
		    	<tr>
		    		<td align="right">
		    			每页显示
					    <a href="javascript:void(0)" onclick="page10(10);" style="color:#2E6E9E;text-decoration:none">10</a>	
						<a href="javascript:void(0)" onclick="page20(20);" style="color:#2E6E9E;text-decoration:none">20</a>	
						<a href="javascript:void(0)" onclick="page50(50);" style="color:#2E6E9E;text-decoration:none">50</a>
					   &nbsp;&nbsp; 共${pageTotalSize }条  第${currentPage }/${pageCount } 
					   <a href='javascript:void(0)' onclick="toFirstPage()" style="color:#2E6E9E;text-decoration:none">首页</a>
					   <a href='javascript:void(0)' onclick="toPreviousPage()" style="color:#2E6E9E;text-decoration:none">上一页</a>
					   <a href='javascript:void(0)' onclick="toNextPage()" style="color:#2E6E9E;text-decoration:none">下一页</a>
					   <a href='javascript:void(0)' onclick="toLastPage()" style="color:#2E6E9E;text-decoration:none">尾页</a> 
					   到第
						<input type="text" size="3" id="goToPageBottom" name="goToPage" onkeyup="value=value.replace(/[^\d]/g,'')">
					   页
						<input type="button" value="跳转"
							class="ui-state-default ui-corner-all" onclick="jumpToPageBottom()">
		    		</td>
		    	</tr>
		    </table>
    </c:if>	
 