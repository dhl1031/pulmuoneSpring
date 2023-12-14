package org.pro.pulmuone.service.member;

import java.sql.Date;
import java.sql.SQLException;

import org.pro.pulmuone.domain.member.MemberDTO;

public interface MemberService {

	MemberDTO authorizeNICE(String name, String tel, String rrnBirthDate, String rrnGenderCode) throws ClassNotFoundException, SQLException;

	boolean duplicateIdCheck(String memberId) throws ClassNotFoundException, SQLException;
	
	MemberDTO invCodeCheck(String invCode) throws ClassNotFoundException, SQLException;
	
	int signUp(MemberDTO dto) throws ClassNotFoundException, SQLException;

	String resetPassword(String memberId) throws ClassNotFoundException, SQLException;

	boolean changePassword(String memberId, String nowMemberPwd, String memberPwd) throws ClassNotFoundException, SQLException;

	Date getBirthDate(String rrnBirthDate, String rrnGenderCode);


}
