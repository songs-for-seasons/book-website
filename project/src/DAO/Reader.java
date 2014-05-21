package DAO;
public class Reader {
	private int rid;
	private String rname;
	private String rpw;
	private String sex;
	private String rdate;
	private String rintro;
	private int level;
	private int coin;
	
	public Reader(){
		level = 0;
		coin = 0;
	}
	public Reader(int rid,String rname,String rpw,String sex,String rdate,
			String rintro,int level,int coin){
		this.rid = rid;
		this.rname = rname;
		this.rpw = rpw;
		this.sex = sex;
		this.rdate = rdate;
		this.rintro = rintro;
		this.level = level;
		this.coin = coin;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRpw() {
		return rpw;
	}
	public void setRpw(String rpw) {
		this.rpw = rpw;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRintro() {
		return rintro;
	}
	public void setRintro(String rintro) {
		this.rintro = rintro;
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
	
	
}


