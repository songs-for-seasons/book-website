package Servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class erchuan extends HttpServlet{
	
	public void init(ServletConfig config){
		try{
			super.init(config);
		}
		catch(ServletException se){
			se.printStackTrace();
		}
		
	}
	public void destroy(){
		super.destroy();
	}
	//增加用户信息
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
		int uid = Integer.parseInt(request.getParameter("userid").trim());
		String username = request.getParameter("username");
		int bid = Integer.parseInt(request.getParameter("bid").trim());
		String bname = request.getParameter("bname");
		System.out.println("name:");
		System.out.println(bname);
		
		try{
			
			request.getSession().setAttribute("userid",uid);
			request.getSession().setAttribute("username",username);	
			request.getSession().setAttribute("bid",bid);
			request.getSession().setAttribute("bname",bname);
			response.sendRedirect("writechapter.jsp");    //跳转到reader页面
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

