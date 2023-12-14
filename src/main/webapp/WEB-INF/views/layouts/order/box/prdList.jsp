<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="checkout-prd-list">
	<div class="checkout-title-area">
		<strong class="list-amount">주문상품
			<em class="prd-count" style="padding: 0 16px; margin-left: 2px">${ fn:length(itemInfos) }</em>
		</strong>
		<button type="button" class="btn-down">
			<i class="ico ico-down"><span class="hide">주문서 닫기</span></i>
		</button>
	</div>

	<ul style="padding: 0px 20px;" class="prd-cart-list cart-box-list box-list-type2" id="order_targets">

		<c:forEach items="${ itemInfos }" var="item" varStatus="status">
			<li class="order-item" data-itemcode="${ item.products_no }" data-origin-price="${ item.price }" data-price="${ item.event_price }" style="padding: 20px 0 18px;">
		        <input type="hidden" value="${ item.products_no }" name="boxOrderProductsList[${status.index}].products_no">
				
				<div class="prd-cart-info-area">
					<div class="flex-l">
						<a class="thumb">
							<img src="/${ item.img_path }/${ item.system_name }" alt="${ item.products_name }">
						</a>
						<div class="prd-info-select-amount">
							<a href="/product/box/728?eventIdx=" class="prd-info">
								<em>${ item.products_type }</em>
								<b class="prd-title">${ item.products_name }</b>
								<span class="volume">(${ item.products_size })</span>
							</a>
							<input type="hidden" data-count="0" value="${ item.products_cnt }" name="boxOrderProductsList[${status.index}].products_cnt">
							<div class="prd-select-amount">
								<em>${ item.products_cnt }</em>개
							</div>
						</div>
					</div>

					<div class="prd-cart-btn-price">
						<div></div>
						<c:choose>
							<c:when test="${ item.event_price eq 0 }">
								<div class="price-info">
									<b class="now-price">
										<b data-print-price="${ item.price * item.products_cnt }">
											<fmt:formatNumber value="${ item.price * item.products_cnt }" type="number"></fmt:formatNumber>
										</b>
										<span>원</span>
									</b>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="price-info">
									<em class="before-price">
										<em data-print-price="${ item.price * item.products_cnt }">
											<fmt:formatNumber value="${ item.price * item.products_cnt }" type="number"></fmt:formatNumber>
										</em>
										<span>원</span>
									</em>
									<b class="now-price">
										<b data-print-price="${ item.event_price * item.products_cnt }">
											<fmt:formatNumber value="${ item.event_price * item.products_cnt }" type="number"></fmt:formatNumber>
										</b>
										<span>원</span>
									</b>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>