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
		#info1
			{
				padding-left:60%;
				padding-right :10px;
				padding-top:-10px;
				
			}
		#content,#grade,#showcomment,#report,#recomment
		{
			padding-left:20%;
			font-size:30px;
			width:800px;
		}
		.mytable
		{
			width:800px;
			font-size:30px;
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
			
		};
		function check(state,wid,userid)
		{
			alert(state);
			if(state=="1")
			{
				alert("您已经举报过！请不要重复举报！");
				return(false);
			}
			else if(wid==userid)
			{
				alert("您是作者，不能举报自己的作品！");
				return(false);
			}
			else
				return(true);
		};
		function check1(userid,wid)
		{
			if(userid==wid)
			{
				alert("您是作者，不能评论此章节！");
				return(false);
			}
			else
				return(true);
		};
	</script>
  </head>
  
 <body background="image/background.jpg" alt="background" sroll="auto">
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
  	<div id="content">
  		<table id="ccontent" class="mytable">
  			<tr>
  				<td style="text-align:center;">书名：<a href="BookPage?userid=<%=userID%>&bid=<%=bID%>"><%=bName %></a></td>
  				<td style="text-align:center;">作者:<%=wName %></td>
  			</tr>
  			<tr><td>                                                        </td></tr>
  			<tr></tr>
  			<tr>
  				<td colspan="2" style="text-align:center;">第<%=cID %>章：<%=cTitle %></td>
  			</tr>
  			<tr>
  				<td colspan="2"><p><%=cContent %></p></td>
  			</tr>
  		</table>
  	</div>
  	<br><br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="70%" color=#ff0080 SIZE=3>
  	<br><br>
  	<div id="report">
  		<form id="form2" method="post" action="Report">
  			<table class="mytable">
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
  					<%InformingDAO in = new InformingDAO();
  					int s=in.isInform(userID, bID);
  					System.out.println("-------------------------");
  					System.out.println("--"+s); %>
  					<td><input type="submit" value="举报该章节" onclick="check('<%=s%>','<%=wID%>','<%=userID%>')"></td>
  				</tr> 
  						
  			</table>
  		</form>
  	</div>
  	<br>
  	<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="70%" color=#ff0080 SIZE=3>
  	<br>
  	<br>
  	<div id="grade">
  		<form id="form1"method="post" action="Remarking">
  			<span>打分：<input type="radio" value=1 name="grade">1&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=2 name="grade">2&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=3 name="grade">3&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=4 name="grade">4&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=5 name="grade">5&nbsp;&nbsp;&nbsp;
  			</span>
  			<table class="mytable">
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
  					<td colspan=2 align="center"><input type="submit" value="提交评论" onclick="check1('<%=userID%>,<%=wID%>')"></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  	<br><br><br>
  	<%String n; %>
  	<div id="showcomment">
  		<table id="rlist" width="600px" style="font-size:15px">
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
  			<table width="600px" style="font-size:15px">
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
