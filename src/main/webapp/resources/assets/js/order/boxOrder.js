function calculateBoxReceipt() {
	console.log("영수증 초기값 설정");
	// 영수증 초기값 설정
	let originPrice = 0;
	let salePrice = 0;
	
	let bpEm = $("em.before-price");
	let npB = $("b.now-price");

    // 모든 상품 가격 합산
    for (var i = 0; i < npB.length; i++) {
    	originPrice += parseInt(bpEm.children("em").text().replaceAll(",", ""));
    	salePrice += parseInt(npB.children("b").text().replaceAll(",", ""));
    } // for
	
	if (isNaN(originPrice)) originPrice = salePrice;
	
    let bpStr = originPrice.toLocaleString();
    let npStr = salePrice.toLocaleString();
            
    // 출력
    $("b[data-price-view=origin]").text(bpStr)
    $("b[data-price-view=sale]").text(npStr)
    $("b[data-price-view=payment]").text(npStr)
    $("#box_price").val(originPrice);
    $("#box_sale_price").val(salePrice);
    $("#box_discount_price").val(0);
    $("#box_shpping_fee").val(0);
	$("#box_final_price").val(salePrice);
	
	return salePrice;
}

// 쿠폰 선택 혹은 삭제 시 영수증 값 수정
function editReceipt(option, discountVal, salePrice) {
	// 영수증 객체 가져오기
	let viewCoupon = $("b[data-price-view=coupon]");
	let viewPay = $("b[data-price-view=payment]");
			
	// 현재 영수증 정보 불러오기
	let dispDiscount = parseInt(viewCoupon.text().replace(",", ""));	// 영수증에 찍힌 쿠폰 할인가
	let dispPayPrice = parseInt(viewPay.text().replace(",", ""));		// 영수증에 찍힌 결제 금액
	
	if (option == true) {	// 쿠폰 추가 시
		viewCoupon.addClass("minus");
		
		dispDiscount -= discountVal; 					// 쿠폰 할인가에 추가
		dispPayPrice = salePrice + dispDiscount;		// 결제 금액 계산
				
		// 쿠폰 할인가가 상품 가격을 넘는다면
		if (-salePrice > dispDiscount) {
			dispDiscount = -salePrice;
			dispPayPrice = 0;
		} // if
		
	} else {				// 쿠폰 삭제 시
		dispDiscount -= -discountVal;					// 쿠폰 할인가에서 제거
		dispPayPrice = salePrice + dispDiscount;		// 결제 금액 계산
				
		// 쿠폰 할인가가 0이하가 된다면
		if (dispDiscount >= 0)  {
			viewCoupon.removeClass("minus");
			dispDiscount = 0;
			dispPayPrice = salePrice;
		} // if
	} // if
	
	// 결과 반영
	viewCoupon.text(dispDiscount.toLocaleString());
    viewPay.text(dispPayPrice.toLocaleString());
    
    $("#box_discount_price").val(dispDiscount);
    $("#box_final_price").val(dispPayPrice);
    
} // editReceipt


function couponSelect (salePrice) {
	let coupon = $("#coupon-selector").find("option:selected");
	let index = coupon.val();
	
	// 1. "쿠폰을 선택하세요" 선택 시
	if (index == 0) return;

	
	// 2. 선택한 쿠폰 정보 가져오기
	let coupon_no = coupon.data("coupon-no");
	let coupon_name = coupon.data("coupon-name");
	let duplicate = coupon.data("duplicate");
	let max_discount = parseInt(coupon.data("max-discount")).toFixed(0);
	let discount = parseInt(coupon.data("discount")).toFixed(0);
	let discountStr = discount.toLocaleString();
	let is_won = discount > 100 ? true : false;
	let discount_val = is_won ? discount : salePrice*(discount/100);

	
	// 3. 선택한 쿠폰 -> li 추가
	let tpl = `<li data-coupon-inx="${index}" data-coupon-no="${coupon_no}" data-coupon-name="${coupon_name}" data-duplicate="${duplicate}" data-max-discount="${max_discount}" data-discount="${discount}" data-discount-val="${discount_val}">`
				+ `<input type="hidden" id="coupon_no" name="haveCouponList[${index-1}].coupon_no" value="${coupon_no}"/>`
				+ `<div>`
					+ `<em>${coupon_name}</em>`
					+ `<button type="button" class="coupon-remove btn-pop-close"><i class="ico-close ico"></i></button>`
				+ `</div>`

	if (is_won) {
		tpl += `<div class="now-price">${discountStr}<span>원</span></div>`
	} else {
		tpl += `<div class="now-price">${discountStr}<span>%</span></div>`
	}
	tpl += `</li>`;
	
	$("#apply-coupon-list").append(tpl);
	
	
	// 4. 선택한 쿠폰 -> 안 보이기
	let opt = $("#coupon-selector").find(`option[value="${index}"]`);
	opt.css("display","none");
	
	
	// 5. 쿠폰을 전부 다 선택했다면
	let opts = $("#coupon-selector").find("option");
	if (opts.filter(":visible").length == 0) {
		opts.first().text("사용 가능한 쿠폰이 없습니다.");
		opts.first().prop("selected", true);
	    $("#coupon-selector").prop("disabled", true);
	} // if
	
	// 영수증 정보 수정
	editReceipt(true, discount_val, salePrice);
}

// 쿠폰 삭제 시
function couponDelete(coupon, salePrice){
    
    // 1. 선택한 쿠폰 정보 가져오기
    let li = coupon.parent().parent();
    let index = li.data("coupon-inx");
    let discount_val = li.data("discount-val");
    
    // 2. li 태그 지우기
    li.remove();
         	
    // 3. 영수증 정보 수정
    editReceipt(false, discount_val, salePrice);
    
    // 4. option 태그 보이기
	$("#coupon-selector").prop("disabled", false);
    let opt = $("#coupon-selector").find(`option[value="${index}"]`);
    opt.css("display","block");
    $("#coupon-selector").find("option").first().text("쿠폰을 선택하세요.");
};

