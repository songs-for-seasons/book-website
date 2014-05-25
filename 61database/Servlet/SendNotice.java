package Servlet;

import javax.servlet.http.*;
import java.io.*;
import DAO.Function;


public class SendNotice extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String title;
        String content;
        
        title = request.getParameter("title");	//����
        content = request.getParameter("content");	//����
        //request.getSession().setAttribute("userid",90000);
		//request.getSession().setAttribute("username","Admin");
		try {
			Function.sendNotice(title,content);		//���͹���
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		
        response.sendRedirect("send_notice.jsp");    //���������������ʾ��
	}
}
