<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*" %>
<%
   
   String userIDKey = new String("userID");
   String userID = (String)session.getAttribute(userIDKey);

  
%>

<!DOCTYPE html>
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>睿步投资</title>
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">睿步投资</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="index_login.jsp">首页</a>
						</li>
						<li>
							 <a href="sh_sz.jsp">国内市场</a>
						</li>
						<li>
							 <a href="#">环球市场</a>
						</li>
						<li>
							 <a href="advise.jsp">投资推荐</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">财经链接<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li class="divider">
								</li>
								<li>
									 <a href="https://www.yicai.com/">第一财经</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="https://finance.sina.com.cn/">新浪财经</a>
								</li>
								<li class="divider">
								</li>
								<li>
									  <a href="https://cn.tradingview.com/">TradingView</a>
								</li>
								
								
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#"> <% out.print(userID); %></a>
						</li>				
						<li>
							 <a href="index.jsp">退出</a>
						</li>				
						
					</ul>
				</div>
				
			</nav>
			<div class="jumbotron">
				<h1>
					Welcome, <% out.print(userID); %>
				</h1>
				<p>
					财富之旅现在开始
				</p>
				
			</div>
			<div class="carousel slide" id="carousel-501922">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-501922">
					</li>
					<li data-slide-to="1" data-target="#carousel-501922">
					</li>
					<li data-slide-to="2" data-target="#carousel-501922">
					</li>
				</ol>
					<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/success.jpg" />
						<div class="carousel-caption">
							<h4>
						        欢迎来到睿步
							</h4>
							<p>
								Welcome.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/exchanger.jfif" />
						<div class="carousel-caption">
							<h4>
								金钱永不眠
							</h4>
							<p>
								Money never sleeps.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/index.png" />
						<div class="carousel-caption">
							<h4>
								实现财务自由
							</h4>
							<p>
							    Financial freedom is not a dream.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-501922" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-501922" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-4 column">
			<h2>
				Warren Buffet
			</h2>
			<p>
				别人恐惧时我贪婪，别人贪婪时我恐惧。
			
			</p>
			<p>
				 <a class="btn" href="#">View details »</a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				Edmund Burke
			</h2>
			<p>
			如果我们能支配财富，我们就会变得富裕而自由;如果我们的财富驾驭了我们，我们就会是真正的穷光蛋。
			</p>
			<p>
				 <a class="btn" href="#">View details »</a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				Talmud
			</h2>
			<p>
				别想一下就造出大海，必须先由小河川开始。
			</p>
			<p>
				 <a class="btn" href="#">View details »</a>
			</p>
		</div>
	</div>
</div>
<script type="text/javascript"> $('#carousel-501922').carousel('cycle');</script>
</body>
</html>