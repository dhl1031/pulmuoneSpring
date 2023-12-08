<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">

<%-- 		<%@ include file="/WEB-INF/views/layouts/header.jsp" %> --%>
		<div class="container relative">
			<a class="member-close" href="/"></a>
			<div class="account-wrapper">
				<div class="account-logo-wrapper">
					<a class="account-logo" alt="풀무원녹즙"></a>				
				</div>
			</div>
		</div>
				<br>
				<div class="account-wrapper">
					<div class="textrow-layout">
			            <h2 class="title">
			                사용중인 <b>소셜 아이디</b>로<br/>
			                로그인합니다.
			            </h2>
			            <div class="content">
			                <div class="button-set vertical">
			                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=4631f2522dc407a8035e73aaa5d1bd17&redirect_uri=https://greenjuice.pulmuone.com/sns/kko&response_type=code&scope=account_ci,phone_number,name,birthyear,birthday,gender,account_email&state=%7B%7D" class="button-basic prefix kakao">
			                        <i class="ico"></i>
			                        카카오 아이디로 로그인
			                    </a>
			                    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i7eb3o1oVsnPsxrI4jQ5&redirect_uri=https://greenjuice.pulmuone.com/sns/naver&state=1209129162018274959608217296717663309111&state=%7B%7D" class="button-basic prefix naver">
			                        <i class="ico"></i>
			                        네이버 아이디로 로그인
			                    </a>
			                </div>
			            </div>
			        </div>
		        </div>

				<div class="account-wrapper">
					<div class="textrow-layout">
					    <h2 class="title">
			                <b>일반회원</b>으로<br/>
			                로그인합니다.
			            </h2>
			            <div class="content">
							<form action="/login" method="post">
								<div class="form-input none-dt">
			                        <dl>
			                            <dd>
			                                <input type="text" id="loginId" name="username" placeholder="아이디"/>
			                            </dd>
			                        </dl>
			                    </div>
			                    <div class="form-input none-dt">
			                        <dl>
			                            <dd>
			                                <input type="password" id="loginPwd" name="password" placeholder="비밀번호" autocomplete="off"/>
			                            </dd>
			                        </dl>
			                    </div>
			
								<div style="display: flex; flex-direction: row">
									<label class="check-type">
										<input type="checkbox"name="rememberUser" value="Y" /> <span id="auto-login">자동 로그인</span>
									</label> 
									<label class="check-type" style="margin-left: 25px">
										<input type="checkbox" name="rememberId" id="rememberId" value="Y" /> <span>아이디 저장</span>
									</label>
								</div>
								<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
								<input type="submit" id="loginBtn" class="button-basic border" value="로그인">
								
							</form>
						
							<div class="addiction-button-group">
			                    <a href="/member/regist/type.do">회원가입</a>
			                    <a href="/member/find/id.do">아이디 찾기</a>
			                    <a href="/member/find/password.do">비밀번호 찾기</a>
			                </div>
			        	</div>        
                	</div>
				</div>
<!-- 			</div> -->
<!-- 		</main> -->
		<div class="separate-wrapper">
		    <div class="account-wrapper lg">
		        <h2 class="title">
		            <em>오직 풀무원녹즙 회원만!</em><br>
		            회원가입하고 다양한 혜택을 누리세요
		        </h2>
		        <ul class="icon-list">
		            <li style="margin-right: -14px">
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon01.png">
		                </div>
		                <p>음용할수록 늘어나는 혜택!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon02.png">
		                </div>
		                <p>가입 후 3,6,9개월마다 쿠폰 혜택!</p>
		            </li>
		            <li style="margin-right: -14px">
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon03.png">
		                </div>
		                <p>배송 일정, 상품 변경을 편하게!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon04.png">
		                </div>
		                <p>시음 선물은 무제한으로!</p>
		            </li>
		        </ul>
		    </div>
		</div>

 	</div>
 	
 	
<script type="text/javascript">
	$(document).ready(function () {
		var loginId = localStorage.getItem("memberId");
		var autoLogin = localStorage.getItem("autoLogin");
		if (loginId) {
			$("#loginId").val(loginId);
			$("#rememberId").prop("checked", true);
			$("#loginPwd").focus();
		}
		else {
			$("#loginId").focus();
		}

		if(autoLogin){
				$('input[name=rememberUser]').click();
		}

		$("#loginId, #loginPwd").keyup(function (e) {
			if (e.keyCode == 13) {
				$("#loginBtn").click();
			}
		});

		const params = Object.fromEntries(new URLSearchParams(location.search));
		const redirectUrl = params.redirectUrl
		const token = params.token;

		$("#loginBtn").click(function () {
			$(".input-text").text("");
			$(".idError,.pwdError").removeClass("input-error");

			$("#loginId").val($.trim($("#loginId").val()));
			$("#loginPwd").val($.trim($("#loginPwd").val()));

			if ($("#loginId").val() == "") {
				$(".idError").addClass("input-error");
				$("#loginIdErrorMsg").text('! ' + message.member.regist.id.empty);
				return false;
			}
			if ($("#loginPwd").val() == "") {
				$(".pwdError").addClass("input-error");
				$("#loginErrorMsg").text('! ' + message.member.regist.password.empty);
				$("#loginPwd").focus();
				return false;
			}
			
			
			if ($("#rememberId").prop("checked")) {
				localStorage.setItem("memberId", $("#loginId").val());
			} else {
				localStorage.removeItem("memberId");
			}
			
			
// 			var body = $("#loginForm").serializeObject();
// 			console.log(body)
// 			body.redirectUrl = redirectUrl;
// 			body.token = token;

// 			post({
// 				"url": "/member/login",
// 				"param": body
// 			}, function (response) {
// 				if ($("#rememberId").prop("checked")) {
// 					localStorage.setItem("memberId", $("#loginId").val());
// 				} else {
// 					localStorage.removeItem("memberId");
// 				}

// 				if (!!redirectUrl && redirectUrl !== 'undefined') {
// 					return location.replace(redirectUrl);
// 				}

// 				location.replace(response.RESULT_MSG);

// 			}, function (failResponse) {
// 				if(failResponse?.RESULT_CODE ==='2000'){
// 						alert('해당 임시 비밀 번호는 유효 시간 초과로 사용이 불가합니다. 임시 비밀번호 재발급 후 이용해주시기 바랍니다.',function(){
// 								location.href = '/member/find/password';
// 						},'임시 비밀번호 받기')
// 				}else {
// 				$(".idError,.pwdError").addClass("input-error");
// 				alert(failResponse.RESULT_MSG.error || failResponse.RESULT_MSG);

// 				}
// 			});
		});

		$("#auto-login").click(function (e){
				if(!localStorage.getItem('autoLogin')){
						localStorage.setItem('autoLogin','true');
				}else{
						localStorage.removeItem('autoLogin');
				}
		})

	});
</script>


</body>
</html>
