package co.jasmin.prj.admin.notice.service;

import java.util.List;

public interface ANoticeService {
	List<ANoticeVO> anoticeSelectList();
	ANoticeVO anoticeSelect(ANoticeVO vo);
	int anoticeInsert(ANoticeVO vo);
	int anoticeDelete(ANoticeVO vo);
	int anoticeUpdate(ANoticeVO vo);
	public int updateCount(int no);
}
