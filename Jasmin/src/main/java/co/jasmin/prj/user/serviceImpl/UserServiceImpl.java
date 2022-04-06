package co.jasmin.prj.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.book.service.BookVO;
import co.jasmin.prj.hbook.service.HBookVO;
import co.jasmin.prj.qna.service.QnaVO;
import co.jasmin.prj.user.service.UserMapper;
import co.jasmin.prj.user.service.UserService;

@Repository("userDao")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper map;
	@Override
	public List<BookVO> selectRentBook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.selectRentBook(vo);
	}
	@Override
	public List<BookVO> selectLikeBook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.selectLikeBook(vo);
	}

	@Override
	public int extensionBook(BookVO vo) {
		
		return map.extensionBook(vo);
	}
	@Override
	public BookVO userRentBook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.userRentBook(vo);
	}
	@Override
	public int delLikeBook(String isbn) {
		// TODO Auto-generated method stub
		return map.delLikeBook(isbn);
	}

	@Override
	public List<HBookVO> selectHbookByname(HBookVO vo) {
		// TODO Auto-generated method stub
		return map.selectHbookByname(vo);
	}
	@Override
	public List<QnaVO> selectQnaByname(String id) {
		// TODO Auto-generated method stub
		return map.selectQnaByname(id);
	}
	@Override
	public List<BookVO> selectRentEbook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.selectRentEbook(vo);
	}
	@Override
	public List<BookVO> selectRentDelivery(BookVO vo) {
		// TODO Auto-generated method stub
		return map.selectRentDelivery(vo);
	}
	@Override
	public int countRentEbook(String id) {
		// TODO Auto-generated method stub
		return map.countRentEbook(id);
	}
	@Override
	public int countRentBook(String id) {
		// TODO Auto-generated method stub
		return map.countRentBook(id);
	}
	@Override
	public int countHbook(String id) {
		// TODO Auto-generated method stub
		return map.countHbook(id);
	}
	@Override
	public int countLikebook(String id) {
		// TODO Auto-generated method stub
		return map.countLikebook(id);
	}
	@Override
	public int countQna(String id) {
		// TODO Auto-generated method stub
		return map.countQna(id);
	}
	@Override
	public List<BookVO> recommendBook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.recommendBook(vo);
	}
	@Override
	public List<BookVO> recommendLikeBook(BookVO vo) {
		// TODO Auto-generated method stub
		return map.recommendLikeBook(vo);
	}
	@Override
	public int delHopeBook(int no) {
		// TODO Auto-generated method stub
		return map.delHopeBook(no);
	}
	@Override
	public QnaVO selectQnaReply(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.selectQnaReply(vo);
	}
	@Override
	public int delBbsPost(int no) {
		// TODO Auto-generated method stub
		return map.delBbsPost(no);
	}


	

}
