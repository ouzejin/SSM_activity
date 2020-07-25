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
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
  <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
    <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
  <div class="layui-row">
    <form action="${ctx}/activity/searchActivity" method="post" class="layui-form layui-col-md12 x-so">
      <input type="text" name="aName" id="aName" placeholder="请输入活动名称" autocomplete="off" class="layui-input">
      <button class="layui-btn"  type="submit"><i class="layui-icon">&#xe615;</i></button>
    </form>
  </div>
  <xblock>
    <button class="layui-btn" onclick="x_admin_show('活动申请','${ctx}/admin/index/myapply-add.jsp')"><i class="layui-icon"></i>申请活动</button>
  </xblock>
  <table class="layui-table">
    <thead>
    <tr>
      <th>活动名称</th>
      <th>活动内容</th>
      <th width="85px">活动时间</th>
      <th>活动地点</th>
      <th>申请时间</th>
      <th>审核状态</th>
    </thead>
    <tbody>
    <c:forEach var="my" items="${myApply}">
      <tr>
        <td>${my.aName}</td>
        <td>${my.aContent}</td>
        <td>${my.aTime}</td>
        <td>${my.aPlace}</td>
        <td>${my.applyTime}</td>
        <td>
	        <c:if test="${my.state=='待审核'}">
	        	<button class="layui-btn layui-btn" type="button">
         			${my.state}
         		</button>
	        </c:if>
         	<c:if test="${my.state=='通过'}">
	        	<button class="layui-btn layui-btn-normal" type="button">
         			${my.state}
         		</button>
	        </c:if>
	        <c:if test="${my.state=='不通过'}">
	        	<button class="layui-btn layui-btn-danger" type="button">
         			${my.state}
         		</button>
	        </c:if>
        </td>
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