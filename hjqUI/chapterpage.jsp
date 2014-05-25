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
    
    <title>My JSP 'chapterpage.jsp' starting page</title>
    
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
		#content,#grade,#showcomment,#report
		{
			padding-left:20%;
		}
		-->
	</style>
	<script tyoe="text/javascript">
		function showdiv(name1,name2,rid,time)
		{
			if(name1!=name2)
			{
				alert("您不是作者，不能回复评论！");
				return(false);
			}
			else
			{
					document.getElementById("recomment").style.display = 'block' ;
					document.getElementById("rid").value=rid;
					document.getElementById("time").value=time;
					return(true);
			}
			
		}
	</script>
  </head>
  
  <body>
  <%	session=request.getSession();
  		String wName=(String)(session.getAttribute("wname"));
  		Integer userID=(Integer)(session.getAttribute("userid"));
		String userName=(String)(session.getAttribute("username")); 
		Integer wID=(Integer)(session.getAttribute("wid"));
		Integer bID=(Integer)(session.getAttribute("bid"));
		String bName=(String)(session.getAttribute("bname")); 
		Integer cID=(Integer)(session.getAttribute("cid"));
		String cTitle=(String)(session.getAttribute("ctitle"));
		String cContent=(String)(session.getAttribute("content"));
		int rid;
		String time;%>
   <div id="top">
  		<div id="logo"><img src="image/logo.jpg" height=40px width=200px></div>
  		<div id="info">
  			<table width="400px">
  				<tr>
 					<td>欢迎回来：<a href="PersonalPage?userid=<%=userID%>&username=<%=userName%>"><%=userName %></a></td>
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
  	<div id="content">
  		<table id="ccontent">
  			<tr>
  				<td>书名：<%=bName %></td>
  				<td>作者:<%=wName %></td>
  			</tr>
  			<tr>
  				<td>第<%=cID %>章：<%=cTitle %></td>
  			</tr>
  			<tr>
  				<td><p><%=cContent %></p></td>
  			</tr>
  		</table>
  	</div>
  	<br><br>
  	<div id="report">
  		<form id="form2" method="post" action="Report">
  			<table>
  				<tr>
  					<td>举报人：<%=userName %></td>
  					<td>举报理由:
  						<select id="reason" name="reason">
  							<option value="0" selected="selected">本章节含有色情信息</option>
  							<option value="1">本章节含有暴力信息</option>
  							<option value="2">本章节含有反动信息</option>
  							<option value="3">本章节具有抄袭嫌疑</option>
  						</select>
  					</td>
  					<td><input type="hidden" value="<%=bID %>" name="bid"><input type="hidden" value="<%=cID %>" name="cid">
  						<input type="hidden" value="<%=userID %>" name="userid"></td>
  					
  					<td><input type="submit" value="举报该章节"></td>
  				</tr> 
  						
  			</table>
  		</form>
  	</div>
  	<div id="grade">
  		<form id="form1"method="post" action="Remarking">
  			<span>打分：<input type="radio" value=1 name="grade">1&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=2 name="grade">2&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=3 name="grade">3&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=4 name="grade">4&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=5 name="grade">5&nbsp;&nbsp;&nbsp;
  			</span>
  			<table>
  				<tr>
  					<td>评论人：<%=userName %></td>
  				</tr>
  				<tr>
  					<td>评论内容：</td>
  					<td><textarea id="comm" row="10" col="30" name="content"></textarea></td>
  					<td><input type="hidden" name="userid" value="<%=userID %>">
  						<input type="hidden" name="bid" value="<%=bID %>">
  						<input type="hidden" name="cid" value="<%=cID %>"></td>
  				</tr>
  				<tr>
  					<td colspan=2 align="center"><input type="submit" value="提交评论"></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  	<%String n; %>
  	<div id="showcomment">
  		<table id="rlist">
  			<% 	RemarkDAO r=new RemarkDAO();
				Function f=new Function();
				ReaderDAO re=new ReaderDAO();
				WriterDAO w=new WriterDAO();
				ArrayList<Remark> list=r.selectlist(bID);
				if(list.size()!=0){
				for(int i=0;i<list.size();i++)
				{
					int ty=f.isReader(list.get(i).getRid());
					String name="";
					if(ty==1)
					{
						name=re.select(list.get(i).getRid()).getRname();
					}
					else if(ty==2)
					{
						name=w.select(list.get(i).getRid()).getWname();
					}
					n=name;
			 %>
				<tr>
					<td>评论人：<%=n %></td>
					<td>评论时间：<%=list.get(i).getTime() %></td>
					<td><a href="#" onclick="showdiv('<%=userName%>','<%=wName%>','<%=list.get(i).getRid()%>','<%=list.get(i).getTime()%>');return false;">回复</a></td>
				</tr>
				<tr>
					<td>评论内容</td>
					<td><textarea rows="6" cols="50"><%=list.get(i).getContent() %></textarea></td>
				</tr>
				<%if(list.get(i).getWid()!=0)
					{ %>
						<tr>
							<td>回复人：<%=w.select(list.get(i).getWid()).getWname() %></td>
							<td>回复时间：<%=list.get(i).getRetime() %></td>
						</tr>
						<tr>
							<td>回复内容：</td>
							<td><textarea rows="6" cols="50"><%=list.get(i).getRecontent() %></textarea></td>
						</tr>
					<%} %>
				<%} }%>
		</table>
  	</div>
  	<div id="recomment" style="display:none">
  		<form id="form2" method="post" action="Reremarking">
  			<table>
  				<tr>
  					<td>回复人：<%=wName %></td>
  				</tr>
  				<tr>
  					<td>回复内容：</td>
  					<td><textarea id="comm" row="10" col="30" name="recontent"></textarea></td>
  				</tr>
  				<tr>
  					<td>
  					<input type="hidden" name="userid" value="<%=userID %>">
  					<input type="hidden" name="bid" value="<%=bID %>">
  					<input type="hidden" name="cid" value="<%=cID %>">
  					<input type="hidden" name="rid" id="rid">
  					<input type="hidden" name="time" id="time">
  					</td>
  					<td colspan=2 align="center"><input type="submit" value="提交回复"></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  </body>
</html>
