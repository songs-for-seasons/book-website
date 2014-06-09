<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="DAO.*"%>
<%@page import="Servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
	<title>查看书籍</title>
	<style type="text/css"></style>
	<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">
 <%	session=request.getSession();
  	String username=(String)(session.getAttribute("username"));
  	if(username == null)
  		username = "";
  	Integer userID=(Integer)(session.getAttribute("userid"));
	String wName=(String)(session.getAttribute("wname"));
	if(wName == null)
		wName = ""; 
	Integer wID=(Integer)(session.getAttribute("wid"));
	Integer bID=(Integer)(session.getAttribute("bid"));
	String bName=(String)(session.getAttribute("bname"));
	if(bName == null)
		bName = "";
	Integer bWord=(Integer)(session.getAttribute("bword"));
	Integer state=(Integer)(session.getAttribute("state"));
	Integer grade=(Integer)(session.getAttribute("grade"));
	Integer cnum=(Integer)(session.getAttribute("cnum"));
	Integer type=(Integer)(session.getAttribute("type"));
	//String time=(String)(session.getAttribute("updateTime"));
	String bintro=(String)(session.getAttribute("bintro"));
	if(bintro == null)
		bintro = "";
%>
<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;<br>
		<a href="login.jsp">退出</a>
		</label>
		
	</p>
</div>

<div id="menu" class="menu">
<ul>
	<li><a href="check_allusers.jsp">所有用户</a></li>
	<li><a href="check_allbooks.jsp">所有书籍</a></li>
	<li><a href="send_notice.jsp">发送公告</a></li>
	<li><a href="read_message.jsp">接收举报</a></li>
</ul>
</div>
<br><br>


<div id="binfo">
		<table id="info1">
		<tr>
			<td rowspan="4"><img src="image/1.jpg" width="200px" height="320px"></td>
			<td>
				<table width="400px" height="300px">
				<tr>
					<td>书名：<%=bName %>&nbsp;&nbsp;&nbsp;&nbsp;作者:<a href="visitwriter?userID=<%=userID%>&wid=<%=wID%>"><%=wName%></a></td>
				</tr>
				<tr>
					<td>字数：<%=bWord %>&nbsp;&nbsp;&nbsp;&nbsp;
						<%if(state==0){%>
						状态：连载中 <%} %>
						<%if(state==1){%>
						 状态：已完结 <%} %></td>
				</tr>
				<tr>
					<td>得分：<%=grade %>&nbsp;&nbsp;&nbsp;&nbsp;评论数：<%=cnum %></td>
				</tr>
				<tr>
					<td>类型：<%=type %>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
			<tr><td colspan=8><font size=5>【章节列表】</font></td></tr>
			<tr bgcolor="F8B6DA">
				<td>章节号</td>
				<td>标题</td>
				<td>字数</td>
				<td>四季豆</td>
				<td>点击量</td>
			</tr>
			<%	ChapterDAO c=new ChapterDAO();
				ArrayList<Chapter> list=new ArrayList<Chapter>();
				list=c.selectlist(bID);

				SpendDAO s = new SpendDAO();
				for(int i=0;i<list.size();i++){%>
					<tr bgcolor="FAC9E4">
				 		<td><%=list.get(i).getCid() %></td>
				 		<td><%=list.get(i).getTitle() %></td>
				 		<td><%=list.get(i).getWords() %></td>
				 		<td><%=c.cost(list.get(i).getBid(), list.get(i).getCid()) %></td>
				 		<td><%=list.get(i).getCclick()%></td>
				 	</tr>
				 <%} %>
				<!-- <tr><td colspan=8><input type="submit" value="确认购买"></td></tr> -->	
		</table>	
		</form>	
		
	</div>
	<br><br>
	<div id="comment">
		<table id="rlist">
			<% 	RemarkDAO r=new RemarkDAO();
				Function f=new Function();
				ReaderDAO re=new ReaderDAO();
				WriterDAO w=new WriterDAO();
				ArrayList<Remark> list2=new ArrayList<Remark>();
				list2=r.selectlist(bID);
				
				if(list2.size()!=0){
				
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
				<tr bgcolor="FAC9E4">
					<td>评论人：<%=name %></td>
					<td>评论时间：<%=list2.get(i).getTime() %></td>
				</tr>
				<tr>
					<td>评论内容</td>
					<td><textarea rows="6" cols="50"><%=list2.get(i).getContent() %></textarea></td>
				</tr>
				<%if(list2.get(i).getWid()!=0)
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
				<%}} %>
		</table>
	</div>

<div align="center">
	<form action="DeleteBook" method="post">
		<button id=del_button type="button">删除书籍</button>
	</form>
</div>
<br><br><br><br>
</body>

</html>
