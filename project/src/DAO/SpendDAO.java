package DAO;
import java.sql.*;

import java.util.*;
public class SpendDAO {
	private Connection conn;     //与数据库的连接
	private PreparedStatement pst;
	public SpendDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public SpendDAO(Connection conn){
		this.conn = conn;
	}
	
	
	public boolean insert(Spend sr)throws Exception{   //增加一条消费记录
		boolean flag = false;
		/*int tag = isReader(sr.getId());
		if(tag == 1){
			ReaderDAO rdao = new ReaderDAO();
		}
		UsersDAO udao = new UsersDAO();*/
		//if(udao.select(sr.getUserID()) == null)
			//return false;
		String str = "insert into Spend (id,bid,cid,cost) values (?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, sr.getId());
		pst.setInt(2, sr.getBid());
		pst.setInt(3, sr.getCid());
		pst.setInt(4, sr.getCost());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	/*public ArrayList<SpendRecord> select(String id)throws Exception{    //根据ID返回相应的消费记录
		ArrayList<SpendRecord> list = new ArrayList<SpendRecord>();
		SpendRecord sr = null;
		String str = "select * from SpendRecord where UserID = ?" ;
		pst = conn.prepareStatement(str);
		pst.setString(1, id);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			sr = new SpendRecord(rset.getString("UserID"),rset.getString("Date"),rset.getString("Type"),rset.getDouble("cost"));
			list.add(sr);
		}
		pst.close();
		return list;
	}*/
	
}

