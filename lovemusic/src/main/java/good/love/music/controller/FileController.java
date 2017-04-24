package good.love.music.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import good.love.music.vo.Files;

@Controller
public class FileController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	FileRepository fileRepository;
	
	@Autowired
	HttpServletRequest request;
	
	//이미지 파일 업로드 경로
	final String uploadPath = "/covers";
	
	
	//COMU : 음악 저장 / 수정 후 저장
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(MultipartFile upload, Files file, HttpSession session){

		//이미지 파일 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/covers";

		//이미지 파일 처리
		if(!upload.isEmpty()){
			String savedFile = FileService.saveFile(upload, uploadPath);
			file.setCover_ori(upload.getOriginalFilename());
			file.setCover_re(savedFile);
		}else{}
		
		file.setFile_com("comfiled code");
		
		System.out.println("test"+file);
		
		
		if(file.getFilenum() == 0){
			fileRepository.saveFile(file);		//저장 (Save)
		}else{
			fileRepository.updateFile(file);	//덮어쓰기 (Update)	//****ajax 형식으로 변환할 것!!
		}
		return "comu";
	}
	
	
	//모든 음악 목록 불러오기(ajax)
	@RequestMapping(value="/fileList", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Files> fileList(){
		ArrayList<Files> list = fileRepository.fileList();
		return list;
	}
	
	// 개인 음악 목록 불러오기(ajax)
	@RequestMapping(value = "/userlist", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Files> userlist(HttpSession session) {
		ArrayList<Files> userlist = fileRepository.userlist((String)session.getAttribute("loginId"));
		return userlist;
	}
	
	//특정 음악 불러오기
	@RequestMapping(value="/load", method=RequestMethod.GET)
	public String loadFile(int filenum, HttpSession session){
		Files file = fileRepository.loadFile(filenum);
		session.setAttribute("file", file);
		return "comu";
	}
	
	//음악 삭제
	@RequestMapping(value="/dragdelete", method=RequestMethod.GET)
	public String delete(int filenum){
		System.out.println("지울 파일: "+filenum);
		int result = fileRepository.deleteFile(filenum);
		return "mypage";
	}
}
