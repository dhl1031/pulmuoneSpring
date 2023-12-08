package org.pro.pulmuone.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component("customLoginSuccessHandler")
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	private RequestCache requestCache = new HttpSessionRequestCache(); 
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		log.warn("> Login Success...");

		// Spring Security가 intercept했다면, 이전 페이지 정보를 가지고 있음.
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		
		String location = "/";
		String referer = (String) request.getSession().getAttribute("referer");
		
		if (referer != null) {
            request.getSession().removeAttribute("referer");
        }
		
        if (savedRequest != null) {
        	location = savedRequest.getRedirectUrl();
        } else if (referer != null && !referer.equals("")) {
        	// intercept가 아닌 경우, 컨트롤러에서 request에 담은 referer 사용
        	// 예시) 비회원 상태로 이용가능한 화면에서, 헤더 로그인 버튼 클릭을 통한 로그인 시도
            if (referer.contains("/member/login")) {
            	location = "/";
            } else {
            	location = referer;
            }
        }
		
		response.sendRedirect(location);

	}

}
