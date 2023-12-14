<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="contents-area">
	<div class="container">
				<div class="breadcrumb-style">
	            <div class="wrap">
	                <ul>
	                    <li><a href="/">홈</a></li>
	                    <li><a href="/">장바구니</a></li>
	                    <li><a class="active">주문완료</a></li>
	                </ul>
	            </div>
	        </div>
		
		<div class="checkout-complete-area">
			<div class="text-alignC">
				<img src="/resources/assets/images/ui/ico-check-big.png" alt="">
					<strong>주문신청이 완료되었습니다.</strong>
			</div>
			
			<div class="checkout-complete-info">
				<div class="checkout-complete-text check-com-type2">
					<b>주문정보</b>
					<div class="checkout-complete-info-text">

						<div class="prd-area">
							<c:forEach items="${ boxItemInfoList }" var="i">
								<span class="thumb">
									<img src="/${ i.img_path }/${ i.system_name }" alt="">
								</span>
								<b class="prd-title" style="text-align: left">${ i.products_name }</b>
							</c:forEach>
						</div>
							
						<ul class="checkout-num-address">
							<li>
								<div>
									<span>주문번호</span>
										<b>${ boxOrderDTO.box_order_no }</b>
								</div>
								
								<div>
									<span>주문일자</span>
									<b>${ boxOrderDTO.box_order_date }</b>
								</div>
							</li>
								
							<li>
								<span>배송지</span>
									<b>[${ boxShipDTO.box_zip_code }] ${ boxShipDTO.box_addr }, ${ boxShipDTO.box_addr_detail }</b>
							</li>
								
							<li>
								<span>배송메모</span>
								<em>${ boxShipDTO.box_memo }</em>
							</li>
						</ul>
					</div>
					
					<div class="prd-checkout-area creat-checkout2">
						<dl>
							<dt>
								<span>상품 판매가</span>
								<b>
									<div class="now-price total">
										<em>
											<fmt:formatNumber value="${ boxPayDTO.box_price }" type="number"></fmt:formatNumber>
										</em>
										<span>원</span>
									</div>
								</b>
							</dt>
								
							<dd>
								<span>상품 할인 판매가</span>
								<b>
									<div class="now-price sale">
										<c:choose>
											<c:when test="${ boxPayDTO.box_sale_price eq boxPayDTO.box_price }">
												<em class="minus" style="color: black">
													<fmt:formatNumber value="${ boxPayDTO.box_sale_price }" type="number"></fmt:formatNumber>
												</em>
											</c:when>
											<c:otherwise>
												<em>
													<fmt:formatNumber value="${ boxPayDTO.box_sale_price }" type="number"></fmt:formatNumber>
												</em>
											</c:otherwise>
										</c:choose>
										<span>원</span>
									</div>
								</b>
							</dd>
							
							<dd>
								<span>쿠폰 할인 금액</span>
								<b>
									<div class="now-price coupon">
										<c:choose>
											<c:when test="${ boxPayDTO.box_discount_price eq 0 }">
												<em>0</em>
											</c:when>
											<c:otherwise>
												<em class="minus">
													<fmt:formatNumber value="${ boxPayDTO.box_discount_price }" type="number"></fmt:formatNumber>
												</em>
											</c:otherwise>
										</c:choose>
										<span>원</span>
									</div>
								</b>
							</dd>
								
							<dd>
								<span>배송비</span>
								<b>
									<div class="now-price delivery">
										<em>
											<fmt:formatNumber value="${ boxPayDTO.box_shipping_fee }" type="number"></fmt:formatNumber>
										</em>
										<span>원</span>
									</div>
								</b>
							</dd>
								
							<dd style="margin-bottom: 10px;">
								<span>결제수단</span>
								<b style="font-size: 16px; letter-spacing: -1.2px; color: #333; font-weight: 400">
									<c:choose>
										<c:when test="${boxPayDTO.box_pay_method eq 0}">카드결제</c:when>
										<c:when test="${boxPayDTO.box_pay_method eq 1}">실시간 계좌이체</c:when>
										<c:otherwise>가상계좌</c:otherwise>
									</c:choose>
								</b>
							</dd>
								
							<dd class="checkout-sum" style="margin-top: 16px; margin-bottom: 28px">
								<span style="font-weight: 500">최종결제금액</span>
								<b>
									<div class="now-price sum" style="font-size: 24px; font-weight: 500">
										<em>
											<fmt:formatNumber value="${ boxPayDTO.box_final_price }" type="number"></fmt:formatNumber>
										</em>
										<span>원</span>
									</div>
								</b>
							</dd>
						</dl>
						
						<div class="btn-area">
							<button style="margin: 0px 14px; height: 60px" type="button" onclick="location.href='/'" class="btn-default btn-white">메인으로</button>
							<button style="margin: 0px 14px; height: 60px" type="button" onclick="location.href='/mypage/order/box/orderBox'" class="btn-default">주문내역</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>