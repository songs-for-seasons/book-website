<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.Books"%>
<%@page import="DAO.Function"%>
<%@page import="Servlet.*" %>

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
<div><label><font size=5 style='position:absolute; left:275px'>【所有书籍】</font></label></div></br>
<table  align="center" width="800">
<form action="ViewBooks" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>作品</td>
		<td>作品</td>
		<td>作品</td>
		<td>作品</td>
	</tr>
	</br>
	
	<%	ArrayList<Books> blist = Function.getBooksList();
		String name[] = new String[4];
		name[0] = "";
		name[1] = "";
		name[2] = "";
		name[3] = "";
		int num = blist.size();
		int i = 0;
		for( ; i + 4<num; i = i+4) { %>
		<tr>
		<td><%=blist.get(i).getBname()%></td>
		<td><%=blist.get(i+1).getBname()%></td>
		<td><%=blist.get(i+2).getBname()%></td>
		<td><%=blist.get(i+3).getBname()%></td>
		<%}%></tr>
		<% while(i < num){
			int index = i % 4;
			name[index] = blist.get(i).getBname();
			i++;
		}%>
		<tr>
		<td><%=name[0] %></td>
		<td><%=name[1] %></td>
		<td><%=name[2] %></td>
		<td><%=name[3] %></td>
		</tr>

</tbody>
</table>
</div>
</br></br></br></br>
</body>

</html>

