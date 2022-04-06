package co.jasmin.prj.admin.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.jasmin.prj.book.service.BookService;
import co.jasmin.prj.book.service.BookVO;
import co.jasmin.prj.rent.service.RentService;
import co.jasmin.prj.rent.service.RentVO;

@Controller
public class AbookController {
	@Autowired
	private BookService bookDao;
	@Autowired
	private RentService rentDao;
	@Autowired
	String saveDirectory;

	// 검색~~~~~~~~~~~~~~~~ //
	@RequestMapping("/bookASearch.do")
	@ResponseBody
	public List<BookVO> bookASearch(@RequestParam("searchType") String searchType,
			@RequestParam("searchinput") String searchinput) {
		return bookDao.bookASearch(searchType, searchinput);
	}

	@RequestMapping("/bookupdateForm.do")
	public String bookupdateForm(@Param("isbn") String isbn, Model model) {
		model.addAttribute("books", bookDao.bookSelect(isbn));
		return "admin/book/bookupdateForm";
	}

	@RequestMapping("/bookmanage.do")
	public String bookmanage(Model model) {
		model.addAttribute("booklist", bookDao.bookList());
		return "admin/book/bookmanage";
	}

	@PostMapping("/bookupload.do")
	public String bookupload(BookVO vo, MultipartFile file) throws IOException {

		String fileName = file.getOriginalFilename();

		if (fileName != "") {

			String pfileName = UUID.randomUUID().toString();
			pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(saveDirectory, pfileName);

			vo.setBpicture(fileName);
			vo.setPpicture(pfileName);

			if (!new File(saveDirectory).exists()) {
				new File(saveDirectory).mkdirs();
			}

			try {
				FileCopyUtils.copy(file.getBytes(), target);
				bookDao.bookInsert(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			bookDao.bookInsert(vo);
		}

		return "redirect:bookmanage.do";
	}

	@RequestMapping("/bookinsertForm.do")
	public String bookinsert() {
		return "admin/book/bookinsertForm";
	}

	@RequestMapping("/isbnCheck.do")
	@ResponseBody
	public String isbnCheck(@Param("isbn") String isbn) {
		String result = "F";
		boolean b = bookDao.bookIsbnCheck(isbn);
		if (b) {
			result = "T";
		}
		return result;
	}

	@PostMapping("/bookUpdate.do")
	public String bookUpdate(BookVO vo, MultipartFile file) throws IllegalStateException, IOException {
		BookVO origin = new BookVO();
		origin = bookDao.bookSelect(vo.getIsbn());
		String originF = origin.getBpicture();
		System.out.println(originF);

		String fileName = file.getOriginalFilename();

		if (fileName != "") {
			String pfileName = UUID.randomUUID().toString();
			pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(saveDirectory, pfileName);
			vo.setBpicture(fileName);
			vo.setPpicture(pfileName);
			System.out.println(pfileName);
			if (!new File(saveDirectory).exists()) {
				new File(saveDirectory).mkdirs();
			}

			File target2 = new File(saveDirectory, origin.getPpicture());
			if (target2.exists()) {
				target2.delete();
			}

			try {
				FileCopyUtils.copy(file.getBytes(), target);
				System.out.println(vo.getPpicture());
				vo.setStatus("U");
				bookDao.bookUpdate(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			if (originF != null) {
				vo.setBpicture(origin.getBpicture());
				vo.setPpicture(origin.getPpicture());
			}
			vo.setStatus("U");
			bookDao.bookUpdate(vo);
		}
		return "redirect:/bookmanage.do";
	}

	@RequestMapping("/bookDelete.do")
	public String bookDelete(@Param("isbn") String isbn) {
		BookVO vo = new BookVO();
		vo = bookDao.bookSelect(isbn);

		if (vo.getBrow() != 0) {
			// 누가 빌려갔으면 삭제처리 불가
		} else {
			vo.setStatus("D");
			bookDao.bookDelete(vo);
		}
		return "redirect:/bookmanage.do";
	}

	@RequestMapping("/bookrecommUpdate.do")
	@ResponseBody
	public String bookrecommUpdate(BookVO vo) {
		String result = "F";
		int n = bookDao.bookrecommUpdate(vo);
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	@RequestMapping("/chart.do")
	public String chart() {
		return "admin/chart/achart";
	}

	@RequestMapping("/chartSearch.do")
	@ResponseBody
	public List<RentVO> chartSearch(@Param("year") String year) {
//		System.out.println(year);
		List<RentVO> list = rentDao.chartSearch(year);
//		System.out.println("listsize = " + list.size());
		return rentDao.chartSearch(year);
	}

	@RequestMapping("/rentChartSearch.do")
	@ResponseBody
	public List<RentVO> rentChartSearch(@Param("year") String year) {
		System.out.println("=========================");
		System.out.println(year);
		List<RentVO> list2 = rentDao.rentChartSearch(year);
		System.out.println("listsize2 = " + list2.size());
		return rentDao.rentChartSearch(year);
	}

}
