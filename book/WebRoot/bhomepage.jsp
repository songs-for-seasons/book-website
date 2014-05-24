<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@page import="Servlet.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
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
  		String username=(String)(session.getAttribute("username"));
  		Integer userID=(Integer)(session.getAttribute("userID"));
		String rName=(String)(session.getAttribute("rName")); 
		Integer rID=(Integer)(session.getAttribute("rID"));
		Integer bID=(Integer)(session.getAttribute("bID"));
		String bName=(String)(session.getAttribute("bName"));
		Integer bWord=(Integer)(session.getAttribute("bWord"));
		String state=(String)(session.getAttribute("state"));
		Integer grade=(Integer)(session.getAttribute("grade"));
		Integer cnum=(Integer)(session.getAttribute("cnum"));
		Integer type=(Integer)(session.getAttribute("type"));
		String time=(String)(session.getAttribute("updateTime"));
		String bintro=(String)(session.getAttribute("bintro"));
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
		<form id="form1" method="post" action="Purchase">
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
			<%	ChapterDAO c=new ChapterDAO();
				SpendDAO s = new SpendDAO();
				ArrayList<Chapter> list=c.selectlist(bID);
				for(int i=0;i<list.size();i++){
			 %>
			 	<tr>
			 		<td><%=list.get(i).getCid() %></td>
			 		<td><%=list.get(i).getTitle() %></td>
			 		<td><%=list.get(i).getWords() %></td>
			 		<td><%=c.cost(list.get(i).getBid(), list.get(i).getCid()) %></td>
			 		<td><%=list.get(i).getUpdatetime() %></td>
			 		<td><%=list.get(i).getCclick()%></td>
			 		<%if(s.isPurchase(userID, list.get(i).getBid(), list.get(i).getCid())==0) %>
			 			<td><input type="radio" name="cid" value="<%=list.get(i).getCid() %>"></td>
			 		<%if(s.isPurchase(userID, list.get(i).getBid(), list.get(i).getCid())==1) %>
			 			<td><a href="ChapterPage?userid=<%=userID %>&bid=<%=list.get(i).getBid() %>&cid=<%=list.get(i).getCid() %>"></a>已购买</td>
			 		<td><input type="hidden" name="bid" value="<%=list.get(i).getBid() %>"></td>
			 		<td><input type="hidden" name="bid" value="<%=list.get(i).getCid() %>"></td>
			 	</tr>
			 <%} %>
			</table>	
		</form>
		<div id="puton">
			<button type="submit">确认购买</button>
		</div>	
		
	</div>
	<br><br>
	<div id="comment">
		<table id="rlist">
			<% 	RemarkDAO r=new RemarkDAO();
				Function f=new Function();
				ReaderDAO re=new ReaderDAO();
				WriterDAO w=new WriterDAO();
				ArrayList<Remark> list2=r.select(bID);
				for(int i=0;i<list2.size();i++)
				{
					int ty=f.isReader(list2.get(i).getRid());
					String name="";
					if(ty==1)
					{
						name=re.select(list2.get(i).getRid()).getRname();
					}
					else if(ty==2)
					{
						name=w.select(list2.get(i).getRid()).getWname();
					}
			 %>
				<tr>
					<td>评论人：<%=name %></td>
					<td>评论时间：<%=list2.get(i).getTime() %></td>
				</tr>
				<tr>
					<td>评论内容</td>
					<td><textarea rows="6" cols="50"><%=list2.get(i).getContent() %></textarea></td>
				</tr>
				<%if(list.get(i).getWid()!=0)
					{ %>
						<tr>
							<td>回复人：<%=w.select(list2.get(i).getWid()).getWname() %></td>
							<td>回复时间：<%=list2.get(i).getRetime() %></td>
						</tr>
						<tr>
							<td>回复内容：</td>
							<td><textarea rows="6" cols="50"><%=list2.get(i).getRecontent() %></textarea></td>
						</tr>
					<%} %>
				<%} %>
		</table>
	</div>
  </body>
</html>
