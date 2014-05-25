package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;

import DAO.*;

public class ViewWriterBooks extends HttpServlet {		//�õ�ĳ����д�����arraylist
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			int wid;
			wid = Integer.parseInt(request.getParameter("userid"));
			WriterDAO w = new WriterDAO();
			String wname = w.select(wid).getWname();
		
			BooksDAO b = new BooksDAO();
			ArrayList<Books> blist=new ArrayList<Books>();
		
			blist = b.select(wname);		//�õ�ĳλ���ҵ������鼮
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

