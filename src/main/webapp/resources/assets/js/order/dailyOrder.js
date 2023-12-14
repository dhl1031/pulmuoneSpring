const weekDays = ['월','화','수','목','금'];

function weekDayText () {
	$(".weekDays").each(function () {
		let count = $(this).data("count");
		let weekDay = weekDays[count];
		$(this).text(weekDay);
	});
};

// 영수증 계산
function calculateReceipt() {
	// 초기화
    var totalPrice = 0;
    var totalCount = 0;
    var count = 0;
    var totalPay = 0;
		    
    // 1주 예상 금액 계산
    $("#order_targets [data-itemcode][data-price]").each(function () {
    	count = 0;
		$(this).find("input[data-count]").each(function () {
        	count += parseInt($(this).val(), 10);
     	});
      	totalCount += count;
      	totalPrice += parseInt($(this).attr("data-price"), 10) * count;
    });
	
    // 4주 예상 금액 계산
    totalPay = totalPrice*4;
    
    // 적용
    $("[data-price-view=origin]").text(totalPay.toLocaleString());
    $("[data-price-view=sale]").text(totalPay.toLocaleString());
    $("[data-price-view=payment]").text(totalPay.toLocaleString());
    $("input[name=pay_price]").val(totalPay);
    
} // calculateReceipt


// 상품 + 버튼
function plusBtn(btn){
	let em = btn.next("em");
	let input = btn.parent().prev().prev();
	let cnt = parseInt(em.text())+1;
	em.text(cnt);
	input.val(cnt);
	calculateReceipt();
};

// 상품 - 버튼
function minusBtn(btn){
	let em = btn.prev("em")
	let input = btn.parent().prev().prev();
	let cnt = parseInt(em.text())-1;
	if (cnt == -1) return;
	em.text(cnt);
	input.val(cnt);
	calculateReceipt();
};


// 카드 인증 버튼
function validCard(){
	// 입력한 정보 가져오기
	let cardNumber = $("#cardNumber").val();
	let birthDay = $("#birthDay").val();
	let validYYMM = $("#validYYMM").val();
	
	if(!cardNumber || cardNumber.length < 16) {
		alert("카드 번호를 확인해주세요.");
		return;
	}
	if(!birthDay || birthDay.length < 6) {
		alert("생년월일을 확인해주세요.");
		return;
	}
	if(!validYYMM || validYYMM.length < 5) {
		alert("유효기간을 확인해주세요.");
		return;
	}
	
	alert("인증이 완료되었습니다.");
	$("#validCardBtn").text("다시인증");
};


function inputValidThru(period) {
	// replace 함수를 사용하여 슬래시( / )을 공백으로 치환한다.
    var replaceCard = period.value.replace(/\//g, "");

	// 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
    if(replaceCard.length >= 4 && replaceCard.length < 5) {

		var inputMonth = replaceCard.substring(0, 2);    // 선언한 변수 month에 월의 정보값을 담는다.
        var inputYear = replaceCard.substring(2, 4);       // 선언한 변수 year에 년의 정보값을 담는다.

        // 현재 날짜 값을 구한다.
		var nowDate = new Date();
        var nowMonth = autoLeftPad(nowDate.getMonth() + 1, 2);
        var nowYear = autoLeftPad(nowDate.getFullYear().toString().substr(2, 2), 2);

        // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
        if(isFinite(inputMonth + inputYear) == false) {
            alert("문자는 입력하실 수 없습니다.");
            period.value = "";
            return false;
        } // if

        // 입력한 월이 12월 보다 큰 경우
        if(inputMonth > 12) {
            alert("12월보다 큰 월수는 입력하실 수 없습니다. ");
            period.value = "";
            return false;
        } // if

        // 입력한 유효기간을 현재날짜와 비교하여 사용 가능 여부를 판단한다.
        if((inputYear + inputMonth) <= (nowYear + nowMonth)) {
            alert("유효기간이 만료된 카드는 사용하실 수 없습니다.");
            period.value = "";
            return false;
        } // if

        period.value = inputMonth + "/" + inputYear;
    } // if
} // inputValidThru

// 1자리 문자열의 경우 앞자리에 숫자 0을 자동으로 채워 00형태로 출력하기위한 함수
function autoLeftPad(num, digit) {
    if(String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join('0') + num;
    } // if
    return num;
} // autoLeftPad


// ARS 인증 버튼
function callCms(btn){
	
	// 값 가져오기
	let name = $("#input01").val();
	let bank = $("#bankCode").val();
	let account = $("#accountNumber").val();
	
	if(!bank || bank == "") {
		alert("은행을 선택해주세요.");
		return;
	}
	if(!account || account.length < 10 || account.length > 14) {
		alert("계좌번호를 확인해주세요.");
		return;
	}
	
	// 휴대폰 번호 가져오기
	let phone = btn.data("phone");
	let phone1 = phone.substr(0,3);
	let phone2 = phone.substr(9,12);
	
	// 알람창 띄우기
	let content = `<div class="p-cont">
                    		<p>회원정보에 등록된 아래 휴대폰 번호로 ARS 인증을 위한 전화를 드립니다. <br><br><span class="fc-pos-green">인증요청 해주세요.</span></p>
                    		<dl class="ars-auth-num">
                        		<dt>휴대폰번호</dt>
                        		<dd>${phone1}-****-${phone2}</dd>
                    		</dl>
                    		<ul class="dot-list ars-auth-list">
                        		<li>휴대폰 번호는 <a href="/mypage/personal/info" class="td-underline fc-gray">HOME &gt; MY녹즙 &gt; 개인정보
                            		&gt; 개인정보 관리</a> 에서 변경할 수 있습니다.</li>
                    		</ul>
                		</div>`;
	alert(content);
	
	$(".modal-footer").on("click", function(){
		setTimeout(()=> {
			$("#afterArs").css("display","block");
		}, 3000);
	})
};


// 상품추가하기 버튼
function addProduct(searchKeyword, pageNo){
	console.log("addProduct()... 키워드 : "+searchKeyword+", pageNo : "+pageNo);
	
	$("#addProductModal").addClass("loading");
	
	let root = $('.product-content-list');
	
	if(searchKeyword != null) {
		root.children().remove();
	}
	
	$.ajax({
		url:"/order/productList"
		, method: "GET"
		, data: { searchKeyword : searchKeyword, pageNo : pageNo }
		, dataType: "json"
		, cache: false
		, success: function(data, callback, xhr) {
				let tpl = null;
				$.each(data, function(i, prd){
					tpl = `<li class="product-add" style="cursor:pointer;" data-available="null" data-products-no="${prd.products_no}" data-price="${prd.price}" data-img-path="${prd.img_path}" data-system-name="${prd.system_name}" data-products-name="${prd.products_name}">`;
						tpl += `<div class="thumb"><img src="/${ prd.img_path }/${ prd.system_name }" alt=""></div>`;
							tpl += `<div class="contents">`;
								tpl += `<p class="name">${ prd.products_name }<span>(${prd.products_size})</span></p>`
								tpl += `<div class="info">`
								tpl += `<span class="price"><b>${ prd.price.toLocaleString() }</b> 원</span>`
							tpl += `</div>`
						tpl += `</div>`
					tpl += `</li>`;
					
					root.append(tpl);
				}); // each
				
				$("#addProductModal").modal('show');
				
				root.off("click", ".product-add");
				root.on("click", ".product-add", function (e) {
					e.stopPropagation();
					$("#addProductModal").modal('hide');
					appendPrd($(this));
				});
				
				root.next().off("click");
				let hasNext = data[0].total_count > $("#addProductModal").find('.product-add').length;
				if (hasNext) {
					root.next().show().click(function () {
						addProduct(searchKeyword, pageNo + 1);
					});
				} else {
					root.next().hide();
				} // if
				
			$("#addProductModal").removeClass("loading");
			
		} // success
		, error: function(xhr, errorType){
			console.log(errorType);
		} // error
	});
};

// 선택한 상품 추가
function appendPrd(prd){
	let products_no = prd.data("products-no");
	let price = prd.data("price");
	let img_path = prd.data("img-path");
	let system_name = prd.data("system-name");
	let products_name = prd.data("products-name");
	
	let tpl = null;
	tpl = '<li data-id="" data-itemcode="'+products_no+'" class="order-item order-chk active" data-price="'+price+'">'
			 + '<a href="/product/daily/view.do?tag=281" class="prd-cart">'
				+'<div class="thumb">'
					+ '<img src="/'+img_path+'/'+system_name+'" alt="">'
				+'</div>'
				+'<div class="prd-info">'
					+'<b class="prd-title">'+products_name+'</b>'
						+'<b class="now-price">'+price.toLocaleString()+'<span> 원</span>'
					+'</b>'
				+'</div>'
			+'</a>'
			+'<div class="prd-cart-select-daily">'
				+'<ul data-cart-idx="" data-itemcode="'+products_no+'">';
					for(let i = 0; i<5; i++) {
						tpl += '<li>'
									+'<input type="hidden" data-count="'+i+'" value="1">'
									+'<span class="weekDays" data-count="'+i+'">'+weekDays[i]+'</span>'
									+'<div class="prd-select-daily">'
										+'<button type="button" class="prod-add ea-control" data-index="0">'
											+'+<span class="hide">제품 추가</span>'
										+'</button>'
										+'<em data-itemcount-view="'+weekDays[i]+'">1</em>'
										+'<button type="button" class="prod-remove ea-control btn-minus" data-index="0">'
											+'<span class="hide">제품 빼기</span>'
										+'</button>'
									+'</div>'
								+'</li>'
					} // for
	tpl +='</ul></div></li>';
	
	let root = $("#order_targets");
	root.append(tpl);
	
	let count = parseInt($(".prd-count").text())+1;
	$(".prd-count").text(count);
	
	calculateReceipt();
};


// 위도, 경도값 찾기
function getAddressInfo(address, kakaoREST) {
	let addressInfo = new Object();
	let authorization = "KakaoAK " + kakaoREST;
	
	$.ajax({
		url: 'https://dapi.kakao.com/v2/local/search/address.json?query='+address
		, type:'GET'
		, async: false
		, headers: {'Authorization': authorization}
		, success: function(data){
			addressInfo = data.documents[0];
		}
		, error : function(e){
			console.log(e);
		}
	});
	
	return addressInfo;
}; // getAddressInfo


// 가맹점 찾기
function getFranchise(latitude, longitude, fc_type){
	console.log("getFranchise()... 위도 : "+latitude+", 경도 : "+longitude+", 가맹점 타입 : " + fc_type);
	
	$.ajax({
		url:"/order/franchise"
		, method: "GET"
		, data: { latitude : latitude, longitude : longitude, fc_type : fc_type }
		, cache: false
		, async: false
		, success: function(data, callback, xhr) {
			if(data == "") data = "배송이 불가한 지역입니다.";
			$('#prtnName').val(data);
		} // success
		, error: function(xhr, errorType){
			console.log(errorType);
		} // error
	});
};


