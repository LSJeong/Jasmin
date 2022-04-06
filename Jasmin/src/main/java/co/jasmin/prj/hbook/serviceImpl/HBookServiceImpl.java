package co.jasmin.prj.hbook.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.hbook.service.HBookMapper;
import co.jasmin.prj.hbook.service.HBookService;
import co.jasmin.prj.hbook.service.HBookVO;

@Repository("hbookDao")
public class HBookServiceImpl implements HBookService{

	@Autowired
	private HBookMapper map;

	@Override
	public List<HBookVO> hbookSelectList() {
		return map.hbookSelectList();
	}

	@Override
	public HBookVO hbookSelect(HBookVO vo) {
		return map.hbookSelect(vo);
	}

	@Override
	public int hbookInsert(HBookVO vo) {
		return map.hbookInsert(vo);
	}

	@Override
	public int hbookUpdate(HBookVO vo) {
		return map.hbookUpdate(vo);
	}

	@Override
	public int hbookDelete(HBookVO vo) {
		return map.hbookDelete(vo);
	}

	@Override
	public int updateCount(int no) {
		return map.updateCount(no);
	}

	
}
