package co.jasmin.prj.admin.qna.service;

import java.util.List;

public interface AQnaService{
	List<AQnaVO> aqnaSelectList();
	AQnaVO aqnaSelect(AQnaVO vo);
	
	int aqnaUpdate(AQnaVO vo);
	}


