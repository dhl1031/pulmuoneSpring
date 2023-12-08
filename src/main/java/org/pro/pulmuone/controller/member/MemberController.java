package org.pro.pulmuone.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	@GetMapping("login")
	public String login(HttpServletRequest request) {
		log.warn("> MemberController login()...");
		
		// referer - 이전 경로를 가지고 있는 속성
		String referer = request.getRequestURI();
		String queryString = null;
		queryString = request.getQueryString();
		
		if ( queryString != null ) {
			referer += "?" + queryString;
		}
		request.getSession().setAttribute("referer", referer);
		
		return "temp/login.tiles";
	}
	

	
}
