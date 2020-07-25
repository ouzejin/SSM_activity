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

var loginflag=false;
function checkLogin() {
	var sno = document.getElementById("loginSno").value;
	var password = document.getElementById("loginPassword").value;
	var loginTips = document.getElementById("loginTips");
	var request = createXmlHttpRequest();
	var value;
    request.open("post","applicant/loginCheck?sno="+sno+"&password="+password);
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

//function checkLogin() {
//	check();
//	return loginflag;
//}

