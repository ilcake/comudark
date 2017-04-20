package good.love.music.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import good.love.music.repository.UserRepository;
import good.love.music.vo.User;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;

	// join 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user) {
		userRepository.join(user);
		return "home";
	}

	// login 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String userid, String password, Model model, HttpSession session, HttpServletRequest request) {
		userRepository.login(userid, password);
		String uri = request.getHeader("referer");
		return "redirect:" + uri;
	}

	// logout 처리
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
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
