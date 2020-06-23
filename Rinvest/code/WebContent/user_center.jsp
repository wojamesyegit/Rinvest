<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*" %>
<%
   
   String userIDKey = new String("userID");
   String userID = (String)session.getAttribute(userIDKey);

  
%>
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">

<title>睿步投资</title>
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/alluse.js"></script> 
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index_login.jsp">睿步投资专家系统</a>
				</div>
				
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li >
							 <a  href="index_login.jsp">首页</a>
						</li>
						<li >
							 <a href="sh_sz.jsp">国内市场</a>
						</li>
						<li>
							 <a href="world.jsp">环球市场</a>
						</li>
						<li >
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
									  <a href="https://cn.tradingview   .com/">TradingView</a>
								</li>
								
								
							</ul>
						</li>
					</ul>
                    <form class="navbar-form navbar-left" role="search" name = "form_search">
						<div class="form-group">
							<input type="text" class="form-control"  value="示例关键字：sh600519" onfocus="javascript:this.value=''"  name = "word"/>
						</div>
						<div class="checkbox">
							 <input type="radio" name = "search_type" value = "baidu">百度
							 <input type="radio"  name = "search_type" value = "local">站内
						</div>
						<button type="submit" class="btn btn-default" onclick = "gosearch()">搜索</button>
					</form>
				<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#" style = "color:blue;font:30"> <% out.print(userID); %></a>
						</li>				
						<li>
							 <a href="index.jsp">退出</a>
						</li>				
						
					</ul>
				</div>
			</nav>
		     <h3 style =  "display:inline;">
				         用户中心
			 </h3><em id = "chart_type" style =  "display:inline;color:blue"> -<% out.print(userID); %></em>
			<div class="row clearfix">
				<div class="col-md-3 column">
				   
					<div class="panel-group" id="panel-801634">
						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-801634" href="#panel-element-358002">账号设置</a>
							</div>
							<div id="panel-element-358002" class="panel-collapse collapse">
								<div class="panel-body">
									<a href = "#" id = "change_password">修改用户名或密码</a>
								</div>
								
								<div class="panel-body">
									<a href = "#">手机绑定(暂未开放)</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-801634" href="#panel-element-555060">历史记录</a>
							</div>
							<div id="panel-element-555060" class="panel-collapse collapse">
								<div class="panel-body">
								    <a href = "#" id = "query_history">历史查询(搜索框)</a>
								</div>
								<div class="panel-body">
								    <a href = "#" target = "blank" >---</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-801634" href="#panel-element-555062" >我的收藏</a>
							</div>
							<div id="panel-element-555062" class="panel-collapse collapse">
								<div class="panel-body">
								    <a href = "#" id = "stock_like">个股收藏</a>
								</div>
								<div class="panel-body">
								    <a href = "#" >投资组合收藏(暂未开放)</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 column">
				     
				   <form class="form-horizontal" id = "password_form" role="form" action="/TomcatTest/ChangePassServlet" method="post"  style = "display:none;">
						<div class="form-group"  >
						     
							 <label for="inputEmail3" class="col-sm-2 control-label">原密码</label>
							<div class="col-sm-10">
								<input name="password"  type="password" class="form-control" id="inputEmail3" style = " width: 250px;" />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10">
								<input name="new_pass" type="password" class="form-control" id="inputPassword3" style = " width: 250px;"/>
							 
							 
                    <% String loginMsg = (String)session.getAttribute("loginMsg");%>
                    <%
                    if(loginMsg != null) { 
                    out.print(loginMsg);
                    out.println("<script  charset=UTF-8 language='javascript'>alert( '原密码输入错误！');</script>");
                    session.removeAttribute("loginMsg");
                    }
                   
                    %>
							</div>
							
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default"  style = "width: 100px;">修改密码</button>
								 <button type="reset" class="btn btn-default" style = "margin-left: 30px; width: 100px;">重置</button>
								 
							</div>
							
						</div>
						
					</form> 
				     
				     
				     
				     
				     
					<div class="list-group" id = "look_list">
						 <a href="index_login.jsp" class="list-group-item active">Home</a>
						<div class="list-group-item">
							<p id= "type" >点击左侧查询</p>
						</div>
						<div class="list-group-item" id = "like_list">
							<h4 class="list-group-item-heading">
							     ...
							</h4>
							<p class="list-group-item-text">
								...
							</p>
						</div>
						<div class="list-group-item">
							
						</div> <a class="list-group-item active"> ————————</a>
					</div>
					<p>
						 <em>用户中心功能仍在开发测试中，不代表最终品质</em>  
					</p>
					
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
window.flag;

window.flag = "<% out.print(loginMsg);%>";

$(document).ready(function(){
	  console.log(window.flag);
	  if(window.flag  != "null") { 
		  document.getElementById("look_list").style.display="none";
		  document.getElementById("password_form").style.display="";
		  
          
     }
});


function get_like(){ //获取股票信息
	  document.getElementById("look_list").style.display="";
	  document.getElementById("password_form").style.display="none";
	  document.getElementById("type").innerHTML = "个股收藏：";
	  $.ajax({
	    url: "/TomcatTest/GetLikeServlet",
	    type:'POST',
        data:{},
        dataType:'json',
        success:function(data){
        	var trs = "";
        	$("#like_list").html("----");
        	for(var i=0;i<data.length;i++){
                trs+="<tr><th><a href = \"searchpage.jsp?wd=" + data[i].stock_like+"\">" + data[i].name.split("_")[0]+"   "+ data[i].time+"</a></th>";
                console.log(data[i].name)
             }
	        $("#like_list").html(trs);
           
           
        },


	    error: function(){
	      alert("查询信息失败")
	    }
	  })
}


function get_history(){ //获取股票信息
	  document.getElementById("look_list").style.display="";
	  document.getElementById("password_form").style.display="none";
	  document.getElementById("type").innerHTML = "历史查询：";
	  $("#like_list").html("----");
	  $.ajax({
	    url: "/TomcatTest/GetHistoryServlet",
	    type:'POST',
	    data:{},
	    dataType:'json',
	    success:function(data){
	      	var trs_h = "";
	      	
	      	for(var i=0;i<data.length;i++){
	              trs_h +="<tr><th><a href = \"searchpage.jsp?wd=" + data[i].query_key+"\">" + data[i].time+ " " + data[i].query_key+ "</a></th>";
	              console.log(data[i].query_key)
	           }
		    $("#like_list").html(trs_h);
	         
	         
	      },
	
	
		error: function(){
		      alert("查询信息失败")
		    }
      })  
}


function change_password(){ //获取股票信息
	  
	
      document.getElementById("look_list").style.display="none";
      document.getElementById("password_form").style.display="";
	  //document.getElementById("type").innerHTML = "历史查询：";
	  $("#like_list").html("----");
	  $.ajax({
	    url: "/TomcatTest/GetHistoryServlet",
	    type:'POST',
	    data:{},
	    dataType:'json',
	    success:function(data){
	      	var trs_h = "";
	      	
	      	for(var i=0;i<data.length;i++){
	              trs_h +="<tr><th><a href = \"searchpage.jsp?wd=" + data[i].query_key+"\">" + data[i].time+ " " + data[i].query_key+ "</a></th>";
	              console.log(data[i].query_key)
	           }
		    $("#like_list").html(trs_h);
	         
	         
	      },
	
	
		error: function(){
		      alert("查询信息失败")
		    }
    })  
}
document.getElementById("stock_like").addEventListener("click", get_like);
document.getElementById("query_history").addEventListener("click", get_history);
document.getElementById("change_password").addEventListener("click", change_password);
</script>

</body>

</html>