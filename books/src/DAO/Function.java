package DAO;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

public class Function {
	static public int isReader(int id){ //�ж��Ƿ��Ƕ���
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
	
	//ͳ����ĸ���
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
	
	//ͳ�ƶ��߸���
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
	
	//ͳ�����Ҹ���
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
	
	//ͳ����Ϣ����������˽�ź;ٱ�
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
	
	//���͹���,������Ա��ÿ���û�����˽��
	static public void sendNotice(String title,String content){
		try{
			ArrayList<Reader> rlist = Function.getReaderList();
			ArrayList<Writer> wlist = Function.getWriterList();
			Iterator<Reader> it = rlist.iterator();
			Iterator<Writer> it2 = wlist.iterator();
			//insert into Informing (id,mid,bid,reason,time,type) values (?,?,?,?,?,?)
			//type = 0�ٱ�     type = 1˽��
			InformingDAO i = new InformingDAO();
			int messageid = getMessageCount()+1;
		
			//��ÿ�����߷�˽��
			while(it.hasNext()){
				Reader reader = (Reader) it;
				while(i.isExist(messageid))	//messageid�Ѿ���ʹ��
				{
					messageid ++;
				}
				Informing inform = new Informing(reader.getRid(), messageid, 0, title+"^"+content, getTime(), 1);
				i.insert(inform);
				messageid ++;
			}
		
			//��ÿ�����ҷ�˽��
			while(it2.hasNext()){
				Writer writer = (Writer) it2;
				while(i.count(messageid)>0)	//messageid�Ѿ���ʹ��
				{
					messageid++;
				}
				Informing inform = new Informing(writer.getWid(), messageid, 0, title+"^"+content, getTime(), 1);
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
		rlist = r.select();			//��ȡ���ж���
		return rlist;
	}
	
	static public ArrayList<Writer> getWriterList() throws Exception{
		WriterDAO w = new WriterDAO();
		ArrayList<Writer> wlist=new ArrayList<Writer>();
		wlist = w.select();			//��ȡ��������
		return wlist;
	}
	
	static public ArrayList<Books> getBooksList() throws Exception{
		BooksDAO b = new BooksDAO();
		ArrayList<Books> blist=new ArrayList<Books>();
		blist = b.select2();			//��ȡ����book
		return blist;
	}
	
	static public ArrayList<Informing> getInformingList() throws Exception{
		InformingDAO i = new InformingDAO();
		ArrayList<Informing> ilist=new ArrayList<Informing>();
		ilist = i.select2();			//��ȡ����informing
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
