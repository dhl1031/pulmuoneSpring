<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="checkout-input-area" style="padding-bottom: 31px;">
	<div class="checkout-input-title-area">
		<h3 class="checkout-input-title">배송안내</h3>
	</div>
	
	<div class="checkout-input-box">
		<div class="form-input">
			<dl>
				<dt>
					<label for="input01"> 배송가맹점
						<button type="button" class="btn-question">
							<i class="ico ico-question"></i>
							<span class="hide">자세한 내용 보기</span>
							<div class="show-body" title="배송가맹점">
								<ul>
									<li>입력하신 배송장소 및 주소에 따른 예상 가맹점이며, 실제 배송가맹점과는 상이할 수
										있습니다.</li>
									<li>배송장소를 정확히 입력해 주셔야 신속하고 정확하게 배송이 이루어집니다.</li>
									<li>서울(서초구 우면동), 경기(안양시 만안구, 과천시) 지역은 당분간 가정집 배송이
										불가합니다.</li>
									<li>충북(옥천군, 영동군, 보은군)지역은 당분간 배송이 불가합니다.</li>
									<li>속한 시일 내 정상 배송할 수 있도록 하겠습니다. 고객님의 양해부탁드립니다.</li>
								</ul>
							</div>
						</button>
					</label>
				</dt>
				<dd>
					<input type="text" readonly="" name="prtnName" title="" placeholder="배송 장소 선택 및 주소 입력을 해주세요." value="">
					<input type="hidden" id="officeCode" name="estCd" value="">
					<input type="hidden" id="buTelno" name="officePhoneNumber" value="">
				</dd>
			</dl>
		</div>
		
		<div class="form-input">
			<dl>
				<dt>
					<label for="input02"> 첫 배송 예정일
						<button type="button" class="btn-question">
						<i class="ico ico-question"></i>
						<span class="hide">자세한 내용 보기</span>
						<div class="show-body" title="첫 배송일 안내">
							<ul>
								<li>풀무원녹즙은 주문 생산 방식으로, 첫 배송일은 영업일 기준, 낮 12시 이전 주문
									시 D+2로 선택 가능합니다. (ex. 월요일 낮 12시 이전 주문 시 수요일 첫배송 가능)</li>
								<li>실 배송 시작일은 가맹점 사정에 따라 변경될 수 있습니다.</li>
							</ul>
						</div>
						</button>
					</label>
				</dt>
				<dd class="input-util-area" style="position: relative">
					<input type="text" id="ip-datepicker-1" readonly="" name="deliveryDate" title="첫 배송 예정일" placeholder="첫 배송 예정일" value="2022. 08. 08">
					<button type="button" class="btn-cacalendar" style="pointer-events: none; position: absolute; right: 20px;">
						<i class="ico ico-calendar"></i>
						<span class="hide">날짜 선택하기</span>
					</button>
				</dd>
			</dl>
		</div>
		
	</div>
</div>