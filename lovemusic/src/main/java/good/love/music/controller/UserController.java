package good.love.music.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import good.love.music.repository.UserRepository;
import good.love.music.util.FileService;
import good.love.music.vo.Files;
import good.love.music.vo.User;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	HttpSession session;

	// 이미지 파일 업로드 경로
	final String uploadPath = "/profiles";

	// join 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MultipartFile upload, User user, HttpServletRequest request) {

		System.out.println(upload);

		// 이미지 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/resources/profiles";

		// 이미지 파일 처리
		if (!upload.isEmpty()) {
			String savedFile = FileService.saveFile(upload, uploadPath);
			user.setProfile(savedFile);
		} else {
		}

		// 테스트
		user.setEmail("test@naver.com");
		user.setQuestion("questsion");
		user.setAnswer("answer");

		int result = userRepository.join(user);

		if (result == 0) {
			return "error";
		}
		return "home";
	}

	// 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody String login(String sample,String main, String userid, String password, HttpServletRequest request) {
		User user = userRepository.login(userid, password);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("loginId", user.getUserid());
				return "home";
			}
		}
		return "errorMsg";
	}

	// loginId 가져오기
	@RequestMapping(value = "/getLoginId", method = RequestMethod.POST)
	public @ResponseBody String checkLogin() {
		String loginId = (String) session.getAttribute("loginId");
		return loginId;
	}

	// logout 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		session.invalidate();
		String uri = request.getHeader("referer");
		return "redirect:" + uri;
	}

	// id 중복확인 화면 요청
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck() {
		return "idCheck";
	}

	// id 중복확인 처리 요청
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String userid, Model model) {
		userRepository.idCheck(userid, model);
		return "idCheck";
	}
	
	// 프로필
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(String userid) {
		User user = userRepository.selectOne(userid);
		session.setAttribute("profile", user);
		return "profile";
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(User user) {
		int result = userRepository.updateOne(user);
		String userid = user.getUserid();
		User r = userRepository.selectOne(userid);
		session.setAttribute("profile", r);
		return "profile";
	}
	
	// 메시지
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(String userid, String loginid) {
		session.setAttribute("message", userid);
		return "message";
	}

}
