package co.jasmin.prj.qna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.admin.qnareply.service.QnaReplyService;
import co.jasmin.prj.admin.qnareply.service.QnaReplyVO;
import co.jasmin.prj.qna.service.QnaService;
import co.jasmin.prj.qna.service.QnaVO;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaDao;
	
	@Autowired
	QnaReplyService qnareplyDao;
	
	// q&a 목록
	@RequestMapping("/qnaList.do")
	public String qnaList(Model model, QnaVO vo) {
		model.addAttribute("qnaes", qnaDao.qnaSelectList());
		return "qna/qnaList";
	}

	// q&a 상세 보기 
	@RequestMapping("/qnaRead.do")
	public String qnaRead(QnaVO vo, @Param("no") int no, Model model, HttpSession session) {
		session.setAttribute("no", no);
		vo.setNo(no);
		vo = qnaDao.qnaSelect(vo);
		model.addAttribute("qnaesRead",vo);
		
		System.out.println("글 번호: " + no);
		
		QnaReplyVO replyVO = new QnaReplyVO();
		replyVO.setNo(no);
		model.addAttribute("reply", qnareplyDao.qnareplySelect(replyVO));
		
		return "qna/qnaRead";
	}

	// q&a 쓰기
	@RequestMapping("/qnaForm.do")
	public String qnaForm() {
		return "qna/qnaForm";
	}
	
	// q&a 등록
	@RequestMapping("/qnaResister.do")
	public String qnaResister(QnaVO vo, Model model, HttpSession session) {
		vo.setId((String)session.getAttribute("id"));
		model.addAttribute("message","입력 성공");
		qnaDao.qnaInsert(vo);
		return "redirect:qnaList.do";
	}
	
	// q&a 수정 
	@RequestMapping("/qnaUpdateForm.do")
	public String qnaUpdateForm(QnaVO vo, @Param("no") int no, Model model, HttpSession session) {
		vo.setNo(no);
		vo = qnaDao.qnaSelect(vo);
		model.addAttribute("qnaesUpdate",vo);
		return "qna/qnaUpdate";
	}
	
	// q&a 수정 등록
	@RequestMapping("/qnaUpdate.do")
	public String qnaUpdate(QnaVO vo) {
		qnaDao.qnaUpdate(vo);
		return "redirect:qnaList.do";
	}
	
	
	// q&a 글 삭제
	@RequestMapping("/qnaDelete.do")
	public String qnaDelete(Model model, QnaVO vo, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		vo.setNo(no);
		qnaDao.qnaDelete(vo);
		return "redirect:qnaList.do";
	}

	// 자주 묻는 질문들
	@RequestMapping("/faqList.do")
	public String faqList() {
		return "qna/faqList";
		}
	
	@RequestMapping("/qnaTodayCount.do")
	@ResponseBody
	public int rentTodayCount() {
		return qnaDao.qnaTodayCount();
	}
	
	
}

