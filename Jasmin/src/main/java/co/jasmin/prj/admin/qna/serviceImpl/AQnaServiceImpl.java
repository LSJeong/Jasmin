package co.jasmin.prj.admin.qna.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.admin.qna.service.AQnaMapper;
import co.jasmin.prj.admin.qna.service.AQnaService;
import co.jasmin.prj.admin.qna.service.AQnaVO;
import co.jasmin.prj.qna.service.QnaMapper;
import co.jasmin.prj.qna.service.QnaService;
import co.jasmin.prj.qna.service.QnaVO;

@Repository("aqnaDao")
public class AQnaServiceImpl implements AQnaService {

	@Autowired
	private AQnaMapper map;

	@Override
	public List<AQnaVO> aqnaSelectList() {
		return map.aqnaSelectList();
	}

	@Override
	public AQnaVO aqnaSelect(AQnaVO vo) {
		return map.aqnaSelect(vo);
	}

	@Override
	public int aqnaUpdate(AQnaVO vo) {
		return map.aqnaUpdate(vo);
	}


}
