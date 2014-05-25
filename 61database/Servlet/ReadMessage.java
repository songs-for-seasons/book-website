package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;

import DAO.*;

public class ReadMessage extends HttpServlet {		//得到某作家写的书的arraylist
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			int userid;
			userid = Integer.parseInt(request.getParameter("userid"));
			InformingDAO i = new InformingDAO();
			ArrayList<Informing> ilist=new ArrayList<Informing>();
			ilist = i.selectid(userid);
			request.getSession().setAttribute("ilist",ilist);
			
			int mid;
			mid = Integer.parseInt(request.getParameter("mid"));
			Informing inform = i.select(mid);
			request.getSession().setAttribute("id",inform.getId());
			request.getSession().setAttribute("mid",inform.getMid());
			request.getSession().setAttribute("bid",inform.getBid());
			request.getSession().setAttribute("reason",inform.getReason());
			request.getSession().setAttribute("itime",inform.getTime());
			request.getSession().setAttribute("itype",inform.getType());
			
			//查看所有书籍
			//使用方法：
			//Iterator i=al.iterator();
			//while(i.hasNext()){
			   //out.println(i.next());
			//}
			response.sendRedirect("read_message.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			//获取所有作者
		
		
		
		//查看详细内容
		//response.sendRedirect("check_allbook2s.jsp");    
	}
}

