package org.pro.pulmuone.service.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.notice.NoticeDTO;

public interface NoticeService {
	// 공지사항 목록 조회 
	ArrayList<NoticeDTO> getNoticeList(int pageNo, int numberPerPage) throws SQLException;

	// 총 갯수 
	int getTotalRows() throws SQLException;

	// 총 페이지수 
	int getTotalPages(int numberPerPage) throws SQLException;

	// 상세보기
	NoticeDTO getDetailView (int seq) throws SQLException;

	// 글쓰기 
	int write (NoticeDTO vo) throws SQLException;
	
	// 수정
	int edit (NoticeDTO dto) throws SQLException;
	
	// 삭제 
	int delete(int seq) throws SQLException;
}
