
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
//			function isHaveSuplEqu(id){
//				$.ajax({
//					type:"post",
//					url:'../servlet/defaultDispatcher',
//					data:'__action=suplEquipment.getCountByProductId&product_id=' + id,
//					dataType:'json',
//					async: false,
//					success: function(dataBack){		
//					suplEquCount = dataBack.count;	
//					},
//					error:function(callback){
//						alert("error!");
//						return;
//					}
//				});
//			}
 
 //弹出层返回按钮
			function closeDialog(msg){
				$(msg).dialog('close');
				msg.val("") ;
			}
 //弹出层返回按钮
			function checkProductNumber(){
			var name = $("#Name").val();
			var kind_id = $("#kind_id").val();
			var type_id = $("#type_id").val();
			var product_id = $("#product_id").val();
			$("#buttonAdd").attr("disabled",true);
				$.ajax({
						type:"get",
						url:"../servlet/defaultDispatcher",
						data:"__action=suplEquipment.checkProductNumber&name="+name+"&kind_id="+kind_id+"&type_id="+type_id+"&product_id="+product_id,
						dataType:"json",
						success:function(json){
						if(json.count!=0)
						{
							alert("产品机号已存在");
						}
						else
						{
							alert("产品机号可以使用！");
							$("#buttonAdd").attr("disabled",false);
						}
							},
						error:function(){
							alert('验证发生错误!');
						     }
					     }); 
			}
 //弹出添加产品机号的层
			function addNumberDiv(){
					$.ajax({
						type:"get",
						url:"../servlet/defaultDispatcher",
						data:"__action=productNumber.getNumberName",
						dataType:"json",
						success:function(json){
							var arraylist = json;
							var htmls="<option value=0>--请选择--</option>";
							for( var i=0;i<arraylist.length;i++){
								htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
							}
							$("#type_id").html(htmls);
							$('#addProductNumber').dialog({
								modal:true,
								autoOpen: false							
							});
							$('#addProductNumber').dialog('open');	
							},
						error:function(){
							alert('加载产品厂牌发生错误!');
						     }
					     }); 
						   
            }
			function getKind(){
				$.ajax({
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.queryNumberByKindId&type_id="+$("#type_id").val(),
					dataType:"json",
					success:function(json){						
						var arraylist = json;
						var htmls="<option  value='0'>--请选择--</option>";
						for( var i=0;i<arraylist.length;i++){
							htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
						}						
						$("#kind_id").html(htmls);
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
			}
			function getProduct(){
				$.ajax({
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.queryNumberByProductId&kind_id="+$("#kind_id").val(),
					dataType:"json",
					success:function(json){						
						var arraylist = json;
						var htmls="<option  value='0'>--请选择--</option>";
						for( var i=0;i<arraylist.length;i++){
							htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
						}						
						$("#product_id").html(htmls);
					},
					error:function(){
						alert('加载产品型号发生错误!');
					     }
				     });
			}
//添加提交
	addNumber=function(){
		var name = $.trim($("#Name").val());
			 if (name.length == 0) {
			 alert("请填写产品机号")
			return false;
		 }
		 if($("#prodcut_id").val()==0){
		 	alert("请选择产品型号");
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
			function showNumberDiv(id){	
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.getNumberById&id="+id,
					dataType:"json",
					success:function(dataBack){
					    $("#showNumberName").html(dataBack.productNumber.NAME);
					    $("#showProductName").html(dataBack.productNumber.PRODUCTNAME);
					    $("#showTypeName").html(dataBack.productNumber.TYPENAME);					    						
					    $("#showKindName").html(dataBack.productNumber.KINDNAME);
					    $("#showMemo").html(dataBack.productNumber.MEMO);				    				
						$('#showProductNumber').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#showProductNumber').dialog('open');
				    },
				});				
			}
			
//删除记录
		deleteNumber = function(id) {
			/*isHaveSuplEqu(id);
			if(suplEquCount == 0) {
				if(confirm('您确定要删除此产品型号吗？')){
					window.location.href="../servlet/defaultDispatcher?__action=productNumber.deleteNumberById&id="+id ;
				}else{
					return false;
				}
			}else{
				alert("该产品型号在设备库中有，如果要删除该产品型号，需先将设备库中相关设备删除！！");
				return false;
			}*/
			if(confirm('您确定要删除此产品机号吗？')){
				window.location.href="../servlet/defaultDispatcher?__action=productNumber.deleteNumberById&id="+id ;
			}else{
				return false;
			}
		}
		//弹出修改层			
			function updateNumberDiv(id){	
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.getNumberById&id="+id,
					dataType:"json",
					success:function(dataBack){
						
						$("#update_kind_id").empty();
						
						var arraylist = dataBack.productType;
						var productKind = dataBack.productKind;
						var productProduct = dataBack.productProduct ;
						var htmls="";
						for( var i=0;i<arraylist.length;i++){
							if (arraylist[i].ID == dataBack.productNumber.TYPE_ID){
								htmls += "<option value='"+arraylist[i].ID+"' selected='selected'>"+arraylist[i].NAME+"</option>";
							} else {
								htmls += "<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
							}
						}
						$("#update_type_id").html(htmls);	
						//
						for( var i=0;i<productKind.length;i++){
							var tempStr = '';
							if (productKind[i].ID == dataBack.productNumber.KIND_ID){
								tempStr += "<option value='"+productKind[i].ID+"' selected='selected'>"+productKind[i].NAME+"</option>";
							} else {
								tempStr += "<option value='"+productKind[i].ID+"'>"+productKind[i].NAME+"</option>";
							}
							$("#update_kind_id").append(tempStr);
						}
						for( var i=0;i<productProduct.length;i++){
							var tempStr = '';
							if (productProduct[i].ID == dataBack.productNumber.PRODUCT_ID){
								tempStr += "<option value='"+productProduct[i].ID+"' selected='selected'>"+productProduct[i].NAME+"</option>";
							} else {
								tempStr += "<option value='"+productProduct[i].ID+"'>"+productProduct[i].NAME+"</option>";
							}
							$("#update_product_id").append(tempStr);
						}
						
					    $("#updateName").val(dataBack.productNumber.NAME);
					    $("#updateMemo").val(dataBack.productNumber.MEMO);					    						
					    $("#id").val(dataBack.productNumber.ID);				
						$('#updateProductNumber').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#updateProductNumber').dialog('open');
				    },
				});				
			}
			
		
			function getUpdateKind(){
				$.ajax({
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.queryNumberByKindId&type_id="+$("#update_type_id").val(),
					dataType:"json",
					success:function(json){						
						var arraylist = json;
						var htmls="<option  value='0'>--请选择--</option>";
						for( var i=0;i<arraylist.length;i++){
							htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
						}						
						$("#update_kind_id").html(htmls);
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
			}
			function getUpdateProduct(){
				$.ajax({
					type:"get",
					url:"../servlet/defaultDispatcher",
					data:"__action=productNumber.queryNumberByProductId&kind_id="+$("#update_kind_id").val(),
					dataType:"json",
					success:function(json){						
						var arraylist = json;
						var htmls="<option  value='0'>--请选择--</option>";
						for( var i=0;i<arraylist.length;i++){
							htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
						}						
						$("#update_product_id").html(htmls);
					},
					error:function(){
						alert('加载产品型号发生错误!');
					     }
				     });
			}
			
			
			
			
			
			
//修改提交			
		update = function() {
		var name = $.trim($("#updateName").val());
		if (name.length == 0) {
		    alert("请填写产品机号")
			        return false;
			    }
		 if($("#update_type_id").val()==0){
		 	alert("请选择产品");
			return false;
		 }	
		 if($("#update_kind_id").val()==0){
		 	alert("请选择产品名称");
			return false;
		 }	
		 if($("#update_product_id").val()==0){
		 	alert("请选择产品型号");
			return false;
		 }	
		 
		$("#updateForm").submit();
		}
			
