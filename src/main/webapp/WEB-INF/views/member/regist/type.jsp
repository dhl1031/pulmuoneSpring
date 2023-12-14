<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style> /* 로그인 버튼 */	
	

	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;

	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
</style>




		<div class="account-wrapper lg" style="width: 680px">
        <div class="textrow-layout" style="padding-top:40px; margin-bottom: 21px">
            <h2 class="title">
                사용중인 <b>카카오 아이디</b>로<br>
                회원가입합니다.
            </h2>
            <div class="content">
                <div class="button-set vertical">
                    <a class="button-basic prefix kakao" href="/member/regist/social?type=K" style="padding: 0 24px; font-size: 16px">
                        <i class="ico" style="margin-right: 19px"></i>
                        카카오 아이디로 회원가입
                    </a>
                </div>
            </div>
        </div>
        <div class="textrow-layout" style="padding-top: 79px">
            <h2 class="title">
                <b>네이버 또는 일반회원</b>으로<br>
                회원가입합니다.
            </h2>
            <div class="content">
                <div class="button-set vertical">
                    <a href="/member/regist/social?type=N" class="button-basic prefix naver" style="font-size: 16px">
                        <i class="ico" style="margin-right: 21px"></i>
                        네이버 아이디로 회원가입
                    </a>
                    <a href="/member/regist/step1" class="button-basic prefix join" style="font-size: 16px">
                        <i class="ico" style="margin-right: 21px"></i>
                        일반 아이디로 회원가입
                    </a>
                </div>
            </div>
        </div>
    </div>
