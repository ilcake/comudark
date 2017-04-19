package good.love.music.repository;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import good.love.music.vo.Board;
import good.love.music.vo.Files;
import good.love.music.dao.BoardDAO;
import good.love.music.dao.FileDAO;

@Repository
public class FileRepository {

	@Autowired
	SqlSession sqlSession;
	
	public int saveFile(Files file){
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		
		int result = 0;

		try {
			dao.saveFile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Files> fileList(){
		ArrayList<Files> fileList = new ArrayList();
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		try {
			fileList = dao.fileList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileList;
	}
	
	// 개인 파일 리스트
	public ArrayList<Files> userlist(String userid) {
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		
		ArrayList<Files> userlist = null;
		
		try {
			userlist = dao.userlist(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userlist;
	}

	public Files loadFile(int filenum) {
		Files file = null;
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		try {
			file = dao.loadFile(filenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file;
	}

	public int updateFile(Files file) {
		int result = 0;
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		try {
			result = dao.updateFile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteFile(int filenum) {
		int result = 0;
		FileDAO dao = sqlSession.getMapper(FileDAO.class);
		try {
			result = dao.deleteFile(filenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
