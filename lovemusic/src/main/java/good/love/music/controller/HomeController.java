package good.love.music.controller;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import good.love.music.comu.MyNewGrammar;
import good.love.music.service.URLGenerator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	URLGenerator generator;

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
		session.setAttribute("file", generator.getList());
		return "hicu";
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public Map<String, ArrayList<String>> getList(HttpSession session) {
		session.removeAttribute("file");
		session.setAttribute("file", generator.getList());
		return generator.getList();
	}

	@RequestMapping(value = "/compile", method = RequestMethod.POST)
	public @ResponseBody String compile(String source, HttpServletRequest request) {
		MyNewGrammar grammar = new MyNewGrammar(new ByteArrayInputStream(source.getBytes(StandardCharsets.UTF_8)));
		grammar.setURLGenerator(generator);
		String result = grammar.getResult();
		return result;
	}

}
