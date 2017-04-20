package good.love.music.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import good.love.music.repository.BoardRepository;
import good.love.music.repository.FileRepository;
import good.love.music.repository.UserRepository;
import good.love.music.util.FileService;
import good.love.music.vo.Board;
import good.love.music.vo.Files;
import good.love.music.vo.Reply;

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

	// 글 목록(전체) ArrayList<Board> list() return "shared";
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		boardRepository.list();
		return "shared";
	}

	// [글 수정] int updateBoard(Board board) return "mypage";
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoard(Board board) {
		boardRepository.updateBoard(board);
		return "mypage";
	}

	// [글 삭제] int deleteBoard(int boardnum) return "mypage";
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(int boardnum) {
		boardRepository.deleteBoard(boardnum);
		return "mypage";
	}

	// [글 검색] Board searchBoard(String search) return "shared";

	// [댓글 등록] reply writeReply(Reply reply) return "result"; //(ajax)성공여부 전송
	@RequestMapping(value = "/replyWrite", method = RequestMethod.GET)
	public String replyWrite(Reply reply, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		loginId = "15";

		reply.setUserid(loginId);

		boardRepository.replyWrite(reply);

		return "redirect:shared";
	}

	// [댓글 수정] int updateReply(Reply reply) return "result";

	// [댓글 삭제] int deleteReply(int Replynum) return "result";

	// ****좋아요 리스트 (랭킹[기간별/전체/] / 특정사용자의LIKE리스트[나/남])

	// [좋아요 등록] int like(Like like) return "result";

	// [좋아요 리스트(랭킹)] ArrayList<Like> likeList() return "result";
	// [좋아요 리스트(개인)] ArrayList<Like> likeList(String id) return "result";
	// [좋아요 리스트()] ArrayList<Like> likeList() return "result";

	// [구독] int subscribe(Subscribe subscribe) return "result";

	// [구독 리스트] ArrayList<Subscribe> subscribeList(String id) return "";

	// +음악 재생
}
