<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>申请人员管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/admin/favicon.ico" type="${ctx}/admin/image/x-icon" />
    <link rel="stylesheet" href="${ctx}/admin/css/font.css">
    <link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
    <script src="${ctx}/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<%--     <script type="text/javascript" src="${ctx}/admin/js/delete.js" charset="utf-8"></script> --%>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a>
          <cite>申请人员管理</cite>
        </a>
      </span>
      <a class="layui-btn layui-btn-primary layui-btn-small" 
          style="line-height:1.6em;margin-top:3px;float:right" 
          href="javascript:location.replace(location.href);" 
          title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i>
      </a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form action="${ctx}/applicant/searchApplicant" method="post" class="layui-form layui-col-md12 x-so">
          <div class="layui-inline">
			<select id="searchTypeSelect" name="searchType" lay-filter="status">
				<option value="">选择搜索方式</option>
				<option value="sno">学号搜索</option>
				<option value="sname">姓名搜索</option>
				<option value="cname">班级搜索</option>
				<option value="grade">年级搜索</option>
			</select>
		  </div>
          <input type="text" name="search"  placeholder="请输入搜索内容" autocomplete="off" class="layui-input">
          <!-- 判断下拉框是否为空 -->
			<script type="text/javascript">
			function SelectEmpty(){
							var searchtype = document.getElementById("searchTypeSelect");
							if(searchtype[0].selected==true){
							alert("请选择一种搜索方式后再进行搜索!");																			            
				            return false;
				            }else{
				                return true;												
				            }
				        }							
			</script>	
          <button class="layui-btn"  lay-filter="sreach" onclick="return SelectEmpty()" type="submit">
          	<i class="layui-icon">&#xe615;</i>
          </button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAllAty()" type="button"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加申请人员','${ctx}/admin/index/applicant-add.jsp')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <input  type="checkbox"  onclick="allcheck()">
            </th>
            <th>学号</th>
            <th>姓名</th>
            <th>年级</th>
            <th>班级</th>
            <th>手机号码</th>
            <th>密码</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach var="applicant" items="${allApplicant}">
          <tr>          
            <td>
				<input  type="checkbox" name="check" value=${applicant.sNo}>              	  
            </td>
            <td>${applicant.sNo}</td>
            <td>${applicant.sName}</td>
            <td>${applicant.grade}</td>
            <td>${applicant.cName}</td>
            <td>${applicant.phone}</td>
            <td>${applicant.password}</td>            
              <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/applicant/getBySno?sno=${applicant.sNo}')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除"  onclick="return member_del(this);" href="${ctx}/applicant/deleteBySno?sno=${applicant.sNo}">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
      <div class="page">
            <div>
	    <c:if test="${indexNum!=1}">
	      <a href="${ctx}/applicant/limitAll?page=${indexNum-1}" class="prev" href="">&lt;&lt;</a>
		    </c:if>
		    
	      <span class="current"> ${indexNum}</span>
	      <c:if test="${indexNum<=sum}"> 
	       <a class="next" href="${ctx}/applicant/limitAll?page=${indexNum+1}">&gt;&gt;</a>
		  </c:if>
	      
	    </div>
      </div>

    </div>
    <script>
  
    //全选
    function allcheck(){
    	var oCheck = document.getElementsByName('check');
    		for(var i = 0;i<oCheck.length;i++){
    			if(oCheck[i].checked){
    				oCheck[i].checked=false;
    			}else{
    				oCheck[i].checked=true;
    			}
    		}   		
    } 
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
     
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
	    		    	location.href="${ctx}/applicant/deleteAllApp?allsno="+allsno;
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
    </script>
  </body>

</html>