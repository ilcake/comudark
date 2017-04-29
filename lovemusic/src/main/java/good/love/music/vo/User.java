package good.love.music.vo;

public class User {
	private String userid;
	private String email;
	private String password;
	private String question;	//가입 질문
	private String answer;		//가입 답
	private String profile;		//프로필 사진

	public User() {}
	
	public User(String userid, String email, String password, String question, String answer, String profile) {
		this.userid = userid;
		this.email = email;
		this.password = password;
		this.question = question;
		this.answer = answer;
		this.profile = profile;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", email=" + email + ", password=" + password + ", question=" + question
				+ ", answer=" + answer + ", profile=" + profile + "]";
	}
	
}

	