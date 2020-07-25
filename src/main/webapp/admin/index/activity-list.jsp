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
  <link rel="shortcut icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
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
          <cite>活动管理</cite>
        </a>
      </span>
  <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
    <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
  <div class="layui-row">
    <form action="${ctx}/activity/searchActivity" method="post" class="layui-form layui-col-md12 x-so">
      <input class="layui-input" placeholder="开始日" name="start" id="start">
      <input class="layui-input" placeholder="截止日" name="end" id="end">
      <input type="text" name="aName" id="aName" placeholder="请输入活动名称" autocomplete="off" class="layui-input">
      <button class="layui-btn"  type="submit"><i class="layui-icon">&#xe615;</i></button>
    </form>
  </div>
  <xblock>
    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
    <button class="layui-btn" onclick="x_admin_show('添加活动','${ctx}/admin/index/activity-add.jsp')"><i class="layui-icon"></i>添加</button>
  </xblock>
  <table class="layui-table">
    <thead>
    <tr>
      <th>
        <input  type="checkbox"  onclick="allcheck()">
      </th>
      <th>活动ID</th>
      <th>活动名称</th>
      <th>活动负责人</th>
      <th>活动内容</th>
      <th width="85px">活动时间段</th>
      <th>活动地点</th>
      <th>活动状态</th>
      <th>活动负责人号码</th>
      <th>操作</th>
    </thead>
    <tbody>
    <c:forEach var="act" items="${activityList}">
      <tr>
        <td>
          <input  type="checkbox" name="check" value=${act.aNo}>        
        </td>
        <td>${act.aNo}</td>
        <td>${act.aName}</td>
        <td>${act.aMan}</td>
        <td>${act.aContent}</td>
        <td>${act.aTime}</td>
        <td>${act.aPlace}</td>
        <td>${act.aState}</td>
        <td>${act.aManPhone}</td>
        <td class="td-manage">
          <a title="更新"  onclick="x_admin_show('刷新','${ctx}/activity/getByAno?aNo=${act.aNo}')" href="javascript:;">
            <i class="layui-icon">&#xe642;</i>
          </a>
          <a title="删除" onclick="return member_del(this)" href="${ctx}/activity/deleteActivityByAno?aNo=${act.aNo}">
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
      <a href="${ctx}/activity/listAll?page=${indexNum-1}" class="prev" href="">&lt;&lt;</a>
    </c:if>    
      <span class="current"> ${indexNum}</span>
      <c:if test="${indexNum<=sum}">  
       	<a class="next" href="${ctx}/activity/listAll?page=${indexNum+1}">&gt;&gt;</a> 
      </c:if>        
    </div>
  </div>

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



  function delAll () {

    var allaNo = new Array();
    var flag = false;
    var oCheck = document.getElementsByName('check');
    for(var i = 0;i<oCheck.length;i++){
      if(oCheck[i].checked){
        allaNo.push(oCheck[i].value);
        flag = true;
      }
    }
    if(flag){
      if(confirm("您确定要删除这些活动吗？")){
        location.href="${ctx}/activity/deleteAllActivity?allaNo="+allaNo;
        window.event.returnValue=false;
      }
    }else{
      alert("您至少要选择一个活动，才能进行批量删除!");
    }
  }
</script>
</body>

</html>