package co.jasmin.prj.breview.service;

import java.util.List;

public interface BreviewMapper {
	List<BreviewVO> breviewSelectList(String isbn);
	BreviewVO breviewSelect(BreviewVO vo);
	int breviewInsert(BreviewVO vo);
	int breviewUpdate(BreviewVO vo);
	int breviewDelete(BreviewVO vo);
	
	Integer breviewAvg(String isbn);
	
}
