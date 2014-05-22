<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<title>接收举报</title>
<style type="text/css"></style>
<link rel="styleSheet" href="css/web.css" type="text/css">
</head>

<body background="image/background.jpg" alt="background" sroll="auto">

<div style="padding-left:150px; ">
	<p>
		<a href="main.html">
		<image src="image/logo.png" alt="logo" width="300" height="100">
		</a>
		<label id="admin">管理员：Admin&nbsp;&nbsp;&nbsp;
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

<div>
<table align="center" width="800">
<form action="" method="post"></form>
<tbody>
	<tr bgcolor="F8B6DA">
		<td>编号</td>
		<td>发送日期</td>
		<td>发信人</td>
		<td>标题</td>
	</tr>
	</br>
	<tr>
		<td>1</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>2</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>3</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>4</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr>
		<td>5</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>6</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>7</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>8</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>9</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>10</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr>
		<td>11</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>12</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>13</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>14</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>15</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>16</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr>
		<td>17</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>18</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>19</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>20</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>21</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>22</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr>
		<td>23</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>24</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>25</td>
		<td>2014.3.8</td>
		<td><a href="user_info.html">JQ</a></td>
		<td><a href="message.html">hello world</a></td>
	</tr>
	<tr bgcolor="FAC9E4">
		<td>26</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	<tr>
		<td>27</td>
		<td>2014.3.7</td>
		<td><a href="user_info??.html">JQQ</a></td>
		<td><a href="message??.html">hello world before</a></td>
	</tr>
	
</tbody>
</table>
</div>

</br></br></br></br>
</body>

<html>

