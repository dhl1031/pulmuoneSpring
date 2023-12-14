<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 	<form id="login" action="/member/login" method="post"> -->
<%-- 		<input type="hidden" name="memberId" value="${ memberId }"> --%>
<%-- 		<input type="hidden" name="pwd" value="${ pwd }"> --%>
<!-- 	</form> -->


<script type="text/javascript">
	$(function() {
		alert("회원가입이 완료되었습니다.", ()=>{location.href='/member/login'});
// 		$("#login").submit();
	});
	
// 	location.href = "/index.jsp";

</script>


<div class="modal" id="loading" tabindex="-1" aria-labelledby="loading" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		</div>
	</div>
</div>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>


<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="cancel" data-dismiss="modal">취소</button>
				<button type="button" class="confirm">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="shareModal" tabindex="-1" aria-labelledby="shareModal" aria-hidden="true">
	<input type="text" style="opacity: 0" id="share_url_input" value="https://greenjuice.pulmuone.com/member/regist/step3"/>
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="shareModalLabel">공유하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body select-wrapper" style="padding:0 30px 30px;">
				<a class="button-basic prefix kakao" style="width:100%;"
				   onclick="shareToKakao('', '')">
					<i class="ico"></i>
					카카오톡으로 공유
				</a>
				<a class="button-basic prefix link" style="width:100%; margin-top:14px;"
				   data-clipboard-target="#share_url_input">
					<i class="ico"></i>
					URL 복사하기
				</a>
			</div>
		</div>
	</div>
</div>

