<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.Informing"%>
<%@page import="DAO.Function"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>接收举报</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="main.html">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;</br>
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
</br>

<div>
<table align="center" width="800">
<form action="" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>编号</td>
		<td>发送日期</td>
		<td>发信人</td>
		<td>标题</td>
	</tr>
	</br>
		<tr>
		<td>1</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<%	ArrayList<Informing> ilist = Function.getInformingList();
		
		String name[] = new String[4];
		int num = ilist.size();
		int i = 0;
		for( ; i<num; i = i++) { %>
		<tr bgcolor="FAC9E4">
		<td><%=ilist.get(i).getMid()%></td>
		<td><%=ilist.get(i).getTime()%></td>
		<td><%=ilist.get(i).getId()%></td>
		<td><%=Function.getTitle(ilist.get(i).getReason())%></td>
		<%}%></tr>
	
</tbody>
</table>
</div>

</br></br></br></br>
</body>

<html>

