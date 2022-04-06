package co.jasmin.prj.member.web;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.jasmin.prj.member.service.MemberService;
import co.jasmin.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(HttpSession session, MemberVO vo) {

		vo = memberDao.memberSelect(vo);
		String result = "F";
		System.out.println(memberDao.memberSelect(vo));
		if (vo == null) {
			result = "F";
			return result;
		}
		if (vo.getStatus() != 'D') {
			if (vo != null) {
				session.setAttribute("id", vo.getId());
				session.setAttribute("author", vo.getAuthor());
				session.setAttribute("name", vo.getName());
				session.setAttribute("status", vo.getStatus());

				result = "T";
				return result;
			}

		}
		result = "D";

		return result;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:home.do";
	}

	// 회원가입
	@RequestMapping("/join.do")
	public String join() {
		return "member/join";
	}

	// 아이디 체크
	@RequestMapping("/memberidChk.do")
	@ResponseBody
	public String memberidChk(@Param("id") String id, MemberVO vo) {
		vo.setId(id);
		int n = memberDao.memberIdChk(vo);
		String result = "F";
		if (n == 0) {
			result = "T";
		}
		System.out.println(vo.getId());

		return result;
	}

	// 회원가입
	@RequestMapping("/memberJoin.do")
	@ResponseBody
	public String memberJoin(MemberVO vo) {

		System.out.println(vo.toString());
		int n = memberDao.memberInsert(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	// 아이디 찾기
	@RequestMapping("/findId.do")
	public String findId() {
		return "member/findId";
	}

	@RequestMapping("/findIdAjax.do")
	@ResponseBody
	public String findIdAjax(MemberVO vo, Model model, @Param("name") String name, @Param("email") String email) {
		String result = "F";
		vo.setName(name);
		System.out.println(vo.getName());
		vo.setEmail(email);
		System.out.println(vo.getEmail());
		vo = memberDao.chkMemberId(vo);
		System.out.println(memberDao.chkMemberId(vo));
		if (vo != null && vo.getStatus() == 'C') {
			String id = vo.getId();
			return id;
//				model.addAttribute("member", memberDao.chkMemberId(vo));
//				return model.addAttribute("member", memberDao.chkMemberId(vo));
		} else if (vo.getStatus() == 'D') {
			result = "D";
			return result;
		}
		return result;
	}

	@RequestMapping("/findIdChk.do")
	public ModelAndView findIdChk(ModelAndView mv, MemberVO vo, String name, String email) {
		vo.setName(name);
		vo.setEmail(email);
		vo = memberDao.chkMemberId(vo);
		System.out.println(memberDao.chkMemberId(vo));
		if (vo.getStatus() == 'C') {
			String id = vo.getId();

			mv.addObject("id", id);

			mv.setViewName("member/findIdResult");

		}

		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping("/findPw.do")
	public String findPw() {
		return "member/findPw";
	}

	@RequestMapping("/findIdResult.do")

	public String findIdResult(@Param("id") String id, MemberVO vo, Model model) {
		vo.setId(id);
		if (vo != null) {
			model.addAttribute("member", memberDao.memberSelect(vo));
		}

		return "member/findIdResult";
	}

	@RequestMapping("/emailCheck.do")
	@ResponseBody
	public String emailCheck(HttpSession session, Model model, @Param("id") String id, @Param("email") String email,
			MemberVO vo) {
		String result = "F";
		vo.setId(id);
		vo.setEmail(email);
		vo = memberDao.selectEmail(vo);
		if (vo != null && vo.getStatus() == 'C') {
			result = "T";
			return result;
		} else if (vo.getStatus() == 'D') {
			result = "D";
			return result;
		}

		return result;

	}

	@RequestMapping("/findPwEmail.do")
	@ResponseBody
	public String findPwEmail(MemberVO vo, Model model, HttpSession session, @Param("id") String id,
			@Param("email") String email) throws IOException {
		String result = "F";
		vo.setId(id);
		vo.setEmail(email);
		vo = memberDao.selectEmail(vo);
		if (vo != null) {
			Random r = new Random();
			int num = r.nextInt(999999);

			if (vo.getId().equals(id)) {
				session.setAttribute("email", vo.getEmail());

				String setfrom = "jasminelib@naver.com";
				String tomail = email; // 받는사람
				String title = "[자스민 도서관] 비밀번호 변경 인증 이메일 입니다.";
				String content = System.lineSeparator() + "안녕하세요 회원님" + System.lineSeparator()
						+ "자스민 도서관 비밀번호찾기(변경) 인증번호는 [ " + num + " ] 입니다" + System.lineSeparator();

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);

					mailSender.send(message);

				} catch (Exception e) {
					e.printStackTrace();
				}

				String n = Integer.toString(num);
				session.setAttribute("num", n);
				return n;
			} else {
				System.out.println("+++");
				return result;
			}

		}
		System.out.println("++");
		return result;
	}

	@RequestMapping("/findPwAuth.do")
	public String findPwAuth() {
		return "member/findPwAuth";
	}

	@RequestMapping("/inputNewPw.do")
	public String inputNewPw() {
		return "member/inputNewPw";
	}

	@RequestMapping("/newPwdUpdate.do")
	@ResponseBody
	public String newPwdUpdate(HttpSession session, MemberVO vo, @RequestParam("password") String pw) {
		String result = "F";
		vo.setEmail((String) session.getAttribute("email"));
		vo.setPassword(pw);
		System.out.println(vo.getEmail());
		System.out.println(pw);
		int n = memberDao.newPwdUpdate(vo);
		System.out.println(n);

//			if(n!=0) {
//				result="T";
//				return result;
//			}
		return result;
	}

	@RequestMapping("/memberTotal.do")
	@ResponseBody
	public int memberTotal() {
		return memberDao.memberTotal();
	}
}