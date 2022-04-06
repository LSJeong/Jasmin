package co.jasmin.prj.rent.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.rent.service.RentMapper;
import co.jasmin.prj.rent.service.RentService;
import co.jasmin.prj.rent.service.RentVO;

@Repository("rentDao")
public class RentServiceImpl implements RentService {
	@Autowired
	private RentMapper map;

	@Override
	public String bookbendDate(String bisbn) {
		return map.bookbendDate(bisbn);
	}

	@Override
	public RentVO bookrentCheck(RentVO vo) {
		return map.bookrentCheck(vo);
	}

	@Override
	public int renteBook(RentVO vo) {
		return map.renteBook(vo);
	}

	@Override
	public int rentdeliverBook(RentVO vo) {
		return map.rentdeliverBook(vo);
	}

	@Override
	public int returneBook(RentVO vo) {
		return map.returneBook(vo);
	}

	@Override
	public int returndeliverBook(RentVO vo) {
		return map.returndeliverBook(vo);
	}

	@Override
	public List<RentVO> rentInfoList(String infoid) {
		return map.rentInfoList(infoid);
	}

	@Override
	public int deliverstateUpdate(RentVO vo) {
		return map.deliverstateUpdate(vo);
	}

	@Override
	public int rentCountCheck(RentVO vo) {
		return map.rentCountCheck(vo);
	}

	@Override
	public List<RentVO> chartSearch(String year) {
		return map.chartSearch(year);
	}

	@Override
	public List<RentVO> arentlist() {
		return map.arentlist();
	}

	@Override
	public List<RentVO> ajaxGetSearchRentList(String Rkey, String Rkeyword) {
		return map.ajaxGetSearchRentList(Rkey, Rkeyword);
	}

	@Override
	public int rentTodayCount() {
		return map.rentTodayCount();
	}

	@Override
	public List<RentVO> rentChartSearch(String year) {
		return map.rentChartSearch(year);
	}

}
