package good.love.music.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		return "write";
	}

	// MYPAGE : 글쓰기 페이지로 이동(드래그)
	@RequestMapping(value = "/dragwrite", method = RequestMethod.GET)
	public String write(int filenum) {
		if (filenum != 0) {
			Files file = fileRepository.loadFile(filenum);
			session.setAttribute("boardFile", file);
		}
		return "write";
	}

	// 글 쓰기
	@RequestMapping(value = "/writing", method = RequestMethod.POST)
	public String writing(MultipartFile upload, Board board) {

		System.out.println(board);

		// 이미지 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getResourcePaths("/") + "/resources/covers";

		// 이미지 처리
		if (!upload.isEmpty()) {
			String savedFile = FileService.saveFile(upload, uploadPath);
			System.out.println(savedFile);
			// board.setOriginalfile(upload.getOriginalFilename());
			// board.setSavedfile(savedFile);
		} else {

		}
		if (board.getShared() == null) {
			board.setShared("unshare");
		}
		boardRepository.write(board);
		// session.setAttribute("message", "등록 완료");
		return "mypage";
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

	// [글 수정]
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoard(Board board) {
		boardRepository.updateBoard(board);
		return "mypage";
	}

	// [글 삭제]
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public @ResponseBody String deleteBoard(int boardnum) {
		boardRepository.deleteBoard(boardnum);

		String uri = request.getHeader("referer");
		return uri;
	}

	// 글 검색
	@RequestMapping(value = "/searchBoard", method = RequestMethod.GET)
	public String searchBoard(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "searchText", defaultValue = "") String searchText, Model model) {
		List<Board> searchBoard = boardRepository.searchBoard(searchTitle, searchText);

		model.addAttribute("searchBoard", searchBoard);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchText", searchText);

		return "shared";
	}

	// 댓글 등록
	@RequestMapping(value = "/replyWrite", method = RequestMethod.GET)
	public String replyWrite(Reply reply, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		reply.setUserid(loginId);
		boardRepository.replyWrite(reply);
		
		String uri = request.getHeader("referer");
		return uri;
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
		System.out.println(replynum);
		int result = boardRepository.deleteReply(replynum);

		System.out.println("삭제완료 ==> " + result + "개");

		return "shared";
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

	// 좋아요 랭킹
	@RequestMapping(value = "/likeRanking", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Map<String, Object>> likeRanking() {
		ArrayList<Map<String, Object>> map = boardRepository.likeRanking();
		return map;
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
		System.out.println(list);
		return list;
	}

	// 구독 랭킹
	@RequestMapping(value = "/subscribeRanking", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Map<String, Object>> subscribeRanking() {
		ArrayList<Map<String, Object>> map = boardRepository.subscribeRanking();
		return map;
	}
}
