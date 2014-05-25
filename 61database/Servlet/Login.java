package Servlet;

import javax.servlet.http.*;
import java.io.*;
import DAO.*;
import DAO.Reader;
import DAO.Writer;

public class Login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		int userid;
        String password;
        
        userid = Integer.parseInt(request.getParameter("userid"));	//读取id
        password = request.getParameter("password");	//读取密码
		ReaderDAO r = new ReaderDAO();
		WriterDAO w = new WriterDAO();
		try{
			if(userid == 90000)			//管理员账号登陆
			{
				if(password.equals(password))
				{
					request.getSession().setAttribute("userid",90000);
					request.getSession().setAttribute("username","Admin");
					response.sendRedirect("check_allusers.jsp");    //跳转到管理员页面
				}
				else
				{
					response.setContentType("text/html");
		        	PrintWriter out = response.getWriter();
		        	out.println("<html><title>Login</title><body>");
		        	out.println("<h2>密码错误，请重新输入！</h2><hr>");
		        	out.println("</body></html>");
				}
			}
				
			else
			{
				if(r.check(userid, password))
				{
					Reader reader = r.select(userid);
					request.getSession().setAttribute("userid",userid);
					request.getSession().setAttribute("username",reader.getRname());
					response.sendRedirect("homepage.jsp");    //跳转到用户页面
				}
				else if(w.check(userid, password))
				{
					Writer writer = w.select(userid);
					request.getSession().setAttribute("userid",userid);
					request.getSession().setAttribute("username",writer.getWname());
					response.sendRedirect("homepage.jsp");    //跳转到用户页面
				}
				else
				{
					response.setContentType("text/html");
		        	PrintWriter out = response.getWriter();
		        	out.println("<html><title>Login</title><body>");
		        	out.println("<h2>密码错误，请重新输入！!!!!!!!</h2><hr>");
		        	out.println("</body></html>");
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
