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
<br>

<div>
<div><label><font size=5 style='position:absolute; left:275px'>【所有书籍】</font></label></div><br><br>
<table class="wid" align="center" width="800" >
<form action="ViewBooks" method="post">
	<tbody>
		<tr bgcolor="F8B6DA">
			<td width="12%"><b>书籍ID</b></td>
			<td width="30%"><b>书籍名称</b></td>
			<td width="12%"><b>作家ID</b></td>
			<td width="46%"><b>简介</b></td>
		</tr>
		
		<%	ArrayList<Books> blist = Function.getBooksList();
			String name[] = new String[4];
			int num = blist.size();
			int i = 0;
			for( ; i<num; i++) {
				String bname = blist.get(i).getBname();
				if(bname == null) 
					bname="";
				String bwid;
				String bintro = blist.get(i).getBintro();
				if(bintro == null)
					bintro = "";%>
				<tr bgcolor="FAC9E4">
				<td><%=blist.get(i).getBid() %></td>
				<td><a href="CheckBook?bid=<%=blist.get(i).getBid() %>"><%=bname %></a></td>
				<td><a href="CheckUser?userid=<%=blist.get(i).getWid() %>"><%=blist.get(i).getWid() %></a></td>
				<td><%=bintro %></td>
			<%}%></tr>
	</tbody>
</form>
</table>
</div>
</br></br></br></br>
</body>

</html>

