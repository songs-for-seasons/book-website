package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class Charge extends HttpServlet{
	
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

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		int uid = Integer.parseInt(request.getParameter("uid").trim());
		int coin = Integer.parseInt(request.getParameter("coin").trim());
		int flag = Function.isReader(uid);
		
		try{
			if(flag == 1){
				ReaderDAO rdao = new ReaderDAO();
				Reader r = rdao.select(uid);
				rdao.addCoin(r, coin);
				request.getSession().setAttribute("userid",r.getRid());
				request.getSession().setAttribute("username",r.getRname());
				
			}
			else if(flag == 2){
				WriterDAO wdao = new WriterDAO();
				Writer w = wdao.select(uid);
				wdao.addCoin(w, coin);
				request.getSession().setAttribute("userid",w.getWid());
				request.getSession().setAttribute("username",w.getWname());
				
			}
			request.getSession().setAttribute("coin_add",coin);
			response.sendRedirect("charge.jsp");    
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}


