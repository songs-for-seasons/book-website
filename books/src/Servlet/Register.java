package Servlet;

import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import DAO.*;
import DAO.Reader;
import DAO.Writer;

public class Register extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String username;
        String password;
        String password_check;
        String type;
        String user;
        SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String  today = sDateFormat.format(new java.util.Date());
        username = request.getParameter("username");	//��ȡ����
        password = request.getParameter("password");	//��ȡ����
        password_check = request.getParameter("password_check");	//��ȡ�ٴ����������
        user = request.getParameter("type");	
        if(!password.equals(password_check))
        {
        	response.setContentType("text/html");
        	PrintWriter out = response.getWriter();
        	out.println("<html><title>Register</title><body>");
        	out.println("<h2>�����������벻һ�£����飡</h2><hr>");
        	out.println("</body></html>");
        }
        	
        else if(user.equals("reader"))		//��ť�Ƕ���
        {
        	try{
        		ReaderDAO r = new ReaderDAO();
        		Reader reader = new Reader();
        		int rid = Function.getReaderCount()+1;
        		while(r.isExist(rid))	//rid�Ѿ���ʹ��
        		{
        			rid ++;
        		}
        		reader.setRid(10000 + rid);		
        		reader.setRname(username);
        		reader.setRpw(password);
        		reader.setRdate(today);
        	
				boolean flag = r.insert(reader);
				if(flag == true)
				{
					type = "����";
					request.getSession().setAttribute("userid",reader.getRid());
					request.getSession().setAttribute("username",reader.getRname());
//					request.getSession().setAttribute("readerpassword", reader.getRpw());
//					request.getSession().setAttribute("type", type);
					response.sendRedirect("homepage.jsp");
				}
				else
				{
					response.setContentType("text/html");
		        	PrintWriter out = response.getWriter();
		        	out.println("<html><title>Register</title><body>");
		        	out.println("<h2>�û����ѱ�ע�ᣬ������û�����</h2><hr>");
		        	out.println("</body></html>");
				}
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
        else if(user.equals("writer"))		//��ť������
        {
        	try{
        		WriterDAO w = new WriterDAO();
        		Writer writer = new Writer();
        		int wid = Function.getWriterCount()+1;
        		while(w.isExist(wid))	//wid�Ѿ���ʹ��
        		{
        			wid ++;
        		}
        		writer.setWid(50000 + wid);		
        		writer.setWname(username);
        		writer.setWpw(password);
        		writer.setWdate(today);
        	
				boolean flag = w.insert(writer);
				if(flag == true)
				{
					type = "����";
					request.getSession().setAttribute("userid",writer.getWid());
					request.getSession().setAttribute("username",writer.getWname());
//					request.getSession().setAttribute("writerpassword", writer.getWpw());
//					request.getSession().setAttribute("type", type);
					response.sendRedirect("homepage.jsp");
				}
				else
				{
					response.setContentType("text/html");
		        	PrintWriter out = response.getWriter();
		        	out.println("<html><title>Register</title><body>");
		        	out.println("<h2>�û����ѱ�ע�ᣬ������û�����</h2><hr>");
		        	out.println("</body></html>");
				}
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }	
        
            
	}
}
