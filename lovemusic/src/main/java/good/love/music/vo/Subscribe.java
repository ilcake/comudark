package good.love.music.vo;

public class Subscribe {
	private String userid;
	private String sub_userid;

	public Subscribe() {

	}

	public Subscribe(String userid, String sub_userid) {
		super();
		this.userid = userid;
		this.sub_userid = sub_userid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSub_userid() {
		return sub_userid;
	}

	public void setSub_userid(String sub_userid) {
		this.sub_userid = sub_userid;
	}

	@Override
	public String toString() {
		return "Subscribe [userid=" + userid + ", sub_userid=" + sub_userid + "]";
	}

}
