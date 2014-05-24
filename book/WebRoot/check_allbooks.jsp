<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>查看书籍</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;
		</label>
	</p>
</div>

<div id="menu" class="menu">
<ul>
	<li><a href="check_allusers.jsp">所有用户</a></li>
	<li><a href="check_allbooks.jsp">所有书籍</a></li>
	<li><a href="send_notice.jsp">发送公告</a></li>
	<li><a href="read_message.jsp">接收举报</a></li>
</ul>
</div>
</br>

<div>
<div><label><font size=5 style='position:absolute; left:275px'>【所有书籍】</font><label></div></br>
<table  align="center" width="800">
<form action="" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>作品</td>
		<td>作品</td>
		<td>作品</td>
		<td>作品</td>
	</tr>
	</br>
	<tr>
		<td><a href="book_info.html">book1</a></td>
		<td><a href="book_info.html">book2</a></td>
		<td><a href="book_info.html">book3</a></td>
		<td><a href="book_info.html">book4</a></td>
	</tr>
	<tr>
		<td><a href="book_info.html">book1</a></td>
		<td><a href="book_info.html">book2</a></td>
		<td><a href="book_info.html">book3</a></td>
		<td><a href="book_info.html">book4</a></td>
	</tr>

</tbody>
</table>
</div>
</br></br></br></br>
</body>

<html>

