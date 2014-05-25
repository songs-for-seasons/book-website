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
	public ArrayList<Spend> select(String id)throws Exception{    //根据ID返回相应的消费记录
		ArrayList<Spend> list = new ArrayList<Spend>();
		Spend sr = null;
		String str = "select * from Spend where id = ?" ;
		pst = conn.prepareStatement(str);
		pst.setString(1, id);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			sr = new Spend(rset.getInt("id"),rset.getInt("bid"),rset.getInt("cid"),rset.getInt("cost"));
			list.add(sr);
		}
		pst.close();
		return list;
	}
	
	public int isPurchase(int id,int bid,int cid)throws Exception{  //判断是否购买过章节
		int tag = 0;
		Spend sr = null;
		String str = "select * from Spend where id = ? and bid = ? and cid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setInt(2, bid);
		pst.setInt(3, cid);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			tag = 1;
		}
		pst.close();
		return tag;
	}
	
	public ArrayList<Chapter> bookhouse(int id)throws Exception{   //显示书屋
		ArrayList<Chapter> list=new ArrayList<Chapter>();
		ArrayList<Chapter> list1=new ArrayList<Chapter>();
		Chapter ch = null;
		ChapterDAO cdao = new ChapterDAO();
		list = cdao.selectlist();
		int tag = 0;
		for(int i=0;i<list.size();i++){
			tag = isPurchase(id,list.get(i).getBid(),list.get(i).getCid());
			if(tag == 1)
				list1.add(list.get(i));
		}
		
		pst.close();
		return list1;
	}
}

