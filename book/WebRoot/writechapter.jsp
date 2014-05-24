<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@page import="Servlet.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bhomepage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		<!--
		#logo
			{
				padding-right:50%;
				padding-left:10px;
				float:left
			}
		#info
			{
				padding-left:60%;
				padding-right :10px;
				padding-top:-10px;
				
			}
		#show
		{
			margin:0 auto;
		}
		#table1
		{
			padding-left:50px;
			padding-top:30px;
			margin:0 auto;
		}
		-->
	</style>
	<script type="text/javascript">
		function checkform(theform)
		{
			if(theform.ctitle.value.length>20)
  			{
  				alert("标题不得超过20字");
  				theform.password.focus();
  				return false;
 			}
			return true;
		}
	</script>
  </head>
  
  <body>
  <%
  	session=request.getSession();
  	String userName=(String)(session.getAttribute("userName"));
  	Integer userID=(Integer)(session.getAttribute("userID"));
  	Integer bID=(Integer)(session.getAttribute("bID"));
	String bName=(String)(session.getAttribute("bName"));
   %>
    <div id="top">
  		<div id="logo"><img src="image/logo.jpg" height=40px width=200px></div>
  		<div id="info">
  			<table width="400px">
  				<tr>
  					<td>欢迎回来：<a href="personalpage.jsp?userID=<%=userID%>&userName=<%=userName%>"><%=userName %></a></td>
  					<td><a href="login.jsp">退出</a></td>
  				</tr>
  				<tr>
  					<td><a href="help.jsp">新手导航</a></td>
  					<td><a href="">个人书屋</a></td>
  					<td><a href="charge.jsp">充值</a></td>
  				</tr>
  			</table>
  		</div>
  	</div>
  	<br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#ff0080 SIZE=3>
  	<div id="show">
  		<form id="form1" method="post" action="NewChapter">
  			<table width="800px" id="table1">
  				<tr>
  					<td colspan=2>书名：<a href="bhomepage.jsp?bid=<%=bID%>"><%=bName %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr>
  					<td>标题：</td>
  					<td><input type="text" id="ctitle" name="ctitle">(标题不得超过20字)</td>
  				</tr>
  				<tr>
  					<td>正文：</td>
  					<td><textarea rows="20" cols="80" name="content"></textarea></td>
  				</tr>
  			</table>
  			<div align="center">
  				<button type="submit" onclick="checkform(form1)">提交</button>
  			</div>
  		</form>
  	
  	</div>
  </body>
</html>
