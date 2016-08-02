<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /> 
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/lesson-manage/resource/style.css" />

	<script type="text/javascript" src="http://localhost:8080/lesson-manage/resource/laci_data.js"></script>
   <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
	<title>添加多个标注点</title>
</head>
<body background="http://localhost:8080/lesson-manage/resource/14.gif">
		<a href="#" class="button button-black">
		<input type="file" value='select file' onchange='readText(this)'  /></a>
		<a href="#" class="button button-black">
		<input type="button" value="显示折线" onclick="showline()"/></a>
		<a href="#" class="button button-black">
		<input type="button" value="NO折线" onclick="noline()"/></a>
		<a href="#" class="button button-black">
		<input type="button" value="NO范围" onclick="norange()"/></a>
		<a href="#" class="button button-black">
		<input type="button" value="显示范围" onclick="range()"/></a>
		&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
		<a href="#" class="button button-black">
		路书功能</a>
		<a href="#" class="button button-black">
		<input type="button" value="开始" onclick="start()"/></a>
		<a href="#" class="button button-black">
		<input type="button" value="暂停" onclick="pause()"/></a>
		<a href="#" class="button button-black">
		<input type="button" value="结束" onclick="stop()"/></a>
	<div id="allmap"></div>
</body>
</html>
