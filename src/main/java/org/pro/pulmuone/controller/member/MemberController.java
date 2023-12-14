package org.pro.pulmuone.controller.member;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pro.pulmuone.domain.member.MemberDTO;
import org.pro.pulmuone.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		log.warn("> MemberController login()...");

		
		// referer - 이전 경로를 가지고 있는 속성
//		String referer = request.getRequestURI();
		String referer = request.getHeader("Referer");
	    if (referer != null && !referer.contains("/member/login")) {
	        request.getSession().setAttribute("referer", referer);
	    }

//		String queryString = null;
//		queryString = request.getQueryString();
//		
//		if ( queryString != null ) {
//			referer += "?" + queryString;
//		}
//		System.out.println(referer);
//		request.getSession().setAttribute("referer", referer);
	    
		return "member/login.tiles";
	}
	
	@GetMapping("regist/type")
	public String registType() {
		
		return "member/regist/type.tiles";
	}
	
	@GetMapping("regist/step1")
	public String registStep1() {
		
		return "member/regist/step1.tiles";
	}

	@GetMapping("regist/step2")
	public String interceptStep2() {

		return "redirect:/member/regist/step1";
	}
	
	@PostMapping("regist/step2")
	public String registStep2(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		String inputTel = request.getParameter("tel");
		String tel = String.format("%s-%s-%s", inputTel.substring(0, 3), inputTel.substring(3, 7), inputTel.substring(7, 11));

		String name = request.getParameter("name");
		String rrnBirthDate = request.getParameter("rrnBirthDate");
		String rrnGenderCode = request.getParameter("rrnGenderCode");		
		
		MemberDTO dto = null;
		dto = this.memberService.authorizeNICE(name, tel, rrnBirthDate, rrnGenderCode);
		
		if (dto != null) {
			// 이미 등록된 회원
			return "/member/login";
			
		} else {
			model.addAttribute("name", name);
			model.addAttribute("tel", tel);
			model.addAttribute("rrnBirthDate", rrnBirthDate);
			model.addAttribute("rrnGenderCode", rrnGenderCode);
			
			return "member/regist/step2.tiles";
		}		
	}
	
	@GetMapping("regist/step3")
	public String interceptStep3() {

		return "redirect:/member/regist/step1";
	}
	
	@PostMapping("regist/step3")
	public String registStep3(Model model, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String rrnBirthDate = request.getParameter("rrnBirthDate");
		String rrnGenderCode = request.getParameter("rrnGenderCode");
		
		String memberId = request.getParameter("memberId");
		String pwd = request.getParameter("memberPwd");
		String email = request.getParameter("email");
		int adApproval = ( request.getParameter("agree3") != null ? 1 : 0 );
		int marketingApproval = ( request.getParameter("agree4") != null ? 1 : 0 );
		
		
		model.addAttribute("name", name);
		model.addAttribute("tel", tel);
		model.addAttribute("rrnBirthDate", rrnBirthDate);
		model.addAttribute("rrnGenderCode", rrnGenderCode);
		model.addAttribute("memberId", memberId);
		model.addAttribute("pwd", pwd);
		model.addAttribute("email", email);
		model.addAttribute("adApproval", adApproval);
		model.addAttribute("marketingApproval", marketingApproval);
		
		return "member/regist/step3.tiles";
	}
	
	
	@GetMapping("regist/step4")
	public String interceptStep4() {

		return "redirect:/member/regist/step1";
	}
	
	@PostMapping("regist/step4")
	public String registStep4(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		String name = request.getParameter("name");
		
		String tel = request.getParameter("tel");
		String rrnBirthDate = request.getParameter("rrnBirthDate");
		String rrnGenderCode = request.getParameter("rrnGenderCode");
		Date birthDate = this.memberService.getBirthDate(rrnBirthDate, rrnGenderCode);
		
		String memberId = request.getParameter("memberId");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		int adApproval = Integer.parseInt(request.getParameter("adApproval"));
		int marketingApproval = Integer.parseInt(request.getParameter("marketingApproval"));
		
		String invCode = request.getParameter("friendCode");
		String invMemberId = request.getParameter("friendId");
		
		MemberDTO dto = MemberDTO.builder()
									.memberId(memberId)
									.pwd(pwd)
									.name(name)
									.tel(tel)
									.email(email)
									.birthDate(birthDate)
									.adApproval(adApproval)
									.marketingApproval(marketingApproval) 
									.build();
								
//		request.setAttribute("dto", dto);
		
		int signUpResult = this.memberService.signUp(dto);

//		request.setAttribute("memberId", memberId);
//		request.setAttribute("pwd", pwd);
		
		return "member/regist/step4.tiles";
	}
	
	@GetMapping("/find/id")
	public String findId() {
		
		return "member/find/id.tiles";
	}
	
	@GetMapping("/find/id-success")
	public String findIdSuccess() {
		
		return "redirect:/member/find/id";
	}
	
	@PostMapping("/find/id-success")
	public String findIdSuccess(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		String inputTel = request.getParameter("tel");
		String tel = String.format("%s-%s-%s", inputTel.substring(0, 3), inputTel.substring(3, 7), inputTel.substring(7, 11));

		String name = request.getParameter("name");
		String rrnBirthDate = request.getParameter("rrnBirthDate");
		String rrnGenderCode = request.getParameter("rrnGenderCode");		
		
		MemberDTO dto = null;
		dto = this.memberService.authorizeNICE(name, tel, rrnBirthDate, rrnGenderCode);
		
		if (dto != null) {
			// 등록된 회원
			int memberIdLength = dto.getMemberId().length();
			String memberId = dto.getMemberId().substring(0, memberIdLength-2) + "**";

			String datePattern = "yyyy년 MM월 dd일";
			SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
			String regDate = sdf.format(dto.getRegDate());
			
			model.addAttribute("memberId", memberId);
			model.addAttribute("regDate", regDate);
			
			return "member/find/id-success.tiles";
			
		} else {

			return "redirect:/member/login";
		}		
		
		
	}
	

	@GetMapping("/find/password")
	public String findPwd() {
		
		return "member/find/password.tiles";
	}
	
	@GetMapping("/find/password-success")
	public String findPwdSuccess() {
		
		return "redirect:/member/find/password";
	}

	@PostMapping("/find/password-success")
	public String findPwdSuccess(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		String memberId = request.getParameter("memberId");
		String name = request.getParameter("name");
		
		String inputTel = request.getParameter("tel");
		String tel = String.format("%s-%s-%s", inputTel.substring(0, 3), inputTel.substring(3, 7), inputTel.substring(7, 11));
		String rrnBirthDate = request.getParameter("rrnBirthDate");
		String rrnGenderCode = request.getParameter("rrnGenderCode");		
		
		MemberDTO dto =  this.memberService.authorizeNICE(name, tel, rrnBirthDate, rrnGenderCode);
		
		String[] telArr = tel.split("-");
		String markedTel = String.format("%s-%s-%s", telArr[0], "*".repeat(telArr[1].length()) ,telArr[2]);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("tel", tel);
		model.addAttribute("email", dto.getEmail());
		model.addAttribute("maskedTel", markedTel); // 중간 번호가 가려진 전화번호
		
		return "member/find/password-success.tiles";
	}
	
	
	@GetMapping("/find/changePassword")
	public String changePwd() {
		
		return "member/find/changePassword.tiles";
	}
}
