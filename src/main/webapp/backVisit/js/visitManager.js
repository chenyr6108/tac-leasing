
//允许提交          为true
var isSubmit = true;
//是否有分公司
var isHaveChild = true;
//分公司的个数
var childCount = 0;

//查找一条公司记录
function showVisitReviewRecord(id){
	location.href='../servlet/defaultDispatcher?__action=backVisit.queryVisitReviewRecordByLeaseCode&lease_code_List='+id;
}




