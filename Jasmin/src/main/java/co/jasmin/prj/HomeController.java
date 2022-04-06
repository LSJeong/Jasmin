package co.jasmin.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.jasmin.prj.book.service.BookService;

@Controller
public class HomeController {
	
	@Autowired
	private BookService bookDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("mainBestBooks", bookDao.mainBestBook());
		model.addAttribute("mainLikeBooks", bookDao.mainLikeBook());
		model.addAttribute("mainReviewBooks", bookDao.mainReviewBook());
		model.addAttribute("mainRecommBooks", bookDao.mainRecommBook());
		
		String bclass = null;
		model.addAttribute("mainBookList", bookDao.mainBookList(bclass));
		
		return "home/home";
	}

	@RequestMapping("/ahome.do")
	public String ahome() {
		return "admin/home/ahome";
	}
	
	
}
