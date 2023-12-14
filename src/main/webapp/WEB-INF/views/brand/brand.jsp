<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper page-screen">
	<!--S:container-wrapper -->
	<div id="container-wrapper" class="container-wrapper">
		<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->
		<script type="text/javascript" src="/resources/assets/js/common.ui.js"></script>
		<script>
	$(document).ready(function () {
		if (!location.href.includes("pageNo=")) return;
		if (!$(".tab-type02>.item:eq(0)").hasClass("is-active")) return;

		var top = $("#tourtitle").offset().top;
		window.scrollTo(0, top);
	});
</script>
		<div class="v1_content_body" style="padding-bottom: 120px">
			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a>홈</a></li>
						<li><a class="active">브랜드 소개</a></li>
					</ul>
				</div>
			</div>
			<div id="container-wrapper" class="container-wrapper">
				<!--S:cheader-->
				<div class="cheader">
					<div class="section">
						<div class="ctitle-wrap">
							<h2 class="ctitle">브랜드 소개</h2>
						</div>
					</div>
				</div>
				<div class="cbody-wrap">
					<div class="section">
						<div class="cbody-cont">

							<div class="tab-wrap">
								<ul class="tab-type02">
									<li class="item is-active"><button class="tab-link js-tab-link" onclick="javascript:tabOpen(0);" type="button" data-href="js-tab-cont" data-idx="0">풀무원녹즙 소개</button></li>
									<li class="item"><button class="tab-link js-tab-link" onclick="javascript:tabOpen(1);" type="button" data-href="js-tab-cont" data-idx="1">걸어온길</button></li>
								</ul>
								<!--S:제품정보-->
								<div class="tab-cont js-tab-cont js-tab-cont-0" style="display: block;">
									<h3 class="offscreen">풀무원녹즙 소개</h3>
									<div class="brand-info-wrap">
										<div class="brand-info-box">
											<div class="brand-info-txt">
												<p class="title">내 자식에게 먹일 수 없다면 팔지마라</p>
												<p>
													생명을 풀무질하는 아름다운 농부, 원경선(1914 - 2013)<br> 평안남도 중화군에서 가난한 농부의 아들로 태어나 열여섯 살 되던 해에 농군의 길로 들어선 원경선은 1955년 경기도 부천에 '풀무원농장'을 마련하고 오갈 데 없는 이들을 위한 공동체를 세웠습니다. 1976년 경기도 양주로 농장을 옮긴 후 국내 최초로 화학 비료와 제초제를 사용하지 않는 유기농을 시작하면서 한국 최초의 유기농민단체 '정농회'를 설립했습니다. 공동체 운동으로 시작된 그의 이타적 삶은 환경운동과 생명보호운동, 평화운동으로 진보를 거듭했습니다. 1989년 한국 국제 기아 대책 기구 창립에 초석을 마련했으며, 1992년 브라질 리우데자네이루에서 개최된 유엔 세계환경회의에 한국 대표로 참석해 유기농 실천운동에 대한 강연을 하기도 했습니다. 사랑과 평화 그리고 또 하나의 실천으로 불린 그는 유기농을 통해 환경보호와 보존에 이바지한 공로를 인정받아 1992년 녹색인상, 1995년 '유엔 글로벌 500'상, 1997년 국민훈장 동백장, 1998년 인촌상을 수상했습니다.
												</p>
											</div>
											<div class="brand-info-img">
												<img src="/resources/assets/images/contents/img_brand_info01.png">
											</div>
										</div>
										<div class="brand-info-box">
											<div class="brand-info-txt">
												<p class="title">최고의 건강 도우미</p>
												<p>
													우리가 외면해버린 채소와 과일에 바쳐진 찬사입니다. 우리 몸에 꼭 필요한 다양한 비타민과 미네랄을 품고 있는 채소와 과일은 암 등 각종 질병의 원인이 되는 활성 산소를 없애주고, 면역력을 높여줍니다. 채소와 과일 속 영양을 온전히 섭취하려면 생으로 먹는 것이 좋고, 쌈, 샐러드, 녹즙 중 체내 흡수율로 따지면 녹즙이 으뜸입니다.<br> 채소와 과일을 녹즙으로 만들면 섬유질이 잘게 부서지면서 비타민, 미네랄 등이 쉽게 빠져 나오므로 그냥 먹을 때보다 더 많은 영양소를 섭취할 수 있습니다. 또 소화 흡수율도 그냥 먹을때보다 녹즙을 마실 때가 더 높습니다. 칼로리는 넘치고 영양은 부족할 때에는 매일 한 다발 대신 한 잔! 그럼 그 녹즙은 어디서 온 어떤 녹즙이어야 할까요?
												</p>
											</div>
											<div class="brand-info-img">
												<img src="/resources/assets/images/contents/img_brand_info02.png">
											</div>
										</div>
										<div class="brand-info-box">
											<div class="brand-info-txt">
												<p class="title">
													<span>자연 그대로의 과학이 이룬</span> 세계 녹즙의 기준, 풀무원녹즙
												</p>
												<p>
													자연을 닮은 풀무원녹즙, 녹즙 안에 자연을 담다!<br> 풀무원녹즙은 매일 아침, 신선한 채소와 과일의 영양을 자연 그대로 전하는 풀무원의 천연 녹즙 브랜드입니다. 1995년 풀무원의 건강음료 사업으로 시작된 풀무원녹즙은 신선한 녹즙을 위한 유기농 원료의 선택에서부터 공정 위생 관리, 섭씨 5도씨 이하의 온도 관리, 신선유통 관리에 이르기까지 풀무원의 바른먹거리 원칙을 지켜나가고 있습니다.<br> 전국의 유기 재배 농가와 계약을 맺고 정기적인 검사를 통해 원료산지부터 엄격하게 관리하고 있으며, 안전하고 신선한 원료만을 사용해 원료 하나하나의 세척에서부터 착즙, 포장까지 깨끗함을 고집합니다. 그리고, 고객이 원하는 곳까지 매일 아침 풀무원 모닝스텝을 통해 신선하고 안전하게 건강을 전합니다. 풀무원녹즙의 각별한 녹즙!
												</p>
											</div>
											<div class="brand-info-img">
												<img src="/resources/assets/images/contents/img_brand_info03.png">
											</div>
										</div>
									</div>
									<div class="cbody-wrap" style="padding-top: 100px">
										<div class="section">
											<div class="cbody-cont">
												<h3 class="stitle">풀무원 녹즙의 원칙과 약속</h3>
												<p class="stitle-desc">매일 아침 신선한 채소와 과일의 영양을 자연 그대로 전하는 풀무원녹즙 이야기</p>
												<ul class="greenstroy-index-wrap">
													<li><a href="/info/greenStory/rule"> <span class="num">01</span> <i class="ico ico-greenstroy-index1"></i> <span class="title">풀무원 녹즙의 원칙</span> <span class="txt">신선 / 안전 / 깨끗함을 지키는<br>풀무원 녹즙의 원칙
														</span>
													</a></li>
													<li><a href="/info/greenStory/production"> <span class="num">02</span> <i class="ico ico-greenstroy-index2"></i> <span class="title">제품생산공정</span> <span class="txt">건강을 책임지는 풀무원 녹즙의<br>생산과정
														</span>
													</a></li>
													<li><a href="/info/greenStory/customer"> <span class="num">03</span> <i class="ico ico-greenstroy-index3"></i> <span class="title">고객만족</span> <span class="txt">고객이 만족할 때까지<br>풀무원녹즙이 드리는 약속
														</span>
													</a></li>
													<li><a href="/info/greenStory/slogan"> <span class="num">04</span> <i class="ico ico-greenstroy-index4"></i> <span class="title">슬로건</span> <span class="txt">몸 속 균형을 위한 건강 밸런스,<br>풀무원녹즙과 프로바이오의 약속
														</span>
													</a></li>
													<li><a href="/info/greenStory/environment"> <span class="num">05</span> <i class="ico ico-greenstroy-index5"></i> <span class="title">환경방침(3R)</span> <span class="txt">우리의 소중한 자연을 지키기 위해<br>풀무원녹즙이 지키는 다짐
														</span>
													</a></li>
												</ul>
												<h3 class="stitle" id="tourtitle">녹즙산지 탐방</h3>
												<p class="stitle-desc">유기농 농장주의 자연 그대로의 이야기를 담았습니다.</p>
												<div class="greenstory-board-wrap">
													<ul class="board-list">
														<li>
															<div class="thumb-box">
																<a href="/info/greenStory/72"> <img alt="돌미나리-미나리, 그 이상의 미나리" src="/file/download/tour/9e2288d0-c986-470f-b434-2e9a85e58dc1.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
																</a>
															</div>
															<p class="board-title">
																<a href="/info/greenStory/72">돌미나리-미나리, 그 이상의 미나리</a>
															</p>
														</li>
														<li>
															<div class="thumb-box">
																<a href="/info/greenStory/71"> <img alt="당근-제주 당근 숲에서 갓 캔-그 당근 맛" src="/file/download/tour/7de04c29-82c9-499b-be2c-78575b204aef.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
																</a>
															</div>
															<p class="board-title">
																<a href="/info/greenStory/71">당근-제주 당근 숲에서 갓 캔-그 당근 맛</a>
															</p>
														</li>
														<li>
															<div class="thumb-box">
																<a href="/info/greenStory/70"> <img alt="케일-풀무원녹즙 유기농 케일녹즙" src="/file/download/tour/6d9acf7f-bc18-4040-b195-47cf151a6ebe.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
																</a>
															</div>
															<p class="board-title">
																<a href="/info/greenStory/70">케일-풀무원녹즙 유기농 케일녹즙</a>
															</p>
														</li>
														<li>
															<div class="thumb-box">
																<a href="/info/greenStory/69"> <img alt="브로콜리-브로콜리의 비밀" src="/file/download/tour/92ba975b-c29e-47e6-a2da-bb293052e4cd.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
																</a>
															</div>
															<p class="board-title">
																<a href="/info/greenStory/69">브로콜리-브로콜리의 비밀</a>
															</p>
														</li>
														<li>
															<div class="thumb-box">
																<a href="/info/greenStory/68"> <img alt="명일엽-원주 농장에서 도안 공장까지" src="/file/download/tour/67421fc8-efb3-4a9d-955d-82a8ab5f717a.jpg" onerror="this.src='/resources/assets/images/common/no_img.png'">
																</a>
															</div>
															<p class="board-title">
																<a href="/info/greenStory/68">명일엽-원주 농장에서 도안 공장까지</a>
															</p>
														</li>
													</ul>
												</div>
												<form id="searchForm">
													<div class="paging">
														<input type="hidden" id="pageNo" name="pageNo">
														<ul class="pagination">
															<li class="page-item active"><a class="page-link">1</a></li>
														</ul>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-cont js-tab-cont js-tab-cont-1" style="display: none;">
									<h3 class="offscreen">걸어온 길</h3>
									<p>
										<img src="/resources/assets/images/contents/bn_history_top.png" class="history-visual-image">
									</p>
									<ul class="company-history-list">
										<li>
											<p class="year">2023</p>
											<ul>
												<li>제31회 대한민국 패키지 디자인 대전 4개 제품 수상</li>
												<li>과채음료 최초 e-라벨 도입</li>
											</ul>
										</li>
										<li>
											<p class="year">2022</p>
											<ul>
												<li>어린이 건강기능식품 키즈프리 멀티비타민 면역 탱글젤리 출시</li>
												<li>이동식 냉장 전동카트 녹크 도입</li>
												<li>식물성유산균 4종 재활용 최우수 등급 획득</li>
												<li>CCM(소비자중심경영) 인증 획득</li>
											</ul>
										</li>
										<li>
											<p class="year">2021</p>
											<ul>
												<li>클렌즈 3일 프로그램 디워밍업 출시</li>
												<li>어린이 과채주스 유기농 키즈프리 출시</li>
												<li>국내 최초 융복합 건강기능식품 칸러브 엑스투 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2020</p>
											<ul>
												<li>5가지 국내산 유기농 채소 생즙 오생즙 출시</li>
												<li>대용량 녹즙 프레시녹즙 6종 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2019</p>
											<ul>
												<li>환경부 인증 녹색기업 선정</li>
												<li>대용량 과일음료 프레시 스무디 5종 출시</li>
												<li>위러브 플러스 리뉴얼 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2018</p>
											<ul>
												<li>AMP(아시아마케팅연합) 올해의 마케팅 기업 선정</li>
												<li>로봇 피킹 시스템 도입, 한국물류대상 대통령 표창 수상</li>
											</ul>
										</li>
										<li>
											<p class="year">2016</p>
											<ul>
												<li>대한민국 프랜차이즈 랭킹 건강기능식품 업종 1위</li>
											</ul>
										</li>
										<li>
											<p class="year">2015</p>
											<ul>
												<li>녹즙사업 20주년, 신선배송플랫폼으로 사업영역 확장</li>
											</ul>
										</li>
										<li>
											<p class="year">2014</p>
											<ul>
												<li>올해의 녹색상품 선정</li>
											</ul>
										</li>
										<li>
											<p class="year">2013</p>
											<ul>
												<li>바른먹거리 '풀무원' 과 요구르트 세계판매 1위 '다논이 만나<br>탄생된 풀무원 프로바이오 ‘런칭으로 국내 요구르트 시장 본격 진출
												</li>
											</ul>
										</li>
										<li>
											<p class="year">2011</p>
											<ul>
												<li>바른기준의 홍삼음료, 국내 최초 냉장 홍삼순액 풀무원 침홍삼 출시</li>
												<li>풀무원 식물성 유산균 마 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2010</p>
											<ul>
												<li>풀무원 식물성 유산균, 소비자신뢰 대표 브랜드 대상 수상<br>(유산균 음료 부문)
												</li>
												<li>칡즙과 헛개나무, 키즈하이녹즙, 아이러브 블루베리 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2009</p>
											<ul>
												<li>소비자 신뢰 대표브랜드 녹즙부문 대상 수상</li>
												<li>국내 최대 녹즙 생산시설 준공 완료 (충북 증평군 도안면)</li>
												<li>새초롬, 식물성 유산균, 뚜나혼합즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2008</p>
											<ul>
												<li>녹즙업계 최초 기능성분전면표시제 실시</li>
												<li>풀무원건강생활주과 풀무원녹즙 병행</li>
												<li>껍질이 들어간 감귤즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2007</p>
											<ul>
												<li>대용식 시장 진입</li>
												<li>한컵아침, 명일엽 혼합즙, 과채한가득, 흑초와 모로미초, 복분자즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2006</p>
											<ul>
												<li>유통 수 확대 주력 (지사, 모닝스텝)</li>
												<li>유통전문화 전략 적극 이행</li>
												<li>생과일 스무디, 생채소 스무디 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2005</p>
											<ul>
												<li>(주)풀무원 녹즙판매, 설립 독립사업본부에서 풀무원건강생활부로<br>소속 변경
												</li>
												<li>복분자150, 복분자120, 맛있는 녹즙시리즈(스쿨, 뷰티, 오피스), 오가피플러스,<br>깊은산귀한삼, 출시
												</li>
												<li>어린이 여성 건강 녹즙을 맛있는 녹즙 시리즈로 리뉴얼</li>
											</ul>
										</li>
										<li>
											<p class="year">2004</p>
											<ul>
												<li>택배 채널 확대 운영</li>
												<li>석류즙, 브로콜리 혼합즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2003</p>
											<ul>
												<li>(주)풀무원녹즙 법인 설립</li>
												<li>직영지사 운영</li>
												<li>액상생식 사업개시</li>
												<li>여성녹즙, 선프로그램, 선프리미엄, 선좋은아침, 종합녹즙 150,<br>종합즙 120, 그린포 출시
												</li>
											</ul>
										</li>
										<li>
											<p class="year">2002</p>
											<ul>
												<li>유통채널 분리 전략 도입</li>
												<li>업계최초 HACCP 인증 획득</li>
												<li>산수유, 맛있는 건강녹즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2001</p>
											<ul>
												<li>웹 주문시스템 구축/홈페이지 리뉴얼</li>
												<li>하부조직 교육 강화</li>
												<li>어린이녹즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">2000</p>
											<ul>
												<li>허브음료 확대, 정비</li>
												<li>홈페이지 구축</li>
												<li>알로에 플러스, 석류 혼합, 오가피, 울금 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">1999</p>
											<ul>
												<li>독립사업본부제 도입</li>
												<li>시장이원화(택배/특판) - 사무실 시장 진출</li>
												<li>건강도우미(현, 모닝스텝) 조직 구축</li>
												<li>허브음료 개시</li>
												<li>명일엽 120, 당근 120, 종합야채, 솔잎즙, 당두중, 인진쑥, 은행즙,<br>대추즙, 사과요거트 출시
												</li>
											</ul>
										</li>
										<li>
											<p class="year">1998</p>
											<ul>
												<li>혼합녹즙 출시</li>
												<li>청년시대, 돌미나리 혼합즙, 청춘선언, 포도즙, 산수유, 칡즙 출시</li>
											</ul>
										</li>
										<li>
											<p class="year">1995</p>
											<ul>
												<li>풀무원녹즙 사업 시작</li>
												<li>유기명일엽, 유기케일녹즙 출시</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>

						</div>
					</div>
					<!--S: top button-->


					<!--E: top button-->
				</div>
				<!--E:cbody-->


			</div>

		</div>

		<script>
  var windowRef = null;
  function openWindowPop(url, name){
    var image = document.getElementById('guideImage');
    var w = image.width;
    var h = image.height;
    var options = `width=${w},height=${h}, status=no, menubar=no, toolbar=no, resizable=no`;
	if(windowRef===null|| windowRef.closed){

    windowRef = window.open('', name, options);
    windowRef.document.write(`<img src="${url}" width="${w}" maxWidth=100vw />`);
    windowRef.document.body.style.margin=0;
	}else {
    windowRef.focus();
	}

  }
  $(function(){

    axios.get('/user_summary/default').then(function (response) {

      const {info, customerVo} = response.data.RESULT_MSG;

		const ec = ( !info.overEnd) && (info.complex||info.hasHp) && customerVo.phiCustomerVo.intfacId == '0' && customerVo.phiCustomerVo.dlvyCustYn==='Y'
        if(ec&&customerVo){
          $('#quickChangeDrink').attr('href', `/mypage/drink/drink/change/${customerVo.custnumber}/${customerVo.prtnId}`)
          $('#quickChangeSchedule').attr('href', `/mypage/drink/drink/pause/${customerVo.custnumber}/${customerVo.prtnId}`)
        }else {
          $('#quickChangeDrink').attr('href', `/mypage?with=01`)
          $('#quickChangeSchedule').attr('href', `/mypage?with=01`)
        }
        console.log(window.innerWidth)
        if(window.innerWidth>1450){
          $('#mini-side-nav').show();
        }
    }).catch(function (error) {
      if(window.innerWidth>1450) {
        $('#mini-side-nav').show()
      }
	});
    window.addEventListener('resize', function(){
	  if(window.innerWidth>1450){
		$('#mini-side-nav').show();
	  }else {
		$('#mini-side-nav').hide();
	  }
	})

  })
</script>
	</div>
	<button id="top_move_pointer" class="top-nav">
		<img src="/resources/assets/images/ui/left_short_arrow.png">
		<p>TOP</p>
	</button>
	<script>
  $(window).scroll(function() {
    if ($(window).scrollTop() > 0) {
      if (!$("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").addClass("st");
      }
    } else {
      if ($("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").removeClass("st");
      }
    }
  })
  $(document).on("click", "#top_move_pointer", function() {
    $(document).scrollTop(0);
  });
</script>
	<script>
  $(function(){
    $('.dropdown-item').click(function(){
      const idx = $(this).data('idx')
      if($(this).hasClass('privacy')){

        $('.privacyPolicy').hide();
        $(`.privacyPolicy[data-idx=${idx}]`).show()
      }else {
        $('.terms').hide();
        $(`.terms[data-idx=${idx}]`).show()
      }
    })
  })
</script>

</div>
</html>