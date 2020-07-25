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
        request.open("post","applicant/snoCheck?sno="+sno);
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
 * 校验邮箱
 */
function checkEmail(strEmail) 
{      
    var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    if ( emailReg.test(strEmail) ) {
        return true;
    }
    else {
//      alert("您输入的Email地址格式不正确！");
        return false;
    }
};
function emailCheck() {
	var email = document.getElementById("email").value;
	var email_hint = document.getElementById("email_hint");
	var flag = checkEmail(email);
	if(flag) {
		var request = createXmlHttpRequest();
        request.open("post","user/emailCheck?email="+email);
        request.send();
        request.onreadystatechange = function(){
        	if(request.readyState==4){
    	        var value = request.responseText;
    	        if(value=="true"){
    	        	email_hint.innerHTML ="该邮箱已被注册";
    	    		emailflag = false;
    	        }else{
    	        	email_hint.innerHTML = "邮箱可以使用";
    	    		emailflag = true;
    	        }
        	}
        }		
	} else {
		email_hint.innerHTML = "邮箱格式错误";
		emailflag = false;
	}
}
 
function emailHide() {
	var email_hint = document.getElementById("email_hint");
	email_hint.innerHTML = "";
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
        request.open("post","applicant/phoneCheck?phone="+phone);
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

