<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'visitwriter.jsp' starting page</title>
    
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
		#winfo
		{
			padding-left:30%;
		}
		-->
	</style>
  </head>
  
  <body>
  <%
  	session= request.getSession();
  	Integer wID=(Integer)(session.getAttribute("wID"));
  	String wName=(String)(session.getAttribute("wNAme"));
  	Integer userID=(Integer)(session.getAttribute("userID"));
  	String userName=(String)(session.getAttribute("userNAme"));
  	String sex=(String)(session.getAttribute("sex"));
  	Integer level=(Integer)(session.getAttribute("level"));
  	Integer type=(Integer)(session.getAttribute("type"));
  	String date=(String)(session.getAttribute("date"));
  	String intro=(String)(session.getAttribute("intro"));
  	String password=(String)(session.getAttribute("password"));
  	Integer balance=(Integer)(session.getAttribute("balance"));
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
  	<div id="winfo">
  		<div id="iDiv" class="login">
        		<table id="pi" >
        			<tr>
        				<td><img src="image/female.jpg"></td>
        				<td>
        					<table>
        						<tr>
        							<td>姓名：</td>
        							<td><%=userName %></td>
        						</tr>
        						<tr>
        							<td>性别:</td>
        							<td><%=sex %></td>
        						</tr>
        						<tr>
        							<td>身份：</td>
        							<td><%=type %></td>
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
        			<tr>
        				<td>主要作品</td>
        				<td>
        					<table>
        						<tr>
        							<td>书名&nbsp;&nbsp;</td>
        							<td>字数&nbsp;&nbsp;</td>
        							<td>状态&nbsp;&nbsp;</td>
        							<td>上次修改时间&nbsp;&nbsp;</td>
        							<td>得分&nbsp;&nbsp;</td>
        							<td>评论&nbsp;&nbsp;</td>
        							<td>简介&nbsp;&nbsp;</td>
        						</tr>
        					</table>
        				</td>
        			</tr>
        
        		</table>
        	</div>
  	</div>
  </body>
</html>
