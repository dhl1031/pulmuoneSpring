<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="contents-area">
	<div class="container">
		<div class="location">
			<a href="/">홈</a>
			<a href="/">장바구니</a>
			<a href="/">주문완료</a>
		</div>
		
		<div class="checkout-complete-area">
			<div class="text-alignC">
				<img src="/resources/images/ui/ico-check-big.png" alt="">
				<strong>주문신청이 완료되었습니다.</strong>
			</div>
			
			<div class="checkout-complete-info">
				<div class="checkout-complete-text">
					<b style="margin-bottom: 24px">주문정보</b>
					<ul style="margin-bottom: 35px">
						<li>
							<span>배송가맹점</span>
							<b>관악홈가맹점</b>
						</li>
						
						<li>
							<span>가맹점 연락처</span>
							<ol class="contact-num-area">
								<li>
									<i>
										<img src="/resources/assets/images/ui/ico_franchisee_tel.png" alt="전화">
									</i>
									<em data-call-text="">02-852-7949</em>
								</li>
								<li>
									<i>
										<img src="/resources/assets/images/ui/ico_franchisee_phone.png" alt="휴대전화">
									</i>
									<em data-call-text="">010-6360-7949</em>
								</li>
							</ol>
						</li>
						
						<li>
							<span>첫 배송 예정일</span>
							<b>2023.12.13</b>
						</li>
						
						<li>
							<span>배송메모</span>
							<b></b>
						</li>
					</ul>
					
					<div class="btn-area">
						<a style="margin: 0px 14px; height: 60px" href="/" type="button" class="btn-default btn-white">메인으로</a>
						<a style="margin: 0px 14px; height: 60px" href="/mypage/drink/drink" type="button" class="btn-default">매일배송 주문내역</a>
					</div>
				</div>
				
				<ul class="prd-area">
						<li>
							<span class="thumb">
								<img src="/file/download//product/20221108/2476a7ea-a06c-4af4-a117-1666a39fe56f.jpg" alt="">
							</span>
							<div class="prd-info">
								<b class="prd-title" style="text-align: start">식물성유산균 위&amp;캡슐
									<small class="volume" style="font-size: 12px">(130ml)</small>
								</b>
								<ul class="checkout-daily-info">
									<li>
										월 <span>1</span>
									</li>
								</ul>
							</div>
						</li>
				</ul>
				
			</div>
			<span class="shipping-Info-text">※ 영업일 기준 3일 이내에 배송가맹점에서 안내드린 후 배송이 시작되며, 일부 가맹점 사정에 따라 상이할 수 있습니다.</span>
		</div>
	</div>
</div>


<div class="modal fade" id="friendModal" tabindex="-1" aria-labelledby="pauseModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="width: 430px">
			<div class="modal-header" style="border:0; padding: 27px 30px 28px;">
				<h5 class="modal-title" id="pauseModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					<img src="/resources/images/common/btn_close.png">
				</button>
			</div>
			<div class="coupon-img" style="margin-top: 2px;">
				<label>매일배송상품</label>
				<h4>5,000원 할인 쿠폰</h4>
				<span>2022.06.07 ~ 2022.07.31</span>
				<span>택배배송 상품 10,000원 이상 구매 시</span>
			</div>
			<div class="coupon-desc">
                <span style="line-height: 1.5;">
					친구초대 이벤트 혜택으로 첫 배송 완료 시<br>
                   5,000원 쿠폰이 친구분과 고객님께<br>
                    발행 될 예정입니다.
				</span>
			</div>
			<div class="button-set">
				<button class="button-basic primary">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="tasteModal" tabindex="-1" aria-labelledby="pauseModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="width: 430px">
			<div class="modal-header" style="border:0; padding: 27px 30px 28px;">
				<h5 class="modal-title" id="pauseModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					<img src="/resources/images/common/btn_close.png">
				</button>
			</div>
			<div class="coupon-img" style="margin-top: 2px;">
				<label>매일배송상품</label>
				<h4>5,000원 할인 쿠폰</h4>
				<span>2022.06.07 ~ 2022.07.31</span>
				<span>택배배송 상품 10,000원 이상 구매 시</span>
			</div>
			<div class="coupon-desc">
                <span style="line-height: 1.5;">
					시음선물 고객 한정 쿠폰이 첫 배송 완료 시 <br>발행 될 예정입니다.
				</span>
			</div>
			<div class="button-set b0">
				<button class="button-basic primary">확인</button>
			</div>
		</div>
	</div>
</div>
