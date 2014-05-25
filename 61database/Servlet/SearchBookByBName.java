package Servlet;

import javax.servlet.http.*;
import java.io.*;
import DAO.*;

public class SearchBookByBName extends HttpServlet {	//得到所有书籍的arraylist
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String bname;
		bname = request.getParameter("bname");
		BooksDAO b = new BooksDAO();
		WriterDAO w = new WriterDAO();
		try {
			
			Books book = b.select(bname);
			request.getSession().setAttribute("bid",book.getBid());
			request.getSession().setAttribute("bname",book.getBname());
			request.getSession().setAttribute("wid",book.getWid());
			request.getSession().setAttribute("wname",w.select(book.getWid()).getWname());
			request.getSession().setAttribute("bintro",book.getBintro());
			request.getSession().setAttribute("bclick",book.getBclick());
			request.getSession().setAttribute("words",book.getWords());
			request.getSession().setAttribute("remark",book.getRemark());
			request.getSession().setAttribute("cost",book.getCost());
			request.getSession().setAttribute("grade",book.getBgrade());
			request.getSession().setAttribute("inform",book.getInform());
			request.getSession().setAttribute("state",book.getIsfinished());
			request.getSession().setAttribute("type",book.getType());
			//request.getSession().setAttribute("cnum",book.get);
			
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

