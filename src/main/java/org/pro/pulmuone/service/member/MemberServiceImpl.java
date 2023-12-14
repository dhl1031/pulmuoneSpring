package org.pro.pulmuone.service.member;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;

import org.pro.pulmuone.domain.member.MemberDTO;
import org.pro.pulmuone.mapper.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public MemberDTO authorizeNICE(String name, String tel, String rrnBirthDate, String rrnGenderCode) throws ClassNotFoundException, SQLException {
		
		Date birthDate = getBirthDate(rrnBirthDate, rrnGenderCode);
		
		MemberDTO dto = null;
		dto = this.memberMapper.selectMemberForNICE(name, tel, birthDate);
		
		return dto;
	}

	@Override
	public boolean duplicateIdCheck(String memberId) throws ClassNotFoundException, SQLException {
	
		int result = this.memberMapper.selectMemberForDuplicateIdCheck(memberId);
		
		return result == 1 ? true : false;
	}
	
	@Override
	public MemberDTO invCodeCheck(String invCode) throws ClassNotFoundException, SQLException {
		
		MemberDTO dto = null;
		dto = this.memberMapper.selectMemberWithInvCode(invCode);
		
		return dto; 
	}

	
	
	@Override
	public int signUp(MemberDTO dto) throws ClassNotFoundException, SQLException {
		
		String invCode = getRandomInvCode();
		String pwd = dto.getPwd();
		
		dto.setPwd(this.passwordEncoder.encode(pwd));
		dto.setInvCode(invCode);
		
		int insertResult = this.memberMapper.insert(dto); // 회원정보 등록
		int insertAuthResult = this.memberMapper.insertAuthForSignUp(dto.getMemberId()); // 회원 권한 부여
		
		return insertResult + insertAuthResult;
	}
	
	// 비밀번호 초기화 : pwd = 11자리 랜덤 패스워드, pwd_reset = 1 업데이트 
	@Override
	public String resetPassword(String memberId) throws ClassNotFoundException, SQLException {
		final int pwdReset = 1;
		
		String newPassword = getRandomPwd();
		String encodedNewPassword = this.passwordEncoder.encode(newPassword);
		
		int updateResult = this.memberMapper.updatePwd(memberId, encodedNewPassword, pwdReset);
		
		return newPassword;
	}	
	
	@Override
	public boolean changePassword(String memberId, String nowPwd, String pwdToChange) throws ClassNotFoundException, SQLException {
		final int pwdReset = 0;
		
		String encodedPwdToChange = this.passwordEncoder.encode(pwdToChange);		
		String storedPwd = this.memberMapper.selectMemberForGetPwd(memberId);
		
		// 현재 비밀번호가 맞는지 확인
		boolean pwdIsMatch = this.passwordEncoder.matches(nowPwd, storedPwd);

		int updateResult = 0;
		
		if (pwdIsMatch) {
			updateResult = this.memberMapper.updatePwd(memberId, encodedPwdToChange, pwdReset );
		}		

		return updateResult == 1 ? true : false;
	}
	
	
	
	
	@Override
	public Date getBirthDate(String rrnBirthDate, String rrnGenderCode) {
		Date birthDate = null;

		System.out.println(rrnBirthDate + "-"+ rrnGenderCode);
//		String[] birthIn1800s = {"9","0"};
		String[] birthIn1900s = {"1","2","5","6"};
		String[] birthIn2000s = {"3","4","7","8"};
		
		String birthYear;
		
		if (Arrays.asList(birthIn1900s).contains(rrnGenderCode)) {
			birthYear = "19" + rrnBirthDate.substring(0, 2); 
		} else if (Arrays.asList(birthIn2000s).contains(rrnGenderCode)) {
			birthYear = "20" + rrnBirthDate.substring(0, 2);
		} else {
			birthYear = "18" + rrnBirthDate.substring(0, 2);			
		}		
		
		String birthMonth = rrnBirthDate.substring(2, 4); 
		String birthDay = rrnBirthDate.substring(4, 6);

		birthDate = Date.valueOf(String.format("%s-%s-%s", birthYear, birthMonth, birthDay));
		
		return birthDate;
	}
	
	
	private String getRandomInvCode() {
		String charRange = "abcdefgehijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		int charRangeLength = charRange.length();
		int invCodeLength = 5;
		int randomIndex;
		
		StringBuilder invCodeBuilder = new StringBuilder(invCodeLength);
		for (int i = 0; i < invCodeLength; i++) {
			randomIndex = (int) ( Math.random() * (charRangeLength) );
			invCodeBuilder.append(charRange.charAt(randomIndex));
		}
		
		String invCode = invCodeBuilder.toString();
		
		return invCode;
	}

	private String getRandomPwd() {
		String charRange = "abcdefgehijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`~!@#$%^&*()-_=+";
		int charRangeLength = charRange.length();
		int pwdLength = 11;
		int randomIndex;
		
		StringBuilder pwdBuilder = new StringBuilder(pwdLength);
		for (int i = 0; i < pwdLength; i++) {
			randomIndex = (int) ( Math.random() * (charRangeLength) );
			pwdBuilder.append(charRange.charAt(randomIndex));
		}
		
		String pwd = pwdBuilder.toString();
		
		return pwd;
	}

	
}
