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

public class EditBook extends HttpServlet{
	
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		int uid = Integer.parseInt(request.getParameter("userid").trim());
		int bid = Integer.parseInt(request.getParameter("bid").trim());
		String bname = request.getParameter("bname");
		String bintro = request.getParameter("bintro");
		Date date= new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String parse = dateFormat.format(date);
		String time = dateFormat.format(date);
		
		try{
			BooksDAO bdao = new BooksDAO();
			Books b = bdao.select(bid);
			b.setBname(bname);
			b.setBintro(bintro);
			bdao.modify(b);
			WriterDAO wdao = new WriterDAO();
			Writer w = wdao.select(uid);
			request.getSession().setAttribute("userid",w.getWid());
			request.getSession().setAttribute("username",w.getWname());	
			Books b1 = bdao.select(bid);
			request.getSession().setAttribute("bid",b1.getBid());
			request.getSession().setAttribute("bname",b1.getBname());
			request.getSession().setAttribute("wid",b1.getWid());
			request.getSession().setAttribute("wname",w.getWname());
			request.getSession().setAttribute("bintro",b1.getBintro());
			request.getSession().setAttribute("bword",b.getWords());
			request.getSession().setAttribute("state",b1.getIsfinished());
			request.getSession().setAttribute("grade",b1.getBgrade());
			request.getSession().setAttribute("cnum",b1.getRemark());
			request.getSession().setAttribute("type",b1.getType());
			request.getSession().setAttribute("time",time);
			response.sendRedirect("bhomepage.jsp");    //跳转到reader页面
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

