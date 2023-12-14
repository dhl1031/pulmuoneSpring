<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="contents-area">
	<form id="orderForm">
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		<input type="hidden" name="price" value="">
		<input type="hidden" name="salePrice" value="">
		<input type="hidden" name="discountPrice" value="">
		<input type="hidden" name="shppingPrice" value="0">
		<input type="hidden" name="payPrice" value="">
		<input type="hidden" name="payMethod" value="0">

		<div class="cont-checkout-area">
			<div class="title-tab-area">
				<h2 class="cont-title">주문서 작성</h2>
			</div>

			<div class="prd-cart-area" style="padding-bottom: 50px;">
				<div class="prd-cart-list-area">
					<%@ include file="/WEB-INF/views/layouts/order/daily/prdList.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/addrInputForm.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/shipInfo.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/payInfo.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daterangepicker.jsp"%>
				</div>

				<%@ include file="/WEB-INF/views/layouts/order/daily/orderInfo.jsp"%>
			</div>
		</div>
	</form>
</div>

<script>
	$(function () {
		weekDayText();
	})
</script>
<script>
	$("#order_targets").on("click", ".prod-add", function() {
		plusBtn($(this));
	})

	$("#order_targets").on("click", ".prod-remove", function() {
		minusBtn($(this));
	})
	
	
	$("#allOrderBtn").on("click", function() {
		goStep2("daily");
	});
	
</script>
