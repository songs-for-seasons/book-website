package DAO;

public class Remark {
	private int rid;
	private int bid;
	private int cid;
	private String content;
	private String time;
	private int wid;
	private String recontent;
	private String retime;
	
	public Remark(int rid,int bid,int cid,String content,String time,int wid,String recontent,String retime){
		this.rid = rid;
		this.bid = bid;
		this.cid = cid;
		this.content = content;
		this.time = time;
		this.wid = wid;
		this.recontent = recontent;
		this.retime = retime;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public String getRetime() {
		return retime;
	}

	public void setRetime(String retime) {
		this.retime = retime;
	}
	
	
}
