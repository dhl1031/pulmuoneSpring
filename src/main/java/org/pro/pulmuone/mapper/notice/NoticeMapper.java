package org.pro.pulmuone.mapper.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.notice.NoticeDTO;

public interface NoticeMapper {
	// 조회
	ArrayList<NoticeDTO> select(int pageNo, int numberPerPage) throws SQLException;

	// 총 개수 
	int selectCount() throws SQLException;

	// 총 페이지 
	int getTotalPages(int numberPerPage) throws SQLException;

	// 상세페이지 
	NoticeDTO view(int seq) throws SQLException;

	// 글쓰기 
	int write(NoticeDTO dto) throws SQLException;

	// 글 수정 
	int edit (NoticeDTO dto) throws SQLException;

	// 삭제 
	int delete(int seq) throws SQLException;
}
