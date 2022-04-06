package co.jasmin.prj.rent.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface RentMapper {
	int renteBook(RentVO vo);
	int rentdeliverBook(RentVO vo);
	String bookbendDate(String bisbn);
	RentVO bookrentCheck(RentVO vo);
	int returneBook(RentVO vo);
	int returndeliverBook(RentVO vo);
	
	List<RentVO> rentInfoList(String infoid);	
	int deliverstateUpdate(RentVO vo);
	
	int rentCountCheck(RentVO vo);
	List<RentVO> chartSearch(String year);
	
	List<RentVO> arentlist();
    public List<RentVO> ajaxGetSearchRentList(@Param("Rkey") String Rkey, @Param("Rkeyword") String Rkeyword);
    
    int rentTodayCount();
    List<RentVO> rentChartSearch(String year);
}
