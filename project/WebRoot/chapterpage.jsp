<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		function showdiv(name1,name2)
		{
			if(name1!=name2)
			{
				alert("您不是作者，不能回复评论！");
				return(false);
			}
			else
				document.getElementById("recomment").style.display = 'block' ;
		}
	</script>
  </head>
  
  <body>
  <%	session=request.getSession();
  		String wName=(String)(session.getAttribute("wName"));
		String userName=(String)(session.getAttribute("userName")); 
		String rID=(String)(session.getAttribute("rID"));
		String bID=(String)(session.getAttribute("bID"));
		String bName=(String)(session.getAttribute("bName")); 
		String cID=(String)(session.getAttribute("cID"));
		String cTitle=(String)(session.getAttribute("cTitle"));
		String cContent=(String)(session.getAttribute("cContent"));%>
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
  		<form id="form2" method="post" action="">
  			<table>
  				<tr>
  					<td>举报人：<%=userName %></td>
  					<td>举报理由:
  						<select id="reason">
  							<option value="0" selected="selected">本章节含有色情信息</option>
  							<option value="1">本章节含有暴力信息</option>
  							<option value="2">本章节含有反动信息</option>
  							<option value="3">本章节具有抄袭嫌疑</option>
  						</select>
  					</td>
  					<td><input type="hidden" value="<%=bID %>"><input type="hidden" value="<%=cID %>"></td>
  					
  					<td><input type="submit" value="举报该章节"></td>
  				</tr> 
  						
  			</table>
  		</form>
  	</div>
  	<div id="grade">
  		<form id="form1"method="post" action="">
  			<span>打分：<input type="radio" value=1>1&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=2>2&nbsp;&nbsp;&nbsp;
  						<input type="radio" value=3>3&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=4>4&nbsp;&nbsp;&nbsp;
  						<input type="radio"value=5>5&nbsp;&nbsp;&nbsp;
  			</span>
  			<table>
  				<tr>
  					<td>评论人：<%=userName %></td>
  				</tr>
  				<tr>
  					<td>评论内容：</td>
  					<td><textarea id="comm" row="10" col="30"></textarea></td>
  				</tr>
  				<tr>
  					<td colspan=2 align="center"><input type="submit" value="提交评论"></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  	<div id="showcomment">
  		<table id="rlist">
			<tr>
				<td>评论人：XXX</td>
				<td>评论时间:XXX</td>
				<td><a href="#" onclick="showdiv('<%=userName%>','<%=wName%>')">回复</a></td>
			</tr>
			<tr>
				<td>评论内容</td>
				<td><textarea rows="6" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>回复人：XXX</td>
				<td>回复时间:XXX</td>
			</tr>
			<tr>
				<td>回复内容:</td>
				<td><textarea rows="6" cols="50"></textarea></td>
			</tr>
		</table>
  	</div>
  	<div id="recomment" style="display:none">
  		<form id="form2" method="post" action="">
  			<table>
  				<tr>
  					<td>回复人：<%=wName %></td>
  				</tr>
  				<tr>
  					<td>回复内容：</td>
  					<td><textarea id="comm" row="10" col="30"></textarea></td>
  				</tr>
  				<tr>
  					<td colspan=2 align="center"><input type="submit" value="提交回复"></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  </body>
</html>
