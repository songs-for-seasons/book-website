<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.*"%>
<%@page import="Servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
	<title>接受举报</title>
	<style type="text/css"></style>
	<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">
<% session=request.getSession();
	String content = (String)(session.getAttribute("reason"));
	String title = "";
	String reason = "";
	if(content == null)
		content = "";
	else {
		String array[] = content.split("^");
		title = array[0];
		reason = array[1];
	}
	String itime = (String)(session.getAttribute("itime"));
	if(itime == null)
		itime = "";
	int id = (Integer)(session.getAttribute("id"));
	int mid = (Integer)(session.getAttribute("mid"));
	int bid = (Integer)(session.getAttribute("bid"));
	int itype = (Integer)(session.getAttribute("itype"));
%>

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;<br>
		<a href="login.jsp">退出</a>
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
<br>

<tbody>
	<tr bgcolor="FAC9E4">
		<label>标题：<%=title %></label>
	</tr>
	<tr bgcolor="FAC9E4">
		<label>被举报书籍：<a href="CheckBook?bid=<%=bid %>"><%=bid %></a></label>
	</tr>
	<tr bgcolor="FAC9E4">
		<label>举报人：<a href="CheckUser?userid=<%=id %>"><%=id %></a></label>
	</tr>
	<tr bgcolor="FAC9E4">
		<label>举报理由：</label><br>
		<%=reason %>
	</tr>
</tbody>

<br><br><br><br>
</body>

</html>

