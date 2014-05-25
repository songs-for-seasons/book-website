package DAO;
import java.sql.*;
import java.util.*;


public class ReaderDAO{
	private Connection conn;
	private PreparedStatement pst;
	public ReaderDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public ReaderDAO(Connection conn){
		this.conn = conn;
	}
	public boolean insert(Reader reader)throws Exception{
		boolean flag = false;
		//if(user.getUserID() == null)
			//return false;
		String str = "insert into Reader (rid,rname,rpw,sex,rdate,rintro,rlevel,coin) values (?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, reader.getRid());
		pst.setString(2, reader.getRname());
		pst.setString(3, reader.getRpw());
		pst.setString(4, reader.getSex());
		pst.setString(5, reader.getRdate());
		pst.setString(6, reader.getRintro());
		pst.setInt(7, reader.getLevel());
		pst.setInt(8, reader.getCoin());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
		
	}
	public Reader select(int id)throws Exception{   
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
	}
	public ArrayList<Reader> select()throws Exception{   
		ArrayList<Reader> list=new ArrayList<Reader>();
		Reader reader = null;
		String str = "select * from Reader";
		pst = conn.prepareStatement(str);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			reader = new Reader(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),
					rset.getString(5),rset.getString(6),rset.getInt(7),rset.getInt(8));
			list.add(reader);
		}
		pst.close();
		return list;
	}
	
	public boolean delete(int id)throws Exception{   
		boolean flag = false;
		String str = "delete Reader where rid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Reader reader)throws Exception{    
		boolean flag = false;
		int id = reader.getRid();
		boolean m = delete(id);
		boolean n = insert(reader);
		if( m && n )
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean check(int id,String pw)throws Exception{   //登录检查，匹配ID和密码
		boolean flag = false;
		String str = "select * from Reader where rid = ? and rpw = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setString(2, pw);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean isExist(int rid)throws Exception{    //判断用户是否存在
		boolean flag = false;
		String str = "select * from Reader where rid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, rid);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean addCoin(Reader reader,int money)throws Exception{    //充值操作
		boolean flag = false;
		String str = "update Reader set coin = ? where rid = ?";
		pst = conn.prepareStatement(str);
		int num = reader.getCoin() + money;
		pst.setInt(1, num);
		pst.setInt(2, reader.getRid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		SpendDAO srdao = new SpendDAO();
		Spend sr = new Spend(reader.getRid(),0,0,money);
		flag = flag &&(srdao.insert(sr));
		return flag;
	}
	
	public boolean minCoin(Reader reader,Chapter c,int money)throws Exception{   //扣钱操作
		boolean flag = false;
		String str = "update Reader set coin = ? where rid = ?";
		pst = conn.prepareStatement(str);
		int num = reader.getCoin() - money;
		pst.setInt(1, num);
		pst.setInt(2, reader.getRid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		SpendDAO srdao = new SpendDAO();
		Spend sr = new Spend(reader.getRid(),c.getBid(),c.getCid(),money);
		flag = flag &&(srdao.insert(sr));
		return flag;
	}
	
	public boolean modifyLevel(Reader reader)throws Exception{   //修改用户等级
		boolean flag = false;
		String str = "update Reader set rlevel = ? where rid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, reader.getLevel() + 1);
		pst.setInt(2, reader.getRid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
}


