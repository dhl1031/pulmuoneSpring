<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<input type="hidden" id="kakaoTitle" value="${dto.products_name }">
		<input type="hidden" id="kakaoContents" value="${dto.products_sub_name }">
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">URL 복사되었습니다</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>		
<div class="modal " id="shareModal" tabindex="-1" aria-labelledby="shareModal" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
	<input type="text" style="opacity: 0" id="share_url_input" value="http://localhost/product/daily/view.do?tag=${dto.products_tag }">
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="shareModalLabel">공유하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body select-wrapper" style="padding:0 30px 30px;">
				<a class="button-basic prefix kakao" style="width:100%;" onclick="shareToKakao('', 'http://localhost/product/daily/view.do?tag=${dto.products_tag }')">
					<i class="ico"></i>
					카카오톡으로 공유
				</a>
				<a class="button-basic prefix link" style="width:100%; margin-top:14px;" data-clipboard-target="#share_url_input">
					<i class="ico"></i>
					URL 복사하기
				</a>
			</div>
		</div>
	</div>
</div>

