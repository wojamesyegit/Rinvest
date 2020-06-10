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
					 alert("上线测试中");
					 var getAdvise = function ()
					 {
						
						 var formObj=document.form1;
						 var code1 = formObj.s1.value;
						 var code2 = formObj.s2.value;
						 var code3 = formObj.s3.value;
						 var code4 = formObj.s4.value;
						 var code5 = formObj.s5.value;
						 var code6 = formObj.s6.value;
						 var code7 = formObj.s7.value;
						 
						 var code8 = formObj.s8.value;
						 var code9 = formObj.s9.value;
						 var code10 = formObj.s10.value;
						 var x = "s";
						 var str = {
					                s1: code1,
					                
					            }
					     var durl= "http://raybu.top:8812/stockx?s_or_v="+x+"&s1="+code1+"&s2=" + code2 + "&s3="+code3 + "&s3="+code3+ "&s4="+code4+ "&s5="+code5+ "&s6="+code6+ "&s7="+code7+ "&s8="+code8+ "&s9="+code9+ "&s10="+code10+"&callback=?"; //+"&t="+Math.random();
					     alert(code1+code2+code3+code4+code5+code6+code7+code8+code9+code10+durl)
					     //方式一：通过ajax的方式获取数据
					     $.ajax({  
					     	
					    	  
					         url:durl,
					         type: 'get', 
					         timeout: 100000,
					         dataType: 'jsonp', 
					         processData: false,
					         jsonpCallback:"raybu",
					       
					         success: function(data){ 
					             
					        	 alert("success!");
					             
					             console.log("fafafaf");
					             var name=data.name;
                    			 var weight=data.weight;
                    			 var res=data.res;
                                 var trs="";
                                  for(var i=0;i<name.length;i++){
                                   trs+="<tr><th>"+name[i]+"</th><td>"+weight[i]+"</td>";
                                  
                                  }
					              $("#weight_list").html(trs);
					             
					             $("#res_sharp")[0].innerText= "夏普比率最优：此投资组合在过去300个交易日的收益率为："+res[0]*100+"%, 波动率为："+res[1]*100+"%, 夏普比率为："+res[2];
					             
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
					 var getAdvise_v = function ()
					 {
						
						 var formObj=document.form1;
						 var code1 = formObj.s1.value;
						 var code2 = formObj.s2.value;
						 var code3 = formObj.s3.value;
						 var code4 = formObj.s4.value;
						 var code5 = formObj.s5.value;
						 var code6 = formObj.s6.value;
						 var code7 = formObj.s7.value;
						 
						 var code8 = formObj.s8.value;
						 var code9 = formObj.s9.value;
						 var code10 = formObj.s10.value;
						 var x = "v";
						 var str = {
					                s1: code1,
					                
					            }
					     var durl= "http://raybu.top:8812/stockx?s_or_v="+x+"&s1="+code1+"&s2=" + code2 + "&s3="+code3 + "&s3="+code3+ "&s4="+code4+ "&s5="+code5+ "&s6="+code6+ "&s7="+code7+ "&s8="+code8+ "&s9="+code9+ "&s10="+code10+"&callback=?"; //+"&t="+Math.random();
					     alert(code1+code2+code3+code4+code5+code6+code7+code8+code9+code10+durl)
					     //方式一：通过ajax的方式获取数据
					     $.ajax({  
					     	
					    	  
					         url:durl,
					         type: 'get', 
					         timeout: 100000,
					         dataType: 'jsonp', 
					         processData: false,
					         jsonpCallback:"raybu",
					       
					         success: function(data){ 
					             
					        	 alert("success!");
					             
					             console.log("fafafaf");
					             var name=data.name;
                    			 var weight=data.weight;
                    			 var res=data.res;
                                 var trs="";
                                  for(var i=0;i<name.length;i++){
                                   trs+="<tr><th>"+name[i]+"</th><td>"+weight[i]+"</td>";
                                  
                                  }
					              $("#weight_list").html(trs);
					             
					             $("#res_sharp")[0].innerText= "波动率最小：此投资组合在过去300个交易日的收益率为："+res[0]*100+"%, 波动率为："+res[1]*100+"%, 夏普比率为："+res[2];
					             
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
			
			<div class="tabbable"  id="tabs-406068">
				<ul class="nav nav-tabs">
				    <li  class="active">
						 <a href="#panel-410940" data-toggle="tab">知识库查询</a>
					</li>
					<li >
						 <a href="#panel-597335" data-toggle="tab">投资组合权重推荐</a>
					</li>
				
				</ul>
				
					
		
	
					
				
				
				
				
				<div class="tab-content">
					<div class="tab-pane"  id="panel-597335">
						<p>
							正确输入股票代码，获得各支股票的推荐权重（上限十只）
						</p>
						             	<div class="row clearfix">
			    <div class="col-md-4 column">
					<form role="form" name = 'form1'>
						<div class="form-group">
							<input type="text"  name='s1' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s2' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s3' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s4' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s5' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s6' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s7' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s8' class="form-control" />
						</div>
						<div class="form-group">
							<input type="text"  name='s9' class="form-control" />
						</div>
							<div class="form-group">
							<input type="text"  name='s10' class="form-control" />
						</div>
					<div>
					 <button  type="button" onclick="getAdvise()"style = "margin:10px;">获取投资推荐（最大夏普比率）</button>
					
					 <button  type="button" onclick="getAdvise_v()" style = "margin:10px;">获取投资推荐（最小波动率）</button>
					</div>	
					</form>
					
				</div>
				<div class="col-md-8 column">
				
					<p class="text-info" >
						 <strong id = "output">睿步专家系统为您服务：</strong> 
					</p>
					
					<p>
					     请注意：<br>
						 1. 当输入股票数量较少时可能会出现权重过于偏重某一只股票的情况<br>
						 2. 投资组合推荐功能需要大量运算，耗时较长，请耐心等待<br>
						 3. 推荐结果仅供参考，不作为投资依据。睿步提醒您：股市有风险，投资需谨慎
					</p>
					
					<p>
					    本系统使用过去300个交易日的历史行情数据，构建feature-based model，找到最大<a href="https://baike.baidu.com/item/%E5%A4%8F%E6%99%AE%E6%AF%94%E7%8E%87/2549763?fr=aladdin" target="_blank">夏普比率（sharp ratio,可以理解为每一单位风险得到的回报）</a>或最小波动率的投资组合（一个assignment）
					</p>
					<table border="1" align="center" cellpadding="3" cellspacing="1" width="400">
                      <thead>
                        <tr>
                            <th>股票名称</th>
                         
                            <th>推荐权重</th>
                        </tr>
                      </thead>
                      <tbody id="weight_list"></tbody>
                    
                    </table>
                    <p class="text-info">
                          
						 <em id = "res_sharp"></em>  
					</p>
				</div>
				
			</div>
		
	
					</div>
					<div  class="tab-pane active" id="panel-410940">
						<p>
							输入股票代码以从睿步知识库中获取股票基本数据
						</p>
						<div class="row clearfix">
			    <div class="col-md-4 column">
					<form role="form" name = 'form0'>
						<div class="form-group">
							 <label >请输入股票代码  &nbsp; </label><label id = "101" >&nbsp;</label><input type="text"  name='s001' class="form-control" />
						</div>
						
						<div class="form-group">
							 <label for="exampleInputFile">文件输入</label><input type="file" id="exampleInputFile" />
							<p class="help-block">
								文件功能暂未开放
							</p>
						</div>
						<div class="checkbox">
							 <label><input type="checkbox" />Check me out</label>
						</div> <button  type="button" onclick= "getInfo()" >向睿步询问</button>
					</form>
					
				</div>
				<div class="col-md-8 column">
					<p class="text-info">
						 <em></em>  
					</p>
					<p class="text-info" >
						 <strong id = "output">睿步专家系统为您服务：</strong> 
					</p>
					<p class="text-info" >
						 <strong id = "output0"></strong> 
					</p>
					<p class="text-info" >
						 <strong id = "output01"></strong> 
					</p>
					<table border="1" align="left" cellpadding="3" cellspacing="1" width="120">
                     <thead>
                        
                    </thead>
                  <tbody id="studList"></tbody>
    
                   </table>
				</div>
				
			</div>
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
function getInfo()
{
	var formObj=document.form0;
    var code = formObj.s001.value;
    var durl= 'http://raybu.top:8811/info?s='+code;
    $.ajax({  
    	
        cache : true,  
        url:durl,
        type: 'GET', 
        dataType: 'jsonp', 
        timeout: 2000, 
        jsonpCallback:"raybu",
         success: function(data){ 
					             
					        	 alert("success!");
					             $("#output0")[0].innerText= "查询成功！"
					            
					             console.log("fafafaf");
                    			  var arr=data.data;
                    			  var index=data.index;
                                  var trs="";
                                  for(var i=0;i<arr.length;i++){
                                   trs+="<tr><th>"+index[i]+"</th><td>"+arr[i]+"</td><td>";
                                  
                                  }
                                  /*
                                    val():对表单控件设值或者取值
                                    text():对非表单标签设值或者取值（字符串）
                                    html():会对字符串中的HTML标签解析，然后再显示
                                  
                                  */
                                  $("#studList").html(trs);
                    					             
					             
					            
					         },
					         error:function(XMLHttpRequest, textStatus, errorThrown) {
					             alert(XMLHttpRequest.status);
					             alert(XMLHttpRequest.readyState);
					             alert(textStatus);
					         }
					
    });
    

    
	
}
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