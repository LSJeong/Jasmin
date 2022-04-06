package co.jasmin.prj.calendar.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.calendar.service.CalendarMapper;
import co.jasmin.prj.calendar.service.CalendarService;
import co.jasmin.prj.calendar.service.CalendarVO;

@Repository("CalendarDao")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	CalendarMapper map;

	@Override
	public List<CalendarVO> CalendarList() {
		return map.CalendarList();
	}
	
	@Override
	public int CalendarUpdate(CalendarVO vo) {
		return map.CalendarUpdate(vo);
	}

	@Override
	public int CalendarInsert(CalendarVO vo) {
		return map.CalendarInsert(vo);
	}

	

	@Override
	public List<CalendarVO> calendarManage() {
		return map.calendarManage();
	}

	@Override
	public CalendarVO CalendarSelect(int cno) {
		return map.CalendarSelect(cno);
	}

	@Override
	public int CalendarDelete(int cno) {
		return map.CalendarDelete(cno);
	}


	

}
