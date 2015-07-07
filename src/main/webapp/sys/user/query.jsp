<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="/common/js/Pager.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/common/js/css.css" />

<style type="text/css">
	h1   { font:bold 20px/26px Arial;}
	#userList.table  { border:0;border-collapse:collapse;}
	#userList.td { font:normal 12px/17px Arial;padding:2px;width:100px;}
	#userList.th   { font:bold 12px/17px Arial;text-align:left;padding:4px;border-bottom:1px solid #333;}
	tr.odd  { background:#f1f1f1;}
	tr.highlight { background:#dddddd;}
	tr.selected  { background:#aaaaaa;color:#fff;}
</style>

<script src="/common/js/jquery-1.3.2.js" type="text/javascript" ></script>
<script src="/common/js/jquery.form.js" type="text/javascript" ></script>
<script src="/common/js/jquery.blockUI.js" type="text/javascript" ></script>

<script type="text/javascript">

var oTable ;

$().ready(function() {

	
	
	$("#searchForm").submit( function () {
	
		  
	    $.blockUI({ 
	    	message: $('#info'),
	    	showOverlay: false, 
            centerY: false,
            css: { 
                width: '350px', 
                top: '10px', 
                left: '', 
                right: '10px', 
                border: 'none', 
                padding: '5px', 
                backgroundColor: '#ccc', 
                '-webkit-border-radius': '10px', 
                '-moz-border-radius': '10px', 
                opacity: '.6', 
                color: '#fff' 
            }
	    	
	    }); 
	
		submitSearch();			

				
		return false;

	
		

	} );	

	
	$('#info').click(function(){
			$.unblockUI();
	});	
	
	


});

function randerTable(){
	 $('#userList tbody tr:even').addClass('odd');
	 $('#userList tbody tr').hover(
	   function() {$(this).addClass('highlight');},
	   function() {$(this).removeClass('highlight');}
	 );
	 
	 $('#userList tbody tr').click(
	   function() {$(this).toggleClass('selected');}
	 );	

}


function submitSearch(__currentPage){

    if(__currentPage)
    	$('#__currentPage').val(__currentPage);

	$('#searchForm').ajaxSubmit({
		dataType:'json',
		success : function(json){		
				
	
			clearTable();
			
		    if(!json.dw.rs){
			
				$('#info').text('没有数据');
				$.blockUI.addTimeout(1000);
				
			}else{			
			
				$('#info').text('查询完毕');
				$.blockUI.addTimeout(500);
			
				fillTable(json.dw.rs);
				showPageInfo(json.dw);
										
			}	
			
		}
	});	
}

function showPageInfo(dw){

	var content = 'total ' + dw.recordCount + ' record in ' + dw.pageCount + ' pages,goto:&nbsp;';
	
	for(var i=1; i<=dw.pageCount; i++){
		content += '<a href="javascript:;;" onclick="submitSearch('+ i +')">' + i + '</a>&nbsp;';
	}
	$('#pager').html('');
	$('#pager').append(content);
	
	randerTable();
}

function fillTable(data){

    var con = '';
	$.each(data, function(i, n){
		con += '<tr height="25">';
		con += '<td>' + n.ssn + '</td>';
		con += '<td>' + n.name + '</td>';
		con += '<td>' + n.email + '</td>';	
		con += '<td align="center"><a href="/user/update.jsp?uuid=' + n.uuid + '">编辑</a></td>';		
		con += '</tr>';			  
	});
					
   con = '<tbody>' + con + '</tbody>';						
   $('#userList').append(con);
}

function clearTable(){

	$('#userList>tbody').html('');
	
	
}

</script>



</head>
<body>
<br/><br/>
<div id="info" style="display:none;">正在提交数据，请稍候</div>
<br/>
<form id="searchForm" name="searchForm" method="post" action="/servlet/defaultDispatcher">  

	<table align="center" border="1" width="600"  class="f9">
	<tr height="25">

		<td>姓名<input type="text" id="name" name="name"></td>
		<td>email<input type="text" id="email" name="email"></td>
		<td width="100" colspan="2" align="right">
			<input type="hidden" name="__action" value="user.query"/>
			<input type="hidden" id="__currentPage" name="__currentPage" value="1"/>
			<select name="__pageSize" style="width:50px">
				<option value="5" selected>5</option>
				<option value="10">10</option>
				<option value="15">15</option>
			</select>
			
			<input type="submit" name="submit" value="查找"/>
		</td>
	</tr>	
	</table>
</form>	
<br>
<table width="600" border="0" align="center">
<tr><td align="right">
<div id="pager" > </div>

</td>
</tr>
</table>

<table id="userList" width="600" border="1" align="center">
	<thead>
		<tr height="25">
			<th>用户名</th>
			<th>姓名</th>
			<th>Email</th>
			<th>操作</th>
		</tr>
	</thead>
</table>

</body>
</html>