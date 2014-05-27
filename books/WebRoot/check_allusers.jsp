<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.Writer"%>
<%@page import="DAO.Reader"%>
<%@page import="DAO.Function"%>
<%@page import="Servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
	<title>查看用户</title>
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
<br>

<div>
<div><label><font size=5 style='position:absolute; left:275px'>【所有读者】</font></label></div><br>
<table align="center" width="800">
<form action="ViewUsers" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>读者</td>
		<td>读者</td>
		<td>读者</td>
		<td>读者</td>
	</tr>
	<br>
	<%	ArrayList<Reader> rlist = Function.getReaderList();
		String name[] = new String[4];
		name[0] = "";
		name[1] = "";
		name[2] = "";
		name[3] = "";
		int num = rlist.size();
		int i = 0;
		for( ; i + 4<num; i = i+4) { %>
		<tr>
		<td><%=rlist.get(i).getRname()%></td>
		<td><%=rlist.get(i+1).getRname()%></td>
		<td><%=rlist.get(i+2).getRname()%></td>
		<td><%=rlist.get(i+3).getRname()%></td>
		<%}%></tr>
		<% while(i < num){
			int index = i % 4;
			name[index] = rlist.get(i).getRname();
			i++;
		}%>
		<tr>
		<td><%=name[0] %></td>
		<td><%=name[1] %></td>
		<td><%=name[2] %></td>
		<td><%=name[3] %></td>
		</tr>
</tbody>
</table><br><br><br>
</div>
<div>
<div><label><font size=5 style='position:absolute; left:275px'>【所有作家】</font></label></div><br>
<table  align="center" width="800">
<form action="ViewUsers" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>作家</td>
		<td>作家</td>
		<td>作家</td>
		<td>作家</td>
	</tr>
	<br>
	<%	ArrayList<Writer> wlist = Function.getWriterList();
		System.out.print(rlist.size());
		name[0] = "";
		name[1] = "";
		name[2] = "";
		name[3] = "";
		num = wlist.size();
		i = 0;
		for(; i + 4<num; i += 4) { %>
		<tr>
		<td><%=wlist.get(i).getWname()%></td>
		<td><%= wlist.get(i+1).getWname()%></td>
		<td><%= wlist.get(i+2).getWname()%></td>
		<td><%= wlist.get(i+3).getWname()%></td>
		</tr>
		<%}%>
		<% while(i < num){
			int index = i % 4;
			name[index] = wlist.get(i).getWname();
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

<br><br><br><br>
</body>

</html>

