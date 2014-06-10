package DAO;
import java.sql.*;
import java.util.*;
public class InformingDAO {
	private Connection conn;     //与数据库的连接
	private PreparedStatement pst;
	public InformingDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public InformingDAO(Connection conn){
		this.conn = conn;
	}
	
	
	public boolean insert(Informing in)throws Exception{   //增加一条举报/私信记录
		boolean flag = false;
		/*int tag = isReader(sr.getId());
		if(tag == 1){
			ReaderDAO rdao = new ReaderDAO();
		}
		UsersDAO udao = new UsersDAO();*/
		//if(udao.select(sr.getUserID()) == null)
			//return false;
		String str = "insert into Informing (id,mid,bid,reason,itime,itype) values (?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, in.getId());
		pst.setInt(2, in.getMid());
		pst.setInt(3, in.getBid());
		pst.setString(4, in.getReason());
		pst.setString(5, in.getTime());
		pst.setInt(6, in.getType());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	public int count(int bid)throws Exception{
		ArrayList<Informing> list = new ArrayList<Informing>();
		Informing in = null;
		String str = "select * from Informing where bid = ?" ;
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			in = new Informing(rset.getInt("id"),rset.getInt("mid"),rset.getInt("bid"),rset.getString("reason"),
					rset.getString("itime"),rset.getInt("itype"));
			list.add(in);
		}
		pst.close();
		return list.size();
	}
	
	public boolean isExist(int mid)throws Exception{    //判断消息是否存在
		boolean flag = false;
		String str = "select * from Informing where mid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, mid);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	public int isInform(int id,int bid)throws Exception{  //判断是否举报过
		int tag = 0;
		Informing in = null;
		String str = "select * from Informing where id = ? and bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setInt(2, bid);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			tag = 1;
		}
		pst.close();
		return tag;
	}
	public Informing select(int mid)throws Exception{   //根据mid选择信息
		Informing inform = null;
		String str = "select * from Informing where mid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, mid);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			inform = new Informing(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6));
		}
		pst.close();
		return inform;
	}
	public ArrayList<Informing> selectid(int id)throws Exception{  //根据作品id查询
		ArrayList<Informing> list=new ArrayList<Informing>();
		Informing inform = null;
		String str = "select * from Informing where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			inform = new Informing(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6));
			list.add(inform);
		}
		pst.close();
		return list;
	}
	
	public ArrayList<Informing> select2()throws Exception{   //查询所有的书籍
		ArrayList<Informing> list=new ArrayList<Informing>();
		Informing inform = null;
		String str = "select * from Informing";
		pst = conn.prepareStatement(str);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			inform = new Informing(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6));
			list.add(inform);
		}
		pst.close();
		return list;
	}
	
	public ArrayList<Informing> selecttype(int type)throws Exception{  //根据作品id查询
		ArrayList<Informing> list=new ArrayList<Informing>();
		Informing inform = null;
		String str = "select * from Informing where itype = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, type);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			inform = new Informing(rset.getInt(1),rset.getInt(2),rset.getInt(3),rset.getString(4),rset.getString(5),
					rset.getInt(6));
			list.add(inform);
		}
		pst.close();
		return list;
	}
}

