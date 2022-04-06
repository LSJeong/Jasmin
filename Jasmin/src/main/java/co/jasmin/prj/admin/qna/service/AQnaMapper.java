package co.jasmin.prj.admin.qna.service;

import java.util.List;

public interface AQnaMapper {
	List<AQnaVO> aqnaSelectList();
	AQnaVO aqnaSelect(AQnaVO vo);
	
	int aqnaUpdate(AQnaVO vo);
	}


