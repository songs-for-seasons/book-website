package DAO;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

public class Function {
	static public int isReader(int id){ //判断是否是读者
		int num = id;
		while(num >= 10){
			num = num / 10;
		}
		if(num == 1)
			return 1;
		else if(num == 5)
			return 2;
		else
			return 3;
	}
	
	static public String getTime(){
		String time;
		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	time = sDateFormat.format(new java.util.Date());
		return time;
	}
	
	//统计书的个数
	static public int getBookCount(){    
		int count = 0;
		try{
			DbConn db = new DbConn();
			Connection conn = db.getConnection();
			Statement sta = conn.createStatement();
			String str = "select count(*) from Books";
			ResultSet rset = sta.executeQuery(str);
			
			if(rset.next())
				count = rset.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	//统计读者个数
	static public int getReaderCount(){
		int count = 0;
		try{
			DbConn db = new DbConn();
			Connection conn = db.getConnection();
			Statement sta = conn.createStatement();
			String str = "select count(*) from Reader";
			ResultSet rset = sta.executeQuery(str);
			
			if(rset.next())
				count = rset.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	//统计作家个数
	static public int getWriterCount(){
		int count = 0;
		try{
			DbConn db = new DbConn();
			Connection conn = db.getConnection();
			Statement sta = conn.createStatement();
			String str = "select count(*) from Writer";
			ResultSet rset = sta.executeQuery(str);
			
			if(rset.next())
				count = rset.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	//统计消息个数，包括私信和举报
	static public int getMessageCount(){
		int count = 0;
		try{
			DbConn db = new DbConn();
			Connection conn = db.getConnection();
			Statement sta = conn.createStatement();
			String str = "select count(*) from Informing";
			ResultSet rset = sta.executeQuery(str);
			
			if(rset.next())
				count = rset.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	//发送公告,即管理员给每个用户发送私信
		static public void sendNotice(String title,String content){
			try{
				ArrayList<Reader> rlist = Function.getReaderList();
				ArrayList<Writer> wlist = Function.getWriterList();
				InformingDAO i = new InformingDAO();
				int messageid = getMessageCount()+1;
				for(int k=0; k<rlist.size(); k++)
				{
					while(i.isExist(messageid))	//messageid已经被使用
					{
						messageid ++;
					}
					Informing inform = new Informing(rlist.get(k).getRid(), messageid, 0, title+"^"+content, getTime(), 1);
					i.insert(inform);
					messageid ++;
				}

				for(int j=0; j<rlist.size(); j++)
				{
					while(i.isExist(messageid))	//messageid已经被使用
					{
						messageid ++;
					}
					Informing inform = new Informing(rlist.get(j).getRid(), messageid, 0, title+"^"+content, getTime(), 1);
					i.insert(inform);
					messageid ++;
				}
				
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	static public ArrayList<Reader> getReaderList() throws Exception{
		ReaderDAO r = new ReaderDAO();
		ArrayList<Reader> rlist=new ArrayList<Reader>();
		rlist = r.select();			//获取所有读者
		return rlist;
	}
	
	static public ArrayList<Writer> getWriterList() throws Exception{
		WriterDAO w = new WriterDAO();
		ArrayList<Writer> wlist=new ArrayList<Writer>();
		wlist = w.select();			//获取所有作者
		return wlist;
	}
	
	static public ArrayList<Books> getBooksList() throws Exception{
		BooksDAO b = new BooksDAO();
		ArrayList<Books> blist=new ArrayList<Books>();
		blist = b.select();			//获取所有book
		return blist;
	}
	
	static public ArrayList<Informing> getInformingList() throws Exception{
		InformingDAO i = new InformingDAO();
		ArrayList<Informing> ilist=new ArrayList<Informing>();
		ilist = i.selectid();			//获取所有informing
		return ilist;
	}
	
	static public String getTitle(String content) {
		String strArray[] = content.split("^");
		return strArray[0];
	}
	
	static public String getContent(String content) {
		String strArray[] = content.split("^");
		return strArray[1];
	}
}
