<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>举报</title>
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

<div>
	<form action="" method="post" style="margin:0 0 400px 0;">
	<font size=5 style='position:absolute; left:400px'>
		标题：<input class="message_title_field" type="text" name="title"></br></br>
		举报书本：xxxx</br></br>
		举报理由：</br>
		<textarea class="message_field" name="content"></textarea></br></font>
		<div align="center">
			<input id=report_button type="button" value="取消"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id=report_button type="submit" value="发送" />
		</div>
	</form>
</div>


</br></br></br></br>
</body>

<html>
