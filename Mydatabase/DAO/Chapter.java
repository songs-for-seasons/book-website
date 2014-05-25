package DAO;

public class Chapter {
	private int cid;
	private int wid;
	private int bid;
	private String title;
	private String content;
	private int words;
	private int cclick;
	private int cgrade;
	private String updatetime;
	
	public Chapter(int cid,int wid,int bid,String title,String content,int words,int cclick,int cgrade,String updatetime){
		this.cid = cid;
		this.wid = wid;
		this.bid = bid;
		this.title = title;
		this.content = content;
		this.words = words;
		this.cclick = cclick;
		this.cgrade = cgrade;
		this.updatetime = updatetime;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWords() {
		return words;
	}
	public void setWords(int words) {
		this.words = words;
	}
	public int getCclick() {
		return cclick;
	}
	public void setCclick(int cclick) {
		this.cclick = cclick;
	}
	public int getCgrade() {
		return cgrade;
	}
	public void setCgrade(int cgrade) {
		this.cgrade = cgrade;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	
}
