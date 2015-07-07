
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
        if(event.keyCode==13)
        {
        	doSearch();                              
        }
 } 
 
  
 		var productCount = 0;
		//查看该产品类型下有无产品
					function isHaveProduct(id){
						$.ajax({
							type:"post",
							url:'../servlet/defaultDispatcher',
							data:'__action=productProduct.getProductCountByKindId&kind_id=' + id,
							dataType:'json',
							async: false,
							success: function(dataBack){		
							productCount = dataBack.count;	
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
 //弹出添加产品类型的层
			function addKindDiv(){
//				$.ajax({
//					type:"get",
//					url:"../servlet/defaultDispatcher",
//					data:"__action=productKind.queryTypeName",
//					dataType:"json",
//					success:function(json){
//						var arraylist = json;
//						var htmls="";
//						for( var i=0;i<arraylist.length;i++){
//							htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
//						}
//						$("#type_id").html(htmls);	
						$('#addProductKind').dialog({
							modal:true,
							autoOpen: false					
						});
						$('#addProductKind').dialog('open');							
//					},
//					error:function(){
//						alert('加载产品厂牌信息发生错误!');
//					}
//				});    
}	
//添加提交
		add = function() {
		    var name = $.trim($("#Name").val());
			    if (name.length == 0) {
			        alert("请填写产品名称!");
			        return false;
			    }
//			 var typeNew = $.trim($("#type_new").val()) ;
//			 if(typeNew == 0){
//				 alert("请选择产品类型!");
//				 return false ;
//			 }
			$("#addForm").submit();
		}
//弹出查看层			
			function showKindDiv(id){	
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=productKind.getProductById&id="+id,
					dataType:"json",
					success:function(dataBack){
						$("#showTypeNew").html('');
					    $("#showName").html(dataBack.productKind.NAME);
					    $("#showMemo").html(dataBack.productKind.MEMO);					    						
					    $("#showTypeName").html(dataBack.productKind.TYPE_NAME);
					    var tnew = dataBack.productKind.TYPE_NEW ;
					    var dataType = dataBack.dataType ;
					    for(var i=0;i<dataType.length;i++){
					    	if(dataType[i].CODE == tnew){
					    		$("#showTypeNew").html(dataType[i].FLAG);
					    	}
					    }
					    if(dataBack.productKind.TYPE == 0){
							$("#showType").html("机动车")
						}else if(dataBack.productKind.TYPE == 1){
							$("#showType").html("非机动车")
						}					    				
						$('#showProductKind').dialog({
							modal:true,
							autoOpen: false							
						});
						$('#showProductKind').dialog('open');
				    },
				});				
			}
//删除记录
		deleteKind = function(id) {
			if(checkCreditExist('KIND',id)){
				isHaveProduct(id);
				if(productCount == 0) {
					if(confirm('您确定要删除此产品吗？')){
					window.location.href="../servlet/defaultDispatcher?__action=productKind.deleteProductById&id="+id;
					}else{
						return false;
					}
				}else{
					alert("此产品下还有产品型号，必须先删除下面的产品型号，才能删除此产品！！");
					return false;
				}
			}
		}
//弹出修改层			
			function updateKindDiv(id){	
				if(checkCreditExist('KIND',id)){
					$.ajax({
						type:"post",
						url:"../servlet/defaultDispatcher",
						data:"__action=productKind.getProductById&id="+id,
						dataType:"json",
						success:function(dataBack){
							var arraylist = dataBack.productType;
	//						var htmls="";
							for( var i=0;i<arraylist.length;i++){
								if (arraylist[i].ID == dataBack.productKind.TYPE_ID){
									$("#updateTypeID").val(arraylist[i].ID);	
									$("#updateTypeName").val(arraylist[i].NAME);
								}
	//								htmls += "<option value='"+arraylist[i].ID+"' selected='selected'>"+arraylist[i].NAME+"</option>";
	//							} else {
	//								htmls += "<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
	//							}
							}
						    if(dataBack.productKind.TYPE == 0){
								$("#updateType").val("0");
							}else if(dataBack.productKind.TYPE == 1){
								$("#updateType").val("1");
							}
						    //删除新增加类型type_new
	//					    var tnew = dataBack.productKind.TYPE_NEW ;
	//					    var dataType = dataBack.dataType ;
	//					    var updateTypeNewSelect = $("#updateTypeNew") ;
	//					    updateTypeNewSelect.attr("length",1) ;
	//					    for(var i=0;i<dataType.length;i++){
	//					    	if(dataType[i].CODE == tnew){
	//					    		updateTypeNewSelect.append("<option value='"+dataType[i].CODE+"' selected>"+dataType[i].FLAG+"</option>");
	//					    	} else {
	//					    		updateTypeNewSelect.append("<option value='"+dataType[i].CODE+"'>"+dataType[i].FLAG+"</option>");
	//					    	}
	//					    }
						    $("#updateName").val(dataBack.productKind.NAME);
						    $("#updateMemo").val(dataBack.productKind.MEMO);					    						
						    $("#id").val(dataBack.productKind.ID);				
							$('#updateProductKind').dialog({
								modal:true,
								autoOpen: false							
							});
							$('#updateProductKind').dialog('open');
					    },
					});	
				}
			}
//修改提交			
			update = function() {
		    	var name = $.trim($("#updateName").val());
		    	if (name.length == 0) {
			        alert("请填写产品名称")
			        return false;
			    }
				$("#updateForm").submit();
			}
//判断设备是否存在
			function getChild(){
				$("#type_id").val("") ;
				var type_name=$("#type_name").val();
				if(type_name!=""){
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
						if(type_id == null || type_id == ""){
							alert("厂牌不存在!") ;
							$("#buttonAdd").attr("disabled",true);
							return false;
						} else {
							$("#type_id").val(type_id) ;
						}
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
				}
				
			}
			
			function getChildUpdate(){
				$("#updateTypeID").val("") ;
				var updateTypeName=$("#updateTypeName").val();
				if(updateTypeName!=""){
					$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:{__action:'suplEquipment.checkProductType',
						type_name:updateTypeName
						},
					dataType:"json",
					success:function(json){						
						var temp = json ;
						var type_id = temp.type_id ;
						if(type_id == null || type_id == ""){
							alert("厂牌不存在!") ;
							$("#buttonUpdate").attr("disabled",true);
							return ;
						} else {
							$("#updateTypeID").val(type_id) ;
							$("#buttonUpdate").attr("disabled",false);
						}
					},
					error:function(){
						alert('加载产品类型发生错误!');
					     }
				     });
					}
				
			}
			//添加时检测设备名称是否存在
			function checkKind(){	
			var type_id = $("#type_id").val();
			var name = $("#Name").val().trim();
			
			if(name.length != 0 && type_id != null && type_id != ""){
				$("#buttonAdd").attr("disabled",true);
					$.ajax({
						type:"post",
						url:"../servlet/defaultDispatcher",
						data:{__action:'productKind.checkKind',
							type_id:type_id,
							name:name},
						dataType:"json",
						success:function(dataBack){
							if(dataBack.count!=0)
							{
								alert("产品名称已存在！");
								$("#Name").focus();
							}
							else
							{
								alert("产品名称可以使用！");
								$("#buttonAdd").attr("disabled",false);
							}
					    },
					    error:function(dataBack)
					    {
					    	alert("产品名称未验证，网络错误!");
					    }
					});	
				}
			}
			//检查是否存在报告中
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