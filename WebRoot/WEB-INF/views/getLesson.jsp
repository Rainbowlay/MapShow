<%@ page language="java" import="java.util.*,com.tianjh.entity.Lesson" contentType="text/html; charset=UTF-8"
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
    
    <title>My JSP 'getLesson.jsp' starting page</title>
    
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
<script type="text/javascript">
	function getId(){
		id=document.getElementById("value").value;
		location.href="lesson/getLesson/"+id;
	}
	function getLesson(){
		var form = document.forms[0];
		form.action = "/lesson-manage/lesson/getLesson";
		form.method="get";
		form.submit();
	}
	function delLesson(){
		var form = document.forms[1];
		form.action = "/lesson-manage/lesson/delLesson";
		form.method="post";
		form.submit();
	}
</script>
  </head>
  <body>
	<!--非RESTFUL提交方式
	<form action="" name="getLessonForm">
		课程编号：<input type="text" name="id">
		<input type="button" value="查找" onclick="getLesson()">
	</form>
	-->
	<table border="1">
			<tr>
				<td>信息编号：<input type="text" name="id" id="value"/></td>
				<td><input type="button" class="button button-black" value="查找" onclick="getId()"/></td>
			</tr>
	</table>
	<table border="1">
   <tr>
   		<td>信息编号</td>
   		<td>经度信息</td>
   		<td>维度信息</td>
   		<td>范围信息</td>
   		<td>时间信息</td>
   		<td>描述信息</td>
   		<td>用户信息</td>
   </tr>
   <%
   Lesson lesson=(Lesson)request.getAttribute("lesson");
   if(null!=lesson){ %>
  		<tr>
  				<td><%=lesson.getId()%></td>
  				<td><%=lesson.getLessonName()%></td>
  				<td><%=lesson.getLessonType()%></td>
  				<td><%=lesson.getLessonUnit()%></td>
  				<td><%=lesson.getTime()%></td>
  				<td><%=lesson.getDescri()%></td>
  				<td><%=lesson.getUserId()%></td>
  				<td><a href="lesson/${lesson.id}/delete" class="button button-black">删除</a></td>			
  		<tr>
  		<% 
   }
   %>
   </table>
   <!-- 非RESTFUL表单提交方式
    <form action="" name="delLessonForm">
		课程编号：<input type="text" name="id">
		<input type="button" value="删除" onClick="delLesson()">
	</form>-->
  </body>
</html>
