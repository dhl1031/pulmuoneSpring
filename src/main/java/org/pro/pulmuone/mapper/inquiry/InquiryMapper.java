package org.pro.pulmuone.mapper.inquiry;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.inquiry.InquiryDTO;

public interface InquiryMapper {
	// 문의 작성
	int write (InquiryDTO dto) throws SQLException;

	// 문의 목록
	ArrayList<InquiryDTO> select (String user_id, String cate, int pageNo, int numberPerPage) throws SQLException;

	// 문의 갯수 
	int selectCount ( String user_id, String category) throws SQLException;

	// 총 페이지 수 
	int getTotalPages(String userId, String category, int numberPerPage) throws SQLException;
	
	// 문의 상세보기
	InquiryDTO view (String user_id, String category, int seq) throws SQLException;

	// 문의 삭제
	int delete (String user_id, String category, int seq) throws SQLException;
}
