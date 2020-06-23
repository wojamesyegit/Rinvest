function GetRadioValue(RadioName){  
    var obj;      
    obj=document.getElementsByName(RadioName);  
    if(obj!=null){  
        var i;  
        for(i=0;i<obj.length;i++){  
            if(obj[i].checked){  
                return obj[i].value;              
            }  
        }  
    }  
    return null;  
}




function gosearch(){
	    var RValue;  
	    RValue=GetRadioValue("search_type"); 
	    var formObj=document.form_search;
	    var keyword = formObj.word.value;
	    
	    
	    if(RValue == "baidu"){
	    	var durl_1 = "http://www.baidu.com/s?wd="+ keyword +"&cl=3";
	    	window.open(durl_1);
	    	console.log(durl_1);
	    }else{
	    	
	    	var durl_2 = "searchpage.jsp?wd="+ keyword ;
	    	window.open(durl_2);
	    	console.log(durl_2);
	    	
	    }
	    
	    
	    
	    
	   
	    //window.navigate(durl);
	    //window.location.href=durl;
	    
 }


function add_like(){
	var local_code = window.code;
	var local_name = window.name;
	var durl = "LikeServlet?code="+ local_code + "&name=" + local_name ;
	alert(local_name);
	window.open(durl);
	console.log(durl);
	
	
}

 
 