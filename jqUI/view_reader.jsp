<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.Writer"%>
<%@page import="DAO.Reader"%>
<%@page import="DAO.Function"%>
<%@page import="Servlet.*" %>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
	<title>查看用户</title>
	<style type="text/css"></style>
	<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">
 <%
  	session=request.getSession();
  	String username=(String)(session.getAttribute("username"));
  	if(username == null)
  		username = "";
  	Integer userID=(Integer)(session.getAttribute("userid"));
  	String sex=(String)(session.getAttribute("sex"));
  	if(sex == null)
  		sex = "";
  	Integer level=(Integer)(session.getAttribute("level"));
  	Integer type=(Integer)(session.getAttribute("level"));
  	String date=(String)(session.getAttribute("birthday"));
  	if(date == null) 
  		date = "";
  	String intro=(String)(session.getAttribute("intro"));
  	if(intro == null)
  		intro = "";
  	String password=(String)(session.getAttribute("password"));
  	Integer balance=(Integer)(session.getAttribute("balance"));
 %>
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
<br><br>

<div id="iDiv">
	<table>
		<tr>
			<td><img src="image/female.jpg"></td>
      		<td>
				<table class="pi">
					<tr>
						<td>姓名：</td>
	        			<td><%=username %></td>
	       			</tr>
	       			<tr>
	        			<td>性别:</td>
	        			<td><%=sex %></td>
	        		</tr>
	        		<tr>
	        			<td>等级：</td>
	        			<td><%=level %></td>
	        		</tr>
	        		<tr>
	        			<td>生日：</td>
	        			<td><%=date %></td>
	        		</tr>
	        		<tr>
	        			<td>个人简介：</td>
	        			<td><%=intro %></td>
	       			</tr>
	       		</table>
        	</td>
        </tr>
	</table>
</div>

<br><br><br><br>
</body>

</html>

