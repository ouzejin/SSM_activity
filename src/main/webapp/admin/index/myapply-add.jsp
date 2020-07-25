<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
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
    <div class="x-body">
        <form  action="${ctx}/apply/applyActivity" class="layui-form" method="post">
          <div class="layui-form-item">
              <label for="aName" class="layui-form-label">
                  	<span class="x-red">*</span>活动名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="aName" name="aName" required lay-verify="required"
                  autocomplete="off"  class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="aContent" class="layui-form-label">
                  	活动内容
              </label>
              <div class="layui-input-inline">
                  <textarea id="aContent" name="aContent" 
                  	autocomplete="off" class="layui-input" >
                  </textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="aPlace" class="layui-form-label">
                  <span class="x-red">*</span>活动地点
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="aPlace" name="aPlace" required
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="aTime" class="layui-form-label">
                  <span class="x-red">*</span>活动时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="aTime" name="aTime" required 
                  autocomplete="off" class="layui-input" >
              </div>

          </div>
          
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机号码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required lay-verify="phone"
                  autocomplete="off" class="layui-input" >
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" onclick="member_add()" type="submit">
                  	增加
              </button>
          </div>
      </form>
    </div>
    <script>
	    function member_add(){
	    	window.parent.location.reload();
	    	
	    }        
          
    </script>
  </body>

</html>