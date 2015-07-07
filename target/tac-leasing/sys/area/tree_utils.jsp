<%@page import="com.brick.area.service.TreeRead"%>

<body>
		<table width="100%" border="0" cellspacing="1" cellpadding="0" height="100%">
			<tr>
				<td width="15%" valign="top">
				<table>
				<tr>
				<td valign="top" nowrap="nowrap">
					<%=new TreeRead().readTree()%>
				</td>
			</tr>
		</table>
	</td>
    <td  height="100%" width="85%" valign="top">
   
    </td>
  </tr>
</table>
	</body>
 
