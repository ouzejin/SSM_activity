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

var phoneflag;
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
		phoneCheck();
		if(phoneflag){
			if(window.confirm("您确定要提交修改信息吗？")){
				return true;
			}else{
				return false;
			}
		}
		return phoneflag;
	}