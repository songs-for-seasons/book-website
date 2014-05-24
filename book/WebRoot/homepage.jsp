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
    
    <title>My JSP 'homepage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="css/jquery.slideBox.css" />
	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.slideBox.js" type="text/javascript"></script>
	<script>
	jQuery(function($){
		$('#recommandinstation').slideBox({
			 duration : 0.3,//滚动持续时间，单位：秒
			easing : 'linear',//swing,linear//滚动特效
			 delay : 5,//滚动延迟时间，单位：秒
			hideClickBar : false,//不自动隐藏点选按键
			clickBarRadius : 10
		});
	});
	function fsubmit(obj)
	{
		obj.submit();
	}
	</script>
	<style type="text/css">
		<!--
			#logo
			{
				padding-right:50%;
				padding-left:10px;
				float:left
			}
			#info1,#info2
			{
				padding-left:60%;
				padding-right :10px;
				padding-top:-10px;
				
			}
			#recommandinstation
			{
				margin:0 auto;
			}
			#wrank
			{
				width:400px;
				float:left;
					
			}
			#brank
			{
				width:400px;
				float:right;
				
			}
			h2
			{
				float:left;
			}
			td,li
			{
				text-align:center;	
			}
		
		-->
	</style>
</head>
  
  <body>
  <%
  	session=request.getSession();
  	Integer userID=(Integer)(session.getAttribute("userid"));
  	//String userID=(String)(session.getAttribute("userID"));
  	String username=(String)(session.getAttribute("username"));	
   %>
   
   <script type="text/javascript">
   	window.onload=function()
   	{
   		change();
  	};
  	function change()
  	{
  		
   		if(<%=userID%>==null)
   		{
   			
   			document.getElementById("info2").style.display='block';
   			document.getElementById("info1").style.display='none';
   		}
   		else
   		{
   			document.getElementById("info2").style.display='none';
   			document.getElementById("info1").style.display='block';
   		}
  	};
  	
   </script>
  	
  	<div id="top">
  		<div id="logo"><img src="image/logo.jpg" height=40px width=200px></div>
  		<div id="info1">
  			<table width="400px" style="display:block">
  				<tr>
  					<td>欢迎回来：<a href="PersonalPage?userid=<%=userID%>&username=<%=username%>"><%=username %></a></td>
  					<td><a href="login.jsp">退出</a></td>
  				</tr>
  				<tr>
  					<td><a href="help.jsp">新手导航</a></td>
  					<td><a href="">个人书屋</a></td>
  					<td><a href="charge.jsp">充值</a></td>
  				</tr>
  			</table>
  		</div>
  		<div id="info2" style="display:block">
  			<table width="400px">
  				<tr>
  					<td><a href="login.jsp">登录</a></td>
  					<td><a href="register.jsp">注册</a></td>
  					<td><a href="help.jsp">新手导航</a></td>
  				</tr>
  			</table>
  		</div>
  	</div>
  	<br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#ff0080 SIZE=3>
 
  	<div id="rec">
  	<fieldset>
  	<legend>全站推荐</legend>
  	<%
  				BooksDAO b= new BooksDAO();
  				ArrayList<Books> list=b.top(5);
  				
  				WriterDAO w=new WriterDAO();
  	 %>
  	<div id="recommandinstation" class="slideBox">
  		<ul class="items">
  			<%	for(int i=0;i<5;i++)
  				{%>
  					<li>	
  					<table>
  						<tr>
  							<td><a href="bhomepage.jsp?username=<%=username%>&bid=<%=list.get(i).getBid()%>"><img src="image/<%=list.get(i).getType() %>.jpg" height=150px></a></td>
  							<td>
  							<table>
  								<tr>
  									<td>书名：<%=list.get(i).getBname() %></td>
  									</tr>
  								<tr>
  									<td>作者：<%=w.select(list.get(i).getWid()).getWname() %></td>
  								</tr>
  								<tr>
  									<td>书籍简介<%=list.get(i).getBintro() %>：</td>
  								</tr>
  							</table>
  							</td>
  						</tr>
  					</table>
  					</li> 
  			<% }%>
  			<%System.out.println("out for"); %>
  		</ul>
  	</div>
  	</fieldset>
  	</div>
  	<br>
  	<div id="search" style="display:inline">
  	<form method="post" action="Search" name="form1">
  		<table>
  			<tr>
 				<td><h2>搜索：</h2></td>
  				<td><input type="text"></td>
  				<td><input type="image" src="image/search.gif" onClick="fsubmit(form1)" height="40px"></td>
  			</tr>
  		</table>
  	</form>
  	</div>
  	<div id="recommandforperson">
  		<fieldset>
  		<legend>个性推荐</legend>
  		<table width="1000px">
  			<tr>
  				<td><a href="bhomepage.jsp"><img src="image/1.jpg" height="150px" width="100px"></a></td>
  				<td><a href="bhomepage.jsp"><img src="image/2.jpg" height="150px"  width="100px"></a></td>
  				<td><a href="bhomepage.jsp"><img src="image/3.jpg" height="150px"  width="100px"></a></td>
  				<td><a href="bhomepage.jsp"><img src="image/4.jpg" height="150px"  width="100px"></a></td>
  				<td><a href="bhomepage.jsp"><img src="image/5.jpg" height="150px"  width="100px"></a></td>
  			</tr>
  			<tr>
  				<td>书名：XXX</td>
  				<td>书名：XXX</td>
  				<td>书名：XXX</td>
  				<td>书名：XXX</td>
  				<td>书名：XXX</td>
  		</table>
  		</fieldset>
  	</div>
  	<br>
  	<div id="board">
  		<div id="wrank">
  			<fieldset>
  				<legend>作家排行</legend>
  				<ol>
  					<% 	WriterDAO wr=new WriterDAO();
  						ArrayList<Writer> list2=wr.top(10);
  						for(int i=0;i<10;i++)
  						{ %>
  							<li><a href="visitwriter.jsp?userID=<%=userID%>&wid=<%=list2.get(i).getWid()%>"><%=list2.get(i).getWname() %></a></li>
  					  <%} %>
  				</ol>
  			</fieldset>
  		</div>
  		<div id="brank">
  			<fieldset>
  				<legend>作品排行</legend>
  				<ol>
  					<% 	
  						ArrayList<Books> list3=b.top(10);
  						for(int i=0;i<10;i++)
  						{ %>
  							<li><a href="BookPage?userID=<%=userID%>&bid=<%=list3.get(i).getBid()%>"><%=list3.get(i).getBname() %></a></li>
  					  <%} %>
  				</ol>
  			</fieldset>
  		</div>
  	</div>
  </body>
</html>
