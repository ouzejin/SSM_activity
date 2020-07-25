<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<%@ page import="cn.edu.lingnan.pojo.Applicant" %>
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
    <script src="../js/jquery.min.js"></script>
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
        <form  action="${ctx}/applicant/updateBySno" class="layui-form" method="post">
        <%Applicant applicant = (Applicant)session.getAttribute("upApplicant"); %>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  	学号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="sno" name="sno" required lay-verify="required"
                  autocomplete="off" value="<%=applicant.getsNo() %>" readonly="true" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>学号不能修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="sname" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="sname" name="sname" 
                  autocomplete="off" class="layui-input" value="<%=applicant.getsName() %>">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="<%=applicant.getPhone() %>" id="phone" name="phone" required lay-verify="phone"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="password" name="password" required lay-verify="pass"
                  autocomplete="off" class="layui-input" value="<%=applicant.getPassword() %>">
              </div>
              <div class="layui-form-mid layui-word-aux">
                 	 6到16个字符
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="grade" class="layui-form-label">
                  <span class="x-red">*</span>年级
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="grade" name="grade" 
                  autocomplete="off" class="layui-input" value="<%=applicant.getGrade() %>">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="cname" class="layui-form-label">
                  <span class="x-red">*</span>班级
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cname" name="cname" 
                  autocomplete="off" class="layui-input" value="<%=applicant.getcName() %>">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" onclick="member_update()" type="submit">
                 	修改
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
  			
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("修改成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
        
        function member_update(){
        	window.parent.location.reload();
        	location.replace(location.href);
        }
    </script>
  </body>

</html>