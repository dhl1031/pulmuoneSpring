package org.pro.pulmuone.service.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.notice.NoticeDTO;
import org.pro.pulmuone.mapper.notice.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public ArrayList<NoticeDTO> getNoticeList(int pageNo, int numberPerPage) throws SQLException {
		return this.noticeMapper.select(pageNo, numberPerPage);
	}

	@Override
	public int getTotalRows() throws SQLException {
		return this.noticeMapper.selectCount();
	}

	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
		
		return this.noticeMapper.getTotalPages(numberPerPage);
	}

	@Override
	public NoticeDTO getDetailView(int seq) throws SQLException {
		return this.noticeMapper.view(seq);
	}

	@Override
	public int write(NoticeDTO vo) throws SQLException {
		return this.noticeMapper.write(vo);
	}

	@Override
	public int edit(NoticeDTO dto) throws SQLException {
		return this.noticeMapper.edit(dto);
	}

	@Override
	public int delete(int seq) throws SQLException {
		return this.noticeMapper.delete(seq);
	}

}
