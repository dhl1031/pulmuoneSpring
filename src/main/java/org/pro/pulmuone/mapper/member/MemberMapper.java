package org.pro.pulmuone.mapper.member;

import java.sql.Date;
import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.member.MemberDTO;
import org.springframework.transaction.annotation.Transactional;

public interface MemberMapper {
	public int selectMemberForDuplicateIdCheck(@Param("memberId") String memberId) throws ClassNotFoundException, SQLException;
	
	public MemberDTO selectMemberForNICE(@Param("name") String name, @Param("tel") String tel, @Param("birthDate") Date birthDate) throws ClassNotFoundException, SQLException;

	public MemberDTO selectMemberWithInvCode(@Param("invCode") String invCode) throws ClassNotFoundException, SQLException;
	
	public String selectMemberForGetPwd(@Param("memberId") String memberId) throws ClassNotFoundException, SQLException;
	
	@Transactional
	public int insert(MemberDTO dto) throws ClassNotFoundException, SQLException;

	@Transactional
	public int insertAuthForSignUp(String memberId) throws ClassNotFoundException, SQLException;
	
	public int updatePwd(@Param("memberId") String memberId, @Param("newPassword") String newPassword, @Param("pwdReset") int pwdReset) throws ClassNotFoundException, SQLException;
	
	//회원정보 + 권한정보 얻어오는 메서드
	public MemberDTO read(@Param("userid") String userid);


}
