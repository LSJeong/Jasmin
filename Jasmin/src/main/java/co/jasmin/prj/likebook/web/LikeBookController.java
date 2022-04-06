package co.jasmin.prj.likebook.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.likebook.service.LikeBookService;
import co.jasmin.prj.likebook.service.LikeBookVO;

@Controller
public class LikeBookController {
	
	@Autowired
	private LikeBookService likebookDao;
	
	@PostMapping("/likeBookInsert.do")
	@ResponseBody
	public String likeBookInsert(LikeBookVO vo, HttpSession session) {
		String result = "F";
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		int n = likebookDao.likebookInsert(vo);
		if(n != 0) {
			result = "T";		
		}
		return result;
	}
	
	@PostMapping("/likeBookDelete.do")
	@ResponseBody
	public String likeBookDelete(LikeBookVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		String result = "F";
		int n = likebookDao.likebookDelete(vo);
		if(n != 0) {
			result = "T";
		}
		return result;
	}
}
