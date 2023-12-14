package org.pro.pulmuone.service.inquiry;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.inquiry.InquiryDTO;
import org.pro.pulmuone.mapper.inquiry.InquiryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public int write(InquiryDTO dto) throws SQLException {
		return this.inquiryMapper.write(dto);
	}

	@Override
	public ArrayList<InquiryDTO> select(String user_id, String cate, int pageNo, int numberPerPage) throws SQLException {
		return this.inquiryMapper.select(user_id, cate, pageNo, numberPerPage);
	}

	@Override
	public int selectCount(String user_id, String cate) throws SQLException {
		return this.inquiryMapper.selectCount(user_id, cate);
	}

	@Override
	public InquiryDTO selectView(String user_id, String cate, int seq) throws SQLException {
		return this.inquiryMapper.view(user_id, cate, seq);
	}

	@Override
	public int delete(String user_id, String category, int seq) throws SQLException {
		return this.inquiryMapper.delete(user_id, category, seq);
	}

	@Override
	public int getToatlPages(String userId, String category, int numberPerPage) throws SQLException {
		return this.inquiryMapper.getTotalPages(userId, category, numberPerPage);
	}

}
