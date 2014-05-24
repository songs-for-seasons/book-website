package DAO;
import java.sql.*;

import java.util.*;
public class GradingDAO {
	private Connection conn;     //与数据库的连接
	private PreparedStatement pst;
	public GradingDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public GradingDAO(Connection conn){
		this.conn = conn;
	}
	
	public int isReader(int id){
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
	
	public boolean insert(Grading g)throws Exception{   
		boolean flag = false;
		/*int tag = isReader(sr.getId());
		if(tag == 1){
			ReaderDAO rdao = new ReaderDAO();
		}
		UsersDAO udao = new UsersDAO();*/
		//if(udao.select(sr.getUserID()) == null)
			//return false;
		String str = "insert into Grading (id,bid,cid,grade) values (?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, g.getId());
		pst.setInt(2, g.getBid());
		pst.setInt(3, g.getCid());
		pst.setInt(4, g.getGrade());
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

