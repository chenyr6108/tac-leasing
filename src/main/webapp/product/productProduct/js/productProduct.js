
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 } 
 		var suplEquCount = 0;
		//查看该产品型号下设备库中是否有
					function isHaveSuplEqu(id){
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=suplEquipment.getCountByProductId&product_id=' + id,
							dataType:'json',
							async: false,
							success: function(dataBack){		
							suplEquCount = dataBack.count;	
							},
							error:function(callback){
								alert("error!");
								return;
							}
						});
					}
 
 //弹出层返回按钮
			function closeDialog(msg){
				$(msg).dialog('close');
			}
 //弹出层返回按钮
		function checkProduct(){
			var name = $("#Name").val();
			var kind_id = $("#kind_id").val();
			var type_id = $("#type_id").val();
			if(kind_id != null && type_id != null && kind_id != "" && type_id != ""){
				$("#buttonAdd").attr("disabled",true);
					$.ajax({
							type:"get",
							url:"../servlet/defaultDispatcher",
							data:"__action=suplEquipment.checkProduct&name="+name+"&kind_id="+kind_id+"&type_id="+type_id,
							dataType:"json",
							success:function(json){
							if(json.count!=0)
							{
								alert("产品型号已存在");
							}
							else
							{
								alert("产品名称可以使用！");
								$("#buttonAdd").attr("disabled",false);
							}
								},
							error:function(){
								alert('验证发生错误!');
							     }
				    }); 
				}
		}
 //弹出添加产品类型的层
			function addProductDiv(){
//					$.ajax({
//						type:"get",
//						url:"../servlet/defaultDispatcher",
//						data:"__action=productProduct.getProductName",
//						dataType:"json",
//						success:function(json){
//							var arraylist = json;
//							var htmls="<option value=0>--请选择--</option>";
//							for( var i=0;i<arraylist.length;i++){
//								htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
//							}
//							$("#type_id").html(htmls);
							$('#addProductProduct').dialog({
								modal:true,
								autoOpen: false							
							});
							$('#addProductProduct').dialog('open');	
//							},
//						error:function(){
//							alert('加载产品类型发生错误!');
//						     }
//					     }); 
//						   
            }
			function getChild(){
				$("#type_id").val("") ;
				$("#buttonAdd").attr("disabled",true);
				var type_name=$("#type_name").val();
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:{__action:'suplEquipment.checkProductType',
						type_name:type_name
						},
					dataType:"json",
					success:function(json){						
						var temp = json ;
						var type_id = temp.type_id ;
						$("#type_id").val(type_id) ;
						var htmls="<option  value='0'>--请选择--</option>";
						if(temp.kindList != null){
							for( var i=0;i<temp.kindList.length;i++){
								htmls = htmls+"<option value='"+temp.kindList[i].ID+"'>"+temp.kindList[i].NAME+"</option>";
							}		
						}
						$("#kind_id").html(htmls);
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
			}
//添加提交
	addProduct =function(){
		var name = $.trim($("#Name").val());
			 if (name.length == 0) {
			 alert("请填写产品型号")
			return false;
		 }
		 if($("#type_id").val()==0){
		 	alert("请选择产品类型");
			return false;
		 }
		 if($("#kind_id").val()==0){
		 	alert("请选择产品名称");
			return false;
		 }
		$("#addForm").submit();
	}
	//弹出查看层			
			function showProductDiv(id){	
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productProduct.getProductById&id="+id,
					dataType:"json",
					success:function(dataBack){
					    $("#showProductName").html(dataBack.productProduct.NAME);
					    $("#showTypeName").html(dataBack.productProduct.TYPENAME);					    						
					    $("#showKindName").html(dataBack.productProduct.KINDNAME);
					    $("#showMemo").html(dataBack.productProduct.MEMO);				    				
						$('#showProductProduct').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#showProductProduct').dialog('open');
				    },
				});				
			}
			
//删除记录
		deleteProduct = function(id) {
			if(checkCreditExist('PRODUCT',id)){
				isHaveSuplEqu(id);
				if(suplEquCount == 0) {
					if(confirm('您确定要删除此产品型号吗？')){
						window.location.href="../servlet/defaultDispatcher?__action=productProduct.deleteProductById&id="+id ;
					}else{
						return false;
					}
				}else{
					alert("该产品型号在设备库中有，如果要删除该产品型号，需先将设备库中相关设备删除！！");
					return false;
				}
			}
		}
		//弹出修改层			
			function updateProductDiv(id){	
				if(checkCreditExist('PRODUCT',id)){
					$.ajax({
						type:"post",
						url:"../servlet/defaultDispatcher",
						data:"__action=productProduct.getProductById&id="+id,
						dataType:"json",
						success:function(dataBack){
							
							$("#update_kind_id").empty();
							
							var arraylist = dataBack.productType;
							var productKind = dataBack.productKind;
							var htmls="";
							for( var i=0;i<arraylist.length;i++){
								if (arraylist[i].ID == dataBack.productProduct.TYPE_ID){
									$("#update_type_id").val(arraylist[i].ID) ;
									$("#update_type_name").val(arraylist[i].NAME) ;
									
	//								htmls += "<option value='"+arraylist[i].ID+"' selected='selected'>"+arraylist[i].NAME+"</option>";
								} 
	//							else {
	//								htmls += "<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
	//							}
							}
	//						$("#update_type_id").html(htmls);
							
							for( var i=0;i<productKind.length;i++){
								var tempStr = '';
								if (productKind[i].ID == dataBack.productProduct.KIND_ID){
									tempStr += "<option value='"+productKind[i].ID+"' selected='selected'>"+productKind[i].NAME+"</option>";
								} else {
									tempStr += "<option value='"+productKind[i].ID+"'>"+productKind[i].NAME+"</option>";
								}
								$("#update_kind_id").append(tempStr);
							}
							
						    $("#updateName").val(dataBack.productProduct.NAME);
						    $("#updateMemo").val(dataBack.productProduct.MEMO);					    						
						    $("#id").val(dataBack.productProduct.ID);				
							$('#updateProductProduct').dialog({
								modal:true,
								autoOpen: false							
							});
							$('#updateProductProduct').dialog('open');
					    },
					});	
				}
			}
			
			function getChildUpdate(){
				$("#update_type_id").val("") ;
				var type_name=$("#update_type_name").val();
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:{__action:'suplEquipment.checkProductType',
						type_name:type_name
						},
					dataType:"json",
					success:function(json){						
						var temp = json ;
						var type_id = temp.type_id ;
						$("#update_type_id").val(type_id) ;
						var htmls="<option  value='0'>--请选择--</option>";
						if(temp.kindList != null){
							for( var i=0;i<temp.kindList.length;i++){
								htmls = htmls+"<option value='"+temp.kindList[i].ID+"'>"+temp.kindList[i].NAME+"</option>";
							}		
						}
						$("#update_kind_id").html(htmls);
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
			}
//修改提交			
		update = function() {
			var name = $.trim($("#updateName").val());
		    if (name.length == 0) {
		        alert("请填写产品型号")
			        return false;
			}
		 	if($("#update_kind_id").val()==0){
		 		alert("请选择产品名称");
				return false;
		 	}	
			$("#updateForm").submit();
		}
	//检查是否关联到报告
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
			