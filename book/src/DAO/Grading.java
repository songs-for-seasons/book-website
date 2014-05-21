package DAO;

public class Grading {
	private int id;
	private int bid;
	private int cid;
	private int grade;
	
	public Grading(int id,int bid,int cid,int grade){
		this.id = id;
		this.bid = bid;
		this.cid = cid;
		this.grade = grade;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
}
