package Servlet;

import javax.servlet.http.*;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import DAO.Reader;
import DAO.Writer;
import DAO.Function;

public class ViewUsers extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.getSession().setAttribute("userid",90000);
		request.getSession().setAttribute("username","Admin");
		
		try {
			ArrayList<Reader> rlist = Function.getReaderList();
			ArrayList<Writer> wlist = Function.getWriterList();
			request.getSession().setAttribute("rlist",rlist);
			request.getSession().setAttribute("wlist",wlist);
			//使用方法：
			//Iterator i=al.iterator();
			//while(i.hasNext()){
			   //out.println(i.next());
			//}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.sendRedirect("check_allusers.jsp");    
	}
}
