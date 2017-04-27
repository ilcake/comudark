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
	
	//이미지 파일 업로드 경로
	final String uploadPath = "/profiles";

	// join 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MultipartFile upload, User user, HttpServletRequest request) {
		
		System.out.println(upload);
		
		//이미지 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/profiles";

		//이미지 파일 처리
		if(!upload.isEmpty()){
			String savedFile = FileService.saveFile(upload, uploadPath);
			user.setProfile(savedFile);
		}else{}
		
		//테스트
		user.setEmail("test@naver.com");
		user.setQuestion("questsion");
		user.setAnswer("answer");
		
		System.out.println("테스트!"+user);
		
		int result = userRepository.join(user);
		
		if(result==0){
			return "error";
		}
		return "home";
	}

	// login 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody String login(String userid, String password, HttpSession session, HttpServletRequest request) {
		User user = userRepository.login(userid, password);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("loginId", user.getUserid());
				return (String) session.getAttribute("fromPage");
			}
		}
		return "errorMsg";
	}

	// logout 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
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

}
