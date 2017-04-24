package good.love.music.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import good.love.music.dao.BoardDAO;
import good.love.music.vo.Board;
import good.love.music.vo.Like;
import good.love.music.vo.Reply;
import good.love.music.vo.Subscribe;

@Repository
public class BoardRepository {

	@Autowired
	SqlSession sqlSession;

	// 글 작성
	public int write(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.write(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 목록(개인)
	public ArrayList<Board> boardList(String id) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Board> list = new ArrayList<>();
		list = dao.boardList(id);
		return list;
	}

	// 글 목록(전체)
	public ArrayList<Board> list() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Board> list = new ArrayList<>();
		list = dao.list();
		return list;
	}

	// 글 수정
	public int updateBoard(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.updateBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 삭제
	public int deleteBoard(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.deleteBoard(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 검색
	public List<Board> searchBoard(String searchTitle, String searchText) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String, String> search = new HashMap<>();
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		List<Board> boardList = null;
		try {
			boardList = dao.searchBoard(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	// 댓글 등록
	public int replyWrite(Reply reply) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.replyWrite(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 댓글 전체 가져오기
	public List<Reply> replyAll() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<Reply> replyAll = null;
		try {
			replyAll = dao.replyAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replyAll;
	}

	// 댓글 가져오기
	public List<Reply> replylist(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<Reply> replylist = null;
		try {
			replylist = dao.replylist(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replylist;
	}

	// 댓글 수정
	public int updateReply(Reply reply) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.updateReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 댓글 삭제
	public int deleteReply(int replynum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		Reply reply = new Reply();
		reply.setReplynum(replynum);
		try {
			result = dao.deleteReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요 등록
	public int like(Like like) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.like(like);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요 랭킹
	public Map<String, Object> likeRanking() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String, Object> raking = new HashMap<>();
		try {
			raking = dao.likeRanking();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return raking;
	}

	// 좋아요 리스트(개인)
	public ArrayList<Like> idList(String userid) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Like> list = new ArrayList<>();
		try {
			list = dao.idList(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 좋아요 리스트 ?
	public ArrayList<Like> likeList() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Like> list = new ArrayList<>();
		try {
			list = dao.likeList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 구독
	public int writeSubscribe(Subscribe subscribe) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = 0;
		try {
			result = dao.writeSubscribe(subscribe);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 구독 리스트
	public ArrayList<Subscribe> subscribeList(String userid) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Subscribe> list = new ArrayList<>();
		try {
			list = dao.subscribeList(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 구독 랭킹
	public Map<String, Object> subscribeRanking() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String, Object> raking = new HashMap<>();
		try {
			raking = dao.subscribeRanking();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return raking;
	}
}
