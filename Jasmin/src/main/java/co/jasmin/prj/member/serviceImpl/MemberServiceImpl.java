package co.jasmin.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.member.service.MemberMapper;
import co.jasmin.prj.member.service.MemberService;
import co.jasmin.prj.member.service.MemberVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return map.memberList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberInsert(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberDelete(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberUpdate(vo);
	}


	@Override
	public int memberPwdUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberPwdUpdate(vo);
	}

	@Override
	public int memberIdChk(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberIdChk(vo);
	}
	
	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

	@Override
	public List<MemberVO> ajaxGetSearchList(String key, String keyword) {		
		return map.ajaxGetSearchList(key,keyword);
	}
	
	@Override
	public MemberVO chkMemberId(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.chkMemberId(vo);
	}

	@Override
	public MemberVO selectEmail(MemberVO vo) {
		// TODO Auto-generated method stub
		return  map.selectEmail(vo);
	}

	@Override
	public int newPwdUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.newPwdUpdate(vo);
	}

	@Override
	public int memberTotal() {
		// TODO Auto-generated method stub
		return map.memberTotal();
	}
	
}
