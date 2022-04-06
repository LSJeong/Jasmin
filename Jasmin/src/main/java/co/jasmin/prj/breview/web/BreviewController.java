package co.jasmin.prj.breview.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.breview.service.BreviewService;
import co.jasmin.prj.breview.service.BreviewVO;

@Controller
public class BreviewController {
	
	@Autowired
	private BreviewService breviewDao;
	
	@PostMapping("/reviewsBook.do")
	@ResponseBody
	public List<BreviewVO> reviewsBook(Model model,BreviewVO vo, HttpSession session) {
		vo.setId((String)session.getAttribute("id"));
		return breviewDao.breviewSelectList(vo.getIsbn());
	}
	
	@PostMapping("/reviewInsert.do")
	@ResponseBody
	public BreviewVO reviewInsert(Model model, BreviewVO vo, HttpSession session, @Param("isbn") String isbn, @Param("subject") String subject, @Param("star") int star) {
		
		vo.setId((String)session.getAttribute("id"));
		vo.setIsbn(isbn);
		vo.setStar(star);
		vo.setSubject(subject);
		
		breviewDao.breviewInsert(vo);
		
		return breviewDao.breviewSelect(vo); 
	}
	
	@PostMapping("/reviewDelete.do")
	@ResponseBody
	public String reviewDelete(BreviewVO vo, HttpSession session) {
		String result = "F";
		vo.setId((String)session.getAttribute("id"));
		
		int n = breviewDao.breviewDelete(vo);
		if(n != 0) {
			result = "T"; 
		}
		return result;
	}
}
