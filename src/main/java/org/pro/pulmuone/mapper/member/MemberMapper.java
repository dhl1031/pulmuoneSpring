package org.pro.pulmuone.mapper.member;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.member.MemberDTO;

public interface MemberMapper {
	public MemberDTO getMember(String id) throws ClassNotFoundException, SQLException;
	
	public int insert(MemberDTO member) throws ClassNotFoundException, SQLException;

	//회원정보 + 권한정보 얻어오는 메서드
	public MemberDTO read(@Param("userid") String userid);
}
