package DAO;
import java.sql.*;
import java.util.*;


public class RemarkDAO{
	private Connection conn;
	private PreparedStatement pst;
	public RemarkDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public RemarkDAO(Connection conn){
		this.conn = conn;
	}
	public boolean insert(Remark remark)throws Exception{
		boolean flag = false;
		//if(user.getUserID() == null)
			//return false;
		String str = "insert into Remark (rid,bid,cid,content,rtime,wid,recontent,retime) values (?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, remark.getRid());
		pst.setInt(2, remark.getBid());
		pst.setInt(3, remark.getCid());
		pst.setString(4, remark.getContent());
		pst.setString(5, remark.getTime());
		pst.setInt(6, remark.getWid());
		pst.setString(7, remark.getRecontent());
		pst.setString(8, remark.getRetime());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
		
	}
	/*public Reader select(int id)throws Exception{   //根据ID选择用户
		Reader reader = null;
		String str = "select * from Reader where rid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			reader = new Reader(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),
					rset.getString(5),rset.getString(6),rset.getInt(7),rset.getInt(8));
		}
		pst.close();
		return reader;
	}*/
	public Remark select(int id,int bid,int cid,String time)throws Exception{  
		Remark re = null;
		String str = "select * from Remark where rid = ? and bid = ? and cid = ? and rtime = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setInt(2, bid);
		pst.setInt(3, cid);
		pst.setString(4, time);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			re = new Remark(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),
					rset.getString(5),rset.getInt(6),rset.getString(7),rset.getString(8));
		}
		pst.close();
		return re;
	}
	public ArrayList<Remark> selectlist(int bid)throws Exception{  
		System.out.println(bid);
		ArrayList<Remark> list=new ArrayList<Remark>();
		Remark re = null;
		String str = "select * from Remark where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			System.out.println("3333333333333");
			re = new Remark(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),
					rset.getString(5),rset.getInt(6),rset.getString(7),rset.getString(8));
			list.add(re);
		}
		pst.close();
		System.out.println(list.size());
		return list;
	}
	
	public boolean delete(int id,int bid,int cid,String time)throws Exception{   
		boolean flag = false;
		String str = "delete from Remark where rid = ? and bid = ? and cid = ? and rtime = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setInt(2, bid);
		pst.setInt(3, cid);
		pst.setString(4, time);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Remark re)throws Exception{   
		boolean flag = false;
		boolean m = delete(re.getRid(),re.getBid(),re.getCid(),re.getTime());
		boolean n = insert(re);
		if( m && n )
			flag = true;
		//pst.close();
		return flag;
	}
	
}


