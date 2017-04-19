package good.love.music.vo;

public class Like {
	private int boardnum;
	private String userid;
	private String like_userid;
	
	public Like() {
		
	}

	public Like(int boardnum, String userid, String like_userid) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.like_userid = like_userid;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLike_userid() {
		return like_userid;
	}

	public void setLike_userid(String like_userid) {
		this.like_userid = like_userid;
	}

	@Override
	public String toString() {
		return "Like [boardnum=" + boardnum + ", userid=" + userid + ", like_userid=" + like_userid + "]";
	}
	
}
