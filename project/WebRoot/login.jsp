<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>login</title>

<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp"> <!-- 跳转到主页面 -->
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
	</p>
</div>

<div id="reg_img">
	<div id="reg_wel" style="margin:-10px 0 0 300px;">欢迎使用“四时歌”</br></br>&nbsp;虚拟在线读书网</div>
	<div id="reg_ins" align="center">
		<form action="" method="post" style="margin:0 0 0 0;">
		<label>用户名：&nbsp;	<input class="reg_field" type="text" name="userid"/></label></br></br>
		<label>密&nbsp;&nbsp;码：&nbsp;	<input class="reg_field" type="password" name="password"/></label></label></br></br>
		<!-- <input id=reg_button type="button" value="取消"/>&nbsp;&nbsp;&nbsp;
		<input id=reg_button type="submit" value="登录" /> -->
		<script>
		function clickCancel() {
			//跳转至主页面
		}
		function clickConfirm(userid, password) {
			var str1 = userid.value;
			var str2 = password.value;
			if(str1=="") {
				alert("请输入用户名！");
				return(false);
			}
			else if(str2=="") {
				alert("请输入密码！");
				return(false);
			}
		}
		</script>
		<button id=reg_button type="button" onclick="clickCancel()">取消</button>&nbsp;&nbsp;&nbsp;
		<button id=reg_button type="button" onclick="return clickConfirm(userid, password)">确定</button>
		</form>
	</div>
</div>

</body>

<html>