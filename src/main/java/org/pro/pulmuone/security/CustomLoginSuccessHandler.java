package org.pro.pulmuone.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.pro.pulmuone.security.domain.CurrentUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component("customLoginSuccessHandler")
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	private final RequestCache requestCache = new HttpSessionRequestCache();
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		log.warn("> Login Success...");
		
		clearSession(request);
		
		// Spring Security가 intercept했다면, 이전 페이지 정보를 가지고 있음.
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String referer = (String) request.getSession().getAttribute("referer");
		if (referer != null) {
			request.getSession().removeAttribute("referer");
		}
		
		String location = "/";

        if (savedRequest != null) {
        	location = savedRequest.getRedirectUrl();
        } else if (referer != null && !referer.equals("")) {
        	// intercept가 아닌 경우, 컨트롤러에서 request에 담은 referer 사용
        	// 예시) 비회원 상태로 이용가능한 화면에서, 헤더 로그인 버튼 클릭을 통한 로그인 시도
            if (referer.contains("/login")) {
            	location = "/";
            } else {
            	location = referer;
            }
        }
        
        // 비밀번호를 초기화한 상태일 때, 비밀번호 변경 페이지로 즉시 이동.
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		if (user.getMember().getPwdReset() == 1) {
			location = "/member/find/changePassword";
		}
		
        log.info(">> location:" + location);
		redirectStrategy.sendRedirect(request, response, location);
		
	}
	
	
    // 로그인 실패 후 성공 시 남아있는 에러 세션 제거
    protected void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }
}
