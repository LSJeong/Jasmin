package co.jasmin.prj.rent.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.book.service.BookService;
import co.jasmin.prj.rent.service.RentService;
import co.jasmin.prj.rent.service.RentVO;

@Controller
public class RentController {
	@Autowired
	private RentService rentDao;

	@Autowired
	private BookService bookDao;

	// 도서 대출
	@RequestMapping("/rentBook.do")
	@ResponseBody
	public String rentBook(Model model, @Param("deliveryn") String deliveryn, @Param("bisbn") String bisbn, HttpSession session) {
		String result = "F";
		RentVO vo = new RentVO();
		vo.setBisbn(bisbn);
		vo.setMid((String) session.getAttribute("id"));
		int n = 0;
		if (deliveryn.equals("N")) {
			vo.setDeliveryn(deliveryn);
			System.out.println(deliveryn);
			vo.setDeliverstate("해당없음");
			System.out.println(vo.getDeliverstate());
			n = rentDao.renteBook(vo);
		} else {
			vo.setDeliveryn(deliveryn);
			vo.setDeliverstate("배송요청");
			n = rentDao.rentdeliverBook(vo);
		}

		if (n != 0) {
			System.out.println("============");
			vo = rentDao.bookrentCheck(vo);
			result = vo.getBend().substring(0,10);
			bookDao.bookbrowUpdate(bisbn);
			//result = "T";
		}

		return result;
	}

	@RequestMapping("/bookbendDate.do")
	@ResponseBody
	public String bookbendDate(@Param("bisbn") String bisbn) {
		String enddate = rentDao.bookbendDate(bisbn);
		enddate = enddate.substring(0, 10);

		return enddate;
	}

	// 도서 반납
	@RequestMapping("/returnBook.do")
	@ResponseBody
	public String returnBook(Model model, @Param("bisbn") String bisbn, RentVO vo, HttpSession session) {
		String result = "F";
		int n = 0;
		vo.setMid((String) session.getAttribute("id"));
		vo.setBisbn(bisbn);

		vo = rentDao.bookrentCheck(vo);
		System.out.println(vo.getDeliveryn());
		if (vo.getDeliveryn().equals("N")) {
			n = rentDao.returneBook(vo);
			if (n != 0) {
				bookDao.bookrebrowUpdate(bisbn);
				result = "T";
			}
		} else {
			if (vo.getDeliverstate().equals("배송요청")) {
				vo.setDeliverstate("수거완료");
				///수거완료일때 반납일 넣어주고 brow update해주기
				rentDao.deliverstateUpdate(vo);
				n = bookDao.bookrebrowUpdate(bisbn);
			} else {
				vo.setDeliverstate("수거요청");
				n = rentDao.returndeliverBook(vo);
			}
			if (n != 0) {
				result = "T";
			}
		}

		return result;
	}

	@RequestMapping("/rentTodayCount.do")
	@ResponseBody
	public int rentTodayCount() {
		return rentDao.rentTodayCount();
	}
}