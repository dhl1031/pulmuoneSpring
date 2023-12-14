<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="checkout-input-area">
	<div class="checkout-input-title-area">
		<h3 class="checkout-input-title">배송정보</h3>
		<button type="button">
			<i class="ico ico-down"></i>
		</button>
	</div>
	
	<div class="checkout-input-box">
		<div class="prd-cart-all-select">
			<div class="checkbox chk-type3">
				<input type="checkbox" name="chk-same" id="chk-same" checked="checked">
				<label for="chk-same">고객정보와 동일</label>
			</div>
			<button id="addressBtn" type="button" class="btn-round2" data-toggle="modal" data-target="#addressModal">주소록</button>
		</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="receiver">받으시는분</label>
			</dt>
			<dd>
				<input type="text" id="receiver" name="box_receiver" placeholder="이름을 입력하세요" value="${ member.name }" maxlength="10">
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="phone">휴대폰번호</label>
			</dt>
			<dd>
				<input type="tel" id="tel" name="box_tel" maxlength="13" placeholder="휴대폰번호를 입력하세요" value="${ member.tel }">
			</dd>
		</dl>
	</div>
								
	<div class="form-input">
		<dl>
			<dt>
				<label for="zipcode">우편번호</label>
			</dt>
			<dd>
				<input id="zipcode" name="box_zip_code" placeholder="주소찾기 버튼을 눌러주세요" style="background: #fff" readonly>
				<button type="button" id="searchPostcode" class="btn-square btn-black">주소찾기</button>
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="addrRoad">주소</label>
			</dt>
			<dd>
				<input type="text" id="addrRoad" name="box_addr" title="주소 입력" value="" style="background: #fff" readonly>
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="addrDetail">상세주소</label>
			</dt>
			<dd>
				<input type="text" id="addrDetail" name="box_addr_detail" placeholder="상세주소 입력" value="" maxlength="100">
			</dd>
		</dl>
	</div>
	
	<div class="form-input">
		<dl>
			<dt>
				<label for="memo">배송메모</label>
			</dt>
			<dd>
				<input id="memo" name="box_memo" title="배송메모를 입력하세요" placeholder="배송메모를 입력하세요" value="">
			</dd>
		</dl>
	</div>
	
		<div class="checkbox chk-type3" style="margin-top: 28px">
			<input type="checkbox" id="saveAddrChk" name="saveAddrChk">
			<label for="saveAddrChk">주소록에 저장</label>
		</div>
	</div>
</div>