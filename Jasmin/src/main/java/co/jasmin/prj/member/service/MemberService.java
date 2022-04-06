package co.jasmin.prj.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberList();
	public List<MemberVO> memberSelectList();
	public List<MemberVO> ajaxGetSearchList(String key, String keyword);
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberDelete(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberPwdUpdate(MemberVO vo);
	int memberIdChk(MemberVO vo);
	MemberVO chkMemberId(MemberVO vo);
	
	MemberVO selectEmail(MemberVO vo);
	int newPwdUpdate(MemberVO vo);
	
	int memberTotal();

}
