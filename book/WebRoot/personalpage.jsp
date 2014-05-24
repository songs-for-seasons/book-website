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
    
    <title>My JSP 'personalpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="css/styles.css" >
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
		.right
		{
			margin-top:20px;
			float:left;
		}
		.login 
		{ 
			margin:0 auto;
			width:1000px; 
			height:500px; 
			border:1px solid #D1D1D1; 
			background-color:#ff79bc; 
		}
		.tag 
		{ 
			width:1000px; 
			height:29px; 
			line-height:29px; 
		}
		.tag td 
		{ 
			width:250px; 
			height:29px; 
			line-height:29px; 
			float:left; 
			text-align:center; 
			
			background-color:#ff0080;
		}
		.tag td.on 
		{ 
			width:250px; 
			height:29px; 
			line-height:29px; 
			float:left; 
			text-align:center; 
			
			background-color:#ff79bc;
		}
		.shows
		{
			margin:0 auto;
			padding-top:-10px;
		}
		.regContainer
		{
			margin:0 auto;
			width:1000px;
			height:701px;
			border:1px solid #D1D1D1; 
			background-color:#ff79bc;
		}
		.regContainer p
		{
			font-family:"宋体";
			font-size:40px;
		}
		#pi
		{
			margin:0 auto;
			padding-top:20px;
			font-size:40px;
			height:200px;
			width:400px;
		}
		#iDiv,#eDiv
		{
			margin:0 auto;
			padding-left:300px;
		}
		#booklist
		{
			width:800px;
			font-size:60px;
		}
		-->
	</style>
	<script type="text/javascript">
    	function toSwitch(liObj)
    	{
 			var information = document.getElementById("information");
			var edit = document.getElementById("edit");
			var consuption= document.getElementById("consuption");
			var favourite= document.getElementById("favourite");
 			var iDiv = document.getElementById("iDiv");
 			var eDiv = document.getElementById("eDiv");
 			var cDiv = document.getElementById("cDiv");
 			var fDiv = document.getElementById("fDiv");
 
 			if(liObj == information)
 			{
  				information.className = "on";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
 			}
 			else if(liObj == edit)
 			{
 				 edit.className = "on";
  				information.className = "";
  				consuption.className = "";
  				favourite.className = "";
 			}
 			else if(liObj == consuption)
 			{
 				consuption.className = "on";
  				information.className = "";
  				edit.className = "";
  				favourite.className = "";
 			}
 			else if(liObj == favourite)
 			{
 				favourite.className = "on";
  				information.className = "";
  				consuption.className = "";
  				edit.className = "";
 			}
			if(information.className == "on")
			{
  				iDiv.style.display = "";
  				eDiv.style.display = "none";
  				cDiv.style.display = "none";
  				fDiv.style.display = "none";
  			}
  			else if(edit.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 			}
 			else if(consuption.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "";
 				fDiv.style.display = "none";
 			}
 			else if(favourite.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "";
 			}
	}
	function checkform(theform)
		{
			if(theform.password.value.length<6)
  			{
  				alert("Password is no less than 6 chars");
  				theform.password.focus();
  				return false;
 			}
			if(theform.pwconfirm.value!=theform.password.value)
  			{
  				alert("Password and Confirmation don't match!");
  				theform.pwconfirm.focus();
  				return false;
  			}
			return true;
		}    
	</script>
  </head>
  
  <body>
   <%
  	session=request.getSession();
  	String username=(String)(session.getAttribute("username"));
  	Integer userID=(Integer)(session.getAttribute("userid"));
  	String sex=(String)(session.getAttribute("sex"));
  	Integer level=(Integer)(session.getAttribute("level"));
  	Integer type=(Integer)(session.getAttribute("level"));
  	String date=(String)(session.getAttribute("date"));
  	String intro=(String)(session.getAttribute("intro"));
  	String password=(String)(session.getAttribute("password"));
  	Integer balance=(Integer)(session.getAttribute("balance"));
  	if(userID==null)
  		System.out.println("111111");
  	else
  		System.out.println(userID);
   %>
    <div id="top">
  		<div id="logo"><img src="image/logo.jpg" height=40px width=200px></div>
  		<div id="info">
  			<table width="400px">
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
  	</div>
  	<br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#ff0080 SIZE=3>
  	<div class="right">
    	<div class="tag">
     		<table id="tags">
     			<tr>
     				<td id="information" class="on" onclick="toSwitch(this)">个人资料</td>
     				<td id="edit" onclick="toSwitch(this)">编辑个人信息</td>
     				<td id="consuption" onclick="toSwitch(this)">消费记录</td>
     				<td id="favourite" onclick="toSwitch(this)">个人书屋</td>
     			</tr>
     		</table>
    	</div>
    	<div id="shows">
        	<div id="iDiv" class="login">
        		<table id="pi" >
        			<tr>
        				<td><img src="image/female.jpg"></td>
        				<td>
        					<table>
        						<tr>
        							<td>姓名：</td>
        							<td><%=username %></td>
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
        		</table>
        	</div>
   			<div id="eDiv" class="regContainer" style="display:none;"> 
   				<form id="form1" method="post" action="UpdateInfo">
   					<table>
   						<tr>
   							<td>姓名：</td>
   							<td><input type="text" value="<%=username %>" name="username" id="username"></td>
   						</tr>
   						<tr>
   							<td>性别：</td>
   							<td><input type="radio" id="sexmale" name="sex" value="male">男&nbsp;
    							<input type="radio" id="sexfemale" name="sex" value="female" checked>女
    						</td>
    					</tr>
    					<tr>
    						<td>密码：</td>
    						<td><input type="password" name="password" id="password" value="<%=password %>" /></td>
    					</tr>
    					<tr>
    						<td>确认信密码：</td>
    						<td><input type="password" name="password" id="password" value="<%=password %>" /></td>
    						<td><input type="hidden" name="userid" id="userid" value="<%=userID %>"></td>
    					</tr>
    					
   					</table>
   					<div>
    						<button type="submit" onclick="checkform(this.form)" style="background:#fff0ac">提交修改</button>
    				</div>
   				</form>
   			</div>
   			<div id="cDiv" class="regContainer" style="display:none;">
   				<center>
   					<form action="CheckCost" method="get">
  					<table>
    					<tr>
    						<td><font face="Agency FB" size="10" color="#1291a9"><%=username%>的账户余额: &nbsp;&nbsp;</font></td>
    						<td><font face="Agency FB" size="10" color="#1291a9"><%=balance %></font></td>
    					</tr>
   					 </table>
    				<table id="spendrecord" rules="rows" >
   					<thead>
						<th><font face="Agency FB" size="6" color="#64a600">类型</font></th>
						<th><font face="Agency FB" size="6" color="#ea0000">金额</font></th>
					</thead>
					<tbody>
					<%	SpendDAO spdlist = new SpendDAO();
      					ArrayList<Spend> list = spdlist.select(userID.intValue());
      					if(list!=null)
      					{
      					for(int i=0;i<list.size();i++){
      						String name;
      						if(list.get(i).getBid()==0 && list.get(i).getCid()==0)
      							name=new String("充值");
      						else
      							name=new String("消费");
      				%>
    					<tr>
    						<td><%=name %></td>
    						<td><%=list.get(i).getCost()%></td>
    					</tr>
    				<%}} %>
    				</tbody>
    				</table>
   				 </form>
   
   				</center>	
   			</div>
   			<div id="fDiv" class="regContainer" style="display:none;">
   				<center>
   				<table id="booklist">
   					<%	SpendDAO b = new SpendDAO();
   						WriterDAO w = new WriterDAO();
   						ArrayList<Books> list2=b.bookhouse(userID);
   						if(list2!=null)
   						{
   						for(int i=0;i<list.size();i++)
   						{ %>
		   					<tr>
		   						<td>书名:<a href="BookPage?userid=<%=userID%>&bid=<%=list2.get(i).getBid()%>"><%=list2.get(i).getBname() %></a></td>
		   						<td>作家:<a href="PersonalPage?userid=<%=userID %>&wid=<%=list2.get(i).getWid() %>"><%=w.select(list2.get(i).getWid()).getWname()%></a></td>
		   						<td>简介:<p><%=list2.get(i).getBintro() %></td>
		   					</tr>
		   				<%} 
		   				}%>
   					
   				</table>
   				</center> 
   			</div>
   		 </div>
  	</div>
  </body>
</html>
