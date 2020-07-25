<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<%@ page import="cn.edu.lingnan.pojo.Applicant" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>信息更改</title>
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
  
  <body class="form-wrap" >
  <%Applicant applicant = (Applicant)session.getAttribute("myInfo"); %>
  <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-header">更改个人信息</div>
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="${ctx}/applicant/updateInfo" onsubmit="return checkForm()" method="post">
          <div class="layui-form-item">
            <label class="layui-form-label">学号</label> 
            <div class="layui-input-inline">
              <input type="text" id="sno" name="sno" value="<%=applicant.getsNo() %>" autocomplete="off"  readonly="true" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
              <input type="text" name="sname" value="<%=applicant.getsName() %>" readonly="true" autocomplete="off" class="layui-input">
            </div>
          </div>                   
            
            <div class="layui-form-item">
              <label class="layui-form-label">年级</label>
              <div class="layui-input-inline">
                <input type="text" name="grade" value="<%=applicant.getGrade() %>" lay-verify="required|number" autocomplete="off" class="layui-input">
              </div>
            </div>
            
            <div class="layui-form-item">
              <label class="layui-form-label">班级</label>
              <div class="layui-input-inline">
                <input type="text" name="cname" value="<%=applicant.getcName() %>"  autocomplete="off" class="layui-input">
              </div>
            </div>
            
            <div class="layui-form-item">
              <label class="layui-form-label">手机号码</label>
              <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" value="<%=applicant.getPhone() %>" onblur="phoneHide()" onkeyup="phoneCheck()" autocomplete="off" class="layui-input">
                <span id="phone_hint" style="color: red;"></span>
              </div>
            </div>
          </div>                       
          <div class="layui-form-item layui-layout-admin">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" type="submit">更改信息</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

    
  <script>
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
			var sNo = document.getElementById("sno").value;
			var flag = checkMobile(phone);
			if(flag) {
				var request = createXmlHttpRequest();
		        request.open("post","${ctx}/applicant/updatePhoneCheck?phone="+phone+"&sNo="+sNo);
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
  </script>
	

<style id="LAY_layadmin_theme">.layui-side-menu,.layadmin-pagetabs .layui-tab-title li:after,.layadmin-pagetabs .layui-tab-title li.layui-this:after,.layui-layer-admin .layui-layer-title,.layadmin-side-shrink .layui-side-menu .layui-nav>.layui-nav-item>.layui-nav-child{background-color:#20222A !important;}.layui-nav-tree .layui-this,.layui-nav-tree .layui-this>a,.layui-nav-tree .layui-nav-child dd.layui-this,.layui-nav-tree .layui-nav-child dd.layui-this a{background-color:#009688 !important;}.layui-layout-admin .layui-logo{background-color:#20222A !important;}</style>
</body>


</html>