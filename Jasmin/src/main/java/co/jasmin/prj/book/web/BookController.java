package co.jasmin.prj.book.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.jasmin.prj.book.service.BookService;
import co.jasmin.prj.book.service.BookVO;
import co.jasmin.prj.breview.service.BreviewService;
import co.jasmin.prj.breview.service.BreviewVO;
import co.jasmin.prj.likebook.service.LikeBookService;
import co.jasmin.prj.likebook.service.LikeBookVO;
import co.jasmin.prj.member.service.MemberService;
import co.jasmin.prj.member.service.MemberVO;
import co.jasmin.prj.rent.service.RentService;
import co.jasmin.prj.rent.service.RentVO;

@Controller
public class BookController {
	@Autowired BookService bookDao;	
	@Autowired BreviewService breviewDao;	
	@Autowired LikeBookService likebookDao;	
	@Autowired RentService rentDao;
	@Autowired MemberService memberDao;
	
	//그냥 통합검색 폼 호출
	@RequestMapping("/allSearch.do")
	public String allSearch() {
		return "book/allSearch";
	}
	
	//통합에서 검색버튼 눌렀을때
	@RequestMapping("/allSearchBook.do")
	@ResponseBody
	public List<BookVO> allSearchBook(Model model, BookVO vo) {
		System.out.println("제목:"+vo.getTitle());
		System.out.println("저자:"+vo.getWriter());
		System.out.println("isbn:"+vo.getBisbn());
		System.out.println("주제:"+vo.getBclass());
		return bookDao.allSearchBook(vo);
	}
	
//	@RequestMapping("/search.do")
//	public String search(Model model) {
//		model.addAttribute("booklist", bookDao.bookList());
//		return "book/allSearch";
//	}
	
	@RequestMapping("/newbook.do")
	public String newbook(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar cal = Calendar.getInstance();
        String resultDate = sdf.format(cal.getTime());
        String pyear = resultDate.substring(0, 4);
        
		model.addAttribute("newbooklist", bookDao.newBookList(pyear));
		
		return "book/newbook";
	}
	
	@RequestMapping("/detailbook.do")
	public String detailbook(Model model, @Param("isbn") String isbn, HttpSession session) {
		model.addAttribute("book", bookDao.bookSelect(isbn));
		model.addAttribute("reviews", breviewDao.breviewSelectList(isbn));
		model.addAttribute("reviewavg", breviewDao.breviewAvg(isbn));
		
		String id = (String)session.getAttribute("id");
		LikeBookVO vo = new LikeBookVO();
		vo.setId(id);
		vo.setIsbn(isbn);
		model.addAttribute("likebook", likebookDao.likebookSelect(vo));
		
		RentVO vo2 = new RentVO();
		vo2.setBisbn(isbn);
		vo2.setMid(id);
		model.addAttribute("rentbook", rentDao.bookrentCheck(vo2));
		model.addAttribute("rentCheck", rentDao.rentCountCheck(vo2));
		
		BreviewVO vo3 = new BreviewVO();
		vo3.setId(id);
		vo3.setIsbn(isbn);
		model.addAttribute("reviewCheck", breviewDao.breviewSelect(vo3));
		
		MemberVO vo4 = new MemberVO();
		vo4.setId((String)session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo4));
		return "book/detailbook";
	}
	
	
	@RequestMapping("/chapter.do")
	public String chapter(Model model, @Param("bclass") String bclass) {
		model.addAttribute("chpaterBestbooks", bookDao.chapterBestList(bclass));
		model.addAttribute("chapterbooks", bookDao.chapterList(bclass));
		return "book/chapter";
	}
	
	
	@RequestMapping("/bookSearch.do")
	@ResponseBody
	public List<BookVO> bookSearch() {
		return bookDao.bookList();
	}
	
	
	@RequestMapping("/bestbook.do")
	public String bestbook(Model model, @Param("bstart") String bstart) {
		
		if(bstart == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	        // 현재 날짜시간 구하기
	        Calendar cal = Calendar.getInstance();
	        String resultDate = sdf.format(cal.getTime());
	        bstart = resultDate.substring(0, 4);	      
		}
		
		model.addAttribute("bestbooks",bookDao.bestBookList(bstart));
		model.addAttribute("selectyear", bstart);
	
        
		return "book/bestbook";
	}
	
	@RequestMapping("/mainBookList.do")
	@ResponseBody
	public List<BookVO> mainBookList(@Param("bclass") String bclass) {
		return bookDao.mainBookList(bclass);			
	}
	
	@RequestMapping("/mainSearchBtn.do")
	public String mainSearchBtn(Model model, BookVO vo) {
		model.addAttribute("mainBookSearchs",bookDao.allSearchBook(vo));
		
		return "book/allSearch";
	}
	
	@RequestMapping("/bookTotal.do")
	@ResponseBody
	public int bookTotal() {
		return bookDao.bookTotal();
	}
}
