package good.love.music.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("pulling HOME");

		return "home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2() {
		logger.info("pulling HOME");

		return "home";
	}

	@RequestMapping(value = "/comu", method = RequestMethod.GET)
	public String comu(HttpSession session) {
		session.removeAttribute("file");
		return "comu";
	}

	@RequestMapping(value = "/hicu", method = RequestMethod.GET)
	public String hicu(HttpSession session) {
		session.removeAttribute("file");
		return "hicu";
	}

}
