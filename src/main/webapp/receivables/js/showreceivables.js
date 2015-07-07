//点击年份选择查询的年份应收账款
function selectCard(m,n) {
	location.href = "../servlet/defaultDispatcher?__action=receivables.queryReceivablesByYear&cardFlag=" + m +"&search_year=" + n;
}


