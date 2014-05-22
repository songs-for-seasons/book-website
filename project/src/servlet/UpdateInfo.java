package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class UpdateInfo extends HttpServlet{
	
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
		String username = request.getParameter("username");
		String usersex = request.getParameter("sex");
		String userpassword = request.getParameter("password");
		Function f = new Function();
		int flag = f.isReader(id);
		
		try{
			if(flag == 1){
				ReaderDAO rdao = new ReaderDAO();
				Reader r = rdao.select(id);
				r.setRname(username);
				r.setSex(usersex);
				r.setRpw(userpassword);
				rdao.modify(r);
				Reader r1 = rdao.select(id);
				request.getSession().setAttribute("userid",r1.getRid());
				request.getSession().setAttribute("username",r1.getRname());
				request.getSession().setAttribute("sex",r1.getSex());
				request.getSession().setAttribute("level",r1.getLevel());
				request.getSession().setAttribute("type",0);
				request.getSession().setAttribute("birthday",r1.getRdate());
				request.getSession().setAttribute("intro",r1.getRintro());
				request.getSession().setAttribute("password",r1.getRpw());
				request.getSession().setAttribute("balance",r1.getCoin());
				response.sendRedirect("personalpage.jsp");    //跳转到reader页面
				
			}
			else if(flag == 2){
				WriterDAO wdao = new WriterDAO();
				Writer w = wdao.select(id);
				w.setWname(username);
				w.setSex(usersex);
				w.setWpw(userpassword);
				wdao.modify(w);
				Writer w1 = wdao.select(id);
				request.getSession().setAttribute("userid",w1.getWid());
				request.getSession().setAttribute("username",w1.getWname());
				request.getSession().setAttribute("sex",w1.getSex());
				request.getSession().setAttribute("level",w1.getLevel());
				request.getSession().setAttribute("type",1);
				request.getSession().setAttribute("birthday",w1.getWdate());
				request.getSession().setAttribute("intro",w1.getWintro());
				request.getSession().setAttribute("password",w1.getWpw());
				request.getSession().setAttribute("balance",w1.getCoin());
				response.sendRedirect("writerpage.jsp");    //跳转到writer页面
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

