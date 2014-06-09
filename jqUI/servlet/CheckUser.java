package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

@SuppressWarnings("serial")
public class CheckUser extends HttpServlet{
	
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
		int id = Integer.parseInt(request.getParameter("userid").trim());
		Function f = new Function();
		int flag = f.isReader(id);
		
		try{
			if(flag == 1){
				ReaderDAO rdao = new ReaderDAO();
				Reader r = rdao.select(id);
				request.getSession().setAttribute("userid",r.getRid());
				request.getSession().setAttribute("username",r.getRname());
				request.getSession().setAttribute("sex",r.getSex());
				request.getSession().setAttribute("level",r.getLevel());
				request.getSession().setAttribute("type",0);
				request.getSession().setAttribute("birthday",r.getRdate());
				request.getSession().setAttribute("intro",r.getRintro());
				request.getSession().setAttribute("password",r.getRpw());
				request.getSession().setAttribute("balance",r.getCoin());
				response.sendRedirect("view_reader.jsp");    //跳转到reader页面
				
			}
			else if(flag == 2){
				WriterDAO wdao = new WriterDAO();
				Writer w = wdao.select(id);
				request.getSession().setAttribute("userid",w.getWid());
				request.getSession().setAttribute("username",w.getWname());
				request.getSession().setAttribute("sex",w.getSex());
				request.getSession().setAttribute("level",w.getLevel());
				request.getSession().setAttribute("type",1);
				request.getSession().setAttribute("birthday",w.getWdate());
				request.getSession().setAttribute("intro",w.getWintro());
				request.getSession().setAttribute("password",w.getWpw());
				request.getSession().setAttribute("balance",w.getCoin());
				
				response.sendRedirect("view_writer.jsp");    //跳转到writer页面
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

