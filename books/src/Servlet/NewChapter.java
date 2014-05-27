package Servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

public class NewChapter extends HttpServlet{
	
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
		int bid = Integer.parseInt(request.getParameter("bid").trim());
		//int cid = Integer.parseInt(request.getParameter("cid").trim());
		String ctitle = request.getParameter("ctitle");
		String content = request.getParameter("content");
		Date date= new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String parse = dateFormat.format(date);
		String time = dateFormat.format(date);
		
		try{
			ChapterDAO cdao = new ChapterDAO();
			ArrayList<Chapter> list = cdao.selectlist(bid);
			Chapter c = new Chapter(list.size()+1,uid,bid,ctitle,content,content.length(),0,0,time);
			cdao.insert(c);
			WriterDAO wdao = new WriterDAO();
			//Writer w = wdao.select(uid);
			//request.getSession().setAttribute("userid",w.getWid());
			//request.getSession().setAttribute("username",w.getWname());
			//BooksDAO bdao = new BooksDAO();
			//Books b = bdao.select(bid);
			
			//Chapter c1 = cdao.select(bid, list.size()+1);
			/*request.getSession().setAttribute("bid",b.getBid());
			request.getSession().setAttribute("bname",b.getBname());
			request.getSession().setAttribute("cid",c1.getCid());
			request.getSession().setAttribute("ctitle",c1.getTitle());
			request.getSession().setAttribute("content",c1.getContent());
			response.sendRedirect("chapterpage.jsp");    //跳转到reader页面*/
			Writer w = wdao.select(uid);
			request.getSession().setAttribute("userid",w.getWid());
			request.getSession().setAttribute("username",w.getWname());
			request.getSession().setAttribute("sex",w.getSex());
			request.getSession().setAttribute("level",w.getLevel());
			request.getSession().setAttribute("type",1);
			request.getSession().setAttribute("birthday",w.getWdate());
			request.getSession().setAttribute("intro",w.getWintro());
			request.getSession().setAttribute("password",w.getWpw());
			request.getSession().setAttribute("balance",w.getCoin());
			response.sendRedirect("writerpage.jsp");    //跳转到writer页面
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}

