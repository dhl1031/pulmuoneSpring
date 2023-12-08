<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<body>
	<script type="text/javascript">
		var keyword = [];
		var taste = [];
		var life = [];

		$().ready(
				function() {
					var type = "";

					if (type == 'SELF') {
						switchOpen('SELF');
					} else if (type == 'LIFE') {
						switchOpen('LIFE');
					} else {
						switchOpen('SELF');
					}

					// 맞춤제품찾기 - step 초기화 실행
					fitStepInit('.js-quest-step-wrapper', 1);

					$("input[name=keyword]").change(function() {
						if ($(this).prop("checked")) {
							if (keyword.length >= 3) {
								alert("단계별 3개까지 선택할 수 있습니다.");
								$(this).prop("checked", false);
								$(this).next().css({
									"borderColor" : "",
									"backgroundColor" : ""
								});
								return false;
							}
							keyword.push($(this).val());
						} else {
							for ( var i in keyword) {
								if (keyword[i] == $(this).val()) {
									keyword.splice(i, 1);
								}
							}
						}
					});

					$("input[name=taste]").change(function() {
						if ($(this).prop("checked")) {
							if (taste.length >= 3) {
								alert("단계별 3개까지 선택할 수 있습니다.");
								$(this).prop("checked", false);
								$(this).next().css({
									"borderColor" : "",
									"backgroundColor" : ""
								});
								return false;
							}
							taste.push($(this).val());
						} else {
							for ( var i in taste) {
								if (taste[i] == $(this).val()) {
									taste.splice(i, 1);
								}
							}
						}
					});

					$("input[name=life]").change(function() {
						if ($(this).prop("checked")) {
							if (life.length >= 3) {
								alert("단계별 3개까지 선택할 수 있습니다.");
								$(this).prop("checked", false);
								$(this).next().css({
									"borderColor" : "",
									"backgroundColor" : ""
								});
								return false;
							}
							life.push($(this).val());
						} else {
							for ( var i in life) {
								if (life[i] == $(this).val()) {
									life.splice(i, 1);
								}
							}
						}
					});

					$('.sessionReset').click(
							function() { // 세션 스토리지 리셋
								if (sessionStorage.getItem('req1')
										|| sessionStorage.getItem('req2')
										|| sessionStorage.getItem('req3')) {
									sessionStorage.removeItem('req1');
									sessionStorage.removeItem('req2');
									sessionStorage.removeItem('req3');
								}
							})

				});

		/*
		 * date : 20191210
		 * last : 20191210
		 * name : fitStepInit( wrap, tgIdx )
		 * pram : wrap(필수) : 전체 영역 / tgIdx(필수) : 보여질 컨텐츠 넘버링 1부터 시작 ( 1 ~ n )
		 * desc : 맞춤제품찾기 - step 초기화
		 * exam : fitStepInit('.js-quest-step-wrapper', 1);
		 */
		function fitStepInit(wrap, tgIdx) {

			var $fitStepNumWrap = $(wrap).find('.js-quest-step-num'); // step number
			var $fitStepQuert = $(wrap).find('.js-quest-step'); // step Question

			$fitStepNumWrap.empty(); // 초기화
			$fitStepNumWrap.append('<ul></ul><div class="gage"></div>');

			// 질문의 개수만큼 넘버링 생성
			if ($fitStepQuert.length > 0 && $fitStepQuert.length >= tgIdx) {
				$fitStepQuert.each(function(i) {

					$(this).attr('data-step', (i + 1));

					// 활성화 지정 step
					if (tgIdx === (i + 1)) {

						$(this).addClass('is-active');
						$fitStepNumWrap.find('ul').append(
								'<li class="step is-active"><span class="number">'
										+ (i + 1) + '</span></li>');
						$fitStepNumWrap.find('.gage').css(
								'transform',
								'scale(' + (1 / ($fitStepQuert.length - 1)) * i
										+ ',1)');
					}

					// 활성화 지정 step prev
					else if ((i + 1) < tgIdx) {
						$fitStepNumWrap.find('ul').append(
								'<li class="step is-complete"><span class="number">'
										+ (i + 1) + '</span></li>');
					}

					// 활성화 지정 step etc
					else {
						$fitStepNumWrap.find('ul').append(
								'<li class="step"><span class="number">'
										+ (i + 1) + '</span></li>');
					}
				});
			}

		}

		//
		/*
		 * date : 20191210
		 * last : 20191210
		 * name : fitStepContentView( wrap, btn, direction )
		 * pram : [wrap]      : step 전제 감싸고 있는 영역 ( 지정한 클래스에 따라 변경 가능 )
			      [btn]       : 클릭되는 타켓 ( 고정 )
			      [direction] : (다음)일 경우 1, (이전)일 경우 0 으로 지정
		 * desc : 맞춤제품찾기 - 호출시 보여질 컨텐츠 노출
		 * exam : fitStepContentView('.js-quest-step-wrapper', $(this),1);
		 */
		function fitStepContentView(wrap, btn, direction) {

			var $fitStepNumWrap = $(wrap).find('.js-quest-step-num'); // step number
			var $fitStepQuert = $(wrap).find('.js-quest-step'); // step Question
			var nowQuertIdx; //

			if ($fitStepQuert.length <= 0)
				return false; // 질문 컨텐츠가 없을 경우 실행 X

			nowQuertIdx = parseInt(btn.closest('.js-quest-step').attr(
					'data-step')); // 현재 보여지는 컨텐츠 idx

			// 필수 선택 체크
			if (nowQuertIdx === 1) {
				if (keyword.length === 0) {
					alert("키워드를 선택해주세요.");
					return false;
				}
			}
			if (nowQuertIdx === 2) {
				if (taste.length === 0 && direction === 1) {
					alert("키워드를 선택해주세요.");
					return false;
				}
			}

			// prev step view
			if (direction === 0 && nowQuertIdx > 1) {
				$fitStepNumWrap.find('.step').eq((nowQuertIdx - 2))
						.removeClass('is-complete').addClass('is-active');
				$fitStepNumWrap.find('.step').eq((nowQuertIdx - 1))
						.removeClass('is-active');
				btn.closest('.js-quest-step').removeClass('is-active');
				$(wrap).find(
						'.js-quest-step[data-step=' + (nowQuertIdx - 1) + ']')
						.addClass('is-active');
				$fitStepNumWrap.find('.gage').css(
						'transform',
						'scale(' + (1 / ($fitStepQuert.length - 1))
								* (nowQuertIdx - 2) + ',1)');
			}

			// next step view
			else if (direction === 1 && $fitStepQuert.length > nowQuertIdx) {
				$fitStepNumWrap.find('.step').eq((nowQuertIdx - 1))
						.removeClass('is-active').addClass('is-complete');
				btn.closest('.js-quest-step').removeClass('is-active');
				$fitStepNumWrap.find('.step').eq((nowQuertIdx)).addClass(
						'is-active');
				$(wrap).find(
						'.js-quest-step[data-step=' + (nowQuertIdx + 1) + ']')
						.addClass('is-active');
				$fitStepNumWrap.find('.gage').css(
						'transform',
						'scale(' + (1 / ($fitStepQuert.length - 1))
								* nowQuertIdx + ',1)');
			}

		}

		// 버튼 선택 (나만을 위한/라이프 스타일)
		function switchOpen(type) {
			$('.c-chk-box[data-type=' + type + ']').addClass('is-active')
					.parent().siblings().children().removeClass('is-active');
			if (type == 'SELF') {
				$(".content-jfm-wrap").show();
				$(".content-life-wrap").hide();
			} else {
				$(".content-life-wrap").show();
				$(".content-jfm-wrap").hide();
			}
		}

		// 나만을 위한 결과 보기
		function forMeResult() {

			if ($("input:radio[name=gender]").is(":checked") == false) {
				$("input:radio[name=gender]:eq(0)").focus();
				alert("성별을 선택해주세요.");
				return;
			}
			if ($("input:radio[name=age]").is(":checked") == false) {
				$("input:radio[name=age]:eq(0)").focus();
				alert("연령을 선택해주세요.");
				return;
			}
			if ($("input:radio[name=flavor]").is(":checked") == false) {
				$("input:radio[name=flavor]:eq(0)").focus();
				alert("쓴맛 선호도를 선택해주세요.");
				return;
			}
			if ($("input:checkbox[name=purpose]:checked").length == 0) {
				$("input:checkbox[name=purpose]:eq(0)").focus();
				alert("목적을 1개 이상 선택해주세요.");
				return;
			}
			if ($("input:checkbox[name=pattern]:checked").length == 0) {
				$("input:checkbox[name=pattern]:eq(0)").focus();
				alert("생활패턴을 1개 이상 선택해주세요.");
				return;
			}
			if ($("input:checkbox[name=ingredient]:checked").length == 0) {
				$("input:checkbox[name=ingredient]:eq(0)").focus();
				alert("관심성분을 1개 이상 선택해주세요.");
				return;
			}

			var value = [];

			value.push($("input:radio[name=gender]:checked").val());
			value.push($("input:radio[name=age]:checked").val());
			value.push($("input:radio[name=flavor]:checked").val());

			$("input[name=purpose]:checked").each(function() {
				value.push($(this).val());
			});

			//var pattern = [];
			$("input[name=pattern]:checked").each(function() {
				value.push($(this).val());
			});

			//var ingredient = [];
			$("input[name=ingredient]:checked").each(function() {
				value.push($(this).val());
			});

			var selectValue = "";
			for ( var i in value) {
				selectValue += value[i];

				if (i < value.length - 1) {
					selectValue += ",";
				}
			}

			$("input[name=value]").val(selectValue);
			$("input[name=customerType]").val("SELF");
			$("#customerForm").submit();
		}

		// 라이프 스타일 결과보기
		function lifeStyleResult() {
			if (life.length === 0) {
				alert("단계별 1개 이상씩 선택해주세요.");
				return false;
			} else {

				var value = [];

				$("input[name=keyword]:checked").each(function() {
					value.push($(this).val());
				});

				$("input[name=taste]:checked").each(function() {
					value.push($(this).val());
				});

				$("input[name=life]:checked").each(function() {
					value.push($(this).val());
				});

				var selectValue = "";
				for ( var i in value) {
					selectValue += value[i];

					if (i < value.length - 1) {
						selectValue += ",";
					}
				}

				$("input[name=value]").val(selectValue);
				$("input[name=customerType]").val("LIFE");
				$("#customerForm").submit();
			}
		}
	</script>

	<div class="wrapper">

		<main class="step1">
			<div id="container-wrapper" class="container-wrapper">
				<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

				<!-- <form id="customerForm" action="/customer/product/result/result.do" method="post"> -->
				<input type="hidden" name="customerType" /> <input type="hidden"
					name="value" />
				<div class="visual-area curation">
					<div class="container">
						<div class="txt-area">
							<p>나만을 위한</p>
							<h1>맞춤큐레이션</h1>
							<span>당신에게 맞는 녹즙 프로그램을 추천해드립니다.</span>
						</div>
					</div>
					<div class="bg-img"></div>
				</div>
				<div class="texture-depth">
					<div class="breadcrumb-style">
						<div class="container">
							<ul>
								<li><a>홈</a></li>
								<li><a class="active">맞춤큐레이션</a></li>
							</ul>
						</div>
					</div>
					<div class="selection-area">
						<div class="container">
							<div class="selector" style="padding: 95px 0px 120px">
								<div class="curation-depth" style="padding-top: 30px">
									<div class="text-wrapper" style="margin-bottom: 35px">
										<h3>
											<b>건강목표, 식이섭취, 생활습관</b>에 대해서<br /> 간단한 설문에 참여하시면 당신에게 맞는<br />
											녹즙 프로그램을 큐레이션 해드립니다.
										</h3>
									</div>
									<a href="/customer/product/step1" style="font-size: 16px"	class="button-basic primary sessionReset">맞춤큐레이션 시작</a>
								</div>
								<div class="kids-depth" style="padding-top: 30px">
									<div class="text-wrapper" style="margin-bottom: 35px">
										<h3>
											혹시<br /> <b>키즈제품</b>을 원하시나요?
										</h3>
									</div>
									
									<a href="/customer/product/result/kids?singleYn=N"
										class="button-basic border" style="font-size: 16px">키즈제품
										바로가기</a>
										
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- </form> -->
			</div>

		</main>
	</div>
</body>
</html>