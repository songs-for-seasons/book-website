<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="Servlet.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>充值</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">
<%
session=request.getSession();
Integer uid=(Integer)(session.getAttribute("userid"));
 %>

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
	</p>
</div>

<div id="menu" class="menu">
<ul>
	<li><a href="message.jsp">修改个人信息</a></li>
	<li><a href="message.jsp">个人书屋</a></li>
	<li><a href="charge.jsp">充值</a></li>
	<li><a href="consume_record.jsp">消费记录</a></li>
</ul>
</div>
</br>

	<script>
		function clickCancel() {
			//跳转至主页面
			window.location.href = "personalpage.jsp";
		}
		function clickConfirm(coin) {
			if(coin.value == "") {
				alert("请输入金钱！");
				return(false);
			}
		}
	</script>
<div align="center">
	</br>
	<form action="Charge" method="post" style="margin:0 0 0 0;">
		<label><font size=5>充值的四季豆数量：<input class="charge_field" type="text" name="coin"/></font>
		</label></br></br>
		<input type="hidden" name="uid" value="<%=uid %>">
		<!--<button id=reg_button type="button" onclick="clickCancel()">取消</button>&nbsp;&nbsp;&nbsp;
		 <button id=reg_button type="button" onclick="">确定</button> -->
		<input id=reg_button type="submit" onclick="return clickConfirm(coin)" value="确定">
	</form>
</br></br></br>
</div>

</br></br></br></br>
</body>

</html>

