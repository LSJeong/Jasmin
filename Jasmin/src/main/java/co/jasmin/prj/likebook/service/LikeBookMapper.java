package co.jasmin.prj.likebook.service;

import java.util.List;

public interface LikeBookMapper {
	List<LikeBookVO> likebookList();
	LikeBookVO likebookSelect(LikeBookVO vo);
	int likebookInsert(LikeBookVO vo);
	int likebookDelete(LikeBookVO vo);
}
