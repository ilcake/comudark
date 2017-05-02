package good.love.music.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import good.love.music.repository.BoardRepository;
import good.love.music.repository.FileRepository;
import good.love.music.repository.UserRepository;
import good.love.music.util.FileService;
import good.love.music.vo.Board;
import good.love.music.vo.Files;
import good.love.music.vo.Like;
import good.love.music.vo.Reply;
import good.love.music.vo.Subscribe;

@Controller
public class BoardController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	BoardRepository boardRepository;

	@Autowired
	FileRepository fileRepository;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	// 이미지 파일 업로드 경로
	final String uploadPath = "/covers";

	// MYPAGE : 글쓰기 페이지로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		session.removeAttribute("boardFile");
		System.out.println("hhh");
		return "write";
	}

	// MYPAGE : 글쓰기 페이지로 이동(드래그)
	@RequestMapping(value = "/dragwrite", method = RequestMethod.GET)
	public String write(int filenum) {

		session.setAttribute("uri", request.getHeader("referer")); // 페이지 호출한 주소
																	// 저장

		if (filenum != 0) {
			Files file = fileRepository.loadFile(filenum);
			String source = file.getFile_ori();
			String reSource;
			reSource = source.replaceAll("%", "\n");
			source = reSource;
			file.setFile_ori(source);
			session.setAttribute("boardFile", file);
		}
		return "write";
	}

	// 글 수정 페이지로 이동
	@RequestMapping(value = "/selectBoard", method = RequestMethod.GET)
	public String updateBoard(int boardnum) {

		session.setAttribute("uri", request.getHeader("referer")); // 페이지 호출한 주소
																	// 저장

		Board board = boardRepository.selectBoard(boardnum);
		session.setAttribute("boardFile", board);
		return "write2";
	}

	// 글 쓰기 및 수정
	@RequestMapping(value = "/writing", method = RequestMethod.POST)
	public String writing(MultipartFile upload, Board board) {

		// 이미지 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getResourcePaths("/resources/covers/") + "";

		// 이미지 처리
		if (!upload.isEmpty()) {
			String savedFile = FileService.saveFile(upload, uploadPath);
			board.setCover_re(savedFile);
		} else {
		}

		// shared 설정
		if (board.getShared() == null) {
			board.setShared("false");
		}

		if (board.getBoardnum() == 0) { // boardnum이 없으면 새로 저장
			boardRepository.write(board);
		} else { // boardnum이 있으면 덮어쓰기
			boardRepository.updateBoard(board);
		}

		// session.setAttribute("message", "등록 완료");

		String uri = (String) session.getAttribute("uri");
		return "redirect:" + uri;
	}

	// 글 목록 불러오기(개인) (ajax)
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Board> boardList() {
		String id = (String) session.getAttribute("loginId");
		ArrayList<Board> list = boardRepository.boardList(id);
		return list;
	}

	// 글 목록(전체)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		boardRepository.list();
		return "shared";
	}

	// [글 삭제]
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public @ResponseBody String deleteBoard(int boardnum) {
		boardRepository.deleteBoard(boardnum);

		String uri = request.getHeader("referer");
		return "redirect:" + uri;
	}

	// 글 검색
	@RequestMapping(value = "/searchBoard", method = RequestMethod.GET)
	public String searchBoard(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "searchText", defaultValue = "") String searchText, Model model) {
		System.out.println(searchTitle);
		List<Board> boardList = boardRepository.searchBoard(searchTitle, searchText);
		model.addAttribute("boardList", boardList);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchText", searchText);

		return "shared";
	}

	// 댓글 등록
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(Reply reply, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		reply.setUserid(loginId);

		System.out.println(reply);

		if (reply.getReplynum() == 0)
			boardRepository.replyWrite(reply);
		else
			boardRepository.updateReply(reply);
		String uri = request.getHeader("referer");
		return "redirect:shared";
	}

	// 댓글 수정
	@RequestMapping(value = "/updateReply", method = RequestMethod.GET)
	public String updateReply(Reply reply) {
		boardRepository.updateReply(reply);
		return "result";
	}

	// 댓글 삭제
	@RequestMapping(value = "/deleteReply", method = RequestMethod.GET)
	public String deleteReply(int replynum) {
		int result = boardRepository.deleteReply(replynum);

		System.out.println("삭제완료 ==> " + result + "개");

		return "redirect:shared";
	}

	// 좋아요
	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public @ResponseBody String like(Like like) {
		boardRepository.like(like);
		return "result";
	}

	// 좋아요 취소
	@RequestMapping(value = "/deleteLike", method = RequestMethod.GET)
	public @ResponseBody String deleteLike(Like like) {
		boardRepository.deleteLike(like);
		return "result";
	}

	// 좋아요 리스트(랭킹)
	@RequestMapping(value = "/rankList", method = RequestMethod.GET)
	public String rankList() {
		boardRepository.rankList();
		return "result";
	}

	// 좋아요 리스트(개인)
	@RequestMapping(value = "/idList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Like> idList() {
		String userid = (String) session.getAttribute("loginId");
		ArrayList<Like> list = boardRepository.idList(userid);
		return list;
	}

	// 좋아요 리스트(전체)
	@RequestMapping(value = "/likeList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Like> likeList() {
		ArrayList<Like> list = boardRepository.likeList();
		return list;
	}

	// 구독
	@RequestMapping(value = "/writeSubscribe", method = RequestMethod.GET)
	public @ResponseBody String writeSubscribe(Subscribe subscribe) {
		boardRepository.writeSubscribe(subscribe);
		return "result";
	}

	// 구독 취소
	@RequestMapping(value = "/deleteSubscribe", method = RequestMethod.GET)
	public @ResponseBody String deleteSubscribe(Subscribe subscribe) {
		boardRepository.deleteSubscribe(subscribe);
		return "result";
	}

	// 구독 리스트
	@RequestMapping(value = "/subscribeList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Subscribe> subscribeList() {
		String userid = (String) session.getAttribute("loginId");
		ArrayList<Subscribe> list = boardRepository.subscribeList(userid);
		return list;
	}

	// likeRanking
	@RequestMapping(value = "/likeRanking", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Board> likeRanking() {
		String userid = (String) session.getAttribute("loginId");
		ArrayList<Board> list = boardRepository.likeRanking();
		return list;
	}

	// subscribeRanking
	@RequestMapping(value = "/subscribeRanking", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Board> subscribeRanking() {
		String userid = (String) session.getAttribute("loginId");
		ArrayList<Board> list = boardRepository.subscribeRanking();
		System.out.println("subran" + list);
		return list;
	}

}