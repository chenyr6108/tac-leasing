//点击年份选择查询的年份应收账款
function selectCard(n) {
	location.href = "../servlet/defaultDispatcher?__action=report.queryNoDecomposeReport&cardFlag=" + n;
}