<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE> 
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>登录注册</title>
<link rel="stylesheet" href="${ctx}/LoginSign/css/style.css">
</head>

<body>
    <div class="content">
    <form action="${ctx}/applicant/home" method="post">
        <div class="form sign-in">
            <h2>欢迎回来</h2>
            <label>
                <span>学号</span>
                <input id="loginSno" type="text" name="sno"/>
                <span id="loginTips" style="color: red;"></span>
            </label>
            <label>
                <span>密码</span>
                <input id="loginPassword" type="password" name="password"/>
            </label>
            <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
            <button type="submit" class="submit" onclick="return checkLogin()">登 录</button>
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
           <form action="${ctx}/applicant/register" method="post" onsubmit="return checkForm()">
            <div class="form sign-up"> 
                <h2>立即注册</h2>
                <label>
                    <span>学号</span>
                    <input id="sno" type="text" name="sno" onfocus="shoeTips('hint','学号不能为空')" onblur="hint_hide()" onkeyup="hint()" autocomplete="off"/>
                    <span id="hint" style="color: red;"></span>
                </label>
                <label>
                    <span>姓名</span>
                    <input id="sname" type="text" name="sname" onfocus="shoeTips('name_hint','姓名不能为空')" onblur="name_hide()" onkeyup="checkName()" autocomplete="off"/>
                    <span id="name_hint" style="color: red;"></span>
                </label>
                <label>
                    <span>密码</span>
                    <input id="password" type="password" name="password" onfocus="shoeTips('pass_hint','密码不能为空')" onblur="pass_hide()" onkeyup="checkPass()"/>
                    <span id="pass_hint" style="color: red;"></span>
                </label>
                 <label>
                    <span>确认密码</span>
                    <input id="cfmpassword" type="password" name="cfmpassword" onfocus="shoeTips('cfm_hint','两次密码要一致')" onblur="passpass_hide()" onkeyup="checkPassPass()"/>
                	<span id="cfm_hint" style="color: red;"></span>
                </label>
                <label>
                    <span>手机号</span>
                    <input id="phone" type="text" name="phone" onfocus="shoeTips('phone_hint','手机号格式要正确')" onblur="phoneHide()" onkeyup="phoneCheck()" autocomplete="off"/>
                    <span id="phone_hint" style="color: red;"></span>
                </label>
                	<button  type="submit" class="submit">注 册</button>              
            </div>
           </form>
        </div>
    </div>
    <script src="${ctx}/LoginSign/js/script.js"></script>
    <script type="text/javascript">
    function shoeTips(spanId, tips) {
    	var span = document.getElementById(spanId);
    	span.innerHTML = tips;
    }

    function createXmlHttpRequest(){
        var xmlreq = false;
        if (window.XMLHttpRequest){
            xmlreq = new XMLHttpRequest();
        }else
            if (window.ActiveXObject){
        	try{
        	    xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
        	}catch(e1){
        	    try{
        	        xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
        	    }catch(e2){
        	}
             }
        }
        return xmlreq;   	
    }


    /**
     * 校验学号
     */

    var hintflag;
    var emailflag;
    var phoneflag;
    function hint() {
    	var sno = document.getElementById("sno").value;
    	var hint = document.getElementById("hint");
    	var request = createXmlHttpRequest();
    	var value;
    	if(!(/^\d+$/.test(sno))){
    		hint.innerHTML = "学号只能由数字组成";
    		hintflag = false;
    	}else if(sno.length!=10) {
    		hint.innerHTML = "学号必须为10位数字";
    		hintflag = false;
    	} else {		
            request.open("post","${ctx}/applicant/snoCheck?sno="+sno);
            request.send();
          request.onreadystatechange = function(){
        	if(request.readyState==4){
        	        value = request.responseText;
        	        if(value=="true"){
        	        	hint.innerHTML ="该学号已被注册";
        	    		hintflag = false;  	    		    	    		
        	        }else{
        	        	hint.innerHTML ="学号正确";
        	        	hintflag = true;
        	        }
            	}
            }
    	}
    }	
     
    function hint_hide() {
    	var hint = document.getElementById("hint");
    	hint.innerHTML = "";
    }


    /**
     * 校验用户名
     */
    function checkName() {
    	var name = document.getElementById("name").value;
    	var hint = document.getElementById("name_hint");
    	if(name.length<2) {
    		hint.innerHTML = "姓名长度不能小于2";
    		return false;
    	}else if(!/^[\u4e00-\u9fa5]+$/i.test(name)){
    		hint.innerHTML = "姓名只能是纯汉字";
    		return false;
    	}else {
    		hint.innerHTML = "";
    		return true;
    	}
    }
     
    function name_hide() {
    	var hint = document.getElementById("name_hint");
    	hint.innerHTML = "";
    }


    /**
     * 校验密码
     */
     
    function checkPass() {
    	var password = document.getElementById("password").value;
    	var hint = document.getElementById("pass_hint");
    	if(password.length < 6) {
    		hint.innerHTML = "密码太短";
    		return false;
    	} else {
    		hint.innerHTML = "密码格式合格";
    		return true;
    	}
    }
     
    function pass_hide() {
    	var hint = document.getElementById("pass_hint");
    	hint.innerHTML = "";
    }
    /***
     * 确认密码的校验
     */
    function checkPassPass() {
    	var cfmpassword = document.getElementById("cfmpassword").value;
    	var password = document.getElementById("password").value;
    	var cfm_hint = document.getElementById("cfm_hint");
    	if(cfmpassword != password) {
    		cfm_hint.innerHTML = "两次密码不一致";
    		return false;
    	} else {
    		cfm_hint.innerHTML = "";
    		return true;
    	}
    }
     
    function passpass_hide() {
    	var cfm_hint = document.getElementById("cfm_hint");
    	cfm_hint.innerHTML = "";
    }   
    /**
     * 校验手机号
     */
    function checkMobile(strMobile)
    {	//13588888888
        var regu = /^[1][345678][0-9]{9}$/;
        var re = new RegExp(regu);
        if (re.test(strMobile)) {    	
            return true;
        }
        else {
            return false;
        }
    };
    function phoneCheck() {
    	var phone = document.getElementById("phone").value;
    	var phone_hint = document.getElementById("phone_hint");
    	var flag = checkMobile(phone);
    	if(flag) {
    		var request = createXmlHttpRequest();
            request.open("post","${ctx}/applicant/phoneCheck?phone="+phone);
            request.send();
            request.onreadystatechange = function(){
            	if(request.readyState==4){
        	        var value = request.responseText;
        	        if(value=="true"){
        	        	phone_hint.innerHTML ="该手机号已被注册";
        	    		phoneflag = false;
        	        }else{
        	        	phone_hint.innerHTML = "手机号可以使用";
        	        	phoneflag = true;
        	        }
            	}
            }
    	} else {
    		phone_hint.innerHTML = "手机号格式错误";
    		phoneflag = false;
    	}
    }
     
    function phoneHide() {
    	var phone_hint = document.getElementById("phone_hint");
    	phone_hint.innerHTML = "";
    }
     
    function checkForm() {
    	hint();
    	var flag = checkName() && checkPass() && checkPassPass();
    	phoneCheck();
    	var result = hintflag&&flag&&phoneflag;
    	if(result){
    		if(window.confirm("注册成功，前往登录吗？")){
    			return true;
    		}else{
    			return false;
    		}
    	}
    	return result;
    }
    
    var loginflag=false;
    function checkLogin() {
    	var sno = document.getElementById("loginSno").value;
    	var password = document.getElementById("loginPassword").value;
    	var loginTips = document.getElementById("loginTips");
    	var request = createXmlHttpRequest();
    	var value;
        request.open("post","${ctx}/applicant/loginCheck?sno="+sno+"&password="+password);
        request.send();
        request.onreadystatechange = function(){
        	if(request.readyState==4){
        	        value = request.responseText;
        	        if(value=="false"){
        	        	loginTips.innerHTML ="账号或密码错误";
        	        	loginflag = false;    	        	
        	        }else{
        	            loginflag = true;
        	        }
            	}
            }
        return loginflag;
    }
    </script>
</body>

</html>