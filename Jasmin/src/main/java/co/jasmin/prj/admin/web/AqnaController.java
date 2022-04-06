package co.jasmin.prj.admin.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.jasmin.prj.admin.qna.service.AQnaService;
import co.jasmin.prj.admin.qna.service.AQnaVO;
import co.jasmin.prj.admin.qnareply.service.QnaReplyService;
import co.jasmin.prj.admin.qnareply.service.QnaReplyVO;
import co.jasmin.prj.qna.service.QnaService;
import co.jasmin.prj.qna.service.QnaVO;

@Controller
public class AqnaController {
	
	@Autowired
	AQnaService aqnaDao;
	@Autowired 
	QnaReplyService qnareplyDao;
	
	// @@@@@@@@ 은솔 @@@@@@@@@
	
		// q&a 목록
		@RequestMapping("/aQnaList.do")
		public String aQnaList(Model model, AQnaVO vo) {
			model.addAttribute("aqnaes", aqnaDao.aqnaSelectList());
			
			return "admin/qna/aQnaList";
		}

		// q&a 상세 보기
		@RequestMapping("/aQnaRead.do")
		public String aQnaRead(AQnaVO vo, @Param("no") int no, Model model, HttpSession session) {
			session.setAttribute("no", no);
			vo.setNo(no);
			vo = aqnaDao.aqnaSelect(vo);
			model.addAttribute("aqnaesRead",vo);
			//model.addAttribute("replys", qnareplyDao.qnareplySelect(vo));
			
			QnaReplyVO replyVO = new QnaReplyVO();
			replyVO.setNo(no);
			model.addAttribute("reply", qnareplyDao.qnareplySelect(replyVO));
			
			return "admin/qna/aQnaRead";
		}
		
}
