package co.jasmin.prj.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.member.service.MemberService;
import co.jasmin.prj.member.service.MemberVO;

@Controller
public class AmemberController {
	
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/amember.do")
	public String amember(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "admin/member/amember";
	}	
	
	@RequestMapping("/ajaxGetSearchList.do")
	@ResponseBody
	public List<MemberVO> ajaxGetSearchList(@RequestParam("key") String key, @RequestParam("keyword") String keyword) {

		return memberDao.ajaxGetSearchList(key, keyword);
	}

}
