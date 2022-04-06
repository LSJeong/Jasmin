package co.jasmin.prj.admin.qnareply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.admin.qnareply.service.QnaReplyMapper;
import co.jasmin.prj.admin.qnareply.service.QnaReplyService;
import co.jasmin.prj.admin.qnareply.service.QnaReplyVO;
import co.jasmin.prj.qna.service.QnaVO;

@Repository("qnareplyDao")
public class QnaReplyServiceImpl implements QnaReplyService {

	@Autowired
	private QnaReplyMapper map;
	
	@Override
	public List<QnaReplyVO> qnareplySelectList() {
		return map.qnareplySelectList();
	}

	@Override
	public QnaReplyVO qnareplySelect(QnaReplyVO vo) {
		return map.qnareplySelect(vo);
	}

	@Override
	public int qnareplyInsert(QnaReplyVO vo) {
		return map.qnareplyInsert(vo);
	}

	@Override
	public int qnareplyUpdate(QnaReplyVO vo) {
		return map.qnareplyUpdate(vo);
	}

	@Override
	public int qnareplyDelete(QnaReplyVO vo) {
		return map.qnareplyDelete(vo);
	}

}
