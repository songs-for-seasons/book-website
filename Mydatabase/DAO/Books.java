package DAO;

public class Books {
	private int bid;
	private int wid;
	private String bname;
	private String bintro;
	private int bclick;
	private int words;
	private int remark;
	private int cost;
	private int bgrade;
	private int inform;
	private int isfinished;//0:unfinshed 1:finshed 
	private int type;
	
	public Books(int bid,int wid,String bname,String bintro,int isfinished,int words,int cost,int type){
		this.bid = bid;
		this.wid = wid;
		this.bname = bname;
		this.bintro = bintro;
		this.isfinished = isfinished;
		this.words = words;
		this.cost = cost;
		this.type = type;
	}
	public Books(int bid,int wid,String bname,String bintro,int bclick,int words,int remark,int cost,
			int bgrade,int inform,int isfinished,int type){
		this.bid = bid;
		this.wid = wid;
		this.bname = bname;
		this.bintro = bintro;
		this.bclick = bclick;
		this.words = words;
		this.remark = remark;
		this.cost = cost;
		this.bgrade = bgrade;
		this.inform = inform;
		this.isfinished = isfinished;
		this.type = type;
	}
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBintro() {
		return bintro;
	}
	public void setBintro(String bintro) {
		this.bintro = bintro;
	}
	public int getBclick() {
		return bclick;
	}
	public void setBclick(int bclick) {
		this.bclick = bclick;
	}
	public int getWords() {
		return words;
	}
	public void setWords(int words) {
		this.words = words;
	}
	public int getRemark() {
		return remark;
	}
	public void setRemark(int remark) {
		this.remark = remark;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getBgrade() {
		return bgrade;
	}
	public void setBgrade(int bgrade) {
		this.bgrade = bgrade;
	}
	public int getInform() {
		return inform;
	}
	public void setInform(int inform) {
		this.inform = inform;
	}
	public int getIsfinished() {
		return isfinished;
	}
	public void setIsfinished(int isfinished) {
		this.isfinished = isfinished;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
