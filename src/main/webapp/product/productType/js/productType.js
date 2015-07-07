
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 } 
		var typeCount = 0;
		//查看该产品类型下有无产品
					function isHaveKind(id){
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=productKind.getKindCountByTypeId&type_id=' + id,
							dataType:'json',
							async: false,
							success: function(dataBack){	
							typeCount = dataBack.count;	
							},
							error:function(callback){
								alert("error!");
								return;
							}
						});
					}


//弹出添加产品类型的层
			function addTypeDiv(){
				$('#addProductType').dialog({
					modal:true,
					autoOpen: false
					
				});
				$('#addProductType').dialog('open');
			}
//弹出层返回按钮
			function closeDialog(msg){
				$(msg).dialog('close');
			}
//添加提交			
			add = function() {
				var form = document.addForm;
			    if (blank(form.Name, '厂牌信息')) {
			    	   return false;
			    }
				$("#addForm").submit();
			}
//弹出查看层			
			function showTypeDiv(id){
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productType.getProductTypeById&id="+id,
					dataType:"json",
					success:function(dataBack){
						$("#showManufacturer").html(dataBack.productType.MANUFACTURER);
					    $("#showName").html(dataBack.productType.NAME);
					    $("#showMemo").html(dataBack.productType.MEMO);					    						
						$('#showProductType').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#showProductType').dialog('open');
				    },
				});				
			}
//弹出修改层			
			function updateTypeDiv(id){
				if(checkCreditExist('TYPE',id)){
					$.ajax({
						type:"post",
						url:"../servlet/defaultDispatcher",
						data:"__action=productType.getProductTypeById&id="+id,
						dataType:"json",
						success:function(dataBack){
						    $("#id").val(dataBack.productType.ID);	
						    $("#Manufacturer").val(dataBack.productType.MANUFACTURER);						
						    $("#name").val(dataBack.productType.NAME);						
						    $("#memo").val(dataBack.productType.MEMO);						
							$('#updateProductType').dialog({
								modal:true,
								autoOpen: false							
							});
							$('#updateProductType').dialog('open');
						},
					});	
				}
			}
//修改提交			
			update = function() {
				var updateForm = document.updateForm;
			    if (blank(updateForm.Manufacturer, '制造商')) {
			    	   return false;
			    }					
			    if (blank(updateForm.name, '厂牌信息')) {
			    	   return false;
			    }
		    
				$("#updateForm").submit();
			}
//删除记录			
			deleteType = function(id) {
				if(checkCreditExist('TYPE',id)){
					isHaveKind(id);
					if(typeCount == 0) {
						if(confirm('您确定要删除此制造商吗？')){
							window.location.href="../servlet/defaultDispatcher?__action=productType.deleteProductTypeById&id="+id ;
						}else{
							return false;
						}
					}else{
						alert("此制造商下还有产品，必须先删除下面的产品，才能删除此制造商！！");
						return false;
					}	
				}
			}		
			//检验是否厂牌重复
			function checkType(){
			var name = $("#Name").val();		
			var Manufacturer = $("#manufacturer").val();
			if(name == null || name == ''){
				alert("产品厂牌不能为空") ;
				return false ;
			}
			if(Manufacturer == null || Manufacturer == ''){
				alert("制造商不能为空") ;
				return false ;
			}
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productType.checkProductType&name="+name+"&Manufacturer="+Manufacturer,
					dataType:"json",
					success:function(dataBack){
					if(dataBack.count!=0)
					{
						alert("厂牌名称已存在！");
					}
					else
					{
						add();
					}
				},
				});				
			}	
			function checkCreditExist(type,id){
				var str = '' ;
				if(type == "SUEQ"){
					str = "供应商产品" ;
				} else if(type == "SUPPL"){
					str = "供应商" ;
				} else if(type == "TYPE"){
					str = "制造商" ;
				} else if(type == "PRODUCT"){
					str = "产品型号" ;
				} else if(type == "KIND"){
					str = "产品名称" ;
				} 
				var flag = true ;
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=suplEquipment.checkCreditExist&checkType="+type+"&ID="+id,
					dataType:"json",
					async: false,
					success:function(dataBack){
						if(dataBack.count == 1){
							alert("该"+str+"已关联案件不能进行操作！") ;
							flag = false ;
						} else if(dataBack.count == 2){
							if(!confirm("该"+str+"已关联案件是否继续操作？")){
								flag = false ;
							}
						}
					},
					error:function(error){
						alert("error") ;
					}
				});
				return flag ;
			}