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
		#info1
		{
				padding-left:60%;
				padding-right :10px;
				padding-top:-10px;
				
			}
		#winfo
		{
			padding-left:30%;
		}
		.pi
		{
			font-size:20px;
		}
		#big,#big2
		{
			width:500px;
		}
		-->
	</style>
  </head>
  
  <body background="image/background.jpg" alt="background" sroll="auto">
  <%
  	session= request.getSession();
  	Integer wID=(Integer)(session.getAttribute("wID"));
  	String wName=(String)(session.getAttribute("wname"));
  	Integer userID=(Integer)(session.getAttribute("userID"));
  	String userName=(String)(session.getAttribute("username"));
  	String sex=(String)(session.getAttribute("sex"));
  	Integer level=(Integer)(session.getAttribute("level"));
  	Integer type=(Integer)(session.getAttribute("type"));
  	String date=(String)(session.getAttribute("date"));
  	String intro=(String)(session.getAttribute("intro"));
  	String password=(String)(session.getAttribute("password"));
  	Integer balance=(Integer)(session.getAttribute("balance"));
   %>
   <div id="top">
  		<table>
  		<tr>
  			<td>
  		<div id="logo" style="padding-left:150px; "><a href="homepage.jsp?userID=<%=userID %>&userName=<%=userName %>"><img src="image/logo.png" alt="logo" width="300" height="100"></a></div></td>
  			<td>
  		<div id="info1">
  			<table width="400px" style="display:block">
  				<tr>
  					<td>欢迎回来：<a href="PersonalPage?userid=<%=userID%>&username=<%=userName%>"><%=userName %></a></td>
  					<td><a href="login.jsp">退出</a></td>
  				</tr>
  				<tr>
  					<td><a href="help.jsp">新手导航</a></td>
  					<td><a href="">个人书屋</a></td>
  					<td><a href="charge.jsp?uid=<%=userID%>">充值</a></td>
  				</tr>
  			</table>
  		</div>
  			</td>
  			</tr>
  		</table>
  	</div>
  	<br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="70%" color=#ff0080 SIZE=3>
  	<br>
  	<br>
  	<div id="winfo">
  		<div id="iDiv" class="login">
        		<table class="pi" >
        			<tr>
        				<td><img src="image/female.jpg"></td>
        				<td>
        					<table class="pi">
        						<tr>
        							<td>姓名：</td>
        							<td><%=wName %></td>
        						</tr>
        						<tr>
        							<td>性别:</td>
        							<td><%=sex %></td>
        						</tr>
        						<tr>
        							<td>身份：</td>
        							<td>作家</td>
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
        		<br>
        		<br>
        		<table class="pi" id="big2">
        			
        			<tr>
        				<td>主要作品</td>
        			</tr>
        			<tr>
        				<td>
        					<table class="pi" id="big">
        						<tr>
        							<td>书名&nbsp;&nbsp;</td>
        							<td>字数&nbsp;&nbsp;</td>
        							<td>状态&nbsp;&nbsp;</td>
        							<td>得分&nbsp;&nbsp;</td>
        							<td>评论&nbsp;&nbsp;</td>
        							<td>简介&nbsp;&nbsp;</td>
        						</tr>
        						<% BooksDAO b = new BooksDAO();
        							ArrayList<Books> list= b.selectid(wID);
        							System.out.println("size:");
        							System.out.println(list.size());
        							for(int i=0;i<list.size();i++)
        							{
        						 %>
        						 	<tr>
        						 		<td><a href="BookPage?userid=<%=userID%>&bid=<%=list.get(i).getBid()%>"><%=list.get(i).getBname() %></a></td>
        						 		<td><%=list.get(i).getWords() %></td>
        						 		<%if(list.get(i).getIsfinished()==0)
        						 		{ %>
        						 			<td>连载中</td>
        						 		<%} %>
        						 		<%if(list.get(i).getIsfinished()==1)
        						 		{ %>
        						 			<td>已完结</td>
        						 		<%} %>	
        						 		<td><%=list.get(i).getBgrade()  %></td>
        						 		<td><%=list.get(i).getRemark() %></td>
        						 		<td><%=list.get(i).getBintro() %></td>
        						 	</tr>
        						 <%} %>
        					</table>
        				</td>
        			</tr>
        
        		</table>
        	</div>
  	</div>
  </body>
</html>
