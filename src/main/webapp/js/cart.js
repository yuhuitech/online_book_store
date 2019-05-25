$(function(){
    zg();
	jisuan();


    function ajax(amount,bookID) {
        var url ="/ShopCart" ;

        $.ajax({
            type:'POST',
            url:url,
            data: {
                "status":"2",
                "amounts":amount,
                "bookID": bookID
            },
            success:function(data) {
                alert("成功修改数量为 "+amount+" 件");
            }
        });
    }

    function ajaxDel(bookID) {
        var url ="/ShopCart" ;
        $.ajax({
            type:'POST',
            url:url,
            data: {
                "status":"3",
                "amounts":0,
                "bookID": bookID
            },
            success:function(data) {
                alert("成功将商品从购物车移除");
            }
        });
    }

    function ajaxState(state,bookID) {
        var url ="/ShopCart" ;
        $.ajax({
            type:'POST',
            url:url,
            data: {
                "status":"4",
				"state":state, //state为"checked" and "unchecked"
                "bookID": bookID
            },
            success:function(data) {
                // alert("成功修改商品购物车状态");
            }
        });
    }


    /**************数量加减***************/
	$(".num .sub").click(function(){
		var num = parseInt($(this).siblings("span").text());
		if(num<=1){
			$(this).attr("disabled","disabled");
		}else{
			num--;
			$(this).siblings("span").text(num);
			//获取除了货币符号以外的数字
			var price = $(this).parents(".number").prev().text().substring(1);
			//单价和数量相乘并保留两位小数
			$(this).parents(".th").find(".sAll").text('￥'+(num*price).toFixed(2));
			var bookID = $(this).parents(".num").attr("id");
			ajax(num, bookID);
			jisuan();
			zg();
		}
	});
	$(".num .add").click(function(){
		var num = parseInt($(this).siblings("span").text());
		num++;
		$(this).siblings("span").text(num);
		var price = $(this).parents(".number").prev().text().substring(1);
		$(this).parents(".th").find(".sAll").text('￥'+(num*price).toFixed(2));
		var bookID = $(this).parents(".num").attr("id");
		ajax(num, bookID);
		jisuan();
		zg();
	});
	//计算总价
	function jisuan(){
		var all=0;
		var len =$(".th input[type='checkbox']:checked").length;
		if(len==0){
			 $("#all").text('￥'+parseFloat(0).toFixed(2));
		}else{
			 $(".th input[type='checkbox']:checked").each(function(){
			 	//获取小计里的数值
	        	var sAll = $(this).parents(".pro").siblings('.sAll').text().substring(1);
	        	//累加
	        	all+=parseFloat(sAll);
	        	//赋值
	        	$("#all").text('￥'+all.toFixed(2));
	        })
		}
		
	}
	//计算总共几件商品
	function zg(){
		var zsl = 0;
		var index = $(".th input[type='checkbox']:checked").parents(".th").find(".num span");
		var len =index.length;
		if(len==0){
			$("#sl").text(0);
		}else{
			index.each(function(){
				zsl+=parseInt($(this).text());
				$("#sl").text(zsl);
			})
		}
		if($("#sl").text()>0){
			$(".count").css("background","#c10000");
		}else{
			$(".count").css("background","#8e8e8e");
		}
	}
	/*****************商品全选***********************/
	$("input[type='checkbox']").on('click',function(){
		var sf = $(this).is(":checked");
		var sc= $(this).hasClass("checkAll");
		if(sf){
			if(sc){
				 $("input[type='checkbox']").each(function(){
				 	if(!$(this).hasClass("checkAll")){
                        var bookID = $(this).parents(".th").attr("id");
                        ajaxState('checked',bookID);
					}
	                this.checked=true;  
	           }); 
				zg();
	           	jisuan();
			}else{
				$(this).checked=true;
                if(!$(this).hasClass("checkAll")){
                    var bookID = $(this).parents(".th").attr("id");
                    console.log($(this).parents(".th").attr("id"));
                    ajaxState('checked',bookID);
                }
	            var len = $("input[type='checkbox']:checked").length;
	            var len1 = $("input").length-1;
				if(len==len1){
					 $("input[type='checkbox']").each(function(){
		                this.checked=true;  
		            }); 
				}
				zg();
				jisuan();
			}
		}else{
			if(sc){
				 $("input[type='checkbox']").each(function(){
                     if(!$(this).hasClass("checkAll")){
                         var bookID = $(this).parents(".th").attr("id");
                         ajaxState('unchecked',bookID);
                     }
	                this.checked=false;  
	           }); 
				zg();
				jisuan();
			}else{
				$(this).checked=false;
                if(!$(this).hasClass("checkAll")){
                    var bookID = $(this).parents(".th").attr("id");
                    ajaxState('unchecked',bookID);
                }
				var len = $(".th input[type='checkbox']:checked").length;
	            var len1 = $("input").length-1;
				if(len<len1){
					$('.checkAll').attr("checked",false);
				}
				zg();
				jisuan();
			}
		}
		
	});
	/****************************proDetail 加入购物车*******************************/
	$(".btns .cart").click(function(){
		if($(".categ p").hasClass("on")){
			var num = parseInt($(".num span").text());
			var num1 = parseInt($(".goCart span").text());
			$(".goCart span").text(num+num1);
		}
	});
	
	//删除购物车商品
	$('.del').click(function(){
        var bookID = $(this).parents(".th").attr("id");
		//单个删除
		if($(this).parent().parent().hasClass("th")){
			$(".mask").show();
			$(".tipDel").show();
			index = $(this).parents(".th").index()-1;
			$('.cer').click(function(){
				ajaxDel(bookID);
				$(".mask").hide();
				$(".tipDel").hide();
				$(".th").eq(index).remove();
				$('.cer').off('click');
				if($(".th").length==0){
					$(".table .goOn").show();
				}
			})
		}else{
			//选中多个一起删除
			if($(".th input[type='checkbox']:checked").length==0){
				$(".mask").show();
				$(".pleaseC").show();
			}
			else{
				$(".mask").show();
				$(".tipDel").show();
				$('.cer').click(function(){
					$(".th input[type='checkbox']:checked").each(function(j){
						var bookID = $(this).parents('.th').attr("id");
						ajaxDel(bookID);
						index = $(this).parents('.th').index()-1;
						$(".th").eq(index).remove();
						if($(".th").length==0){
							$(".table .goOn").show();
						}
					})
					$(".mask").hide();
					$(".tipDel").hide();
					zg();
					jisuan();
				})
			}
		}
	})
	$('.cancel').click(function(){
		$(".mask").hide();
		$(".tipDel").hide();
	})

})
