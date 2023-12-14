<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="container relative">
	<div class="account-wrapper">
		<ul class="tab-border-style">					
			<li class="item active">
				<a href="/member/find/id" class="item">
					아이디찾기
				</a>
			</li>
			<li class="item">
				<a href="/member/find/password" class="item">
					비밀번호찾기
				</a>
			</li>
		</ul>

		

		<div class="type-guide-area">
			<div class="caution-unit">
				<span class="mark"></span>
				<h4>아이디를 분실하셨나요?</h4>
				<p class="small">아이디를 찾기 위한 본인인증을 진행해 주세요.</p>
			</div>
			<div class="button-set" style="margin-bottom: 0px">
				<button type="button" id="findIdAuth" class="button-basic primary btn-certify btn-pos w-100" style="height: 69px; background-color: #e5e5e5; height: 69px">본인인증하기</button>
				
<!-- 				<form action="/member/find/id-success" method="post" class="w-100"> -->
<!-- 					<button type="button" id="findIdAuth" class="button-basic primary btn-certify btn-pos w-100" style="height: 69px; background-color: #e5e5e5; height: 69px">본인인증하기</button> -->
<!-- 				</form> -->
			</div>
		</div>
		
		<div class="type-guide-area" style="padding-top: 55px">
			<div class="caution-unit">
				<h4 style="margin-top: 0px">회원님의 아이디는 <b>${ memberId }</b>입니다.</h4>
				<p class="small" style="margin-top: 20px">${ regDate } 가입</p>
			</div>
			<div class="button-set">
				<a type="button" href="/member/find/password" class="button-basic border btn-certify btn-pos" style="height: 69px">비밀번호찾기</a>
					<!-- <a type="button" href="/member/login.do?redirectUrl=/" class="button-basic primary btn-certify btn-pos" style="height: 69px">로그인</a> -->
				<a type="button" href="/member/login" class="button-basic primary btn-certify btn-pos" style="height: 69px">로그인</a>
			</div>
		</div>
		

		
	</div>
</div>


<script type="text/javascript">
	$("#findIdAuth").on("click", function() {
		
// 		//window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
// 		var url  = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb?m=authMobileMain";
// 		window.open(url, "mypopup", "width=450, height=250, top=150, left=200");
	
	})
			
</script>
