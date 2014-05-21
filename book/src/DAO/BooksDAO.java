package DAO;
import java.sql.*;
import java.util.*;


public class BooksDAO{
	private Connection conn;
	private PreparedStatement pst;
	public BooksDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public BooksDAO(Connection conn){
		this.conn = conn;
	}
	public boolean insert(Books book)throws Exception{
		boolean flag = false;
		//if(user.getUserID() == null)
			//return false;
		String str = "insert into Books (bid,wid,bname,bintro,bclick,words,remark,cost,"+
			"bgrade,inform,isfinished,type) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, book.getBid());
		pst.setInt(2, book.getWid());
		pst.setString(3, book.getBname());
		pst.setString(4, book.getBintro());
		pst.setInt(5, book.getBclick());
		pst.setInt(6, book.getWords());
		pst.setInt(7, book.getRemark());
		pst.setInt(8, book.getCost());
		pst.setInt(9, book.getBgrade());
		pst.setInt(10,book.getInform());
		pst.setInt(11,book.getIsfinished());
		pst.setInt(12,book.getType());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
		
	}
	public Books select(int id)throws Exception{   //根据ID选择用户
		Books book = null;
		String str = "select * from Books where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			book = new Books(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getInt(10),rset.getInt(11),rset.getInt(12));
		}
		pst.close();
		return book;
	}
	public ArrayList<Books> select(String name)throws Exception{   //根据ID选择用户
		ArrayList<Books> list=new ArrayList<Books>();
		Books book = null;
		String str = "select * from Books where name = ?";
		pst = conn.prepareStatement(str);
		pst.setString(1, name);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			book = new Books(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getInt(10),rset.getInt(11),rset.getInt(12));
			list.add(book);
		}
		pst.close();
		return list;
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
		String str = "delete Books where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Books book)throws Exception{    //修改用户信息
		boolean flag = false;
		int id = book.getBid();
		boolean m = delete(id);
		boolean n = insert(book);
		if( m && n )
			flag = true;
		pst.close();
		return flag;
	}
	
	public int countwords(int bid)throws Exception{
		ChapterDAO chdao = new ChapterDAO();
		ArrayList<Chapter> list = chdao.select(bid);
		int num = 0;
		for(int i = 0;i < list.size();i++)
			num += chdao.countwords(bid, list.get(i).getCid());
		return num;
	}
	
	
}


