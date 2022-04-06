package co.jasmin.prj.book.service;

import java.util.List;

import co.jasmin.prj.rent.service.RentVO;

public interface BookService {
	List<BookVO> bookList();
	BookVO bookSelect(String isbn);
	List<BookVO> bookASearch(String searchType, String searchinput);
	int bookInsert(BookVO vo);
	int bookUpdate(BookVO vo);
	int bookDelete(BookVO vo);
	boolean bookIsbnCheck(String isbn);
	
	List<BookVO> bestBookList(String bstart);
	List<BookVO> chapterList(String bclass);
	List<BookVO> chapterBestList(String bclass);
	int bookbrowUpdate(String isbn);
	
	List<BookVO> newBookList(String pyear);
	int bookrebrowUpdate(String isbn);
	
	List<BookVO> allSearchBook(BookVO vo);
	
	List<BookVO> mainBestBook();
	List<BookVO> mainLikeBook();
	List<BookVO> mainReviewBook();
	List<BookVO> mainRecommBook();
	
	//추천도서 등록
	int bookrecommUpdate(BookVO vo);
	
	List<BookVO> mainBookList(String bclass);
	
	int bookTotal();
}
