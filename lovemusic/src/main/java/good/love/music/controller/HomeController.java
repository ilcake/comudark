package good.love.music.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import good.love.music.repository.BoardRepository;
import good.love.music.vo.Board;
import good.love.music.vo.Like;
import good.love.music.vo.Reply;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	BoardRepository boardRepository;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("pulling HOME");

		return "home";
	}

	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String basic() {
		logger.info("pulling HOME");

		return "basic";
	}

	@RequestMapping(value = "/basic2", method = RequestMethod.GET)
	public String basic2() {
		logger.info("pulling HOME");

		return "basic2";
	}

	@RequestMapping(value = "/naviex", method = RequestMethod.GET)
	public String naviex() {
		logger.info("pulling HOME");

		return "naviex";
	}
	@RequestMapping(value = "/comutest", method = RequestMethod.GET)
	public String comutest() {
		
		return "comuTesting";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2() {
		logger.info("pulling HOME");

		return "home";
	}

	@RequestMapping(value = "/comu", method = RequestMethod.GET)
	public String comu() {
		return "comu";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		ArrayList<Board> list = boardRepository.boardList(id);
		session.setAttribute("boardList", list);
		
		//댓글 불러오기
		List<Reply> replyAll = boardRepository.replyAll();
		session.setAttribute("replyAll", replyAll);

		//사용자가 좋아요 누른 게시물 정보 불러오기
		ArrayList<Like> likelist = boardRepository.likeList();
		
		return "mypage";
	}

	@RequestMapping(value = "/hicu", method = RequestMethod.GET)
	public String hicu() {
		return "hicu";
	}

	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public String aboutus() {
		return "aboutus";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/player", method = RequestMethod.GET)
	public String player(HttpSession session) {
		return "player";
	}

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String shared(HttpSession session) {

		//글 불러오기
		ArrayList<Board> list = boardRepository.list();
		session.setAttribute("boardList", list);
		
		//댓글 불러오기
		List<Reply> replyAll = boardRepository.replyAll();
		session.setAttribute("replyAll", replyAll);

		//사용자가 좋아요 누른 게시물 정보 불러오기
		ArrayList<Like> likelist = boardRepository.likeList();

		return "shared";
	}

}
