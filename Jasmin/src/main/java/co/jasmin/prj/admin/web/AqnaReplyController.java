package co.jasmin.prj.admin.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.admin.qna.service.AQnaService;
import co.jasmin.prj.admin.qna.service.AQnaVO;
import co.jasmin.prj.admin.qnareply.service.QnaReplyService;
import co.jasmin.prj.admin.qnareply.service.QnaReplyVO;
import co.jasmin.prj.qna.service.QnaService;

@Controller
public class AqnaReplyController {

	@Autowired
	QnaReplyService qnareplyDao;
	@Autowired
	AQnaService aqnaDao;
	
	// q&a 답변 목록
	@RequestMapping("/qnaReplyList.do")
	public String qnaReplyList(Model model, QnaReplyVO vo) {
		model.addAttribute("qnareply", qnareplyDao.qnareplySelectList());
		return "admin/qnareply/qnaReplyList";
	}


	// q&a 답변 등록
	@ResponseBody
	@RequestMapping("/qnaReplyResister.do")
	public String qnaReplyResister(QnaReplyVO vo, Model model, HttpSession session, @RequestParam("subject") String subject, @RequestParam("no") int no) {
		String result = "false";
		
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("message", "입력 성공");
		
		QnaReplyVO qv = new QnaReplyVO();
		qv.setContent(subject);
		qv.setNo(no);
		
		model.addAttribute("subject",subject);
		QnaReplyVO replyVO = new QnaReplyVO();
		replyVO.setNo(no);
		model.addAttribute("reply", qnareplyDao.qnareplySelect(replyVO));
		qv.setId((String)session.getAttribute("id"));
		int n = qnareplyDao.qnareplyInsert(qv);
		if(n > 0) {
			
			AQnaVO vo2 = new AQnaVO();
			vo2.setNo(no);
			vo2.setReplyyn("답변완료");
			aqnaDao.aqnaUpdate(vo2);
			
			result = "true";
			System.out.println("성공");
			
		}
		
		return result;
	}

	// q&a 답변 수정
	@RequestMapping("/qnaReplyUpdateForm.do")
	public String qnaReplyUpdateForm(QnaReplyVO vo, @Param("no") int no, Model model, HttpSession session) {
		vo.setNo(no);
		vo = qnareplyDao.qnareplySelect(vo);
		model.addAttribute("qnaesUpdate", vo);
		return "admin/qnareply/qnaReplyList";
	}

	// q&a 답변 수정 등록
	@RequestMapping("/qnaReplyUpdate.do")
	public String qnaReplyUpdate(QnaReplyVO vo) {
		qnareplyDao.qnareplyUpdate(vo);
		return "redirect:qnaReplyList.do";
	}

	// q&a 답변 글 삭제
	@RequestMapping("/qnaReplyDelete.do")
	public String qnaReplyDelete(Model model, QnaReplyVO vo, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("삭제번호: " + no);
		vo.setNo(no);
		
		int n = qnareplyDao.qnareplyDelete(vo);
		if(n > 0) {
			AQnaVO vo2 = new AQnaVO();
			vo2.setNo(no);
			vo2.setReplyyn("대기중");
			aqnaDao.aqnaUpdate(vo2);
		}
		
		return "redirect:qnaReplyList.do";
	}

}
