package co.jasmin.prj.admin.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.jasmin.prj.admin.notice.service.ANoticeMapper;
import co.jasmin.prj.admin.notice.service.ANoticeService;
import co.jasmin.prj.admin.notice.service.ANoticeVO;

@Repository("ANoticeDao")
	public class ANoticeServiceImpl implements ANoticeService {
		@Autowired
		private ANoticeMapper map;
		
		@Override
		public List<ANoticeVO> anoticeSelectList() {
			return map.anoticeSelectList();
		}

		@Override
		public ANoticeVO anoticeSelect(ANoticeVO vo) {
			return map.anoticeSelect(vo);
		}

		@Override
		public int anoticeInsert(ANoticeVO vo) {
			return map.anoticeInsert(vo);
		}

		@Override
		public int anoticeDelete(ANoticeVO vo) {
			return map.anoticeDelete(vo);
		}

		@Override
		public int anoticeUpdate(ANoticeVO vo) {
			return map.anoticeUpdate(vo);
		}

		@Override
		public int updateCount(int no) {
			return map.updateCount(no);
		}

}

