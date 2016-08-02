<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addLesson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
//	function addLesson(){
//		var form = document.forms[0];
//		form.action = "/lesson-manage/lesson/addLesson";
//		form.method="post";
//	form.submit();
//	}
$(document).ready(function(){ 
    $("#addLesson").click(function(){
     var id = $("#id").val(); 
	 var lessonName = $("#lessonName").val(); 
	 var lessonType = $("#lessonType").val(); 
	 var lessonUnit = $("#lessonUnit").val(); 
	 var time = $("#time").val(); 
	 var descri = $("#descri").val(); 
	 var userId = $("#userId").val(); 
     var lesson = {"id":id,"lessonName":lessonName,"lessonType":lessonType,"lessonUnit":lessonUnit,"time":time,"descri":descri,"userId":userId};
         $.ajax({ 
             url:"lesson/addLesson", 
             type:"post", 
             contentType: "application/json",
             data:JSON.stringify(lesson), 
             success:function(data,status){ 
             alert(data.userName);
             $("#resul").html("id:"+data.id+"   ,userName:"+data.userName); },
			 error:function(){alert("error");},
         });
    });
});
</script>
  </head>
  
  <body background="http://localhost:8080/lesson-manage/resource/14.gif">
  <h1>添加信息</h1>
  <!--非RESTFUL表单提交
	<form action="" name="lessonForm">
		课程编号：<input type="text" name="id">
		课程名称：<input type="text" name="lessonName">
		课程类型：<input type="text" name="lessonType">
		课程单位：<input type="text" name="lessonUnit">
		<input type="button" value="添加" onclick="addLesson()">
	</form>
	-->
	
	<form action="" name="lessonForm">
		信息编号：<input type="text" name="id" id="id">
		维度信息：<input type="text" name="lessonName" id="lessonName">
		经度信息：<input type="text" name="lessonType" id="lessonType">
		范围信息：<input type="text" name="lessonUnit" id="lessonUnit">
		时间信息：<input type="text" name="time" id="time">
		描述信息：<input type="text" name="descri" id="descri">
		用户信息：<input type="text" name="userId" id="userId">
        <input type="button" value="添加" id="addLesson" />
    </form>
    结果:<span id="resul"></span>
  </body>
</html>
