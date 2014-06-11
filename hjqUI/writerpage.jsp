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
    
    <title>My JSP 'writerpage.jsp' starting page</title>
    
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
		.right
		{
			margin-top:20px;
			padding-left:230px;
			width:850px;
		}
		.login 
		{ 
			margin:0 auto;
			width:800px; 
			height:500px; 
			border:1px solid #D1D1D1; 
			background-color:#ff79bc; 
		}
		.tag 
		{ 
			width:800px; 
			height:29px; 
			line-height:29px; 
		}
		.tag td 
		{ 
			width:160px; 
			height:29px; 
			line-height:29px; 
			float:left; 
			text-align:center; 
			
			background-color:#ff0080;
		}
		.tag td.on 
		{ 
			width:160px; 
			height:29px; 
			line-height:29px; 
			float:left; 
			text-align:center; 
			
			background-color:#ff79bc;
		}
		.shows
		{
			padding-left:100px;
			padding-top:-10px;
		}
		.regContainer
		{
			padding-left:230px;
			width:800px;
			height:701px;
			border:1px solid #D1D1D1; 
			background-color:#ff79bc;
		}
		.regContainer p
		{
			font-family:"宋体";
			font-size:40px;
		}
		.pi
		{
			margin:0 auto;
			padding-top:20px;
			font-size:20px;
			height:200px;
			width:500px;
		}
		#create
		{
			
			padding-top:20px;
			font-size:15px;
			height:200px;
			width:700px;
		}
		#iDiv,#eDiv,#cDiv,#fDiv,#uDiv,#wDiv
		{
			
			padding-left:100px;
			width:700px;
		}
		#booklist
		{
			width:600px;
			font-size:20px;
		}
		#submit
		{
			padding-left:300px;
		}
		select {
  		-webkit-appearance: button;
  		-webkit-border-radius: 2px;
  		-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
  		-webkit-padding-end: 20px;
  		-webkit-padding-start: 2px;
  		-webkit-user-select: none;
  		background-image: url(../images/select-arrow.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
  		background-position: center right;
  		background-repeat: no-repeat;
  		border: 1px solid #AAA;
  		color: #555;
  		font-size: inherit;
  		margin: 0;
  		overflow: hidden;
 		padding-top: 2px;
  		padding-bottom: 2px;
  		text-overflow: ellipsis;
  		white-space: nowrap;}
  		#binfo1
  		{
  			float:left;
  			padding-left:200px;
  			width:450px;
  		}
  		#binfo2
  		{
  
  			width:400px;
  			padding-right:100px;
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
			var update= document.getElementById("update");
			var write= document.getElementById("write");
			var message=document.getElementById("message");
 			var iDiv = document.getElementById("iDiv");
 			var eDiv = document.getElementById("eDiv");
 			var cDiv = document.getElementById("cDiv");
 			var fDiv = document.getElementById("fDiv");
 			var uDiv = document.getElementById("uDiv");
 			var wDiv = document.getElementById("wDiv");
 			var mDiv = document.getElementById("mDiv");
 
 			if(liObj == information)
 			{
  				information.className = "on";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
  				message.className="";
 			}
 			else if(liObj == edit)
 			{
 				information.className = "";
  				edit.className = "on";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
  				message.className="";
  				
 			}
 			else if(liObj == consuption)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "on";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
  				message.className="";
 			}
 			else if(liObj == favourite)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "on";
  				update.className = "";
  				write.className = "";
  				message.className="";
 			}
 			else if(liObj == update)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "on";
  				write.className = "";
  				message.className="";
 			}
 			else if(liObj == write)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "on";
  				message.className="";
 			}
 			else if(liObj == message)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
  				message.className="on";
 			}
			if(information.className == "on")
			{
  				iDiv.style.display = "";
  				eDiv.style.display = "none";
  				cDiv.style.display = "none";
  				fDiv.style.display = "none";
  				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				mDiv.style.display = "none";
  			}
  			else if(edit.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				mDiv.style.display = "none";
 			}
 			else if(consuption.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				mDiv.style.display = "none";
 			}
 			else if(favourite.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				mDiv.style.display = "none";
 			}
 			else if(update.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "";
  				wDiv.style.display = "none";
  				mDiv.style.display = "none";
 			}
 			else if(write.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "";
  				mDiv.style.display = "none";
 			}
 			else if(write.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				mDiv.style.display = "";
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
	function fsubmit(obj)
	{
		obj.submit();
	}    
	</script>
  </head>
  
  <body background="image/background.jpg" alt="background" sroll="auto">
  <%session =request.getSession();
  Integer userID = (Integer)(session.getAttribute("userid"));
  String username = (String)(session.getAttribute("username"));
  String sex = (String)(session.getAttribute("sex"));
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
  		<div id="logo" style="padding-left:150px; "><a href="homepage.jsp?userID=<%=userID %>&userName=<%=username %>"><img src="image/logo.png" alt="logo" width="300" height="100"></a></div></td>
  			<td>
  		<div id="info1">
  			<table width="400px" style="display:block">
  				<tr>
  					<td>欢迎回来：<a href="PersonalPage?userid=<%=userID%>&username=<%=username%>"><%=username %></a></td>
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
  	<div class="right">
    	<div class="tag">
     		<table id="tags">
     			<tr>
     				<td id="information" class="on" onclick="toSwitch(this)">个人资料</td>
     				<td id="edit" onclick="toSwitch(this)">编辑个人信息</td>
     				<td id="consuption" onclick="toSwitch(this)">消费记录</td>
     				<td id="favourite" onclick="toSwitch(this)">个人书屋</td>
     				<td id="update" onclick="toSwitch(this)">添加新章节</td>
     				<td id="write" onclick="toSwitch(this)">创建新书</td>
     				<td id="message" onclick="toSwitch(this)">查看公告</td>
     			</tr>
     		</table>
    	</div>
    	<div id="shows">
        	<div id="iDiv" class="login">
        		<table class="pi" >
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
        		<table class="pi">
        			<tr>
        				<td>主要作品</td>
        			</tr>
        			<tr>
  
        				<td>
        					<table class="pi">
        						<tr>
        							<td>书名&nbsp;&nbsp;</td>
        							<td>字数&nbsp;&nbsp;</td>
        							<td>状态&nbsp;&nbsp;</td>
        							<td>得分&nbsp;&nbsp;</td>
        							<td>点击量&nbsp;&nbsp;</td>
        							<td>评论数&nbsp;&nbsp;</td>
        						</tr>
        						<%
        							BooksDAO b = new BooksDAO();
        							ArrayList<Books> list=b.selectid(userID);
        							for(int i=0;i<list.size();i++)
        							{
        								String sta;
        						%>
        							<tr>
        								<td><a href="BookPage?userid=<%=userID%>&bid=<%=list.get(i).getBid()%>"><%=list.get(i).getBname() %></a></td>
        								<td><%=list.get(i).getWords() %></td>
        								<%	if(list.get(i).getIsfinished()==0)
        										sta=new String("连载中");
        									else
        										sta=new String("已完结");
        								 %>
        								<td><%=sta %></td>
        								<td><%=list.get(i).getBgrade()%></td>
        								<td><%=list.get(i).getBclick() %></td>
        								<td><%=list.get(i).getRemark() %></td>
        							</tr>
        						<%} %>
        					</table>
        				</td>
        			</tr>
        
        		</table>
        	</div>
   			<div id="eDiv" class="regContainer" style="display:none;"> 
   				<form id="form1" method="post" action="UpdateInfo">
   					<table class="pi">
   						<tr>
   							<td>姓名：</td>
   							<td><input type="text" value="<%=username %>" id="username"></td>
   						</tr>
   						<tr>
   							<td>性别：</td>
   							<td><input type="radio" id="sexmale" name="usersex" value="male">男&nbsp;
    							<input type="radio" id="sexfemale" name="usersex" value="female" checked>女
    						</td>
    					</tr>
    					<tr>
    						<td>密码：</td>
    						<td><input type="password" name="password" id="password" value="<%=password %>" /></td>
    					</tr>
    					<tr>
    						<td>确认信密码：</td>
    						<td><input type="password" name="password" id="password" value="<%=password %>" /></td>
    					</tr>
    					
   					</table>
   					<div id="submit">
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
						<th><font face="Agency FB" size="6" color="#484891">时间</font></th>
						<th><font face="Agency FB" size="6" color="#64a600">类型</font></th>
						<th><font face="Agency FB" size="6" color="#ea0000">金额</font></th>
					</thead>
					<tbody>
					<%	SpendDAO spdlist = new SpendDAO();
      					ArrayList<Spend> list2 = spdlist.select(userID);
      					if(list2.size()!=0){
      					for(int i=0;i<list2.size();i++){
      						String name;
      						if(list2.get(i).getBid()==0 && list2.get(i).getCid()==0)
      							name=new String("充值");
      						else
      							name=new String("消费");
      				%>
    					<tr>
    						<td><%=name %></td>
    						<td><%=list2.get(i).getCost()%></td>
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
   					<%	SpendDAO s = new SpendDAO();
   						WriterDAO w = new WriterDAO();
   						ArrayList<Books> list3=s.bookhouse(userID);
   						if(list3!=null){
   						for(int i=0;i<list3.size();i++)
   						{ %>
		   					<tr>
		   						<td>书名:<a href="BookPage?userid=<%=userID%>&bid=<%=list3.get(i).getBid()%>"><%=list3.get(i).getBname() %></a></td>
		   						<td>作家:<a href="PersonalPage?userid=<%=userID %>&wid=<%=list3.get(i).getWid() %>"><%=w.select(list3.get(i).getWid()).getWname()%></a></td>
		   						<td>简介:<p><%=list3.get(i).getBintro() %></td>
		   					</tr>
		   				<%}} %>
   					
   				</table>
   				</center> 
   			</div>
   			<div id="uDiv" class="regContainer" style="display:none;">
   				<div id="search" style="display:inline">
  					<table align="center" class="pi">
  						<tr>
  							<td>书名</td>
  							<td>简介</td>
  						</tr>
    					<%	BooksDAO u1=new BooksDAO();
    						ArrayList<Books> list4=u1.selectid(userID);
    						int i;
    						for(i=0;i<list4.size();i++)
    						{%>
    							<tr>
    								<td><%=list4.get(i).getBname() %></td>
    								<td><%=list4.get(i).getBintro() %></td>
    								<td>
    									<form name="form1" id="form1" action="erchuan" method="post">
    										<input type="hidden" name="userid" value="<%=userID %>">
    										<input type="hidden" name="username" value="<%=username %>">
    										<input type="hidden" name="bid" value="<%=list4.get(i).getBid() %>">
    										<input type="hidden" name="bname" value="<%=list4.get(i).getBname() %>">
    										<input type="submit" value="添加新章节">
    									</form>
    								<!-- <a href="erchuan? bid=4& bname=4&userid=<%=userID %>& username=<%=username %>">添加新章节</a> --></td>
    							</tr>
    					  <%} %>
    				</table>
  				</div>
   			</div>
   			<div id="wDiv" class="regContainer" style="display:none;">
   				<form id="form3" method="post"	action="NewBook">
   					<table id="create" width="700px">
   						<tr>
   							<td>书名：</td>
   							<td><input type="text" name="bname" id="bname"></td>
   						</tr>
   						<tr>
   							<td>类别：</td>
   							<td>
   								<input type="radio" value="1" checked="checked" name="type">古代言情&nbsp;
   								<input type="radio" value="2"  name="type">都市青春&nbsp;
   								<input type="radio" value="3"  name="type">幻想现言&nbsp;
   								<input type="radio" value="4"  name="type">古代穿越&nbsp;
   								<input type="radio" value="5"  name="type">玄幻奇幻&nbsp;
   								<input type="radio" value="6"  name="type">科幻网游&nbsp;
   								<input type="radio" value="7"  name="type">动漫同人&nbsp;
   								<input type="radio" value="8"  name="type">同人影视&nbsp;
   							</td>
   						</tr>
   						<tr>
   							<td>简介：</td>
   							<td><textarea rows="10" cols="25" name="bintro"></textarea>
   						</td>
   						<tr>
   							<td>定价：</td>
   							<td><input type="text" name="cost">个四季豆/千字</td>
   						</tr>
   						<tr>
   							<td><input type="hidden" name="userid" value="<%=userID %>"></td>
   					</table>
   					   			
   						<div align="center">
   							<input type="image" src="image/submit.jpg" onclick="fsubmit(form3)">
   						</div>
   							
   							
   				</form>
   			</div>
   			<div id="mDiv" class="regContainer" style="display:none;">
   				<center>
   					<table id="mlist">
   						<tr>
   							<td>发布时间</td>
   							<td>内容</td>
   						</tr>
   						<%	InformingDAO inf= new InformingDAO();
   							ArrayList<Informing> list3 = inf.selecttype(1);
   							if(list3.size()!=0)
   							{
   								for(int i=0;i<list3.size();i++)
   								{
   						 %>
   						 	<tr>
   						 		<td><%=list3.get(i).getTime() %></td>
   						 		<td><%=list3.get(i).getReason() %></td>
   						 	</tr>
   						 <%}} %>	
   					</table>
   				</center>
   			</div>
   		 </div>
  	</div>  
  </body>
</html>
