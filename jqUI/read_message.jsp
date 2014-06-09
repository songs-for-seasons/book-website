<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.Informing"%>
<%@page import="DAO.Function"%>
<%@page import="Servlet.*" %>

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
<table class="wid" align="center" width="800">
<form action="ReadMessage" method="post">
	<tbody>
		<tr bgcolor="F8B6DA">
			<td width="10%">编号</td>
			<td width="30%">发送日期</td>
			<td width="20%">发信人</td>
			<td width="50%">标题</td>
		</tr>
		</br>
		<%	ArrayList<Informing> ilist = Function.getInformingList();
			
			String name[] = new String[4];
			int num = ilist.size();
			int i = 0;
			for( ; i<num; i++) { %>
			<tr bgcolor="FAC9E4">
			<td><%=ilist.get(i).getMid()%></td>
			<td><%=ilist.get(i).getTime()%></td>
			<td><a href="CheckUser?userid=<%=ilist.get(i).getId() %>"><%=ilist.get(i).getId()%></a></td>
			<td><a href="CheckMessage?mid=<%=ilist.get(i).getMid() %>&userid=<%=ilist.get(i).getId() %>"><%=Function.getTitle(ilist.get(i).getReason())%></a></td>
			<%}%></tr>
	</tbody>
</form>
</table>
</div>

</br></br></br></br>
</body>

<html>

