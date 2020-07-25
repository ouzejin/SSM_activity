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
          <cite>审批结果</cite>
        </a>
      </span>
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form action="${ctx}/examine/searchResult" method="post" class="layui-form layui-col-md12 x-so">
          <div class="layui-inline">
			<select id="searchTypeSelect" name="searchType" lay-filter="status">
				<option value="">选择搜索方式</option>
				<option value="checkman">操作人员搜索</option>
				<option value="checktime">操作时间搜索</option>
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
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>活动名称</th>
            <th>活动内容</th>
            <th>活动时间</th>
            <th>活动地点</th>           
        </thead>
        <tbody>
          <c:forEach var="result" items="${userAllResult}">
          <tr>
            <td>${result.aName}</td>
            <td>${result.aContent}</td>
            <td>${result.aTime}</td>
            <td>${result.aPlace}</td>           
          </tr>
          </c:forEach>
        </tbody>
      </table>

    </div>
    <script>   
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