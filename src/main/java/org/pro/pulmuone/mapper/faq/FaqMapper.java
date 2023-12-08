package org.pro.pulmuone.mapper.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.faq.FaqDTO;

public interface FaqMapper {
	// 1. 목록 조회
	//ArrayList<FaqDTO> select( int category, int being, int end, int total) throws SQLException;
	ArrayList<FaqDTO> select(int pageNo, int category,  int numberPerPage) throws SQLException;

	// faq 검색 
	ArrayList<FaqDTO> search(int pageNo, int numberPerPage, String searchKeyword ) throws SQLException;

	// faq 총 갯수
	int selectCount(int category, String searchKeyword) throws SQLException;

	// faq 유형의 페이지수
	int getTotalPages(int numberPerPage, int category, String searchKeyword) throws SQLException;

	// faq 글쓰기 
	int write(FaqDTO dto) throws SQLException;

	// 삭제 
	int delete(int seq, int category) throws SQLException;
}
