<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<script type="text/javascript">
		var category_no = "${param.category}";
		$(document).on(
				"click",
				".tag-btn",
				function() {
					var idxs = [];
					$(".tag-btn.active").each(function(i, el) {
						idxs.push($(el).attr("data-idx"));
					});
					var nowIdx = $(this).attr("data-idx");

					if (idxs.includes(nowIdx)) {
						idxs.splice(idxs.indexOf(nowIdx), 1);
					} else {
						idxs.push(nowIdx);
					}
					location.replace(location.pathname + "?category="
							+ category_no + "&tags="
							+ encodeURIComponent(idxs.join(",")));
// 						location.replace(location.pathname + "?category=" + category_no + "&tags=" + idxs.join(","));
				});
		$(document).ready(function() {
			$(".visual-area").fddCarousel({
				auto : 5000
			});
			$("#head-items").owlCarousel({
				items : 4,
				nav : true,
			});
		});
		$(document).ready(function() {
			var pbtn = "${param.tags}";
			var ppbtn = pbtn.split(",");
			for (var i = 0; i < 8; i++) {
				for (var j = 0; j < 8; j++) {
					if (ppbtn[j] == $(".tag-btn").eq(i).attr("data-idx")) {
						$(".tag-btn").eq(i).addClass('active');
					}
				}
			}
			$(".ico-prd-wish").click(function() {
				$("body").addClass('modal-open');
				$("#alertModal").addClass('show');
			});
			$(".ico-prd-cart").click(function() {
				$("body").addClass('modal-open');
				$("#confirmModal").addClass('show');
			});
		});
	</script>
			<div id="container-wrapper" class="container-wrapper">
				<!--S: 메인 비주얼-->
				<div class="visual-area">
					<div class="controller">
						<button class="arrow left" data-carousel="prev">
							<span></span> <span></span>
						</button>
						<div class="number">
							<p data-carousel="current">1</p>
							<span></span>
							<p data-carousel="max">5</p>
						</div>
						<button class="arrow right" data-carousel="next">
							<span></span> <span></span>
						</button>
					</div>
					<div class="vis-list" data-carousel="items">
						<a class="item" href="/product/daily/view.do?tag=732"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/84c3f8d0-5ae5-462b-9fea-cac7bc1d34fd.png"
							alt="">
						</a> <a class="item"
							href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/35b19bec-324b-41d6-812d-cdf8f00eb6cb.png"
							alt="">
						</a> <a class="item"
							href="/product/daily/dailylist.do?category=&amp;tags=478"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/67c0a15e-a321-4513-8015-a973651fb8e8.png"
							alt="">
						</a> <a class="item" target="_blank"
							href="/product/daily/view.do?tag=315" title="제품 상세페이지로 가기"
							style="background-color: #111111"> <img
							src="/file/download/banner/6c036b45-96cf-4189-812a-82f2b36f7bcb.png"
							alt="">
						</a> <a class="item" href="/product/daily/view.do?tag=430"
							title="제품 상세페이지로 가기" style="background-color: #f7f0d6"> <img
							src="/file/download/banner/2b301cd0-0431-47b6-ab77-9c180e55ef96.png"
							alt="">
						</a>
					</div>
				</div>
				<div class="breadcrumb-style"
					style="padding-top: 32px; margin-bottom: 0px; background: #fff">
					<div class="container">
						<ul>
							<li><a>홈</a></li>
							<li><a href="/product/daily/dailylist.do" class="active">
									매일배송 </a></li>
						</ul>
					</div>
				</div>
				<div class="section best-section">
					<div class="container">
						<h2 class="part-title">BEST &amp; NEW</h2>
						<div class="prd-list">
							<div id="head-items" class="owl-carousel owl-loaded owl-drag">
								<div class="owl-stage-outer">
									<div class="owl-stage"
										style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 6170px;">
										<c:forEach items="${bestlist }" var="dto" varStatus="status">
											<div class="owl-item active" style="width: 308.5px;">
												<div class="prd-area">
													<a
														href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
														title="제품 상세페이지로 가기">
														<div class="badges">
															<c:choose>
																<c:when
																	test="${dto.event_tag eq 'BEST' and dto.event_tag2 eq null }">
																	<span class="badge">${dto.event_tag }</span>
																</c:when>
																<c:when
																	test="${dto.event_tag eq 'NEW' and dto.event_tag2 eq null }">
																	<span class="badge badge-new">${dto.event_tag }</span>
																</c:when>
																<c:when
																	test="${dto.event_tag2 ne null and dto.event_tag2 eq 'SALE' }">
																	<c:if test="${dto.event_tag eq 'BEST' }">
																		<span class="badge">${dto.event_tag }</span>
																	</c:if>
																	<c:if test="${dto.event_tag eq 'NEW' }">
																		<span class="badge badge-new">${dto.event_tag }</span>
																	</c:if>
																	<span class="badge badge-sale">${dto.event_tag2 }</span>
																</c:when>
																<c:when
																	test="${dto.event_tag2 ne null and dto.event_tag2 eq 'NEW' }">
																	<c:if test="${dto.event_tag eq 'BEST' }">
																		<span class="badge">${dto.event_tag }</span>
																	</c:if>
																	<c:if test="${dto.event_tag eq 'NEW' }">
																		<span class="badge badge-new">${dto.event_tag }</span>
																	</c:if>
																	<span class="badge badge-new">${dto.event_tag2 }</span>
																</c:when>
															</c:choose>
														</div>
														<div class="thumb">
															<img src="/file/download/product/${dto.system_name }"
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title">${dto.products_name }</b>
															</div>
															<div class="price-info" style="margin-bottom: 5px;">
																<b class="now-price"><fmt:formatNumber
																		value="${dto.price }" pattern="#,###" /><span>
																		원</span></b>
															</div>
															<span class="volume">(${dto.products_size })</span>
														</div>
													</a>
													<div class="btn-area btn-area-center">													
														<c:if test="${ auth.getName() ne null }">
															<c:choose>
																<c:when test="${dto.wish_status eq 1 }">
																	<button type="button"
																		data-wish-id="${dto.products_tag }"
																		data-wish-type="daily"
																		class="btn-round btn-white wishlistBtn active ">
																		<i class="ico ico-prd-wish"></i> <span class="hide">제품
																			찜하기</span>
																	</button>
																	<button type="button"
																		data-cart-id="${dto.products_no }"
																		data-cart-type="daily" data-cart-event=""
																		class="btn-round addCartBtn">
																		<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																			담기</span>
																	</button>
																</c:when>
																<c:otherwise>
																	<button type="button"
																		data-wish-id="${dto.products_tag }"
																		data-wish-type="daily"
																		class="btn-round btn-white wishlistBtn ">
																		<i class="ico ico-prd-wish"></i> <span class="hide">제품
																			찜하기</span>
																	</button>
																	<button type="button"
																		data-cart-id="${dto.products_no }"
																		data-cart-type="daily" data-cart-event=""
																		class="btn-round addCartBtn">
																		<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																			담기</span>
																	</button>
																</c:otherwise>
															</c:choose>
														</c:if>
														<c:if test="${ auth.getName() eq null }">
															<button type="button" data-wish-id="${dto.products_tag }"
																data-wish-type="daily"
																class="btn-round btn-white wishlistBtn ">
																<i class="ico ico-prd-wish"></i> <span class="hide">제품
																	찜하기</span>
															</button>
															<button type="button" data-cart-id="${dto.products_no }"
																data-cart-type="daily" data-cart-event=""
																class="btn-round addCartBtn">
																<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																	담기</span>
															</button>
														</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<form id="searchForm">
					<input type="hidden" name="category_no" value="${param.category}">
					<input type="hidden" name="tags" value="${param.tags }">
					<div class="cbody-wrap">
						<div class="bg-light-gray over-section"
							style="margin-bottom: 120px">
							<div class="container">								
								<c:choose>
									<c:when test="${param.category eq null  }">
										<div class="tag-place">
											<button data-idx="242" type="button" class="tag-btn item">유기농</button>
											<button data-idx="7" type="button" class="tag-btn item">융복합녹즙</button>
											<button data-idx="478" type="button" class="tag-btn item">케일</button>
											<button data-idx="479" type="button" class="tag-btn item">양배추</button>
											<button data-idx="262" type="button" class="tag-btn item">식물성유산균</button>
											<button data-idx="327" type="button" class="tag-btn item">발효유</button>
											<button data-idx="395" type="button" class="tag-btn item">식사대용</button>
											<button data-idx="457" type="button" class="tag-btn item">이달의녹즙</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 1  }">
										<div class="tag-place">
											<button data-idx="479" type="button" class="tag-btn item ">양배추</button>
											<button data-idx="478" type="button" class="tag-btn item ">케일</button>
											<button data-idx="417" type="button" class="tag-btn item ">이달의제품</button>
											<button data-idx="242" type="button" class="tag-btn item ">유기농</button>
											<button data-idx="82" type="button" class="tag-btn item ">발효녹즙</button>
											<button data-idx="62" type="button" class="tag-btn item ">어린이</button>
											<button data-idx="42" type="button" class="tag-btn item ">순수녹즙</button>
											<button data-idx="1" type="button" class="tag-btn item ">채소섭취</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 4  }">
										<div class="tag-place">
											<button data-idx="497" type="button" class="tag-btn item ">이달의녹즙</button>
											<button data-idx="483" type="button" class="tag-btn item ">양배추</button>
											<button data-idx="7" type="button" class="tag-btn item ">융복합녹즙</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 31  }">
										<div class="tag-place">
											<button data-idx="484" type="button" class="tag-btn item ">양배추</button>
											<button data-idx="326" type="button" class="tag-btn item ">PMO08</button>
											<button data-idx="325" type="button" class="tag-btn item ">발효유</button>
											<button data-idx="262" type="button" class="tag-btn item ">식물성유산균</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 60  }">
										<div class="tag-place">
											<button data-idx="487" type="button" class="tag-btn item ">유산균</button>
											<button data-idx="330" type="button" class="tag-btn item ">프로바이오틱스</button>
											<button data-idx="329" type="button" class="tag-btn item ">우유</button>
											<button data-idx="328" type="button" class="tag-btn item ">PMO08</button>
											<button data-idx="327" type="button" class="tag-btn item ">발효유</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 62  }">
										<div class="tag-place">
											<button data-idx="333" type="button" class="tag-btn item ">발효건강즙</button>
											<button data-idx="332" type="button" class="tag-btn item ">과채즙</button>
										</div>
									</c:when>
									<c:when test="${param.category eq 64  }">
										<div class="tag-place">
											<button data-idx="400" type="button" class="tag-btn item ">간식</button>
											<button data-idx="399" type="button" class="tag-btn item ">아침대용</button>
											<button data-idx="398" type="button" class="tag-btn item ">핸디밀</button>
											<button data-idx="395" type="button" class="tag-btn item ">식사대용</button>
										</div>
									</c:when>
									<c:otherwise>
										<div class="tag-place">
											<button data-idx="242" type="button" class="tag-btn item">유기농</button>
											<button data-idx="7" type="button" class="tag-btn item">융복합녹즙</button>
											<button data-idx="478" type="button" class="tag-btn item">케일</button>
											<button data-idx="479" type="button" class="tag-btn item">양배추</button>
											<button data-idx="262" type="button" class="tag-btn item">식물성유산균</button>
											<button data-idx="327" type="button" class="tag-btn item">발효유</button>
											<button data-idx="395" type="button" class="tag-btn item">식사대용</button>
											<button data-idx="457" type="button" class="tag-btn item">이달의녹즙</button>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="tab-content" id="tab-content-depth2">
									<div class="prd-list-head">
										<p class="count">
											<c:choose>
												<c:when test="${param.tags ne null and param.tags > '0' }">
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:when>
												<c:when test="${param.category ne null }">										
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:when>
												<c:otherwise>
											총 <em>${fn:length(list) }</em>건의 상품이 있습니다.
										</c:otherwise>
											</c:choose>
										</p>
									</div>
									<div class="prd-list wrap" data-list-object="append"
										id="product-items">
										<c:forEach items="${searchlist }" var="dto" varStatus="status">
											<div class="prd-area">
												<a
													href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
													title="제품 상세페이지로 가기">
													<div class="badges">
														<c:choose>
															<c:when test="${dto.event_tag eq 'BEST' }">
																<span class="badge">${dto.event_tag }</span>
															</c:when>
															<c:when test="${dto.event_tag eq 'NEW' }">
																<span class="badge badge-new">${dto.event_tag }</span>
															</c:when>
															<c:when
																test="${dto.event_tag2 ne null and dto.event_tag2 eq 'SALE' }">
																<span class="badge badge-sale">${dto.event_tag2 }</span>
															</c:when>
															<c:when
																test="${dto.event_tag2 ne null and dto.event_tag2 eq 'NEW' }">
																<span class="badge badge-new">${dto.event_tag2 }</span>
															</c:when>
														</c:choose>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> ${dto.products_name }</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"><fmt:formatNumber
																	value="${dto.price }" pattern="#,###" /> <span>
																	원</span> </b>
														</div>
														<span class="volume">(${dto.products_size })</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<c:if test="${ auth.getName() ne null }">
														<c:choose>
															<c:when test="${dto.wish_status eq 1 }">
																<button type="button"
																	data-wish-id="${dto.products_tag }"
																	data-wish-type="daily"
																	class="btn-round btn-white wishlistBtn active ">
																	<i class="ico ico-prd-wish"></i> <span class="hide">제품
																		찜하기</span>
																</button>
																<button type="button" data-cart-id="${dto.products_no }"
																	data-cart-type="daily" data-cart-event=""
																	class="btn-round addCartBtn">
																	<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																		담기</span>
																</button>
															</c:when>
															<c:otherwise>
																<button type="button"
																	data-wish-id="${dto.products_tag }"
																	data-wish-type="daily"
																	class="btn-round btn-white wishlistBtn ">
																	<i class="ico ico-prd-wish"></i> <span class="hide">제품
																		찜하기</span>
																</button>
																<button type="button" data-cart-id="${dto.products_no }"
																	data-cart-type="daily" data-cart-event=""
																	class="btn-round addCartBtn">
																	<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																		담기</span>
																</button>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${ auth.getName() eq null }">
														<button type="button" data-wish-id="${dto.products_tag }"
															data-wish-type="daily"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>
														<button type="button" data-cart-id="${dto.products_no }"
															data-cart-type="daily" data-cart-event=""
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>
													</c:if>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="button-set mb60" data-list-more="#product-items"
										data-param="2">
										<c:choose>
											<c:when test="${fn:length(searchcountlist)>12  }">
												<button type="button" class="basic-big-button">더보기</button>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
</body>
</html>
