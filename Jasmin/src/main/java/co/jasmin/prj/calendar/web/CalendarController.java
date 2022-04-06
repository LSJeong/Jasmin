package co.jasmin.prj.calendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.calendar.service.CalendarService;
import co.jasmin.prj.calendar.service.CalendarVO;

@Controller
public class CalendarController {

	@Autowired
	CalendarService CalendarDao;

	@RequestMapping("/calendar.do")
	public String calendar() {
		return "info/calendar";
	}

	@RequestMapping("/CalendarList.do")
	@ResponseBody
	public List<Map<String, String>> CalendarList() {
		List<Map<String, String>> list = null;
		list = new ArrayList<>();
		List<CalendarVO> list2 = CalendarDao.CalendarList();
		System.out.println(list2);
		for (CalendarVO sc : list2) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", sc.getCtitle());
			map.put("start", sc.getCstart());
			map.put("end", sc.getCend());
			list.add(map);
		}
		return list;
	}

//	@RequestMapping("/CalendarInsert.do")
//	@ResponseBody
//	public String CalendarInsert(Model model, HttpServletRequest request, CalendarVO vo) {
//		
//		vo.setCtitle(request.getParameter("title"));
//		vo.setCstart(request.getParameter("start"));
//		vo.setCend(request.getParameter("end"));
//		int insertOK = CalendarDao.CalendarInsert(vo);
//		String message;
//		if (insertOK > 0) {
//			message = "OK";
//		} else {
//			message = "NG";
//		}
//		return message;
//	}

//	@RequestMapping("/CalendarDelete.do")
//	@ResponseBody
//	public String CalendarDelete(CalendarVO vo) {
//		int n = CalendarDao.CalendarDelete(vo);
//		String result = "F";
//		if (n != 0) {
//			result = "T";
//		}
//		return result;
//	}
}
