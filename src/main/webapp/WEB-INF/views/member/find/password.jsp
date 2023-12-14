<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
<style> /* 상단 영역 */

	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
	}

	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
</style>

 -->
		
		<div class="container relative">
			<div class="account-wrapper">
				<ul class="tab-border-style">
					<li class="item">
						<a href="/member/find/id" class="item">
							아이디찾기
						</a>
					</li>
					<li class="item active">					
						<a href="/member/find/password" class="item">
							비밀번호찾기
						</a>
					</li>
				</ul>
			<div>
			
			<div class="reference-area">
				<p>
					비밀번호 찾기를 위해 아이디 입력과<br>
					본인인증을 진행해 주세요.
				</p>
			</div>
			<div class="type-guide-area" style="padding-top: 56px">
				<h5>일반회원</h5>
				<form action="/member/find/password-success" method="post" class="w-100">
					<div class="form-input" style="margin-bottom: -2px">
						<dl>
							<dt><label>아이디</label></dt>
							<dd>
								<input type="text" name="inputMemberId" id="inputMemberId">
							</dd>
						</dl>
						<p id="memberIdError" style="padding-left: 136px"></p>
					</div>
					<div class="button-set" style="margin:20px 0 0">
<!-- 					<button class="button-basic primary w-100" id="findPwdAuth" style="height: 69px">본인인증</button> -->
						<button class="button-basic primary w-100" id="findPwdAuth" style="height: 69px">본인인증</button>
					</div>
				</form>
			</div>
			<div class="type-guide-area" style="padding-top: 56px">
				<h5>SNS 간편회원</h5>
				<div class="sns-selector-group" style="padding-top: 10px">
					<label class="kakao item">
						<div class="ico">
							<i></i>
						</div>
						<input type="radio" name="moveTo" value="/member/find/password-social.do?s=K">
						<p>카카오</p>
					</label>
					<label class="naver item">
						<div class="ico">
							<i></i>
						</div>
						<input type="radio" name="moveTo" value="/member/find/password-social.do?s=N">
						<p>네이버</p>

					</label>
				</div>
				<div class="button-set" style="margin-top: 30px">
					<button type="button" class="button-basic primary w-100" onclick="moveSocial()" style="height: 69px">인증하기</button>
				</div>
			</div>
		</div>
		
				
		
				
			</div>
		</div>
 	</div>
 	
<script type="text/javascript">
	var type = "password";
	$().ready(function() {
		// 아이디찾기 본인인증
// 		$("#findIdAuth").click(function() {
// 			fnIdPopup();
// 		});
		
		$("#memberId").on("keyup", function () {
			hideErrorForm("memberIdError");
		});
		
		// 비밀번호찾기 본인인증
		$("#findPwdAuth").click(function(e) {
			e.preventDefault();
			if ($.trim($("#inputMemberId").val()) == "" ){

				$(".form-input").addClass("error");
				$("#memberIdError").text("아이디를 입력해 주세요.")
				return;
			} else {

				// 기존 회원 확인
			    var memberId = $("#inputMemberId").val();
				$.ajax({
					url:"/ajax/member/regist/duplicateIdCheck" , 
					data: { memberId : memberId },
					dataType:"json",
					type:"GET",
					cache:false ,
					success: function ( isMember,  textStatus, jqXHR ){
						if( isMember ) {
							console.log(isMember);
							$(".form-input.error").removeClass("error");
							$("#memberId").val( $("#inputMemberId").val() );
							prompt();
						} else {  
							console.log("해당 아이디 없음");
							$(".form-input").addClass("error");
							$("#memberIdError").text("입력하신 정보를 확인 후 다시 입력해 주세요.")
						}
					},
					error:function (){
						alert("에러~~~ ");
					}
				 
				});
			}

		});

		
		var type = "password";
		if ( type == "id" ) {
			tabOpen(0);
		}
		else {
			tabOpen(1);
		}
	});
	function fnIdPopup(){
		niceWindowOpen('popupChk', "AgAFQlExMDNkZumZ4NH07/U6IktEs5OR/0KKRxI+Vfa/XAtirFx3HRVSB7k1FPc6Qd+huZEsefMYlVNXQEgq88UgDW4AvVRyK5os59N7JoRmnWh+zqWHBbd+JVCRmToNOdoBqDmPJ0ykiVAQuBn5WNx0uwafw9zmRV0C2LdjPb4dSLcnho13gNYGpmIwA1HP6CFDPBTgsixFwj35nI3qK4joNRCf7srpa9krKXtV59t3p3+MVTRKStOO/kRs/lHTsHpnqNbyoWwlJJf9w10PoOSr1lI8pSKLqxZUsPqabG0mU8cINPYAhbJTF8gXT4w8mKtnI2B6yz9xWOXsMTDq8rk5jfqkLsPjs+a+tLxv6wPtIK3w4w7MXDUSe6NbDB75b8V5zMfUSp2myVs4VIXPtuMHNsibB2CB/RlKfcTCZbpsE5yXtmqchKO1ESrdxC5PeMM0RMXcjIbf96622KpA9WYcC1G7incoSE4j+QSpy7gwf9tEuefQFDpH7Hs5PCTbnZpHjtMpGc4rF1iU84d3hPWjSLH4+A8S");
	}
	function fnPwdPopup(){
		niceWindowOpen('popupChk', "AgAFQlExMDNhm93lpahONuyat71Ef7AvrhvnjCEH8QcNiKs971NM2RVSB7k1FPc6Qd+huZEsefMYlVNXQEgq88UgDW4AvVRygNOr0KiVtyXZbzvbVkfBGS47Pm2bzGxLEJVO4YLV6b84F34oPHeDZDsBSZXqwyt4F+Cyxw7eJliYPNbSwPsrL2pYpdn8UvpjGH0FyQuabSn1PlwnMSqamVZMFgkzOcP89zT4CUe3vL5hOh4yySxYZpK3AD6Ezcbf0TyWIy+5dwkqNMh5H2BSmKcYZWOQeMEQ0+oDcBDVKvePC20DFQ6AaqzQjwWLARBGwuaFR+f2G80Zu+KfNzFGc8Pw4VKoKTf2sBO278/tK3eP93ty5MRsjEX8Zs5poN3MM1iDhdLgz/ewvb4U4JEspU5tcN8mxsyB7sscoihHZVyDNYGZiRSXAJVCveGkye1a5K9n5qiL4N/OojCznYBuLMnmz6TfD39ohSeyIfG/qIPQjnohqzM0gwsIQpST75jPPdYT3ko4MecuhbAZwHw81T4bUaWje/Lc");
	}
	function moveSocial() {
		var el = $("[name='moveTo']:checked");
		if (!el.length) {
			alert("SNS를 선택해주세요.")
		}
		else {
			location.href = el.val();
		}
	}
</script>
 	
<script type="text/javascript">


	window.prompt = function (message, callback, okBtnText) {
		$("#customModalLabel").html("");
//  	$("#customModal .modal-body").html(message);
	    $("#customModal").modal('show');
	    if (okBtnText) {
	    	$("#customModal").find('.modal-footer').text(okBtnText);
	    }
	    if (callback && typeof callback == 'function') {
	    	$("#customModal .modal-footer").on("click", function () {
	    		$("#customModal").find('.modal-footer').text('확인');
	    		callback();
	    		$("#customModal .modal-footer").off("click")
			});
	    }
	    $("#customModal").on("hide.bs.modal", function () {
		    $('#customModal .modal-footer').removeClass('disabled')
		    $('#customModal .modal-footer').prop('disabled',false);
		    $("#customModal .modal-footer").off("click")
		    $("#customModal").find('.modal-footer').text('확인');
		    clearTimeout(timer)
	    });
  	}
</script>

<div class="modal fade" id="customModal" tabindex="-1" aria-labelledby="promptModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="promptModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="authorizeNICE" action="/member/find/password-success" method="post">
					<div class="form-input">
						<dl>
							<dt>
								<label>이름</label>
							</dt>
							<dd>
								<input type="text" placeholder="이름" id="name" name="name" autocomplete="off">
							</dd>
						</dl>
						<p id="nameError"></p>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label>주민번호 앞 6자리</label>
							</dt>
							<dd>
								<input type="text" placeholder="주민번호 앞 6자리" id="rrnBirthDate" name="rrnBirthDate" autocomplete="off" pattern="\d{6}" maxlength="6">
							</dd>
						</dl>
						<p id="rrnBirthDateError"></p>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label>주민번호 뒤 1자리</label>
							</dt>
							<dd>
								<input type="text" placeholder="주민번호 뒤 1자리" id="rrnGenderCode" name="rrnGenderCode" autocomplete="off" pattern="\d{1}" maxlength="1">
							</dd>
						</dl>
						<p id="rrnBirthDateError"></p>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label>휴대폰 번호</label>
							</dt>
							<dd>
								<input type="tel" placeholder="휴대폰 번호" id="tel" name="tel" autocomplete="off" pattern="^010\d{8}$" maxlength="11">
							</dd>
						</dl>
						<p id="telError"></p>
					</div>
					<input type="hidden" name="memberId" id="memberId">
					<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
				</form>
			</div>
			<button type="submit" class="modal-footer" form="authorizeNICE">확인</button>
<!-- 			<button type="button" class="modal-footer" data-dismiss="modal" form="authorizeNICE">확인</button> -->
		</div>
	</div>
</div>

