package good.love.music.vo;
	
public class Files {

	private int filenum;
	private String userid;
	private String file_ori;
	private String file_com;
	private String file_type;
	private String file_title;
	private String cover_ori;
	private String cover_re;
	
	public Files() {}

	public Files(int filenum, String userid, String file_ori, String file_com, String file_type, String file_title,
			String cover_ori, String cover_re) {
		this.filenum = filenum;
		this.userid = userid;
		this.file_ori = file_ori;
		this.file_com = file_com;
		this.file_type = file_type;
		this.file_title = file_title;
		this.cover_ori = cover_ori;
		this.cover_re = cover_re;
	}

	public int getFilenum() {
		return filenum;
	}

	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getFile_ori() {
		return file_ori;
	}

	public void setFile_ori(String file_ori) {
		this.file_ori = file_ori;
	}

	public String getFile_com() {
		return file_com;
	}

	public void setFile_com(String file_com) {
		this.file_com = file_com;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public String getFile_title() {
		return file_title;
	}

	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}

	public String getCover_ori() {
		return cover_ori;
	}

	public void setCover_ori(String cover_ori) {
		this.cover_ori = cover_ori;
	}

	public String getCover_re() {
		return cover_re;
	}

	public void setCover_re(String cover_re) {
		this.cover_re = cover_re;
	}

	@Override
	public String toString() {
		return "file [filenum=" + filenum + ", userid=" + userid + ", file_ori=" + file_ori + ", file_com=" + file_com
				+ ", file_type=" + file_type + ", file_title=" + file_title + ", cover_ori=" + cover_ori + ", cover_re="
				+ cover_re + "]";
	}
	
}
