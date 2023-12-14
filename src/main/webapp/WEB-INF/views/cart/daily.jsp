<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="Cart">
	<div class="modal" id="orderModal" tabindex="-1" aria-labelledby="orderModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 8px;">
					<h5 class="modal-title" id="orderModalLabel">선택하세요</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body select-wrapper">
					<ul class="product-content-list order">

					</ul>
				</div>
				<div class="button-set">
					<button type="button" class="button-basic black" data-type="continue">기존 주문에 상품 추가</button>
					<button type="button" class="button-basic primary" data-type="new">신규 배송지로 주문</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

	var type = "daily";
	var gap = type == 'daily' ? 4 : 1;

	function calculateTotalPrice() {
		var originTotal = 0;
		var totalPrice = 0;
		var totalCount = 0;
		var deliveryPrice = 0;
		$(".order-item-list>*:has([name='cartIdx']:checked)").each(function () {
			var count = 0;
			$(this).find("[data-count]").each(function () {
				count += parseInt($(this).val(), 10);
			});
			totalCount += count;
			originTotal += parseInt($(this).attr("data-origin-price") || $(this).attr("data-price"), 10) * count;
			totalPrice += parseInt($(this).attr("data-price"), 10) * count;
			deliveryPrice += parseInt($(this).attr("data-delivery-price") || "0", 10);
		});

		$("[data-price-view='origin']").text((originTotal * gap).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("[data-price-view='product']").text((totalPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		// $("[data-price-view='sale']").text((0 - (originTotal - totalPrice)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("[data-price-view='sale']").text(((originTotal - (originTotal - totalPrice)) * gap).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

		// if ((originTotal - totalPrice) > 0) {
		// 	$("[data-price-view='sale']").addClass("minus");
		// } else {
		// 	$("[data-price-view='sale']").removeClass("minus");
		// }
		if ((originTotal - (originTotal - totalPrice)) != originTotal) {
			$("[data-price-view='sale']").addClass("minus");
		} else {
			$("[data-price-view='sale']").removeClass("minus");
		}

		$("[data-price-view='delivery']").text((deliveryPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

		$("[data-price-view='total']").text((totalPrice * gap + deliveryPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("[data-price-view='payment']").text((totalPrice * gap + deliveryPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

		$("[data-count-view='ea']").text(totalCount);
		$("[data-count-view='item']").text($(".order-item-list>*:has([name='cartIdx']:checked)").length);

		if (!$(".order-item-list>*").length) {
			$("[data-empty-action='Y']").show();
			$("[data-empty-action='N']").hide();
		} else {
			$("[data-empty-action='Y']").hide();
			$("[data-empty-action='N']").show();
		}

		$("#" + type + "_tab_count").text($(".order-item-list>*").length);
	}
    function togglePromotion(el){
      const parent = el.parents(".order-item");

      const eidx= parent.data('event-idx');
      console.log(eidx)
      if(eidx=='2458'){
        const qty = parseInt(parent.find('[data-itemcount-view]').text())
        console.log(qty)

        const showFreeB = qty>1;

        parent.find('.prd-cart-info-sub').toggle(showFreeB);
        parent.find('.prd-cart-info-sub > span').text('수량 '+ parseInt(qty/2-qty%2/2)+'개')
      }
    }
	function changeCount(el, s) {
		var min = type === 'daily' ? 0 : 1;
		var container = $(el).parents(".order-item");
		var idx = container.attr("data-id");
		var max = parseInt(container.attr("data-limit-size"), 10);
		var size = [];
		container.find("[data-count]").each(function () {
			size.push(parseInt($(this).val(), 10));
		});

		var ix = parseInt($(el).attr("data-index") || "0", 10);
		if (max >= 0 && size[ix] + s > max && Math.max(size[ix] + s, min) != size[ix]) {
			alert("해당 상품은 한정수량 판매입니다.");
			return;
		}

		size[ix] = Math.max(size[ix] + s, min);

		$("[data-print-price]", container).each(function () {
			var $t = $(this);
			$t.text(numberFormat(parseInt($t.attr("data-print-price"), 10) * size[0]));
		});

		if (container.is("[data-delivery-per]")) {
			var per = parseInt(container.attr("data-delivery-per"), 10);
			var price = parseInt(container.attr("data-delivery-one-price"), 10);
			if (price > 0) {
				var dp = Math.max(Math.ceil(size[0] / per), 1) * price;
				container.attr("data-delivery-price", dp);
			}
		}

		var data = { idx };
		if (size.length == 1) {
			data.qty = size[0];
		} else {
			for (let i = 0; i < size.length; i++) {
				data['day' + (i + 1)] = size[i];
			}
		}
	
			var	args = container.attr("data-itemcode");
		
		newPut({
			url: '/cart/'+type+'/'+ args,
			data
		}, (r) => {
			var textview = $("[data-itemcount-view='" + ix + "']", container);
			textview.text(size[ix]);
			if (size[ix] <= 0) {
				textview.parents("li").removeClass("active");
			} else {
				textview.parents("li").addClass("active");
			}
			$("[data-count='" + ix + "']", container).val(size[ix]);
            togglePromotion($(el))
			calculateTotalPrice();
		});
	}


	$(document).on("click", "[name='cartIdx']", function () {
		var checkCount = $("[name='cartIdx']").length;
		var checkedCount = $("[name='cartIdx']:checked").length;
		$("#cartIdxAll").prop("checked", checkCount == checkedCount);
		calculateTotalPrice();
	});

	$(document).ready(function () {
		$("#cartIdxAll").on("click", function () {
			$("[name='cartIdx']").prop("checked", $(this).prop("checked"));
			calculateTotalPrice();
		});

		$(".btn-prd-delete").click(function () {
			var parent = $(this).parents(".order-item");
			var cartIdx = $(this).attr("data-cart-idx");
			var eventIdx = $(this).attr("data-event-idx");
			var itemCode = $(this).attr("data-itemcode");
			confirmDesign("", "삭제하시겠습니까?", function () {			
				axios.get('/cart/daily/delete?products_no='+ itemCode).then(function ({data}) {      
			        alert("삭제되었습니다.");
			        parent.remove();
					calculateTotalPrice();
			    }).catch(function (e) {
			      alert("서버와 연결이 올바르지 않습니다.");
			    });
			});
		});


		$(".deleteAll").click(function () {
			var param = [];
			$("[name='cartIdx']:checked").each(function () {
				var itemCode = $(this).attr("data-itemcode");				
				param.push(itemCode)
			});
			if (!param) {
				alert("선택된 상품이 없습니다.");
				return;
			}

			confirmDesign("", "삭제하시겠습니까?", function () {
				axios.get('/cart/daily/delete?products_no='+ encodeURIComponent(param.join(","))).then(function ({data}) {      
			        alert("삭제되었습니다.");
			        $(".order-item-list>*:has([name='cartIdx']:checked)").remove();
					calculateTotalPrice();
			    }).catch(function (e) {
			      alert("서버와 연결이 올바르지 않습니다.");
			    });				
			});
		});

		$(".prod-add").click(function () {
			changeCount(this, 1);

		});

		$(".prod-remove").click(function () {
			changeCount(this, -1);

		});

		$("#allOrderBtn").click(function () {
			const order = { item: [] };
			$(".order-item-list>*:has([name='cartIdx']:checked)").each(function (i, el) {
				const itemCode = $(el).attr("data-itemcode");
				const item = {
					itemCode: itemCode,
					dayQty: [],
					eventIdx: $(el).attr("data-event-idx")
				};
				if (type == 'daily') {
					$("[data-count]", el).each(function () {
						item.dayQty.push(parseInt($(this).val(), 10));
					});
				}
				else {
					item.qty = String($("[data-count]", el).val());
				}
				order.item.push(item);
			});

			if (order.item.length <= 0) {
				alert("선택된 상품이 없습니다.");
				return;
			}

			if (type != "daily") {
				if (!window.is_signed) {
					alertWithRedirect("로그인 후 이용가능합니다.", "/member/login?redirectUrl=" + location.href)
					return;
				}

				location.href = "/order/box/step1?item=" + encodeURIComponent(JSON.stringify(order));

				return;
			}
			else {
				window.orderProcess(order);
			}

		});
	});
	$(window).on("load", function () {
		calculateTotalPrice();
	})
</script>
	<div class="contents-area">
		<div class="container">
			<div class="location">
				<a href="/">홈</a> <a href="/">장바구니</a>
			</div>
			<div class="cont-cart-area">
				<div class="title-tab-area">
					<h2 class="cont-title" style="font-weight: 400">장바구니</h2>
					<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
						<li class="nav-item" role="presentation"><a href="/cart/daily" class="nav-link active" style="padding-right: 4px; margin-bottom: 0px; height: 47px"> 매일배송 </a></li>
						<li class="nav-item" role="presentation"><a href="/cart/box" class="nav-link " style="margin-bottom: 0px; height: 47px"> 택배배송 </a></li>
					</ul>
				</div>

				<div id="profile" role="tabpanel" aria-labelledby="profile-t">
					<div class="prd-cart-area">
						<div class="prd-cart-list-area" style="padding-top: 15px;">
							<span>매일 아침 신선하게 배송됩니다.</span>
							<div data-empty-action="Y" style="display: none">
								<div class="empty-area" style="padding: 160px 0">
									<img src="/resources/assets/images/ui/ico-alert.png" alt="empty"> <b>장바구니가 비어있습니다.</b>
								</div>
							</div>

							<div data-empty-action="N">
								<div class="prd-cart-all-select">
									<div class="checkbox chk-type3">
										<input type="checkbox" id="cartIdxAll" checked="checked"> <label for="cartIdxAll" style="font-weight: 300;">전체선택</label>
									</div>
									<button type="button" class="btn-round2 deleteAll">선택 삭제</button>
								</div>
								<c:forEach items="${list}" var="list">
									<ul class="prd-cart-list  order-item-list">
										<li data-id="${list.cart_no}" data-itemcode="${list.products_no}" class="order-item order-chk" data-price="${list.price}">
											<div class="checkbox chk-type3">
												<input type="checkbox" id="chk-prd-${list.cart_no}" name="cartIdx" value="${list.cart_no}" checked="checked" data-itemcode="${list.products_no}"> <label for="chk-prd-${list.cart_no}"><span class="hide">해당제품선택</span></label>
											</div> <a href="/product/daily/${list.products_tag}" class="prd-cart">
												<div class="thumb">
													<img src="/file/download/product/${list.system_name }" alt="">
												</div>
												<div class="prd-info">
													<b class="prd-title">${list.products_name }</b> <b class="now-price"><fmt:formatNumber value="${list.price }" pattern="#,###" /><span> 원</span> </b>
												</div>
										</a>
											<div class="prd-cart-select-daily">
												<ul data-cart-idx="${list.cart_no}" data-itemcode="${list.products_no}">
													<li><input type="hidden" data-count="0" value="${list.mon_cnt}"> <span>월</span>
														<div class="prd-select-daily">
															<button type="button" class="prod-add ea-control" data-index="0">
																+<span class="hide">제품 추가</span>
															</button>
															<em data-itemcount-view="0">${list.mon_cnt}</em>
															<button type="button" class="prod-remove ea-control btn-minus" data-index="0">
																<span class="hide">제품 빼기</span>
															</button>
														</div></li>
													<li><input type="hidden" data-count="1" value="${list.tue_cnt}"> <span>화</span>
														<div class="prd-select-daily">
															<button type="button" class="prod-add ea-control" data-index="1">
																+<span class="hide">제품 추가</span>
															</button>
															<em data-itemcount-view="1">${list.tue_cnt}</em>
															<button type="button" class="prod-remove ea-control btn-minus" data-index="1">
																<span class="hide">제품 빼기</span>
															</button>
														</div></li>
													<li><input type="hidden" data-count="2" value="${list.wed_cnt}"> <span>수</span>
														<div class="prd-select-daily">
															<button type="button" class="prod-add ea-control" data-index="2">
																+<span class="hide">제품 추가</span>
															</button>
															<em data-itemcount-view="2">${list.wed_cnt}</em>
															<button type="button" class="prod-remove ea-control btn-minus" data-index="2">
																<span class="hide">제품 빼기</span>
															</button>
														</div></li>
													<li><input type="hidden" data-count="3" value="${list.thu_cnt}"> <span>목</span>
														<div class="prd-select-daily">
															<button type="button" class="prod-add ea-control" data-index="3">
																+<span class="hide">제품 추가</span>
															</button>
															<em data-itemcount-view="3">${list.thu_cnt}</em>
															<button type="button" class="prod-remove ea-control btn-minus" data-index="3">
																<span class="hide">제품 빼기</span>
															</button>
														</div></li>
													<li><input type="hidden" data-count="4" value="${list.fir_cnt}"> <span>금</span>
														<div class="prd-select-daily">
															<button type="button" class="prod-add ea-control" data-index="4">
																+<span class="hide">제품 추가</span>
															</button>
															<em data-itemcount-view="4">${list.fir_cnt}</em>
															<button type="button" class="prod-remove ea-control btn-minus" data-index="4">
																<span class="hide">제품 빼기</span>
															</button>
														</div></li>
												</ul>
											</div> <c:choose>
												<c:when test="${list.wish_status eq 1 }">
													<button type="button" class="btn-wishList active" data-wish-type="daily" data-wish-id="${list.products_tag}">
														<i class="ico ico-wishlist"></i> <span class="hide">제품 찜하기</span>
													</button>
													<button type="button" class="btn-delete btn-prd-delete" data-cart-idx="${list.cart_no}" data-itemcode="${list.products_no}">
														<i class="ico ico-prd-delete"></i> <span class="hide">카트에서 삭제</span>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn-wishList " data-wish-type="daily" data-wish-id="${list.products_tag}">
														<i class="ico ico-wishlist"></i> <span class="hide">제품 찜하기</span>
													</button>
													<button type="button" class="btn-delete btn-prd-delete" data-cart-idx="${list.cart_no}" data-itemcode="${list.products_no}">
														<i class="ico ico-prd-delete"></i> <span class="hide">카트에서 삭제</span>
													</button>
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
								</c:forEach>
							</div>
							<div class="cart-notice-area">
								<b>주문 시 유의사항</b>
								<ul class="list dot-list">
									<li>담은 제품은 최대 50개까지 30일간 보관됩니다.</li>
									<li>주문 시 일별 음용 수량을 수정할 수 있으며, 예상 청구 금액 확인이 가능합니다.</li>
								</ul>
							</div>
							<!--S:띠배너 슬라이드-->
							<div class="banner-area this-prd" style="margin-bottom: 0px">
								<div class="banner-list">
									<a class="item" href="/event/event/view/2" title="장바구니_친구초대" style="background-color: #"> <img src="/file/download/banner/5944914d-b8f7-4d8d-90fc-e1cea9cb2d93.png" alt="">
									</a>
								</div>
							</div>
							<!--E:띠배너 슬라이드-->
						</div>
						<div class="prd-checkout-area">
							<dl>
								<dt class="list-head">
									<em class="count">선택한 상품 <span data-count-view="item">0</span>개
									</em>
								</dt>
								<dd>
									<span>상품 판매가 (4주)</span> <b>
										<div class="now-price">
											<b data-price-view="origin">0</b> <span>원</span>
										</div>
									</b>
								</dd>
								<dd>
									<span>상품 할인 판매가</span> <b>
										<div class="now-price">
											<b data-price-view="sale" class="">0</b> <span>원</span>
										</div>
									</b>
								</dd>
								<dd class="checkout-sum">
									<span>4주예상 주문금액</span> <b>
										<div class="now-price">
											<b data-price-view="total">0</b> <span>원</span>
										</div>
									</b>
								</dd>
							</dl>
							<form action="/daily/order/step1" method="GET">
								<c:forEach var="list" items="${list }">
									<input type="hidden" name="item" value='{"item":[{"itemCode":"${list.products_no}","dayQty":[1,1,1,1,1]}]'>
								</c:forEach>
								<button type="button" id="allOrderBtn" class="btn-default">주문신청</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
</html>