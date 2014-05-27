package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;

import DAO.*;

public class Consume_record extends HttpServlet {		//�õ�ĳ����д�����arraylist
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			int userid;
			userid = Integer.parseInt(request.getParameter("userid"));
			SpendDAO spend = new SpendDAO();
			ArrayList<Spend> slist=new ArrayList<Spend>();
			slist = spend.select(userid);
			request.getSession().setAttribute("slist",slist);
			response.sendRedirect("consume_record.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			//��ȡ��������
		
		
		
		//�鿴��ϸ����
		//response.sendRedirect("check_allbook2s.jsp");    
	}
}

