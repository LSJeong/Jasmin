package co.jasmin.prj.admin.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.book.service.BookService;
import co.jasmin.prj.rent.service.RentService;
import co.jasmin.prj.rent.service.RentVO;

@Controller
public class ArentController {

	@Autowired
	private RentService rentDao;

	@Autowired
	private BookService bookDao;

	@RequestMapping("arentlist.do")
	public String arentlist(Model model) {
		model.addAttribute("infolist", rentDao.arentlist());
		return "admin/rent/arentlist";
	}

	@RequestMapping("/aRent.do")
	public String aRent(Model model, @Param("infoid") String infoid) {
		ArrayList<RentVO> list = new ArrayList<>();
		list = (ArrayList<RentVO>) rentDao.rentInfoList(infoid);
		model.addAttribute("infolist", list);
		return "admin/rent/aRent";
	}

	@RequestMapping("/deliverstateUpdate.do")
	public String deliverstateUpdate(Model model, RentVO vo) {
		rentDao.deliverstateUpdate(vo);
		
		bookDao.bookrebrowUpdate(vo.getBisbn());
		
		return "admin/member/amember";
	}

	@RequestMapping("ajaxGetSearchRentList.do")
	@ResponseBody
	public List<RentVO> ajaxGetSearchRentList(@RequestParam("Rkey") String Rkey,
			@RequestParam("Rkeyword") String Rkeyword) {

		return rentDao.ajaxGetSearchRentList(Rkey, Rkeyword);
	}

}