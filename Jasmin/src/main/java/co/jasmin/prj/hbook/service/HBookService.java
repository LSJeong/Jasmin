package co.jasmin.prj.hbook.service;

import java.util.List;

public interface HBookService {

	List<HBookVO> hbookSelectList();
	HBookVO hbookSelect(HBookVO vo);
	int hbookInsert(HBookVO vo);
	int hbookUpdate(HBookVO vo);
	int hbookDelete(HBookVO vo);
	public int updateCount(int no);
}
