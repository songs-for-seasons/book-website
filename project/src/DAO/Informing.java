package DAO;

public class Informing {
	private int id;
	private int mid;
	private int bid;
	private String reason;
	private String time;
	private int type;
	
	public Informing(int id,int mid,int bid,String reason,String time,int type){
		this.id = id;
		this.mid = mid;
		this.bid = bid;
		this.reason = reason;
		this.time = time;
		this.type = type;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
