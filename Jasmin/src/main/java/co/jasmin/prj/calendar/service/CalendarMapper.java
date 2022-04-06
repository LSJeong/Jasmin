package co.jasmin.prj.calendar.service;

import java.util.List;

public interface CalendarMapper {
	CalendarVO CalendarSelect(int cno);
	List<CalendarVO> CalendarList();
	List<CalendarVO> calendarManage();
	int CalendarInsert(CalendarVO vo);
	int CalendarUpdate(CalendarVO vo);
	int CalendarDelete(int cno);
}
