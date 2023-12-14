<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
