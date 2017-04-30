package good.love.music.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import good.love.music.repository.BoardRepository;
import good.love.music.repository.FileRepository;
import good.love.music.vo.Board;
import good.love.music.vo.Files;
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
	
	@Autowired
	FileRepository fileRepository;
	
	@Autowired
	HttpSession session;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		logger.info("pulling HOME");
		if (session.getAttribute("loginId") == null)
			return "home";
		else
			return "logInHome";
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

		return "redirect:/";
	}

	@RequestMapping(value = "/comu", method = RequestMethod.GET)
	public String comu() {
		session.removeAttribute("file");	//load된 파일정보 삭제
		return "comu";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {

		String userid = (String)session.getAttribute("loginId"); 
		
		// 파일 불러오기
		ArrayList<Files> fileList = fileRepository.userlist(userid);
		session.setAttribute("fileList", fileList);
		
		// 글 불러오기
		ArrayList<Board> list = boardRepository.boardList(userid);
		session.setAttribute("boardList", list);

		// 댓글 불러오기
		List<Reply> replyAll = boardRepository.replyAll();
		session.setAttribute("replyAll", replyAll);

		// 사용자가 좋아요 누른 게시물 정보 불러오기
		ArrayList<Board> myLikeList = boardRepository.myLikeList(userid);
		System.out.println("좋아요"+myLikeList);
		session.setAttribute("myLikeList", myLikeList);
		
		// 사용자가 구독한 유저 게시물 불러오기
		ArrayList<Board> mySubList = boardRepository.mySubList(userid);
		session.setAttribute("mySubList", mySubList);
		
		return "mypage";
	}

	@RequestMapping(value = "/hicu", method = RequestMethod.GET)
	public String hicu() {
		return "hicu";
	}

	@RequestMapping(value = "/hicu2", method = RequestMethod.GET)
	public String hicu2() {
		return "hicu2";
	}

	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public String aboutus() {
		return "aboutus";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, HttpServletRequest request) {
		session.setAttribute("fromPage", request.getHeader("referer"));
		return "login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/comuplayer", method = RequestMethod.GET)
	public String player(HttpSession session) {
		
		return "comuplayer";
	}

	@RequestMapping(value = "/shared", method = RequestMethod.GET)
	public String shared(HttpSession session) {

		// 글 불러오기
		ArrayList<Board> list = boardRepository.list();
		session.setAttribute("boardList", list);

		// 댓글 불러오기
		List<Reply> replyAll = boardRepository.replyAll();
		session.setAttribute("replyAll", replyAll);

		// 사용자가 좋아요 누른 게시물 정보 불러오기
		ArrayList<Like> likelist = boardRepository.likeList();

		return "shared";
	}
	
	//특정 조건 글 불러오기
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String userid) {

		System.out.println("★★★★★★★★"+userid);
		
		// 글 불러오기
		ArrayList<Board> list = boardRepository.boardList(userid);
		session.setAttribute("boardList", list);

		// 댓글 불러오기
		List<Reply> replyAll = boardRepository.replyAll();
		session.setAttribute("replyAll", replyAll);

		// 사용자가 좋아요 누른 게시물 정보 불러오기
		ArrayList<Like> likelist = boardRepository.likeList();

		return "shared";
	}

	@RequestMapping(value = "/howto", method = RequestMethod.GET)
	public String howto() {
		return "howto";
	}
}
