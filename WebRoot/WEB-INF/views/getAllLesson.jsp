<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getAllLesson.jsp' starting page</title>
    
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
 $(document).ready(function(){ 
    jQuery.ajax({ 
      type: 'GET', 
      contentType: 'application/json', 
      url: 'lesson/getAllLesson', 
      dataType: 'json', 
      success: function(data){ 
          $.each(data, function(index,lesson){ 
             $("#resul").append("<p>"+"id:"+lesson.id+"   ,lng:"+lesson.lessonName+"   ,lat:"+lesson.lessonType+"   ,range:"+lesson.lessonUnit+"   ,time:"+lesson.time+"   ,descri:"+lesson.descri+"   ,userName:"+lesson.userId+"</p>");
          }); 
      }, 
    });
 }); 
</script>
  </head>
  
  <body>
  <span id="resul"></span>
	<!--  <table border="1">
		<tbody>
			<tr>
				<th>信息编号</th>
				<th>维度信息</th>
				<th>经度信息</th>
				<th>时间信息</th>
			</tr>
			<c:if test="${!empty lessonList }">
				<c:forEach items="${lessonList }" var="lesson">
					<tr>
						<td>${lesson.id}</td>
						<td>${lesson.lessonName}</td>
						<td>${lesson.lessonType}</td>
						<td>${lesson.lessonUnit}</td>
					</tr>				
				</c:forEach>
			</c:if>
		</tbody>
	</table> -->
  </body>
</html>
