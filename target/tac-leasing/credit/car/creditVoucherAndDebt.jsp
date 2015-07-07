<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function inputDatablur(fild,k){
		   valueChangeTableVg1(fild,k);		   
		}  
		function inputData2blur(fild,k){
		   valueChangeTableVg2(fild,k);	   
		} 
		
		function exportFin(credit_id,form_name,pjcc_id) {
			for(var i=0;i<document.getElementsByName("excelId").length;i++) {
				document.getElementsByName("excelId")[i].value=pjcc_id;
			}
			form_name.__action.value="creditVoucher.exportExcel";
			form_name.submit();
		}
</script>
		<script type="text/javascript">  
			var lengthpc=$("#lengthpc").val();
			for(k=1;k<=lengthpc;k++){
			$("#project_itemV"+k+"1").datepicker($.datepicker.regional['zh-CN']); 
			$("#project_itemV"+k+"2").datepicker($.datepicker.regional['zh-CN']); 
			$("#project_itemV"+k+"3").datepicker($.datepicker.regional['zh-CN']); 
		    $("#s_start_dateV"+k+"1").datepicker($.datepicker.regional['zh-CN']); 
			$("#s_start_dateV"+k+"2").datepicker($.datepicker.regional['zh-CN']); 
			$("#s_start_dateV"+k+"3").datepicker($.datepicker.regional['zh-CN']); 
			changeProjectItemVg(k);
			sumZiChanZongEVg(k);
			sumFuZaiZongEVg(k);
			sumJingZhiZongEVg(k)
			initAllDataVg(k);
			sumYingYeLiYiVg(k);
			sumShuiQianSunYiVg(k);
			sumShuiHouSunYiVg(k);	
			initTable2DataVg(k);
			}
			
			$(function() {
				//TITLE外第二行
				$("#toExcelRow2Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(2).find("td").eq(2).text());
				$("#toExcelRow2Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(2).find("td").eq(3).text());
				$("#toExcelRow2Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(2).find("td").eq(5).text());
				$("#toExcelRow2Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(2).find("td").eq(6).text());
				$("#toExcelRow2Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(2).find("td").eq(8).text());
				
				$("#toExcelRow3Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(3).find("td").eq(2).text());
				$("#toExcelRow3Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(3).find("td").eq(3).text());
				$("#toExcelRow3Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(3).find("td").eq(5).text());
				$("#toExcelRow3Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(3).find("td").eq(6).text());
				$("#toExcelRow3Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(3).find("td").eq(8).text());
				
				$("#toExcelRow4Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(4).find("td").eq(2).text());
				$("#toExcelRow4Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(4).find("td").eq(3).text());
				$("#toExcelRow4Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(4).find("td").eq(5).text());
				$("#toExcelRow4Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(4).find("td").eq(6).text());
				$("#toExcelRow4Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(4).find("td").eq(8).text());
				
				$("#toExcelRow5Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(5).find("td").eq(2).text());
				$("#toExcelRow5Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(5).find("td").eq(3).text());
				$("#toExcelRow5Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(5).find("td").eq(5).text());
				$("#toExcelRow5Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(5).find("td").eq(6).text());
				$("#toExcelRow5Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(5).find("td").eq(8).text());
				
				$("#toExcelRow6Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(6).find("td").eq(2).text());
				$("#toExcelRow6Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(6).find("td").eq(3).text());
				$("#toExcelRow6Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(6).find("td").eq(5).text());
				$("#toExcelRow6Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(6).find("td").eq(6).text());
				$("#toExcelRow6Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(6).find("td").eq(8).text());
				
				$("#toExcelRow7Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(7).find("td").eq(2).text());
				$("#toExcelRow7Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(7).find("td").eq(3).text());
				$("#toExcelRow7Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(7).find("td").eq(5).text());
				$("#toExcelRow7Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(7).find("td").eq(6).text());
				$("#toExcelRow7Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(7).find("td").eq(8).text());
				
				$("#toExcelRow8Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(8).find("td").eq(2).text());
				$("#toExcelRow8Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(8).find("td").eq(3).text());
				$("#toExcelRow8Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(8).find("td").eq(5).text());
				$("#toExcelRow8Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(8).find("td").eq(6).text());
				$("#toExcelRow8Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(8).find("td").eq(8).text());
				
				$("#toExcelRow9Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(1).find("input").val());
				$("#toExcelRow9Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(2).text());
				$("#toExcelRow9Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(3).text());
				$("#toExcelRow9Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(4).find("input").val());
				$("#toExcelRow9Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(5).text());
				$("#toExcelRow9Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(6).text());
				$("#toExcelRow9Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(7).find("input").val());
				$("#toExcelRow9Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(9).find("td").eq(8).text());
				
				$("#toExcelRow10Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(10).find("td").eq(2).text());
				$("#toExcelRow10Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(10).find("td").eq(3).text());
				$("#toExcelRow10Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(10).find("td").eq(5).text());
				$("#toExcelRow10Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(10).find("td").eq(6).text());
				$("#toExcelRow10Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(10).find("td").eq(8).text());
				
				$("#toExcelRow11Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(11).find("td").eq(2).text());
				$("#toExcelRow11Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(11).find("td").eq(3).text());
				$("#toExcelRow11Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(11).find("td").eq(5).text());
				$("#toExcelRow11Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(11).find("td").eq(6).text());
				$("#toExcelRow11Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(11).find("td").eq(8).text());
				
				$("#toExcelRow12Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(12).find("td").eq(2).text());
				$("#toExcelRow12Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(12).find("td").eq(3).text());
				$("#toExcelRow12Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(12).find("td").eq(5).text());
				$("#toExcelRow12Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(12).find("td").eq(6).text());
				$("#toExcelRow12Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(12).find("td").eq(8).text());
				
				$("#toExcelRow13Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(13).find("td").eq(2).text());
				$("#toExcelRow13Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(13).find("td").eq(3).text());
				$("#toExcelRow13Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(13).find("td").eq(5).text());
				$("#toExcelRow13Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(13).find("td").eq(6).text());
				$("#toExcelRow13Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(13).find("td").eq(8).text());
				
				$("#toExcelRow14Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(14).find("td").eq(2).text());
				$("#toExcelRow14Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(14).find("td").eq(3).text());
				$("#toExcelRow14Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(14).find("td").eq(5).text());
				$("#toExcelRow14Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(14).find("td").eq(6).text());
				$("#toExcelRow14Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(14).find("td").eq(8).text());
				
				$("#toExcelRow15Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(15).find("td").eq(2).text());
				$("#toExcelRow15Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(15).find("td").eq(3).text());
				$("#toExcelRow15Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(15).find("td").eq(5).text());
				$("#toExcelRow15Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(15).find("td").eq(6).text());
				$("#toExcelRow15Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(15).find("td").eq(8).text());
				
				$("#toExcelRow16Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(16).find("td").eq(2).text());
				$("#toExcelRow16Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(16).find("td").eq(3).text());
				$("#toExcelRow16Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(16).find("td").eq(5).text());
				$("#toExcelRow16Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(16).find("td").eq(6).text());
				$("#toExcelRow16Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(16).find("td").eq(8).text());
				
				$("#toExcelRow17Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(17).find("td").eq(2).text());
				$("#toExcelRow17Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(17).find("td").eq(3).text());
				$("#toExcelRow17Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(17).find("td").eq(5).text());
				$("#toExcelRow17Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(17).find("td").eq(6).text());
				$("#toExcelRow17Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(17).find("td").eq(8).text());
				
				$("#toExcelRow18Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(1).find("input").val());
				$("#toExcelRow18Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(2).text());
				$("#toExcelRow18Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(3).text());
				$("#toExcelRow18Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(4).find("input").val());
				$("#toExcelRow18Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(5).text());
				$("#toExcelRow18Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(6).text());
				$("#toExcelRow18Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(7).find("input").val());
				$("#toExcelRow18Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(18).find("td").eq(8).text());
				
				$("#toExcelRow19Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(19).find("td").eq(2).text());
				$("#toExcelRow19Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(19).find("td").eq(3).text());
				$("#toExcelRow19Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(19).find("td").eq(5).text());
				$("#toExcelRow19Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(19).find("td").eq(6).text());
				$("#toExcelRow19Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(19).find("td").eq(8).text());
				
				$("#toExcelRow20Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(20).find("td").eq(2).text());
				$("#toExcelRow20Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(20).find("td").eq(3).text());
				$("#toExcelRow20Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(20).find("td").eq(5).text());
				$("#toExcelRow20Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(20).find("td").eq(6).text());
				$("#toExcelRow20Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(20).find("td").eq(8).text());
				
				$("#toExcelRow21Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(1).find("input").val());
				$("#toExcelRow21Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(2).text());
				$("#toExcelRow21Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(3).text());
				$("#toExcelRow21Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(4).find("input").val());
				$("#toExcelRow21Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(5).text());
				$("#toExcelRow21Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(6).text());
				$("#toExcelRow21Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(7).find("input").val());
				$("#toExcelRow21Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(21).find("td").eq(8).text());
				
				$("#toExcelRow22Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(22).find("td").eq(2).text());
				$("#toExcelRow22Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(22).find("td").eq(3).text());
				$("#toExcelRow22Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(22).find("td").eq(5).text());
				$("#toExcelRow22Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(22).find("td").eq(6).text());
				$("#toExcelRow22Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(22).find("td").eq(8).text());
				
				$("#toExcelRow23Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(23).find("td").eq(2).text());
				$("#toExcelRow23Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(23).find("td").eq(3).text());
				$("#toExcelRow23Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(23).find("td").eq(5).text());
				$("#toExcelRow23Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(23).find("td").eq(6).text());
				$("#toExcelRow23Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(23).find("td").eq(8).text());
				
				$("#toExcelRow24Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(24).find("td").eq(2).text());
				$("#toExcelRow24Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(24).find("td").eq(3).text());
				$("#toExcelRow24Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(24).find("td").eq(5).text());
				$("#toExcelRow24Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(24).find("td").eq(6).text());
				$("#toExcelRow24Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(24).find("td").eq(8).text());
				
				$("#toExcelRow25Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(25).find("td").eq(2).text());
				$("#toExcelRow25Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(25).find("td").eq(3).text());
				$("#toExcelRow25Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(25).find("td").eq(5).text());
				$("#toExcelRow25Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(25).find("td").eq(6).text());
				$("#toExcelRow25Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(25).find("td").eq(8).text());
				
				$("#toExcelRow26Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(26).find("td").eq(2).text());
				$("#toExcelRow26Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(26).find("td").eq(3).text());
				$("#toExcelRow26Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(26).find("td").eq(5).text());
				$("#toExcelRow26Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(26).find("td").eq(6).text());
				$("#toExcelRow26Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(26).find("td").eq(8).text());
				
				$("#toExcelRow27Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(27).find("td").eq(2).text());
				$("#toExcelRow27Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(27).find("td").eq(3).text());
				$("#toExcelRow27Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(27).find("td").eq(5).text());
				$("#toExcelRow27Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(27).find("td").eq(6).text());
				$("#toExcelRow27Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(27).find("td").eq(8).text());
				
				$("#toExcelRow28Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(28).find("td").eq(2).text());
				$("#toExcelRow28Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(28).find("td").eq(3).text());
				$("#toExcelRow28Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(28).find("td").eq(5).text());
				$("#toExcelRow28Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(28).find("td").eq(6).text());
				$("#toExcelRow28Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(28).find("td").eq(8).text());
				
				$("#toExcelRow29Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(1).find("input").val());
				$("#toExcelRow29Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(2).text());
				$("#toExcelRow29Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(3).text());
				$("#toExcelRow29Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(4).find("input").val());
				$("#toExcelRow29Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(5).text());
				$("#toExcelRow29Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(6).text());
				$("#toExcelRow29Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(7).find("input").val());
				$("#toExcelRow29Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(29).find("td").eq(8).text());
				
				$("#toExcelRow30Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(30).find("td").eq(2).text());
				$("#toExcelRow30Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(30).find("td").eq(3).text());
				$("#toExcelRow30Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(30).find("td").eq(5).text());
				$("#toExcelRow30Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(30).find("td").eq(6).text());
				$("#toExcelRow30Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(30).find("td").eq(8).text());
				
				$("#toExcelRow31Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(31).find("td").eq(2).text());
				$("#toExcelRow31Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(31).find("td").eq(3).text());
				$("#toExcelRow31Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(31).find("td").eq(5).text());
				$("#toExcelRow31Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(31).find("td").eq(6).text());
				$("#toExcelRow31Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(31).find("td").eq(8).text());
				
				$("#toExcelRow32Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(1).find("input").val());
				$("#toExcelRow32Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(2).text());
				$("#toExcelRow32Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(3).text());
				$("#toExcelRow32Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(4).find("input").val());
				$("#toExcelRow32Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(5).text());
				$("#toExcelRow32Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(6).text());
				$("#toExcelRow32Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(7).find("input").val());
				$("#toExcelRow32Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(32).find("td").eq(8).text());
				
				$("#toExcelRow33Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(33).find("td").eq(2).text());
				$("#toExcelRow33Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(33).find("td").eq(3).text());
				$("#toExcelRow33Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(33).find("td").eq(5).text());
				$("#toExcelRow33Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(33).find("td").eq(6).text());
				$("#toExcelRow33Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(33).find("td").eq(8).text());
				
				$("#toExcelRow34Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(1).find("input").val());
				$("#toExcelRow34Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(2).text());
				$("#toExcelRow34Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(3).text());
				$("#toExcelRow34Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(4).find("input").val());
				$("#toExcelRow34Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(5).text());
				$("#toExcelRow34Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(6).text());
				$("#toExcelRow34Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(7).find("input").val());
				$("#toExcelRow34Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(34).find("td").eq(8).text());
				
				$("#toExcelRow35Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(35).find("td").eq(2).text());
				$("#toExcelRow35Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(35).find("td").eq(3).text());
				$("#toExcelRow35Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(35).find("td").eq(5).text());
				$("#toExcelRow35Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(35).find("td").eq(6).text());
				$("#toExcelRow35Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(35).find("td").eq(8).text());
				
				$("#toExcelRow36Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(36).find("td").eq(2).text());
				$("#toExcelRow36Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(36).find("td").eq(3).text());
				$("#toExcelRow36Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(36).find("td").eq(5).text());
				$("#toExcelRow36Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(36).find("td").eq(6).text());
				$("#toExcelRow36Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(36).find("td").eq(8).text());
				
				$("#toExcelRow37Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(37).find("td").eq(2).text());
				$("#toExcelRow37Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(37).find("td").eq(3).text());
				$("#toExcelRow37Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(37).find("td").eq(5).text());
				$("#toExcelRow37Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(37).find("td").eq(6).text());
				$("#toExcelRow37Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(37).find("td").eq(8).text());
				
				$("#toExcelRow38Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(38).find("td").eq(2).text());
				$("#toExcelRow38Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(38).find("td").eq(3).text());
				$("#toExcelRow38Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(38).find("td").eq(5).text());
				$("#toExcelRow38Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(38).find("td").eq(6).text());
				$("#toExcelRow38Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(38).find("td").eq(8).text());
				
				$("#toExcelRow39Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(39).find("td").eq(2).text());
				$("#toExcelRow39Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(39).find("td").eq(3).text());
				$("#toExcelRow39Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(39).find("td").eq(5).text());
				$("#toExcelRow39Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(39).find("td").eq(6).text());
				$("#toExcelRow39Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(39).find("td").eq(8).text());
				
				$("#toExcelRow40Col2"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(1).find("input").val());
				$("#toExcelRow40Col3"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(2).text());
				$("#toExcelRow40Col4"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(3).text());
				$("#toExcelRow40Col5"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(4).find("input").val());
				$("#toExcelRow40Col6"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(5).text());
				$("#toExcelRow40Col7"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(6).text());
				$("#toExcelRow40Col8"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(7).find("input").val());
				$("#toExcelRow40Col9"+${status.count }).val($("#capitalAndDebtTabVg"+${status.count }).find("tr").eq(40).find("td").eq(8).text());
			});
</script>
<div style="text-align: right">
			<input type="button" value="导出Excel" class="ui-state-default ui-corner-all" onclick="exportFin('${prcd_id }',this.form,'${obj1.PJCCC_ID }')" style="cursor: pointer;">
</div>
<br>
<table id="capitalAndDebtTabVg${status.count }" width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
	<tr>
		 <th class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;font-size:14px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
			财务报表资产负债表暨水平分析(年度) 
		 </th> 			  
		 <th class="ui-state-default ui-th-ltr zc_grid_head">
			 <font style="font-size: 14px;">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;font-size:14px;">
			科目\日期
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly" onchange="changeProjectItemVg(${status.count } );"  name="project_itemV" id="project_itemV${status.count }1" value="${obj1.PROJECT_ITEM}" style="width: 100px;text-align: right;">
			<input type="hidden" value="${obj1.PROJECT_ITEM}" name="toExcelRow1Col2">
			
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<input type="button" value="剪切到下年" onclick="cutdownVg(1,${status.count },1);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly"  onchange="changeProjectItemVg(${status.count });" name="project_itemV" id="project_itemV${status.count }2" value="${obj2.PROJECT_ITEM}" style="width: 100px;text-align: right;">
			<input type="hidden" value="${obj2.PROJECT_ITEM}" name="toExcelRow1Col5">
			<input type="hidden" name="excelId">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<input type="button" value="剪切到下年" onclick="cutdownVg(1,${status.count },2);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly"  onchange="changeProjectItemVg(${status.count });"  name="project_itemV" id="project_itemV${status.count }3" value="${obj3.PROJECT_ITEM}" style="width: 100px;text-align: right;">
			<input type="hidden" value="${obj3.PROJECT_ITEM}" name="toExcelRow1Col8">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			现金及约当现金
			<input type="hidden" value="现金及约当现金" name="toExcelRow2Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });"  name="ca_cash_priceV" id="ca_cash_priceV${status.count }1" value="${obj1.CA_CASH_PRICE }"  style="width: 100px;text-align: right;">
			<input type="hidden" value="${obj1.CA_CASH_PRICE}" name="toExcelRow2Col2">
			
			<input type="hidden" name="toExcelRow2Col3" id="toExcelRow2Col3${status.count }">
			<input type="hidden" name="toExcelRow2Col4" id="toExcelRow2Col4${status.count }">
			<input type="hidden" name="toExcelRow2Col6" id="toExcelRow2Col6${status.count }">
			<input type="hidden" name="toExcelRow2Col7" id="toExcelRow2Col7${status.count }">
			<input type="hidden" name="toExcelRow2Col9" id="toExcelRow2Col9${status.count }">
			
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_cash_priceV" id="ca_cash_priceV${status.count }2" value="${obj2.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow2Col5" value="${obj2.CA_CASH_PRICE }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }"  onblur="inputDatablur(this.value,${status.count });" name="ca_cash_priceV" id="ca_cash_priceV${status.count }3" value="${obj3.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow2Col8" value="${obj3.CA_CASH_PRICE }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			短期投资
			<input type="hidden" value="短期投资" name="toExcelRow3Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }1" value="${obj1.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		
			<input type="hidden" value="${obj1.CA_SHORT_INVEST}" name="toExcelRow3Col2">
		
			<input type="hidden" name="toExcelRow3Col3" id="toExcelRow3Col3${status.count }">
			<input type="hidden" name="toExcelRow3Col4" id="toExcelRow3Col4${status.count }">
			<input type="hidden" name="toExcelRow3Col6" id="toExcelRow3Col6${status.count }">
			<input type="hidden" name="toExcelRow3Col7" id="toExcelRow3Col7${status.count }">
			<input type="hidden" name="toExcelRow3Col9" id="toExcelRow3Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }2" value="${obj2.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow3Col5" value="${obj2.CA_SHORT_INVEST }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }3" value="${obj3.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow3Col8" value="${obj3.CA_SHORT_INVEST }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			应收票据
			<input type="hidden" value="应收票据" name="toExcelRow4Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }1" value="${obj1.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow4Col2" value="${obj1.CA_BILLS_SHOULD }">
			
			<input type="hidden" name="toExcelRow4Col3" id="toExcelRow4Col3${status.count }">
			<input type="hidden" name="toExcelRow4Col4" id="toExcelRow4Col4${status.count }">
			<input type="hidden" name="toExcelRow4Col6" id="toExcelRow4Col6${status.count }">
			<input type="hidden" name="toExcelRow4Col7" id="toExcelRow4Col7${status.count }">
			<input type="hidden" name="toExcelRow4Col9" id="toExcelRow4Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }2" value="${obj2.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow4Col5" value="${obj2.CA_BILLS_SHOULD }">		
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }3" value="${obj3.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow4Col8" value="${obj3.CA_BILLS_SHOULD }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			应收账款
			<input type="hidden" value="应收账款" name="toExcelRow5Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }1" value="${obj1.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow5Col2" value="${obj1.CA_FUNDS_SHOULD }">
		
			<input type="hidden" name="toExcelRow5Col3" id="toExcelRow5Col3${status.count }">
			<input type="hidden" name="toExcelRow5Col4" id="toExcelRow5Col4${status.count }">
			<input type="hidden" name="toExcelRow5Col6" id="toExcelRow5Col6${status.count }">
			<input type="hidden" name="toExcelRow5Col7" id="toExcelRow5Col7${status.count }">
			<input type="hidden" name="toExcelRow5Col9" id="toExcelRow5Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }2" value="${obj2.CA_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow5Col5" value="${obj2.CA_FUNDS_SHOULD }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }3" value="${obj3.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow5Col8" value="${obj3.CA_FUNDS_SHOULD }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			其他应收款
			<input type="hidden" value="其他应收款" name="toExcelRow6Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }1" value="${obj1.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow6Col2" value="${obj1.CA_OTHER_FUNDS_SHOULD }">
			
			<input type="hidden" name="toExcelRow6Col3" id="toExcelRow6Col3${status.count }">
			<input type="hidden" name="toExcelRow6Col4" id="toExcelRow6Col4${status.count }">
			<input type="hidden" name="toExcelRow6Col6" id="toExcelRow6Col6${status.count }">
			<input type="hidden" name="toExcelRow6Col7" id="toExcelRow6Col7${status.count }">
			<input type="hidden" name="toExcelRow6Col9" id="toExcelRow6Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }2" value="${obj2.CA_OTHER_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow6Col5" value="${obj2.CA_OTHER_FUNDS_SHOULD }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }3" value="${obj3.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow6Col8" value="${obj3.CA_OTHER_FUNDS_SHOULD }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			存货
			<input type="hidden" value="存货" name="toExcelRow7Col1">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }1" value="${obj1.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow7Col2" value="${obj1.CA_GOODS_STOCK }">
			
			<input type="hidden" name="toExcelRow7Col3" id="toExcelRow7Col3${status.count }">
			<input type="hidden" name="toExcelRow7Col4" id="toExcelRow7Col4${status.count }">
			<input type="hidden" name="toExcelRow7Col6" id="toExcelRow7Col6${status.count }">
			<input type="hidden" name="toExcelRow7Col7" id="toExcelRow7Col7${status.count }">
			<input type="hidden" name="toExcelRow7Col9" id="toExcelRow7Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }2" value="${obj2.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow7Col5" value="${obj2.CA_GOODS_STOCK }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }3" value="${obj3.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow7Col8" value="${obj3.CA_GOODS_STOCK }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			其他流动资产
			<input type="hidden" name="toExcelRow8Col1" value="其他流动资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }1" value="${obj1.CA_OTHER}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow8Col2" value="${obj1.CA_OTHER }">
			
			<input type="hidden" name="toExcelRow8Col3" id="toExcelRow8Col3${status.count }">
			<input type="hidden" name="toExcelRow8Col4" id="toExcelRow8Col4${status.count }">
			<input type="hidden" name="toExcelRow8Col6" id="toExcelRow8Col6${status.count }">
			<input type="hidden" name="toExcelRow8Col7" id="toExcelRow8Col7${status.count }">
			<input type="hidden" name="toExcelRow8Col9" id="toExcelRow8Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }2" value="${obj2.CA_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow8Col5" value="${obj2.CA_OTHER }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }3" value="${obj3.CA_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow8Col8" value="${obj3.CA_OTHER }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size: 14px;">流动资产</font>
			<input type="hidden" name="toExcelRow9Col1" value="流动资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow9Col2" id="toExcelRow9Col2${status.count }">
		
			<input type="hidden" name="toExcelRow9Col3" id="toExcelRow9Col3${status.count }">
			<input type="hidden" name="toExcelRow9Col4" id="toExcelRow9Col4${status.count }">
			<input type="hidden" name="toExcelRow9Col6" id="toExcelRow9Col6${status.count }">
			<input type="hidden" name="toExcelRow9Col7" id="toExcelRow9Col7${status.count }">
			<input type="hidden" name="toExcelRow9Col9" id="toExcelRow9Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow9Col5" id="toExcelRow9Col5${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow9Col8" id="toExcelRow9Col8${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			土地
			<input type="hidden" name="toExcelRow10Col1" value="土地">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }1" value="${obj1.FA_LAND}" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow10Col2" value="${obj1.FA_LAND}">
			
			<input type="hidden" name="toExcelRow10Col3" id="toExcelRow10Col3${status.count }">
			<input type="hidden" name="toExcelRow10Col4" id="toExcelRow10Col4${status.count }">
			<input type="hidden" name="toExcelRow10Col6" id="toExcelRow10Col6${status.count }">
			<input type="hidden" name="toExcelRow10Col7" id="toExcelRow10Col7${status.count }">
			<input type="hidden" name="toExcelRow10Col9" id="toExcelRow10Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }2" value="${obj2.FA_LAND}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow10Col5" value="${obj2.FA_LAND}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }3" value="${obj3.FA_LAND}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow10Col8" value="${obj3.FA_LAND}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			建筑物
			<input type="hidden" name="toExcelRow11Col1" value="建筑物">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }1" value="${obj1.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow11Col2" value="${obj1.FA_BUILDINGS}">
			
			<input type="hidden" name="toExcelRow11Col3" id="toExcelRow11Col3${status.count }">
			<input type="hidden" name="toExcelRow11Col4" id="toExcelRow11Col4${status.count }">
			<input type="hidden" name="toExcelRow11Col6" id="toExcelRow11Col6${status.count }">
			<input type="hidden" name="toExcelRow11Col7" id="toExcelRow11Col7${status.count }">
			<input type="hidden" name="toExcelRow11Col9" id="toExcelRow11Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }2" value="${obj2.FA_BUILDINGS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow11Col5" value="${obj2.FA_BUILDINGS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }3" value="${obj3.FA_BUILDINGS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow11Col8" value="${obj3.FA_BUILDINGS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			机器设备
			<input type="hidden" name="toExcelRow12Col1" value="机器设备">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }1" value="${obj1.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow12Col2" value="${obj1.FA_EQUIPMENTS}">
			
			<input type="hidden" name="toExcelRow12Col3" id="toExcelRow12Col3${status.count }">
			<input type="hidden" name="toExcelRow12Col4" id="toExcelRow12Col4${status.count }">
			<input type="hidden" name="toExcelRow12Col6" id="toExcelRow12Col6${status.count }">
			<input type="hidden" name="toExcelRow12Col7" id="toExcelRow12Col7${status.count }">
			<input type="hidden" name="toExcelRow12Col9" id="toExcelRow12Col9${status.count }">		
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }2" value="${obj2.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow12Col5" value="${obj2.FA_EQUIPMENTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }3" value="${obj3.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow12Col8" value="${obj3.FA_EQUIPMENTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			租赁资产
			<input type="hidden" name="toExcelRow13Col1" value="租赁资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }1" value="${obj1.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow13Col2" value="${obj1.FA_RENT_ASSETS}">
			
			<input type="hidden" name="toExcelRow13Col3" id="toExcelRow13Col3${status.count }">
			<input type="hidden" name="toExcelRow13Col4" id="toExcelRow13Col4${status.count }">
			<input type="hidden" name="toExcelRow13Col6" id="toExcelRow13Col6${status.count }">
			<input type="hidden" name="toExcelRow13Col7" id="toExcelRow13Col7${status.count }">
			<input type="hidden" name="toExcelRow13Col9" id="toExcelRow13Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }2" value="${obj2.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow13Col5" value="${obj2.FA_RENT_ASSETS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }3" value="${obj3.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow13Col8" value="${obj3.FA_RENT_ASSETS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			运输工具及生财器具
			<input type="hidden" name="toExcelRow14Col1" value="运输工具及生财器具">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }1" value="${obj1.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow14Col2" value="${obj1.FA_TRANSPORTS}">
			
			<input type="hidden" name="toExcelRow14Col3" id="toExcelRow14Col3${status.count }">
			<input type="hidden" name="toExcelRow14Col4" id="toExcelRow14Col4${status.count }">
			<input type="hidden" name="toExcelRow14Col6" id="toExcelRow14Col6${status.count }">
			<input type="hidden" name="toExcelRow14Col7" id="toExcelRow14Col7${status.count }">
			<input type="hidden" name="toExcelRow14Col9" id="toExcelRow14Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }2" value="${obj2.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow14Col5" value="${obj2.FA_TRANSPORTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }3" value="${obj3.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow14Col8" value="${obj3.FA_TRANSPORTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			其他固定资产
			<input type="hidden" name="toExcelRow15Col1" value="其他固定资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }1" value="${obj1.FA_OTHER}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow15Col2" value="${obj1.FA_OTHER}">
			
			<input type="hidden" name="toExcelRow15Col3" id="toExcelRow15Col3${status.count }">
			<input type="hidden" name="toExcelRow15Col4" id="toExcelRow15Col4${status.count }">
			<input type="hidden" name="toExcelRow15Col6" id="toExcelRow15Col6${status.count }">
			<input type="hidden" name="toExcelRow15Col7" id="toExcelRow15Col7${status.count }">
			<input type="hidden" name="toExcelRow15Col9" id="toExcelRow15Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }2" value="${obj2.FA_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow15Col5" value="${obj2.FA_OTHER}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }3" value="${obj3.FA_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow15Col8" value="${obj3.FA_OTHER}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			减:累计折旧
			<input type="hidden" name="toExcelRow16Col1" value="减:累计折旧">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }1" value="${obj1.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow16Col2" value="${obj1.FA_DEPRECIATIONS}">
			
			<input type="hidden" name="toExcelRow16Col3" id="toExcelRow16Col3${status.count }">
			<input type="hidden" name="toExcelRow16Col4" id="toExcelRow16Col4${status.count }">
			<input type="hidden" name="toExcelRow16Col6" id="toExcelRow16Col6${status.count }">
			<input type="hidden" name="toExcelRow16Col7" id="toExcelRow16Col7${status.count }">
			<input type="hidden" name="toExcelRow16Col9" id="toExcelRow16Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }2" value="${obj2.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow16Col5" value="${obj2.FA_DEPRECIATIONS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }3" value="${obj3.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow16Col8" value="${obj3.FA_DEPRECIATIONS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			未完工程及预付设备款
			<input type="hidden" name="toExcelRow17Col1" value="未完工程及预付设备款">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }1" value="${obj1.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow17Col2" value="${obj1.FA_INCOMPLETED_PROJECTS}">
			
			<input type="hidden" name="toExcelRow17Col3" id="toExcelRow17Col3${status.count }">
			<input type="hidden" name="toExcelRow17Col4" id="toExcelRow17Col4${status.count }">
			<input type="hidden" name="toExcelRow17Col6" id="toExcelRow17Col6${status.count }">
			<input type="hidden" name="toExcelRow17Col7" id="toExcelRow17Col7${status.count }">
			<input type="hidden" name="toExcelRow17Col9" id="toExcelRow17Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }2" value="${obj2.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow17Col5" value="${obj2.FA_INCOMPLETED_PROJECTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }3" value="${obj3.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow17Col8" value="${obj3.FA_INCOMPLETED_PROJECTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size: 14px;">固定资产</font>
			<input type="hidden" name="toExcelRow18Col1" value="固定资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow18Col2" id="toExcelRow18Col2${status.count }">
			
			<input type="hidden" name="toExcelRow18Col3" id="toExcelRow18Col3${status.count }">
			<input type="hidden" name="toExcelRow18Col4" id="toExcelRow18Col4${status.count }">
			<input type="hidden" name="toExcelRow18Col6" id="toExcelRow18Col6${status.count }">
			<input type="hidden" name="toExcelRow18Col7" id="toExcelRow18Col7${status.count }">
			<input type="hidden" name="toExcelRow18Col9" id="toExcelRow18Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow18Col5" id="toExcelRow18Col5${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow18Col8" id="toExcelRow18Col8${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			长期投资
			<input type="hidden" name="toExcelRow19Col1" value="长期投资">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }1" value="${obj1.LANG_INVEST}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow19Col2" value="${obj1.LANG_INVEST }">
			
			<input type="hidden" name="toExcelRow19Col3" id="toExcelRow19Col3${status.count }">
			<input type="hidden" name="toExcelRow19Col4" id="toExcelRow19Col4${status.count }">
			<input type="hidden" name="toExcelRow19Col6" id="toExcelRow19Col6${status.count }">
			<input type="hidden" name="toExcelRow19Col7" id="toExcelRow19Col7${status.count }">
			<input type="hidden" name="toExcelRow19Col9" id="toExcelRow19Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }2" value="${obj2.LANG_INVEST}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow19Col5" value="${obj2.LANG_INVEST }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }3" value="${obj3.LANG_INVEST}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow19Col8" value="${obj3.LANG_INVEST }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			其他资产
			<input type="hidden" name="toExcelRow20Col1" value="其他资产">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }1" value="${obj1.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow20Col2" value="${obj1.OTHER_ASSETS }">
			
			<input type="hidden" name="toExcelRow20Col3" id="toExcelRow20Col3${status.count }">
			<input type="hidden" name="toExcelRow20Col4" id="toExcelRow20Col4${status.count }">
			<input type="hidden" name="toExcelRow20Col6" id="toExcelRow20Col6${status.count }">
			<input type="hidden" name="toExcelRow20Col7" id="toExcelRow20Col7${status.count }">
			<input type="hidden" name="toExcelRow20Col9" id="toExcelRow20Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }2" value="${obj2.OTHER_ASSETS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow20Col5" value="${obj2.OTHER_ASSETS }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }3" value="${obj3.OTHER_ASSETS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow20Col8" value="${obj3.OTHER_ASSETS }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue"><strong style="font-size: 14px;">资产总额</strong></font>
			<input type="hidden" name="toExcelRow21Col1" value="资产总额">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow21Col2" id="toExcelRow21Col2${status.count }">
			
			<input type="hidden" name="toExcelRow21Col3" id="toExcelRow21Col3${status.count }">
			<input type="hidden" name="toExcelRow21Col4" id="toExcelRow21Col4${status.count }">
			<input type="hidden" name="toExcelRow21Col6" id="toExcelRow21Col6${status.count }">
			<input type="hidden" name="toExcelRow21Col7" id="toExcelRow21Col7${status.count }">
			<input type="hidden" name="toExcelRow21Col9" id="toExcelRow21Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow21Col5" id="toExcelRow21Col5${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow21Col8" id="toExcelRow21Col8${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			短期借款
			<input type="hidden" name="toExcelRow22Col1" value="短期借款">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }1" value="${obj1.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow22Col2" value="${obj1.SD_SHORT_DEBT}">
			
			<input type="hidden" name="toExcelRow22Col3" id="toExcelRow22Col3${status.count }">
			<input type="hidden" name="toExcelRow22Col4" id="toExcelRow22Col4${status.count }">
			<input type="hidden" name="toExcelRow22Col6" id="toExcelRow22Col6${status.count }">
			<input type="hidden" name="toExcelRow22Col7" id="toExcelRow22Col7${status.count }">
			<input type="hidden" name="toExcelRow22Col9" id="toExcelRow22Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }2" value="${obj2.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow22Col5" value="${obj2.SD_SHORT_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }3" value="${obj3.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow22Col8" value="${obj3.SD_SHORT_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应付票据
			<input type="hidden" name="toExcelRow23Col1" value="应付票据">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }1" value="${obj1.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow23Col2" value="${obj1.SD_BILLS_SHOULD}">
			
			<input type="hidden" name="toExcelRow23Col3" id="toExcelRow23Col3${status.count }">
			<input type="hidden" name="toExcelRow23Col4" id="toExcelRow23Col4${status.count }">
			<input type="hidden" name="toExcelRow23Col6" id="toExcelRow23Col6${status.count }">
			<input type="hidden" name="toExcelRow23Col7" id="toExcelRow23Col7${status.count }">
			<input type="hidden" name="toExcelRow23Col9" id="toExcelRow23Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }2" value="${obj2.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow23Col5" value="${obj2.SD_BILLS_SHOULD}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }3" value="${obj3.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow23Col8" value="${obj3.SD_BILLS_SHOULD}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应付账款
			<input type="hidden" name="toExcelRow24Col1" value="应付账款">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }1" value="${obj1.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow24Col2" value="${obj1.SD_FUNDS_SHOULD}">
			
			<input type="hidden" name="toExcelRow24Col3" id="toExcelRow24Col3${status.count }">
			<input type="hidden" name="toExcelRow24Col4" id="toExcelRow24Col4${status.count }">
			<input type="hidden" name="toExcelRow24Col6" id="toExcelRow24Col6${status.count }">
			<input type="hidden" name="toExcelRow24Col7" id="toExcelRow24Col7${status.count }">
			<input type="hidden" name="toExcelRow24Col9" id="toExcelRow24Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }2" value="${obj2.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow24Col5" value="${obj2.SD_FUNDS_SHOULD}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }3" value="${obj3.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow24Col8" value="${obj3.SD_FUNDS_SHOULD}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他应付款
			<input type="hidden" name="toExcelRow25Col1" value="其他应付款">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }1" value="${obj1.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow25Col2" value="${obj1.SD_OTHER_PAY}">
			
			<input type="hidden" name="toExcelRow25Col3" id="toExcelRow25Col3${status.count }">
			<input type="hidden" name="toExcelRow25Col4" id="toExcelRow25Col4${status.count }">
			<input type="hidden" name="toExcelRow25Col6" id="toExcelRow25Col6${status.count }">
			<input type="hidden" name="toExcelRow25Col7" id="toExcelRow25Col7${status.count }">
			<input type="hidden" name="toExcelRow25Col9" id="toExcelRow25Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }2" value="${obj2.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow25Col5" value="${obj2.SD_OTHER_PAY}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }3" value="${obj3.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow25Col8" value="${obj3.SD_OTHER_PAY}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			股东往来
			<input type="hidden" name="toExcelRow26Col1" value="股东往来">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }1" value="${obj1.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow26Col2" value="${obj1.SD_SHAREHOLDERS}">
			
			<input type="hidden" name="toExcelRow26Col3" id="toExcelRow26Col3${status.count }">
			<input type="hidden" name="toExcelRow26Col4" id="toExcelRow26Col4${status.count }">
			<input type="hidden" name="toExcelRow26Col6" id="toExcelRow26Col6${status.count }">
			<input type="hidden" name="toExcelRow26Col7" id="toExcelRow26Col7${status.count }">
			<input type="hidden" name="toExcelRow26Col9" id="toExcelRow26Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }2" value="${obj2.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow26Col5" value="${obj2.SD_SHAREHOLDERS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }3" value="${obj3.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow26Col8" value="${obj3.SD_SHAREHOLDERS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			一年内到期之长期负债
			<input type="hidden" name="toExcelRow27Col1" value="一年内到期之长期负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }1" value="${obj1.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow27Col2" value="${obj1.SD_ONE_YEAR}">
			
			<input type="hidden" name="toExcelRow27Col3" id="toExcelRow27Col3${status.count }">
			<input type="hidden" name="toExcelRow27Col4" id="toExcelRow27Col4${status.count }">
			<input type="hidden" name="toExcelRow27Col6" id="toExcelRow27Col6${status.count }">
			<input type="hidden" name="toExcelRow27Col7" id="toExcelRow27Col7${status.count }">
			<input type="hidden" name="toExcelRow27Col9" id="toExcelRow27Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }2" value="${obj2.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow27Col5" value="${obj2.SD_ONE_YEAR}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }3" value="${obj3.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow27Col8" value="${obj3.SD_ONE_YEAR}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他流动负债
			<input type="hidden" name="toExcelRow28Col1" value="其他流动负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }1" value="${obj1.SD_OTHER}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow28Col2" value="${obj1.SD_OTHER}">
			
			<input type="hidden" name="toExcelRow28Col3" id="toExcelRow28Col3${status.count }">
			<input type="hidden" name="toExcelRow28Col4" id="toExcelRow28Col4${status.count }">
			<input type="hidden" name="toExcelRow28Col6" id="toExcelRow28Col6${status.count }">
			<input type="hidden" name="toExcelRow28Col7" id="toExcelRow28Col7${status.count }">
			<input type="hidden" name="toExcelRow28Col9" id="toExcelRow28Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }2" value="${obj2.SD_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow28Col5" value="${obj2.SD_OTHER}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }3" value="${obj3.SD_OTHER}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow28Col8" value="${obj3.SD_OTHER}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">流动负债</font>
			<input type="hidden" name="toExcelRow29Col1" value="流动负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow29Col2" id="toExcelRow29Col2${status.count }">
			<input type="hidden" name="toExcelRow29Col3" id="toExcelRow29Col3${status.count }">
			<input type="hidden" name="toExcelRow29Col4" id="toExcelRow29Col4${status.count }">
			<input type="hidden" name="toExcelRow29Col5" id="toExcelRow29Col5${status.count }">
			<input type="hidden" name="toExcelRow29Col6" id="toExcelRow29Col6${status.count }">
			<input type="hidden" name="toExcelRow29Col7" id="toExcelRow29Col7${status.count }">
			<input type="hidden" name="toExcelRow29Col8" id="toExcelRow29Col8${status.count }">
			<input type="hidden" name="toExcelRow29Col9" id="toExcelRow29Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			长期借款
			<input type="hidden" name="toExcelRow30Col1" value="长期借款">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }1" value="${obj1.LANG_DEBT}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow30Col2" value="${obj1.LANG_DEBT}">
			
			<input type="hidden" name="toExcelRow30Col3" id="toExcelRow30Col3${status.count }">
			<input type="hidden" name="toExcelRow30Col4" id="toExcelRow30Col4${status.count }">
			<input type="hidden" name="toExcelRow30Col6" id="toExcelRow30Col6${status.count }">
			<input type="hidden" name="toExcelRow30Col7" id="toExcelRow30Col7${status.count }">
			<input type="hidden" name="toExcelRow30Col9" id="toExcelRow30Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }2" value="${obj2.LANG_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow30Col5" value="${obj2.LANG_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }3" value="${obj3.LANG_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow30Col8" value="${obj3.LANG_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他长期负债
			<input type="hidden" name="toExcelRow31Col1" value="其他长期负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }1" value="${obj1.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow31Col2" value="${obj1.OTHER_LONG_DEBT}">
			
			<input type="hidden" name="toExcelRow31Col3" id="toExcelRow31Col3${status.count }">
			<input type="hidden" name="toExcelRow31Col4" id="toExcelRow31Col4${status.count }">
			<input type="hidden" name="toExcelRow31Col6" id="toExcelRow31Col6${status.count }">
			<input type="hidden" name="toExcelRow31Col7" id="toExcelRow31Col7${status.count }">
			<input type="hidden" name="toExcelRow31Col9" id="toExcelRow31Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }2" value="${obj2.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow31Col5" value="${obj2.OTHER_LONG_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }3" value="${obj3.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow31Col8" value="${obj3.OTHER_LONG_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">长期负债</font>
			<input type="hidden" name="toExcelRow32Col1" value="长期负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow32Col2" id="toExcelRow32Col2${status.count }">
			<input type="hidden" name="toExcelRow32Col3" id="toExcelRow32Col3${status.count }">
			<input type="hidden" name="toExcelRow32Col4" id="toExcelRow32Col4${status.count }">
			<input type="hidden" name="toExcelRow32Col5" id="toExcelRow32Col5${status.count }">
			<input type="hidden" name="toExcelRow32Col6" id="toExcelRow32Col6${status.count }">
			<input type="hidden" name="toExcelRow32Col7" id="toExcelRow32Col7${status.count }">
			<input type="hidden" name="toExcelRow32Col8" id="toExcelRow32Col8${status.count }">
			<input type="hidden" name="toExcelRow32Col9" id="toExcelRow32Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他负债
			<input type="hidden" name="toExcelRow33Col1" value="其他负债">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }1" value="${obj1.OTHER_DEBT}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow33Col2" value="${obj1.OTHER_DEBT}">
			
			<input type="hidden" name="toExcelRow33Col3" id="toExcelRow33Col3${status.count }">
			<input type="hidden" name="toExcelRow33Col4" id="toExcelRow33Col4${status.count }">
			<input type="hidden" name="toExcelRow33Col6" id="toExcelRow33Col6${status.count }">
			<input type="hidden" name="toExcelRow33Col7" id="toExcelRow33Col7${status.count }">
			<input type="hidden" name="toExcelRow33Col9" id="toExcelRow33Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }2" value="${obj2.OTHER_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow33Col5" value="${obj2.OTHER_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }3" value="${obj3.OTHER_DEBT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow33Col8" value="${obj3.OTHER_DEBT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue"><strong>负债总额</strong></font>
			<input type="hidden" name="toExcelRow34Col1" value="负债总额">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow34Col2" id="toExcelRow34Col2${status.count }">
			<input type="hidden" name="toExcelRow34Col3" id="toExcelRow34Col3${status.count }">
			<input type="hidden" name="toExcelRow34Col4" id="toExcelRow34Col4${status.count }">
			<input type="hidden" name="toExcelRow34Col5" id="toExcelRow34Col5${status.count }">
			<input type="hidden" name="toExcelRow34Col6" id="toExcelRow34Col6${status.count }">
			<input type="hidden" name="toExcelRow34Col7" id="toExcelRow34Col7${status.count }">
			<input type="hidden" name="toExcelRow34Col8" id="toExcelRow34Col8${status.count }">
			<input type="hidden" name="toExcelRow34Col9" id="toExcelRow34Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			实收股本
			<input type="hidden" name="toExcelRow35Col1" value="实收股本">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }1" value="${obj1.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow35Col2" value="${obj1.SHARE_CAPITAL}">
			
			<input type="hidden" name="toExcelRow35Col3" id="toExcelRow35Col3${status.count }">
			<input type="hidden" name="toExcelRow35Col4" id="toExcelRow35Col4${status.count }">
			<input type="hidden" name="toExcelRow35Col6" id="toExcelRow35Col6${status.count }">
			<input type="hidden" name="toExcelRow35Col7" id="toExcelRow35Col7${status.count }">
			<input type="hidden" name="toExcelRow35Col9" id="toExcelRow35Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }2" value="${obj2.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow35Col5" value="${obj2.SHARE_CAPITAL}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }3" value="${obj3.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow35Col8" value="${obj3.SHARE_CAPITAL}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			资本公积
			<input type="hidden" name="toExcelRow36Col1" value="资本公积">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }1" value="${obj1.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow36Col2" value="${obj1.SURPLUS_CAPITAL}">
			
			<input type="hidden" name="toExcelRow36Col3" id="toExcelRow36Col3${status.count }">
			<input type="hidden" name="toExcelRow36Col4" id="toExcelRow36Col4${status.count }">
			<input type="hidden" name="toExcelRow36Col6" id="toExcelRow36Col6${status.count }">
			<input type="hidden" name="toExcelRow36Col7" id="toExcelRow36Col7${status.count }">
			<input type="hidden" name="toExcelRow36Col9" id="toExcelRow36Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }2" value="${obj2.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow36Col5" value="${obj2.SURPLUS_CAPITAL}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }3" value="${obj3.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow36Col8" value="${obj3.SURPLUS_CAPITAL}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			累积盈余
			<input type="hidden" name="toExcelRow37Col1" value="累积盈余">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }1" value="${obj1.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow37Col2" value="${obj1.SURPLUS_INCOME}">
			
			<input type="hidden" name="toExcelRow37Col3" id="toExcelRow37Col3${status.count }">
			<input type="hidden" name="toExcelRow37Col4" id="toExcelRow37Col4${status.count }">
			<input type="hidden" name="toExcelRow37Col6" id="toExcelRow37Col6${status.count }">
			<input type="hidden" name="toExcelRow37Col7" id="toExcelRow37Col7${status.count }">
			<input type="hidden" name="toExcelRow37Col9" id="toExcelRow37Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }2" value="${obj2.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow37Col5" value="${obj2.SURPLUS_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }3" value="${obj3.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow37Col8" value="${obj3.SURPLUS_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			本期损益
			<input type="hidden" name="toExcelRow38Col1" value="累积盈余">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }1" value="${obj1.THIS_LOSTS}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow38Col2" value="${obj1.THIS_LOSTS}">
			
			<input type="hidden" name="toExcelRow38Col3" id="toExcelRow38Col3${status.count }">
			<input type="hidden" name="toExcelRow38Col4" id="toExcelRow38Col4${status.count }">
			<input type="hidden" name="toExcelRow38Col6" id="toExcelRow38Col6${status.count }">
			<input type="hidden" name="toExcelRow38Col7" id="toExcelRow38Col7${status.count }">
			<input type="hidden" name="toExcelRow38Col9" id="toExcelRow38Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }2" value="${obj2.THIS_LOSTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow38Col5" value="${obj2.THIS_LOSTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }3" value="${obj3.THIS_LOSTS}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow38Col8" value="${obj3.THIS_LOSTS}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			调整项目
			<input type="hidden" name="toExcelRow39Col1" value="累积盈余">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }1" value="${obj1.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow39Col2" value="${obj1.PROJECT_CHANGED}">
			
			<input type="hidden" name="toExcelRow39Col3" id="toExcelRow39Col3${status.count }">
			<input type="hidden" name="toExcelRow39Col4" id="toExcelRow39Col4${status.count }">
			<input type="hidden" name="toExcelRow39Col6" id="toExcelRow39Col6${status.count }">
			<input type="hidden" name="toExcelRow39Col7" id="toExcelRow39Col7${status.count }">
			<input type="hidden" name="toExcelRow39Col9" id="toExcelRow39Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }2" value="${obj2.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow39Col5" value="${obj2.PROJECT_CHANGED}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }3" value="${obj3.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow39Col8" value="${obj3.PROJECT_CHANGED}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue"><strong>净值总额</strong></font>
			<input type="hidden" name="toExcelRow40Col1" value="净值总额">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow40Col2" id="toExcelRow40Col2${status.count }">
			<input type="hidden" name="toExcelRow40Col3" id="toExcelRow40Col3${status.count }">
			<input type="hidden" name="toExcelRow40Col4" id="toExcelRow40Col4${status.count }">
			<input type="hidden" name="toExcelRow40Col5" id="toExcelRow40Col5${status.count }">
			<input type="hidden" name="toExcelRow40Col6" id="toExcelRow40Col6${status.count }">
			<input type="hidden" name="toExcelRow40Col7" id="toExcelRow40Col7${status.count }">
			<input type="hidden" name="toExcelRow40Col8" id="toExcelRow40Col8${status.count }">
			<input type="hidden" name="toExcelRow40Col9" id="toExcelRow40Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
</table>  
