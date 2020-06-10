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

<script>
 function showLoading(show){

                if(show){
                   document.getElementById("over").style.display = "block";
                   document.getElementById("layout").style.display = "block";
                }else{
                document.getElementById("over").style.display = "none";
                   document.getElementById("layout").style.display = "none";
                }
                }  
                
//获取浏览器页面可见高度和宽度
var _PageHeight = document.documentElement.clientHeight,
    _PageWidth = document.documentElement.clientWidth;
//计算loading框距离顶部和左部的距离（loading框的宽度为215px，高度为61px）
var _LoadingTop = _PageHeight > 61 ? (_PageHeight - 61) / 2 : 0,
    _LoadingLeft = _PageWidth > 215 ? (_PageWidth - 215) / 2 : 0;
//在页面未加载完毕之前显示的loading Html自定义内容
var _LoadingHtml = '<div id="loadingDiv" style="position:absolute;left:0;width:100%;height:100%;top:0;background:#f3f8ff;opacity:1;filter:alpha(opacity=80);z-index:10000;"><div style="position: absolute; cursor1: wait; left:40%; right:20%;top:40%; width: auto; height: 20%; line-height: 10px; padding-left: 10px; padding-right: 10px; background: #fff url(images/loading.gif) no-repeat scroll 5px 10px; border: 0px solid #95B8E7; color: #696969; font-family:\'Microsoft YaHei\';">页面加载中，请等待...</div></div>';
//呈现loading效果
document.write(_LoadingHtml);

//window.onload = function () {
//    var loadingMask = document.getElementById('loadingDiv');
//    loadingMask.parentNode.removeChild(loadingMask);
//};

//监听加载状态改变
document.onreadystatechange = completeLoading;

//加载状态为complete时移除loading效果
function completeLoading() {
    if (document.readyState == "complete") {
        var loadingMask = document.getElementById('loadingDiv');
        loadingMask.parentNode.removeChild(loadingMask);
    }
}
</script>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8"name="viewport" content="width=device-width, initial-scale=1.0">
<title>睿步投资</title>
</head>
<body>

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
						<li class="active">
							 <a   href="sh_sz.jsp">国内市场</a>
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
			<div class="row clearfix">
				<div class="col-md-8 column"  >
				<div class="btn-group" >
						 <button class="btn btn-default">分时</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
						<ul class="dropdown-menu">
						<li class="divider">
							</li>
							<li>
								 <a href="#">日k</a>
							</li>
							<li>
								 <a href="#">周k</a>
							</li>
							
							<li>
								 <a href="#">月k</a>
							</li>
						</ul>
					</div>
				<div class="panel panel-default" >
						<div class="panel-heading">
							<h3  class="panel-title" id = "ptitle">
								
								上证指数
							</h3>
						</div>
						<div  id = "sz_m"></div>
						<div class="panel-body" id="mline" style="height: 500px;">
							
       
						</div>
						<button type="button" class="btn btn-default" style = "margin-left:20px;" id = "shm">上证</button>
						<button type="button" class="btn btn-default"  id = "szm">深成</button>
						<button type="button" class="btn btn-default"  id = "cym">创业</button>
						<div class="panel-footer" >
							Panel footer
						</div>
					</div>
				
				</div>
				<div class="col-md-4 column">
				<table class="table table-hover">
						<thead>
							<tr>
								<th>
									指数
								</th>
								<th>
									最新
								</th>
								<th>
									涨跌
								</th>
								<th>
									涨幅
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class="info" id = "sh">
								<td style= "width:120px;">
									上证指数
								</td>
								<td id = "sh_value" style= "width:90px;">
									#
								</td>
								<td id = "sh_price">
									#
								</td>
								<td id = "sh_rate">
									#
								</td>
								
								
							</tr>
							<tr class="warning" id = "sz">
								<td >
									深证成指
								</td>
								<td id = "sz_value">
									#
								</td>
								<td id = "sz_price">
									#
								</td>
								<td id = "sz_rate">
									#
								</td>
							</tr>
							<tr class="info" id = "cy">
								<td>
									创业板指
								</td>
								<td id = "cy_value" >
									#
								</td>
								<td id = "cy_price">
									#
								</td>
								<td id = "cy_rate">
									#
								</td>
							</tr>
							<tr class="warning" id = 'hs300'>
								<td>
									沪深300
								</td>
								<td id = 'hs300_value'>
									#
								</td>
								<td id = 'hs300_price'>
									#
								</td>
								<td id = 'hs300_rate'>
									#
								</td>
							</tr>
							<tr class="info"class="warning" id = 'dsj100'>
								<td>
									大数据100
								</td>
								<td id = 'dsj100_value'>
									#
								</td>
								<td id = 'dsj100_price'>
									#
								</td>
								<td id = 'dsj100_rate'>
									#
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
<style type="text/css">  
      .overLoading {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #f5f5f5;
            opacity:0.5;
            z-index: 1000;
            }
            .layoutLoading {
                display: none;
                position: absolute;
                top: 40%;
                left: 40%;
                width: 20%;
                height: 20%;
                z-index: 1001;
                text-align:center;
            }
            
      
</style>
   <div id="over" class="overLoading"></div>
   <div id="layout" class="layoutLoading"><img src="images/loading.gif" /></div>
<script >
$(document).ready(function(){
     //返回 var hq_str_sh601006="xxxxxxx" 的形式数据。
    getNewData();
    var tg=self.setInterval(getNewData,1500);//N毫秒刷新一次，单位：毫秒，1000毫秒＝1秒
    console.log("ddd")
});

//获取新数据
function getNewData()
{
    var durl= "http://hq.sinajs.cn/list=s_sh000001,s_sz399001,s_sz399006,s_sh000300,s_sz399415" + ","+window.code;//+"&t="+Math.random();
    
    //方式一：通过ajax的方式获取数据
    $.ajax({  
    	
        cache : true,  
        url:durl,
        type: 'GET', 
        dataType: 'script', 
        timeout: 2000, 
        success: function(data, textStatus, jqXHR){ 
            var str_sh = data;
            str_sh = hq_str_s_sh000001.split(',');
            
            $("#sh_value")[0].innerText=str_sh[1] ;
            $("#sh_price")[0].innerText=str_sh[2];
            $("#sh_rate")[0].innerText=str_sh[3] + "%";
            if (str_sh[2] < 0){
            	document.getElementById("sh").style.color = "green";
            	
            }else{
            	document.getElementById("sh").style.color = "red";
            }
            console.log("1");
            
            
           
            var str_sz = hq_str_s_sz399001.split(',');
          
            $("#sz_value")[0].innerText=str_sz[1] ;
            $("#sz_price")[0].innerText=str_sz[2];
            $("#sz_rate")[0].innerText=str_sz[3] + "%";
            if (str_sz[2] < 0){
            	document.getElementById("sz").style.color = "green";
            	
            }else{
            	document.getElementById("sz").style.color = "red";
            }
            console.log("2");
            
            
            var str_cy = hq_str_s_sz399006.split(',');
           
            $("#cy_value")[0].innerText=str_cy[1] ;
            $("#cy_price")[0].innerText=str_cy[2];
            $("#cy_rate")[0].innerText=str_cy[3] + "%";
            if (str_cy[2] < 0){
            	document.getElementById("cy").style.color = "green";
            	
            }else{
            	document.getElementById("cy").style.color = "red";
            }
            console.log("3");
            
            var str_hs300 = hq_str_s_sh000300.split(',');
            
            $("#hs300_value")[0].innerText=str_hs300[1] ;
            $("#hs300_price")[0].innerText=str_hs300[2];
            $("#hs300_rate")[0].innerText=str_hs300[3] + "%";
            if (str_hs300[2] < 0){
            	document.getElementById("hs300").style.color = "green";
            	
            }else{
            	document.getElementById("hs300").style.color = "red";
            }
            console.log("4");
            
            var str_dsj100 = hq_str_s_sz399415.split(',');
            
            $("#dsj100_value")[0].innerText=str_dsj100[1] ;
            $("#dsj100_price")[0].innerText=str_dsj100[2];
            $("#dsj100_rate")[0].innerText=str_dsj100[3] + "%";
            if (str_hs300[2] < 0){
            	document.getElementById("dsj100").style.color = "green";
            	
            }else{
            	document.getElementById("dsj100").style.color = "red";
            }
            console.log("5");
            
            switch (flag) {
			  case 1:
				  var info = hq_str_sh000001;
			    break;
			  case 2:
				  var info = hq_str_sz399001;
			    break;
			  
			  case 3:
				  var info = hq_str_sz399006;
			    break;
			
			}
            var _info_arr = info.split(",")
            console.log(_info_arr[2]);
			mdata.yestclose = _info_arr[2];
            
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
    
}

</script>

<script src="js/jquery-3.3.1.min.js"></script> 
		<script src="js/echarts.min.js" type="text/javascript" charset="utf-8"></script>   
		<script src="js/tmpData.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/k-line.js" type="text/javascript" charset="utf-8"></script>
		<script>   
		        window.code;
		        window.code = "sh000001";
		        var flag = 1;
		        document.getElementById("shm").addEventListener("click", changeSH);
		        document.getElementById("szm").addEventListener("click", changeSZ);
		        document.getElementById("cym").addEventListener("click", changeCY);
		        function changeSH(){
		        	code = "sh000001";
		        	console.log(code);
		        	document.getElementById("ptitle").innerHTML = "上证指数";
		        	getInfo(close);
				    //getmData(drawline);
				    setTimeout(function(){getmData(drawline)}, 600);
		        	flag = 1
		        }
		        
		        function changeSZ(){
		        	code = "sz399001";
		        	console.log(code);
		        	document.getElementById("ptitle").innerHTML = "深圳成指";
		        	getInfo(close);
				    //getmData(drawline);
				    setTimeout(function(){getmData(drawline)}, 600);
		        	flag = 2
		        	
		        }
		       
		        function changeCY(){
		        	code = "sz399006";
		        	console.log(code);
		        	document.getElementById("ptitle").innerHTML = "创业板指";
		        	getInfo(close);
		        	setTimeout(function(){getmData(drawline)}, 600);
				    //getmData(drawline);
		        	flag = 3
		        	
		        }
		        var mdata = {"data": "",
		        		     "yestclose":"" };
				console.log(mdata)
				
				function drawline(data){
					var mChart = echarts.init(document.getElementById('mline'));
					mChart.setOption(initMOption(mdata,'hs'));
					console.log(mdata)
				};
				function close(info){
					
					console.log(info[2]);
					mdata.yestclose = info[2];
				};
				function getInfo(callback){ //获取股票信息
					
					console.log( window.code);
					  $.ajax({
					    url: "http://hq.sinajs.cn/list="+ window.code,
					    dataType: "script",
					    cache: "false",
					    type: "GET",
					    async: false,
					    success: function(){
					    // 结果用 hq_str_sz000001 接收。需要对应请求的股票代码
					      switch (flag) {
						  case 1:
							  var info = hq_str_sh000001;
						    break;
						  case 2:
							  var info = hq_str_sz399001;
						    break;
						  
						  case 3:
							  var info = hq_str_sz399006;
						    break;
						
						}
					      
					      var _info_arr = info.split(",");
					      callback(_info_arr);
					      console.log("!!!!")
					    },
					    error: function(){
					      alert("查询信息失败")
					    }
					  })
				}
				
				function getmData(callback) { //分时图
					
					var code = code;
					$.ajax({
					    url: "http://data.gtimg.cn/flashdata/hushen/minute/"+ window.code+".js?maxage=110&0.28163905744440854",
					    dataType:"script",
					    cache:"false",
					    async: false,
					    type:"GET",
					    success: function () {
					     //结果用min_data接收
					      var msg = min_data;
					      var result = msg.replace(/\n/g,",").split(',')
					      var arr = result.slice(2,result.length-1), //开头结尾各一个空数组要去掉
					      _arr = [];
					      var count = 0;
					      for(var i=0;i<arr.length;i++){ 
					        var _a = arr[i].split(" ") , _b = arr[i].split(" "), _c =[],_d = [];
					        if(i>0){
					          _c = arr[i-1].split(" ");
					        }
					        // 腾讯股票接口传的数值0930（日期） 5.55（成交价） 37673（累计成交量，初始成交量为9:30的）
					        // 因此每分钟的 成交量 = 当前累计成交量 - 前一分钟的累计成交量
					        var sum = (count += Number(_a[1]))/(i+1);
					        _d[2] = sum.toFixed(3)
		                   
					        //_d[2] = ( Number(_b[1])+ Number(_c[1]))/2;
					        if (_c.length == 0){
					        	_b[2] =  _a[2] - 0;
					        	 _d[2] = _b[1];
					        }
					        _b[2] = _c.length>0 ? _a[2] - _c[2] : _a[2];
					        _d[0] = _b[0];    _d[1] = _b[1];      _d[3] = _b[2]; 
					        _arr.push(_d)
					      }
					      mdata.data = _arr;
					      //console.log(mdata.data)
					      callback(mdata);
					      console.log("???")
					    },
					    error: function () {
					      alert("wrong"); 
					    }
					  });
				  }
			      
				$(document).ready(function(){
					getInfo(close);
					setTimeout(function(){getmData(drawline)}, 300);
				    var tg=self.setInterval(function () {
				    	//getInfo(close);
					    getmData(drawline);
				    },1500);//N毫秒刷新一次，单位：毫秒，1000毫秒＝1秒
				    console.log("ddd")
				});
			   
          
			      
		</script>
</body>

</html>