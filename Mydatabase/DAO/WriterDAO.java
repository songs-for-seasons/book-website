package DAO;
import java.sql.*;
import java.util.*;


public class WriterDAO{
	private Connection conn;
	private PreparedStatement pst;
	public WriterDAO(){
		DbConn db = new DbConn();
		conn = db.getConnection();
	}
	public WriterDAO(Connection conn){
		this.conn = conn;
	}
	public boolean insert(Writer writer)throws Exception{
		boolean flag = false;
		//if(user.getUserID() == null)
			//return false;
		String str = "insert into Writer (wid,wname,wpw,sex,wdate,wintro,wlevel,coin,wgrade) values (?,?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(str);
		pst.setInt(1, writer.getWid());
		pst.setString(2, writer.getWname());
		pst.setString(3, writer.getWpw());
		pst.setString(4, writer.getSex());
		pst.setString(5, writer.getWdate());
		pst.setString(6, writer.getWintro());
		pst.setInt(7, writer.getLevel());
		pst.setInt(8, writer.getCoin());
		pst.setInt(9, writer.getWgrade());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
		
	}
	public Writer select(int id)throws Exception{   
		Writer writer = null;
		String str = "select * from Writer where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		ResultSet rset = pst.executeQuery();
		if(rset.next()){
			writer = new Writer(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),
					rset.getString(5),rset.getString(6),rset.getInt(7),rset.getInt(8),rset.getInt(9));
		}
		pst.close();
		return writer;
	}
	public ArrayList<Writer> select()throws Exception{   
		ArrayList<Writer> list=new ArrayList<Writer>();
		Writer writer = null;
		String str = "select * from Writer";
		pst = conn.prepareStatement(str);
		ResultSet rset = pst.executeQuery();
		while(rset.next()){
			writer = new Writer(rset.getInt(1),rset.getString(2),rset.getString(3),rset.getString(4),
					rset.getString(5),rset.getString(6),rset.getInt(7),rset.getInt(8),rset.getInt(9));
			list.add(writer);
		}
		pst.close();
		return list;
	}
	
	public boolean delete(int id)throws Exception{   
		boolean flag = false;
		String str = "delete Writer where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean modify(Writer writer)throws Exception{    
		boolean flag = false;
		int id = writer.getWid();
		boolean m = delete(id);
		boolean n = insert(writer);
		if( m && n )
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean check(int id,String pw)throws Exception{   //登录检查，匹配ID和密码
		boolean flag = false;
		String str = "select * from Writer where wid = ? and wpw = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
		pst.setString(2, pw);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean isExist(int wid)throws Exception{    //判断用户是否存在
		boolean flag = false;
		String str = "select * from Writer where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, wid);
		ResultSet rset = pst.executeQuery();
		if(rset.next())
			flag = true;
		pst.close();
		return flag;
	}
	
	public boolean addCoin(Writer writer,int money)throws Exception{    //充值操作
		boolean flag = false;
		String str = "update Writer set coin = ? where wid = ?";
		pst = conn.prepareStatement(str);
		int num = writer.getCoin() + money;
		pst.setInt(1, num);
		pst.setInt(2, writer.getWid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		SpendDAO srdao = new SpendDAO();
		Spend sr = new Spend(writer.getWid(),0,0,money);
		flag = flag &&(srdao.insert(sr));
		return flag;
	}
	
	public boolean minCoin(Writer writer,Chapter c,int money)throws Exception{   //扣钱操作
		boolean flag = false;
		String str = "update Writer set coin = ? where wid = ?";
		pst = conn.prepareStatement(str);
		int num = writer.getCoin() - money;
		pst.setInt(1, num);
		pst.setInt(2, writer.getWid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		SpendDAO srdao = new SpendDAO();
		Spend sr = new Spend(writer.getWid(),c.getBid(),c.getCid(),money);
		flag = flag &&(srdao.insert(sr));
		return flag;
	}
	
	public boolean modifyLevel(Writer writer)throws Exception{   //修改用户等级
		boolean flag = false;
		String str = "update Writer set wlevel = ? where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, writer.getLevel() + 1);
		pst.setInt(2, writer.getWid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}
	
	/*public boolean modifyGrade(Writer writer)throws Exception{   //修改用户等级
		boolean flag = false;
		String str = "update Writer set wgrade = ? where wid = ?";
		pst = conn.prepareStatement(str);
		pst.setInt(1, writer.getLevel() + 1);
		pst.setInt(2, writer.getWid());
		if(pst.executeUpdate() > 0)
			flag = true;
		pst.close();
		return flag;
	}*/

	public ArrayList<Writer> top(int num)throws Exception{
		WriterDAO b= new WriterDAO();
		ArrayList<Writer> list=b.select();
		int[] grade=new int[list.size()];
		for(int i=0;i<list.size();i++)
			grade[i]=i;
		for(int i=0;i<list.size()-1;i++)
		{
			int mg=list.get(i).getWgrade();
			int mid=i;
			for(int j=i+1;j<list.size();j++)
			{
				if(list.get(mid).getWgrade()<list.get(j).getWgrade())
				{
					mid=j;
					mg=list.get(mid).getWgrade();
				}
			}
			grade[i]=mid;
		}
		ArrayList<Writer> list2=new ArrayList<Writer>();
		for(int i=0;i<num;i++)
			list2.add(b.select(grade[i]));
		return list;
	
}

}



