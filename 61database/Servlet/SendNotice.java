package Servlet;

import javax.servlet.http.*;
import java.io.*;
import DAO.Function;


public class SendNotice extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String title;
        String content;
        
        title = request.getParameter("title");	//标题
        content = request.getParameter("content");	//内容
        //request.getSession().setAttribute("userid",90000);
		//request.getSession().setAttribute("username","Admin");
		try {
			Function.sendNotice(title,content);		//发送公告
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		
        response.sendRedirect("send_notice.jsp");    //无需输出，弹出警示框
	}
}
