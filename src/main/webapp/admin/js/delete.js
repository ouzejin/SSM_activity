
      /*用户-删除*/
      function member_del(obj){
    	  if(window.confirm('确认要删除吗？')){
    		  $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
              return true;
    	  }else{
    		  return false;
    	  }   		  
      }
      
	 //批量删除
      function delAllAty () {
    	  	var allsno = new Array();
	    	var flag = false;
	    	var oCheck = document.getElementsByName('check');
	    		for(var i = 0;i<oCheck.length;i++){
	    			if(oCheck[i].checked){
	    				allsno.push(oCheck[i].value);
	    				flag = true;
	    			}			    
	    		}
	    	if(flag){
	    		    if(confirm("您确定要删除这些申请人员吗？")){
	    		    	location.href="applicant/deleteBySno?f=delall&allsno="+allsno;
	    		    	window.event.returnValue=false;
	    		    	
	    		    }			
	    	   }else{
	    			alert("您至少要选择一个申请人员，才能进行批量删除!");    			
	    	} 
//         var data = tableCheck.getData();  
//         layer.confirm('确认要删除吗？'+data,function(index){
//             //捉到所有被选中的，发异步进行删除
//             layer.msg('删除成功', {icon: 1});
//             $(".layui-form-checked").not('.header').parents('tr').remove();
//         });
      }