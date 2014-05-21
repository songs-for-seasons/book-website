package DAO;
import java.sql.*;
import java.util.*;


public class ChapterDAO{
	private Connection conn;
	private PreparedStatement pst;
	public ChapterDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public ChapterDAO(Connection conn){
		this.conn = conn;
	}
	public boolean insert(Chapter ch)throws Exception{
		boolean flag = false;
		//if(user.getUserID() == null)
			//return false;
		String str = "insert into Chapter (cid,wid,bid,title,content,words,cclick,cgrade,updatetime) values (?,?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, ch.getCid());
		pst.setInt(2, ch.getWid());
		pst.setInt(3, ch.getBid());
		pst.setString(4, ch.getTitle());
		pst.setString(5, ch.getContent());
		pst.setInt(6, ch.getWords());
		pst.setInt(7, ch.getCclick());
		pst.setInt(8, ch.getCgrade());
		pst.setString(9, ch.getUpdatetime());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
		
	}
	public Chapter select(int bid,int cid)throws Exception{   //根据ID选择用户
		Chapter ch = null;
		String str = "select * from Chapter where bid = ? and cid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		pst.setInt(2, cid);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			ch = new Chapter(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getString(9));
		}
		pst.close();
		return ch;
	}
	public ArrayList<Chapter> selectlist(int bid)throws Exception{   //选择所有的用户
		ArrayList<Chapter> list=new ArrayList<Chapter>();
		Chapter c = null;
		String str = "select * from Chapter where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			c = new Chapter(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getString(9));
			list.add(c);
		}
		pst.close();
		return list;
	}
	
	public boolean delete(int bid,int cid)throws Exception{   //删除相对应的用户
		boolean flag = false;
		String str = "delete Chapter where bid = ? and cid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		pst.setInt(2, cid);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Chapter ch)throws Exception{    //修改用户信息
		boolean flag = false;
		int bid = ch.getBid();
		int cid = ch.getCid();
		boolean m = delete(bid,cid);
		boolean n = insert(ch);
		if( m && n )
			flag = true;
		pst.close();
		return flag;
	}
	
	public int countwords(int bid,int cid)throws Exception{
		Chapter ch = null;
		String str = "select * from Chapter where bid = ? and cid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		pst.setInt(2, cid);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			ch = new Chapter(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getString(9));
		}
		pst.close();
		return ch.getContent().length();
		
	}
	
	public ArrayList<Chapter> select(int bid)throws Exception{
		ArrayList<Chapter> list = new ArrayList<Chapter>();
		Chapter ch = null;
		String str = "select * from Chapter where bid = ?" ;
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			ch = new Chapter(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getString(9));
			list.add(ch);
		}
		pst.close();
		return list;
	}
	
	
}


