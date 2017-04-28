package good.love.music.vo;

public class Board {

	private String userid;			//작성자
	private String profile;			//프로필 사진
	
	private int filenum;			//파일 번호
	private String file_title;		//파일 제목
	private String file_ori;		//코드
	private String cover_re;		//커버 이미지
	
	private int boardnum;			//보드 번호
	private String title;			//제목
	private String content;			//내용
	private String inputdate;		//작성 날짜
	private String shared;			//공유 설정
	
	private String like_userid;		//LIKE한 유저
	
	
	public Board() {
	}


	public Board(String userid, String profile, int filenum, String file_title, String file_ori, String cover_re,
			int boardnum, String title, String content, String inputdate, String shared, String like_userid) {
		super();
		this.userid = userid;
		this.profile = profile;
		this.filenum = filenum;
		this.file_title = file_title;
		this.file_ori = file_ori;
		this.cover_re = cover_re;
		this.boardnum = boardnum;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.shared = shared;
		this.like_userid = like_userid;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public int getFilenum() {
		return filenum;
	}


	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}


	public String getFile_title() {
		return file_title;
	}


	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}


	public String getFile_ori() {
		return file_ori;
	}


	public void setFile_ori(String file_ori) {
		this.file_ori = file_ori;
	}


	public String getCover_re() {
		return cover_re;
	}


	public void setCover_re(String cover_re) {
		this.cover_re = cover_re;
	}


	public int getBoardnum() {
		return boardnum;
	}


	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
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


	public String getShared() {
		return shared;
	}


	public void setShared(String shared) {
		this.shared = shared;
	}


	public String getLike_userid() {
		return like_userid;
	}


	public void setLike_userid(String like_userid) {
		this.like_userid = like_userid;
	}


	@Override
	public String toString() {
		return "Board [userid=" + userid + ", profile=" + profile + ", filenum=" + filenum + ", file_title="
				+ file_title + ", file_ori=" + file_ori + ", cover_re=" + cover_re + ", boardnum=" + boardnum
				+ ", title=" + title + ", content=" + content + ", inputdate=" + inputdate + ", shared=" + shared
				+ ", like_userid=" + like_userid + "]";
	}

}