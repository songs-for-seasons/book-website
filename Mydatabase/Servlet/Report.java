package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import DAO.*;
import DAO.Reader;
import DAO.Writer;

public class Report extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			int userid;
			int bid;
			String title;
			String content;
        
			userid = (Integer) request.getSession().getAttribute("userid");
			InformingDAO i = new InformingDAO();
			int messageid = Function.getMessageCount()+1;
			while(i.count(messageid)>0)	//messageid已经被使用
			{
				messageid++;
			}
			bid = (Integer) request.getSession().getAttribute("bookid");
			title = request.getParameter("title");	//标题
			content = request.getParameter("content");	//reason
			//insert into Informing (id,mid,bid,reason,time,type) values (?,?,?,?,?,?)
			//type = 0举报     type = 1私信
			Informing inform = new Informing(userid, messageid, bid, title+"^"+content, Function.getTime(), 0);
			i.insert(inform);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        response.sendRedirect("report_succ.jsp");   
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
		int uid = Integer.parseInt(request.getParameter("userid").trim());
		int bid = Integer.parseInt(request.getParameter("bid").trim());
		int cid = Integer.parseInt(request.getParameter("cid").trim());
		int num = Integer.parseInt(request.getParameter("reason").trim());
		Date date= new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String parse = dateFormat.format(date);
		String time = dateFormat.format(date);
		Function f = new Function();
		int flag = f.isReader(uid);
		String content = "";
		if(num == 0)
			content = "本章节含有色情信息";
		else if(num == 1)
			content = "本章节含有暴力信息";
		else if(num == 2)
			content = "本章节含有反动信息";
		else if(num == 3)
			content = "本章节有抄袭嫌疑";
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
			int inform = b.getInform() + 1;
			b.setInform(inform);
			bdao.modify(b);
			b = bdao.select(bid);
			ChapterDAO cdao = new ChapterDAO();
			Chapter c = cdao.select(bid, cid);
			WriterDAO wdao = new WriterDAO();
			Writer w = wdao.select(b.getWid());
			InformingDAO indao = new InformingDAO();
			int messageid = Function.getMessageCount()+1;
			while(indao.count(messageid)>0)	//messageid已经被使用
			{
				messageid++;
			}
			Informing in = new Informing(uid,messageid,bid,content,time,0);
			indao.insert(in);
			/*request.getSession().setAttribute("wid",b.getWid());
			request.getSession().setAttribute("wname",w.getWname());
			request.getSession().setAttribute("bid",b.getBid());
			request.getSession().setAttribute("bname",b.getBname());
			request.getSession().setAttribute("cid",c.getCid());
			request.getSession().setAttribute("ctitle",c.getTitle());
			request.getSession().setAttribute("content",c.getContent());
			response.sendRedirect("chapterpage.jsp");    //跳转到reader页面*/
			request.getSession().setAttribute("bid",b.getBid());
			request.getSession().setAttribute("bname",b.getBname());
			request.getSession().setAttribute("wid",b.getWid());
			request.getSession().setAttribute("wname",w.getWname());
			request.getSession().setAttribute("bintro",b.getBintro());
			request.getSession().setAttribute("bword",b.getWords());
			request.getSession().setAttribute("state",b.getIsfinished());
			request.getSession().setAttribute("grade",b.getBgrade());
			request.getSession().setAttribute("cnum",b.getRemark());
			request.getSession().setAttribute("type",b.getType());
			//request.getSession().setAttribute("time",c.getUpdatetime());
			response.sendRedirect("bhomepage.jsp");   
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
			
		
		
		
	}
}
