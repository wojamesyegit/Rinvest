<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>

<html>
<head>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<ul class="breadcrumb">
				<li>
					 <a href="index.jsp">首页</a>
				</li>
				
				<li class="active">
					登录
				</li>
			</ul>
			<div class="alert alert-success alert-dismissable">
				 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<h4>
					注意!
				</h4> <strong>Warning!!</strong> 请保证密码强度以保护账户安全 
			</div>
			<h3 style = "margin-left: 30px; width: 100px;">
				欢迎登录
			</h3>
			<form class="form-horizontal" role="form" action="/TomcatTest/Login" method="post" >
				<div class="form-group"  >
					 <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input name="usersname" type="text" class="form-control" id="inputEmail3" style = " width: 250px;" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input name="password" type="password" class="form-control" id="inputPassword3" style = " width: 250px;"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" />记住我</label>
							 
						</div>
						 <label>或</label> <a  href= "regist_new.html" >前往注册</a>
						 
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default"  style = "width: 100px;">登录</button>
						
						 <button type="reset" class="btn btn-default" style = "margin-left: 30px; width: 100px;">重置</button>
						
					</div>


<% String loginMsg = (String)session.getAttribute("loginMsg");  %>
<%
if(loginMsg != null) { 
out.print(loginMsg);
out.println("<script  charset=UTF-8 language='javascript'>alert( '账号或密码输入错误！');</script>");
session.removeAttribute("loginMsg");
}
%>
				</div>
			</form> 
		</div>
	</div>
</div>
</body>
</html>