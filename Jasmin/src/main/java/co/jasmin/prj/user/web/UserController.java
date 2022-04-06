package co.jasmin.prj.user.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.book.service.BookVO;
import co.jasmin.prj.hbook.service.HBookService;
import co.jasmin.prj.hbook.service.HBookVO;
import co.jasmin.prj.member.service.MemberService;
import co.jasmin.prj.member.service.MemberVO;
import co.jasmin.prj.qna.service.QnaVO;
import co.jasmin.prj.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	MemberService memberDao;

	@Autowired
	UserService userDao;

	// 기본정보
	@RequestMapping("/myInfo.do")
	public String myInfo(HttpSession session, MemberVO vo, Model model) {
//		session.setAttribute("id","YD");

		vo.setId((String) session.getAttribute("id"));

		model.addAttribute("member", memberDao.memberSelect(vo));
		model.addAttribute("rentEbookCnt", userDao.countRentEbook(vo.getId()));
		model.addAttribute("rentDeliveryCnt", userDao.countRentBook(vo.getId()));
		model.addAttribute("rentLBCnt", userDao.countLikebook(vo.getId()));
		model.addAttribute("rentHBCnt", userDao.countHbook(vo.getId()));
		model.addAttribute("rentQnaCnt", userDao.countQna(vo.getId()));

		return "mypage/myInfo";
	}

	// 대출목록
	@RequestMapping("/loanStatusList.do")
	public String loanStatusList(HttpSession session, Model model, BookVO vo) {
//		RentVO vo = new RentVO();
		vo.setMid((String) session.getAttribute("id"));

		model.addAttribute("books", userDao.selectRentEbook(vo));
		model.addAttribute("message", "해당 게시물이 없습니다.");
		model.addAttribute("recomendList", userDao.recommendBook(vo));

		return "mypage/loanStatusList";
	}

	// 배송대출
	@RequestMapping("/loanDeliveryStatusList.do")
	public String loanDeliveryStatusList(HttpSession session, Model model, BookVO vo) {
		vo.setMid((String) session.getAttribute("id"));
		model.addAttribute("books", userDao.selectRentDelivery(vo));
		model.addAttribute("recomendList", userDao.recommendBook(vo));
		model.addAttribute("message", "대출 도서가 없습니다");
		return "mypage/loanDeliveryStatusList";
	}

	// 대출 기록
	@RequestMapping("/loanHistory.do")
	public String loanHistory(HttpSession session, BookVO vo, Model model) {
		vo.setMid((String) session.getAttribute("id"));
		model.addAttribute("books", userDao.selectRentBook(vo));
		model.addAttribute("recomendList", userDao.recommendBook(vo));
		model.addAttribute("message", "대출 도서가 없습니다");
		return "mypage/loanHistory";
	}

	// 연장 ajax
	@RequestMapping("/extensionAjax.do")
	@ResponseBody
	public String extensionAjax(@Param("id") String id, @Param("isbn") String isbn, @Param("renewcnt") int renewcnt,
			BookVO vo) {

		String result = "F";
		vo.setMid(id);
		vo.setBisbn(isbn);
		vo.setRenewcnt(renewcnt);
		System.out.println(vo.getId());
		System.out.println(vo.getIsbn());
		System.out.println(vo.getRenewcnt());
		

		
		if (vo.getRenewcnt() == 0) {
			
			int n = userDao.extensionBook(vo);
			System.out.println("if문" + n);
			if (n != 0) {
				result = "T";
				System.out.println(result);
				return result;
			}

		}
		System.out.println(result);
		return result;
	}

	@RequestMapping("/reservationStatusList.do")
	public String reservationStatusList() {
		return "mypage/reservationStatusList";
	}

	// 희망도서목록
	@RequestMapping("/hopeBookList.do")
	public String hopeBookList(HttpSession session, HBookVO vo, Model model) {
		vo.setHid((String) session.getAttribute("id"));
		userDao.selectHbookByname(vo);

		if (vo != null) {
			model.addAttribute("hbookList", userDao.selectHbookByname(vo));
		}
		model.addAttribute("message", "해당 게시물이 없습니다.");
		return "mypage/hopeBookList";
	}

	// 관심도서목록
	@RequestMapping("/basketList.do")
	public String basketList(HttpSession session, Model model, BookVO vo) {
		vo.setId((String) session.getAttribute("id"));
		System.out.println(vo.getId());

		model.addAttribute("books", userDao.selectLikeBook(vo));
		model.addAttribute("message", "관심 도서가 없습니다");
		model.addAttribute("rLikeBookList", userDao.recommendLikeBook(vo));
		System.out.println(vo.toString());

		return "mypage/basketList";
	}

	// 관심도서 삭제
	@RequestMapping("/delLikeBook.do")
	@ResponseBody
	public String delLikeBook(@RequestParam(value = "isbn[]") List<String> isbn) {
		System.out.println(isbn);
		String result = "F";
		for (int i = 0; i < isbn.size(); i++) {
			int n = userDao.delLikeBook(isbn.get(i));
			System.out.println(isbn.get(i));
			if (n != 0) {
				return result = "T";
			}
		}

		return result;
	}
	
	//희망도서 삭제
	@RequestMapping("/delHopeBook.do")
	@ResponseBody
	public String delHopeBook(@RequestParam(value = "no[]") List<Integer> no) {
		System.out.println(no);
		String result = "F";
		for (int i = 0; i < no.size(); i++) {
			int n = userDao.delHopeBook(no.get(i));
			System.out.println(no.get(i));
			if (n != 0) {
				return result = "T";
			}
		}

		return result;
	}
	
	@RequestMapping("/delBbsPost.do")
	@ResponseBody
	public String delBbsPost(@RequestParam(value = "no[]") List<Integer> no) {
		System.out.println(no);
		String result = "F";
		for (int i = 0; i < no.size(); i++) {
			int n = userDao.delBbsPost(no.get(i));
			System.out.println(no.get(i));
			if (n != 0) {
				return result = "T";
			}
		}

		return result;
	}

	// 묻고답하기
	@RequestMapping("/bbsPostList.do")
	public String bbsPostList(HttpSession session, QnaVO vo, Model model) {
		vo.setId((String) session.getAttribute("id"));

		model.addAttribute("qnaList", userDao.selectQnaByname(vo.getId()));

		
		model.addAttribute("message", "해당 게시물이 없습니다.");

		return "mypage/bbsPostList";
	}

	// 개인정보
	@RequestMapping("/memberModifyCheck.do")
	public String memberModifyCheck(HttpSession session, MemberVO vo, Model model) {
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("id", vo.getId());

		return "intro/memberModifyCheck";
	}

	// ajax 비밀번호 체크
	@RequestMapping("/memberModifyCheckPw.do")
	@ResponseBody
	public String memberModifyCheckPw(HttpSession session, @RequestParam("id") String id,
			@RequestParam("password") String pw, MemberVO vo) {
		vo.setId(id);
		vo.setPassword(pw);

		vo = memberDao.memberSelect(vo);
		String result = "F";
		if (vo != null) {
			result = "T";
		}
		return result;
	}

	@RequestMapping("/memberModify.do")
	public String memberModify(MemberVO vo, Model model, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "intro/memberModify";
	}

	// ajax 회원수정 확인
	@RequestMapping("/memberUpdate.do")
	@ResponseBody
	public String memberUpdate(HttpSession session, MemberVO vo, @Param("id") String id, @Param("tel") String tel,
			@Param("zipcode") String zipcode, @Param("address") String address,
			@Param("addressdetail") String addressdetail, @Param("email") String email) {
		vo.setId((String) session.getAttribute("id"));
		vo.setTel(tel);
		vo.setZipCode(zipcode);
		vo.setAddress(address);
		vo.setAddressdetail(addressdetail);
		vo.setEmail(email);
		String result = "F";
		int b = memberDao.memberUpdate(vo);
		System.out.println(vo.toString());
		if (b != 0) {
			result = "T";
		}
		return result;
	}

	@RequestMapping("/memberPwdModify.do")
	public String memberPwdModify(HttpSession session, Model model, MemberVO vo) {
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "intro/memberPwdModify";
	}

	@RequestMapping("/memberPwdUpdate.do")
	@ResponseBody
	public String memberPwdUpdate(MemberVO vo, @Param("id") String id, @Param("password") String password) {
		vo.setId(id);
		vo.setPassword(password);
		int b = memberDao.memberPwdUpdate(vo);
		String result = "F";
		if (b != 0) {
			result = "T";
		}
		return result;
	}

	
	@RequestMapping("/memberWithdraw.do")
	public String memberWithdraw(HttpSession session, MemberVO vo, Model model) {
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "intro/memberWithdraw";
	}

	@RequestMapping("/memberDelete.do")
	@ResponseBody
	public String memberDelete(HttpSession session, MemberVO vo, @Param("id") String id,
			@Param("password") String password) {
		vo.setId(id);
		vo.setPassword(password);
		int b = memberDao.memberDelete(vo);
		String result = "F";
		if (b != 0) {
			session.invalidate();
			result = "T";
		}
		System.out.println(vo.toString());
		System.out.println(b);
		return result;
	}

	@RequestMapping("/goodBye.do")
	public String goodBye() {
		return "intro/goodBye";
	}

}
