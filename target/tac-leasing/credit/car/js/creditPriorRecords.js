
//允许为负数
function positive2(field, name) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');
	if(value==0){
		 field.value = value; 
    }else if (!checkNumber(value)) {
        alert(name + '只能输入数字！');
        field.focus();
        return true;
    } else {
        if (value.substring(0,2) != '0.') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        return false;
    }
}

function strDateTime(str) 
      { 
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]); 
      }; 
function submitPriorRecords(){
	tabLength=document.getElementById("priorRecordsTab").rows.length;
	form=document.riorRecordsForm;
	if(tabLength==4){
		LEASE_CODE=form.LEASE_CODE;
		SALES_PRICE=form.SALES_PRICE;
		GATHERING_PRICE=form.GATHERING_PRICE;
		if(blank(LEASE_CODE,'供应商')
		   ||positive(SALES_PRICE,'销售金额')
		   ||positive(GATHERING_PRICE,'收款')){
		   	return false;
		   }
	}else if(tabLength>=5){
		LEASE_CODE=form.LEASE_CODE;
		SALES_PRICE=form.SALES_PRICE;
		GATHERING_PRICE=form.GATHERING_PRICE;
		for(i=0;i<LEASE_CODE.length;i++){
			if(blank(LEASE_CODE[i],'供应商')
		   ||positive(SALES_PRICE[i],'销售金额')
		   ||positive(GATHERING_PRICE[i],'收款')){
		   	return false;
		   }
		}
	}
	
	
	tabLength=document.getElementById("priorProjectTab111").rows.length;
	if(tabLength==3){
		PROJECT_NAME0=form.PROJECT_NAME0;
		if(blank(PROJECT_NAME0,'过往记录项目名称')){
		   	return false;
		   }
	}else if(tabLength>3){
		PROJECT_NAME0=form.PROJECT_NAME0;
		for(i=0;i<PROJECT_NAME0.length;i++){
			if(blank(PROJECT_NAME0[i],'过往记录项目名称')){
		   		return false;
		   }
		}
	}
//	
//	tabLength=document.getElementById("otherProjectsTab").rows.length; 
//	if(tabLength==3){
//		PROJECT_NAME2=form.PROJECT_NAME2;
//		if(blank(PROJECT_NAME2,'项目名称')){
//		   	return false;
//		   }
//	}else if(tabLength>3){
//		PROJECT_NAME2=form.PROJECT_NAME2;
//		for(i=0;i<PROJECT_NAME2.length;i++){
//			if(blank(PROJECT_NAME2[i],'项目名称')){
//		   		return false;
//		   }
//		}
//	}
	
//	PROJECT_NAME1=form.PROJECT_NAME1;
//	if(blank(PROJECT_NAME1,'项目名称')){
//		   return false;
//	}remove by ShenQi  移动到租赁方案中
	//PROJECT_CONTENT3=form.PROJECT_CONTENT3;
	//if(blank(PROJECT_CONTENT3,'评审意见')){
	//	   return false;
	//}
	FBAREA=form.FBAREA;
	if(positive(FBAREA,'厂房面积')){
		   	return false;
	}
	MONTHCOST=form.MONTHCOST;
	if(positive(MONTHCOST,'厂房每月租金')){
		   	return false;
	}
	BECELLINCOME=form.BECELLINCOME;
	if(positive(BECELLINCOME,'销货收入（交机前）')){
		   	return false;
	}
	AFCELLINCOME=form.AFCELLINCOME;
	if(positive(AFCELLINCOME,'销货收入（交机后）')){
		   	return false;
	}
	CELLINCOMEPER=form.CELLINCOMEPER;
	if(positive(CELLINCOMEPER,'成长比重（销货收入）')){
		   	return false;
	}
	BEOTHERINCOME=form.BEOTHERINCOME;
	if(positive(BEOTHERINCOME,'其它收入（交机前）')){
		   	return false;
	}
	AFOTHERINCOME=form.AFOTHERINCOME;
	if(positive(AFOTHERINCOME,'其它收入（交机后）')){
		   	return false;
	}
	OTHERINCOMEPER=form.OTHERINCOMEPER;
	if(positive(OTHERINCOMEPER,'成长比重（其它收入）')){
		   	return false;
	}
	BERESOURCECOST=form.BERESOURCECOST;
	if(positive(BERESOURCECOST,'原物料成本（交机前）')){
		   	return false;
	}
	AFRESOURCECOST=form.AFRESOURCECOST;
	if(positive(AFRESOURCECOST,'原物料成本（交机后）')){
		   	return false;
	}
	RESOURCECOSTPER=form.RESOURCECOSTPER;
	if(positive(RESOURCECOSTPER,'成长比重（原物料成本）')){
		   	return false;
	}
	BEFBMONTHPRICE=form.BEFBMONTHPRICE;
	if(positive(BEFBMONTHPRICE,'厂房租金（交机前）')){
		   	return false;
	}
	AFFBMONTHPRICE=form.AFFBMONTHPRICE;
	if(positive(AFFBMONTHPRICE,'厂房租金（交机后）')){
		   	return false;
	}
	FBMONTHPRICEPER=form.FBMONTHPRICEPER;
	if(positive(FBMONTHPRICEPER,'成长比重（厂房租金）')){
		   	return false;
	}
	
	BESALARY=form.BESALARY;
	if(positive(BESALARY,'薪酬（交机前）')){
		   	return false;
	}
	AFSALARY=form.AFSALARY;
	if(positive(AFSALARY,'薪酬（交机后）')){
		   	return false;
	}
	SALARYPER=form.SALARYPER;
	if(positive(SALARYPER,'成长比重（薪酬）')){
		   	return false;
	}
	
	BEWATERELEC=form.BEWATERELEC;
	if(positive(BEWATERELEC,'水电（交机前）')){
		   	return false;
	}
	AFWATERELEC=form.AFWATERELEC;
	if(positive(AFWATERELEC,'水电（交机后）')){
		   	return false;
	}
	WATERELECPER=form.WATERELECPER;
	if(positive(WATERELECPER,'成长比重（水电）')){
		   	return false;
	}
	
	BEBEFORECOST=form.BEBEFORECOST;
	if(positive(BEBEFORECOST,'透支（交机前）')){
		   	return false;
	}
	AFBEFORECOST=form.AFBEFORECOST;
	if(positive(AFBEFORECOST,'透支（交机后）')){
		   	return false;
	}
	BEFORECOSTPER=form.BEFORECOSTPER;
	if(positive(BEFORECOSTPER,'成长比重（透支）')){
		   	return false;
	}
	
	BETAXMON=form.BETAXMON;
	if(positive(BETAXMON,'税金（交机前）')){
		   	return false;
	}
	AFTAXMON=form.AFTAXMON;
	if(positive(AFTAXMON,'税金（交机后）')){
		   	return false;
	}
	TAXMONPER=form.TAXMONPER;
	if(positive(TAXMONPER,'成长比重（税金）')){
		   	return false;
	}
	
	BEOTHERBANKLOAN=form.BEOTHERBANKLOAN;
	if(positive(BEOTHERBANKLOAN,'其他银行借款（交机前）')){
		   	return false;
	}
	AFOTHERBANKLOAN=form.AFOTHERBANKLOAN;
	if(positive(AFOTHERBANKLOAN,'其他银行借款（交机后）')){
		   	return false;
	}
	OTHERBANKLOANPER=form.OTHERBANKLOANPER;
	if(positive(OTHERBANKLOANPER,'成长比重（其他银行借款）')){
		   	return false;
	}
	
	BEBANKLOAN=form.BEBANKLOAN;
	if(positive(BEBANKLOAN,'银行借款（交机前）')){
		   	return false;
	}
	AFBANKLOAN=form.AFBANKLOAN;
	if(positive(AFBANKLOAN,'银行借款（交机后）')){
		   	return false;
	}
	BANKLOANPER=form.BANKLOANPER;
	if(positive(BANKLOANPER,'成长比重（银行借款）')){
		   	return false;
	}
	
	BETHISRENT=form.BETHISRENT;
	if(positive(BETHISRENT,'本期租贷款（交机前）')){
		   	return false;
	}
	AFTHISRENT=form.AFTHISRENT;
	if(positive(AFTHISRENT,'本期租贷款（交机后）')){
		   	return false;
	}
	THISRENTPER=form.THISRENTPER;
	if(positive(THISRENTPER,'成长比重（本期租贷款）')){
		   	return false;
	}
	
	BESUM=form.BESUM;
	if(positive(BESUM,'结余（交机前）')){
		   	return false;
	}
	AFSUM=form.AFSUM;
	if(positive(AFSUM,'结余（交机后）')){
		   	return false;
	}
	SUMPER=form.SUMPER;
	if(positive(SUMPER,'结余（本期租贷款）')){
		   	return false;
	}
	huequptabLength=document.getElementById("priorProjectEquipment").rows.length; 
	if(huequptabLength==4){
		EQUP_NAME2=form.sequipmentname;
		if(blank(EQUP_NAME2,'设备名称')){
		   	return false;
		   }
		EQUP_NUM=form.sequipmentnum;
		if(positive(EQUP_NUM,'设备数量')){
		   	return false;
		}
//		EQUP_DATE=form.sequipmentdate;
//		for(i=0;i<EQUP_DATE.length;i++){
//			if (!(strDateTime(EQUP_DATE[i].value))) {
//				alert("请将购入日期格式填写为 2008-08-08的格式！");
//				return  false;
//			}
//		}
		EQUP_BUYMON=form.sequipmentmoney;
		if(positive(EQUP_BUYMON,'设备购入价格')){
		   	return false;
		}
		 
	}else if(huequptabLength>4){
		EQUP_NAME2=form.sequipmentname;
		for(i=0;i<EQUP_NAME2.length;i++){
			if(blank(EQUP_NAME2[i],'设备名称')){
		   		return false;
		   }
		}
		
		EQUP_NUM=form.sequipmentnum;
		for(i=0;i<EQUP_NUM.length;i++){
			if(positive(EQUP_NUM[i],'设备数量')){
		   		return false;
		   }
		}
//		EQUP_DATE=form.sequipmentdate;
//		for(i=0;i<EQUP_DATE.length;i++){
//			if (!(strDateTime(EQUP_DATE[i].value))) {
//				alert("请将购入日期格式填写为 2008-08-08的格式！");
//				return  false;
//			}
//		}
		

		EQUP_BUYMON=form.sequipmentmoney;
		for(i=0;i<EQUP_BUYMON.length;i++){
			if(positive(EQUP_BUYMON[i],'设备购入价格')){
		   		return false;
		   }
		}
		
	}
	
	//往来客户废除 add by ShenQi 2012-7-12
	cctabLength=document.getElementById("table_ContactCoustomer").rows.length;
	if(cctabLength==4){
		CC_NAME=form.cc_name;
		if(blank(CC_NAME,'厂商名称')){
		   	return false;
		   }
		CC_MONEY=form.cc_money;
		if(positive(CC_MONEY,'月往来金额')){
		   	return false;
		}
		CC_PERCENT=form.cc_percent;
		if(positive(CC_PERCENT,'比重')){
		   	return false;
		}
	}
	if(cctabLength>4){
		CC_NAME=form.cc_name;
		for(i=0;i<CC_NAME.length;i++){
			if(blank(CC_NAME[i],'厂商名称')){
		   		return false;
		   }
		}
		CC_MONEY=form.cc_money;
		for(i=0;i<CC_MONEY.length;i++){
			if(positive(CC_MONEY[i],'月往来金额')){
		   		return false;
		   }
		}
			CC_PERCENT=form.cc_percent;
			for(i=0;i<CC_PERCENT.length;i++){			
				if(positive(CC_PERCENT[i],'比重')){
			   		return false;
			   }
			}
	}
	

	hubuyfbtableLength=document.getElementById("priorProjectBuyFactory").rows.length; 
	if(hubuyfbtableLength==4){
		BUYFACTORYNAMEs=form.BUYFACTORYNAME;
		if(blank(BUYFACTORYNAMEs,'进货厂商名称')){
		   	return false;
		   }
		BUYMONTHINGOPRICEs=form.BUYMONTHINGOPRICE;
		if(positive(BUYMONTHINGOPRICEs,'进货厂商月往来金额')){
		   	return false;
		}
		BUYPERCENTGRAVEs=form.BUYPERCENTGRAVE;
		if(positive(BUYPERCENTGRAVEs,'进货厂商比重')){
		   	return false;
		}
		 
	}else if(hubuyfbtableLength>4){
		BUYFACTORYNAMEs=form.BUYFACTORYNAME;
		for(i=0;i<BUYFACTORYNAMEs.length;i++){
			if(blank(BUYFACTORYNAMEs[i],'进货厂商名称')){
		   		return false;
		   }
		}
		
		BUYMONTHINGOPRICEs=form.BUYMONTHINGOPRICE;
		for(i=0;i<BUYMONTHINGOPRICEs.length;i++){
			if(positive(BUYMONTHINGOPRICEs[i],'进货厂商月往来金额')){
		   		return false;
		   }
		}
		BUYPERCENTGRAVEs=form.BUYPERCENTGRAVE;
		for(i=0;i<BUYPERCENTGRAVEs.length;i++){
			if(positive(BUYPERCENTGRAVEs[i],'进货厂商比重')){
		   		return false;
		   }
		}
		
	}
	
	
	//hucellfbtableLength=document.getElementById("priorProjectCellFactory").rows.length; 
	//INPERCENTGRAVEs=form.INPERCENTGRAVE;
	//if(positive(INPERCENTGRAVEs,'内销比重')){
	//	   	return false;
	//}
	//OUTPERCENTGRAVEs=form.OUTPERCENTGRAVE;
	//if(positive(OUTPERCENTGRAVEs,'外销比重')){
	//	   	return false;
	//} 
	//if(hucellfbtableLength==3){
	//	CELLFACTORYNAMEs=form.CELLFACTORYNAME;
	//	if(blank(CELLFACTORYNAMEs,'销货厂商名称')){
	//	   	return false;
	//	   }
	//	CELLMONTHINGOPRICEs=form.CELLMONTHINGOPRICE;
	//	if(positive(CELLMONTHINGOPRICEs,'销货厂商月往来金额')){
	//	   	return false;
	//	}
	//	CELLPERCENTGRAVEs=form.CELLPERCENTGRAVE;
	//	if(positive(CELLPERCENTGRAVEs,'销货厂商比重')){
	//	   	return false;
	//	}
		
		 
		
	//}else if(hucellfbtableLength>3){
	//	CELLFACTORYNAMEs=form.CELLFACTORYNAME;
	//	for(i=0;i<CELLFACTORYNAMEs.length;i++){
	//		if(blank(CELLFACTORYNAMEs[i],'销货厂商名称')){
	//	   		return false;
	//	   }
	//	}
	//	
	//	CELLMONTHINGOPRICEs=form.CELLMONTHINGOPRICE;
	//	for(i=0;i<CELLMONTHINGOPRICEs.length;i++){
	//		if(positive(CELLMONTHINGOPRICEs[i],'销货厂商月往来金额')){
	//	   		return false;
	//	   }
	//	}
	//	CELLPERCENTGRAVEs=form.CELLPERCENTGRAVE;
	//	for(i=0;i<CELLPERCENTGRAVEs.length;i++){
	//		if(positive(CELLPERCENTGRAVEs[i],'销货厂商比重')){
	//	   		return false;
	//	   }
	//	}
		
		
	//}
	
	hucheckbilltableLength=document.getElementById("priorProjectBankCheckBill").rows.length; 
	if(hucheckbilltableLength>2&&hucheckbilltableLength<=10){
		BANKCUSTNAMEs=form.BANKCUSTNAME;
		if(blank(BANKCUSTNAMEs,'户名（银行对账单）')){
		   	return false;
		   }
		CHECKMONTHONEs=form.CHECKMONTHONE;
		if(positive(CHECKMONTHONEs,'期间（月份）')){
		   	return false;
		}
		CHECKMONTHTWOs=form.CHECKMONTHTWO;
		if(positive(CHECKMONTHTWOs,'期间（月份）')){
		   	return false;
		}
		CHECKMONTHTHREEs=form.CHECKMONTHTHREE;
		if(positive(CHECKMONTHTHREEs,'期间（月份）')){
		   	return false;
		}
		CHECKMONTHFOURs=form.CHECKMONTHFOUR;
		if(positive(CHECKMONTHFOURs,'期间（月份）')){
		   	return false;
		}
		CHECKMONTHFIVEs=form.CHECKMONTHFIVE;
		if(positive(CHECKMONTHFIVEs,'期间（月份）')){
		   	return false;
		}
		CHECKMONTHSIXs=form.CHECKMONTHSIX;
		if(positive(CHECKMONTHSIXs,'期间（月份）')){
		   	return false;
		}
		
		LASTSUMONEs=form.LASTSUMONE;
		if(positive2(LASTSUMONEs,'上期结余')){
		   	return false;
		}
		LASTSUMTWOs=form.LASTSUMTWO;
		if(positive2(LASTSUMTWOs,'上期结余')){
		   	return false;
		}
		LASTSUMTHREEs=form.LASTSUMTHREE;
		if(positive2(LASTSUMTHREEs,'上期结余')){
		   	return false;
		}
		LASTSUMFOURs=form.LASTSUMFOUR;
		if(positive2(LASTSUMFOURs,'上期结余')){
		   	return false;
		}
		LASTSUMFIVEs=form.LASTSUMFIVE;
		if(positive2(LASTSUMFIVEs,'上期结余')){
		   	return false;
		}
		LASTSUMSIXs=form.LASTSUMSIX;
		if(positive2(LASTSUMSIXs,'上期结余')){
		   	return false;
		}
		
		MONTHINCOMEONEs=form.MONTHINCOMEONE;
		if(positive2(MONTHINCOMEONEs,'每月收入')){
		   	return false;
		}
		MONTHINCOMETWOs=form.MONTHINCOMETWO;
		if(positive2(MONTHINCOMETWOs,'每月收入')){
		   	return false;
		}
		MONTHINCOMETHREEs=form.MONTHINCOMETHREE;
		if(positive2(MONTHINCOMETHREEs,'每月收入')){
		   	return false;
		}
		MONTHINCOMEFOURs=form.MONTHINCOMEFOUR;
		if(positive2(MONTHINCOMEFOURs,'每月收入')){
		   	return false;
		}
		MONTHINCOMEFIVEs=form.MONTHINCOMEFIVE;
		if(positive2(MONTHINCOMEFIVEs,'每月收入')){
		   	return false;
		}
		MONTHINCOMESIXs=form.MONTHINCOMESIX;
		if(positive2(MONTHINCOMESIXs,'每月收入')){
		   	return false;
		}
		
		CHECKMONTHCOSTONEs=form.CHECKMONTHCOSTONE;
		if(positive2(CHECKMONTHCOSTONEs,'每月支出')){
		   	return false;
		}
		CHECKMONTHCOSTTWOs=form.CHECKMONTHCOSTTWO;
		if(positive2(CHECKMONTHCOSTTWOs,'每月支出')){
		   	return false;
		}
		CHECKMONTHCOSTTHREEs=form.CHECKMONTHCOSTTHREE;
		if(positive2(CHECKMONTHCOSTTHREEs,'每月支出')){
		   	return false;
		}
		CHECKMONTHCOSTFOURs=form.CHECKMONTHCOSTFOUR;
		if(positive2(CHECKMONTHCOSTFOURs,'每月支出')){
		   	return false;
		}
		CHECKMONTHCOSTFIVEs=form.CHECKMONTHCOSTFIVE;
		if(positive2(CHECKMONTHCOSTFIVEs,'每月支出')){
		   	return false;
		}
		CHECKMONTHCOSTSIXs=form.CHECKMONTHCOSTSIX;
		if(positive2(CHECKMONTHCOSTSIXs,'每月支出')){
		   	return false;
		}
		
		THISSUMONEs=form.THISSUMONE;
		if(positive2(THISSUMONEs,'本期结余')){
		   	return false;
		}
		THISSUMTWOs=form.THISSUMTWO;
		if(positive2(THISSUMTWOs,'本期结余')){
		   	return false;
		}
		THISSUMTHREEs=form.THISSUMTHREE;
		if(positive2(THISSUMTHREEs,'本期结余')){
		   	return false;
		}
		THISSUMFOURs=form.THISSUMFOUR;
		if(positive2(THISSUMFOURs,'本期结余')){
		   	return false;
		}
		THISSUMFIVEs=form.THISSUMFIVE;
		if(positive2(THISSUMFIVEs,'本期结余')){
		   	return false;
		}
		THISSUMSIXs=form.THISSUMSIX;
		if(positive2(THISSUMSIXs,'本期结余')){
		   	return false;
		}
		
		
		MONEYFLOWINONEs=form.MONEYFLOWINONE;
		if(positive2(MONEYFLOWINONEs,'现金流入')){
		   	return false;
		}
		MONEYFLOWINTWOs=form.MONEYFLOWINTWO;
		if(positive2(MONEYFLOWINTWOs,'现金流入')){
		   	return false;
		}
		MONEYFLOWINTHREEs=form.MONEYFLOWINTHREE;
		if(positive2(MONEYFLOWINTHREEs,'现金流入')){
		   	return false;
		}
		MONEYFLOWINFOURs=form.MONEYFLOWINFOUR;
		if(positive2(MONEYFLOWINFOURs,'现金流入')){
		   	return false;
		}
		MONEYFLOWINFIVEs=form.MONEYFLOWINFIVE;
		if(positive2(MONEYFLOWINFIVEs,'现金流入')){
		   	return false;
		}
		MONEYFLOWINSIXs=form.MONEYFLOWINSIX;
		if(positive2(MONEYFLOWINSIXs,'现金流入')){
		   	return false;
		}
		

		
		
	}else if(hucheckbilltableLength>10){
		BANKCUSTNAMEs=form.BANKCUSTNAME;
		for(i=0;i<BANKCUSTNAMEs.length;i++){
			if(blank(BANKCUSTNAMEs[i],'户名（银行对账单）')){
		   		return false;
		   }
		}
		CHECKMONTHONEs=form.CHECKMONTHONE;
		for(i=0;i<CHECKMONTHONEs.length;i++){
			if(positive(CHECKMONTHONEs[i],'期间（月份）')){
		   		return false;
		   }
		}
		CHECKMONTHTWOs=form.CHECKMONTHTWO;
		for(i=0;i<CHECKMONTHTWOs.length;i++){
			if(positive(CHECKMONTHTWOs[i],'期间（月份）')){
		   		return false;
		   }
		}
		CHECKMONTHTHREEs=form.CHECKMONTHTHREE;
		for(i=0;i<CHECKMONTHTHREEs.length;i++){
			if(positive(CHECKMONTHTHREEs[i],'期间（月份）')){
		   		return false;
		   }
		}
		CHECKMONTHFOURs=form.CHECKMONTHFOUR;
		for(i=0;i<CHECKMONTHFOURs.length;i++){
			if(positive(CHECKMONTHFOURs[i],'期间（月份）')){
		   		return false;
		   }
		}
		CHECKMONTHFIVEs=form.CHECKMONTHFIVE;
		for(i=0;i<CHECKMONTHFIVEs.length;i++){
			if(positive(CHECKMONTHFIVEs[i],'期间（月份）')){
		   		return false;
		   }
		}
		CHECKMONTHSIXs=form.CHECKMONTHSIX;
		for(i=0;i<CHECKMONTHSIXs.length;i++){
			if(positive(CHECKMONTHSIXs[i],'期间（月份）')){
		   		return false;
		   }
		}
	//	
		LASTSUMONEs=form.LASTSUMONE;
		for(i=0;i<LASTSUMONEs.length;i++){
			if(positive2(LASTSUMONEs[i],'上期结余')){
		   		return false;
		   }
		}
		LASTSUMTWOs=form.LASTSUMTWO;
		for(i=0;i<LASTSUMTWOs.length;i++){
			if(positive2(LASTSUMTWOs[i],'上期结余')){
		   		return false;
		   }
		}
		LASTSUMTHREEs=form.LASTSUMTHREE;
		for(i=0;i<LASTSUMTHREEs.length;i++){
			if(positive2(LASTSUMTHREEs[i],'上期结余')){
		   		return false;
		   }
		}
		LASTSUMFOURs=form.LASTSUMFOUR;
		for(i=0;i<LASTSUMFOURs.length;i++){
			if(positive2(LASTSUMFOURs[i],'上期结余')){
		   		return false;
		   }
		}
		LASTSUMFIVEs=form.LASTSUMFIVE;
		for(i=0;i<LASTSUMFIVEs.length;i++){
			if(positive2(LASTSUMFIVEs[i],'上期结余')){
		   		return false;
		   }
		}
		LASTSUMSIXs=form.LASTSUMSIX;
		for(i=0;i<LASTSUMSIXs.length;i++){
			if(positive2(LASTSUMSIXs[i],'上期结余')){
		   		return false;
		   }
		}
	//	
		MONTHINCOMEONEs=form.MONTHINCOMEONE;
		for(i=0;i<MONTHINCOMEONEs.length;i++){
			if(positive2(MONTHINCOMEONEs[i],'每月收入')){
		   		return false;
		   }
		}
		MONTHINCOMETWOs=form.MONTHINCOMETWO;
		for(i=0;i<MONTHINCOMETWOs.length;i++){
			if(positive2(MONTHINCOMETWOs[i],'每月收入')){
		   		return false;
		   }
		}
		MONTHINCOMETHREEs=form.MONTHINCOMETHREE;
		for(i=0;i<MONTHINCOMETHREEs.length;i++){
			if(positive2(MONTHINCOMETHREEs[i],'每月收入')){
		   		return false;
		   }
		}
		MONTHINCOMEFOURs=form.MONTHINCOMEFOUR;
		for(i=0;i<MONTHINCOMEFOURs.length;i++){
			if(positive2(MONTHINCOMEFOURs[i],'每月收入')){
		   		return false;
		   }
		}
		MONTHINCOMEFIVEs=form.MONTHINCOMEFIVE;
		for(i=0;i<MONTHINCOMEFIVEs.length;i++){
			if(positive2(MONTHINCOMEFIVEs[i],'每月收入')){
		   		return false;
		   }
		}
		MONTHINCOMESIXs=form.MONTHINCOMESIX;
		for(i=0;i<MONTHINCOMESIXs.length;i++){
			if(positive2(MONTHINCOMESIXs[i],'每月收入')){
		   		return false;
		   }
		}
		//	
		CHECKMONTHCOSTONEs=form.CHECKMONTHCOSTONE;
		for(i=0;i<CHECKMONTHCOSTONEs.length;i++){
			if(positive2(CHECKMONTHCOSTONEs[i],'每月支出')){
		   		return false;
		   }
		}
		CHECKMONTHCOSTTWOs=form.CHECKMONTHCOSTTWO;
		for(i=0;i<CHECKMONTHCOSTTWOs.length;i++){
			if(positive2(CHECKMONTHCOSTTWOs[i],'每月支出')){
		   		return false;
		   }
		}
		CHECKMONTHCOSTTHREEs=form.CHECKMONTHCOSTTHREE;
		for(i=0;i<CHECKMONTHCOSTTHREEs.length;i++){
			if(positive2(CHECKMONTHCOSTTHREEs[i],'每月支出')){
		   		return false;
		   }
		}
		CHECKMONTHCOSTFOURs=form.CHECKMONTHCOSTFOUR;
		for(i=0;i<CHECKMONTHCOSTFOURs.length;i++){
			if(positive2(CHECKMONTHCOSTFOURs[i],'每月支出')){
		   		return false;
		   }
		}
		CHECKMONTHCOSTFIVEs=form.CHECKMONTHCOSTFIVE;
		for(i=0;i<CHECKMONTHCOSTFIVEs.length;i++){
			if(positive2(CHECKMONTHCOSTFIVEs[i],'每月支出')){
		   		return false;
		   }
		}
		CHECKMONTHCOSTSIXs=form.CHECKMONTHCOSTSIX;
		for(i=0;i<CHECKMONTHCOSTSIXs.length;i++){
			if(positive2(CHECKMONTHCOSTSIXs[i],'每月支出')){
		   		return false;
		   }
		}
		
		//	
		THISSUMONEs=form.THISSUMONE;
		for(i=0;i<THISSUMONEs.length;i++){
			if(positive2(THISSUMONEs[i],'本期结余')){
		   		return false;
		   }
		}
		THISSUMTWOs=form.THISSUMTWO;
		for(i=0;i<THISSUMTWOs.length;i++){
			if(positive2(THISSUMTWOs[i],'本期结余')){
		   		return false;
		   }
		}
		THISSUMTHREEs=form.THISSUMTHREE;
		for(i=0;i<THISSUMTHREEs.length;i++){
			if(positive2(THISSUMTHREEs[i],'本期结余')){
		   		return false;
		   }
		}
		THISSUMFOURs=form.THISSUMFOUR;
		for(i=0;i<THISSUMFOURs.length;i++){
			if(positive2(THISSUMFOURs[i],'本期结余')){
		   		return false;
		   }
		}
		THISSUMFIVEs=form.THISSUMFIVE;
		for(i=0;i<THISSUMFIVEs.length;i++){
			if(positive2(THISSUMFIVEs[i],'本期结余')){
		   		return false;
		   }
		}
		THISSUMSIXs=form.THISSUMSIX;
		for(i=0;i<THISSUMSIXs.length;i++){
			if(positive2(THISSUMSIXs[i],'本期结余')){
		   		return false;
		   }
		}	
	
	//	
		MONEYFLOWINONEs=form.MONEYFLOWINONE;
		for(i=0;i<MONEYFLOWINONEs.length;i++){
			if(positive2(MONEYFLOWINONEs[i],'现金流入')){
		   		return false;
		   }
		}
		MONEYFLOWINTWOs=form.MONEYFLOWINTWO;
		for(i=0;i<MONEYFLOWINTWOs.length;i++){
			if(positive2(MONEYFLOWINTWOs[i],'现金流入')){
		   		return false;
		   }
		}
		MONEYFLOWINTHREEs=form.MONEYFLOWINTHREE;
		for(i=0;i<MONEYFLOWINTHREEs.length;i++){
			if(positive2(MONEYFLOWINTHREEs[i],'现金流入')){
		   		return false;
		   }
		}
		MONEYFLOWINFOURs=form.MONEYFLOWINFOUR;
		for(i=0;i<MONEYFLOWINFOURs.length;i++){
			if(positive2(MONEYFLOWINFOURs[i],'现金流入')){
		   		return false;
		   }
		}
		MONEYFLOWINFIVEs=form.MONEYFLOWINFIVE;
		for(i=0;i<MONEYFLOWINFIVEs.length;i++){
			if(positive2(MONEYFLOWINFIVEs[i],'现金流入')){
		   		return false;
		   }
		}
		MONEYFLOWINSIXs=form.MONEYFLOWINSIX;
		for(i=0;i<MONEYFLOWINSIXs.length;i++){
			if(positive2(MONEYFLOWINSIXs[i],'现金流入')){
		   		return false;
		   }
		}			
		
	}
	
	form.submit();
}

function addCreditPriorRecords(){
	var tab=document.getElementById("priorRecordsTab");
	var row=tab.insertRow(tab.rows.length);
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"checkbox\" name=\"priorRecords_check\" id=\"checkbox10\">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"text\" name=\"LEASE_CODE\" id=\"LEASE_CODE\" style=\"width: 120px;\">';
    cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"text\" name=\"EQUIPMENT_NAME\" id=\"EQUIPMENT_NAME\" style=\"width: 120px;\">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"text\" name=\"SALES_PRICE\" id=\"SALES_PRICE\" style=\"width: 80px;\">';
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.innerHTML='<input type=\"text\" name=\"GATHERING_PRICE\" id=\"GATHERING_PRICE\" style=\"width: 80px;\">';
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.align='center';
	cell.colSpan=2;
	cell.innerHTML='<input type=\"text\" name=\"INFO_REMARK\" id=\"INFO_REMARK\" style=\"width: 200px;\">';
}

function deleteCreditPriorRecords(){
	var check=document.getElementsByName("priorRecords_check");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var tr=check[i].parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}
 
function addpriorProjects(){
	var tab=document.getElementById("priorProjectTab111");
	var row=tab.insertRow(tab.rows.length);
	var sed=tab.rows.length 
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' <input type="checkbox\" name=\"priorProjects_check\" id=\"priorProjects_check\" value=\"'+sed+'\"> 名称：';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<input type=\"text\" name=\"PROJECT_NAME0\" id=\"PROJECT_NAME0\" style=\"width: 400px;\">';
	var row=tab.insertRow(tab.rows.length);
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' 内容：<input type=\'button\' value=\'加\' onClick=\'controllerTextArea("add", "PROJECT_CONTENT0'+sed+'");\' /><input type=\'button\' value=\'减\' onClick=\'controllerTextArea("del", "PROJECT_CONTENT0'+sed+'");\' />';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<textarea name=\"PROJECT_CONTENT0\" id=\"PROJECT_CONTENT0'+sed+'\" '
					+'style=\"width: 500px; height: 50px; font-size: 12px\" '
					+'class=\"txtk\"></textarea>';
}
function addpriorProjects2(){
	var tab=document.getElementById("priorProjectTab2");
	var row=tab.insertRow(tab.rows.length);
	var sed=tab.rows.length
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' <input type="checkbox\" name=\"priorProjects_check\" id=\"priorProjects_check\" value=\"'+sed+'\"> 名称：';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<input type=\"text\" name=\"PROJECT_NAME0\" id=\"PROJECT_NAME0\" style=\"width: 400px;\">';
	var row=tab.insertRow(tab.rows.length);
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' 内容：<input type=\'button\' value=\'加\' onClick=\'controllerTextArea("add", "PROJECT_CONTENT0'+sed+'");\' /><input type=\'button\' value=\'减\' onClick=\'controllerTextArea("del", "PROJECT_CONTENT0'+sed+'");\' />';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<textarea name=\"PROJECT_CONTENT0\" id=\"PROJECT_CONTENT0'+sed+'\" '
					+'style=\"width: 500px; height: 50px; font-size: 12px\" '
					+'class=\"txtk\"></textarea>';
}

function deletepriorProjects(){
	var check=document.getElementsByName("priorProjects_check");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var tr=check[i].parentNode.parentNode;
			var tr1=document.getElementById("PROJECT_CONTENT0"+check[i].value).parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			tr1.parentNode.removeChild(tr1);
			
		}
	}
} 

function addOtherProjectss(msg){
	$("#"+msg).append("<table width='100%' cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td  class='ui-widget-content jqgrow ui-row-ltr'><input type='checkbox' name='otherProjects_check'>项目名称：</td>"+
		"<td colspan='5' class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<input type='text' name='PROJECT_NAME2' style='width: 400px;'></td>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>内容：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><textarea name='PROJECT_CONTENT2' style='width: 500px; height: 50px; font-size: 12px'></textarea></td>"+
		"</tr></table>");
}
var i = 1
function addOtherProrerty(msg,length){
	if(length =="undefined" || length == null || length==''){
		length = 0 ;
	}
	
	i = i+ parseInt(length)
	$("#"+msg).append("<table width='100%' cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='checkbox' name='otherProrerty_check'>房产名称：</td>"+
//		"<td colspan='4' class='ui-widget-content jqgrow ui-row-ltr'>"+
//		"<input type='text' name='HOUSE_NAME' id='HOUSE_NAME'></td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='text' name='HOUSE_NAME' id='HOUSE_NAME'></td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>产权人：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>本人<input type='radio' onClick='$(\"#PROPERTY_OWNERA"+i+"\").val(this.value)'  checked='checked' value='1' name='PROPERTY_OWNERA"+i+"' id='PROPERTY_OWNER'>" +
		"  配偶<input type='radio' onClick='$(\"#PROPERTY_OWNERA"+i+"\").val(this.value)' value='2' name='PROPERTY_OWNERA"+i+"' id='PROPERTY_OWNER'>" +
		"  共同共有<input type='radio' onClick='$(\"#PROPERTY_OWNERA"+i+"\").val(this.value)' value='3' name='PROPERTY_OWNERA"+i+"' id='PROPERTY_OWNER'>" +
		"<input type='hidden' value='1' name='PROPERTY_OWNER' id='PROPERTY_OWNERA"+i+"'/>"+
		"</td>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>房产坐落地点：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='text' name='HOUSE_ADDRESS' id='HOUSE_ADDRESS'></td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>面积：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='text' name='HOUSE_AREA' id='HOUSE_AREA'></td>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>国土证/房产证：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='text' name='HOUSE_PROVE' id='HOUSE_PROVE'></td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>他项权利：</td>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'><input type='text' name='HOUSE_OTHERRIGHT' id='HOUSE_OTHERRIGHT'></td>"+
		"<tr class='ui-widget-content jqgrow ui-row-ltr'>"+
		"<td class='ui-widget-content jqgrow ui-row-ltr'>备注：</td>"+
		"<td colspan='4' class='ui-widget-content jqgrow ui-row-ltr'><textarea name='NOTES' id='NOTES' style='width: 500px; height: 50px; font-size: 12px' class='txtk'></textarea></td>"+
		"</tr></table>");
	i++ ;
}
function propertyOwner(){
	parent
	
}
function addOtherProjects(){
	var tab=document.getElementById("otherProjectsTab");
	var row=tab.insertRow(tab.rows.length);
	var sed=tab.rows.length
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' <input type="checkbox\" name=\"otherProjects_check\" id=\"otherProjects_check\" value=\"'+sed+'\"> 项目名称：';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<input type=\"text\" name=\"PROJECT_NAME2\" id=\"PROJECT_NAME2\" style=\"width: 400px;\">';
	var row=tab.insertRow(tab.rows.length);
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML=' 内容：<input type=\'button\' value=\'加\' onClick=\'controllerTextArea("add", "PROJECT_CONTENT2'+sed+'");\' /><input type=\'button\' value=\'减\' onClick=\'controllerTextArea("del", "PROJECT_CONTENT2'+sed+'");\' />';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.innerHTML='<textarea name=\"PROJECT_CONTENT2\" id=\"PROJECT_CONTENT2'+sed+'\" '
					+'style=\"width: 500px; height: 50px; font-size: 12px\" '
					+'class=\"txtk\"></textarea>';
}
function deleteOtherProjectss(){
	pcheck=document.getElementsByName("otherProjects_check");
	for(i=pcheck.length-1;i>=0;i--){
		if(pcheck[i].checked==true){
			var tr=pcheck[i].parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}

function deleteOtherProrerty(){
	pcheck=document.getElementsByName("otherProrerty_check");
	for(i=pcheck.length-1;i>=0;i--){
		if(pcheck[i].checked==true){
			var tr=pcheck[i].parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}
	}
}

function deleteOtherProjects(){
	var check=document.getElementsByName("otherProjects_check");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var tr=check[i].parentNode.parentNode;
			var tr1=document.getElementById("PROJECT_CONTENT2"+check[i].value).parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			tr1.parentNode.removeChild(tr1);
			
		}
	}
} 


function changeDEBTR(){
	//总资产
	TOTAL_ASSERTS=document.getElementsByName("TOTAL_ASSERTS");
	//总负债
	TOTAL_OWES=document.getElementsByName("TOTAL_OWES");
	//资产负债率
	DEBTR=document.getElementsByName("DEBTR");
	for(i=0;i<TOTAL_ASSERTS.length;i++){
		if(TOTAL_ASSERTS[i].value!=''&&TOTAL_OWES[i].value!=''){
			DEBTR[i].value=parseInt(parseFloat(TOTAL_OWES[i].value)*10000/parseFloat(TOTAL_ASSERTS[i].value))/10000;
		}
	}
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUE");
	//利润总额
	TOTAL_PROFIT=document.getElementsByName("TOTAL_PROFIT");
	//销售净利率
	PROFIT_MARGIN=document.getElementsByName("PROFIT_MARGIN");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&TOTAL_PROFIT[i].value!=''){
			PROFIT_MARGIN[i].value=parseInt(parseFloat(TOTAL_PROFIT[i].value)*10000/parseFloat(SALES_REVENUE[i].value))/10000;
		}
	}
	
	//销售收入
	SALES_REVENUE=document.getElementsByName("SALES_REVENUE");
	//销售成本
	COST_OF_MARKETING=document.getElementsByName("COST_OF_MARKETING");
	//毛利率
	TTM=document.getElementsByName("TTM");
	for(i=0;i<SALES_REVENUE.length;i++){
		if(SALES_REVENUE[i].value!=''&&COST_OF_MARKETING[i].value!=''){
			PROFIT_MARGIN[i].value=1-parseInt(parseFloat(COST_OF_MARKETING[i].value)*10000/parseFloat(SALES_REVENUE[i].value))/10000;
		}
	}
}


//截取月份数字
function getMon(){
	 var mon =document.getElementById("#PROJECT_NAME11").value ;
	var mmm=	 mon.split(8,1);
}


function controllerTextArea(value, sed) {
	var taNode = $("#"+sed);
	var height = taNode.height();
	if ("add"==value) {
		taNode.height(height*2);
	}
	if ("del"==value) {
		if (parseInt(height) > 46) {
			taNode.height(height/2);
		}
	}
}



function addpriorEquipments(){
	
	var tab=document.getElementById("priorProjectEquipment");
	var row=tab.insertRow(tab.rows.length-1);
	var sed=tab.rows.length-1;
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"35\" name=\"sequipmentname\" id=\"sequipmentname'+sed+'\" value=\"\" size=\"15\">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" onchange=\"getTotalMoney('+sed+');\" name=\"sequipmentnum\" id=\"sequipmentnum'+sed+'\" value=\"\" size=\"10\">';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"30\" name=\"sequipmentmaker\" id=\"sequipmentmaker'+sed+'\" value=\"\" size=\"10\">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"sequipmentdate\" id=\"sequipmentdate'+sed+'\" value=\"\"  style=\"text-align: center\" size=\"10\">';
	
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\"  onchange=\"getTotalMoney('+sed+');\" name=\"sequipmentmoney\" id=\"sequipmentmoney'+sed+'\" value=\"\" size=\"10\">';
	
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","left");
	cell.innerHTML='<input type=\"text\" name=\"sequipmentmoneyAll\" id=\"sequipmentmoneyAll'+sed+'\" value=\"\" size=\"10\" readonly=\"readonly\">';
	
	cell=row.insertCell(6);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"35\" name=\"sequipmentramark\" id=\"sequipmentramark'+sed+'\" value=\"\" size=\"10\">';
	cell=row.insertCell(7);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"checkbox\" name=\"sequipmentorder\" id=\"sequipmentorder'+sed+'\" value=\"\" size=\"8\">';
	
	//$("input[name='sequipmentdate']").datepicker($.datepicker.regional['zh-CN']);
}



function deletepriorEquipments(){
	var check=document.getElementsByName("sequipmentorder");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			
			var tr=check[i].parentNode.parentNode.parentNode;
			var trs=check[i].parentNode.parentNode;
			tr.removeChild(trs);
			
		}
	}
} 


function getAllequipment(){
	var checkall=document.getElementById("priorProjectsequipment");
	var check=document.getElementsByName("sequipmentorder");
	for(i=check.length-1;i>=0;i=i-1){
		if(checkall.checked==true){
			check[i].checked=true;
		}else if(checkall.checked==false){
			check[i].checked=false;
		}
	}
}

//计算总计
function getTotalMoney(){
	var sum=0;
	//$(".sequipmentmoney").each(function(){sum=sum+$(this).val()});
	var eqmts=document.getElementsByName("sequipmentmoney");
	var nums=document.getElementsByName("sequipmentnum");
	var all=document.getElementsByName("sequipmentmoneyAll");

	for(var i=0;i<eqmts.length;i++) {
	        eqmts[i].value=setzero(eqmts[i].value);
	        all[i].value=formatCurrency(eqmts[i].value*nums[i].value);
			sum+=eqmts[i].value*nums[i].value;
	}
	document.getElementById("sequipmentmoney_total_all").value = formatCurrency(sum);
}

//主要往来客户

function addpriorContactCustomer(){
	var tab=document.getElementById("table_ContactCoustomer");
	var row=tab.insertRow(tab.rows.length-1);
	var sed=tab.rows.length-1;
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_name\" id=\"cc_name'+sed+'\" value=\"\" size="35">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_address\" id=\"cc_address'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_type\" id=\"cc_type'+sed+'\" value=\"\" size="30">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" onchange=\"CCPerAndSum('+sed+')\" name=\"cc_money\" id=\"cc_money'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_percent\" id=\"cc_percent'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_condition\" id=\"cc_condition'+sed+'\" value=\"\" size="35">';
	
	cell=row.insertCell(6);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"cc_link_man\" id=\"cc_link_man'+sed+'\" value=\"\" size="10">';
	
	cell=row.insertCell(7);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"link_man_phone\" id=\"link_man_phone'+sed+'\" value=\"\" size="10">';
	
	cell=row.insertCell(8);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"checkbox\" name=\"cc_order\" id=\"cc_order'+sed+'\" value=\"\">';
	
}

//主要往来客户  比重计算,总计计算
function CCPerAndSum(count){
	var prices=document.getElementsByName("cc_money");
	var sum=0;
	for(var i=0;i<prices.length;i++){
		sum+=parseCurrency(setzero(prices[i].value));
	}
	
	for(var i=0;i<prices.length;i++){
		var perId=$(prices[i]).attr("id").replace('cc_money','cc_percent');
		
		var per=parseCurrency(setzero(prices[i].value))/sum;
		per = Math.round(per * 100000)
		per = per / 1000 ;
		$("#"+perId).val(per);

	}

	document.getElementById("cc_all").value = formatCurrency(sum);
}


function deletepriorContactCustomer(){
	var check=document.getElementsByName("cc_order");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			
			var tr=check[i].parentNode.parentNode.parentNode;
			var trs=check[i].parentNode.parentNode;
			tr.removeChild(trs);
			
		}
	}
} 


function getAllCantactCustomer(){
	var checkall=document.getElementById("priorProjectContactCustomer");
	var check=document.getElementsByName("cc_order");
	for(i=check.length-1;i>=0;i=i-1){
		if(checkall.checked==true){
			check[i].checked=true;
		}else if(checkall.checked==false){
			check[i].checked=false;
		}
	}
}

//进货厂商



function addpriorBuyFactorys(){
	var tab=document.getElementById("priorProjectBuyFactory");
	var row=tab.insertRow(tab.rows.length-1);
	var sed=tab.rows.length-1;
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"35\" name=\"BUYFACTORYNAME\" id=\"BUYFACTORYNAME'+sed+'\" value=\"\" size="15">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"30\" name=\"BUYTHINGKIND\" id=\"BUYTHINGKIND'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"15\" onchange=\"buyFactorysPerAndSum('+sed+')\" name=\"BUYMONTHINGOPRICE\" id=\"BUYMONTHINGOPRICE'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"15\" name=\"BUYPERCENTGRAVE\" id=\"BUYPERCENTGRAVE'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"35\" name=\"BUYPAYCONDITIONS\" id=\"BUYPAYCONDITIONS'+sed+'\" value=\"\">';
	
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"10\" name=\"BUY_LINK_MAN\" id=\"BUY_LINK_MAN'+sed+'\" value=\"\">';
	
	cell=row.insertCell(6);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"10\" name=\"BUY_LINK_MAN_PHONE\" id=\"BUY_LINK_MAN_PHONE'+sed+'\" value=\"\">';
	
	cell=row.insertCell(7);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"checkbox\" name=\"BUYFACTORYORDER\" id=\"BUYFACTORYORDER'+sed+'\" value=\"'+sed+'\" size="8">';
	
}

//进货厂商 比重计算,总计计算
function buyFactorysPerAndSum(count){
	var prices=document.getElementsByName("BUYMONTHINGOPRICE");
	var sum=0;
	for(var i=0;i<prices.length;i++){
		sum+=parseCurrency(setzero(prices[i].value));
	}
	
	for(var i=0;i<prices.length;i++){
		var perId=$(prices[i]).attr("id").replace('BUYMONTHINGOPRICE','BUYPERCENTGRAVE');
		
		var per=parseCurrency(setzero(prices[i].value))/sum;
		per = Math.round(per * 100000)
		per = per / 1000 ;
		$("#"+perId).val(per);

	}

	document.getElementById("BUYFACTORYOR_ALL").value = formatCurrency(sum);
}

function deletepriorBuyFactorys(){
	var check=document.getElementsByName("BUYFACTORYORDER");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var tr=check[i].parentNode.parentNode.parentNode;
			var trs=check[i].parentNode.parentNode;
			tr.removeChild(trs);
			
		}
	}
} 


function getAllBuyFactory(){
	var checkalls=document.getElementById("priorProjectBuyFactorys");
	var checks=document.getElementsByName("BUYFACTORYORDER");
	for(i=checks.length-1;i>=0;i=i-1){
		if(checkalls.checked==true){	
			checks[i].checked=true;	
		}else if(checkalls.checked==false){
			checks[i].checked=false;
		}
	}
}


function addpriorCellFactorys(){
	var tab=document.getElementById("priorProjectCellFactory");
	var row=tab.insertRow(tab.rows.length);
	var sed=tab.rows.length
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"30\" name=\"CELLFACTORYNAME\" id=\"CELLFACTORYNAME'+sed+'\" value=\"\" size="15">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"30\" name=\"CELLFACTORYADDR\" id=\"CELLFACTORYADDR'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"30\" name=\"CELLTHINGKIND\" id=\"CELLTHINGKIND'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"15\" name=\"CELLMONTHINGOPRICE\" id=\"CELLMONTHINGOPRICE'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"15\" name=\"CELLPERCENTGRAVE\" id=\"CELLPERCENTGRAVE'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" size=\"25\" name=\"CELLPAYCONDITIONS\" id=\"CELLPAYCONDITIONS'+sed+'\" value=\"\" size="8">';
	cell=row.insertCell(6);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"checkbox\" name=\"CELLFACTORYORDER\" id=\"CELLFACTORYORDER'+sed+'\" value=\"'+sed+'\" size="8">';
	
}



function deletepriorCellFactorys(){
	var check=document.getElementsByName("CELLFACTORYORDER");
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			
			var tr=check[i].parentNode.parentNode.parentNode;
			var trs=check[i].parentNode.parentNode;
			tr.removeChild(trs);
			
		}
	}
} 

function getAllCellFactory(){
	var checkalls=document.getElementById("priorProjectCellFactorys");
	var checks=document.getElementsByName("CELLFACTORYORDER");
	for(i=checks.length-1;i>=0;i=i-1){
		if(checkalls.checked==true){	
			checks[i].checked=true;	
		}else if(checkalls.checked==false){
			checks[i].checked=false;
		}
	}
}


function addpriorBankCheckBills(){
	var tab=document.getElementById("priorProjectBankCheckBill");
	var row=tab.insertRow(tab.rows.length);
	var sed=tab.rows.length
	var cell=row.insertCell(0);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"CHECKMONTH\" id=\"CHECKMONTH'+sed+'\" value=\"\" size="15">';
	cell=row.insertCell(1);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"LASTSUM\" id=\"LASTSUM'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(2);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"MONTHINCOME\" id=\"MONTHINCOME'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(3);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"CHECKMONTHCOST\" id=\"CHECKMONTHCOST'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(4);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"THISSUM\" id=\"THISSUM'+sed+'\" value=\"\" size="10">';
	cell=row.insertCell(5);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"text\" name=\"MONEYFLOWIN\" id=\"MONEYFLOWIN'+sed+'\" value=\"\" size="8">';
	cell=row.insertCell(6);
	cell.className = "ui-widget-content jqgrow ui-row-ltr";
	cell.setAttribute("align","center");
	cell.innerHTML='<input type=\"checkbox\" name=\"CHECKBILLORDER\" id=\"CHECKBILLORDER'+sed+'\" value=\"'+sed+'\" size="8">';
	

}



function deletepriorBankCheckBills(){
	var check=document.getElementsByName("CHECKBILLORDER");
	
	for(i=check.length-1;i>=0;i=i-1){
		if(check[i].checked==true){
			var rownum=parseInt(check[i].value);
			var tr=check[i].parentNode.parentNode;
			
			var checktd2=document.getElementById("BANKNAME"+rownum);
			var tr2=checktd2.parentNode.parentNode;
			
			var checktd3=document.getElementById("CHECKMONTHONE"+rownum);
			var tr3=checktd3.parentNode.parentNode;
			
			var checktd4=document.getElementById("LASTSUMONE"+rownum);
			var tr4=checktd4.parentNode.parentNode;
			
			var checktd5=document.getElementById("MONTHINCOMEONE"+rownum);

			var tr5=checktd5.parentNode.parentNode;
			
			var checktd6=document.getElementById("CHECKMONTHCOSTONE"+rownum);
			var tr6=checktd6.parentNode.parentNode;
			
			var checktd7=document.getElementById("THISSUMONE"+rownum);
			var tr7=checktd7.parentNode.parentNode;
			
			var checktd8=document.getElementById("MONEYFLOWINONE"+rownum);			
			var tr8=checktd8.parentNode.parentNode;
			
			var checktd9=document.getElementById("BANK_REMARK"+rownum);			
			var tr9=checktd9.parentNode.parentNode;
	
			
			tr.parentNode.removeChild(tr);
			
			tr2.parentNode.removeChild(tr2);
			tr3.parentNode.removeChild(tr3);
			tr4.parentNode.removeChild(tr4);
			tr5.parentNode.removeChild(tr5);
			tr6.parentNode.removeChild(tr6);
			tr7.parentNode.removeChild(tr7);
			tr8.parentNode.removeChild(tr8);
			tr9.parentNode.removeChild(tr9);
		}
	}
} 

function getAllBankCheckBill(){
	var checkalls=document.getElementById("priorProjectBankCheckBills");
	var checks=document.getElementsByName("CHECKBILLORDER");
	for(i=checks.length-1;i>=0;i=i-1){
		if(checkalls.checked==true){	
			checks[i].checked=true;	
		}else if(checkalls.checked==false){
			checks[i].checked=false;
		}
	}
}

function addpriorBankCheckSixBill(){
	var tab=document.getElementById("priorProjectBankCheckBill");
	var sed=tab.rows.length;
	$("#priorProjectBankCheckBill").append("<tr >"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='left' >户名</td>"
											+"<td colspan='2' class='ui-state-default ui-th-ltr zc_grid_head' align='center' ><input type='text' size='40' id='BANKCUSTNAME"+sed+"' name='BANKCUSTNAME' value=''/></td>"				
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='left' >银行支行名称</td><td colspan='3' class='ui-state-default ui-th-ltr zc_grid_head' align='center' ><input type='text' size='40' id='BANKBRANCH"+sed+"' name='BANKBRANCH' value=''/></td>"
											+"<td rowspan='2' class='ui-state-default ui-th-ltr zc_grid_head' align='center' ><input type='checkbox' id='CHECKBILLORDER' name='CHECKBILLORDER' value='"+sed+"'/></td>"
											+"</tr>"
										+"<tr >"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='left' >账号</td>"
											+"<td colspan='2' class='ui-state-default ui-th-ltr zc_grid_head' align='center' ><input type='text' size='40' id='BANKCUSTCODE"+sed+"' name='BANKCUSTCODE' value=''/></td>"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='left' >&nbsp;</td>"
											+"<td colspan='3' class='ui-state-default ui-th-ltr zc_grid_head' align='center' ><input type='text' style='display:none' size='40' id='BANKNAME"+sed+"' name='BANKNAME' value=''/></td>"
											+"</tr>"
											+"<tr><td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%' >期间（月）</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHONE"+sed+"');\" name='CHECKMONTHONE' id='CHECKMONTHONE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHTWO"+sed+"');\" name='CHECKMONTHTWO' id='CHECKMONTHTWO"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHTHREE"+sed+"');\" name='CHECKMONTHTHREE' id='CHECKMONTHTHREE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHFOUR"+sed+"');\" name='CHECKMONTHFOUR' id='CHECKMONTHFOUR"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHFIVE"+sed+"');\" name='CHECKMONTHFIVE' id='CHECKMONTHFIVE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center' width='14%'><input type='text' onchange=\"changeMonthFormat('CHECKMONTHSIX"+sed+"');\" name='CHECKMONTHSIX' id='CHECKMONTHSIX"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class=\"ui-state-default ui-th-ltr zc_grid_head\" align=\"center\" width=\"14%\" rowspan=\"2\">累计</td>"
									+"</tr>"+"<tr>"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >	上期结余</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMONE' id='LASTSUMONE"+sed+"' value='' style='text-align: center' size='10'></td>"
											
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMTWO' id='LASTSUMTWO"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMTHREE' id='LASTSUMTHREE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMFOUR' id='LASTSUMFOUR"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMFIVE' id='LASTSUMFIVE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' onchange=\"computeSum('"+sed+"');\" name='LASTSUMSIX' id='LASTSUMSIX"+sed+"' value='' style='text-align: center' size='10'></td>"
									+"</tr>"
									+"<tr>"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >每月收入</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMEONE' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMEONE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMETWO' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMETWO"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMETHREE' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMETHREE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMEFOUR' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMEFOUR"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMEFIVE' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMEFIVE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONTHINCOMESIX' onchange=\"computeSum('"+sed+"');\" id='MONTHINCOMESIX"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' id='MONTHINCOME_TOTAL"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
									+"</tr>"
									+"<tr>"
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >每月支出</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTONE' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTONE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTTWO' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTTWO"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTTHREE' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTTHREE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTFOUR' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTFOUR"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTFIVE' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTFIVE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='CHECKMONTHCOSTSIX' onchange=\"computeSum('"+sed+"');\" id='CHECKMONTHCOSTSIX"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' id='CHECKMONTHCOST_TOTAL"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
									+"</tr>"
									+"<tr>"
											
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >本期结余</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMONE' onchange=\"computeSum('"+sed+"');\" id='THISSUMONE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMTWO' onchange=\"computeSum('"+sed+"');\" id='THISSUMTWO"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMTHREE' onchange=\"computeSum('"+sed+"');\" id='THISSUMTHREE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMFOUR' onchange=\"computeSum('"+sed+"');\" id='THISSUMFOUR"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMFIVE' onchange=\"computeSum('"+sed+"');\" id='THISSUMFIVE"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='THISSUMSIX' onchange=\"computeSum('"+sed+"');\" id='THISSUMSIX"+sed+"' value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' id='THISSUM_TOTAL"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
									+"</tr>"
									+"<tr>"
											
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >现金流入</td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINONE' id='MONEYFLOWINONE"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
											
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINTWO' id='MONEYFLOWINTWO"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINTHREE' id='MONEYFLOWINTHREE"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
											
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINFOUR' id='MONEYFLOWINFOUR"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINFIVE' id='MONEYFLOWINFIVE"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
											
											+"<td class='ui-state-default ui-th-ltr zc_grid_head' align='center'><input type='text' name='MONEYFLOWINSIX' id='MONEYFLOWINSIX"+sed+"' onchange=\"computeSum('"+sed+"');\" value='' style='text-align: center' size='10'></td>"
									+"</tr>"
									+"<tr>"	
											+"<td  class='ui-state-default ui-th-ltr zc_grid_head' align='center' >说明</td>"
											+'<td colspan="7" class="ui-state-default ui-th-ltr zc_grid_head" align="center" ><textarea id="BANK_REMARK'+sed+'" name="BANK_REMARK" rows="3" cols="100"></textarea></td>'
									+"</tr>");
	

				$("input[name='CHECKMONTHONE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHTWO']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHTHREE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHFOUR']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHFIVE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHSIX']").datepicker($.datepicker.regional['zh-CN']);

}
//期间（月）格式
function changeMonthFormat(id){
	var str=$("#"+id).val().split("-");
	var date=new Date(str[0],str[1]-1,str[2]);
	var year=date.getYear()+1900;
	var month=date.getMonth()+1;
	if(month<10)
		$("#"+id).val(year+"-0"+month);
	else
		$("#"+id).val(year+"-"+month);
}

//银行对账单 自动计算
//本期结余＝上期结余＋本月收入-本月支出
//现金流入＝本月收入-本月支出
function computeSum(count){
	//本月收入
	var income1=parseCurrency(setzero($("#MONTHINCOMEONE"+count).val()));
	var income2=parseCurrency(setzero($("#MONTHINCOMETWO"+count).val()));
	var income3=parseCurrency(setzero($("#MONTHINCOMETHREE"+count).val()));
	var income4=parseCurrency(setzero($("#MONTHINCOMEFOUR"+count).val()));
	var income5=parseCurrency(setzero($("#MONTHINCOMEFIVE"+count).val()));
	var income6=parseCurrency(setzero($("#MONTHINCOMESIX"+count).val()));
	//本月支出
	var cost1=parseCurrency(setzero($("#CHECKMONTHCOSTONE"+count).val()));
	var cost2=parseCurrency(setzero($("#CHECKMONTHCOSTTWO"+count).val()));
	var cost3=parseCurrency(setzero($("#CHECKMONTHCOSTTHREE"+count).val()));
	var cost4=parseCurrency(setzero($("#CHECKMONTHCOSTFOUR"+count).val()));
	var cost5=parseCurrency(setzero($("#CHECKMONTHCOSTFIVE"+count).val()));
	var cost6=parseCurrency(setzero($("#CHECKMONTHCOSTSIX"+count).val()));
	
	//上期结余
	//自动计算本期结余
	//本期结余自动填充下期的上期结余
	var last1=parseCurrency(setzero($("#LASTSUMONE"+count).val()));
	var sum1=last1+income1-cost1;
	$("#THISSUMONE"+count).val(formatCurrency(sum1.toFixed(2)));
	$("#LASTSUMTWO"+count).val(formatCurrency(sum1.toFixed(2)));
	
	var last2=parseCurrency(setzero($("#LASTSUMTWO"+count).val()));
	var sum2=last2+income2-cost2;
	$("#THISSUMTWO"+count).val(formatCurrency(sum2.toFixed(2)));
	$("#LASTSUMTHREE"+count).val(formatCurrency(sum2.toFixed(2)));
	
	var last3=parseCurrency(setzero($("#LASTSUMTHREE"+count).val()));
	var sum3=last3+income3-cost3;
	$("#THISSUMTHREE"+count).val(formatCurrency(sum3.toFixed(2)));
	$("#LASTSUMFOUR"+count).val(formatCurrency(sum3.toFixed(2)));
	
	var last4=parseCurrency(setzero($("#LASTSUMFOUR"+count).val()));
	var sum4=last4+income4-cost4;
	$("#THISSUMFOUR"+count).val(formatCurrency(sum4.toFixed(2)));
	$("#LASTSUMFIVE"+count).val(formatCurrency(sum4.toFixed(2)));
	
	var last5=parseCurrency(setzero($("#LASTSUMFIVE"+count).val()));
	var sum5=last5+income5-cost5;
	$("#THISSUMFIVE"+count).val(formatCurrency(sum5.toFixed(2)));
	$("#LASTSUMSIX"+count).val(formatCurrency(sum5.toFixed(2)));
	
	var last6=parseCurrency(setzero($("#LASTSUMSIX"+count).val()));
	var sum6=last6+income6-cost6;
	$("#THISSUMSIX"+count).val(formatCurrency(sum6.toFixed(2)));

	//自动计算现金流入
	var flowin1=income1-cost1;
	var flowin2=income2-cost2;
	var flowin3=income3-cost3;
	var flowin4=income4-cost4;
	var flowin5=income5-cost5;
	var flowin6=income6-cost6;
	$("#MONEYFLOWINONE"+count).val(formatCurrency(flowin1.toFixed(2)));
	$("#MONEYFLOWINTWO"+count).val(formatCurrency(flowin2.toFixed(2)));
	$("#MONEYFLOWINTHREE"+count).val(formatCurrency(flowin3.toFixed(2)));
	$("#MONEYFLOWINFOUR"+count).val(formatCurrency(flowin4.toFixed(2)));
	$("#MONEYFLOWINFIVE"+count).val(formatCurrency(flowin5.toFixed(2)));
	$("#MONEYFLOWINSIX"+count).val(formatCurrency(flowin6.toFixed(2)));
	//本期结余
	var sum1=parseCurrency(setzero($("#THISSUMONE"+count).val()));
	var sum2=parseCurrency(setzero($("#THISSUMTWO"+count).val()));
	var sum3=parseCurrency(setzero($("#THISSUMTHREE"+count).val()));
	var sum4=parseCurrency(setzero($("#THISSUMFOUR"+count).val()));
	var sum5=parseCurrency(setzero($("#THISSUMFIVE"+count).val()));
	var sum6=parseCurrency(setzero($("#THISSUMSIX"+count).val()));
	//自动计算累计
	var month=income1+income2+income3+income4+income5+income6;
	$("#MONTHINCOME_TOTAL"+count).val(formatCurrency(month.toFixed(2)));
	
	var check=cost1+cost2+cost3+cost4+cost5+cost6;
	$("#CHECKMONTHCOST_TOTAL"+count).val(formatCurrency(check.toFixed(2)));
	
	var thissum=sum1+sum2+sum3+sum4+sum5+sum6;
	$("#THISSUM_TOTAL"+count).val(formatCurrency(thissum.toFixed(2)));
}

//内销比重 与 外销比重
function setINPERCENTGRAVE(){
	perNum = $("#OUTPERCENTGRAVE").val()
	if(positive($("#OUTPERCENTGRAVE")[0],'比重')){
		perNum=0;
	}
	if(perNum>100){
		perNum=100;
		alert("比重不能大于100%");
	}
	
	$("#OUTPERCENTGRAVE").val(parseFloat(perNum).toFixed(2));
	$("#INPERCENTGRAVE").val(parseFloat(100-perNum).toFixed(2));
}
function setOUTPERCENTGRAVE(){
	perNum = $("#INPERCENTGRAVE").val()
	
	if(positive($("#INPERCENTGRAVE")[0],'比重')){
		perNum=0;
	}

	if(perNum>100){
		perNum=100;
		alert("比重不能大于100%");
	}

	$("#INPERCENTGRAVE").val(parseFloat(perNum).toFixed(2));
	$("#OUTPERCENTGRAVE").val(parseFloat(100-perNum).toFixed(2));
}

//经营效益分析 自动计算结余 交机前
function setBESUM(){
	var BESUM=
	 parseCurrency(setzero($("#BECELLINCOME").val()))
	+parseCurrency(setzero($("#BEOTHERINCOME").val()))
	-parseCurrency(setzero($("#BERESOURCECOST").val()))
	-parseCurrency(setzero($("#BEFBMONTHPRICE").val()))
	-parseCurrency(setzero($("#BESALARY").val()))
	-parseCurrency(setzero($("#BEWATERELEC").val()))
	-parseCurrency(setzero($("#BEBEFORECOST").val()))
	-parseCurrency(setzero($("#BETAXMON").val()))
	-parseCurrency(setzero($("#BEOTHERBANKLOAN").val()))
	-parseCurrency(setzero($("#BEBANKLOAN").val()))
	-parseCurrency(setzero($("#BETHISRENT").val()))
	document.getElementById("BESUM").value = formatCurrency(BESUM);
}
//经营效益分析 自动计算结余 交机后
function setAFSUM(){
	var AFSUM=
	 parseCurrency(setzero($("#AFCELLINCOME").val()))
	+parseCurrency(setzero($("#AFOTHERINCOME").val()))
	-parseCurrency(setzero($("#AFRESOURCECOST").val()))
	-parseCurrency(setzero($("#AFFBMONTHPRICE").val()))
	-parseCurrency(setzero($("#AFSALARY").val()))
	-parseCurrency(setzero($("#AFWATERELEC").val()))
	-parseCurrency(setzero($("#AFBEFORECOST").val()))
	-parseCurrency(setzero($("#AFTAXMON").val()))
	-parseCurrency(setzero($("#AFOTHERBANKLOAN").val()))
	-parseCurrency(setzero($("#AFBANKLOAN").val()))
	-parseCurrency(setzero($("#AFTHISRENT").val()));
	document.getElementById("AFSUM").value = formatCurrency(AFSUM);
}
//如果为null 设为0
function setzero(value){
	value=value.trim();
	if(value==""||value==null){
		return "0.00";
	}else{
		return value
	}
}

//计算成长比重
function computePER() {
	//销货收入
	computePERMethod("BECELLINCOME","AFCELLINCOME","CELLINCOMEPER") ;
	//其他收入
	computePERMethod("BEOTHERINCOME","AFOTHERINCOME","OTHERINCOMEPER");
	//原物料成本
	computePERMethod("BERESOURCECOST","AFRESOURCECOST","RESOURCECOSTPER");
	//厂房租金
	computePERMethod("BEFBMONTHPRICE","AFFBMONTHPRICE","FBMONTHPRICEPER");
	//薪资
	computePERMethod("BESALARY","AFSALARY","SALARYPER");
	//水电
	computePERMethod("BEWATERELEC","AFWATERELEC","WATERELECPER");
	//透支
	computePERMethod("BEBEFORECOST","AFBEFORECOST","BEFORECOSTPER");
	//税金
	computePERMethod("BETAXMON","AFTAXMON","TAXMONPER");
	//其他银行借款
	computePERMethod("BEOTHERBANKLOAN","AFOTHERBANKLOAN","OTHERBANKLOANPER");
	//银行借款
	computePERMethod("BEBANKLOAN","AFBANKLOAN","BANKLOANPER");
	//本期租贷款
	computePERMethod("BETHISRENT","AFTHISRENT","THISRENTPER");
	//结余
	computePERMethod("BESUM","AFSUM","SUMPER");
}
//计算经营效益分析 成长比重：（交机后-交机前）/交机前
function computePERMethod(front,back,per){
	var perNum = (parseFloat($("#"+back).val().replace(/[￥,]/g, '')) - parseFloat($("#"+front).val().replace(/[￥,]/g, ''))) / parseFloat($("#"+front).val().replace(/[￥,]/g, '')) ;
	//判断如果为空或无穷大则设置为空
	if(isNaN(perNum) || perNum == 'Infinity'){
		perNum = '' ;
	} else {
		//perNum = Math.round(perNum * 100000)
		//perNum = perNum / 1000 ;
		perNum=perNum.toFixed(2);
	}
	$("#"+per).val(perNum) ;
}
//本期结余＝上期结余＋本月收入-本月支出
//现金流入＝本月收入-本月支出
//取得table下所有input并动态为其绑定事件
//
//$("#priorProjectBankCheckBill input").live('change',function(){
//		//取得当前点击的input所在列数
//		var tdIndex = $(this).parent().parent().find("td").index($(this).parent()[0]);   
//		//取得行数
//		var trIndex = $(this).parent().parent().parent().find("tr").index($(this).parent().parent()[0]) ;
//		//算出所在第几部分
//		trIndex = parseInt(trIndex / 8) + 1 ; 
//		//根据规律计算tr位置 
//		var lastSum = parseFloat($(this).parent().parent().parent().find("tr").eq(3 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex).find("input").val().replace(/[￥,]/g, '')) ;
//		var monthIncome = parseFloat($(this).parent().parent().parent().find("tr").eq(4 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex).find("input").val().replace(/[￥,]/g, '')) ;
//		var checkMonth = parseFloat($(this).parent().parent().parent().find("tr").eq(5 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex).find("input").val().replace(/[￥,]/g, '')) ;
//		var $thisSum = $(this).parent().parent().parent().find("tr").eq(6 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex).find("input") ;
//		var $lastSumAA = $(this).parent().parent().parent().find("tr").eq(3 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex + 1).find("input") ;
//		var $moneyFlowIn = $(this).parent().parent().parent().find("tr").eq(7 + ((trIndex -1) * 8) + 1).find("td").eq(tdIndex).find("input") ;
//		var thisSum = lastSum + monthIncome - checkMonth ;
//		var moneyFlowIn = monthIncome - checkMonth
//		if(isNaN(thisSum) || thisSum == 'Infinity'){
//			thisSum = '' ;
//		}
//		if(isNaN(moneyFlowIn) || moneyFlowIn == 'Infinity'){
//			moneyFlowIn = '' ;
//		}
//		$thisSum.val(thisSum) ;
//		$moneyFlowIn.val(moneyFlowIn) ;
//		$lastSumAA.val(thisSum) ;
//});
//
//
//
//
