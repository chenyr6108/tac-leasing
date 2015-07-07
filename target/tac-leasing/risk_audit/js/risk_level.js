//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 } 
        function notPositive(field, name) {
            var value = $.trim(field.value);
            value = value.replace(/[￥,]/g, '');
            if (!/^\d+(\.\d+)?$/.test(value)) {
                alert(name + '只能输入数字！');
                field.focus();
                return true;
            } else {
                value = '' + parseFloat(value);
                field.value = value
                return false;
            }
        }
        
        //弹出层返回按钮
        function closeDialog(msg){
       	$(msg).dialog('close');
       }
        
		function addDiv(){
			$('#addRiskLevel').dialog({
				modal:true,
				autoOpen: false				
			});
			$('#addRiskLevel').dialog('open');  
		}
		add = function() {
			var addform = document.addForm;
		    if (notPositive(addform.RANK, '级别')) {
		    	   return false;
		    }
		    if (notPositive(addform.LEVEL_PRICE_LOW, '评审金额下限')) {
		    	return false;
		    }
		    if (notPositive(addform.LEVEL_PRICE_UPPER, '评审金额上限')) {
		    	return false;
		    }
		    if (notPositive(addform.GRANT_PRICE_LOW, '授信金额下限')) {
		    	return false;
		    }
		    if (notPositive(addform.GRANT_PRICE_UPPER, '评审金额上限')) {
		    	return false;
		    }
			$("#addForm").submit();
		}
		function showDiv(id){	
			$.ajax({
				type:"post",
				url:"../servlet/defaultDispatcher",
				data:"__action=riskLevel.getRiskLevelById&PRRL_ID="+id,
				dataType:"json",
				success:function(dataBack){
				    $("#sRANK").html(dataBack.riskLevel.RANK);
				    $("#sLEVEL_PRICE_LOW").html(dataBack.riskLevel.LEVEL_PRICE_LOW);					    						
				    $("#sLEVEL_PRICE_UPPER").html(dataBack.riskLevel.LEVEL_PRICE_UPPER);
				    $("#sGRANT_PRICE_LOW").html(dataBack.riskLevel.GRANT_PRICE_LOW);					    						
				    $("#sGRANT_PRICE_UPPER").html(dataBack.riskLevel.GRANT_PRICE_UPPER);						    						
				    $("#sREMARK").html(dataBack.riskLevel.REMARK);					    						
					$('#showRiskLevel').dialog({
						modal:true,
						autoOpen: false							
					});
					$('#showRiskLevel').dialog('open');
			    },
			});				
		}
		function updateDiv(id){			
			$.ajax({
				type:"post",
				url:"../servlet/defaultDispatcher",
				data:"__action=riskLevel.getRiskLevelById&PRRL_ID="+id,
				dataType:"json",
				success:function(dataBack){
			    $("#PRRL_ID").val(dataBack.riskLevel.PRRL_ID);						
			    $("#updateRANK").val(dataBack.riskLevel.RANK);						
			    $("#updateLEVEL_PRICE_LOW").val(dataBack.riskLevel.LEVEL_PRICE_LOW);						
			    $("#updateLEVEL_PRICE_UPPER").val(dataBack.riskLevel.LEVEL_PRICE_UPPER);	
			    $("#updateGRANT_PRICE_LOW").val(dataBack.riskLevel.GRANT_PRICE_LOW);						
			    $("#updateGRANT_PRICE_UPPER").val(dataBack.riskLevel.GRANT_PRICE_UPPER);					
			    $("#updateREMARK").val(dataBack.riskLevel.REMARK);						
				$('#updateRiskLevel').dialog({
					modal:true,
					autoOpen: false							
				});
				$('#updateRiskLevel').dialog('open');
			},
			});				
		}
		update = function() {
			var updateForm = document.updateForm;
		    if (notPositive(updateForm.RANK, '级别')) {
		    	   return false;
		    }
		    if (notPositive(updateForm.LEVEL_PRICE_LOW, '评审金额下限')) {
		    	return false;
		    }
		    if (notPositive(updateForm.LEVEL_PRICE_UPPER, '评审金额上限')) {
		    	return false;
		    }
		     if (notPositive(updateForm.GRANT_PRICE_LOW, '授信金额下限')) {
		    	return false;
		    }
		    if (notPositive(updateForm.GRANT_PRICE_UPPER, '授信金额上限')) {
		    	return false;
		    }
			$("#updateForm").submit();
		}
		deleteRiskLevel = function(id) {			
			window.location.href="../servlet/defaultDispatcher?__action=riskLevel.deleteRiskLevelById&PRRL_ID="+id ;
		}	

	