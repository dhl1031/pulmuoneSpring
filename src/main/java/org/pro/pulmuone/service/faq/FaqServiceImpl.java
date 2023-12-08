package org.pro.pulmuone.service.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.faq.FaqDTO;
import org.pro.pulmuone.mapper.faq.FaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	public FaqMapper faqMapper;
	
	@Override
	public ArrayList<FaqDTO> getFaqList(int pageNo, int category,  int numberPerPage, String searchKeyword)
			throws SQLException {
		ArrayList<FaqDTO> list = null;
		if( searchKeyword.equals("") ) {
			list = this.faqMapper.select(pageNo, category, numberPerPage);
		}else {
			list = this.faqMapper.search(pageNo, numberPerPage, searchKeyword); 
		}
		return list;
	}

	@Override
	public int getFaqTotalPage(int numberPerPage, int category, String searchKeyword) throws SQLException {
		return this.faqMapper.getTotalPages(numberPerPage, category, searchKeyword);
	}

	@Override
	public int getFaqTotal(int category, String searchKeyword) throws SQLException {
		return this.faqMapper.selectCount(category, searchKeyword);
	}
	
}
