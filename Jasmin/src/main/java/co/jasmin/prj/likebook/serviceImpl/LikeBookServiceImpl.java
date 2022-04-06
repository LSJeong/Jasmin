package co.jasmin.prj.likebook.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.likebook.service.LikeBookMapper;
import co.jasmin.prj.likebook.service.LikeBookService;
import co.jasmin.prj.likebook.service.LikeBookVO;

@Repository("likebookDao")
public class LikeBookServiceImpl implements LikeBookService {
	@Autowired
	private LikeBookMapper map;
	
	@Override
	public List<LikeBookVO> likebookList() {
		return map.likebookList();
	}

	@Override
	public int likebookInsert(LikeBookVO vo) {
		return map.likebookInsert(vo);
	}

	@Override
	public int likebookDelete(LikeBookVO vo) {
		return map.likebookDelete(vo);
	}

	@Override
	public LikeBookVO likebookSelect(LikeBookVO vo) {
		return map.likebookSelect(vo);
	}


}
