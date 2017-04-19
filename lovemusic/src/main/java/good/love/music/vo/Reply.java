package good.love.music.vo;

public class Reply {
	private int replynum;
	private int boardnum;
	private String userid;
	private String replytext;
	private String inputdate;

	public Reply() {

	}

	public Reply(int replynum, int boardnum, String userid, String replytext, String inputdate) {
		super();
		this.replynum = replynum;
		this.boardnum = boardnum;
		this.userid = userid;
		this.replytext = replytext;
		this.inputdate = inputdate;
	}

	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
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

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", userid=" + userid + ", replytext="
				+ replytext + ", inputdate=" + inputdate + "]";
	}

}
