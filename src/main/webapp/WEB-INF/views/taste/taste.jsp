<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="wrapper">
	<main class="page">
		<div id="container-wrapper" class="container-wrapper">
			<script type="text/javascript">
				$().ready(function() {
					pkgIdx = "${param.pkgIdx}";
					if (pkgIdx == 58) {
						$("#tasting-intro-tab2").addClass("active");
						$("#tasting-tab2").addClass("active show");
					} else if (pkgIdx == 56) {
						$("#tasting-intro-tab3").addClass("active");
						$("#tasting-tab3").addClass("active show");
					} else if (pkgIdx == 54) {
						$("#tasting-intro-tab4").addClass("active");
						$("#tasting-tab4").addClass("active show");
					} else if (pkgIdx == 53) {
						$("#tasting-intro-tab5").addClass("active");
						$("#tasting-tab5").addClass("active show");
					} else {
						$("#tasting-intro-tab1").addClass("active");
						$("#tasting-tab1").addClass("active show");
					}

					$("#myTab-area a").click(function(e) {
						var href = $(this).attr("href");
						history.replaceState({}, '', href);
					})
				});
			</script>
			<div class="tasting-gift-area">
				<div class="cont-title-area">
					<div class="container">
						<strong>하루 한 병, 건강한 습관<br> 풀무원녹즙을 선물합니다.
						</strong>
						<h2>시음선물</h2>
						<ul class="bubble-text-list">
							<li><span>어떤 녹즙을 먹어야 할 지 모르겠어요!</span></li>
							<li><span>다른 녹즙의 맛이 궁금해요~</span></li>
							<li><span>친구에게 건강한 녹즙을 권해주고 싶어요~</span></li>
						</ul>
					</div>
				</div>
				<div class="contents-area">
					<div class="container">
						<div class="location">
							<a href="/">홈</a> <a href="#">시음선물</a>
						</div>
						<div class="tasting-gift-intro-text">
							<em><span>매일 신선한 채소와 과일의 영양을 그대로,</span><br> 풀무원녹즙이 필요한 <span>친구</span> 또는 <span>나에게</span> 시음을 선물해보세요! </em> <b>매일 문 앞까지 풀무원녹즙을 배송해드립니다.</b>
						</div>
						<div class="tasting-gift-select-area">
							<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
								<li class="nav-item" role="presentation"><a href="/taste/taste?pkgIdx=229" class="nav-link  tabico_4" id="tasting-intro-tab1" data-target="#tasting-tab1" data-toggle="tab" role="tab" aria-controls="tasting-tab1" aria-selected="false"> <b>이달의녹즙</b> <span>유기농 과채와 멀티비타민, 미네랄로 하루 영양 채우기!</span>
								</a> <i></i></li>
								<li class="nav-item" role="presentation"><a href="/taste/taste?pkgIdx=58" class="nav-link   tabico_3" id="tasting-intro-tab2" data-target="#tasting-tab2" data-toggle="tab" role="tab" aria-controls="tasting-tab2" aria-selected="false"> <b>융복합 녹즙</b> <span> 900만병 판매! TV 속 융복합 건강기능식품</span>
								</a> <i></i></li>
								<li class="nav-item" role="presentation"><a href="/taste/taste?pkgIdx=56" class="nav-link  tabico_4" id="tasting-intro-tab3" data-target="#tasting-tab3" data-toggle="tab" role="tab" aria-controls="tasting-tab3" aria-selected="false"> <b>BEST 녹즙</b> <span>인기있는 BEST 녹즙을 한 번에 만나보고 싶으신</span>
								</a> <i></i></li>
								<li class="nav-item" role="presentation"><a href="/taste/taste?pkgIdx=54" class="nav-link  tabico_2" id="tasting-intro-tab4" data-target="#tasting-tab4" data-toggle="tab" role="tab" aria-controls="tasting-tab4" aria-selected="false"> <b>건강한 한 끼</b> <span>하루 한 병, 건강한 한 끼 식사 대용</span>
								</a> <i></i></li>
								<li class="nav-item" role="presentation"><a href="/taste/taste?pkgIdx=53" class="nav-link  tabico_5" id="tasting-intro-tab5" data-target="#tasting-tab5" data-toggle="tab" role="tab" aria-controls="tasting-tab5" aria-selected="false"> <b>아이 사랑</b> <span>어린이, 청소년들을 위한 녹즙을 만나보고 싶으신!</span>
								</a> <i></i></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade " role="tabpane" id="tasting-tab1" aria-labelledby="tasting-intro-tab1">
									<div class="prd-list">
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">월</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">화</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">수</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">목</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">금</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>
									</div>
									<div class="tasting-prd-info-text">
										<b>이달의녹즙</b> <span>유기농 과채와 멀티비타민, 미네랄로 하루 영양 채우기!</span>
										<div class="price-info">
											<em class="before-price"> 17,500 <span>원</span></em> <b class="now-price">5,000<span> 원</span>
											</b>
										</div>
										<button type="button" class="btn-default">선물하기</button>
									</div>
								</div>
								<div class="tab-pane fade " role="tabpane" id="tasting-tab2" aria-labelledby="tasting-intro-tab2">
									<div class="prd-list">

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073405" data-product-preview="726" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">월</span>
												<div class="thumb">
													<img src="/file/download/product/1c884ddf-10fc-4cb8-854e-792ba5bc4875.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 위러브 엑스투 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073271" data-product-preview="612" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">화</span>
												<div class="thumb">
													<img src="/file/download/product/abde0d7f-d546-4cc4-acec-99a4b895b9d7.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 아이러브엑스투 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073579" data-product-preview="732" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">수</span>
												<div class="thumb">
													<img src="/file/download/product/71809180-de6b-4081-b0e2-ed552a5a7d0d.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 핏러브 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073080" data-product-preview="440" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">목</span>
												<div class="thumb">
													<img src="/file/download/product/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 하트러브 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0074095" data-product-preview="743" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">금</span>
												<div class="thumb">
													<img src="/file/download/product/b7323a61-8792-488b-9a32-571fe276bcea.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 비타맥스 엑스투 </b>
												</div>
											</button>
										</div>
									</div>
									<div class="tasting-prd-info-text">
										<b>융복합 녹즙</b> <span> 900만병 판매! TV 속 융복합 건강기능식품</span>
										<div class="price-info">
											<em class="before-price"> 17,100 <span>원</span></em> <b class="now-price">5,000<span> 원</span>
											</b>
										</div>
										<button type="button" class="btn-default">선물하기</button>
									</div>
								</div>
								<div class="tab-pane fade " role="tabpane" id="tasting-tab3" aria-labelledby="tasting-intro-tab3">
									<div class="prd-list">

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073344" data-product-preview="723" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">월</span>
												<div class="thumb">
													<img src="/file/download/product/c4e38bfb-9926-4cfc-bb92-973a4401c609.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> ABC플러스 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0071823" data-product-preview="280" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">화</span>
												<div class="thumb">
													<img src="/file/download/product/42f32473-d37b-4ef8-8fe7-7358a4ec4bd5.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 마시는새싹 발효녹즙 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0071654" data-product-preview="281" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">수</span>
												<div class="thumb">
													<img src="/file/download/product/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 위러브플러스 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073080" data-product-preview="440" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">목</span>
												<div class="thumb">
													<img src="/file/download/product/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 하트러브 엑스투 </b>
												</div>
											</button>
										</div>
										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0070604" data-product-preview="277" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">금</span>
												<div class="thumb">
													<img src="/file/download/product/83dc1b40-d2da-4fba-9853-0bef12bc65f7.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 돌미나리와민들레 </b>
												</div>
											</button>
										</div>
									</div>
									<div class="tasting-prd-info-text">
										<b>BEST 녹즙</b> <span>인기있는 BEST 녹즙을 한 번에 만나보고 싶으신</span>
										<div class="price-info">
											<em class="before-price"> 14,200 <span>원</span></em> <b class="now-price">5,000<span> 원</span>
											</b>
										</div>
										<button type="button" class="btn-default">선물하기</button>
									</div>
								</div>
								<div class="tab-pane fade " role="tabpane" id="tasting-tab4" aria-labelledby="tasting-intro-tab4">
									<div class="prd-list">

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0070445" data-product-preview="316" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">월</span>
												<div class="thumb">
													<img src="/file/download/product/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 식물성유산균쌀요거트 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073327" data-product-preview="588" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">화</span>
												<div class="thumb">
													<img src="/file/download/product/6325439c-9c58-4c7e-a129-90afaf1c7f10.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 히알&amp;콜라겐 식물성유산균 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073344" data-product-preview="723" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">수</span>
												<div class="thumb">
													<img src="/file/download/product/c4e38bfb-9926-4cfc-bb92-973a4401c609.png" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> ABC플러스 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073156" data-product-preview="444" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">목</span>
												<div class="thumb">
													<img src="/file/download/product/fccdbbd3-f74a-43f7-a898-aa55f1de5faa.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 핸디밀 리얼그레인 프로틴플랜 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0073155" data-product-preview="443" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">금</span>
												<div class="thumb">
													<img src="/file/download/product/42da9a6f-9889-4ff7-bf77-af5989855f86.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 핸디밀 블랙콩콩 비타D플랜 </b>
												</div>
											</button>
										</div>

									</div>
									<div class="tasting-prd-info-text">
										<b>건강한 한 끼</b> <span>하루 한 병, 건강한 한 끼 식사 대용</span>
										<div class="price-info">
											<em class="before-price"> 14,200 <span>원</span></em> <b class="now-price">5,000<span> 원</span>
											</b>
										</div>
										<button type="button" class="btn-default">선물하기</button>
									</div>
								</div>
								<div class="tab-pane fade " role="tabpane" id="tasting-tab5" aria-labelledby="tasting-intro-tab5">
									<div class="prd-list">

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0072840" data-product-preview="430" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">월</span>
												<div class="thumb">
													<img src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 슈퍼키즈하이 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0072840" data-product-preview="430" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">화</span>
												<div class="thumb">
													<img src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 슈퍼키즈하이 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0072840" data-product-preview="430" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">수</span>
												<div class="thumb">
													<img src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 슈퍼키즈하이 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0072840" data-product-preview="430" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">목</span>
												<div class="thumb">
													<img src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 슈퍼키즈하이 </b>
												</div>
											</button>
										</div>

										<div class="prd-area">
											<button type="button" class="btn-preview" data-itemcode="0072840" data-product-preview="430" title="제품 상세페이지 팝업 열기">
												<span class="badge-day">금</span>
												<div class="thumb">
													<img src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
												</div>
												<div class="prd-info">
													<b class="prd-title"> 슈퍼키즈하이 </b>
												</div>
											</button>
										</div>

									</div>
									<div class="tasting-prd-info-text">
										<b>아이 사랑</b> <span>어린이, 청소년들을 위한 녹즙을 만나보고 싶으신!</span>
										<div class="price-info">
											<em class="before-price"> 10,000 <span>원</span></em> <b class="now-price">5,000<span> 원</span>
											</b>
										</div>
										<button type="button" class="btn-default">선물하기</button>
									</div>
								</div>



							</div>
						</div>

						<div class="tasting-gift-cont">
							<span>* 시음 상품은 본품과 동일한 상품으로 배송됩니다.</span>
							<div class="circle-scheme">
								<h3 class="cont-title-h3">시음선물 주문안내</h3>
								<ul>
									<li>
										<div class="img-area">
											<img src="/resources/assets/images/ui/ico-tasting-info-item01.png" alt="">
										</div> <span>선물선택</span>
									</li>
									<li>
										<div class="img-area">
											<img src="/resources/assets/images/ui/ico-tasting-info-item02.png" alt="">
										</div> <span>선물 결제</span>
									</li>
									<li>
										<div class="img-area">
											<img src="/resources/assets/images/ui/ico-tasting-info-item03.png" alt="">
										</div> <span>수신정보 입력</span>
									</li>
									<li>
										<div class="img-area">
											<img src="/resources/assets/images/ui/ico-tasting-info-item04.png" alt="">
										</div> <span>가맹점 확인</span>
									</li>
									<li>
										<div class="img-area">
											<img src="/resources/assets/images/ui/ico-tasting-info-item05.png" alt="">
										</div> <span>시음배송</span>
									</li>
								</ul>
							</div>
							<div class="tasting-gift-coupon">
								<h3 class="cont-title-h3">시음선물 혜택안내</h3>
								<div class="gift-coupon-area">
									<img src="/resources/assets/images/contents/tasting-coupon01.png" alt=""> <span>시음 후 매일배송 상품을 주문하시면 선물한 사람도, <br>받은 사람도 5,000원 쿠폰 혜택을 드려요!
									</span>
								</div>
							</div>
							<div class="tasting-gift-notice-area">
								<b>유의사항</b>
								<ul class="list dot-list">
									<li>시음선물하기는 횟수 제한 없이 가능합니다. 단, 시음선물 수신은 인 당 연 2회(상/하반기 각 1회) 가능합니다.</li>
									<li style="color: red; font-weight: bold;">시음선물은 중복 주소지로의 이용이 불가합니다. 수신자 정보가 상이하더라도 중복 주소지로의 이용은 불가하며, 시음선물 주문이 사전 안내 없이 취소 될 수 있습니다.</li>
									<li style="color: red; font-weight: bold">배송가맹점의 사정(주문량 급증, 배송사원 부재 등)에 따라 첫 배송일, 배송횟수 등이 변경될 수 있으며, 배송이 어려운 경우 주문이 취소될 수 있습니다.</li>
									<li>시음선물 재발송은 MY녹즙 &gt; 시음선물내역에서 가능하며, LMS는 1회 가능합니다. (카카오톡의 경우 모바일에서만 가능합니다.)</li>
									<li>시음선물 수락 이후에는 전체/부분 취소 및 환불이 불가합니다.</li>
									<li>시음 선물 체험 후 매일 배송 상품을 신규 주문 시 첫 배송일 이후 선물한 분과 받으신 분께 5,000원 쿠폰이 첫 배송일에 발행됩니다. (단, 시음 첫 배송일로부터 4주 이내에 주문 시 해당되며, 선물 받으신 분은 회원 가입이 되어 있어야 정상 발급됩니다.)</li>
									<li>본인에게 시음선물 후 정기주문 시에는 5,000원 쿠폰이 1매 발행됩니다.</li>
									<li>해당 선물하기 이벤트는 당사의 사정에 따라 사전 고지없이 변경 또는 중단될 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(function() {
					$('#myModal').on('shown.bs.modal', function() {

						$('#myInput').trigger('focus')
					});
				});
			</script>
		</div>
	</main>
</div>
<div class="modal" id="productPreviewModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="width: 430px;">
		<div class="modal-content modal-product"></div>
	</div>
</div>
</html>

