package DAO;

public class Writer {
	private int wid;
	private String wname;
	private String wpw;
	private String sex;
	private String wdate;
	private String wintro;
	private int level;
	private int coin;
	private int wgrade;
	
	public Writer(){
		setLevel(0);
		setCoin(0);
	}

	public Writer(int wid,String wname,String wpw,String sex,String wdate,
			String wintro,int level,int coin,int wgrade){
		this.wid = wid;
		this.wname = wname;
		this.wpw = wpw;
		this.sex = sex;
		this.wdate = wdate;
		this.wintro = wintro;
		this.level = level;
		this.coin = coin;
		this.wgrade = wgrade;
	}
	
	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getWpw() {
		return wpw;
	}

	public void setWpw(String wpw) {
		this.wpw = wpw;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getWintro() {
		return wintro;
	}

	public void setWintro(String wintro) {
		this.wintro = wintro;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public int getWgrade() {
		return wgrade;
	}

	public void setWgrade(int wgrade) {
		this.wgrade = wgrade;
	}
	
	
	
}
