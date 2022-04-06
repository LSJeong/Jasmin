package co.jasmin.prj.rent.service;

import lombok.Data;

@Data
public class RentVO {
	private String mid;
	private String bisbn;
	private String bstart;
	private String bend;
	private String rdate;
	private String delaydate;
	private String renewcnt;
	private String deliveryn;
	private String deliverstate;
	
	// 대출 상세정보 관리 info 뷰	
	private String name; // member
	private String title; // book
	private String isbn; // book
	
	private String dd;
	private String rr;
	
	private String cnt;
}
