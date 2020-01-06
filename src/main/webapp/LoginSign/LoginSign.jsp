<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>LoginSign</title>
<link rel="stylesheet" href="${ctx}/LoginSign/css/style.css">
</head>

<body>
    <div class="content">
    <form action="${ctx}/user/login" method="post">
        <div class="form sign-in">
            <h2>欢迎回来</h2>
            <label>
                <span>学号</span>
                <input type="text" name="Sno"/>
            </label>
            <label>
                <span>密码</span>
                <input type="password" name="Apassword"/>
            </label>
            <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
            <button type="submit" class="submit">登 录</button>
        </div>
    </form>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
                <h2>立即注册</h2>
                <label>
                    <span>学号</span>
                    <input type="text" name="Sno"/>
                </label>
                <label>
                    <span>用户名</span>
                    <input type="text" name="Aname"/>
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" name="Apassword"/>
                </label>
                 <label>
                    <span>确认密码</span>
                    <input type="password" name="Apass"/>
                </label>
                <label>
                    <span>邮箱</span>
                    <input type="text" name="Email"/>
                </label>
                <button type="button" class="submit">注 册</button>
            </div>
        </div>
    </div>

    <script src="${ctx}/LoginSign/js/script.js"></script>
</body>

</html>