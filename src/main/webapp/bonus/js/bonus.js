
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 } 
		var typeCount = 0;

//弹出添加奖励信息的层
			function addBonusDiv(){
				$('#addBonus').dialog({
					modal:true,
					autoOpen: false
					
				});
				$('#addBonus').dialog('open');
			}
//弹出层返回按钮
			function closeDialog(msg){
				$(msg).dialog('close');
			}
//添加提交			
			add = function() {
				var form = document.addForm;
			    if (blank(form.BONUS_NAME, '奖金名称')) {
			    	   return false;
			    }
				$("#addForm").submit();
			}
//弹出查看层			
			function showBonusDiv(id){	
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=bonusManage.getBonusById&id="+id,
					dataType:"json",
					success:function(dataBack){
						$("#showBonusName").html(dataBack.bonus.BONUS_NAME);
						$('#showBonus').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#showBonus').dialog('open');
				    },
				});				
			}
//弹出修改层			
			function updateBonusDiv(id){			
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=bonusManage.getBonusById&id="+id,
					dataType:"json",
					success:function(dataBack){
				    $("#id").val(dataBack.bonus.BONUS_ID);	
				    $("#BONUS_NAMEU").val(dataBack.bonus.BONUS_NAME);						
					$('#updateBonus').dialog({
						modal:true,
						autoOpen: false							
					});
					$('#updateBonus').dialog('open');
				},
				});				
			}
//修改提交			
			update = function() {
				var updateForm = document.updateForm;
			    if (blank(updateForm.BONUS_NAMEU, '奖励名称')) {
			    	   return false;
			    }					
		    
				$("#updateForm").submit();
			}
//删除记录			
			deleteType = function(id) {
					if(confirm('您确定要删除此奖金名称吗？')){
						window.location.href="../servlet/defaultDispatcher?__action=bonusManage.deleteBonusById&id="+id ;
					}else{
						return false;
					}

			}		
			//检验是否奖金名称重复
			function checkType(){
			var name = $("#BONUS_NAME").val();			
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=bonusManage.checkBonusName&name="+name,
					dataType:"json",
					success:function(dataBack){
					if(dataBack.count!=0)
					{
						alert("奖金名称已存在！");
					}
					else
					{
						add();
					}
				},
				});				
			}	