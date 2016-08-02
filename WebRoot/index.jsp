<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /> 
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/lesson-manage/resource/style.css" />
  </head>
  
  <body background="http://localhost:8080/lesson-manage/resource/14.gif">
  <h4><a href="lesson/toGetAllLesson" class="button button-black">所有信息</a></h4>
  <h4><a href="lesson/toAddLesson" class="button button-black">添加信息</a></h4>
  <h4><a href="lesson/toGetLesson" class="button button-black">查找删除</a></h4>
  <h4><a href="lesson/toShow" class="button button-black">可视化显示</a></h4>
  </body>
</html>
