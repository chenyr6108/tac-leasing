<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  
		
	 
    <table border="0" width="100%" class="STYLE1" width="100%" >
    	<tr>
    		<td align="right">
    			每页显示
			    <a href="javascript:void(0)" onclick="changePageTo10();">10</a>	
				<a href="javascript:void(0)" onclick="changePageTo20();">20</a>	
				<a href="javascript:void(0)" onclick="changePageTo50();">50</a>
			   &nbsp;&nbsp; 共${dw.recordCount }条  第${dw.currentPage }/${dw.pageCount } 
			   <a href='javascript:void(0)' onclick="gotoF();">首页</a>
			   <a href='javascript:void(0)' onclick="gotoP();">上一页</a>
			   <a href='javascript:void(0)' onclick="gotoN(${dw.pageCount });">下一页</a>
			   <a href='javascript:void(0)' onclick="gotoL(${dw.pageCount });">尾页</a> 
			   到第
				<input type="text" size="3" id="jumpTop" name="jumpTop">
			   页
				<input type="button" id="jumpBut" value="跳转"
					onclick="jumpTo2(${dw.pageCount });" class="ui-state-default ui-corner-all">
    		</td>
    	</tr>
    </table>	
 