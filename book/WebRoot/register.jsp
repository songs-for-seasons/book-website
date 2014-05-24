<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>register</title>

<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="homepage.jsp"> 	<!-- 跳转到主页面 -->
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
	</p>
</div>

<div id="reg_img" >
	<div id="reg_wel" style="margin:-10px 0 0 300px;">欢迎注册“四时歌”</br></br>&nbsp;虚拟在线读书网</div>
	<div id="reg_ins" align="center">
		<form action="Register" method="post" style="margin:0 0 0 0;">
		<label>用户名：&nbsp;	<input class="reg_field" type="text" name="username"/></label></br></br>
		<label>密&nbsp;&nbsp;码：&nbsp;	<input class="reg_field" type="password" name="password"/></label></br></br>
		<label>确认密码：<input class="reg_field" type="password" name="password_check"/></label></br></br>
		<script>
		function clickCancel() {
			//跳转到主界面
		}
		function clickWriter(username, password, password_check) {
			var str1 = username.value;
			var str2 = password.value;
			var str3 = password_check.value;
			if(str1=="") {
				alert("请输入用户名！");
				return(false);
			}
			else if(str2=="") {
				alert("请输入密码！");
				return(false);
			}
			else if(str3==""){
				alert("请确认输入的密码！");
				return(false);
			}
			else if(str2 != str3) {
				alert("两次输入的密码不一致，请重新输入！");
				return(false);
			}
		}
		function clickReader(username, password, password_check) {
			var str1 = username.value;
			var str2 = password.value;
			var str3 = password_check.value;
			if(str1=="") {
				alert("请输入用户名！");
				return(false);
			}
			else if(str2=="") {
				alert("请输入密码！");
				return(false);
			}
			else if(str3==""){
				alert("请确认输入的密码！");
				return(false);
			}
			else if(str2 != str3) {
				alert("两次输入的密码不一致，请重新输入！");
				return(false);
			}
		}
		
		</script>
		<!--<input id=reg_button type="button" value="取消注册"/>&nbsp;&nbsp;&nbsp;
		<input id=reg_button type="submit" value="注册作家" />&nbsp;&nbsp;&nbsp;
		-->
		<button id=reg_button type="button" name="cancel" onclick="clickCancel()">取消注册</button>&nbsp;&nbsp;&nbsp;
		<!--  <button id=reg_button type="button" name="reg_w" onclick="clickWriter(username,password,password_check)">注册作家</button>&nbsp;&nbsp;&nbsp;
		<button id=reg_button type="button" name="reg_r" onclick="clickReader(username,password,password_check)">注册读者</button>-->
		<input id=reg_button type="submit" onclick="return clickReader(username,password,password_check)" value="注册读者" />
		</form>
	</div>
</div>

</body>
<br><br>
</html>