<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>充值</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
	</p>
</div>

<div id="menu" class="menu">
<ul>
	<li><a href="message.jsp">修改个人信息</a></li>
	<li><a href="message.jsp">个人书屋</a></li>
	<li><a href="charge.jsp">充值</a></li>
	<li><a href="consume_record.jsp">消费记录</a></li>
</ul>
</div>
</br>

<div align="center">
	</br>
	<form action="" method="post" style="margin:0 0 0 0;">
		<label><font size=5>充值的四季豆数量：<input class="charge_field" type="text" name="userid"/></font>
		</label></br></br>
		<button id=reg_button type="button" onclick="">取消</button>&nbsp;&nbsp;&nbsp;
		<button id=reg_button type="button" onclick="">确定</button>
	</form>
</br></br></br>
</div>

</br></br></br></br>
</body>

<html>

