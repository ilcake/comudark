package good.love.music.vo;

public class Board {

	private int boardnum;
	private String userid;
	private String title;
	private String content;
	private String inputdate;
	private int filenum;
	private String shared;
	private String cover_re;

	public Board() {
	}

	public Board(int boardnum, String userid, String title, String content, String inputdate, int filenum,
			String shared, String cover_re) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.filenum = filenum;
		this.shared = shared;
		this.cover_re = cover_re;
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

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getFilenum() {
		return filenum;
	}

	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}

	public String getShared() {
		return shared;
	}

	public void setShared(String shared) {
		this.shared = shared;
	}

	public String getCover_re() {
		return cover_re;
	}

	public void setCover_re(String cover_re) {
		this.cover_re = cover_re;
	}

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", filenum=" + filenum + ", shared=" + shared + ", cover_re=" + cover_re
				+ "]";
	}

}
