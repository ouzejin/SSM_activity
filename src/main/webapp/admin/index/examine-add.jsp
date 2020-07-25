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
        <form  action="${ctx}/examine/insertExamine" class="layui-form" method="post">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  	<span class="x-red">*</span>学号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="sno" name="sno" required lay-verify="required"
                  autocomplete="off"  class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="sname" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="sname" name="sname" required
                  autocomplete="off" class="layui-input" >
              </div>
          </div>
          <div class="layui-form-item">
              <label for="aname" class="layui-form-label">
                  <span class="x-red">*</span>活动名称
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="aname" name="aname" required 
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  	活动内容
              </label>
              <div class="layui-input-inline">
                  <textarea  id="acontent" name="acontent" rows="8" cols="30">
                  </textarea>
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="atime" class="layui-form-label">
                  <span class="x-red">*</span>活动时间
              </label>
              <div class="layui-input-inline">
                  <input type="date" id="atime" name="atime" required autocomplete="off" class="layui-input" >
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="aplace" class="layui-form-label">
                  <span class="x-red">*</span>活动地点
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="aplace" name="aplace" required autocomplete="off" class="layui-input" >
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>活动负责人手机号码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required lay-verify="phone"
                  autocomplete="off" class="layui-input" >
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" type="submit">
                  	增加
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
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
    </script>
  </body>

</html>