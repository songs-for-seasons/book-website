package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;

import DAO.*;

public class ViewWriterBooks extends HttpServlet {		//得到某作家写的书的arraylist
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			int wid;
			wid = Integer.parseInt(request.getParameter("userid"));
			WriterDAO w = new WriterDAO();
			String wname = w.select(wid).getWname();
		
			BooksDAO b = new BooksDAO();
			ArrayList<Books> blist=new ArrayList<Books>();
		
			blist = b.select(wname);		//得到某位作家的所有书籍
			request.getSession().setAttribute("blist",blist);
			//查看所有书籍
			//使用方法：
			//Iterator i=al.iterator();
			//while(i.hasNext()){
			   //out.println(i.next());
			//}
			response.sendRedirect("check_allbooks.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			//获取所有作者
		
		
		
		//查看详细内容
		//response.sendRedirect("check_allbook2s.jsp");    
	}
}

