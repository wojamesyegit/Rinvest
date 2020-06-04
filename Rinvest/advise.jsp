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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>睿步投资</title>
</head>
<body>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script> 
					 function display_alert(){
						 var formObj=document.form1;
						    var code1 = formObj.s1.value;
						    var code2 = formObj.s2.value;
						    var code3 = formObj.s3.value;
						    alert(code1+code2+code3)
					 }
					 alert("上线测试中，目前只支持三支股票");
					 var getAdvise = function ()
					 {
						
						 var formObj=document.form1;
						 var code1 = formObj.s1.value;
						 var code2 = formObj.s2.value;
						 var code3 = formObj.s3.value;
						 var str = {
					                s1: code1,
					                
					            }
					     var durl= "http://raybu.top:8806/stock3?s1="+code1+"&s2=" + code2 + "&s3="+code3; //+"&t="+Math.random();
					     alert(code1+code2+code3+durl)
					     //方式一：通过ajax的方式获取数据
					     $.ajax({  
					     	
					    	  
					         url:"http://raybu.top:8806/stock3?s1="+code1+"&s2=" + code2 + "&s3="+code3+"&callback=?",
					         type: 'get', 
					         timeout: 100000,
					         dataType: 'jsonp', 
					         processData: false,
					         jsonpCallback:"raybu",
					       
					         success: function(data){ 
					             
					        	 alert("success!");
					             $("#output")[0].innerText=JSON.stringify(data) ;
					           
					             console.log("fafafaf");
					             
					             
					            
					         },
					         error:function(XMLHttpRequest, textStatus, errorThrown) {
					             alert(XMLHttpRequest.status);
					             alert(XMLHttpRequest.readyState);
					             alert(textStatus);
					         }
					
					     
					     });
					     
					     
					     /*
					     //方式二：通过getScript的方式获取数据，如果使用脚本里的变量必须设置$.ajaxSetup ({ cache: true }); 
					     $.ajaxSetup ({ cache: true }); 
					     $.getScript(durl,function(data){
					         //加载脚本并执行获取的脚本数据，可以直接调用加载脚本里的变量等
					         str = hq_str_sh600016.split(',');
					         $("#res")[0].innerText=str[30]+" "+str[31]+" ajax";
					         console.log("getNewData")
					     });
					     */
					     return false;
					     
					 }
					
					
 </script>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index_login.jsp">睿步投资</a>
				</div>
				
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li >
							 <a  href="index_login.jsp">首页</a>
						</li>
						<li >
							 <a   href="sh_sz.jsp">国内市场</a>
						</li>
						<li>
							 <a href="#">环球市场</a>
						</li>
						<li class="active">
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
			<div class="btn-group">
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div>
			<div class="tabbable"  id="tabs-406068">
				<ul class="nav nav-tabs">
					<li  class="active">
						 <a href="#panel-597335" data-toggle="tab">投资组合权重推荐</a>
					</li>
					<li>
						 <a href="#panel-410940" data-toggle="tab">选股建议</a>
					</li>
				</ul>
				<div class="tab-content">
					<div  class="tab-pane active"  id="panel-597335">
						<p>
							正确输入股票代码，获得各支股票的推荐权重
						</p>
			<div class="row clearfix">
			    <div class="col-md-4 column">
					<form role="form" name = 'form1'>
						<div class="form-group">
							 <label >第一支  &nbsp; </label><label id = "001" >&nbsp;</label><input type="text"  name='s1' class="form-control" />
						</div>
						<div class="form-group">
							 <label >第二支  &nbsp;</label><label id = "002"> &nbsp;</label><input  type="text"  name='s2'  class="form-control"/>
						</div>
						<div class="form-group">
							 <label >第三支 &nbsp;</label><label id = "003" >&nbsp;</label><input  type="text"  name='s3'  class="form-control"/>
						</div>
						<div class="form-group">
							 <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
							<p class="help-block">
								文件功能暂未开放
							</p>
						</div>
						<div class="checkbox">
							 <label><input type="checkbox" />Check me out</label>
						</div> <button  type="button" onclick="getAdvise()">获取投资推荐</button>
					</form>
					
				</div>
				<div class="col-md-8 column">
					<p class="text-info">
						 <em>睿步为您推荐：</em>  
					</p>
					<p class="text-info" >
						 <strong id = "output"></strong> 
					</p>
				</div>
				
			</div>
		
	
					</div>
					<div class="tab-pane" id="panel-410940">
						<p>
							I'm in Section 2.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script >
$(document).ready(function(){
	
    /*var tg_1=self.setInterval(function(){
        getName_1();
        
    },
    1000);//N毫秒刷新一次，单位：毫秒，1000毫秒＝1秒
    var tg_2=self.setInterval(function(){
       
        getName_2();
       
    },
    1000);
    var tg_3=self.setInterval(function(){
       
        getName_3();
    },
    1000);*/
    console.log("ddd")
});

//获取新数据
function getName_1()
{
	var formObj=document.form1;
    var code1 = formObj.s1.value;
    var durl_1= 'http://raybu.top:8808/name?s='+code1;
    $.ajax({  
    	
        cache : true,  
        url:durl_1,
        type: 'GET', 
        dataType: 'jsonp', 
        timeout: 2000, 
        jsonpCallback:"raybu",
        success: function(data){ 
        	
        	$("#001")[0].innerText =data;
            
        },
        error: function(){
        	$("#001")[0].innerText = "#";
        }
    });
    

    
	
}

function getName_2(){
	var formObj=document.form1;
   
    var code2 = formObj.s2.value;
    
    
    var durl_2= 'http://raybu.top:8808/name?s='+code2;
   
 
$.ajax({  
    	
        cache : true,  
        url:durl_2,
        type: 'GET', 
        dataType: 'jsonp', 
        timeout: 2000, 
        jsonpCallback:"raybu",
        success: function(data){ 
        	
        	$("#002")[0].innerText =data;
            
        },
        error: function(){
        	$("#002")[0].innerText = "#";
        }
    });
    
	
}

function getName_3(){
	var formObj=document.form1;
   
    var code3 = formObj.s3.value;
    
    
    var durl_3= 'http://raybu.top:8808/name?s='+code3;
   
 
$.ajax({  
    	
        cache : true,  
        url:durl_3,
        type: 'GET', 
        dataType: 'jsonp', 
        timeout: 2000, 
        jsonpCallback:"raybu",
        success: function(data){ 
        	
        	$("#003")[0].innerText =data;
            
        },
        error: function(){
        	$("#003")[0].innerText = "#";
        }
    });
    
	
}
    
    
</script>
</body>
</html>