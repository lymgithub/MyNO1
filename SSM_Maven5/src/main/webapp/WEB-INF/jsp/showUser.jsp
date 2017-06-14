<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<html>  
  <head>  
    <title>测试</title>  
  </head>  
    <script type="text/javascript" src="${basePaht}/SSM_Maven5/js/jquery.min.js">	</script>
    <script type="text/javascript">
    function commit(){
    var list=new Array();
    for (var int = 0; int < 10; int++) {
		 var obj=new Object();
		 obj.id=int;
		 obj.userName="li"+int;
		 obj.age=88;
		 list.push(obj);
	}
    alert("提交");
    $.ajax({
    type:"POST",
    url:"arr.do",
    data:JSON.stringify(list),
    contentType : 'application/json;charset=utf-8', //设置请求头信息
    success:function(data){
    alert(data);
    }
    });
    }
    </script>
  <body>  
    ${user.userName}  <br>
    <a onclick="commit()">提交数组</a>
  </body>  
</html>  