package co.jasmin.prj.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.jasmin.prj.admin.notice.service.ANoticeService;
import co.jasmin.prj.admin.notice.service.ANoticeVO;

@Controller
public class AnoticeController {
	@Autowired
	ANoticeService ANoticeDao;
	
	// @@@@@@@@ 은솔 @@@@@@@@@
	
		// 관리자 공지사항 목록
		@RequestMapping("/aNoticeList.do")
		public String aNoticeList(Model	model, ANoticeVO vo) {
			model.addAttribute("anotices", ANoticeDao.anoticeSelectList());
			return "admin/notice/aNoticeList";
		}

		// 관리자 공지사항 상세 보기
		@RequestMapping("/aNoticeRead.do")
		public String aNoticeRead(ANoticeVO vo, @Param("no") int no, Model model, HttpSession session) {
			vo.setNo(no);
			vo = ANoticeDao.anoticeSelect(vo);
			ANoticeDao.updateCount(no); 
			model.addAttribute("anoticeRead",vo);
			return "admin/notice/aNoticeRead";
		}

		// 관리자 공지사항 쓰기
		@RequestMapping("/aNoticeForm.do")
		public String aNoticeForm() {
			return "admin/notice/aNoticeForm";
		}

		// 관리자 공지사항 등록
		@RequestMapping("/aNoticeResister.do")
		public String aNoticeResister(ANoticeVO vo, HttpSession session) {
			vo.setName((String) session.getAttribute("name"));
			ANoticeDao.anoticeInsert(vo);
			return "redirect:aNoticeList.do";
		}
		
		// 관리자 공지사항 수정
		@RequestMapping("/aNoticeUpdateForm.do")
		public String aNoticeUpdateForm(ANoticeVO vo, @Param("no") int no, Model model, HttpSession session) {
			vo.setNo(no);
			vo = ANoticeDao.anoticeSelect(vo);
			model.addAttribute("anoticeUpdate",vo);
			return "admin/notice/aNoticeUpdate";
		}

		// 관리자 공지사항 수정 등록
		@RequestMapping("/aNoticeUpdate.do")
		public String aNoticeUpdate(ANoticeVO vo) {
			ANoticeDao.anoticeUpdate(vo);
			return "redirect:aNoticeList.do";
		}
		
		// 관리자 공지사항 삭제
		@RequestMapping("/aNoticeDelete.do")
		public String aNoticeDelete(Model model, ANoticeVO vo, HttpServletRequest request) {
			int no = Integer.parseInt(request.getParameter("no"));
			vo.setNo(no);
			ANoticeDao.anoticeDelete(vo);
			return "redirect:aNoticeList.do";
		}
}