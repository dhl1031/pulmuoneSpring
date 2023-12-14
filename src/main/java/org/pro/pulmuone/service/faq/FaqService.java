package org.pro.pulmuone.service.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.faq.FaqDTO;

public interface FaqService {
	ArrayList<FaqDTO> getFaqList(int pageNo, int category,  int numberPerPage, String searchKeyword) throws SQLException;
	
	int getFaqTotalPage (int numberPerPage, int category, String searchKeyword ) throws SQLException;
	
	int getFaqTotal (int category, String searchKeyword) throws SQLException;
	
	// faq 쓰기
	int write (FaqDTO vo) throws SQLException;
	
	// faq 삭제 
	int delete (int seq, int category) throws SQLException;
}
