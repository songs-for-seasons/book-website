<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%int cid,rid; %>
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
		#info1
		{
			margin:0 auto;
		}
		#clist
		{
			margin:0 auto;
			text-align:center;
			width:800px;
			
		}
		#chapter
		{
			padding-left:10%;
		}
		#binfo
		{
			padding-left:30%;
		}
		.t1 {background-color:#f0f0f0;text-align:center} 
		.t2 {background-color:#EDF6FF;text-align:center} 
		#clist tr{ text-align:center;yexj00:expression(this.style.background=(rowIndex%2==1)?'orange':'yellow')}
		#puton
		{
			padding-left:40%;
		}
		#comment
		{
			padding-left:20%;
		}
		-->
	</style>
	<script type="text/javascript">
		function checkmoney(money,cost)
		{
			if(money < cost)
			{
				alert("您的余额不足！！！请充值");
				return(false);
			}
		}
	</script>
	
  </head>
  
  <body>
   <%	session=request.getSession();
  		String userName=(String)(session.getAttribute("userName"));
  		String userID=(String)(session.getAttribute("userID"));
		String rName=(String)(session.getAttribute("rName")); 
		String rID=(String)(session.getAttribute("rID"));
		String bID=(String)(session.getAttribute("bID"));
		String bName=(String)(session.getAttribute("bName"));
		String bWord=(String)(session.getAttribute("bWord"));
		String state=(String)(session.getAttribute("state"));
		String grade=(String)(session.getAttribute("grade"));
		String cnum=(String)(session.getAttribute("cnum"));
		String type=(String)(session.getAttribute("type"));
		String time=(String)(session.getAttribute("updateTime"));
		String bintro=(String)(session.getAttribute("bintro"));
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
	<div id="binfo">
		<table id="info1">
		<tr>
			<td rowspan="4"><img src="image/1.jpg" width="200px" height="320px"></td>
			<td>
				<table width="400px" height="300px">
				<tr>
					<td>书名：<%=bName %>&nbsp;&nbsp;&nbsp;&nbsp;作者:<a href="writerpage.jsp?bID=<%=bID%>%bName=<%=bName%>">XXX</a><%=bName %></td>
				</tr>
				<tr>
					<td>字数：<%=bWord %>&nbsp;&nbsp;&nbsp;&nbsp;状态：<%=state %></td>
				</tr>
				<tr>
					<td>得分：<%=grade %>&nbsp;&nbsp;&nbsp;&nbsp;评论数：<%=cnum %></td>
				</tr>
				<tr>
					<td>类型：<%=type %>&nbsp;&nbsp;&nbsp;&nbsp;更新时间：<%=time %></td>
				</tr>
				<tr>
					<td>简介：<%=bintro %></td>
				</tr>
			</table>
			</td>
		</table>
	</div>
	<br><br><br>
	<div id="chapter">
		<form id="form1" method="post" action="buychapter">
		<table id="clist">
			<tr><td colspan=8>章节列表</td></tr>
			<tr>
				<td>章节号</td>
				<td>标题</td>
				<td>字数</td>
				<td>四季豆</td>
				<td>更新时间</td>
				<td>点击量</td>
				<td>购买情况</td>
			</tr>
			<!-- java函数 -->
			
			</table>	
		</form>
		<div id="puton">
			<button type="submit">确认购买</button>
		</div>	
		
	</div>
	<br><br>
	<div id="comment">
		<table id="rlist">
			<tr>
				<td>评论人：XXX</td>
				<td>评论时间：XXX</td>
			</tr>
			<tr>
				<td>评论内容</td>
				<td><textarea rows="6" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>回复人：XXX</td>
				<td>回复时间：XXX</td>
			</tr>
			<tr>
				<td>回复内容：</td>
				<td><textarea rows="6" cols="50"></textarea></td>
			</tr>
		</table>
	</div>
  </body>
</html>
