<!--
说明：股票看盘
作者：黑桃A
时间：2014-04-14
参考：

http://www.lxway.com/240649562.htm
http://www.lxway.com/946486042.htm
http://www.365mini.com/page/jquery_getscript.htm
http://blog.csdn.net/xxjoy_777/article/details/40304935
http://www.jb51.net/article/54253.htm

-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        div{
            height: 20px;
            widows: 20px;
            font-size: 26px;
            font-weight: bold;
        }
    </style>
    
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    
</head>
<body>
    <div id="res"></div><br /><br /><br />
    <div id="div1">
        HELLO WORLD0
    </div>
    <div id="div2">
        HELLO WORLD2
    </div>
    <br />
    <button id="btn">click me</button><br /><br />
    

    <script type="text/javascript">
    
    function pageInit(){ //此方法需要在body中增加如下代码：<body onLoad="pageInit();"> 
        //window.setInterval("ajaxRequest()",3000);  //设置定时调用ajax的方法，单位：毫秒，1000毫秒＝1秒
    } 
    
    $(document).ready(function(){
        var url = "http://hq.sinajs.cn/list=sh601006,sh601939,sh600016";   //返回 var hq_str_sh601006="xxxxxxx" 的形式数据。
        //url="http://api.money.126.net/data/feed/1000002,1000001,1000881,money.api";  //返回  _ntes_quote_callback({xxxx}); 的形式数据。
        //url="http://flashquote.stock.hexun.com/Stock_Combo.ASPX?mc=1_600804&dt=T";   //返回  refreshData(xxxxxxx) 的形式数据。
        getNewData(url);
        var tg=self.setInterval("getNewData('"+url+"')",2000);//N毫秒刷新一次，单位：毫秒，1000毫秒＝1秒
        console.log("ddd")
    });

    //获取新数据
    function getNewData(url)
    {
        var durl=url//+"&t="+Math.random();
        
        //方式一：通过ajax的方式获取数据
        $.ajax({  
            cache : true,  
            url:url,
            type: 'GET', 
            dataType: 'script', 
            timeout: 2000, 
            success: function(data, textStatus, jqXHR){ 
                var str = data;
                str = hq_str_sh600016.split(',');
                $("#res")[0].innerText=str[30]+" "+str[31]+" ajax";
                console.log("fafafaf");
                
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
    
    function _ntes_quote_callback(data)
    {
        $("#res")[0].innerText=data[1000002].time +" callback";
    }
    

    //document.getElementById('btn').addEventListener('click', t1);
     
    </script>
</body>
</html>