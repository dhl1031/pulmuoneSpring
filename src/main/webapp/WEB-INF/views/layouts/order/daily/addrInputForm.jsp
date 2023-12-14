<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="checkout-input-area">
	<div class="checkout-input-title-area">
		<h3 class="checkout-input-title">배송정보</h3>
		<button type="button">
			<i class="ico ico-down"></i> <span class="hide">현재화면 닫기</span>
		</button>
	</div>
									
	<div class="checkout-input-box">
		<div class="prd-cart-all-select">
			<div class="checkbox chk-type3">
				<input type="checkbox" name="chk-same" id="chk-same" checked>
				<label for="chk-same">고객정보와 동일</label>
			</div>
			<button id="addressBtn" type="button" class="btn-round2">주소록</button>
		</div>

		<div class="form-input">
			<dl>
				<dt>
					<label for="receiver">받으시는분</label>
				</dt>
				<dd>
					<input type="text" data-receiver="" id="receiver" name="receiver" title="이름을 입력하세요" placeholder="이름을 입력하세요"
								data-init="" data-require="" data-name="받는사람" maxlength="10" value="${ member.name }">
				</dd>
			</dl>
		</div>
		
		<div class="form-input">
			<dl>
				<dt>
					<label for="phone">휴대폰번호</label>
				</dt>
				<dd>
					<input type="tel" id="tel" name="tel" maxlength="13" title="휴대폰번호를 입력하세요" placeholder="휴대폰번호를 입력하세요"
								value="${ member.tel }" data-init="" data-require="" data-name="휴대폰번호">
				</dd>
			</dl>
		</div>
		
		<div class="form-input">
			<dl>
				<dt>
					<label for="zipcode">우편번호</label>
				</dt>
				<dd>
					<input id="zipcode" readonly name="zipCode" title="주소찾기 버튼을 눌러주세요" placeholder="주소찾기 버튼을 눌러주세요"
								value="" data-init="" data-require="" style="background: #fff" data-name="우편번호">
					<input type="hidden" name="orderStreetAddress" id="orderStreetAddress" value="">
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
					<input type="text" id="addrRoad" name="addrRoad" title="주소 입력" placeholder="" readonly value=""
								data-init="" data-require="" style="background: #fff" data-name="주소">
				</dd>
			</dl>
		</div>
		
		<div class="form-input">
			<dl>
				<dt>
					<label for="addrDetail">상세주소</label>
				</dt>
				<dd>
				<input type="text" id="addrDetail" name="addrDetail" title="상세주소 입력" placeholder="상세주소 입력" value=""
							data-init="" data-require="" data-name="상세주소" maxlength="100">
				</dd>
			</dl>
		</div>
		
		<div class="form-input">
			<dl>
				<dt>
					<label for="memo">배송메모</label>
				</dt>
				<dd>
					<input id="memo" name="orderMemo" title="배송메모를 입력하세요" placeholder="배송메모를 입력하세요" value="" data-init="">
				</dd>
			</dl>
		</div>

		<div class="form-input">
			<dl>
				<dt>
					<span>배달장소</span>
				</dt>
				<dd>
					<div class="radio-area radio-type2">
						<div class="radio">
							<input type="radio" value="0" id="deliveryPlaceH" name="deliveryPlace">
							<label for="deliveryPlaceH">가정</label>
						</div>
						<div class="radio">
							<input type="radio" value="1" id="deliveryPlaceO" name="deliveryPlace">
							<label for="deliveryPlaceO">회사/사무실</label>
						</div>
					</div>
				</dd>
			</dl>
		</div>

		<div class="checkbox chk-type3" style="margin-top: 28px">
			<input type="checkbox" id="saveAddrChk" name="saveAddrChk" value="Y">
			<label for="saveAddrChk">주소록에 저장</label>
		</div>
	</div>
</div>