<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<html>  
  <head>  
    <title>测试</title> 
    <head>
	<link rel="stylesheet" type="text/css" href="${basePaht}/SSM_Maven5/jquery-easyui-1.4.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${basePaht}/SSM_Maven5/jquery-easyui-1.4.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${basePaht}/SSM_Maven5/jquery-easyui-1.4.5/demo.css">
	<script type="text/javascript" src="${basePaht}/SSM_Maven5/jquery-easyui-1.4.5/jquery.min.js"></script>
	<script type="text/javascript" src="${basePaht}/SSM_Maven5/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
</head> 
  </head>  
  <%--   <script type="text/javascript" src="${basePaht}/SSM_Maven5/js/jquery.min.js">	</script> --%>
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
    
    function qq(value){ 
     alert(value);
        $('#da').datagrid({ 
        	 url:"selectLike/"+value+".do"
        } );
    	} 
    function del(){
    	var rows=$('#da').datagrid('getSelected');
        $.ajax({
            type:"POST",
            url:"delById/"+rows.id+".do",
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
    <br>
    <input id="ss" class="easyui-searchbox" style="width:300px" 
data-options="searcher:qq"></input> 

<a href="#" class="easyui-linkbutton" data-options=""   
        onclick="del()">删除</a>  
    <table id="da" class="easyui-datagrid" style="width:400px;height:250px"   
        data-options="url:'selectAll.do',fitColumns:true,singleSelect:true">   
    <thead>   
        <tr>   
            <th data-options="field:'userName',width:100">用户名</th>   
            <th data-options="field:'password',width:100">密码</th>   
            <th data-options="field:'age',width:100,align:'right'">年龄</th>   
        </tr>   
    </thead>   
</table>  
    
  </body>  
</html>  