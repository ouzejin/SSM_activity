<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/admin/css/font.css">
    <link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
    <script src="${ctx}/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
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
          <cite>活动审批</cite>
        </a>
      </span>
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form action="${ctx}/examine/searchExamine" method="post" class="layui-form layui-col-md12 x-so">
          <div class="layui-inline">
			<select id="searchTypeSelect" name="searchType" lay-filter="status">
				<option value="">选择搜索方式</option>
				<option value="sno">学号搜索</option>
				<option value="sname">姓名搜索</option>
				<option value="aname">活动名搜索</option>
				<option value="aplace">活动地点搜索</option>
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
      	<button class="layui-btn layui-btn-normal" onclick="passAllExa()">批量通过</button>
        <button class="layui-btn layui-btn-danger" onclick="failAllExa()">批量不通过</button>
<%--         <button class="layui-btn"  onclick="x_admin_show('添加待审核活动','${ctx}/admin/index/examine-add.jsp')" lay-filter="sreach"> --%>
<!-- 	        <i class="layui-icon"> -->
<!-- 	        </i> -->
<!-- 	          增加 -->
<!--         </button> -->
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <input  type="checkbox"  onclick="allcheck()">
            </th>
            <th>学号</th>
            <th>姓名</th>
            <th>活动名称</th>
            <th>活动内容</th>
            <th>活动时间</th>
            <th>活动地点</th>
            <th>电话</th>
            <th>申请时间</th>
            <th>操作</th>
        </thead>
        <tbody>
          <c:forEach var="examine" items="${allExamine}">
          <tr>
            <td>
              <input  type="checkbox" name="check" value=${examine.sNo}>
            </td>
            <td>${examine.sNo}</td>
            <td>${examine.sName}</td>
            <td>${examine.aName}</td>
            <td>${examine.aContent}</td>
            <td>${examine.aTime}</td>
            <td>${examine.aPlace}</td>
            <td>${examine.phone}</td>
            <td>${examine.applyTime}
            	<input  type="hidden" name="applyTime" value=${examine.applyTime}>
            </td>
            <td class="td-manage">
              <button class="layui-btn layui-btn-normal" onclick="passAty('${examine.sNo}','${examine.applyTime}')">
				通过
              </button>
              <button class="layui-btn layui-btn-danger" onclick="failAty('${examine.sNo}','${examine.applyTime}')">
             	不通过
              </button>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <div>
    <c:if test="${indexNum!=1}">
      <a href="${ctx}/examine/getAllExamine?page=${indexNum-1}" class="prev" href="">&lt;&lt;</a>
    </c:if>   
      <span class="current"> ${indexNum}</span>
      <c:if test="${indexNum<=sum}">  
      	<a class="next" href="${ctx}/examine/getAllExamine?page=${indexNum+1}">&gt;&gt;</a>
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
    
      function passAty(sno,atime){
    	  if(confirm("您确定要通过该活动吗？")){
		    	location.href="${ctx}/examine/passExamine?sno="+sno+"&applyTime="+atime;
		    	window.event.returnValue=false;
		  }
      }
      
      function failAty(sno,atime){
    	  if(confirm("您确定不通过该活动吗？")){
		    	location.href="${ctx}/examine/failExamine?sno="+sno+"&applyTime="+atime;
		    	window.event.returnValue=false;
		  }
      }
      
    //通过全部待审核活动
      function passAllExa(){
      	var allsno = new Array();
      	var alltime = new Array();
      	var flag = false;
      	var oCheck = document.getElementsByName('check');
      	var time = document.getElementsByName('applyTime');
      		for(var i = 0;i<oCheck.length;i++){
      			if(oCheck[i].checked){
      				allsno.push(oCheck[i].value);
      				alltime.push(time[i].value);
      				flag = true;
      			}			
      		}
      	if(flag){
      		    if(confirm("您确定要通过这些待审核活动吗？")){
      		    	location.href="${ctx}/examine/passAllExamine?allsno="+allsno+"&alltime="+alltime;
      		    	window.event.returnValue=false;      		    	
      		    }			
      	   }else{
      			alert("您至少要选择一项待审核活动，才能进行批量通过!");      			
      	} 
      } 
      //不通过全部审核活动
      function failAllExa(){
      	var allsno = new Array();
      	var alltime = new Array();
      	var flag = false;
      	var oCheck = document.getElementsByName('check');
      	var time = document.getElementsByName('applyTime');
      		for(var i = 0;i<oCheck.length;i++){
      			if(oCheck[i].checked){
      				allsno.push(oCheck[i].value);
      				alltime.push(time[i].value);
      				flag = true;
      			}			
      		}
      	if(flag){
      		    if(confirm("您确定要不通过这些待审核活动吗？")){
      		    	location.href="${ctx}/examine/failAllExamine?allsno="+allsno+"&alltime="+alltime;
      		    	window.event.returnValue=false;		    	
      		    }			
      	   }else{
      			alert("您至少要选择一项待审核活动，才能进行批量否定!");     			
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
    </script>
  </body>

</html>