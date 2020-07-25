<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>Test</title> 
</head> 
<body> 
	<form action="applicant/limitAll" method="post">	
		<button type="submit">test list</button>
	</form>
	<input value=${ctx}/>
</body> 
</html> 