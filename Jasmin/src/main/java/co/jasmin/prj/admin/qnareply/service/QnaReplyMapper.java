package co.jasmin.prj.admin.qnareply.service;

import java.util.List;

import co.jasmin.prj.qna.service.QnaVO;

public interface QnaReplyMapper {
	List<QnaReplyVO> qnareplySelectList();
	QnaReplyVO qnareplySelect(QnaReplyVO vo);
	int qnareplyInsert(QnaReplyVO vo);
	int qnareplyUpdate(QnaReplyVO vo);
	int qnareplyDelete(QnaReplyVO vo);
}
