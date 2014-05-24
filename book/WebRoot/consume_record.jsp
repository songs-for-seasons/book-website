<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>消费记录</title>
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
	<li><a href="personalpage.jsp">修改个人信息</a></li>
	<li><a href="personalpage.jsp">个人书屋</a></li>
	<li><a href="charge.jsp">充值</a></li>
	<li><a href="consume_record.jsp">消费记录</a></li>
</ul>
</div>
</br>

<div>
<table align="center" width="800">
<form action="" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>消费时间</td>
		<td>消费类型</td>
		<td>消费四季豆</td>
		<td>剩余四季豆</td>
	</tr>
	</br>
	<tr>
		<td>2013.1.1</td>
		<td>支付</td>
		<td>3</td>
		<td>100</td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>2013.1.2</td>
		<td>收入</td>
		<td>30</td>
		<td>1030</td>
	</tr>
	<tr>
		<td>2013.1.1</td>
		<td>支付</td>
		<td>3</td>
		<td>100</td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>2013.1.2</td>
		<td>收入</td>
		<td>30</td>
		<td>1030</td>
	</tr>
	<tr>
		<td>2013.1.1</td>
		<td>支付</td>
		<td>3</td>
		<td>100</td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>2013.1.2</td>
		<td>收入</td>
		<td>30</td>
		<td>1030</td>
	</tr>

</tbody>
</table>
</div>


</br></br></br></br>
</body>

<html>

