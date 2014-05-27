package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class visitwriter extends HttpServlet{
	
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
		int uid = Integer.parseInt(request.getParameter("userID").trim());
		int wid = Integer.parseInt(request.getParameter("wid").trim());
		Function f = new Function();
		int flag = f.isReader(uid);
		
		try{
			if(flag == 1){
				ReaderDAO rdao = new ReaderDAO();
				Reader r = rdao.select(uid);
				request.getSession().setAttribute("userID",r.getRid());
				request.getSession().setAttribute("username",r.getRname());
				
			}
			else if(flag == 2){
				WriterDAO wdao = new WriterDAO();
				Writer w = wdao.select(uid);
				request.getSession().setAttribute("userID",w.getWid());
				request.getSession().setAttribute("username",w.getWname());
				
			}
			WriterDAO wdao = new WriterDAO();
			Writer w = wdao.select(wid);
			request.getSession().setAttribute("wID",w.getWid());
			request.getSession().setAttribute("wname",w.getWname());
			request.getSession().setAttribute("sex",w.getSex());
			request.getSession().setAttribute("level",w.getLevel());
			request.getSession().setAttribute("type",1);
			request.getSession().setAttribute("date",w.getWdate());
			request.getSession().setAttribute("intro",w.getWintro());
			request.getSession().setAttribute("password",w.getWpw());
			request.getSession().setAttribute("balance",w.getCoin());
			response.sendRedirect("visitwriter.jsp");    //跳转到reader页面
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

