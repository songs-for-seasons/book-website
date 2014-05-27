<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>发送公告</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;</br>
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
</br>

<script>
function clickSend(title, content) {
			var str1 = title.value;
			var str2 = content.value;
			if(str1=="") {
				alert("请输入标题！");
				return(false);
			}
			else if(str2=="") {
				alert("请输入内容！");
				return(false);
			}
		}
</script>
<div>
	<form action="SendNotice" method="get" style="margin:0 0 400px 0;">
	<font size=5 style='position:absolute; left:400px'>
		标题：<input class="message_title_field" type="text" name="title"></br></br>
		内容：</br>
		<textarea class="message_field" name="content"></textarea></br></font>
		<div align="center">
			<input id=message_button type="button" value="取消"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id=message_button type="submit" onclick="return clickSend(title, content)" value="发送" />
		</div>
	</form>
</div>


</br></br></br></br>
</body>

</html>

