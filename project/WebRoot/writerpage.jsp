<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			width:900px;
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
 			var iDiv = document.getElementById("iDiv");
 			var eDiv = document.getElementById("eDiv");
 			var cDiv = document.getElementById("cDiv");
 			var fDiv = document.getElementById("fDiv");
 			var uDiv = document.getElementById("uDiv");
 			var wDiv = document.getElementById("wDiv");
 
 			if(liObj == information)
 			{
  				information.className = "on";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
 			}
 			else if(liObj == edit)
 			{
 				information.className = "";
  				edit.className = "on";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
  				
 			}
 			else if(liObj == consuption)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "on";
  				favourite.className = "";
  				update.className = "";
  				write.className = "";
 			}
 			else if(liObj == favourite)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "on";
  				update.className = "";
  				write.className = "";
 			}
 			else if(liObj == update)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "on";
  				write.className = "";
 			}
 			else if(liObj == write)
 			{
 				information.className = "";
  				edit.className = "";
  				consuption.className = "";
  				favourite.className = "";
  				update.className = "";
  				write.className = "on";
 			}
			if(information.className == "on")
			{
  				iDiv.style.display = "";
  				eDiv.style.display = "none";
  				cDiv.style.display = "none";
  				fDiv.style.display = "none";
  				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  			}
  			else if(edit.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
  				
 			}
 			else if(consuption.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
 			}
 			else if(favourite.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "";
 				uDiv.style.display = "none";
  				wDiv.style.display = "none";
 			}
 			else if(update.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "";
  				wDiv.style.display = "none";
 			}
 			else if(write.className == "on")
  			{
  				iDiv.style.display = "none";
 				eDiv.style.display = "none";
 				cDiv.style.display = "none";
 				fDiv.style.display = "none";
 				uDiv.style.display = "none";
  				wDiv.style.display = "";
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
  
  <body>
  <%session =request.getSession();
  String userid = (String)(session.getAttribute("userid"));
  String username = (String)(session.getAttribute("username"));
  String sex = (String)(session.getAttribute("sex"));
  	String level=(String)(session.getAttribute("level"));
  	String type=(String)(session.getAttribute("level"));
  	String date=(String)(session.getAttribute("date"));
  	String intro=(String)(session.getAttribute("intro"));
  	String password=(String)(session.getAttribute("password"));
  	String balance=(String)(session.getAttribute("balance"));
  	%>
  	<div id="top">
  		<div id="logo"><img src="image/logo.jpg" height=40px width=200px></div>
  		<div id="info">
  			<table width="400px">
  				<tr>
  					<td>欢迎回来：<a href="personalpage.jsp">jjj</a></td>
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
     				<td id="update" onclick="toSwitch(this)">编辑作品</td>
     				<td id="write" onclick="toSwitch(this)">创建新书</td>
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
   			<div id="eDiv" class="regContainer" style="display:none;"> 
   				<form id="form1" method="post" action="Update">
   					<table>
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
    					<tr>
    						<td>E-Mail：</td>
    						<td><input type="text" name="mail" value="<%=mail %>" /></td>
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
						<th><font face="Agency FB" size="6" color="#484891">时间</font></th>
						<th><font face="Agency FB" size="6" color="#64a600">类型</font></th>
						<th><font face="Agency FB" size="6" color="#ea0000">金额</font></th>
					</thead>
					<tbody>
					<%	SpendRecordDAO spdlist = new SpendRecordDAO();
      					ArrayList<SpendRecord> list = spdlist.select(userid);
      					for(int i=0;i<list.size();i++){%>
    					<tr>
    						<td><font face="Agency FB" size="6" color="#484891"><%=list.get(i).getDate()%></font></td>
    						<td><font face="Agency FB" size="6" color="#64a600">&nbsp;&nbsp;<%=list.get(i).getType()%>&nbsp;&nbsp;</font></td>
    						<td><font face="Agency FB" size="6" color="#ea0000"><%=list.get(i).getCost()%></font></td>
    					</tr>
    				<%} %>
    				</tbody>
    				</table>
   				 </form>
   
   				</center>	
   			</div>
   			<div id="fDiv" class="regContainer" style="display:none;">
   				<center>
   				<table id="booklist">
   					<tr>
   						<td>书名</td>
   						<td>作家</td>
   						<td>简介</td>
   					</tr>
   					
   				</table>
   				</center> 
   			</div>
   			<div id="uDiv" class="regContainer" style="display:none;">
   				<div id="search" style="display:inline">
  					<form method="post" action="Searchbook" name="form1">
  					<table align="center">
  						<tr>
 							<td><h2>请选择一本书：</h2></td>
  							<td align="center">
  								<select class="select" name="bookname" id="bookname">
    							<%
    								UsersDAO u1=new UsersDAO();
    								ArrayList<Users> list=u1.select();
    								int i;
    								for(i=0;i<list.size();i++)
    								{%>
    									<option><%=list.get(i).getUserID() %></option>
    						  	<%} %>	
    							</select>
  							</td>
  							<td align="center"><button type="submit" style="background:#F1E1FF">确定</button></td>
  						</tr>
  					</table>
  					</form>
  					<div id="binfo1">
  						<table>
  							<tr>
  								<td align="center"><img src="image/1.jpg" height="300px" width="200px"></td>
  							</tr>
  							<tr>
  								<td align="center"><a href="writecharper.jsp?bid=<%=bid%>">添加新章节</a></td>
  							</tr>
  						</table>
  					</div>
  					<div id="binfo2">
  						<form id="form2" method="post" action="">
  						<table>
  							<tr>
  								<td>书名:</td>
  								<td><input type="text"></td>
  							</tr>
  							<tr>
  								<td>简介：</td>
  								<td><textarea rows="6"></textarea></td>
  							<tr>
  							<tr>
  								
  							</tr>
  						</table>
  							<div align="center">
  								<input type="image" src="img/submit.jpg" onclick="fsubmit(form2)">
  							</div>
  						</form>
  					</div>
  				</div>
   			</div>
   			<div id="wDiv" class="regContainer" style="display:none;">
   				<form id="form3" method="post"	action="">
   					<table>
   						<tr>
   							<td>书名：</td>
   							<td><input type="text"></td>
   						</tr>
   						<tr>
   							<td>类别：</td>
   							<td>
   								<input type="radio" value="1" checked="checked">古代言情&nbsp;
   								<input type="radio" value="2">都市青春&nbsp;
   								<input type="radio" value="3">幻想现言&nbsp;
   								<input type="radio" value="4">古代穿越&nbsp;
   								<input type="radio" value="5">玄幻奇幻&nbsp;
   								<input type="radio" value="6">科幻网游&nbsp;
   								<input type="radio" value="7">动漫同人&nbsp;
   								<input type="radio" value="8">同人影视&nbsp;
   							</td>
   						</tr>
   						<tr>
   							<td>简介：</td>
   							<td><textarea rows="10" cols="25"></textarea>
   						</td>
   						<tr>
   							<td>定价：</td>
   							<td><input type="text">个四季豆/千字</td>
   						</tr>
   					</table>
   					   			
   						<div align="center">
   							<input type="image" src="image/submit.jpg" onclick="fsubmit(form3)">
   						</div>
   							
   							
   				</form>
   			</div>
   		 </div>
  	</div>  
  </body>
</html>
