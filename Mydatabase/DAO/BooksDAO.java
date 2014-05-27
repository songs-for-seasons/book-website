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
	public Books select(int id)throws Exception{   //根据ID选择书籍
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
	public ArrayList<Books> select1(String name)throws Exception{  //根据书名查询
		ArrayList<Books> list=new ArrayList<Books>();
		Books book = null;
		String str = "select * from Books where name = ?";
		pst = conn.prepareStatement(str);
		pst.setString(1, name);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			book = new Books(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getInt(10),rset.getInt(11),rset.getInt(12));
			list.add(book);
		}
		pst.close();
		return list;
	}
	public ArrayList<Books> selectid(int id)throws Exception{  //根据作家id查询
		ArrayList<Books> list=new ArrayList<Books>();
		Books book = null;
		String str = "select * from Books where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			book = new Books(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getInt(10),rset.getInt(11),rset.getInt(12));
			list.add(book);
		}
		System.out.println("select");
		System.out.println(list.size());
		pst.close();
		return list;
	}
	public ArrayList<Books> select2()throws Exception{   //查询所有的书籍
		ArrayList<Books> list=new ArrayList<Books>();
		Books book = null;
		String str = "select * from Books";
		pst = conn.prepareStatement(str);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			book = new Books(rset.getInt(1),rset.getInt(2),rset.getString(3),rset.getString(4),rset.getInt(5),
					rset.getInt(6),rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getInt(10),rset.getInt(11),rset.getInt(12));
			list.add(book);
		}
		pst.close();
		return list;
	}
	
	public boolean delete(int id)throws Exception{   //删除相对应的书籍
		boolean flag = false;
		String str = "delete from Books where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Books book)throws Exception{    
		boolean flag = false;
		int id = book.getBid();
		boolean m = delete(id);
		boolean n = insert(book);
		if( m && n )
			flag = true;
		//pst.close();
		return flag;
	}
	
	public int countwords(int bid)throws Exception{
		ChapterDAO chdao = new ChapterDAO();
		ArrayList<Chapter> list = chdao.selectlist(bid);
		int num = 0;
		for(int i = 0;i < list.size();i++)
			num += chdao.countwords(bid, list.get(i).getCid());
		return num;
	}
	
	public boolean isExist(int bid)throws Exception{    //判断书是否存在
		boolean flag = false;
		String str = "select * from Books where bid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, bid);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	
	public ArrayList<Books> top(int num)throws Exception{
		BooksDAO b= new BooksDAO();
		ArrayList<Books> list=b.select2();
		int[] grade=new int[list.size()];
		boolean[] select=new boolean[list.size()];
		for(int i=0;i<list.size();i++)
		{
			grade[i]=0;
			select[i]=false;
		}
		
		for(int i=0;i<list.size();i++)
		{
			int mg=list.get(i).getBgrade();
			int k;
			for( k=0;k<list.size();k++)
				if(select[k]==false)
					break;
			int mid=k;
			for(int j=0;j<list.size();j++)
			{
				if(list.get(mid).getBgrade()<list.get(j).getBgrade() && select[j]==false)
				{
					mid=j;
					mg=list.get(mid).getBgrade();
				}
			}
			grade[i]=mid;
			select[mid]=true;
		}
		ArrayList<Books> list2=new ArrayList<Books>();
		for(int i=0;i<num;i++)
			list2.add(list.get(grade[i]));
		return list2;
	}

	
}


