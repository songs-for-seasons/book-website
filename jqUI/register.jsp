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
<script>
		function clickCancel() {
			//跳转至主页面
			window.location.href = "homepage.jsp";
		}
		function clickRegister(username, password, password_check) {
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
<div id="reg_img" >
	<div id="reg_wel" style="margin:-10px 0 0 300px;">欢迎注册“四时歌”</br></br>&nbsp;虚拟在线读书网</div>
	<div id="reg_ins" align="center">
		<form action="Register" method="post" style="margin:0 0 0 0;">
		<span style="line-height:38px;">
			<label>用户名：&nbsp;&nbsp;<input class="reg_field" type="text" name="username"/></label></br>
			<label>密&nbsp;&nbsp;码：&nbsp;&nbsp;<input class="reg_field" type="password" name="password"/></label></br>
			<label>确认密码：<input class="reg_field" type="password" name="password_check"/></label></br>
			<label>性&nbsp;&nbsp;别：&nbsp;&nbsp;</label>
			<label><input type="radio" name="sex" value="male" value="female" />男</label>&nbsp;&nbsp;
			<label><input type="radio" name="sex" value="male" value="female" />女</label>&nbsp;&nbsp;</br>
			<label>生&nbsp;&nbsp;日：&nbsp;</label>
			<label>
				<select id="year" style="width:60px">
					<option value="2005" selected="selected">2005</option>
					<% 	int i=2004;
						for(; i>=1950; i--) {%>
						<option value="<%=Integer.toString(i) %>"><%=i %></option>
						<%}%>
				</select>&nbsp;
				<select id="month" style="width:60px">
					<option value="1" selected="selected">1</option>
					<% 	int mon=12;
						for(i=0; i<=12; i++) {%>
						<option value="<%=Integer.toString(i) %>"><%=i %></option>
						<%}%>
				</select>
			</label></br>
			<label><input type="radio" name="type" value="writer" /> <font size=5>作家</font></label>&nbsp;&nbsp;&nbsp;
			<label><input type="radio" name="type" value="reader" checked="true"/> <font size=5>读者</font></label>
			</br>
			<a href="login.jsp" style="color:white"><font size=3>老用户登录</font></a>&nbsp;&nbsp;&nbsp;
			<button id=reg_button type="button" name="cancel" onclick="clickCancel()">取消</button>&nbsp;&nbsp;&nbsp;
			<input id=reg_button type="submit" onclick="return clickRegister(username,password,password_check)" value="注册" /></br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label><b>登录ID为：??<font color="red" >&nbsp;&nbsp;&nbsp;*请务必记住</font></b></label>
		</span>
		</form>
		</div>
		
</div>

</body>
<br><br>
</html>