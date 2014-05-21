package DAO;

public class Spend {
	private int id;
	private int bid;
	private int cid;
	private int cost;
	
	public Spend(int id,int bid,int cid,int cost){
		this.id = id;
		this.bid = bid;
		this.cid = cid;
		this.cost = cost;
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

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
}
