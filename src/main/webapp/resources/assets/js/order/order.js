// 다음 주소 api
function searchPostcode () {
	$("#searchPostcode").on("click", function() {
		new daum.Postcode({
			oncomplete: function (data) {
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; 		 // 참고 항목 변수
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName
						: data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				$("#zipcode").val(data.zonecode);
				$("#addrRoad").val(data.roadAddress);
				$("#orderStreetAddress").val(data.jibunAddress);
			}
		}).open();
	});	
}


// 고객 정보와 동일 체크박스
function chkCheck(name, tel) {
	$("#chk-same").click(function() {
		$("#receiver").val("");
		$("#tel").val("");
		if ($(this).is(":checked")) {
			$("#receiver").val(name);
			$("#tel").val(tel);
		} // if
	});
}

// 주소록 가져오기
function showAddress(member_no, pageNo) {
	console.log("회원번호 : " + member_no + " getAddrBook...");
	
	$('#addressModal').addClass("loading");
	
	var root = $('#addressModal .modal-body > .address');
	
	$.ajax({
		url:"/order/addrBook"
		, method: "GET"
		, data: { member_no : member_no, pageNo: pageNo }
		, dataType: "json"
		, cache: false
		, success: function(data, callback, xhr) {
			if (data.length > 0) {
				let tpl = null;
				$.each(data, function(i, addr){
					tpl = '<div class="item" style="margin: 0; border-radius: 0">'
								+ '<div class="head">'
									+ '<div class="nickname-format xl">'
										+ '<label>기본</label>'
										+ '<h5>'+ addr.addr_name +'</h5>'
								  	+ '</div>'
							    	+ '<ul class="info" style="margin-top:15px; padding-left:1px;">'
							       		+ '<li>'
							        		+ '<p>'+addr.name+'</p>'
							        	+ '</li>'
							        	+ '<li>'
							          		+ '<p>'+addr.tel+'</p>'
							        	+ '</li>'
							        	+ '<li>'
							          		+ '<p>('+addr.zip_code+') '+addr.addr +" "+ addr.addr_detail+'</p>'
							          		+ '<p style="display: none">'+addr.addr+'</p>'
							          		+ '<p style="display: none">'+addr.addr_detail+'</p>'
							          		+ '<p style="display: none">'+addr.memo+'</p>'
							        	+ '</li>'
							      	+ '</ul>'
							    + '</div>'
							    + '<div class="tail">'
							    	+ '<button type="button" class="adapt-address rounded-button">선택</button>'
							    + '</div>'
							+ '</div>';
					
					let el = $(tpl).data("item", addr);
					
					if (addr.default_addr != '1') {
						el.find("label").remove();
					} // if
					
					root.append(el);
				}); // each
				
				$('#addressModal').modal('show');
				
				root.find(".adapt-address").on("click", function () {
					$('#addressModal').modal('hide');
					let pTags = $(this).parent().parent().find("p");
					$("#receiver").val(pTags.eq(0).text());      // 수령인
					$("#tel").val(pTags.eq(1).text());            // 전화번호
					$("#zipcode").val(pTags.eq(2).text().substr(1, 5));   // 우편번호
					$("#addrRoad").val(pTags.eq(3).text());
					$("#addrDetail").val(pTags.eq(4).text());
					$("#memo").val(pTags.eq(5).text());
				});
				
				let hasNext = data[0].total_count > $('#addressModal').find('.item').length;
				if (hasNext) {
					root.next().show().click(function () {
						showAddress(member_no, pageNo + 1);
					});
				} else {
					root.next().hide();
				} // if
				
				$('#addressModal').removeClass("loading");
				
			} else if (pageNo == 0) {
				alert('등록된 주소록이 없습니다.');
				$b('#addressModal').modal("hide");
			} // if
			
		} // success
		, error: function(xhr, errorType){
			console.log(errorType);
		} // error
	});
	
}


// 



// 주문하기
function goStep2(orderType){
	if ($("#receiver").val() == "") {
		$('#alertModal').find(".modal-body").text("받는사람항목이 비어있습니다.");
		showModal();
		return;
	}
	if ($("#tel").val() == "") {
		$('#alertModal').find(".modal-body").text("휴대폰번호항목이 비어있습니다.");
		showModal();
		return;
	}
	if ($("#zipcode").val() == "") {
		$('#alertModal').find(".modal-body").text("우편번호항목이 비어있습니다.");
		showModal();
		return;
	}
	if (!$("#agree-11").is(':checked')) {
		$('#alertModal').find(".modal-body").text("구매조건 확인 및 결제진행에 동의 해주세요.");
		showModal();
		return;
	}
	
	let url = "/"+orderType+"/order/step2";
	$("#orderForm").attr({
		method:"post"
		, action:url
	}).submit();
};

function showModal() {
	$('#alertModal').modal('show');
	$('body').addClass("modal-open");
	$('#alertModal').addClass("show");
} // showModal()
