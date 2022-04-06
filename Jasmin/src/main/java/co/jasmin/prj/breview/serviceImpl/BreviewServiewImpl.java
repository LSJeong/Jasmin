package co.jasmin.prj.breview.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.breview.service.BreviewMapper;
import co.jasmin.prj.breview.service.BreviewService;
import co.jasmin.prj.breview.service.BreviewVO;

@Repository("breviewDao")
public class BreviewServiewImpl implements BreviewService {
	@Autowired
	private BreviewMapper map;
	
	@Override
	public List<BreviewVO> breviewSelectList(String isbn) {
		return map.breviewSelectList(isbn);
	}

	@Override
	public BreviewVO breviewSelect(BreviewVO vo) {
		return map.breviewSelect(vo);
	}

	@Override
	public int breviewInsert(BreviewVO vo) {
		return map.breviewInsert(vo);
	}

	@Override
	public int breviewUpdate(BreviewVO vo) {
		return map.breviewUpdate(vo);
	}

	@Override
	public int breviewDelete(BreviewVO vo) {
		return map.breviewDelete(vo);
	}

	@Override
	public Integer breviewAvg(String isbn) {
		return map.breviewAvg(isbn);
	}

}
