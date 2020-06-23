<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/index.css" />
        <title>Welcome</title>
        <style type="text/css" media="screen">
                .center{
                        position:absolute;
                        width: 200px;
                        height: 120px;
                        left: 50%;
                        top: 50%;
                        margin: -60px 0px 0px -60px;
                       
                }
        </style>
    </head>
    
      <center>
      <body style="background:url(images/index.png); background-size:cover;">
		  <div class="center">
		    <h3 style="color:black">Welcome！</h3>
		 
		        <tr>
		            <a  href="login.jsp"><li>用户登录</li></a>
		            <a  href="regist.jsp" class="right40"><li>新用户注册</li></a>
		        </tr>
		  </div>
      </body>
	 </center>
</html>