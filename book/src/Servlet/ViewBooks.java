package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import DAO.*;
import DAO.Reader;
import DAO.Writer;

public class ViewBooks extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.getSession().setAttribute("userid",90000);
		request.getSession().setAttribute("username","Admin");
		
		BooksDAO b = new BooksDAO();
		ArrayList<Books> blist=new ArrayList<Books>();
		
		try {
			blist = b.select();
			request.getSession().setAttribute("blist",blist);
			//�鿴�����鼮
			//ʹ�÷�����
			//Iterator i=al.iterator();
			//while(i.hasNext()){
			   //out.println(i.next());
			//}
			response.sendRedirect("check_allbooks.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			//��ȡ��������
		
		
		
		//�鿴��ϸ����
		//response.sendRedirect("check_allbook2s.jsp");    
	}
}

