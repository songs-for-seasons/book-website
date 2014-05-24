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
		String str = "insert into Reader (rid,rname,rpw,sex,rdate,rintro,level,coin) values (?,?,?,?,?,?,?,?)";
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
	public Reader select(int id)throws Exception{   //根据ID选择用户
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
	/*public ArrayList<Users> select()throws Exception{   //选择所有的用户
		ArrayList<Users> list=new ArrayList<Users>();
		Users user = null;
		String str = "select * from Users";
		pst = conn.prepareStatement(str);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			user = new Users(rset.getString("UserID"),rset.getString("UserName"),rset.getString("Sex"),rset.getString("Userpassword"),
					rset.getString("Userdescription"),rset.getString("emailAddress"),rset.getInt("VIPLevel"),rset.getDouble("Balance"),rset.getInt("Reputation"));
			list.add(user);
		}
		pst.close();
		return list;
	}*/
	
	public boolean delete(int id)throws Exception{   //删除相对应的用户
		boolean flag = false;
		String str = "delete from reader where rid = 1010";
		//pst = conn.prepareStatement(str);
		//pst.setInt(1, id);
		//pst.executeUpdate(str);
		//if(pst.executeUpdate() > 0)
			flag = true;
		//pst.close();
		return flag;
	}
	
	public boolean modify(Reader reader)throws Exception{    //修改用户信息
		boolean flag = false;
		int id = reader.getRid();
		boolean m = delete(id);
		boolean n = insert(reader);
		if( m && n )
			flag = true;
		//pst.close();
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
	
	/*public boolean isExist(String id)throws Exception{    //判断用户是否存在
		boolean flag = false;
		String str = "select * from Users where UserID = ?";
		pst = conn.prepareStatement(str);
		pst.setString(1, id);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}*/
	
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
		String str = "update Reader set level = ? where rid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, reader.getLevel() + 1);
		pst.setInt(2, reader.getRid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
}


