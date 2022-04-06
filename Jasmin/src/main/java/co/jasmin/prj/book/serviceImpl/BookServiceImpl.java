package co.jasmin.prj.book.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.book.service.BookMapper;
import co.jasmin.prj.book.service.BookService;
import co.jasmin.prj.book.service.BookVO;

@Repository("bookDao")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper map;
	
	@Override
	public List<BookVO> bookList() {
		return map.bookList();
	}

	@Override
	public boolean bookIsbnCheck(String isbn) {
		return map.bookIsbnCheck(isbn);
	}

	@Override
	public int bookInsert(BookVO vo) {
		return map.bookInsert(vo);
	}

	@Override
	public List<BookVO> bookASearch(String searchType, String searchinput) {
		return map.bookASearch(searchType, searchinput);
	}

	@Override
	public BookVO bookSelect(String isbn) {
		return map.bookSelect(isbn);
	}

	@Override
	public int bookUpdate(BookVO vo) {
		return map.bookUpdate(vo);
	}

	@Override
	public int bookDelete(BookVO vo) {
		return map.bookDelete(vo);
	}

	@Override
	public int bookbrowUpdate(String isbn) {
		return map.bookbrowUpdate(isbn);
	}

	@Override
	public List<BookVO> bestBookList(String bstart) {
		return map.bestBookList(bstart);
	}

	@Override
	public List<BookVO> chapterList(String bclass) {
		return map.chapterList(bclass);
	}

	@Override
	public List<BookVO> newBookList(String pyear) {
		return map.newBookList(pyear);
	}

	@Override
	public int bookrebrowUpdate(String isbn) {
		return map.bookrebrowUpdate(isbn);
	}

	@Override
	public List<BookVO> chapterBestList(String bclass) {
		return map.chapterBestList(bclass);
	}

	@Override
	public List<BookVO> allSearchBook(BookVO vo) {
		return map.allSearchBook(vo);
	}

	@Override
	public List<BookVO> mainBestBook() {
		return map.mainBestBook();
	}

	@Override
	public List<BookVO> mainLikeBook() {
		return map.mainLikeBook();
	}

	@Override
	public List<BookVO> mainReviewBook() {
		return map.mainReviewBook();
	}

	@Override
	public int bookrecommUpdate(BookVO vo) {
		return map.bookrecommUpdate(vo);
	}

	@Override
	public List<BookVO> mainRecommBook() {
		return map.mainRecommBook();
	}

	@Override
	public List<BookVO> mainBookList(String bclass) {
		return map.mainBookList(bclass);
	}

	@Override
	public int bookTotal() {
		return map.bookTotal();
	}

	
}
