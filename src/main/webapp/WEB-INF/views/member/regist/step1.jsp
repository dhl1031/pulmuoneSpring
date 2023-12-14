<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-wrapper member"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

	<div class="container relative">
	    
	    <div class="account-wrapper lg" style="padding-bottom:80px;">
	        <ul class="account-process" style="margin-top: 60px">
	            <li class="active">
	                <h2 class="title" style="height: 76px">
	                    <b style="margin-right: 3px">01.</b>
	                    본인인증
	                </h2>
	                <div class="caution-unit" style="margin: 11px auto 26px">
	                    <span class="mark"></span>
	                    <p style="margin-top: 26px">
	                        가입여부와 실명확인을 위하여<br/>
	                        휴대폰본인인증을 통해 인증해 주세요.
	                    </p>
	                </div>
	
	                <div class="button-set" style="margin: 46px 0 40px"> 
<!-- 		                	<form action="/member/regist/step2.do" method="post"> -->
<!-- 		                    <button type="button" onclick="javascript:fnPopup();" class="button-basic primary btn-certify" style="width: 460px; height: 69px">실명인증하기 -->
	                    <button type="button" id="auth" class="button-basic primary btn-certify" style="width: 460px; height: 69px">실명인증하기</button>
<!-- 		                    </form> -->
	                </div>
	            </li>
	            <li>
	                <h2 class="title" style="height: 80px">
	                    <b style="margin-right: 3px">02.</b>
	                    약관동의 / 회원정보 입력
	                </h2>
	            </li>
	            <li>
	                <h2 class="title">
	                    <b style="margin-right: 3px">03.</b>
	                    추천정보
	                </h2>
	            </li>
	        </ul>
	    </div>
   
	</div>

   
</div>



 	
<script type="text/javascript">
	$("#auth").on("click", function() {
		prompt();
	});
	
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
				<form id="authorizeNICE" action="/member/regist/step2" method="post">
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
					<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
				</form>
			</div>
			<button type="submit" class="modal-footer" form="authorizeNICE">확인</button>
<!-- 			<button type="button" class="modal-footer" data-dismiss="modal" form="authorizeNICE">확인</button> -->
		</div>
	</div>
</div>

