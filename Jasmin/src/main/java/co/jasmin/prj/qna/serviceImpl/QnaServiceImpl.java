package co.jasmin.prj.qna.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.qna.service.QnaMapper;
import co.jasmin.prj.qna.service.QnaService;
import co.jasmin.prj.qna.service.QnaVO;

@Repository("qnaDao")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper map;
	
	@Override
	public List<QnaVO> qnaSelectList() {
		return map.qnaSelectList();
	}

	@Override
	public QnaVO qnaSelect(QnaVO vo) {
		return map.qnaSelect(vo);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		return map.qnaInsert(vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		return map.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(QnaVO vo) {
		return map.qnaDelete(vo);
	}

	@Override
	public int qnaTodayCount() {
		return map.qnaTodayCount();
	}

}
