<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div class="modal fade" id="alertModal" tabindex="-1"
			aria-labelledby="alertModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="alertModalLabel"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">로그인 후 찜한상품으로 담을 수 있습니다.</div>
					<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
		<div class="modal fade" id="confirmModal" tabindex="-1"
			aria-labelledby="confirmModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirmModalLabel"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">제품이 담겼습니다. 담은 제품을 확인하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="cancel" data-dismiss="modal">취소</button>
						<button type="button" class="confirm">확인</button>
					</div>
				</div>
			</div>
		</div>

