package co.jasmin.prj.notice.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.jasmin.prj.notice.service.NoticeService;
import co.jasmin.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired 
	NoticeService NoticeDao;
	
	
	// @@@@@@@@ 은솔 @@@@@@@@@
	
		// 공지사항 목록
		@RequestMapping("/noticeList.do")
		public String noticeList(Model model, NoticeVO vo) {
			model.addAttribute("notices", NoticeDao.noticeSelectList());
			return "notice/noticeList";
		}

		// 공지사항 보기
		@RequestMapping("/noticeRead.do")
		public String noticeRead(NoticeVO vo, @Param("no") int no, Model model, HttpSession session){
			vo.setNo(no);
			vo = NoticeDao.noticeSelect(vo);
			NoticeDao.updateCount(no);
			model.addAttribute("noticeRead",vo);
			return "notice/noticeRead";
		}
}