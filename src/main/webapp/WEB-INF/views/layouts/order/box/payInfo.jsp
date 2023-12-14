<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="checkout-input-area">
	<div class="checkout-input-title-area">
		<h3 class="checkout-input-title">결제정보</h3>
	</div>
	
	<div class="select-checkout-area">
		<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
			<li class="nav-item" role="presentation">
				<a href="#checkout-type1" class="nav-link active" id="checkout-type-tab1" data-target="#checkout-type1"
					data-value="0" data-toggle="tab" role="tab" aria-controls="checkout-type1" aria-selected="true">
					<span>카드결제</span>
				</a>
			</li>
			
			<li class="nav-item" role="presentation">
				<a href="#checkout-type2" class="nav-link" data-value="1" id="checkout-type-tab2" data-target="#checkout-type2"
					data-toggle="tab" role="tab" aria-controls="checkout-type2" aria-selected="false">
					<span>실시간 계좌이체</span>
				</a>
			</li>
			
			<li class="nav-item" role="presentation">
				<a href="#checkout-type3" class="nav-link" data-value="2" id="checkout-type-tab3" data-target="#checkout-type3"
					data-toggle="tab" role="tab" aria-controls="checkout-type3" aria-selected="false">
					<span>가상계좌</span>
				</a>
			</li>
		</ul>
		
		<div>
			<div id="checkout-type1"></div>
			<div id="checkout-type2"></div>
			<div id="checkout-type3"></div>
		</div>
	</div>
</div>