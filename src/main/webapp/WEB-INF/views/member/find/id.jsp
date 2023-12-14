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
			<div class="button-set">
				<button type="button" id="findIdAuth" class="button-basic primary btn-certify btn-pos w-100" style="height: 69px">본인인증하기</button>
			</div>
		</div>

	</div>
</div>
 	
<script type="text/javascript">
	$("#findIdAuth").on("click", function() {
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
				<form id="authorizeNICE" action="/member/find/id-success" method="post">
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

