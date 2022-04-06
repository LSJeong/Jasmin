package co.jasmin.prj.book.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BookVO {
	private String isbn;
	private String title;
	private String subject;
	private String writer;
	private int bclass;
	private String pyear;
	private String publisher;
	private String wsubject;
	private String chapter;
	private int total;
	private int brow;
	private String bpicture;
	private String ppicture;
	private String status;
	
	//RentVO
	private String mid;
	private String bisbn;
	private String bstart;
	private String bend;
	private String rdate;
	private String delaydate;
	private int renewcnt;
	private String deliveryn;
	private String deliverstate;
	
	//likeVO
	private String id;
		
	private String searchType;
	private String searchinput;
	
	//출판연도 검색시 필요
	private String eyear;
	
	//추천도서 등록
	private String recommyn;
}
