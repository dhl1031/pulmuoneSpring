<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		<form id="findForm" data-gtm-form-interact-id="0">
			<input type="hidden" name="memberId" value="${ memberId }">
			<div>
				<div class="reference-area">
					<p>
						선택한 수단으로<br>
						<b>임시비밀번호</b>를 발급합니다.
					</p>
				</div>
				<div class="type-guide-area" style="padding-top: 56px">
<!-- 					<input type="hidden" name="memberId" value=""> -->
					<h5 style="margin-bottom: 27px">비밀번호 발급수단 선택</h5>
					<div class="sns-selector-group">
						<label class="phone item">
							<div class="ico">
								<i></i>
							</div>
							<input type="radio" name="target" value="${ tel }" data-gtm-form-interact-field-id="0">
							<p>
								<b>휴대폰</b>
								${ maskedTel }
							</p>
						</label>
						<label class="mail item" style="padding: 10px 0">
							<div class="ico">
								<i></i>
							</div>
							<input type="radio" name="target" value="${ email }" data-gtm-form-interact-field-id="1">
							<p>
								<b>이메일</b>
								${ email }
							</p>
						</label>
					</div>
					<div class="button-set" style="margin-top: 28px">
						<button class="button-basic primary w-100" style="height: 69px">임시비밀번호 받기</button>
					</div>
				</div>
			</div>
		</form>

	</div>
</div>

<script type="text/javascript">
	$(document).on("submit","#findForm", function (e) {

		e.preventDefault();
		var o = $(this).serializeObject();
		if (!o.target) {
			alert("수단을 선택해주세요.");
			return false;
		}

		var header = '${_csrf.headerName}';
		var token = '${_csrf.token}';
	    var memberId = '${ memberId }';
	    console.log(memberId);
		$.ajax({
			url:"/ajax/member/find/resetPassword" , 
			data: { memberId : memberId },
			dataType:"json",
			type:"PUT",
			cache:false ,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			success: function ( newPassword, textStatus, jqXHR ){
				console.log(newPassword);
				alert("임시 비밀번호가 발급되었습니다.<br>로그인 페이지로 돌아갑니다.", ()=>{location.href='/member/login'});
			},
			error:function (request,status,error){
				alert("에러~~~ ");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
		 
		});
		
		
		return false;
	});
</script>


<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">임시비밀번호가 등록된 휴대폰번호로 전송되었습니다.</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>
