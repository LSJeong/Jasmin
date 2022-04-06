package co.jasmin.prj.hbook.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.jasmin.prj.hbook.service.HBookService;
import co.jasmin.prj.hbook.service.HBookVO;

@Controller
public class HbookController {
	
	@Autowired
	HBookService hbookDao;
	
	// @@@@@@@@ 은솔 @@@@@@@@@
	
		// 희망도서 목록
		@RequestMapping("/hBookList.do")
		public String hBookList(Model model, HBookVO vo) {
			model.addAttribute("hbooks", hbookDao.hbookSelectList());
			return "hbook/hBookList";
		}

		// 희망도서 상세 보기
		@RequestMapping("/hBookRead.do")
		public String hBookRead(HBookVO vo, @Param("no") int no, Model model, HttpSession session) {
			vo.setNo(no);
			vo = hbookDao.hbookSelect(vo);
			hbookDao.updateCount(no);
			model.addAttribute("hbooksRead",vo);
			return "hbook/hBookRead";
		}

		// 희망도서 쓰기
		@RequestMapping("/hBookForm.do")
		public String hBookForm() {
			return "hbook/hBookForm";
		}
		
		// 희망도서 등록
		@RequestMapping("/hBookResister.do")
		public String hBookResister(HBookVO vo, HttpSession session) {
			vo.setHid((String) session.getAttribute("id")); //form.jsp로 보내줌
			hbookDao.hbookInsert(vo);
			return "redirect:hBookList.do";
		}
		
		// 희망도서 수정
		@RequestMapping("/hBookUpdateForm.do")
		public String hBookUpdateForm(HBookVO vo, @Param("no") int no, Model model, HttpSession session) {
			vo.setNo(no);
			vo = hbookDao.hbookSelect(vo);
			model.addAttribute("hbooksUpdate",vo);
			return "hbook/hBookUpdate";
		}
		
		// 희망도서 수정 등록
		@RequestMapping("/hBookUpdate.do")
		public String hBookUpdate(HBookVO vo) {
			hbookDao.hbookUpdate(vo);
			return "redirect:hBookList.do";
		}
		
		// 희망도서 삭제
		@RequestMapping("/hBookDelete.do")
		public String hBookDelete(Model model, HBookVO vo, HttpServletRequest request) {
			int no = Integer.parseInt(request.getParameter("no"));
			vo.setNo(no);
			hbookDao.hbookDelete(vo);
			return "redirect:hBookList.do";
		}
}
