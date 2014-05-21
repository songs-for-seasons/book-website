package Servlet;

import javax.servlet.http.*;
import java.io.*;
import DAO.*;

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
			while(i.count(messageid)>0)	//messageid�Ѿ���ʹ��
			{
				messageid++;
			}
			bid = (Integer) request.getSession().getAttribute("bookid");
			title = request.getParameter("title");	//����
			content = request.getParameter("content");	//reason
			//insert into Informing (id,mid,bid,reason,time,type) values (?,?,?,?,?,?)
			//type = 0�ٱ�     type = 1˽��
			Informing inform = new Informing(userid, messageid, bid, title+"^"+content, Function.getTime(), 0);
			i.insert(inform);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        response.sendRedirect("report_succ.jsp");   
	}
}
