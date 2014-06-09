<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@page import="Servlet.*" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<div><label><font size=5 style='position:absolute; left:275px'>【所有读者】</font></label></div><br><br>
<table class="wid" align="center" width="700">
<form action="CheckUser" method="post" name="checkuser">
	<tbody>
		<tr bgcolor="F8B6DA">
			<td width="15%"><b>读者ID</b></td>
			<td width="35%"><b>读者名称</b></td>
			<td width="50%"><b>读者简介</b></td>
		</tr>
		<%	ArrayList<Reader> rlist = Function.getReaderList();
			int num = rlist.size();
			int i = 0;
			for( ; i<num; i++) {
				String rname = rlist.get(i).getRname();
				if(rname == null) 
					rname="";
				String rintro = rlist.get(i).getRintro();
					if(rintro == null)
						rintro = "";%>
				<tr bgcolor="FAC9E4">
				<td><%=rlist.get(i).getRid() %></td>
				<td><a href="CheckUser?userid=<%=rlist.get(i).getRid() %>&username=<%=rname%>"><%=rname %></a></td>
				<td><%=rintro %></td>
			<%}%></tr>
	</tbody>
</form>
</table><br><br><br>
</div>

<div>
<div><label><font size=5 style='position:absolute; left:275px'>【所有作家】</font></label></div><br><br>
<table class="wid" align="center" width="700">
<form action="CheckUser" method="post">
	<tbody>
		<tr bgcolor="F8B6DA">
			<td width="15%"><b>读者ID</b></td>
			<td width="35%"><b>读者名称</b></td>
			<td width="50%"><b>读者简介</b></td>
		</tr>
		<%	ArrayList<Writer> wlist = Function.getWriterList();
			num = wlist.size();
			i = 0;
			for( ; i<num; i++) { 
				String wname = wlist.get(i).getWname();
				if(wname == null) 
					wname="";
				String wintro = wlist.get(i).getWintro();
					if(wintro == null)
						wintro = "";%>
				<tr bgcolor="FAC9E4">
				<td><%=wlist.get(i).getWid() %></td>
				<td><a href="CheckUser?userid=<%=wlist.get(i).getWid() %>&username=<%=wname%>"><%=wname %></a></td>
				<td><%=wintro %></td>
			<%}%></tr>
	</tbody>
</form>
</table>
</div>

<br><br><br><br>
</body>

</html>

