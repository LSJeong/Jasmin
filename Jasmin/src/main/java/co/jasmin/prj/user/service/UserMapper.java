package co.jasmin.prj.user.service;

import java.util.List;

import co.jasmin.prj.book.service.BookVO;
import co.jasmin.prj.hbook.service.HBookVO;
import co.jasmin.prj.qna.service.QnaVO;

public interface UserMapper {
	List<BookVO> selectRentBook(BookVO vo);
	List<BookVO> selectLikeBook(BookVO vo); //관심도서
	int extensionBook(BookVO vo); //연장
	BookVO userRentBook(BookVO vo); //개인 대출목록
	int delLikeBook(String isbn); //관심도서 삭제
	int delHopeBook(int no);
	int delBbsPost(int no);
	List<HBookVO> selectHbookByname(HBookVO vo); //희망도서
	List<QnaVO> selectQnaByname(String id); //qna
	List<BookVO> selectRentEbook(BookVO vo); // ebook 목록
	List<BookVO>  selectRentDelivery(BookVO vo); // 배송 목록
	
	
	//info
	int countRentEbook(String id);//이북대출 카운트
	int countRentBook(String id);//배달 대출 카운트
	int countLikebook(String id);
	
	int countHbook(String id);
	int countQna(String id);
	
	//
	List<BookVO> recommendBook(BookVO vo);
	List<BookVO> recommendLikeBook(BookVO vo);
	
	//
	QnaVO selectQnaReply(QnaVO vo);
}
