package org.pro.pulmuone.service.inquiry;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.inquiry.InquiryDTO;

public interface InquiryService {
	// 문의하기 
	int write(InquiryDTO dto) throws SQLException;
	
	// 문의 목록 보기 
	ArrayList<InquiryDTO> select(String user_id, String cate, int pageNo, int numberPerPage) throws SQLException;
	
	// 문의 갯수 
	int selectCount(String user_id, String cate) throws SQLException;
	
	// 총 페이지수 
	int getToatlPages(String user_id, String category, int numberPerPage) throws SQLException;
	
	// 문의 상세보기 
	InquiryDTO selectView(String user_id, String cate, int seq) throws SQLException;
	
	// 문의 삭제 
	int delete(String user_id, String category, int seq) throws SQLException;
}
