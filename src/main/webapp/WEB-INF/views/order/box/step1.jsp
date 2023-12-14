<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contents-area">

			<div class="breadcrumb-style">
	            <div class="wrap">
	                <ul>
	                    <li><a href="/">홈</a></li>
	                    <li><a href="/">장바구니</a></li>
	                    <li><a class="active">주문서작성</a></li>
	                </ul>
	            </div>
	        </div>
	        
	<form id="orderForm">
		<input type="hidden" id="${ _csrf.parameterName }" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		<input type="hidden" id="box_price" name="box_price" value="">
		<input type="hidden" id="box_sale_price" name="box_sale_price" value="">
		<input type="hidden" id="box_discount_price" name="box_discount_price" value="">
		<input type="hidden" id="box_shpping_fee" name="box_shpping_fee" value="0">
		<input type="hidden" id="box_final_price" name="box_final_price" value="">
		<input type="hidden" id="box_pay_method" name="box_pay_method" value="0">
		
		<div class="cont-checkout-area">
			<div class="title-tab-area">
				<h2 class="cont-title">주문서 작성</h2>
			</div>

			<div class="prd-cart-area" style="padding-bottom: 50px;">
				<div class="prd-cart-list-area">
					<%@ include file="/WEB-INF/views/layouts/order/box/prdList.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/box/addrInputForm.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/box/couponList.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/box/payInfo.jsp"%>
				</div>

				<%@ include file="/WEB-INF/views/layouts/order/box/orderInfo.jsp"%>
			</div>
		</div>
	</form>
</div>
<script>
	$("#allOrderBtn").on("click", function() {
		goStep2("box");
	});
</script>
<script>
	// 영수증 계산
	let salePrice = calculateBoxReceipt();
	
	// 쿠폰 선택 시
	$("#coupon-selector").on("change", function() {
		couponSelect(salePrice);
	});
				
	// 쿠폰 삭제 시
	$(document).on("click", "button.coupon-remove", function() {
		couponDelete($(this), salePrice);
	});
</script>