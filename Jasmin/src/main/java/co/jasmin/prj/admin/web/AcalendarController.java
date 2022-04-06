package co.jasmin.prj.admin.web;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.jasmin.prj.calendar.service.CalendarService;
import co.jasmin.prj.calendar.service.CalendarVO;

@Controller
public class AcalendarController {

	@Autowired
	CalendarService CalendarDao;

	@RequestMapping("calendarManage.do")
	public String calendarManage(Model model) {
		model.addAttribute("calendarlist", CalendarDao.calendarManage());
		return "admin/calendar/calendarManage";
	}

	@RequestMapping("/calendarInsertForm.do")
	public String calendarInsertForm() {
		return "admin/calendar/calendarInsertForm";
	}

	@RequestMapping("/calendarUpload.do")
	public String calendarUpload(CalendarVO vo) {
		CalendarDao.CalendarInsert(vo);
		return "redirect:calendarManage.do";
	}

	@RequestMapping("/calendarUpdateForm.do")
	public String calendarUpdateForm(@Param("cno") int cno, Model model) {
		model.addAttribute("calendar", CalendarDao.CalendarSelect(cno));
		return "admin/calendar/calendarUpdateForm";
	}

	@RequestMapping("/calendarUpdate.do")
	public String calendarUpdate(CalendarVO vo) {
		CalendarDao.CalendarUpdate(vo);
		return "redirect:calendarManage.do";
	}
	
	@RequestMapping("/calendarDelete.do")
	public String calendarDelete(@Param("cno") int cno) {
		CalendarDao.CalendarDelete(cno);
		return "redirect:calendarManage.do";
	}

}
