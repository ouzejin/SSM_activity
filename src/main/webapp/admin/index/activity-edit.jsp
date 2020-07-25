<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ page import="cn.edu.lingnan.pojo.Activity" %>
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
<div class="x-body">
    <form action="${ctx}/activity/updateActivityByAno" method="post" class="layui-form layui-form-pane">
        <% Activity activity=(Activity) session.getAttribute("upActivity"); %>
        <div class="layui-form-item">
            <label for="aNo" class="layui-form-label">
                活动编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aNo" name="aNo" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaNo()%>" readonly="true" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aName" class="layui-form-label">
                活动名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aName" name="aName" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaName()%>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aMan" class="layui-form-label">
                活动负责人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aMan" name="aMan" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaMan()%>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aContent" class="layui-form-label">
                活动内容
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aContent" name="aContent" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaContent()%>" class="layui-input">
            </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aTime" class="layui-form-label">
                活动时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aTime" name="aTime" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaTime()%>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aPlace" class="layui-form-label">
                活动地点
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aPlace" name="aPlace" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaPlace()%>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aState" class="layui-form-label">
                活动状态
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aState" name="aState" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaState()%>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="aManPhone" class="layui-form-label">
                负责人号码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="aManPhone" name="aManPhone" required lay-verify="required"
                       autocomplete="off" value="<%=activity.getaManPhone()%>" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <button type="submit"class="layui-btn" onclick="Closepage(this)">
                修改
            </button>
        </div>
    </form>
</div>
<script>

    function Closepage(e) {
       window.parent.location.reload();
        window.close();
    }

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