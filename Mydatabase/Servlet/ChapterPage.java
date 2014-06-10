package Servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class ChapterPage extends HttpServlet{
	
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
		int cid = Integer.parseInt(request.getParameter("cid").trim());
		Function f = new Function();
		int flag = f.isReader(uid);
		
		try{
			if(flag == 1){
				ReaderDAO rdao = new ReaderDAO();
				Reader r = rdao.select(uid);
				request.getSession().setAttribute("userid",r.getRid());
				request.getSession().setAttribute("username",r.getRname());
				
			}
			else if(flag == 2){
				WriterDAO wdao = new WriterDAO();
				Writer w = wdao.select(uid);
				request.getSession().setAttribute("userid",w.getWid());
				request.getSession().setAttribute("username",w.getWname());
				
			}
			BooksDAO bdao = new BooksDAO();
			Books b = bdao.select(bid);
			ChapterDAO cdao = new ChapterDAO();
			Chapter c = cdao.select(bid, cid);
			WriterDAO wdao = new WriterDAO();
			Writer w = wdao.select(b.getWid());
			request.getSession().setAttribute("wid",b.getWid());
			request.getSession().setAttribute("wname",w.getWname());
			request.getSession().setAttribute("bid",b.getBid());
			request.getSession().setAttribute("bname",b.getBname());
			request.getSession().setAttribute("cid",c.getCid());
			request.getSession().setAttribute("ctitle",c.getTitle());
			request.getSession().setAttribute("content",c.getContent());
			response.sendRedirect("chapterpage.jsp");    //跳转到reader页面
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

