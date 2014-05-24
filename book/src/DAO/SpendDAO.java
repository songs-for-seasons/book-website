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
	public ArrayList<Spend> select(int id)throws Exception{    //根据ID返回相应的消费记录
		ArrayList<Spend> list = new ArrayList<Spend>();
		Spend sr = null;
		String str = "select * from Spend where id = ?" ;
		pst = conn.prepareStatement(str);
		pst.setInt(1, id);
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
	
	public ArrayList<Books> bookhouse(int id)throws Exception{   //显示书屋
		ArrayList<Chapter> list=new ArrayList<Chapter>();
		ArrayList<Chapter> list1=new ArrayList<Chapter>();
		ArrayList<Books> list2=new ArrayList<Books>();
		Chapter ch = null;
		ChapterDAO cdao = new ChapterDAO();
		BooksDAO bdao = new BooksDAO();
		list = cdao.selectlist();
		if(list.size()==0) {
			System.out.println("list == null");
			//pst.close();
			return null;
		}
			
		else{
			System.out.println("list != null");
			int tag = 0;
			for(int i=0;i<list.size();i++){
				tag = isPurchase(id,list.get(i).getBid(),list.get(i).getCid());
				if(tag == 1)
					list1.add(list.get(i));
			}
			for(int i=0;i<list1.size();i++){
				Books b = bdao.select(list2.get(i).getBid());
				int flag = 0;
				for(int j=0;j<list2.size();j++){
					if(b.getBid() == list2.get(j).getBid()){
						flag = 1;
						break;
					}
				}
				if(flag == 0)
					list2.add(b);
			}
			//pst.close();
			return list2;
		}
	}
}

