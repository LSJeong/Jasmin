package co.jasmin.prj.qna.service;

import java.util.List;

public interface QnaService {
		List<QnaVO> qnaSelectList();
		QnaVO qnaSelect(QnaVO vo);
		int qnaInsert(QnaVO vo);
		int qnaUpdate(QnaVO vo);
		int qnaDelete(QnaVO vo);
		
		int qnaTodayCount();
	}


