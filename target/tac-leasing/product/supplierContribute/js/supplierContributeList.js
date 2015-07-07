//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
}  
function formtValue(){
	var value = $.trim($("#searchValue").val());
	$("#searchValue").val(value);
}