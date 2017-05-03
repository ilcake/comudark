package good.love.music.repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import good.love.music.vo.User;
import good.love.music.dao.UserDAO;

@Repository
public class UserRepository {
	private static final Logger logger = LoggerFactory.getLogger(UserRepository.class);

	@Autowired
	SqlSession sqlSession;

	// 회원가입 Repository
	public int join(User user) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);

		int result = 0;

		try {
			result = dao.join(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 아이디로 회원 정보 가져오기 Repository
	public User selectOne(String userid) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		User u = null;
		try {
			u = dao.selectOne(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	// 로그인 Repository
	public User login(String userid, String password) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		User u = null;

		try {
			u = dao.selectOne(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	// id 중복확인 Repository
	public String idCheck(String userid, Model model) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		User user = null;

		try {
			user = dao.selectOne(userid);

			if (user != null) {
				model.addAttribute("notCheckId", user.getUserid());
			} else {
				model.addAttribute("checkId", userid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "join";
	}

	//회원정보 수정
	public int updateOne(User user) {
		
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		int result = dao.updateOne(user);
		
		return result;
	}
}
